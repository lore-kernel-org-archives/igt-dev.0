Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E522FD2D0FD
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 13:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918C710E2A6;
	Tue, 13 Jan 2026 13:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmvdKPQB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA91210E2A6
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768311081; x=1799847081;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N816f2UdGdzXJHyhYx8YclH6s26nm/xP486J6c+P3Cc=;
 b=dmvdKPQBOcbDyZ+fVGDtXTREDRq0XAvzuGJ443AWtzHvaKoeuVr2Ql3c
 zrTeA2ZPURU4gm/rPTyKlAShiCZYW/ibqPjANCgY4ahmx42MtROrtdA84
 Muh9N4GBUrmaIEosNdqnOVUykcjoI9huE3oJ6Z8r4c7C0yZS8hf/m8REX
 VgcQZTyeH42oLC4pmFCi4OBvEU6049Epm1itcrCstW3nHu0f2zwHoF5EO
 dHdeNo+uejqEQPceMCiLBt1zljPiro+HdVUo/0NFnlJmpb2dc7r73Q1XG
 cbbU5OFTIILHpG2y85IZJe+GlwGxfCNo9FSd0uMy9uCh9wzRIe+lgtH0p A==;
X-CSE-ConnectionGUID: YmWwuqtZTwqfP2CVCNybUw==
X-CSE-MsgGUID: GWV0vEokT2CYUdH6o0V4jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69752839"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69752839"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 05:31:21 -0800
X-CSE-ConnectionGUID: XDWLbBSPR5yJAOGDrQtWOA==
X-CSE-MsgGUID: oJYNjqfEQE+oyya69ZiM/g==
X-ExtLoop1: 1
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.70])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 05:31:19 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 0/2] DC5 DPMS/PSR suspend/resume validation test
Date: Tue, 13 Jan 2026 18:56:37 +0530
Message-Id: <20260113132639.13411-1-mohammed.thasleem@intel.com>
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

This test validates dc5 dpms/psr before and after suspend/resume cycle.

*** BLURB HERE ***

Mohammed Thasleem (2):
  tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume validation test
  tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume validation test

 tests/intel/kms_pm_dc.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

-- 
2.25.1

