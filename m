Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A439C9830B
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 00:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B242310E264;
	Sat, 17 Jan 2026 00:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7OJmJER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE4810E26B
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 00:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768608338; x=1800144338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BmcBf0OC1wHnPtThOvyvmw4vRaQKul5YMci/fyrKqso=;
 b=f7OJmJERDnJZcgJOM9GKoxZknbqotJ8CkRFRngfEndlBIfzF8AaX/nWH
 rxEWcMY0F+IQ4eAQTRtb7epnLevLygBvOziT3eU0cK0Kz0ZxBoc4D6c3A
 nffwAvrkuCFrEjPXfDSlfd5gt3+TBAGpquIS+FWhz+BnIDXVOMhtK+7re
 tYakvsrK+iV5l59rcCvmgsNAltMTwUwxU8k/7SNNiRpGAvtgQFCwmr4Mv
 h6rh+qcPMJ4ez10c6g38yzlB5IWNaWtwRf/o6f4raXO4XWrlL8OrarM4+
 zjTNMnF824aSmxLJ9GAayTRXsd9stlgpPI3GLkAqQmA140NYX1H6fQq7a w==;
X-CSE-ConnectionGUID: km0xLy/pT7ml6JF0dR6AKg==
X-CSE-MsgGUID: hNaE79iHR2SP7tnvgmgX6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73556359"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="73556359"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 16:05:38 -0800
X-CSE-ConnectionGUID: HCus7y5mTTS64j4QIllkmg==
X-CSE-MsgGUID: NXnb7IdDQh+X17O26MntMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="210237835"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.54.82])
 by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2026 16:05:37 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/5] lib/xe/xe_legacy: Cleanups in xe_legacy_test_mode()
Date: Sat, 17 Jan 2026 00:04:51 +0000
Message-Id: <20260117000456.26207-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115222938.330490-1-shuicheng.lin@intel.com>
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
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

Shuicheng Lin (5):
  lib/xe/xe_legacy: Drop duplicate BATCH_DW_COUNT comment
  lib/xe/xe_legacy: Init LONG_SPIN ctx_ticks after open
  lib/xe/xe_legacy: Assert fd when CLOSE_FD is set
  lib/xe/xe_legacy: munmap BO before closing fd
  lib/xe/xe_legacy: Simplify base_addr in reuse loop

 lib/xe/xe_legacy.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
2.34.1

