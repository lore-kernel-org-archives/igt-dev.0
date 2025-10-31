Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD710CCF9F8
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9274910E35C;
	Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZA4xDcvb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E8010E2FE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935762; x=1793471762;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BhieAybTVV1Cr/d8ZtWlZuxoVts9XNlEc07BJ/3PoEo=;
 b=ZA4xDcvb+8PK64RwLyyIoF4ojcpLFQfZrudPFkp8pJtaVniv1ujgAjTd
 +hPwL1GnKmO6rfR2JA2PGFJG5Mlexq0XNwHHy6C8CW9lKgY+6GA5HiTOo
 Djh2BMsROJZwbZOnImmhU+AXeBlSA1mKMGiMFcfEEIewNrVv4rp5riuFs
 4W1zqtW8+TtRD4I8OOo92vHtszrOKGXyQKae/wHYQfbR9obfbVLRouMmQ
 EGFqxfoZSh0K1cE72C/cd7x0vjE9yEPAi7vGQURzwHl9QuoH8LYJ9E9TF
 inOQQyM14OKTFQDGCh4R9b2XBisMrjR4NLW+1z8hs6nJGTNIfrNFP2Hb1 A==;
X-CSE-ConnectionGUID: aRptFc6HQ0Gy95uQQSFz9w==
X-CSE-MsgGUID: GEkqt26fS0yUZoqWkNrcMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144721"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:01 -0700
X-CSE-ConnectionGUID: bNYxatbeR5aZAkpuB8cpLA==
X-CSE-MsgGUID: 2aHSnc9QTxCFRBGPShykMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650010"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 00/18] Multi Queue feature validation support
Date: Fri, 31 Oct 2025 11:35:37 -0700
Message-ID: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Nakshtra Goyal (1):
  tests/intel/xe_exec_multi_queue: Add fault mode test

Niranjana Vishwanathapura (15):
  drm-uapi/xe: Sync with Multi-Queue uapi
  tests/xe_exec_multi_queue: Add xe_exec_multi_queue test
  tests/xe_exec_multi_queue: Validate exec submissions
  tests/xe_exec_multi_queue: Validate queue priority setting
  tests/xe_exec_multi_queue: Add close-fd tests
  tests/xe_exec_multi_queue: Add multiple placement test
  tests/xe_exec_multi_queue: Add preempt mode test
  lib/xe: Add exec_queue set_property ioctl support
  tests/xe_exec_multi_queue: Add dynamic priority test
  tests/xe_exec_multi_queue: Add userptr invalidation tests
  lib/xe/xe_spin: Add switch point for preemptible spinner
  tests/xe_exec_multiq: Add priority test
  tests/xe_exec_multiq: Add submission sanity test
  tests/xe_exec_multi_queue: Sanity test KEEP_ACTIVE flag
  tests/xe_exec_multi_queue: Keep group active in exec-sanity

Nishit Sharma (1):
  lib/xe: Add multi-queue helper routines

Priyanka Dandamudi (1):
  tests/intel/xe_exec_multi_queue: Add multi queues with SMEM

 include/drm-uapi/xe_drm.h         |   40 +
 include/intel_gpu_commands.h      |    1 +
 lib/xe/xe_ioctl.c                 |   27 +
 lib/xe/xe_ioctl.h                 |    4 +
 lib/xe/xe_query.c                 |   22 +
 lib/xe/xe_query.h                 |    8 +
 lib/xe/xe_spin.c                  |   41 ++
 lib/xe/xe_spin.h                  |    3 +
 tests/intel/xe_exec_multi_queue.c | 1137 +++++++++++++++++++++++++++++
 tests/meson.build                 |    1 +
 10 files changed, 1284 insertions(+)
 create mode 100644 tests/intel/xe_exec_multi_queue.c

-- 
2.43.0

