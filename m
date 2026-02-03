Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85434E83057
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 06:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB18110E54F;
	Tue,  3 Feb 2026 06:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZVsp3VE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E72D10E307
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 06:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770099059; x=1801635059;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EpUD6/CzERnCYFIl44i2r9jvWgHm9IrmFCkdSHcTg34=;
 b=YZVsp3VE0V4bxgmv0Oc3IUcRvi+/5VTkIVK0H0ukwNXU0ZqKvXd0ZSGH
 ejMqAtyHEAANBwNF3RBaX+5j5w/NuJfA53Llc6ScY9OOEUqI9Atc3ZtDW
 iDFl6XwIJXfKLW3qPxHCUdZ5SVj2OrmsIyTRpiUURtScTfw1NQTsubFOv
 9CujHqpYQjEb5MyCByZXubd7dmT/2FtD3Ip50yN5E8WRXszA6fi09IWWA
 9Xauff/5vuFFF9Aw6uV8/aE/AuJvnoADFWLvQ1g824P6SjmQToUO2dYZ2
 Vg/2ef8mVgXfnmXLqjVqO18OrAF5xfmsqAnCUy3GKdkBOq5me5sBtQw2c A==;
X-CSE-ConnectionGUID: Lm96CduOTpWWCO4MbQaxLw==
X-CSE-MsgGUID: WF4TsfXZRsCLJbmMDxnWsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82000699"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82000699"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 22:10:58 -0800
X-CSE-ConnectionGUID: waKZm1kmSA2DUzZyscoTFw==
X-CSE-MsgGUID: dRAfiYGnT7mtHLr5FoDq3g==
X-ExtLoop1: 1
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.186])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 22:10:56 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 0/3] Run PSR2 and PR tests on panel supporting both
Date: Tue,  3 Feb 2026 08:10:33 +0200
Message-ID: <20260203061036.21482-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently we are running only PR tests on panel supporting PSR2 and
PR. Running PSR2 tests as wel on such panel would provide us valuable
information. This patch set is addressing that.

Also some other improvements is made and code is simplified:

 - drop some complexity from fixture for detection of working PSR
 - instead of "not run" "fail" on setup where PSR is broken already
   before kms_psr2_sf testcase is executed.
 - drop et_flag from data_t and detect need for Early Transport check
   on fly.

v2: patch 2. rebased and commit message updated

Jouni Högander (3):
  tests/intel/kms_psr2_sf: Drop Early Transport flag from data_t
  tests/intel/kms_psr2_sf: Check pipe and output validity for Selective
    Fetch test
  tests/kms_psr2_sf: Allow testing of both PSR2 and Panel Replay if
    supported

 tests/intel/kms_psr2_sf.c | 240 +++++++++++++-------------------------
 1 file changed, 79 insertions(+), 161 deletions(-)

-- 
2.43.0

