Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552C5C6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 09:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51B81125FE;
	Fri, 29 Mar 2024 09:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwauF3lr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C9F112600
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 09:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711703825; x=1743239825;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eo5VrDeWXwkZl4pPN8+Bs3eCy1VjxDX7yr1OhILlcyU=;
 b=OwauF3lrWyGLMoy1ny3kuhOSXWDQp5jeI/xL44ZkNXKr81TplZCZPxyc
 pm7VHRs5zUmnlQDlOQBlMfOJiSNYe4e4mtzytt6Cvq/XItUQnfcmrLPrE
 HdsMyCHlIqkK/kshAw4kH2zBRjD9nIhuzxxNnYNDND9UP983UU+uRbEEu
 a2jRAz9FFSFr9fn2LrELEpImIFvrEzRauUO5QN5/2caftQX6FdAPJmIEF
 klbrRizgoDHag8bmsmvIo8EIt810sXp3sBg2sAmBIA2U2uHKtKURxLryo
 +op0WH6OFLJi3RZJprkWW4dZTCYQTtvxxzNkcoR436CTUwYzx5t80JTCt Q==;
X-CSE-ConnectionGUID: 2YsD8jqPRNuco6Tw0kv4dA==
X-CSE-MsgGUID: 2RE5kH/GQNiS0lkm0jI77g==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="10673881"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="10673881"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 02:17:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="16896933"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.67])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 02:17:02 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/2] Add surface flat ccs check
Date: Fri, 29 Mar 2024 10:16:53 +0100
Message-Id: <20240329091655.1347862-1-zbigniew.kempczynski@intel.com>
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

Instead of guessing if surface is compressed use flat ccs check
function.

Zbigniew Kempczyński (2):
  lib/intel_blt: Add functions which extract and check object ccs data
  tests/gem|xe_ccs: Check surface ccs data instead of naive comparison

 lib/intel_blt.c       | 116 ++++++++++++++++++++++++++++++++++++++++++
 lib/intel_blt.h       |  11 ++++
 tests/intel/gem_ccs.c |  15 ++++--
 tests/intel/xe_ccs.c  |   9 ++--
 4 files changed, 142 insertions(+), 9 deletions(-)

-- 
2.34.1

