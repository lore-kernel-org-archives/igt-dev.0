Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54ADCF2564
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9441410E800;
	Fri, 21 Nov 2025 03:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIfQOPYf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFFA10E7F7
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 03:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697446; x=1795233446;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6aqHczpLmDkvxRmDGiYEhOKFqYQPX8LW8JeHmULtGi8=;
 b=hIfQOPYfr/DVW2ATzV2/ZLLVce8uz2d3j+LULToqMm7xgq/XRUaup14+
 3BAGRMpaZ13NhQ0v/DBSZ77rDFv9XVY/RxVC9qNZ2+3+W4kU71tNKyk+o
 VERoLM5OPMdyVSz2RsHq4GNzndeZ67QYOOYBjHL4yr9qkahJTuGgAqog4
 iM95evzVrbQuwHdo5klzalnh0Wz9zwGPoz5lK+/nvxc7XyLFXrap6ZF8b
 h7KfVxuYKPEj3YTB5Iy4Htz7Bl3AgXEEhiKEf/4gCQh5V+zaGaFQQi73v
 j/DndTKBgeVA2mct7RjYEilG14PJUuC5BpjL23lCu9yHQFflfDxpOwBrM Q==;
X-CSE-ConnectionGUID: LXn1uujGR3W5lh92Apzr7g==
X-CSE-MsgGUID: LKHBqU3MSRuV4/x63+MjqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65484662"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65484662"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:26 -0800
X-CSE-ConnectionGUID: HClFSJC9Q16LEFLLVzVg8w==
X-CSE-MsgGUID: dB9n6c8HSNeZe9roZLtZlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191433461"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 00/19] Multi Queue feature validation support
Date: Thu, 20 Nov 2025 19:57:12 -0800
Message-ID: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
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

Multi Queue is a new mode of execution supported by the compute and
blitter copy command streamers (CCS and BCS, respectively). It is an
enhancement of the existing hardware architecture and leverages the
same submission model. It enables support for efficient, parallel
execution of multiple queues within a single context.

Add validation support for multi-queue feature.

This requires XeKMD multi-queue support posted here,
https://patchwork.freedesktop.org/series/156865/

Changes in v2:
- Update xe_exec_queue_property@invalid-property test
- Use macro instead of hardcoding
- Use proper macro and variable names
- Remove simulation related code
- Ensure virtual test runs with single engine instance

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Nakshtra Goyal (1):
  tests/intel/xe_exec_multi_queue: Add fault mode test

Niranjana Vishwanathapura (16):
  drm-uapi/xe: Sync with Multi-Queue uapi
  tests/intel/xe_exec_multi_queue: Add xe_exec_multi_queue test
  tests/intel/xe_exec_multi_queue: Validate exec submissions
  tests/intel/xe_exec_multi_queue: Validate queue priority setting
  tests/intel/xe_exec_multi_queue: Add close-fd tests
  tests/intel/xe_exec_multi_queue: Add multiple placement test
  tests/intel/xe_exec_multi_queue: Add preempt mode test
  lib/xe: Add exec_queue set_property ioctl support
  tests/intel/xe_exec_multi_queue: Add dynamic priority test
  tests/intel/xe_exec_multi_queue: Add userptr invalidation tests
  lib/xe/xe_spin: Add switch point for preemptible spinner
  tests/intel/xe_exec_multi_queue: Add priority test
  tests/intel/xe_exec_multi_queue: Add submission sanity test
  tests/intel/xe_exec_multi_queue: Sanity test KEEP_ACTIVE flag
  tests/intel/xe_exec_multi_queue: Keep group active in exec-sanity
  tests/intel/xe_exec_queue_property: Update invalid-property test

Nishit Sharma (1):
  lib/xe: Add multi-queue helper routines

Priyanka Dandamudi (1):
  tests/intel/xe_exec_multi_queue: Add multi queues with SMEM

 include/drm-uapi/xe_drm.h            |   40 +
 include/intel_gpu_commands.h         |    1 +
 lib/xe/xe_ioctl.c                    |   27 +
 lib/xe/xe_ioctl.h                    |    4 +
 lib/xe/xe_query.c                    |   22 +
 lib/xe/xe_query.h                    |    8 +
 lib/xe/xe_spin.c                     |   41 +
 lib/xe/xe_spin.h                     |    3 +
 tests/intel/xe_exec_multi_queue.c    | 1128 ++++++++++++++++++++++++++
 tests/intel/xe_exec_queue_property.c |    2 +-
 tests/meson.build                    |    1 +
 11 files changed, 1276 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/xe_exec_multi_queue.c

-- 
2.43.0

