Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511D289FD3
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 02:09:38 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue,  6 Apr 2021 07:49:25 +0530
Message-Id: <20210406021925.28234-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_available_modes_crc : Added test
 description
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added test description.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_available_modes_crc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_crc.c
index 17e0f237..a1dd1289 100644
--- a/tests/kms_available_modes_crc.c
+++ b/tests/kms_available_modes_crc.c
@@ -448,6 +448,7 @@ igt_main
 
 	data.commit = data.display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY;
 
+	igt_describe("CRC test for all different plane modes which kernel advertises.");
 	igt_subtest("available_mode_test_crc") {
 		gem_require_mappable_ggtt(data.gfx_fd);
 		test_available_modes(&data);
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
