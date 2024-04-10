Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F350CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 17:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D020010ED47;
	Wed, 10 Apr 2024 17:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dv0Ib58V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8D510ED47
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 17:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712769279; x=1744305279;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KLnrIbB0wyGSAejAjgVxxD4vf5j7cJxS3YWpzkxSVvw=;
 b=dv0Ib58VoWRVBfgc2tKCYEwa6bQ3AU2mLdJgJHBy6Fg+dobBdvAVaZC3
 +ydWwRtYRdPGGDCPR0TdsqpJgmjw7EAJSATMUKkViRF/GO8OuEXS9nd16
 fAOqhbxNnapc5z6ESzYNe0uWys6qXz0OxzDYupLckhIxW76dJCgpTCIjh
 ie0iB4QxZ5afmWA4OOAa8Ah5Je88xU5Y0PnIVTiusoYEtfyL+3RInMoUi
 rwyDWf25I5V27cc00i4Aq6xTStr3Xtug35aK9RpAOll7loesxuc83aL9F
 vRd42rImYw8QAiFEXO4Phb5JMtnaSj0dovcms+7ZLd22XEfg5LtrkwfYE g==;
X-CSE-ConnectionGUID: +UhaOlcXRLaSDhQrVS4opg==
X-CSE-MsgGUID: gQbENbKXSK+FzINSqN96OA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11927855"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11927855"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:14:38 -0700
X-CSE-ConnectionGUID: ifudCadmQiCN3bz0dbNyaA==
X-CSE-MsgGUID: 0Wi4KQu4Sd65q8tsDN0Wgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20586332"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:14:38 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t 1/2] drm-uapi/xe: Add device atomics vm bind flags
Date: Wed, 10 Apr 2024 19:00:40 +0200
Message-ID: <20240410170041.24963-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Align with commit ("drm/xe/uapi: Introduce VMA bind flag for device
atomics")

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 include/drm-uapi/xe_drm.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 4353595a4..4b4f42816 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -967,10 +967,11 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
-#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
-#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_READONLY		(1 << 0)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE		(1 << 1)
+#define DRM_XE_VM_BIND_FLAG_NULL		(1 << 2)
+#define DRM_XE_VM_BIND_FLAG_DUMPABLE		(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS	(1 << 4)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.42.0

