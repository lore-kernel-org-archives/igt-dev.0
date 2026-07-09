Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF048C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 06:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFFB10E028;
	Thu,  9 Jul 2026 06:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gUuKM44B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E229A10E028
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 06:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783579797; x=1815115797;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oIxZiqz18rHnj548qdwopxmbciaKcCJTjF61Ht//ld4=;
 b=gUuKM44BdvhC+cOg8XAe8BW25uJoDS/c7YpWIj92OM8ZZQUADjCuo6ne
 8PcNdtLOsXrT3q5liLlIiCILCMOCgTg+9zht+RRQR/3JRvqCIi0M7dLST
 0UK5qEWdF62iCfpwNwr0XxRGdJsg9cGz4zIDImxBVkU0fU0y7uJg0DlS3
 ckU55FAmVV5JLDQfdsw7rrMUdpDCWHMU7GeROMqlVVYdTOMXMw/oe1d8l
 9Ciywrzq9gxvjhyxGQ1WSaUOI9/r9T8ImXMHUtIEFXYhVfgAE3IV+BuAh
 /9EggKRwUkJTwmCOywfO5wKXAisVBm2MofqIX/+PE9YGsIa/nZpXxufVj Q==;
X-CSE-ConnectionGUID: MdUcxsNLQSuIZUNvodK1qQ==
X-CSE-MsgGUID: cByy1JIKSm674jYrWvzPyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84129883"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84129883"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 23:49:56 -0700
X-CSE-ConnectionGUID: UIpVkI/8Qvuvr2DpIQEpsw==
X-CSE-MsgGUID: 42K4B2RBRMOmgEkEynFLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258089719"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 23:49:56 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/2] tests/kms_feature_discovery: add HDR,
 VRR and DSC discovery
Date: Thu,  9 Jul 2026 12:28:50 +0530
Message-Id: <20260709065852.3000382-1-swati2.sharma@intel.com>
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

Add display feature discovery subtests for HDR, VRR, DSC and DP-MST.

Swati Sharma (2):
  tests/kms_feature_discovery: add HDR, VRR and DSC discovery
  tests/kms_feature_discovery: Log output count on skip

 tests/kms_feature_discovery.c | 94 ++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

-- 
2.25.1

