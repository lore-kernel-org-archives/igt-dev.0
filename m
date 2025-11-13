Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5E9CD6E7D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 15:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5543D10E859;
	Thu, 13 Nov 2025 15:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/qHtOWo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6795E10E859
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 15:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763046777; x=1794582777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iBtd7mdhXp3l/3NlIrW+dX35gGcUnyDjztiLophgfQc=;
 b=j/qHtOWoWyFNz+QZYOzIlPrvWF5vczhkF/9sz47QOXYHMqWeZKLZXGB/
 xoCD2UR6R3kKJg3dd1yMTaeO1e0IjqnvLJuGlPKazfGkiBEYF20RgmWx2
 mYUQ0RYhL1EBUdkNaj5AudJwSlS+PYgjFiN4YGnYku9+C8hj5Ec3IuO7i
 5cgzq9ElhMMI0V+VxYG3FSkACcuHkZNPhM+p71kHeB8j4jBKtYhlEY15f
 UH/NFaiYcuukF3N6AzNjGkJi+xdOlRvUFS4k8Prk5Fg0hfYB7YC+VSTov
 KypKOGDRT1qE1yyKG45s2RBAJeIoD9U8E74zmHEWuVAdp/VJ/xwKEQ8TY g==;
X-CSE-ConnectionGUID: +qyBLxaeQlirJ2Ubbuhtgw==
X-CSE-MsgGUID: xQIfxeM6SFGJ5jwLYH4oEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82759882"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="82759882"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 07:12:56 -0800
X-CSE-ConnectionGUID: G0lStSv4Sr24Ky/+DWarGA==
X-CSE-MsgGUID: ADVPuND6SoqC9+wREQehQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189167378"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:12:53 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, anshuman.gupta@intel.com, matthew.auld@intel.com,
 kamil.konieczny@intel.com, nidhi1.gupta@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v17 0/3] Port kms_prime for xe
Date: Thu, 13 Nov 2025 20:36:43 +0530
Message-Id: <20251113150646.945848-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add support for kms_prime for xe devices.

Bhanuprakash Modem (1):
  tests/kms_prime: Add XE support

Santhosh Reddy Guddati (2):
  tests/kms_prime: Enable basic-modeset for xe
  lib/igt_fb: Apply NEEDS_VISIBLE_VRAM in missing igt_fb

 lib/igt_fb.c      |   3 +-
 tests/kms_prime.c | 223 +++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 195 insertions(+), 31 deletions(-)

-- 
2.34.1

