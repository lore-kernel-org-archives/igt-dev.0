Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8345FC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 21:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0C510EB14;
	Mon, 25 Mar 2024 21:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkoSwTOx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7025610EB11
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 21:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711403788; x=1742939788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tfzzSYGvXA74hdNexpXm9F9zjTD3q3cp/hE0Vyn4RO4=;
 b=MkoSwTOx5cmf4jh0HCCDhcvT2FWuymJIB7HBRAHCqS//VWvx9r0H5I+2
 c5y/rT4tJ5ioR1zMRUTG52CTxIy70SV9SwzXHl5IWyqGsDH34xVX+zL0U
 lCZzhqU44Ii/FD28nPT442ARPc4VE3wwum/9HFZmJ0yYcpJDzih04REaF
 9nATE4MJrI9Y6ADGJv80CaZECcCqNSZ4pCm6xoONPHdpcnYtu4FfrbJfx
 KEmhcgFiiJlPzURibnPieGOR67duwIC9lNl7oRMIVv1ilkKHeupp398wN
 RtF2CIhc4/xKv6jaJ8eqt1sMGCHYcCGEFdtLDxdkdPvXBdaOAPY/5WG9D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6540570"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6540570"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="20413090"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:56:27 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v1 1/3] drm-uapi/xe_drm: Read flat ccs value from
 drm_xe_query_config
Date: Tue, 26 Mar 2024 02:54:36 -0700
Message-Id: <64b587ec51ad3f803ec51afc32f894f05761aadd.1711444735.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711444735.git.akshata.jahagirdar@intel.com>
References: <cover.1711444735.git.akshata.jahagirdar@intel.com>
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

Add an additional drm_xe_query_config_flag for reading the value
of flat_ccs of the platform.
This can be used in respective igt testcases.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 include/drm-uapi/xe_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 4353595a4..b43c8cf76 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -389,6 +389,8 @@ struct drm_xe_query_mem_regions {
  *
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
  *      has usable VRAM
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS - Flag is set if the device
+ *      has flat ccs enabled
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -405,6 +407,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS	(1 << 1)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
-- 
2.34.1

