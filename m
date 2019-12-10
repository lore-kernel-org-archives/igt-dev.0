Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 10 Dec 2019 17:22:43 +0100
Message-Id: <20191210162243.14966-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] lib/sysfs: Add support for getting
 boolean module parameters
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Boolean module parameters are exposed as "Y"/"N" strings, not 0/1.
Make igt_sysfs_get_boolean() helper useful for getting their values.

v2: Use case insensitive string compare and more compact style (Chris)

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
---
I've made it still more compact by eliminating a goto, Chris, I hope
your Reviewed-by: still applies.

Thanks,
Janusz

 lib/igt_sysfs.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index c439944d..17d0ab80 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -474,11 +474,19 @@ bool igt_sysfs_set_u32(int dir, const char *attr, uint32_t value)
  */
 bool igt_sysfs_get_boolean(int dir, const char *attr)
 {
+	char *buf;
 	int result;
 
-	if (igt_sysfs_scanf(dir, attr, "%d", &result) != 1)
+	buf = igt_sysfs_get(dir, attr);
+	if (!buf)
 		return false;
 
+	if (sscanf(buf, "%d", &result) != 1) {
+		/* kernel's param_get_bool() returns "Y"/"N" */
+		result = !strcasecmp(buf, "Y");
+	}
+
+	free(buf);
 	return result;
 }
 
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
