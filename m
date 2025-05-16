Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6ABC54754
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB0810EB24;
	Fri, 16 May 2025 16:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dfdfu/qi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF06810EB27
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747411605; x=1778947605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vVzbZB5HRSgLSfNya0xJtsxDJgCGnyqgU8Tg6Tmrn8I=;
 b=Dfdfu/qiTWpC1N44Zs5KtX+DXgzj+UhsmITtv147vUOOnr9d3af62Way
 gzzlH0zPdgN3JT7hq4K3M+cZ7O/M201Jq8GKnI5p4FndMYOLa/PBnvv/3
 K8I4SJf2Zp31RFuhFA+0SZOrBTyHf+WH7T+vXpZZdHR4DTT+qxT3GLnTv
 wEF5seGJLxAQUTJIOfJ2DR+QViEPwHkFQMAjFLLtAWbgvF+QpO1MYcnB8
 L9Ah0ju6try21dvQsl/7oCVfasdGbRwUafU8ic+4obbvA6vMGaeSMgYOl
 ovfjw6k2XiBbynHJWanfuVuZ4R7FaK9+Tzg+Qc2WdSkOYigif8sWr/2mN w==;
X-CSE-ConnectionGUID: XTAW+o6jS2CKF3K9H/TU9g==
X-CSE-MsgGUID: aFbdFwZBQRuhiA1dBoF1lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66941170"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66941170"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:06:45 -0700
X-CSE-ConnectionGUID: Ugnem5AETQSI22L0gdq5Jw==
X-CSE-MsgGUID: Behq3nQ3Qaazqj1L7LhSTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169772615"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 09:06:42 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v6 11/14] tools/intel_gpu_top: Replace index with strchr
Date: Fri, 16 May 2025 16:05:48 +0000
Message-ID: <20250516160551.58760-12-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
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

As index is deprecated, replace index with strchr.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tools/intel_gpu_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 68d27089b..54e71e559 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -290,7 +290,7 @@ get_pmu_config(int dirfd, const char *name, const char *counter)
 	if (ret <= 0)
 		return -1;
 
-	p = index(buf, '0');
+	p = strchr(buf, '0');
 	if (!p)
 		return -1;
 
-- 
2.49.0

