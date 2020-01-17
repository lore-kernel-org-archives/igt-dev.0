Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FAF6F4B6
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2020 09:21:46 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Fri, 17 Jan 2020 11:17:49 +0200
Message-Id: <20200117091749.1606-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_lowres: Test only with one
 plane
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
List-ID: <igt-dev@lists.freedesktop.org>

The test is intended to test resolution changes from higher to
lower and back. We can test this with only one plane and we don't
need to run through all planes. This will save significant amount
of test execution time.

Fix for
Bugzilla: https://gitlab.freedesktop.org/drm/intel/issues/899

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_plane_lowres.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 4c3f5636..ee6fb1fb 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -208,7 +208,8 @@ test_planes_on_pipe_with_output(data_t *data, enum pipe pipe,
 		igt_assert_crc_equal(&data->ref_lowres.crc, &crc_lowres);
 
 		igt_plane_set_fb(plane, NULL);
-		tested++;
+		if (tested++)
+			break;
 	}
 
 	igt_pipe_crc_free(pipe_crc);
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
