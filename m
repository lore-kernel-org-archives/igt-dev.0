Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F7A10E928
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Sep 2022 14:07:49 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Sep 2022 19:37:21 +0530
Message-Id: <20220914140721.3500129-8-riana.tauro@intel.com>
In-Reply-To: <20220914140721.3500129-1-riana.tauro@intel.com>
References: <20220914140721.3500129-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 7/7] lib/igt_power: clean-up igt_power
 library
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

Remove unused rapl functions from igt_power.
No functional changes

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_power.c | 13 ++++++++++-
 lib/igt_power.h | 58 -------------------------------------------------
 2 files changed, 12 insertions(+), 59 deletions(-)

diff --git a/lib/igt_power.c b/lib/igt_power.c
index 3f3633eb..3b34be40 100644
--- a/lib/igt_power.c
+++ b/lib/igt_power.c
@@ -53,7 +53,7 @@ static int rapl_parse(struct rapl *r, const char *str)
 	return 0;
 }
 
-int rapl_open(struct rapl *r, const char *domain)
+static int rapl_open(struct rapl *r, const char *domain)
 {
 	r->fd = rapl_parse(r, domain);
 	if (r->fd < 0)
@@ -72,6 +72,17 @@ err:
 	return r->fd;
 }
 
+static inline bool rapl_read(struct rapl *r, struct power_sample *s)
+{
+	return read(r->fd, s, sizeof(*s)) == sizeof(*s);
+}
+
+static inline void rapl_close(struct rapl *r)
+{
+	close(r->fd);
+	r->fd = -1;
+}
+
 /**
  * igt_power_open:
  * @fd : device fd
diff --git a/lib/igt_power.h b/lib/igt_power.h
index 0984c2df..68a05300 100644
--- a/lib/igt_power.h
+++ b/lib/igt_power.h
@@ -44,72 +44,14 @@ struct igt_power {
 	int hwmon_fd;
 };
 
-int rapl_open(struct rapl *r, const char *domain);
 int igt_power_open(int i915, struct igt_power *p, const char *domain);
 void igt_power_close(struct igt_power *p);
 
-static inline int cpu_power_open(struct rapl *r)
-{
-	return rapl_open(r, "cpu");
-}
-
-static inline int gpu_power_open(struct rapl *r)
-{
-	return rapl_open(r, "gpu");
-}
-
-static inline int pkg_power_open(struct rapl *r)
-{
-	return rapl_open(r, "pkg");
-}
-
-static inline bool rapl_valid(struct rapl *r)
-{
-	return r->fd >= 0;
-}
-
-static inline int ram_power_open(struct rapl *r)
-{
-	return rapl_open(r, "ram");
-}
-
-static inline bool rapl_read(struct rapl *r, struct power_sample *s)
-{
-	return read(r->fd, s, sizeof(*s)) == sizeof(*s);
-}
-
-static inline void rapl_close(struct rapl *r)
-{
-	close(r->fd);
-	r->fd = -1;
-}
-
 static inline bool igt_power_valid(struct igt_power *p)
 {
 	return (p->rapl.fd >= 0) || (p->hwmon_fd >= 0);
 }
 
-static inline double power_J(const struct rapl *r,
-			     const struct power_sample *p0,
-			     const struct power_sample *p1)
-{
-	return (p1->energy - p0->energy) * r->scale;
-}
-
-static inline double power_s(const struct rapl *r,
-			     const struct power_sample *p0,
-			     const struct power_sample *p1)
-{
-	return (p1->time - p0->time) * 1e-9;
-}
-
-static inline double power_W(const struct rapl *r,
-			     const struct power_sample *p0,
-			     const struct power_sample *p1)
-{
-	return power_J(r, p0, p1) / power_s(r, p0, p1);
-}
-
 void igt_power_get_energy(struct igt_power *p, struct power_sample *s);
 
 double igt_power_get_mJ(const struct igt_power *power,
-- 
2.25.1
