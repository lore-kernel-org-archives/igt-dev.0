Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F63E6688C
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 20:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA13110F0AA;
	Fri, 19 Dec 2025 20:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TQqhQXU2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C93610F0AA
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 20:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176439; x=1797712439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kvv9ei3DQNJhk9pAViQ5tl1WFdROKVyhVwSw7H19KCo=;
 b=TQqhQXU2H4CvRHWu+sxK3d30sRbDfzVOgIIcWLYUadDU3j/DhOIwhodH
 sTeIMyWEHXRcv28KscRgSQbWQox57ctyxra7HRRy7LB3rkLZJgYx/12Yw
 lcTEg7VfCDho5cqeUE7kEsOza2JgrbXUN+6TR2YtnhbLf1MiQIXPhnXyJ
 83E66nHBkmybBAMIdLigH4xnRff1xoAuCqCX6aFtYJO6w39XBcZyZTpwk
 91cCwWwT6ZADnG/clHPpxjU6oRBSV9S7cZI1zlZtR16DsRhJtFLi+6u7G
 sd47Oy6IBCHqrcfEDBbiIRkgA3Vvsixub3i7QeI/9fGhJLgS67SP5rIDb A==;
X-CSE-ConnectionGUID: qa3p87T1QXSYICwSBuRQPQ==
X-CSE-MsgGUID: 1+Sbf5TuQbGLdif9c7DW/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68034138"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68034138"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:59 -0800
X-CSE-ConnectionGUID: l4Awd9QITfyshttwJbf5Mg==
X-CSE-MsgGUID: LAOxl3DTTEO5rf32Ciz+jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="222367575"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO localhost)
 ([10.124.220.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:58 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 07/11] lib/kms: Nuke pipe->plane_cursor
Date: Fri, 19 Dec 2025 22:33:23 +0200
Message-ID: <20251219203327.16573-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219203327.16573-1-ville.syrjala@linux.intel.com>
References: <20251219203327.16573-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Get rid of of the redundant pipe->plane_cursor. It'll
always be 'pipe->n_planes-1' after we've found the plane.
And before we've found the plane we can just check for
'pipe->planes[pipe->n_planes-1].index < 0'.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 6 ++----
 lib/igt_kms.h | 1 -
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4af517a991f8..2b805261e4ef 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3061,10 +3061,9 @@ static void igt_crtc_plane_init(igt_display_t *display,
 		index = 0;
 
 		pipe->num_primary_planes++;
-	} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor == -1) {
+	} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->planes[pipe->n_planes - 1].index < 0) {
 		index = pipe->n_planes - 1;
 
-		pipe->plane_cursor = index;
 		display->has_cursor_plane = true;
 	} else {
 		for (index = 1; index < pipe->n_planes; index++) {
@@ -3113,7 +3112,6 @@ static void igt_crtc_init(igt_display_t *display,
 	int j;
 
 	pipe->display = display;
-	pipe->plane_cursor = -1;
 	pipe->planes = NULL;
 	pipe->num_primary_planes = 0;
 
@@ -3567,7 +3565,7 @@ igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type)
 
 	switch(plane_type) {
 	case DRM_PLANE_TYPE_CURSOR:
-		plane_idx = pipe->plane_cursor;
+		plane_idx = pipe->n_planes - 1;
 		break;
 	case DRM_PLANE_TYPE_PRIMARY:
 		plane_idx = 0;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 810eb7497834..4a814f0e9962 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -489,7 +489,6 @@ struct igt_crtc {
 
 	int n_planes;
 	int num_primary_planes;
-	int plane_cursor;
 	igt_plane_t *planes;
 
 	uint64_t changed;
-- 
2.51.2

