Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE3B6E1A2
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Feb 2021 09:26:11 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue, 23 Feb 2021 15:04:52 +0530
Message-Id: <20210223093452.4013-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc@exhaust-fences:added
 check for HW detiler
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

HW detiler not supported on platforms w/o aperture. We should
SKIP this test instead of getting invalid argument.

Added feature test macro to query the kernel for the
global gpu aperture size. Aperture size should be
greater than zero to support HW detiler, if not skip
the test.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_rotation_crc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 6d143ec8..cd632b60 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -789,6 +789,7 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
 	int i;
 
 	igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
+	igt_require(gem_available_fences(display->drm_fd) > 0);
 
 	prepare_crtc(data, output, pipe, plane, false);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
