Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69091C5DF67
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 04:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038D910E4F6;
	Tue, 18 Aug 2026 04:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czV+55lF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073E710E4F6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 04:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787026128; x=1818562128;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mlm/1bjo7Bg+EcdDTArJhwaqqlguhiIKlwiMtXjgsEo=;
 b=czV+55lFgGSS3JGPiccwvm+1M2fo4+1oOR5Akn6B81FnfoVlEAFAyVs+
 TK2OptXws242Lz++lnTlwMw9D1qHe5/xeRdp0oSrRELgMgoK1Hb3+f7p+
 HBLcX7NOJKq5ZwTHJ7lknZ+b0+5nOUZxSqfVsB6wRsYhqfT/2mJDgp+5d
 bYi+FzrCAUc/miadB68rWNEnxeWT1cOeBGjuiBuHHb+5auicMlkJo5hnQ
 Oo8rG0jrANTmjvY/HCuu/gD9FBbg/QIBotlWgFUp4tmFULKN0Vu/GF8HD
 THkepqrfULYU8e9Goc6HGMjXmKIfo83ZEeZRk83LIyRhgPPk4CVsROxba Q==;
X-CSE-ConnectionGUID: 8nfEPLJdTHek3GGM8p0ILg==
X-CSE-MsgGUID: jDY9TO8jQcGP3wMzwp4zlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98870371"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98870371"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 21:08:48 -0700
X-CSE-ConnectionGUID: EMnBbh/1TsC3261LtD8joQ==
X-CSE-MsgGUID: OubpMTpiSxe97rzq0uwWXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262477260"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2026 21:08:47 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH v2 0/9] extend GT reset stress coverage
Date: Tue, 18 Aug 2026 04:08:36 +0000
Message-ID: <20260818040845.548727-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

This series expands GT reset stress testing to cover additional
reset/submission race windows using the existing flag-driven stress
harness.

ver2: Fixed rebase issue
      Changed subtest name
     
Nishit Sharma (9):
  tests/intel/xe_exec_reset: Add concurrent GT reset submit stress test
  tests/intel/xe_exec_reset: add sync concurrent reset submit subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-memory-pressure subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-bo-invalidation subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-rapid-cycle subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-destroy-vm-context
    subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-mixed-engine-usage
    subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-pm-transition subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-engine-hang subtest

 tests/intel/xe_exec_reset.c | 216 ++++++++++++++++++++++++++++++++++--
 1 file changed, 207 insertions(+), 9 deletions(-)

-- 
2.43.0

