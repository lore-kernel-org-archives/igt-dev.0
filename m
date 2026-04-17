Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A693AF436BF
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 18:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B41A10EA81;
	Fri, 17 Apr 2026 18:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4fLlYzw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DD910EA48
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 18:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776449523; x=1807985523;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y3PR4yzJKutbr52xaK/cliXOVAXO87s9caf/Csqwfns=;
 b=W4fLlYzwSE+zfl3qQdUJINDPAcqz8REkvqVoGgU7PWG8CicYL2SLG0Bn
 XBwAZy+sqrLr/43nNUdmBOEhhqqq7kwpP57PRCNiwynqW/XurOTTEgTrW
 c2PKcUW75jqpBFcvhXUjQYUiZzeoAVvAIh/lr3vUBaiJL7AEM8AI19CYq
 Fdty4njnBV2wJhysNAKQp/gTjLZKFYn6DTkepfOK3Ckm8m7JzMo8PovPC
 xsVjHk92EleYLPMD20Kyyy3ESSEBKqciMCPcRlfdppZyq/E+3JCrxjNRY
 KIMKQ+ICg6SodKe5R1oGl7OulvMsGa5UzCp6baxqG7q/cE1LQCDwQ1ael w==;
X-CSE-ConnectionGUID: ya1eg54RQhOOv86HzAYGSg==
X-CSE-MsgGUID: 0Hm/K2rMQrKC4yB7dmyELw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77480834"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77480834"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 11:12:03 -0700
X-CSE-ConnectionGUID: 1k84YJ2uTMyEvZiLt+Vx2w==
X-CSE-MsgGUID: cF4e1nP8THeDnyxlnkVu5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="236070101"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.166])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 11:12:01 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/2] Add assert for pointers compare and fix armhf
 compilation
Date: Fri, 17 Apr 2026 20:11:55 +0200
Message-ID: <20260417181157.177299-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

Recent commits break amrhf compilation as could be seen on GitLab:

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/97703144

with errors:
../tests/intel/xe_madvise.c:201:35: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  201 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
      |                                   ^
../lib/igt_core.h:796:33: note: in definition of macro ‘igt_assert_cmpu64’
  796 |   uint64_t __n1 = (n1), __n2 = (n2); \
      |                                 ^~
../tests/intel/xe_madvise.c:201:2: note: in expansion of macro ‘igt_assert_eq_u64’
  201 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
      |  ^~~~~~~~~~~~~~~~~

This series introduces new macro for pointer comparision
and uses it for fixing compilation for armhf platform.

v2: add cast to 'void *' in macro (Zbigniew)

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Arvind Yadav <arvind.yadav@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  lib/igt_core: Create asserts for pointer comparision
  tests/intel/xe_madvise: Fix armhf compilation

 lib/igt_core.h           | 42 ++++++++++++++++++++++++++++++++++++++++
 tests/intel/xe_madvise.c |  4 ++--
 2 files changed, 44 insertions(+), 2 deletions(-)

-- 
2.53.0

