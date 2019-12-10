Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 10 Dec 2019 15:25:31 +0100
Message-Id: <20191210142531.6447-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH i-g-t] lib/sysfs: Add support for getting
 boolean module parameters
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
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Czapli=C5=84ski?= <michal.czaplinski@intel.com>, Jari Tahvanainen <jari.tahvanainen@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Boolean module parameters are exposed as "Y"/"N" strings, not 0/1.
Make igt_sysfs_get_boolean() helper useful for getting their values.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/igt_sysfs.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index c439944d..c2b8291d 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -474,11 +474,23 @@ bool igt_sysfs_set_u32(int dir, const char *attr, uint32_t value)
  */
 bool igt_sysfs_get_boolean(int dir, const char *attr)
 {
+	char *buf;
 	int result;
 
-	if (igt_sysfs_scanf(dir, attr, "%d", &result) != 1)
+	buf = igt_sysfs_get(dir, attr);
+	if (!buf)
 		return false;
 
+	if (sscanf(buf, "%d", &result) == 1)
+		goto out;
+
+	/* kernel's param_get_bool() returns "Y"/"N" */
+	if (!strcmp(buf, "Y"))
+		result = true;
+	else
+		result = false;
+out:
+	free(buf);
 	return result;
 }
 
-- 
2.21.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
