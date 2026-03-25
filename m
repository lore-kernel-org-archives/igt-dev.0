Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3C2109C046
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 16:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E4210E828;
	Wed, 25 Mar 2026 16:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyjqK7s1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C680610E822
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774457587; x=1805993587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WLmNeRZDwAKhToKxgejEHPXpTPLIxeaM+QK+IIUJeGE=;
 b=nyjqK7s1j37PPEZhv4EbntSRdE7hnnrTWM9j5C69avifjlRDX/dE+Mpq
 5dmbPaPTaznrS+eP5/29mxI/vyLLwv+G+HJRNrFcMAn3Hpj0NycA4Wids
 pbSZv+0pc+sjdfOY/CAqEKZFDyrk8XICJb8FduLotVKeDskdcBsMpcZqr
 31QtFBoBdrBh6SZKoD4uxiqgum6SIX6FvKO6yX0wemHmcZE8xgDL8q6bZ
 WQuGO+uq5lyFtCWA1zCzNjKqvQFC7XYZdrF6EznZXhinpCJB1PIHqkiS3
 ezekvIKKsvLGTRGoDwcwSqrmlrhyWBQFHJK24Eboqt4cbnI6RPwVrj1D4 w==;
X-CSE-ConnectionGUID: nvKdCND7Tc6BCWEUkSO2IQ==
X-CSE-MsgGUID: cw17oKz/TrSWC03nyHQ80w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="92880599"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="92880599"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 09:53:06 -0700
X-CSE-ConnectionGUID: D3hiR3y7Q5uNBbYnwNJyHg==
X-CSE-MsgGUID: bgXkbkfyQK6Dpo1uuY541w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="224991842"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 09:53:05 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 0/4] Fix PSR handling for multi-eDP systems
Date: Wed, 25 Mar 2026 22:21:36 +0530
Message-ID: <20260325165140.115520-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

PSR handling in a few tests currently relies on global checks by
passing NULL to PSR helper functions. This works on single eDP
systems, but breaks on platforms with multiple eDP panels where PSR
capability can differ per output.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Jeevan B (4):
  tests/intel/kms_fbc_dirty_rect: Use per-output PSR check before
    disabling
  tests/kms_vrr: Avoid unnecessary PSR disable
  tests/intel/kms_psr_stress_test: Select PSR-capable output
  tests/intel/kms_pm_dc: Scope PSR handling to output

 tests/intel/kms_fbc_dirty_rect.c  | 14 +++++++++-----
 tests/intel/kms_pm_dc.c           | 26 ++++++++++++++------------
 tests/intel/kms_psr_stress_test.c | 14 +++++++-------
 tests/kms_vrr.c                   |  6 +++---
 4 files changed, 33 insertions(+), 27 deletions(-)

-- 
2.43.0

