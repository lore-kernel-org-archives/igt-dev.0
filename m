Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A40C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 11:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EE710E5C1;
	Tue,  3 Jun 2025 11:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzsP5Mv2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EFE10E5A2
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 11:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748949004; x=1780485004;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7QvvRIKxF0olS5d1F9GTDdT8kOm6aqpOK5Z0UL95KHw=;
 b=MzsP5Mv2p4b4u51XKYzfd6z9d0Jq8WpYogPxUnFeCGuCkZXSfg8ikau8
 2zNMHNTjxA/sNVWS0U/8BSiBB14h48SMPUvHeMP/PidC3GpMDbJbXXfrl
 Xg0eN5CvIQd9DCvonFD8h8HDU1inRSSBW1mmzOKZD/oxheyu/qTMV2cT5
 efjzffLPbVuKslrf+obszDEBrIwKXNWMwvnjWfDn03xIDEo2Ey/RXf+G1
 83vompsY8vq9Hzv6w9jdJrkCLDs56D4mObKj9wtUHmP1SzRuJjCjI6mMK
 Zqd4ZXzRmGlyDQwv8VrdaaS8sPCtIbHDC/rs0SONFO6nasUkzlBTgiP70 g==;
X-CSE-ConnectionGUID: +jx/DrF+RB+8MRGYLiAYCg==
X-CSE-MsgGUID: kxNAAXObQrGYTicWu6VS1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61603711"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61603711"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 04:10:03 -0700
X-CSE-ConnectionGUID: 7/bkFsORSx+W6neaQLKEgg==
X-CSE-MsgGUID: D7z6HWCRTp6wgSAnkT7Iog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149598270"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 04:10:01 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 0/9] Print/scan formatting fixups
Date: Tue,  3 Jun 2025 11:10:58 +0000
Message-Id: <20250603111107.3170529-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

It was found that when compiling for other architectures,
due to difference in how these architectures recognize
how integers should be printed, warnings were thrown
in print/scan functions.

Fix them up using universal formatters like
for example PRIu64.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

---

v2: various fixes for missing formatters, commit messages, and warnings
for additional configurations. Added cc's. Split patches into more
smaller patches.
v3: Added rb's from v2. Fixed what had been found in v2 review.
Rebased to current HEAD, which added more things to correct in xe_pmu.c
v4: Minor fixes.
v5: Reworded patch topics, added rb's

---

Jan Sokolowski (9):
  lib/amdgpu: fix print formatting for 32-bit compilation
  tests/amdgpu: fix print formatting for 32-bit compilation
  lib/igt_nouveau: fix print formatting for 32-bit compilation
  lib/igt_perf: fix scan formatting for 32-bit compilation
  lib/xe/xe_sriov*: fix print/scan formatting for 32-bit compilation
  tests/intel/xe_sriov*: fix print formatting for 32-bit compilation
  runner: fix print/scan formatting for 32-bit compilation
  tests/intel/xe*: fix print formatting for 32-bit compilation
  tests/intel/xe_eudebug: fix print formatting for 32-bit compilation

 lib/amdgpu/amd_deadlock_helpers.c        | 19 ++++++++++---------
 lib/igt_nouveau.c                        |  2 +-
 lib/igt_perf.c                           |  3 ++-
 lib/xe/xe_sriov_debugfs.c                | 18 +++++++++---------
 lib/xe/xe_sriov_provisioning.c           |  2 +-
 runner/executor.c                        |  2 +-
 runner/settings.c                        |  2 +-
 tests/amdgpu/amd_freesync_video_mode.c   |  4 ++--
 tests/amdgpu/amd_info.c                  |  2 +-
 tests/amdgpu/amd_ras.c                   |  2 +-
 tests/intel/xe_compute_preempt.c         |  5 +++--
 tests/intel/xe_eu_stall.c                |  4 ++--
 tests/intel/xe_eudebug.c                 |  4 ++--
 tests/intel/xe_exec_capture.c            |  9 +++++----
 tests/intel/xe_exec_system_allocator.c   |  8 ++++----
 tests/intel/xe_oa.c                      |  6 +++---
 tests/intel/xe_pmu.c                     | 16 ++++++++--------
 tests/intel/xe_render_copy.c             |  2 +-
 tests/intel/xe_sriov_auto_provisioning.c |  6 +++---
 tests/intel/xe_sriov_flr.c               | 12 ++++++------
 tests/intel/xe_sriov_scheduling.c        |  4 ++--
 21 files changed, 68 insertions(+), 64 deletions(-)

-- 
2.34.1

