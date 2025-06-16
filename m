Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9CAC71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 14:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8A910E3AF;
	Mon, 16 Jun 2025 14:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGYI4kyx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD41710E3AF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750083788; x=1781619788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pHW5ElSJQONmO0Hmm0d29YZySBhjjiL2if1aU2Vjw1Q=;
 b=KGYI4kyx2ZoQMeRDboHyUVWrH/JdJBpfLdz+RgeNbUMzCVBq9sDlsqix
 EQZKAxey4ijk+vhTwme0o4j3YFHXu0f7djVLrXDdKudHv2gWwuct0BevR
 B6+f0AjWhuL+ttJCYyfREp1PWuLhsRjx0HCgzSA3qz/llW9VTZBzKLbYT
 TjgxmDfinUPZqYuzkZYwl0xGBXXHZ0LjBaQLJFtut6aL+uS2s3kmFgYwz
 51RJ4gWDSaTTuf85nVRdqV+4MxGJz9bbkL6pzLWZYbfrs9VelTXoEyHfs
 vTqCVVrOw5mJ5qCBnfSp1E9SH9nLAOoFDQ5rlEthEpvwSwm8lxmeQ8pcE Q==;
X-CSE-ConnectionGUID: 5JOLv/DbQvWS1a0eoqz6/A==
X-CSE-MsgGUID: VsznemdAQGOuZkT6hShV9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54847192"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="54847192"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:23:04 -0700
X-CSE-ConnectionGUID: AYWvNEUfTWCuZe1roCCIZQ==
X-CSE-MsgGUID: OZBPaCTUTVepyzOUWl5CLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="152324556"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:23:03 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com, kamil.konieczny@intel.com, lukasz.laguna@intel.com
Subject: [PATCH i-g-t v3 0/2] tests/xe: Use NEEDS_VISIBLE_VRAM flag
Date: Mon, 16 Jun 2025 16:22:57 +0200
Message-Id: <20250616142259.19124-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Set DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM flag when creating BOs
that will be CPU-mapped, to ensure that the corresponding VRAM
allocation will use the CPU accessible part of VRAM.

This is essential for small-bar systems, where omitting the flag may
cause failures or SIGBUS crashes due to the CPU accessing non-visible
VRAM.

Additionally, in xe_exec_atomic test, replace
I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS with the correct
DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM.

v2: Split patches (Kamil)
v3: Fix few additional tests (Lukasz) 

Lukasz Laguna (2):
  tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM flag where it's missing
  tests/intel/xe_exec_atomic: Fix incorrect GEM create flag

 tests/intel/xe_ccs.c                      |  6 +++---
 tests/intel/xe_copy_basic.c               | 10 ++++++----
 tests/intel/xe_exec_atomic.c              |  2 +-
 tests/intel/xe_exercise_blt.c             |  4 ++--
 tests/intel/xe_pat.c                      |  3 ++-
 tests/intel/xe_spin_batch.c               |  3 ++-
 tests/intel/xe_sysfs_timeslice_duration.c |  6 ++++--
 tests/intel/xe_vm.c                       |  6 ++++--
 8 files changed, 24 insertions(+), 16 deletions(-)

-- 
2.40.0

