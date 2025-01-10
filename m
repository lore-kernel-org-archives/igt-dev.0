Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F3CE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 19:46:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA27210E522;
	Fri, 10 Jan 2025 19:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9sf6Tp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC0F10E51F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 19:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736538368; x=1768074368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NJtLdhaLdW6+hs9JfT81pk+OOAVRNpF6pN5GnuCBxsQ=;
 b=M9sf6Tp4aia5M72GMSGdFKslTO42mcWOoKsJRR5ozVhIwjXns/w+nWz7
 jc0guYU4PQUsQzadTwS34Ye4cOaEs8jBCsAR1uIJfSeEwIEI+Bq68WtHG
 3FHWXEvq2qFujUFHxb1esf46g23EtDy2f5yaOuE+CTYNMaMLNYuODZ+d/
 DFNqeQcufVSV85QGgEt2onY7xy1SGoY0tZ1gtObMuct6JIgpdMCtXWiSF
 oXnfeBEi0vxU7HVWKLnPXWgvwoYuGu91K3peIxwG9hcOURnMVJrKfjnR1
 vgfgZcHehJmpL7mk5+3crj4bTsV12L/0qIXf0zHGUw3P+BcP0UmmY+Zzv A==;
X-CSE-ConnectionGUID: /ZTpgGPoSta1uzYVwnUBEQ==
X-CSE-MsgGUID: HqtjGmPvQNmaibIG2hX+sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47419827"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="47419827"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:46:08 -0800
X-CSE-ConnectionGUID: AErCcBYfTbaM9DS9ZpQrQA==
X-CSE-MsgGUID: ZBTaFjrKRPejx9vpBRTjjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="104334487"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:46:06 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 8/8] meson: Add sharpness tool
Date: Sat, 11 Jan 2025 01:21:00 +0530
Message-Id: <20250110195100.150301-9-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110195100.150301-1-swati2.sharma@intel.com>
References: <20250110195100.150301-1-swati2.sharma@intel.com>
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

From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

Make changes in tools/meson.build to build sharpness tool.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tools/meson.build | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/meson.build b/tools/meson.build
index 511aec69e..dcd931cc1 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -68,6 +68,17 @@ if libudev.found()
 		   install : true)
 endif
 
+executable('intel_sharpness_tool', 'intel_sharpness_tool.c',
+           dependencies : tool_deps,
+           c_args : [
+	      '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
+	      '-DIGT_SRCDIR="@0@"'.format(srcdir),
+	      '-DIGT_IMGDIR="@0@"'.format(imgdir),
+	      '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0])
+            ],
+          install_rpath : bindir_rpathdir,
+          install : true)
+
 executable('gputop', 'gputop.c',
            install : true,
            install_rpath : bindir_rpathdir,
-- 
2.25.1

