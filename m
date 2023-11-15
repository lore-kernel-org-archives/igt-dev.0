Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A0D10E08C
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 13:12:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Nov 2023 18:32:34 +0530
Message-Id: <20231115130237.1522518-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20231115130237.1522518-1-bhanuprakash.modem@intel.com>
References: <20231115130237.1522518-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 1/4] tests/intel/kms_fbt: Use blitter as a
 default draw method
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As Rendercopy support in IGT is not present for few latest
platforms, use Blitter as default draw method.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 60a469901..eac33f48b 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1236,12 +1236,12 @@ static void init_crcs(enum pixel_format format, enum tiling_type tiling,
 			for (r_ = 0; r_ <= r; r_++)
 				draw_rect_igt_fb(pattern, &tmp_fbs[r],
 						 igt_draw_supports_method(drm.fd, IGT_DRAW_PWRITE) ?
-						 IGT_DRAW_PWRITE : IGT_DRAW_RENDER,
+						 IGT_DRAW_PWRITE : IGT_DRAW_BLT,
 						 r_);
 	} else {
 		for (r = 0; r < pattern->n_rects; r++)
 			draw_rect_igt_fb(pattern, &tmp_fbs[r], igt_draw_supports_method(drm.fd, IGT_DRAW_PWRITE) ?
-					 IGT_DRAW_PWRITE : IGT_DRAW_RENDER, r);
+					 IGT_DRAW_PWRITE : IGT_DRAW_BLT, r);
 	}
 
 	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
-- 
2.40.0
