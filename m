Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ECCD35178
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E7710ED37;
	Wed,  1 Apr 2026 11:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJKs9Gs+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4489E10ECE4
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775043342; x=1806579342;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Eweh+sMjg96DylwFCvskAGe+MOkupG5mi2oD2Xeovpg=;
 b=eJKs9Gs+ImmGp3l3e9nH4D8LFeq4AbR1npHuSbh3TX0Tmxks3nhTNzb2
 2j1oAQilCVd1E+m18gEnVRKBvvjYuQc/LZdJBR/bMk1jGKqwzHdhD7A3i
 I49gTPWmGTW6TAia9SoQx/QQA3uPPZ6w7mymTaELL8pcnoY90d3FpSGQz
 jbN5K3CxXN2fIBAI03dbElAHcXclf2nBNjZmPcsmD//gJOKszIi13xNLy
 nJHm4HVXhOblVMJZTVTDz141cVyli+4dq4UcWjCiJ4lNb/ynL7dGSvtuF
 CgqfLheUskJomU21t77E0fWZp+ZTFvuNXjoTh1ypnj5G1qMDpXTD+NbEv w==;
X-CSE-ConnectionGUID: KFeayj0tRCuRqMs59T1usQ==
X-CSE-MsgGUID: 44gurL1VTOy773x9eZKrew==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78669795"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="78669795"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:35:42 -0700
X-CSE-ConnectionGUID: TcOKLhL0QCi9hz88FNfBCg==
X-CSE-MsgGUID: OuKU5l3YS7yVt6mgLZHl7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228263464"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:34:21 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/6] tests/kms_pipe_crc_basic: add mst suspend-resume
 test
Date: Wed,  1 Apr 2026 17:25:36 +0530
Message-Id: <20260401115542.1074290-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

This patch series introduces MST suspend-resume test
to kms_pipe_crc_basic. The MST test validates there
is no corruption/blank out across suspend/resume cycles
for all possible subsets.

Kunal Joshi (6):
  tests/intel/kms_mst_helper: Add kernel-doc for existing function
  tests/intel/kms_mst_helper: Add helper to check for MST outputs
  lib/igt_kms: Fix max_non_joiner_mode_found
  lib/igt_kms: Export get_max_pipe_hdisplay as public helper
  tests/intel/kms_joiner: Require boundary mode for basic-max-non-joiner
  tests/kms_pipe_crc_basic: Add MST suspend-resume test

 lib/igt_kms.c                |  25 +--
 lib/igt_kms.h                |   1 +
 tests/intel/kms_joiner.c     |   4 +
 tests/intel/kms_mst_helper.c |  24 ++-
 tests/intel/kms_mst_helper.h |   1 +
 tests/kms_pipe_crc_basic.c   | 318 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   3 +
 7 files changed, 364 insertions(+), 12 deletions(-)

-- 
2.48.1

