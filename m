Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B729D4336A
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 14:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20A310E1D9;
	Thu,  7 Nov 2024 14:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHElE8L0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFD610E1D9
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730990099; x=1762526099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hmbJsRFb9GygInZlUaWHOWUoKEZharIUyhC6iNT5yV8=;
 b=gHElE8L0ZAkgawMogXvwR6hqbRz5C69+av5ho+n/BkU2j/EAQoNPBjtD
 ECTSUSNBvKmhq5BYHdSXkAEqqvAwPLN9pBYIRS5mfh1D3+DbMN1ZcddLj
 UkklhgRqB7N5U8XalyG2LgXgKOmlWQKxzOeGZpDaEZB1bD6srsd42BBaH
 px2TAEXUCmC524Gw4/0oOvUsGDbDjzD1+qYMBQ0TlBhcjz3LcY7DxwYB6
 72m6U/zvrxKLeQtBhId/7EI2Ydd1bO/guLEqDfRJkwsshTsGJepxalA6l
 Rx6+B1AisSOgPw/3AZEu9wb3v2WULMrWQzApTSrvwiObFh96JhCtI3i7D g==;
X-CSE-ConnectionGUID: VdKRTJwXT2mmlWzRjSV9BQ==
X-CSE-MsgGUID: bSsoauDhTxqBRKtviKsBiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="56231378"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="56231378"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 06:34:59 -0800
X-CSE-ConnectionGUID: /bedlyetTwqzlfljdZaE0Q==
X-CSE-MsgGUID: 8y961L2BTRuJPB4mXW4H5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="84632512"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2024 06:34:58 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH 0/2] tests/xe_spin_batch: Add spin-timestamp-check
Date: Thu,  7 Nov 2024 20:03:20 +0530
Message-Id: <20241107143322.348545-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

move the spinner related functions to lib
check the ctx_timestamp register post gt reset for each engine.

Pravalika Gurram (2):
  lib/xe/xe_spin: move the spinner related functions to lib
  tests/xe_spin_batch: Add spin-timestamp-check

 lib/xe/xe_spin.c            | 118 +++++++++++++++++++++++
 lib/xe/xe_spin.h            |  23 +++++
 tests/intel/xe_drm_fdinfo.c | 185 ++++++------------------------------
 tests/intel/xe_spin_batch.c | 118 +++++++++++++++++++++++
 4 files changed, 288 insertions(+), 156 deletions(-)

-- 
2.34.1

