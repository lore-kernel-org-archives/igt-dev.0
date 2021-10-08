Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFDB6E077
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 15:29:06 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  8 Oct 2021 18:28:56 +0300
Message-Id: <20211008152856.25412-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20211008152856.25412-1-ville.syrjala@linux.intel.com>
References: <20211008152856.25412-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/i915/i915_pm_dc: Nuke pointless
 snprintf()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Printing a single thing with snprintf() and then passing
that via %s to another printf() is pointless. Just pass
the original string in directly.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/i915_pm_dc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index d779e28026a9..3a7ce5bfa154 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -214,14 +214,20 @@ static bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count)
 			prev_dc_count, 3000, 100);
 }
 
+static const char *dc_state_name(int dc_flag)
+{
+	if (dc_flag & CHECK_DC3CO)
+		return "DC3CO";
+	else if (dc_flag & CHECK_DC5)
+		return "DC5";
+	else
+		return "DC6";
+}
+
 static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
 {
-	char tmp[64];
-
-	snprintf(tmp, sizeof(tmp), "%s", dc_flag & CHECK_DC3CO ? "DC3CO" :
-		(dc_flag & CHECK_DC5 ? "DC5" : "DC6"));
 	igt_assert_f(dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
-		     "%s state is not achieved\n%s:\n%s\n", tmp, PWR_DOMAIN_INFO,
+		     "%s state is not achieved\n%s:\n%s\n", dc_state_name(dc_flag), PWR_DOMAIN_INFO,
 		     data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
 }
 
-- 
2.32.0
