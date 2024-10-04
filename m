Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7F4CFA763
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FE110E9D0;
	Fri,  4 Oct 2024 10:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgaWvCFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E27F10E9D0
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 10:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728038506; x=1759574506;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zIx0etgB1/nSvUVuVP6QHeLSoSZxwpjkfIhhs62N2io=;
 b=BgaWvCFSvuPvBSdv3s5APPQY2d4DythszYgZeSFlo5AC1q//mBoU/0nP
 OzJUg1i5Tw5y3WTNPCx3i/xcfz6bXinxv14aJA7P1GSLOAlgj3hOyMV9n
 LX/zqqd+LpLi608IUl7+quwrM7VOouW6kBBJI3oe+yOEBUcRmASFHOxnl
 Yzxm9uMPR1U/u/ilkNkSBoJUc0da3gbOq9znhh5p1ZY9wcvDzqSkP4M6p
 B1TY71KAiMauz7Gh90HmmIu7UIUGZMHJo4xRe7TDGQYRXhkaClhJI1kxZ
 UgupNxBLnDodDT72Y/wKDsKh2S6+QxN9kf43RM5WiyaqQI3kYJUFSG6xB w==;
X-CSE-ConnectionGUID: f7oyjs0lRBy+anaa2U4xVw==
X-CSE-MsgGUID: 4OolZV11SMu2XP56xP3W5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31140536"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="31140536"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:41:46 -0700
X-CSE-ConnectionGUID: x1MgVo5iRRysIvk/GPWP1Q==
X-CSE-MsgGUID: 7YFIZriRRYOxT9Cm0ynK8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74778355"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:41:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:41:43 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/14] lib/igt_draw: Add 64bpp support for the
 non-XY_FAST_COLOR_BLT path
Date: Fri,  4 Oct 2024 13:41:15 +0300
Message-ID: <20241004104121.32750-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

XY_COLOR_BLT can't do 64bpp since we have nowhere to store
the other half of the color. In order to support 64bpp
pixel formats we have to get a little bit creative and
use XY_PAT_BLT_IMMEDIATE instead. We simply treat the
buffer as 32bpp, double the horizontal dimensions to
compensate, and alternate between the lower and upper
dwords of the color value when filling the 8x8 pattern.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_draw.c  | 24 ++++++++++++++++++++++++
 lib/intel_reg.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 2312a0c71030..81da01a6c5ad 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -833,6 +833,30 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 		intel_bb_out(ibb, (1 << 29) | ((pitch-1) << 14) | (buf_height-1));
 		intel_bb_out(ibb, 0);	/* mipmap levels / qpitch */
 		intel_bb_out(ibb, 0);	/* mipmap index / alignment */
+	} else if (buf->bpp == 64) {
+		int x = rect->x * 2;
+		int w = rect->w * 2;
+
+		blt_cmd_depth = 3 << 24; /* 32bpp */
+		blt_cmd_len = ((ver >= 8) ?  0x4 : 0x3) + 8*8;
+		blt_cmd_tiling = (tiling) ? XY_COLOR_BLT_TILED : 0;
+		pitch = (ver >= 4 && tiling) ? buf->stride / 4 : buf->stride;
+
+		switch_blt_tiling(ibb, tiling, true);
+
+		intel_bb_out(ibb, XY_PAT_BLT_IMMEDIATE_CMD_NOLEN | XY_COLOR_BLT_WRITE_ALPHA |
+			     XY_COLOR_BLT_WRITE_RGB | blt_cmd_tiling | blt_cmd_len);
+		intel_bb_out(ibb, blt_cmd_depth | (0xF0 << 16) | pitch);
+		intel_bb_out(ibb, (rect->y << 16) | x);
+		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (x + w));
+		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0, I915_GEM_DOMAIN_RENDER,
+					   0, dst->addr.offset);
+		for (int i = 0; i < 8*8; i += 2) {
+			intel_bb_out(ibb, color);
+			intel_bb_out(ibb, color >> 32);
+		}
+
+		switch_blt_tiling(ibb, tiling, false);
 	} else {
 		switch (buf->bpp) {
 		case 8:
diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index 26833c66f8e7..903b44b59fc3 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2545,6 +2545,8 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define XY_COLOR_BLT_WRITE_RGB		(1<<20)
 #define XY_COLOR_BLT_TILED		(1<<11)
 
+#define XY_PAT_BLT_IMMEDIATE_CMD_NOLEN	((2<<29)|(0x72<<22))
+
 #define XY_SETUP_CLIP_BLT_CMD		((2<<29)|(3<<22)|1)
 
 #define XY_SRC_COPY_BLT_WRITE_ALPHA	(1<<21)
-- 
2.45.2

