Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202CBC02192
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 17:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA4C10E84F;
	Wed, 29 Jan 2025 17:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wfo3wlSP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C0010E84F
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 17:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738171594; x=1769707594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vemfwcI0CUMuFqwsgaWcWPAI+3BBaJGkQ4g1M0Nwkqo=;
 b=Wfo3wlSPCUpivFsfDTiFFxhXWGHW5dTs6b4Hhxs+e6k1tl+0nGKNmcpw
 SjZuJZkzkJjXFy76jZ5xSmuAnbBwgnk7P8mePX4UpOQbpDouaLQRMpwB4
 ZvV80ifux3LzwEn1aeb5uM8QtpnohtWUSEbqruOZtGT6h6Y/IeVokiLtM
 VRgBupUTCSE50NuK8UecyHWYxmBwhStysjn6/mbhlw08WlBsKjT87FzQK
 RZjJMRmGabE69qt/7UeL1gwfWVhcJoF6dWhbYW8zx8PIOPJdCrvNFb/LL
 2LpjAJ7lHuOH53HSDRdAtVQ1VNl4CBJFtp+poAsYQYun+gA6SEa3fHpCI g==;
X-CSE-ConnectionGUID: IXNKaa/XQbyFgDo2ZRrIug==
X-CSE-MsgGUID: GxlLlQ3iRjqjXNrtpmM3/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38580390"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38580390"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 09:26:34 -0800
X-CSE-ConnectionGUID: yHDdQpwWQ+SmuOmlzwViNQ==
X-CSE-MsgGUID: kFrugeC6S2qcNppAPdoL4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110008014"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 09:26:33 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] intel-ci/xe.blocklist: add i915 specific tests
Date: Wed, 29 Jan 2025 23:11:53 +0530
Message-Id: <20250129174153.3654881-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250129174153.3654881-1-jeevan.b@intel.com>
References: <20250129174153.3654881-1-jeevan.b@intel.com>
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

Add i915 pm specific tests to blocklist.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index fc270198f..6964628f1 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -74,6 +74,7 @@ igt@kms_rotation_crc@exhaust-fences
 igt@kms_pm_lpsp@screens-disabled
 igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
 igt@kms_pm_rpm@.*pc8-residency.*
+igt@kms_pm_rpm@cursor.*
 ##################################################################
 # KMS: Yet to add/missing XE support
 ##################################################################
-- 
2.25.1

