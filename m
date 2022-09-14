Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDC010E927
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Sep 2022 14:07:45 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Sep 2022 19:37:17 +0530
Message-Id: <20220914140721.3500129-4-riana.tauro@intel.com>
In-Reply-To: <20220914140721.3500129-1-riana.tauro@intel.com>
References: <20220914140721.3500129-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/7] lib/igt_power: Add hwmon interface
 to igt_power
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Modify igt_power to expose functions to read energy, power
using hwmon and rapl interface

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_power.c | 131 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_power.h |  22 ++++++++
 2 files changed, 153 insertions(+)

diff --git a/lib/igt_power.c b/lib/igt_power.c
index 814ad556..3f3633eb 100644
--- a/lib/igt_power.c
+++ b/lib/igt_power.c
@@ -6,10 +6,14 @@
 #include <unistd.h>
 #include <inttypes.h>
 
+#include "igt.h"
+#include "igt_hwmon.h"
 #include "igt_perf.h"
 #include "igt_power.h"
 #include "igt_sysfs.h"
 
+static const char *rapl_domains[] = { "cpu", "gpu", "pkg", "ram" };
+
 static int rapl_parse(struct rapl *r, const char *str)
 {
 	locale_t locale, oldlocale;
@@ -67,3 +71,130 @@ err:
 	errno = 0;
 	return r->fd;
 }
+
+/**
+ * igt_power_open:
+ * @fd : device fd
+ * @igt_power : power struct
+ * @domain: rapl domain
+ *
+ * opens the hwmon/rapl fd based on domain
+ * hwmon fd - domain gpu -dgfx
+ * rapl fd - all domains - igfx
+ *
+ * Returns
+ * 0 on success, errno otherwise
+ */
+int igt_power_open(int fd, struct igt_power *p, const char *domain)
+{
+	int i;
+
+	p->hwmon_fd = -1;
+	p->rapl.fd = -1;
+
+	if (gem_has_lmem(fd)) {
+		if (strncmp(domain, "gpu", strlen("gpu")) == 0) {
+			p->hwmon_fd = igt_hwmon_open(fd);
+			if (p->hwmon_fd >= 0)
+				return 0;
+		}
+	} else {
+		for (i = 0; i < ARRAY_SIZE(rapl_domains); i++)
+			if (strncmp(domain, rapl_domains[i], strlen(rapl_domains[i])) == 0)
+				return rapl_open(&p->rapl, domain);
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * igt_power_get_energy:
+ * @igt_power : power struct
+ * @power_sample: sample of energy and time
+ *
+ * Reads energy from hwmon if energy1_input file is present, else read
+ * from rapl interface
+ *
+ */
+void igt_power_get_energy(struct igt_power *power, struct power_sample *s)
+{
+	struct timespec ts;
+
+	s->energy = 0;
+	igt_assert(!clock_gettime(CLOCK_MONOTONIC, &ts));
+	s->time =  ts.tv_sec * NSEC_PER_SEC + ts.tv_nsec;
+
+	if (power->hwmon_fd >= 0) {
+		if (igt_sysfs_has_attr(power->hwmon_fd, "energy1_input"))
+			s->energy = igt_sysfs_get_u64(power->hwmon_fd, "energy1_input");
+	} else if (power->rapl.fd >= 0) {
+		rapl_read(&power->rapl, s);
+	}
+}
+
+/**
+ * igt_power_get_mJ:
+ * @igt_power : power struct
+ * @power_sample: sample of energy and time
+ *
+ * Calculates energy difference between two power samples
+ *
+ * Returns
+ * energy in mJ from hwmon/rapl
+ */
+double igt_power_get_mJ(const struct igt_power *power,
+			const struct power_sample *p0, const struct power_sample *p1)
+{
+	if (power->hwmon_fd >= 0)
+		return (p1->energy - p0->energy) * 1e-3;
+	else if (power->rapl.fd >= 0)
+		return ((p1->energy - p0->energy) *  power->rapl.scale) * 1e3;
+
+	return 0;
+}
+
+/**
+ * igt_power_get_mW:
+ * @igt_power : power struct
+ * @power_sample: sample of energy and time
+ *
+ * Calculates power
+ *
+ * Returns
+ * power in milliWatts
+ */
+double igt_power_get_mW(const struct igt_power *power,
+			const struct power_sample *p0, const struct power_sample *p1)
+{
+	return igt_power_get_mJ(power, p0, p1) / igt_power_get_s(p0, p1);
+}
+
+/**
+ * igt_power_get_s:
+ * @power_sample: sample of energy and time
+ *
+ * Returns
+ * time differnce in seconds
+ */
+double igt_power_get_s(const struct power_sample *p0,
+		       const struct power_sample *p1)
+{
+	return (p1->time - p0->time) * 1e-9;
+}
+
+/**
+ * igt_power_close:
+ * @igt_power : power struct
+ *
+ * closes hwmon/rapl fd
+ *
+ */
+void igt_power_close(struct igt_power *power)
+{
+	if (power->hwmon_fd >= 0) {
+		close(power->hwmon_fd);
+		power->hwmon_fd = -1;
+	} else if (power->rapl.fd >= 0) {
+		rapl_close(&power->rapl);
+	}
+}
diff --git a/lib/igt_power.h b/lib/igt_power.h
index 11ddcdee..0984c2df 100644
--- a/lib/igt_power.h
+++ b/lib/igt_power.h
@@ -39,7 +39,14 @@ struct power_sample {
 	uint64_t time;
 };
 
+struct igt_power {
+	struct rapl rapl;
+	int hwmon_fd;
+};
+
 int rapl_open(struct rapl *r, const char *domain);
+int igt_power_open(int i915, struct igt_power *p, const char *domain);
+void igt_power_close(struct igt_power *p);
 
 static inline int cpu_power_open(struct rapl *r)
 {
@@ -77,6 +84,11 @@ static inline void rapl_close(struct rapl *r)
 	r->fd = -1;
 }
 
+static inline bool igt_power_valid(struct igt_power *p)
+{
+	return (p->rapl.fd >= 0) || (p->hwmon_fd >= 0);
+}
+
 static inline double power_J(const struct rapl *r,
 			     const struct power_sample *p0,
 			     const struct power_sample *p1)
@@ -98,4 +110,14 @@ static inline double power_W(const struct rapl *r,
 	return power_J(r, p0, p1) / power_s(r, p0, p1);
 }
 
+void igt_power_get_energy(struct igt_power *p, struct power_sample *s);
+
+double igt_power_get_mJ(const struct igt_power *power,
+			const struct power_sample *p0,
+			const struct power_sample *p1);
+double igt_power_get_mW(const struct igt_power *power,
+			const struct power_sample *p0,
+			const struct power_sample *p1);
+double igt_power_get_s(const struct power_sample *p0,
+		       const struct power_sample *p1);
 #endif /* IGT_POWER_H */
-- 
2.25.1
