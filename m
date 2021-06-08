Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CB46EA57
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jun 2021 00:32:20 +0000 (UTC)
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
Date: Mon,  7 Jun 2021 17:32:17 -0700
Message-Id: <20210608003217.83582-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: Skip if not
 able to create display_hdcp_srm.bin
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
Cc: shawn.c.lee@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Chrome devices, SRM subtest fails to create display_hdcp_srm.bin file because
Chrome OS rootfs is mounted read-only by default
(https://chromium.googlesource.com/chromiumos/docs/+/HEAD/developer_mode.md#disable-verity).
The error below is observed in Chrome:

    (kms_content_protection:9022) DEBUG: Test requirement passed: data.display.is_atomic
    (kms_content_protection:9022) CRITICAL: Test assertion failure function __real_main720, file ../igt-gpu-tools-1.25/tests/kms_content_protection.c:807:
    (kms_content_protection:9022) CRITICAL: Failed assertion: ret
    (kms_content_protection:9022) CRITICAL: Last errno: 9, Bad file descriptor
    (kms_content_protection:9022) CRITICAL: SRM update failedStack trace:

This patch fixes that by checking if the file descriptor returned from the
open call is valid and skip if it is not.

Cc: Mark Yacoub <markyacoub@chromium.org>
Reported-by: Shawn Lee <shawn.c.lee@intel.com>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 tests/kms_content_protection.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 1d1a439a98fb..3cd279fe5704 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -296,6 +296,8 @@ static bool write_srm_as_fw(const __u8 *srm, int len)
 
 	fd = open("/lib/firmware/display_hdcp_srm.bin",
 		  O_WRONLY | O_CREAT, S_IRWXU);
+	igt_require(fd >= 0);
+
 	do {
 		ret = write(fd, srm + total, len - total);
 		if (ret < 0)
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
