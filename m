Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed, 31 Mar 2021 12:02:06 +0100
Message-Id: <20210331110208.2582575-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] lib: Add helper for reading modparam
 values
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Add __igt_params_get for simple reading of modparams.

v2:
 * Fix kerneldoc. (Matt)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 lib/igt_params.c | 26 ++++++++++++++++++++++++++
 lib/igt_params.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index c06416988baa..3dad317a56b2 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -156,6 +156,32 @@ int igt_params_open(int device)
 	return params;
 }
 
+/**
+ * __igt_params_get:
+ * @device: fd of the device
+ * @parameter: the name of the parameter to get
+ *
+ * This reads the value of the modparam.
+ *
+ * Returns:
+ * A nul-terminated string, must be freed by caller after use, or NULL
+ * on failure.
+ */
+char *__igt_params_get(int device, const char *parameter)
+{
+	char *str;
+	int dir;
+
+	dir = igt_params_open(device);
+	if (dir < 0)
+		return NULL;
+
+	str = igt_sysfs_get(dir, parameter);
+	close(dir);
+
+	return str;
+}
+
 __attribute__((format(printf, 3, 0)))
 static bool __igt_params_set(int device, const char *parameter,
 			     const char *fmt, va_list ap, bool save)
diff --git a/lib/igt_params.h b/lib/igt_params.h
index bbd6f3ee6582..6494786f0696 100644
--- a/lib/igt_params.h
+++ b/lib/igt_params.h
@@ -28,6 +28,8 @@
 
 int igt_params_open(int device);
 
+char *__igt_params_get(int device, const char *parameter);
+
 __attribute__((format(printf, 3, 4)))
 bool igt_params_set(int device, const char *parameter, const char *fmt, ...);
 
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
