Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A0FD2FEC4
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 17:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780C610E0DB;
	Tue, 27 Jan 2026 17:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bh0PGJHj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901E910E0DB
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 17:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769534207; x=1801070207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NqO6b8UfgykmMaFUvKWUw00dfO5WOHUkoSx5KGZg2AY=;
 b=Bh0PGJHjs1GTTa9va2SILxfq0zdxAIv3sxyhuNxfY2beg7tJMKW1h9uD
 MFJYTx0KtqhFMuGO1ZEM6H3svjEz2t6pyxdTrQ4r+GSVgPWyueYWPYdez
 SFlja9j5wb4PkNa1OkshM8Q490aQT7eMSNaPg78ukLmr78c1kxuyZR5Sk
 yBmJCCm2LheEKPPCZGR9/XFPQOfFzFwbvXnkv/K74txrv3uii8dO5Y32T
 I8rOeeOJ7vU/pPB1yqXm8q00BMYhtI5+kKT/VsMROz59B/zaH1rjZ1xgS
 qw5EFZ28EsGwf3NKBHYcjIn01+z/wP5eBX4I8ySbn/19iAwhf40UrRgUV w==;
X-CSE-ConnectionGUID: yp101fSiRdai13rN2OyBkQ==
X-CSE-MsgGUID: HBcmTANESfCz7pRFn/Iolw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70453862"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70453862"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 09:16:47 -0800
X-CSE-ConnectionGUID: YyPV5ioGSNu2nvZ/UOnZQg==
X-CSE-MsgGUID: nbVJMfgFSOSQKG7KLpQ6Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208467424"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 09:16:44 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
	Maciej Patelczyk <maciej.patelczyk@intel.com>,
	Rudnicki@freedesktop.org, Piotr <piotr.rudnicki@intel.com>,
	Piatkowski@freedesktop.org,
	Dominik Karol <dominik.karol.piatkowski@intel.com>,
	Jan Sokolowski <jan.sokolowski@intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t] drm-uapi-experimental/xe_drm_eudebug: Adjust eudebug
 uapi numbers
Date: Tue, 27 Jan 2026 18:16:25 +0100
Message-ID: <20260127171624.2148681-2-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Adjust DRM_XE_EUDEBUG ioctl and exec queue property numbers to not
conflict with the new uapi introduced by igt commits 4164b19c2daa
and f1770346a78b.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 include/drm-uapi-experimental/xe_drm_eudebug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
index 5aeb6a735..8e74ced2f 100644
--- a/include/drm-uapi-experimental/xe_drm_eudebug.h
+++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
@@ -19,9 +19,9 @@ extern "C" {
  */
 
 /* XXX: BEGIN section moved from xe_drm.h as temporary solution */
-#define DRM_XE_EUDEBUG_CONNECT		0x0e
-#define DRM_XE_DEBUG_METADATA_CREATE	0x0f
-#define DRM_XE_DEBUG_METADATA_DESTROY	0x10
+#define DRM_XE_EUDEBUG_CONNECT		0x0f
+#define DRM_XE_DEBUG_METADATA_CREATE	0x10
+#define DRM_XE_DEBUG_METADATA_DESTROY	0x11
 
 /* ... */
 
@@ -54,7 +54,7 @@ struct drm_xe_vm_bind_op_ext_attach_debug {
 
 /* ... */
 
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		3
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		6
 #define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
 
 /* ... */
-- 
2.47.1

