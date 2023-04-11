Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC6B10E20C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 13:30:10 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Tue, 11 Apr 2023 10:29:44 -0300
Message-Id: <20230411132946.17459-2-mcanal@igalia.com>
In-Reply-To: <20230411132946.17459-1-mcanal@igalia.com>
References: <20230411132946.17459-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/vkms: Add tests that changed its
 testing structure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Commit 10b12ce8 ("tests/kms_cursor_edge_walk: Re-org dynamic subtests")
changed the name of the kms_cursor_edge_walk sub-tests, while commit
777ed850 ("tests/kms: Cleanup to use linear modifier") made it possible
to run more kms_plane_cursor tests for non-i915 devices. Reflect this
changes in the testlist by adding those tests to the testlist.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/vkms_ci/vkms.testlist | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tests/vkms_ci/vkms.testlist b/tests/vkms_ci/vkms.testlist
index 9065d318..c52dc210 100644
--- a/tests/vkms_ci/vkms.testlist
+++ b/tests/vkms_ci/vkms.testlist
@@ -76,10 +76,18 @@ igt@kms_cursor_crc@cursor-sliding-512x512
 igt@kms_cursor_crc@cursor-sliding-64x21
 igt@kms_cursor_crc@cursor-sliding-64x64
 igt@kms_cursor_crc@cursor-suspend
-igt@kms_cursor_edge_walk@left-edge
-igt@kms_cursor_edge_walk@right-edge
-igt@kms_cursor_edge_walk@top-bottom
-igt@kms_cursor_edge_walk@top-edge
+igt@kms_cursor_edge_walk@128x128-left-edge
+igt@kms_cursor_edge_walk@128x128-right-edge
+igt@kms_cursor_edge_walk@128x128-top-bottom
+igt@kms_cursor_edge_walk@128x128-top-edge
+igt@kms_cursor_edge_walk@256x256-left-edge
+igt@kms_cursor_edge_walk@256x256-right-edge
+igt@kms_cursor_edge_walk@256x256-top-bottom
+igt@kms_cursor_edge_walk@256x256-top-edge
+igt@kms_cursor_edge_walk@64x64-left-edge
+igt@kms_cursor_edge_walk@64x64-right-edge
+igt@kms_cursor_edge_walk@64x64-top-bottom
+igt@kms_cursor_edge_walk@64x64-top-edge
 igt@kms_flip@absolute-wf_vblank
 igt@kms_flip@absolute-wf_vblank-interruptible
 igt@kms_flip@basic-flip-vs-dpms
@@ -168,6 +176,9 @@ igt@kms_plane@plane-panning-top-left
 igt@kms_plane@plane-position-covered
 igt@kms_plane@plane-position-hole
 igt@kms_plane@plane-position-hole-dpms
+igt@kms_plane_cursor@overlay
+igt@kms_plane_cursor@primary
+igt@kms_plane_cursor@viewport
 igt@kms_plane_multiple@tiling-none
 igt@kms_plane_scaling@planes-downscale-factor-0-25
 igt@kms_plane_scaling@planes-downscale-factor-0-5
-- 
2.39.2
