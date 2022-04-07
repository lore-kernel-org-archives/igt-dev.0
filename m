Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2055.outbound.protection.outlook.com [40.107.102.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5359510EBF1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 17:42:38 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 7 Apr 2022 11:42:15 -0600
Message-ID: <20220407174215.171440-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t][V2] tests/kms: Skip kms test cases for DCC
 and DCC_RETILE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: markyacoub@google.com, bas@basnieuwenhuizen.nl
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Skip the KMS test cases for planes that has modifiers with
DCC and DCC_RETILE on AMDGPU.

Current pixel-format and pixel-format-source-clamping subtests do not
support modifers with DCC or DCC_RETILE in kernel.

1. dcc_formats's cpp[1] is set to 0 and this triggers kernel errors
"Format requires non-linear modifier for plane 1" because block_size
(i.e. cpp[1]) == 0. See kernel commits 816853f9dc40 and 8db2dc852941.

2. the subtests cause kernel's amdgpu_display_verify_sizes to fail
because they do not provide an extra plane with compression metadata.
See kernel commit 234055fd9728 for details.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---

v2: update comments in commit messages

 tests/kms_plane.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 137f23a8..1a71822a 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1004,6 +1004,14 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 {
 	int index = plane->index;
 
+	for (int i = 0; i < plane->format_mod_count; i++) {
+		if (AMD_FMT_MOD_GET(DCC, plane->modifiers[i]) ||
+		    AMD_FMT_MOD_GET(DCC_RETILE, plane->modifiers[i])) {
+			igt_debug("Skipping planes with DCC or DCC_RETILE\n");
+			return true;
+		}
+	}
+
 	if (data->extended)
 		return false;
 
-- 
2.35.1
