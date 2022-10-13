Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D1510E27D
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 15:14:06 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Oct 2022 08:13:59 -0700
Message-Id: <20221013151400.2086268-8-ashutosh.dixit@intel.com>
In-Reply-To: <20221013151400.2086268-1-ashutosh.dixit@intel.com>
References: <20221013151400.2086268-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/8] lib/igt_power: clean-up igt_power
 library
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

From: Riana Tauro <riana.tauro@intel.com>

Remove unused rapl functions from igt_power.
No functional changes

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_power.c | 13 ++++++++++-
 lib/igt_power.h | 58 -------------------------------------------------
 2 files changed, 12 insertions(+), 59 deletions(-)

diff --git a/lib/igt_power.c b/lib/igt_power.c
index 3f3633eb96..3b34be4064 100644
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
index 0984c2df6b..68a05300ee 100644
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
2.38.0
