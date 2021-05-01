Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EDD16E0BE
 for <igt-dev@lists.freedesktop.org>; Sat,  1 May 2021 01:50:49 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Sat,  1 May 2021 04:50:42 +0300
Message-Id: <20210501015044.4139096-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/intel_bufops: Fix CCS plane width
 calculation
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
List-ID: <igt-dev@lists.freedesktop.org>

The CCS plane width calculation was correct only for 32bpp formats,
where a 64 byte CCS unit maps to a 4 tiles * 32 pixel width on the main
surface, but for other bpps the same CCS unit maps to a
(4 tiles * 128 bytes / (bpp/8 bytes/pixel)) width. Fix the width
calculation accordingly.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/intel_bufops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 1a3d86925..3dc059808 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -78,7 +78,7 @@ intel_buf_ccs_width(int gen, const struct intel_buf *buf)
 	 * main surface.
 	 */
 	if (gen >= 12)
-		return DIV_ROUND_UP(intel_buf_width(buf), 128) * 64;
+		return DIV_ROUND_UP(intel_buf_width(buf), 512 / (buf->bpp / 8)) * 64;
 
 	return DIV_ROUND_UP(intel_buf_width(buf), 1024) * 128;
 }
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
