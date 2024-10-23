Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DB5CDDE66
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 10:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C3010E7AC;
	Wed, 23 Oct 2024 10:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9x13+vM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724E310E7AC
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729680760; x=1761216760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YL8wMNkbwaeORHKefcw+X1gzN9fWu15Kp8NsmQhSPXA=;
 b=J9x13+vMRuAZW7jZ5dqYHtjuB6ZoFGbgzMJBYN4h2cEav3jYMzdcAWPr
 qt+9xwoCEegFYjlPPRNhAz1wZ/OLwvD1+qTmMyKTp8K6EvHHw99K+X50X
 MZkIQboVpBTtlT4ZoqRSSJSGXPmSy6PAemc71Og1ZG3P4/dzYoOShjeKL
 bvItht22Z1sMZfZgkmCX0oVOiL76h6E1pSpQa9bGSmDkvKd6bPR8qU0rk
 ZBgavRM8bn/8S4YLVVvyux/BZ1PkTm6Wd3vw6loSkpwNSe164IW5mLymL
 4ay/0fKIQkig4ItOtrjNvLy+n0HX/wN/VKnizX2ndQTymBvG+cisujcuj g==;
X-CSE-ConnectionGUID: 0o+8lRjmRbeZ9g8Neo8Z0g==
X-CSE-MsgGUID: kkUu0l7XSZWsktTL7hQe3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39809144"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39809144"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 03:52:40 -0700
X-CSE-ConnectionGUID: V4l4Kq1dQGG1uwN6ge6NTw==
X-CSE-MsgGUID: luTZT3tjRpyOWWNDHIYCvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="79828685"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 03:52:38 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: gsse.core.kmd.power.telemetry.india@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v5,
 2/2] HAX: Add Coarse power gating tests to fast feedback list
Date: Wed, 23 Oct 2024 16:16:04 +0530
Message-Id: <20241023104604.2145733-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023104604.2145733-1-sk.anirban@intel.com>
References: <20241023104604.2145733-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Add cpg tests cpg-basic and toggle-gt-cpg to xe-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..2acb6ee0d 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -159,7 +159,9 @@ igt@xe_mmap@cpu-caching
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
+igt@xe_pm_residency@cpg-basic
 igt@xe_pm_residency@gt-c6-on-idle
+igt@xe_pm_residency@cpg-gt-toggle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-- 
2.34.1

