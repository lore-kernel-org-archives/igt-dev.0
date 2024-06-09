Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DD1C27C53
	for <igt-dev@archiver.kernel.org>; Sun,  9 Jun 2024 21:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A6210E2D1;
	Sun,  9 Jun 2024 21:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHJfiR+q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8952510E2C3
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Jun 2024 21:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717967633; x=1749503633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QVe4AKwTmM+Uq92CYOvQqUqbPbZkXT3AnV5GJfnA10M=;
 b=QHJfiR+qrXnnBQOayZP2cP275VtFMbiSjFOpSHDKUGP8nY1zxiP+Y1Gc
 bi9tNsQsvUt34YR3t6CIrXBGLBZoS/dzhXSJ2inDyo8bDO5C9RTQjQLih
 FOQQriTPycjbR6spTPfQ5lhkD4ET2zlhYWZR2lEjaACkQ9Gqow3l3TVd8
 YXeN54t53cPXPt2HjzyUMKVjRK+raN2COonObZz0kWXxBUaGLT8xdPST8
 EIrSV0Jpr5FOZoVIh3PQp+wroo4f82+Zvm3kwINTiUvXwR+2rn/9vav+D
 XlNG4xb3lw/6f9UGAnZG+CdYkFeR5qa8l7TL17U7ALXikus6zEQ3DuMQ3 A==;
X-CSE-ConnectionGUID: fUcJ/+JRQm2ujebGY2RASg==
X-CSE-MsgGUID: kb8DdccXRPqmZF+An9OrNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26037492"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="26037492"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 14:13:53 -0700
X-CSE-ConnectionGUID: 9hH1rs7ZRi6XOcSe2mPcOQ==
X-CSE-MsgGUID: SjS34PjqR1etUmrHCMv0gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="38991052"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:13:51 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 9/9] HAX: do not merge
Date: Mon, 10 Jun 2024 02:55:35 +0530
Message-Id: <20240609212535.868832-10-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240609212535.868832-1-kunal1.joshi@intel.com>
References: <20240609212535.868832-1-kunal1.joshi@intel.com>
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

HAX: do not merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..ac374a4c2 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,6 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_dp_fallback@fallback
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.43.0

