Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61397D37492
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E2210EBA3;
	Fri,  5 Dec 2025 19:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCp2+0EO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C591110EBA7
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 19:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764963999; x=1796499999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WaTy7Vt7FMXzH+HQyQu0KPemLZMOb072QIpxmdr6i14=;
 b=LCp2+0EOXNutDEMVaRPYkfAXoh1p6kQ2V0JIxWK+9fpedoyjUZMa5BLK
 UGFItVpwQ7wfRToiEuKRGtFaZp8C6vcgqhIT4ogpA8/f0l5lTog4wOkPt
 qPMxLj0fN7c7jJvFMVoFx+5SQXQYo6/9L7l7X5ez32+b/E18j7j0JAta3
 TBftvXIODNizTyMsRUgsAplURX1TVnc4jick3i6S3xpi2KLyFCQCtkExL
 7ZWivT2D55FaXWVXp9g4Stw/3m13QBKG1Qbj5WmuB4KC8xU2T2sRx/btc
 sFFPhJd0M2LyUcunnwLNpz+IdyeQkyRr131IpPythH/UtaVKchurvv/EI A==;
X-CSE-ConnectionGUID: OWdpPGZlTCqcFqQXrxrgMg==
X-CSE-MsgGUID: Ls/KCYFkSsy5jZDkQPqKZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84606678"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84606678"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:46:39 -0800
X-CSE-ConnectionGUID: yQbP20aES92UfQw3vFiBHw==
X-CSE-MsgGUID: TG+CPKDQR624ApGYGX4uKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195624917"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:46:37 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org,
	alex.hung@amd.com
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 13/13] lib/kms: Skip when plane has invalid color pipeline
Date: Sat,  6 Dec 2025 01:23:12 +0530
Message-Id: <20251205195312.1234330-14-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251205195312.1234330-1-swati2.sharma@intel.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
MIME-Version: 1.0
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

Replace assert with skip in igt_plane_set_color_pipeline() to avoid test
crash when color pipeline is not supported by KMD.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b522495f8..9b3958804 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4436,12 +4436,12 @@ bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
  * @plane: Target plane.
  * @colorop: Colorop to set as color pipeline.
  *
- * This function sets the given @colorop as color pipeline on @plane, or fails
+ * This function sets the given @colorop as color pipeline on @plane, or skips
  * the test if it's an invalid color pipeline for the plane.
  */
 void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
 {
-	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
+	igt_skip_on_f(!igt_plane_is_valid_colorop(plane, colorop), "Invalid color pipeline for the plane\n");
 
 	plane->assigned_color_pipeline = colorop;
 	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
-- 
2.25.1

