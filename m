Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD777D41C3B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 05:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6671B10E797;
	Thu, 14 Nov 2024 05:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ip5HRPYy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7B610E794
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 05:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731561484; x=1763097484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sWrm4zwBs3Gj9lXNy64iTthZZWU3/yBd+MMdEL2rUUw=;
 b=Ip5HRPYy5XFw8Occ8qSklMUXDghGZPuANbPMfu5e3oFSWXzROaRVcCYs
 XffAqqHV4mR2fP7UsE5Zn8nsZQpjcpGtVpCfnL7rRBusmGXaSjxXRjW1w
 7h0xUEa1iCiIlE0Qd6eP4uDBB8aImQfyCt8O7C3v9Cj0kmvPcwJzCcleA
 1zwibl1MMdi2k8jK4Y6M7c1qiInGsWV5HCPTAPeerXODBEZ3sLEUDQef1
 2+1zQqhcOWGV3lQrjthBNPq4mDeCh6EYeNr+mQw64UKZz6p3uIMToZ1C8
 KAPYTLcjFpoXWiEr0vb6/hvzAwE9cpwLbdAbgXOAqfn7IaVoY6/Yi/B5H w==;
X-CSE-ConnectionGUID: i9edpNPMQ0a2rmQ2NuAupw==
X-CSE-MsgGUID: Isf42nWdSjml5/52vGzDIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42040900"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42040900"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 21:18:04 -0800
X-CSE-ConnectionGUID: bmJVRs9TSD6EV1wPQ3fZyg==
X-CSE-MsgGUID: cI0eOM82TPaWhgKDe6ohiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="92555666"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2024 21:18:02 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 swati2.sharma@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 1/2] tests/kms_flip: Update the skip message
Date: Thu, 14 Nov 2024 10:48:34 +0530
Message-Id: <20241114051835.1860727-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114051835.1860727-1-pranay.samala@intel.com>
References: <20241114051835.1860727-1-pranay.samala@intel.com>
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

Debugging would be easier if we had logs available for
test failures and skips. This patch rephrases the skip
message for better understanding.

v2: 
- Remove .c extension in the filename (Swati)

v3: 
- Add changes made in previous version in commit message (Swati)
- Editing hax patch

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com> 
---
 tests/kms_flip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index cbabbe74f..88cd41083 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1896,7 +1896,7 @@ static void run_pair(int duration, int flags)
 
 	/* If we have fewer than 2 connected outputs then we won't have any
 	 * configuration at all. So skip in that case. */
-	igt_require_f(modes, "At least two displays required\n");
+	igt_require_f(modes, "At least two displays with same modes are required\n");
 
 	if (duration) {
 		duration = duration * 1000 / modes;
-- 
2.34.1

