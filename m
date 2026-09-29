Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ECECA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 09:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E60110EDC5;
	Tue, 29 Sep 2026 09:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVm352UO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19F710EDB8
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 09:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790672708; x=1822208708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zwf0IeWQSr8M8XYZS+yTivA2Aye1QJBOa20C3E8BRFI=;
 b=AVm352UOBH05C9YqAgOSF6YHPl/wZqc75kFZ2sRhwQmNozucMUyf/Mi8
 568UKTmKvrze0zaATGr7x3bfKuU2VGaQpF8aFJh2Kc8xO140k3dJUaskD
 ToYmajv/iQIf/o+nhEc9kuCut2BAm/tetfIgMJ6N+VPJhbxxkGPWU5x02
 nbAxQ79+kYHONBPA2v5oFBDufFE/NODHgsgLANAbz+OLCzjY5BMCiPwjF
 gOONlQa69ICY2Rc5YlsVlByccCQhjEQD7WKbuAC4CxtOuXRyJC8pI4h3F
 bUnQAvrN7znnqUt7WPDuPGfsZioqeK7bPvmhooiBgTm7cYMkYFM6Iip6z g==;
X-CSE-ConnectionGUID: BpqOjlncRYylVthhubB4Eg==
X-CSE-MsgGUID: /+XcV3E4RFWyIv8O8CH2Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91483772"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91483772"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:05:07 -0700
X-CSE-ConnectionGUID: VQZ1dh9cRCCuSvI59iDxQg==
X-CSE-MsgGUID: YtLIWtJYR3eWccAQvBENdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275462858"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:05:05 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 0/5] Add ALPM Panel Replay and LOBF subtests
Date: Tue, 29 Sep 2026 14:34:45 +0530
Message-ID: <20260929090454.2796967-1-sowmiya.s@intel.com>
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

  This series adds a new IGT test, kms_alpm, covering ALPM (Advanced
  Link Power Management) on eDP and DP 2.1 outputs.

  ALPM lets the display put the main link to sleep during idle periods
  to save power, using one of two source-side mechanisms depending on
  how idleness is detected: Panel Replay (aux-wake or aux-less) or LOBF
  (Link-Off Between Frames). The series adds one subtest per mechanism:

  - alpm-panel-replay: verifies ALPM is reached via Panel Replay after a
    modeset. DP 2.1 only has one legal mechanism here (Panel Replay,
    aux-less ALPM); eDP may reach ALPM via Panel Replay using either
    aux-wake or aux-less. On both connector types, LOBF must stay off
    while Panel Replay is active, since the two are mutually exclusive.

  - alpm-lobf: verifies LOBF can be enabled on an eDP output once
    PSR/PSR2/Panel Replay are disabled, and that Panel Replay stays off
    while LOBF is active. LOBF is eDP only; DP 2.1 ALPM only ever runs
    through Panel Replay, so DP outputs are skipped during enumeration
    for this subtest rather than reported as a per-output SKIP.

  Both subtests read the kernel's per-connector ALPM debugfs
  (i915_edp_lobf_info) to confirm which mechanism (aux-less, aux-wake,
  or LOBF) actually engaged, rather than just asserting a generic
  "ALPM enabled" bit.

  The series is split into 5 patches: the first three build up shared
  test infrastructure (data types/fixture, debugfs status parsing and
  capability/audio preconditions, and the test harness that enumerates
  ALPM-capable outputs), and the last two add alpm-panel-replay and
  alpm-lobf respectively. Each patch builds and runs on its own.

Sowmiya S (5):
  tests/intel/kms_alpm: add ALPM test structure
  tests/intel/kms_alpm: add ALPM helper functions
  tests/intel/kms_alpm: add ALPM test harness
  tests/intel/kms_alpm: add ALPM Panel Replay subtest
  tests/intel/kms_alpm: add ALPM LOBF subtest

 tests/intel/kms_alpm.c | 709 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   1 +
 2 files changed, 710 insertions(+)
 create mode 100644 tests/intel/kms_alpm.c

-- 
2.43.0

