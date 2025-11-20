Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC4FCF857F
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 10:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9AE10E741;
	Thu, 20 Nov 2025 10:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCy8xaqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B854610E73F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 10:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763634516; x=1795170516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/dEuRBXe8RKiJeLAFzBjIA6hU+XKm/zvdJA2bEu25jU=;
 b=CCy8xaqrQSPeA4D27BvqZLZVmzbU3uCDdBHH6p1YDb8QjSDce0Y77tbS
 ASiac91Xuvk9DbBz9V/e1HS3HQgL5LZBh8EomE/caPEjKQea4H+ZdlsSI
 1KhLsKn8oJ8OR9zNDQh7N0P+q6nxPRoj8MIfYYb6FRm9nt24RTHZZ8JDX
 dW/3zxqQFLdxbJv1SylK0pSRlzqUo5YwD9CxowV89w+ZIAXyCPuoTzLNw
 nPXFz6Oqv2Sp55A6sjxhcur2hB6CKwcY64Eok7nSapZH7nYpEL4txQKza
 LCFC2btd/uPx2hn4IImsdBO+oi3FZtAPZ7lfbU4aFHbRPOZdmGF8wVmCa g==;
X-CSE-ConnectionGUID: VpaYacscTjOSmrGBCIbYNg==
X-CSE-MsgGUID: r+rU3WM8Sc6mIG/BlyObGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65736286"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65736286"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:28:36 -0800
X-CSE-ConnectionGUID: YyehtwaTRZyV6ZuJ+uFCig==
X-CSE-MsgGUID: dpJuG4jMQoqoMc1qHWHRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="221966475"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:28:36 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/3] intel-ci: Add sharpness filter tests to i915
 blocklist
Date: Thu, 20 Nov 2025 16:05:31 +0530
Message-Id: <20251120103532.1055144-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251120103532.1055144-1-swati2.sharma@intel.com>
References: <20251120103532.1055144-1-swati2.sharma@intel.com>
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

Blocklist the new sharpness filter tests for i915:
 - kms_sharpness_filter
 - kms_chamelium_sharpness_filter

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/i915.blocklist.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index 083b660c7..96d69ca79 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -172,6 +172,8 @@ igt@kms_frontbuffer_tracking@plane-fbc-rte
 igt@kms_pm_dc@deep-pkgc
 igt@kms_vrr@cmrr
 igt@kms_fbc_dirty_rect.*
+igt@kms_sharpness_filter@.*
+igt@kms_chamelium_sharpness_filter@.*
 
 ###############################################
 # Test was written with the idea that edid read shouldn't take an
-- 
2.25.1

