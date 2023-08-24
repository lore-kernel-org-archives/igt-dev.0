Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45A110E598
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 16:15:43 +0000 (UTC)
From: Melissa Wen <mwen@igalia.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Thu, 24 Aug 2023 15:15:24 -0100
Message-Id: <20230824161524.14083-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic: remove zpos < N-planes
 assert
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Generalize plane-immutable-zpos test case by removing not-required
assert. zpos < N-planes is a condition not required by DRM
documentation. Removing this validation doesn't affect the test purpose
on verifying that planes with higher zpos always cover those with lower
zpos. Also, this assert doesn't fit driver's configuration where the
range of plane zpos is just defined by the plane type but its max value
doesn't need to be normalized to the number of planes in a CRTC, for
example, a cursor plane with the highest possible zpos value.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/kms_atomic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 22ddf5633..6986864f3 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -458,7 +458,6 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 			continue;
 
 		zpos = igt_plane_get_prop(temp, IGT_PLANE_ZPOS);
-		igt_assert_lt(zpos, n_planes);
 
 		plane_ptr[zpos] = temp;
 	}
-- 
2.40.1
