Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3976ECAC582
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 09:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5EE10EBE9;
	Fri, 12 Sep 2025 09:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UraMhkDI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585A110EBE9
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757669704; x=1789205704;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pP0e8PNW2wEGOIhlB3GmfdBOBHJMVlmCiFl0m8KqKWk=;
 b=UraMhkDIAupSpR9K7ph+fRLvtvtQTeb/fJdukDYhmUAhdsSLi1LCPJ1r
 s/YpcHL9HFtkAWC56KgvUQYbPsiKg6XhfLcADhleeL6ITpXMVVE2xi5y8
 JKK8Isle3be2G4UMsH0+UhGrOM1rnJ0iWBRqERt3vroXZs+UEPQU9+GRH
 ODRreVePQ6Cw2n6e2Q18g077DJcTz4w8Yu0dsL2KuVc5SgBjHZ7tGT0/+
 58Z2FT0MUkypiZq2Ei/jvJD5R81izzvj4FfYHrIKZB4IpXYzNra/wf7ed
 6RnMEcSw1QaDha76getFFigSBsc7kKRJuLg+eIEOPu5M2qWW3AI5jbo2G A==;
X-CSE-ConnectionGUID: KYE1oiSjSDCTKpAjVeXY9A==
X-CSE-MsgGUID: MN891BUoRt+4et/uC4qUPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="47581947"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="47581947"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 02:35:03 -0700
X-CSE-ConnectionGUID: u1/+K9eIQPOB8wSzYaLUrQ==
X-CSE-MsgGUID: NTY5+Y4DSYqkJoEMeENhzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173222287"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa010.jf.intel.com with ESMTP; 12 Sep 2025 02:35:00 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 0/9] [ANDROID]: Add GPU work period support for Xe driver
Date: Fri, 12 Sep 2025 09:02:14 +0000
Message-ID: <20250912090226.2619227-1-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
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

This patch series implements the Android VSR requirement GPU work
period event for the Intel Xe driver.

|GpuWorkPeriodEvent| defines a non-overlapping, non-zero period
of time from |start_time_ns| (inclusive) until |end_time_ns|
(exclusive) for a given |uid|, and includes details of how much
work the GPU was performing for |uid| during the period. When
GPU work for a given |uid| runs on the GPU, the driver must track
one or more periods that cover the time where the work was running,
and emit events soon after.

Full requirement is defined in the following file:
https://cs.android.com/android/platform/superproject/main/+\
main:frameworks/native/services/gpuservice/gpuwork/bpfprogs/gpuWork.c;l=35

The requirement is implemented using a delayed worker thread per
user id instance to accumulate its runtime on the gpu and emit
the event. Each user id instance is tracked using an xe_user
structure and the runtime is updated every time the kworker is
executed for this uid. The delay period is hardcoded to 500 msecs.

The runtime on the gpu is collected for each xe file individually
inside the function xe_exec_queue_update_run_ticks and accumulated
into the corresponding xe_user active_duration_ns field. The HW
Context timestamp field in the GTT is used to derive the runtime
in clock ticks and then converted into nanosecs before updating the
active duration.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>

Aakash Deep Sarkar (9):
  Add a new xe_user structure
  Add xe_gt_clock_interval_to_ns function
  Add a trace point for GPU work period
  Modify xe_exec_queue_update_run_ticks
  Handle xe_user creation and removal
  Implement xe_work_period_worker
  Add a Kconfig option for GPU work period
  Handle xe_work_period destruction
  Fix runtime PM handling of Xe work period worker

 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/xe_device.c                |  90 +++++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  19 ++
 drivers/gpu/drm/xe/xe_exec_queue.c            |  10 +
 drivers/gpu/drm/xe/xe_gt_clock.c              |  14 ++
 drivers/gpu/drm/xe/xe_gt_clock.h              |   1 +
 drivers/gpu/drm/xe/xe_pm.c                    |   4 +
 .../drm/xe/xe_power_gpu_work_period_trace.h   |  61 ++++++
 drivers/gpu/drm/xe/xe_user.c                  | 188 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_user.h                  | 121 +++++++++++
 drivers/gpu/trace/Kconfig                     |  12 ++
 11 files changed, 522 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
 create mode 100644 drivers/gpu/drm/xe/xe_user.c
 create mode 100644 drivers/gpu/drm/xe/xe_user.h

-- 
2.49.0

