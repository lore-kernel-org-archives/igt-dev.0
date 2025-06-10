Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3642C5B543
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 13:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E05510E278;
	Tue, 10 Jun 2025 13:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPQvjSkU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFFE10E278
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749563602; x=1781099602;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xlkcEUbAunPRPGTd+XFdyQTB2vA6s7/z4xe6QDmY/YA=;
 b=YPQvjSkU63eLgo6qsEDxiTx0N5b2iwlXVB78v/1HeBjDoi1q+BlodiJ6
 U8RDmX2ttmAUM4t4WNYssQvYt/MLkazG3qvLwQDyv7xJ3DDxC18r9UFM9
 RkIV5YYDr7A4ZXwZjejHhLPcHr+jBLtE1KX7pCDxlA2Hh3zzACjbKx9UH
 vJTqIZ8jxGdMqVcxTyH9CnGsBXky27Z1TtpdGQSGwuIOPYE4lLRtoCYQW
 PA17ya6acLrFSfp7awttSEmLTekZ1ebVojFtNjFFfWZ4+a6gfl6ro+gfj
 jXZ/VTReclKT/QaJIpVj7tOwVH3c5Wy7bnVP2sgHHiQFzK6rlfiQDM0W7 w==;
X-CSE-ConnectionGUID: fHie3tr4TLuPKupjoDSR6w==
X-CSE-MsgGUID: do3LlFNbQzKGu3RdMgmQCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62329809"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="62329809"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 06:53:22 -0700
X-CSE-ConnectionGUID: MdJgIk8CRIW9yslXdQJ4xA==
X-CSE-MsgGUID: R9UhWsJYTIuLLExq5lFGlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="146751438"
Received: from unknown (HELO DUT2943PVC.iind.intel.com) ([10.190.215.47])
 by orviesa006.jf.intel.com with ESMTP; 10 Jun 2025 06:53:20 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 0/2]
Date: Tue, 10 Jun 2025 13:53:16 +0000
Message-ID: <20250610135318.90430-1-nishit.sharma@intel.com>
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

IGT subtest eu-busy-10-sec schedules and execute compute workload on
multiple CCS engine instances. To check per engine instance is utilized
graphical representation of engine busyness is required. Functions
related to Graphical respresentation are integrated in IGT test xe_compute which has
dependency on Patch tools/gputop/gputop: Add per-device engine activity stats in GPUTOP


Nishit Sharma (2):
  tools/gputop/gputop: Add per-device engine activity stats in GPUTOP
  tests/intel/xe_compute: Add Compute workload Scheduling and Display EU
    busyness

 lib/igt_device_scan.c    | 128 +++++++
 lib/igt_device_scan.h    |   1 +
 lib/intel_compute.c      |  29 +-
 lib/intel_compute.h      |   2 +
 tests/intel/xe_compute.c | 755 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 tools/gputop/gputop.c    | 638 +++++++++++++++++++++++++++++++++
 tools/gputop/meson.build |   6 +
 tools/gputop/utils.c     |  51 +++
 tools/gputop/utils.h     |  64 ++++
 tools/gputop/xe_gputop.c | 378 ++++++++++++++++++++
 tools/gputop/xe_gputop.h |  62 ++++
 tools/meson.build        |   6 +-
 13 files changed, 2113 insertions(+), 8 deletions(-)
 create mode 100644 tools/gputop/gputop.c
 create mode 100644 tools/gputop/meson.build
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h
 create mode 100644 tools/gputop/xe_gputop.c
 create mode 100644 tools/gputop/xe_gputop.h

-- 
2.43.0

