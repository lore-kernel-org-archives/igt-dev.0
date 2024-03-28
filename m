Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2664CD1283
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 14:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFFD112450;
	Thu, 28 Mar 2024 14:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JcPKwDMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3537112450
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711636519; x=1743172519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q614F3IlmD0yyoGsmZV2J5Cl0x+yVRW5LSxsuvssCZI=;
 b=JcPKwDMXcSnnq5FxYyMWvE1r31/vfNhZBGFkqsvTo5pZXuiZpd0tV9sK
 24Hpjss2Oi9C/UdSj0g7Vroe8g1rs+JNG8kMpkTfANeZWKoPVtQWU+WXV
 ESDwlPAeaBMwpzcebJHt2GUk+KwAVltJwRKYnMtqC1fcoerO0jo/Dk/qo
 i9YBsVGv5/nRvARL2Tf8WLuHcFWrgSXslZAPz8gZuagM865aGg9POpUp3
 IrGOVaXHTPv41XAwFVdT5EPXsJssLRv56cDvbS7tClcwThMtLVrIfuTsY
 pOINJC5HslKhlDAZdybSPSwdhk0n81dz1t7XhsJxOiMd4e6EamXGw4rwU w==;
X-CSE-ConnectionGUID: rn3HVzJ2QIK2V9juUaGa/A==
X-CSE-MsgGUID: HJA82U6+TeuhQQ7RoPzFJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10602453"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="10602453"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 07:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17114932"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 07:35:18 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 5/5] HAX: tests/intel-ci/fast-feedback: do not merge
Date: Thu, 28 Mar 2024 20:15:54 +0530
Message-Id: <20240328144554.1371727-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240328144554.1371727-1-kunal1.joshi@intel.com>
References: <20240328144554.1371727-1-kunal1.joshi@intel.com>
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

Just for testing do not merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..7328238ef 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,10 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_bigjoiner@basic
+igt@kms_bigjoiner@invalid-modeset
+igt@kms_bigjoiner@basic-force-joiner
+igt@kms_bigjoiner@invalid-modeset-force-joiner
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.25.1

