Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C948C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 03:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DFF10E084;
	Thu,  6 Mar 2025 03:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XmlAXZzO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2D210E084
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 03:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741232673; x=1772768673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ViCcUUYu6Sa5ajevc7IxE9PNZnZ1agji5Y5YyNU0dHk=;
 b=XmlAXZzOnvGgJYr8lC1JFaTgC/2tTFGoXY0rR0DUi2EiklODKffJKH08
 luTVOgGoxvPrlNHW5KtVA0SvUO3MurmyhFZqAa/f63gvfVLFPKPUYwF+0
 LbRNjnci5K+YoEL4nSq6qwPBmCq9nKGCeUQWdvQy/p9Pc5TLeQY+ouDcl
 O1Mjv1ayfoC+cMfZeYmS9NZvN0WUpJg/Gxq8BkJjtwZPTBWPDa0BoyesI
 DForRcZ+qIFYIxOIDg8wFm4yY7foFC0vrpMjkZKOuO8jLPND31uiscZmH
 kzCCnSmD60m6SNSy0vgo/fPeHg8AfbkYtUlnoiqpyYxHxHQvIKvVcIM79 A==;
X-CSE-ConnectionGUID: a1VcGZSTQZCNQ2OnmtaOgw==
X-CSE-MsgGUID: RFj+Q9eLRNS2BOrMqYBKGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64673575"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="64673575"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 19:44:33 -0800
X-CSE-ConnectionGUID: bEbgEISLSq22zkFCRP42Ig==
X-CSE-MsgGUID: sawoYYdjQL6SfRUiXYs0bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119403349"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 19:44:23 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, ramanaidu.naladala@intel.com, jouni.hogander@intel.com,
 kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 3/3] tests/intel/kms_psr_su: Skip PSR2 su test on
 joiner
Date: Thu,  6 Mar 2025 09:09:53 +0530
Message-Id: <20250306033953.2519156-5-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306033953.2519156-1-santhosh.reddy.guddati@intel.com>
References: <20250306033953.2519156-1-santhosh.reddy.guddati@intel.com>
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

Joiner cannot be used along with PSR2. skip the selective update test
on the joiner outputs.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_psr2_su.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 0099daf1d..d41baae1f 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -389,6 +389,11 @@ igt_main
 							 */
 							igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
 						}
+						if (is_joiner_mode(data.drm_fd, outputs[i])) {
+						igt_info("%s supports joiner mode, can't test PSR2 + joiner\n",
+								igt_output_name(outputs[i]));
+						continue;
+						}
 						prepare(&data, outputs[i]);
 						run(&data, outputs[i]);
 						cleanup(&data, outputs[i]);
-- 
2.34.1

