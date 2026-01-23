Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DBDD72379
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 11:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4E810E00D;
	Fri, 23 Jan 2026 11:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUJL1lU+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C9410E00D
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769167947; x=1800703947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LLGJNYNdfqr/yB1aaLutGIPN05KY20fxGYj4kMRFQV0=;
 b=nUJL1lU+es62ucCiF/A78eckaIm95CqxqBAJnzst6T2G7cvzZDJkJNOd
 zoUVCJOu4p4j53srkvBsVk3+26nZ8tmwhdscNhUNdnuJa31i7YxV0Flnc
 /BC4aGx3MHilUCgIN9UmwaK9W7qcAO5mSu0Nb3qLXeWSJBmvMHBmgoc23
 Z7Bo4wajmcOcRMcNt5qui57FyTkHpOsr2aibz8INEohVP+dzW1kg4hpfM
 kDHyp+wLctUlvfL6hB+0qfdMU/ZV9ctbzyc/+RPndibC4hycdb2tIdE3r
 owhE3kWnLK7+7D4v69OWyKqG9sP5rgeAlKg3W/WLMmvwjIyOt3+wxdyRe w==;
X-CSE-ConnectionGUID: 5MtMa+FRSOqn17iGw/JzZQ==
X-CSE-MsgGUID: q/nv1XNfTrW8i8epZxJrPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="73008516"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="73008516"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 03:32:27 -0800
X-CSE-ConnectionGUID: Cer/7MBITZOgMtNJzQLzIQ==
X-CSE-MsgGUID: 5K5jjhGCREm1+OLuiTkA4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="229966625"
Received: from prudnick-desk.igk.intel.com ([10.91.34.80])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 03:32:25 -0800
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: [PATCH i-g-t 0/1] xe_eudebug_online: Fix test_interrupt_other wait
 logic
Date: Fri, 23 Jan 2026 12:35:24 +0100
Message-ID: <20260123113523.262544-3-piotr.rudnicki@intel.com>
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

Fix test_interrupt_other to wait for the correct client after reset instead
of the original debugee. Also improves cleanup handling when debugee has
already terminated.

Piotr Rudnicki (1):
  tests/intel/xe_eudebug_online: test_interrupt_other wait fix

 lib/xe/xe_eudebug.c             | 16 ++++++++-----
 tests/intel/xe_eudebug_online.c | 40 +++++++++++++++++++++++++++------
 2 files changed, 44 insertions(+), 12 deletions(-)

-- 
2.43.0

