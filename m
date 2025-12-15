Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2086DD5B872
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 22:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CAE10E198;
	Mon, 15 Dec 2025 22:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y78n1uA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8A710E198
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 22:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765837780; x=1797373780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B7gxVXVfeGOklFZGXaP9CM9ihzQmMZiQfy4Jc6p7VRE=;
 b=Y78n1uA6PSJBkQAYC6LIoeMVAOrkzghxe35Zeg8JGaFCfetkyd0GHxji
 sgcSPAhqqRmkc7t3yFKbB52p3Xr7Kt9GlBaRfO2sgvS9jl82RlPVSZDGJ
 +BZ99CmeY87WLLclOJLtXguB8gw0MUO/NnQ1Zr1VfawWXaqXVxbTvoLdr
 yY8mFu8V7mROqPviWSnvkdYoC2cmrvcHFQcdx9ixksB3JyLAgpIjYWepM
 00C8tSyMQ7Ncwi4+qayLW40vuqifoaNhRsB4wUnqVtpWYeANy5hzbui8t
 Wt4l+2ISgjP5tKsVCV61DLCfD1lc4f1VQlrLBQZnX1YAtMaWfkpX9y2rG A==;
X-CSE-ConnectionGUID: Seu95WOKRFiosmbrJKsmAQ==
X-CSE-MsgGUID: IdkNi04OTFuOG5MnxUwu+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55315058"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="55315058"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:29:39 -0800
X-CSE-ConnectionGUID: uMwAvBBxTtqyf70qOKp7gw==
X-CSE-MsgGUID: 3TbYNjxrT0S8DCtcGvHA+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197836363"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:29:40 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/3] drm-uapi/xe: Sync with DRM_XE_OA_UNIT_TYPE_MERT
 definition
Date: Mon, 15 Dec 2025 14:29:33 -0800
Message-ID: <20251215222935.2002656-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251215222935.2002656-1-ashutosh.dixit@intel.com>
References: <20251215222935.2002656-1-ashutosh.dixit@intel.com>
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

This patch will be replaced by the patch syncing with kernel commit
"drm/xe/oa/uapi: Expose MERT OA unit" (to bring in all changes till
DRM_XE_OA_UNIT_TYPE_MERT definition) after the kernel patch is merged.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 include/drm-uapi/xe_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 756643c6fe..24fe1e2a75 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1695,6 +1695,9 @@ enum drm_xe_oa_unit_type {
 
 	/** @DRM_XE_OA_UNIT_TYPE_OAM_SAG: OAM_SAG OA unit */
 	DRM_XE_OA_UNIT_TYPE_OAM_SAG,
+
+	/** @DRM_XE_OA_UNIT_TYPE_MERT: MERT OA unit */
+	DRM_XE_OA_UNIT_TYPE_MERT,
 };
 
 /**
-- 
2.48.1

