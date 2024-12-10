Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811C1E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 13:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EAA10E8DD;
	Tue, 10 Dec 2024 13:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8zZlB1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9BE10E8DD
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 13:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733838629; x=1765374629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YTuwKb4QZy8NUPlilVfiw52X/dKznzrzBJZfGF7ydKs=;
 b=F8zZlB1S0Qodq2AJgYAugah6drETSKHQDPmd0SYsCMoZP/xyyfXrrb9l
 MDhEjQ1Sp+I8x2OBtC4lvcIHsRvWnBK7Y1jkStYCrvSL0DYMljbrGHopU
 lApO9YFX/bm3Tua3LiU8SRZk7ylwAXfYQqieKuLFkMXD3dCBF1UhIae2X
 hplf6Aw5OICX59xQro6UE4xl4AOGK9exCrlEJ9kQIowaSRgLfeaYEKXaW
 ZVVlNOK06/XyfgBudhFmTy9t/8az7mHC+wDX5bgitxG2yS8GqgLcm3IdO
 i3dsY4hvOOcwy0Y+LvHBvXRMGo3+739UsFbbus0QzdA4rAsbFBpcFe/jM g==;
X-CSE-ConnectionGUID: 2RZlEHUHRB62PSQpGBj+TA==
X-CSE-MsgGUID: yjv/F7ZkQVStHM4Y+DMRbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34316546"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34316546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:50:28 -0800
X-CSE-ConnectionGUID: LFnQECLGT3m9VGhxcylyMA==
X-CSE-MsgGUID: TFJBBtJOQpyUu7fUioizjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="132804972"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:50:27 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/2] Add sink max dsc slice count lib helper
Date: Tue, 10 Dec 2024 19:23:20 +0530
Message-Id: <20241210135322.2117541-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Lib helper is added to show max dsc slice count helper via
debugfs.

Swati Sharma (2):
  lib/dsc: Add helper igt_get_dsc_sink_max_slice_count()
  tests/intel/kms_joiner: Add igt_get_dsc_sink_max_slice_count()
    constraint

 lib/igt_dsc.c            | 24 ++++++++++++++++++++++++
 lib/igt_dsc.h            |  1 +
 tests/intel/kms_joiner.c |  3 ++-
 3 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.25.1

