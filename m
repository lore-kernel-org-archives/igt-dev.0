Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A6BF364C1
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 20:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2318710E873;
	Thu,  9 Apr 2026 20:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aemOtawU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156FD10E052
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 20:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775767024; x=1807303024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pn2qjxuxqmzot8SKY4LPbba2A2z5Z8XGxJpn4VqCh8g=;
 b=aemOtawU822u3ugppZJC6Wa4/bGCsXtBWDXthZOBtgPnFpR+sHl1U/Nt
 RJ745kYI4OkmSA0xz3OwCmaxMaJWqUhySi7kUR6O4mtgFRGcTkGOGwLqo
 D74XearVYEugznnSuBqBNjVcqrwUKyXZo+7Vdq67v8PHgFuvXd7U05v3o
 F5aPucEqEUSLcq4B4RU7kdsXFfI5kokUFLRNti0UqMYcQyGH8vCOiZT2l
 TbW53mph3HBsQuybiXBE5mME335o2AisTrH1ZcvpF8Ll++T+Yuw54PU7K
 9XbAK4urjs9HFMU4Hpq66ialmvxj4oKVtJFoaA//VnfjyVcWAfjoVJ5vi A==;
X-CSE-ConnectionGUID: 2uVDgfa1QOSRm/pqc04xnQ==
X-CSE-MsgGUID: 7Oah7D0OTVWZHEoKjkcBbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87858518"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="87858518"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:04 -0700
X-CSE-ConnectionGUID: CrQZV5tXTfqcz7wbznpOTA==
X-CSE-MsgGUID: 6b3iVdoGSfSKWuDzBkm2/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="232950726"
Received: from dut4344arlh.fm.intel.com ([10.105.10.107])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:04 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: niranjana.vishwanathapura@intel.com, igt-dev@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t 0/3] Add test coverage for multi queue reset
Date: Thu,  9 Apr 2026 20:36:58 +0000
Message-ID: <20260409203702.4350-1-stuart.summers@intel.com>
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

Add test coverage for engine and GT reset scenarios in
tests/intel/xe_exec_reset.c. This includes both the compute
mode and legacy cases and covers primary and secondary queue
resets and CAT faults.

Apoorva Singh (1):
  tests/intel/xe_exec_reset: Add multi queue subtests

Stuart Summers (2):
  tests/intel/xe_exec_reset: Add a comment about return for syncobj wait
  tests/intel/xe_exec_reset: Add checks for hanging queue wait_ufence
    return

 lib/xe/xe_legacy.c          |  86 +++++++++++--
 tests/intel/xe_exec_reset.c | 233 ++++++++++++++++++++++++++++++++++--
 2 files changed, 295 insertions(+), 24 deletions(-)

-- 
2.43.0

