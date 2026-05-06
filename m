Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F22CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 18:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CABE10E275;
	Wed,  6 May 2026 18:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xpzd59Fm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9515E10E275
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 18:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778092303; x=1809628303;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=85nJf3rUkVdUTk/22rV6QpcW7JznAMnEcw2faEgULT4=;
 b=Xpzd59FmKETEuSGr8ncY3qY8esXSnlxOWw9OJ96xlgmPI6ve5GcLkFnv
 PXtkUwOVkeg8sObwAt1yoKswdGT06junOloUcZzwLXLI79CvLb2c+qJKU
 1E7NedJMKmhs/NNN//cDLDg5RUN7NJQNzOSRGCgqfR8sFmxfexRsb996r
 3f0/UWbmNdWhQAekt9DUjzftXI7zzpj11Qwnp70YNaebneQItfcVryDT1
 0Ghez/obtWppFvJqX0wWhOPwDnqClU+CazKWWgHqLRzU9zc4S95dWoMzT
 dWBh5qzJI/3Wjsa6Kg7ErkbhxvHvy4sMjDNBKKgVBzzdQWPm6CC7LOWQX A==;
X-CSE-ConnectionGUID: 7BeR7O20SCiQ8n0g2iPqTg==
X-CSE-MsgGUID: G9KhOhPvQlesQm1X+QALhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="66564512"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="66564512"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 11:31:43 -0700
X-CSE-ConnectionGUID: cXcyC6NoQm2ytdLf+TjzyA==
X-CSE-MsgGUID: 6QMUXg/SR8KxarPo+ithjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="259658726"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 11:31:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 0/3] tests/intel/xe_exec_reset: Validate multi-queue
 timestamping
Date: Wed,  6 May 2026 11:31:36 -0700
Message-ID: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
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

Multi-queue exec queues should use QUEUE_TIMESTAMP instead of CTX_TIMESTAMP
for the run ticks. Add the required support and the tests to validate this.

This patch series is dependent on XeKMD patch series
https://patchwork.freedesktop.org/series/164654/

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

gta (3):
  lib/xe/xe_spin: Enhance multi-queue switch option
  lib/xe/xe_spin: Add option for QUEUE_TIMESTAMP
  tests/intel/xe_exec_reset: Add multi-queue long spin tests

 lib/xe/xe_legacy.c                |  2 ++
 lib/xe/xe_spin.c                  | 22 ++++++++++++----------
 lib/xe/xe_spin.h                  |  8 +++++++-
 tests/intel/xe_exec_multi_queue.c |  2 +-
 tests/intel/xe_exec_reset.c       | 17 +++++++++++++++++
 5 files changed, 39 insertions(+), 12 deletions(-)

-- 
2.43.0

