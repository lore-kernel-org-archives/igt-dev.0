Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C826E2FF
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2020 10:18:36 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date: Mon,  8 Jun 2020 15:43:34 +0530
Message-Id: <20200608101334.19684-3-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200608101334.19684-1-ankit.k.nautiyal@intel.com>
References: <20200608101334.19684-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] [Patch][i-g-t v2 2/2] tests/kms_content_protection:
 Remove pre-existing SRM table before the test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, petri.latvala@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This is to check the case with missing SRM, which should be treated as
device with no revoked keys.

Kernel patch fixing such a bug :
https://patchwork.freedesktop.org/patch/361346/?series=75939&rev=2

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
---
 tests/kms_content_protection.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 1c34069e..872f686f 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -75,6 +75,8 @@ __u8 facsimile_srm[] = {
 	0x83, 0xAA, 0xC2, 0x5B, 0x24, 0xB3, 0x36, 0x84, 0x94, 0x75, 0x34, 0xDB,
 	0x10, 0x9E, 0x3B, 0x23, 0x13, 0xD8, 0x7A, 0xC2, 0x30, 0x79, 0x84};
 
+const char *srm_fw = "/lib/firmware/display_hdcp_srm.bin";
+
 static void flip_handler(int fd, unsigned int sequence, unsigned int tv_sec,
 			 unsigned int tv_usec, void *_data)
 {
@@ -438,8 +440,7 @@ static bool write_srm_as_fw(const __u8 *srm, int len)
 {
 	int fd, ret, total = 0;
 
-	fd = open("/lib/firmware/display_hdcp_srm.bin",
-		  O_WRONLY | O_CREAT, S_IRWXU);
+	fd = open(srm_fw, O_WRONLY | O_CREAT, S_IRWXU);
 	do {
 		ret = write(fd, srm + total, len - total);
 		if (ret < 0)
@@ -779,6 +780,11 @@ igt_main
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		igt_display_require(&data.display, data.drm_fd);
+
+		/* Remove pre-existing srm table */
+		if (access(srm_fw, F_OK) == 0)
+			igt_assert_f(!remove(srm_fw),
+				     "Failed to delete previous srm table\n");
 	}
 
 	for (i = 0; i < ARRAY_SIZE(hdcp_protocol); i++) {
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
