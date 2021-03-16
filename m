Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Tue, 16 Mar 2021 16:18:39 +0000
Message-Id: <20210316161840.1993818-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210316161840.1993818-1-tvrtko.ursulin@linux.intel.com>
References: <20210316161840.1993818-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 1/2] lib: Add helper for reading modparam
 values
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Add __igt_params_get for simple reading of modparams.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_params.c | 26 ++++++++++++++++++++++++++
 lib/igt_params.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index c06416988baa..1dc6de77b2e0 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -156,6 +156,32 @@ int igt_params_open(int device)
 	return params;
 }
 
+/**
+ * __igt_params_get:
+ * @device: fd of the device
+ * @parameter: the name of the parameter to set
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
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
