Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9D4EB64DE
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 13:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877EB10E7C1;
	Tue, 10 Sep 2024 13:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Br36NjRp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F58110E7C1
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 13:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725973986; x=1757509986;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jEIvnfu0v5MffjiX09ImCClQP9VOXxIt4blkxN2xCqo=;
 b=Br36NjRpu+xJcmQvutaA9nLHuhFGKt1OuJf2de/sTZSXPfOWRf4Bbk7b
 0prpD4f9bdRY/223d34BACdc0p+kO4aETiaRUSifJ8Ls030jXxOSopiLf
 p1t6raSfIZfkO4uQY5DrXbMBpZCRfxjuGxNO19LNfV/ccyPcvAnOzKuR3
 Uqr7Wt5ynsknBcenoAwdiUAqg5fAkTGR/x3Qm3X+iuGkZfeSny1ViRoPx
 TAEKnm7QXDoW/LCAKuEDRjZuHpns6Jh5sJ61SQ4SVgLnGb3DQ/rIZc3Z0
 htBrau/zIX+fhfgwVSO+MyXp+paFQfWbhcDnXenc148nKBFRY/D6qVEIG w==;
X-CSE-ConnectionGUID: OtAstTNnSLWG1MCQsiJlMA==
X-CSE-MsgGUID: werSyjRARtuANGa4k44Cfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24823250"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24823250"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:13:06 -0700
X-CSE-ConnectionGUID: GeV40lelRbelLmpwGMB1Fw==
X-CSE-MsgGUID: qs8v9FhLTbCwMs1FtEEdYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="66820820"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.145])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:13:05 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 0/4] PSR testing improvement by checking sink status
Date: Tue, 10 Sep 2024 16:12:44 +0300
Message-Id: <20240910131248.334521-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
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

Currently we are not checking panel status in our PSR testcases. This
might lead to situation where panel is not even aware of PSR being
used. Also possible errors detected by a sink are ignored by our
testcase. This patch set is trying to address this.

v2: split patch 2.

Dominik Karol Piątkowski (1):
  lib/intel_batchbuffer: Introduce
    intel_bb_create_with_context_in_region

Jouni Högander (2):
  lib/igt_psr: Add mechanism to check sink status as well
  tests/intel/kms_psr*: Add psr_sink_error_check to PSR tests

Lucas De Marchi (1):
  tests/intel/xe_drm_fdinfo: Implement virtual/parallel exec queues

 lib/igt_psr.c                     |  52 ++++++++++++-
 lib/igt_psr.h                     |   1 +
 lib/intel_batchbuffer.c           |  74 ++++++++++++++----
 lib/intel_batchbuffer.h           |   5 +-
 tests/intel/kms_psr.c             |   2 +
 tests/intel/kms_psr2_sf.c         |   2 +
 tests/intel/kms_psr2_su.c         |   2 +
 tests/intel/kms_psr_stress_test.c |   1 +
 tests/intel/xe_drm_fdinfo.c       | 124 +++++++++++++++++++++++++++++-
 tests/intel/xe_pat.c              |   4 +-
 10 files changed, 245 insertions(+), 22 deletions(-)

-- 
2.34.1

