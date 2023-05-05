Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D6910E1EA
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 00:07:13 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  4 May 2023 17:05:56 -0700
Message-Id: <20230505000555.1916763-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_hdr: Update dmesg error message
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Error message changed in the kernel in commit
e5eef23e267c ("drm/display: Don't block HDR_OUTPUT_METADATA on
unknown EOTF"). We should probably have a better way to get this
error, but this should bring it back to a pass.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Still to be tested.... didn't have a machine available to reproduce it

 tests/kms_hdr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 23f12c14a..cbc0f3a55 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -418,7 +418,7 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	if (flags & TEST_INVALID_HDR) {
-		igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"EOTF Not Supported\""), 0);
+		igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown EOTF [0-9]+\""), 0);
 		goto cleanup;
 	}
 	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
-- 
2.40.1
