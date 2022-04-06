Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE7C10E0A8
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 17:07:30 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 6 Apr 2022 11:06:59 -0600
Message-ID: <20220406170659.898333-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/kms: Skip kms test cases for DCC and
 DCC_RETILE
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
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
