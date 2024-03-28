Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C02C54E64
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 11:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5762110EB39;
	Thu, 28 Mar 2024 11:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hklsXU5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6472010E452
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711623876; x=1743159876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XzVDRy/m+/n1hnLe/gHamodr3TRf3eb40lJRGn9ol9Q=;
 b=hklsXU5fWsRK5TWZ1RU8ncud2peYaoGRLgPqpbWTR1Albv8KlbzJIths
 nIl/B7mAppfbSROhWWedzNxjM4A3oALNE9Q6xAB3as6OXhw/quCz3ba8Z
 qSJclc04CGfFv08n0PbpWPRMKeoTYk0pEAhnfDv2gNZfP8HJPRgF4r/Kd
 dQeAy0fjwSqWQXszoRgawEznn2fJ5XDPbylYq9f8NTAVWaQEvg3YXEfFN
 s5eU1cjTWTKiHr7KzL1AAazidnN0YibJ5hqTGpanKnTdSg2c//Y+Ok68x
 94IWd/zVW8Yd94cOFCopXDDBzEi3e7OxfsCx6vHFSye+Qwx1oYSOc1FQD A==;
X-CSE-ConnectionGUID: ft6IvxilQUuvJAOPzCfnBA==
X-CSE-MsgGUID: 0XIYHdsfQia2AhZuuKXJhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10551679"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="10551679"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 04:04:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="17021310"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 04:04:35 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [V2 i-g-t] tests/intel-ci: Drop few core tests from XE BAT
Date: Thu, 28 Mar 2024 16:27:43 +0530
Message-ID: <20240328105743.830079-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Regession with "6.9.0-rc1-xe" is preventing to run KMS tests
in BAT. Hence drop "xe_exec_threads" & "xe_evict" from XE BAT
until we fix the regression.

V2:
 - Drop xe_evict tests

Issue: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1044
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 17863b6b1..c859acdca 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -11,22 +11,6 @@ igt@xe_debugfs@gt
 igt@xe_debugfs@forcewake
 igt@xe_dma_buf_sync@export-dma-buf-once
 igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
-igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
-igt@xe_evict@evict-beng-small
-igt@xe_evict@evict-beng-small-cm
-igt@xe_evict@evict-beng-small-external
-igt@xe_evict@evict-beng-small-external-cm
-igt@xe_evict@evict-beng-small-multi-vm
-igt@xe_evict@evict-cm-threads-small
-igt@xe_evict@evict-mixed-threads-small
-igt@xe_evict@evict-mixed-threads-small-multi-vm
-igt@xe_evict@evict-small
-igt@xe_evict@evict-small-cm
-igt@xe_evict@evict-small-external
-igt@xe_evict@evict-small-external-cm
-igt@xe_evict@evict-small-multi-vm
-igt@xe_evict@evict-small-multi-vm-cm
-igt@xe_evict@evict-threads-small
 igt@xe_evict_ccs@evict-overcommit-simple
 igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd
 igt@xe_exec_atomic@basic-dec-all
@@ -80,12 +64,6 @@ igt@xe_exec_reset@close-fd-no-exec
 igt@xe_exec_reset@cm-close-fd-no-exec
 igt@xe_exec_reset@virtual-close-fd-no-exec
 igt@xe_exec_store@basic-store
-igt@xe_exec_threads@threads-basic
-igt@xe_exec_threads@threads-mixed-basic
-igt@xe_exec_threads@threads-mixed-shared-vm-basic
-igt@xe_exec_threads@threads-mixed-fd-basic
-igt@xe_exec_threads@threads-mixed-userptr-invalidate
-igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
 igt@xe_gpgpu_fill@basic
 igt@xe_gt_freq@freq_basic_api
 igt@xe_gt_freq@freq_fixed_idle
-- 
2.43.2

