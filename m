Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9256D6E49F
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Oct 2021 21:26:27 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 27 Oct 2021 00:26:20 +0300
Message-Id: <20211026212620.2718277-5-imre.deak@intel.com>
In-Reply-To: <20211026212620.2718277-1-imre.deak@intel.com>
References: <20211026212620.2718277-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] lib/igt_fb/tgl+: Prevent CCS FB AUX
 surface size overalignment
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

So far the page alignment of the size of CCS AUX surfaces was ensured
by aligning the height of the surface to 64, which multiplied by the 64
byte CCS tile width resulted in the multiple of a 4k value. This can
overallocate the CCS surface up to ~1/4th of one main surface tile-row
size. Avoid the overallocation by simply aligning the size to 4k.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ddb530c99..1ad64506f 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -827,8 +827,8 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		uint64_t size;
 
 		/* The AUX CCS surface must be page aligned */
-		size = (uint64_t)fb->strides[plane] *
-			ALIGN(fb->plane_height[plane], 64);
+		size = ALIGN((uint64_t)fb->strides[plane] *
+			     fb->plane_height[plane], 4096);
 
 		return size;
 	} else {
-- 
2.27.0
