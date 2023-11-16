Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB8710E5DA
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 13:25:07 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Nov 2023 15:24:51 +0200
Message-ID: <20231116132452.2671-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20231116132452.2671-1-ville.syrjala@linux.intel.com>
References: <20231116132452.2671-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] lib/igt_power: Add power_supply/BAT
 based measurement
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Allow measuring total system power via the power_supply class
stuff in sysfs (typically the information there comes from ACPI).

There are two types of batteries:
- reports remaining capacity in uWh (energy_now)
- reports remaining capacity in uAh (charge_now)

The first type is easier since we just have to convert to
uJ. The second type is less convenient since we also need
the voltage to determine energy. For that we just multiply
with voltage_now (in uV) when sampling charge_now. Obviously
this isn't entirely correct (should integrate instead), but
I think it's close enough to be useful.

Also one should keep in mind that the battery reports remaining
energy, not consumed energy. So we have to flip stuff around when
calculating things. Another alternative would be flip already
when measuring (eg. {charge,energy}_full_design - {charge,energy}_now),
but that seems more of a hassle really.

TODO: maybe confirm that the AC adapter is unplugged and the
battery is actually reporting to discharge before we start?

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_power.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_power.h |  5 ++++-
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/lib/igt_power.c b/lib/igt_power.c
index 810859b134dc..2cac747501c8 100644
--- a/lib/igt_power.c
+++ b/lib/igt_power.c
@@ -85,6 +85,21 @@ static inline void rapl_close(struct rapl *r)
 	r->fd = -1;
 }
 
+static uint64_t bat_get_energy(int fd)
+{
+	if (igt_sysfs_has_attr(fd, "energy_now")) {
+		/* uWh -> uJ */
+		return 60 * 60 *
+			igt_sysfs_get_u64(fd, "energy_now");
+	} else {
+		/* uAh * uV -> uJ */
+		return 60 * 60 *
+			igt_sysfs_get_u64(fd, "charge_now") *
+			igt_sysfs_get_u64(fd, "voltage_now") /
+			1000000;
+	}
+}
+
 /**
  * igt_power_open:
  * @fd : device fd
@@ -104,6 +119,7 @@ int igt_power_open(int fd, struct igt_power *p, const char *domain)
 	bool is_dgfx;
 
 	p->hwmon_fd = -1;
+	p->bat_fd = -1;
 	p->rapl.fd = -1;
 
 	is_dgfx = is_xe_device(fd) ? xe_has_vram(fd) : gem_has_lmem(fd);
@@ -142,6 +158,8 @@ void igt_power_get_energy(struct igt_power *power, struct power_sample *s)
 	if (power->hwmon_fd >= 0) {
 		if (igt_sysfs_has_attr(power->hwmon_fd, "energy1_input"))
 			s->energy = igt_sysfs_get_u64(power->hwmon_fd, "energy1_input");
+	} else if (power->bat_fd >= 0) {
+		s->energy = bat_get_energy(power->bat_fd);
 	} else if (power->rapl.fd >= 0) {
 		rapl_read(&power->rapl, s);
 	}
@@ -162,6 +180,8 @@ double igt_power_get_mJ(const struct igt_power *power,
 {
 	if (power->hwmon_fd >= 0)
 		return (p1->energy - p0->energy) * 1e-3;
+	else if (power->bat_fd >= 0)
+		return (p0->energy - p1->energy) * 1e-3; /* battery measures remaining energy */
 	else if (power->rapl.fd >= 0)
 		return ((p1->energy - p0->energy) *  power->rapl.scale) * 1e3;
 
@@ -209,7 +229,47 @@ void igt_power_close(struct igt_power *power)
 	if (power->hwmon_fd >= 0) {
 		close(power->hwmon_fd);
 		power->hwmon_fd = -1;
+	} else if (power->bat_fd >= 0) {
+		close(power->bat_fd);
+		power->bat_fd = -1;
 	} else if (power->rapl.fd >= 0) {
 		rapl_close(&power->rapl);
 	}
 }
+
+/**
+ * igt_power_bat_open:
+ * @igt_power : power struct
+ * @index: battery index
+ *
+ * opens the power_supply fd based on battery index
+ *
+ * Returns
+ * 0 on success, errno otherwise
+ */
+int igt_power_bat_open(struct igt_power *p, int index)
+{
+	char path[64];
+	int fd;
+
+	p->hwmon_fd = -1;
+	p->bat_fd = -1;
+	p->rapl.fd = -1;
+
+	snprintf(path, sizeof(path), "/sys/class/power_supply/BAT%d", index);
+
+	fd = open(path, O_RDONLY | O_DIRECTORY);
+	if (fd < 0)
+		return fd;
+
+	if (!igt_sysfs_has_attr(fd, "energy_now") &&
+	    !(igt_sysfs_has_attr(fd, "charge_now") &&
+	      igt_sysfs_has_attr(fd, "voltage_now"))) {
+		close(fd);
+		return -1;
+	}
+
+	p->bat_fd = fd;
+
+	return 0;
+}
diff --git a/lib/igt_power.h b/lib/igt_power.h
index 68a05300eec2..853b0fae815a 100644
--- a/lib/igt_power.h
+++ b/lib/igt_power.h
@@ -42,14 +42,17 @@ struct power_sample {
 struct igt_power {
 	struct rapl rapl;
 	int hwmon_fd;
+	int bat_fd;
 };
 
 int igt_power_open(int i915, struct igt_power *p, const char *domain);
 void igt_power_close(struct igt_power *p);
 
+int igt_power_bat_open(struct igt_power *p, int index);
+
 static inline bool igt_power_valid(struct igt_power *p)
 {
-	return (p->rapl.fd >= 0) || (p->hwmon_fd >= 0);
+	return p->rapl.fd >= 0 || p->hwmon_fd >= 0 || p->bat_fd >= 0;
 }
 
 void igt_power_get_energy(struct igt_power *p, struct power_sample *s);
-- 
2.41.0
