Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC0BC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EED10E8E4;
	Fri, 22 Mar 2024 12:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJ3TrNuP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00BE10E881
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711111281; x=1742647281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zZ4N8MdRdA9ipH+Ypp4LQw9LE43LeLewm71bIV6J12A=;
 b=MJ3TrNuPhp01hGNajs4zp+DcXfFHje8cPNikEUe8MeG30FdExUD6VfTm
 Q/4fnuafM573dqiPYGaqa7DDPlWtsWYG2ESX1lhgF+FeLrxQOnV5Pggqo
 PkzPBjO1DPTwuKI0niFoRa7dW97KL0rpsJx8tQD9OnueVB6jcGQKuREG+
 9AeIv/mUh6I2UIJdcsmietEFY8fkx9sJXSlf4O+6rB5ZqOwKOPXZhBghP
 fxTN68AGLHOqaLYAsRtsC7scewmq6S4LcMxE8/PfWN+f3d9Jl6E0btT82
 OF+XGkGlTCHyTeaf+OummmcPNnzsZZvT4b4NyYd/b0+H9KFrNPV7FAWJj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16883789"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="16883789"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="46018453"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:41:19 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 00/12] Align Xe test documentation to recent i915 changes
Date: Fri, 22 Mar 2024 12:40:55 +0000
Message-Id: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
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

After i915 documentation was updated and cleaned up there is a need to align
already documented Xe tests to new Sub-categories/Functionalities.
Some changes are small name alignment, some are putting tests into newly
introduces Sub-categories/Functionalities.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>

Katarzyna Piecielska (12):
  tests/intel: Unify Blitter subcategory for i915 and Xe
  tests/intel: Introduce CMD submission Sub-category for XE
  tests/intel: Fix inconsitency in Sub-category/Functionality names
  tests/intel: Let's have Firmware subcategory in Xe tests as well
  tests/intel: Move drm_fdinfo to driver subcategory
  tests/intel: Add xe_prime_self_import to DRM subcategory
  tests/intel: Move xe_mmap to Memory management Sub-category
  tests/intel: Add xe_spin_batch to IGT Lib Sub-category
  tests/intel: Move xe_exec_queue_property to Sub-category uapi
  tests/intel: Move xe_waitfence test to Synchronization sub-category
  tests/intel: Unify functionality for compute tests
  tests/intel: Move xe_exec_reset.c to Reset Sub-category

 tests/intel/drm_fdinfo.c             |  4 ++--
 tests/intel/xe_ccs.c                 |  2 +-
 tests/intel/xe_compute.c             |  8 ++++----
 tests/intel/xe_compute_preempt.c     | 10 ++++++----
 tests/intel/xe_copy_basic.c          |  4 ++--
 tests/intel/xe_create.c              |  2 +-
 tests/intel/xe_evict.c               |  2 +-
 tests/intel/xe_evict_ccs.c           |  2 +-
 tests/intel/xe_exec_balancer.c       |  2 +-
 tests/intel/xe_exec_basic.c          |  2 +-
 tests/intel/xe_exec_compute_mode.c   |  4 ++--
 tests/intel/xe_exec_fault_mode.c     |  2 +-
 tests/intel/xe_exec_queue_property.c |  2 +-
 tests/intel/xe_exec_reset.c          |  4 ++--
 tests/intel/xe_exec_store.c          |  2 +-
 tests/intel/xe_exec_threads.c        |  2 +-
 tests/intel/xe_gpgpu_fill.c          |  4 ++--
 tests/intel/xe_gt_freq.c             |  2 +-
 tests/intel/xe_huc_copy.c            |  4 ++--
 tests/intel/xe_media_fill.c          |  4 ++--
 tests/intel/xe_mmap.c                |  2 +-
 tests/intel/xe_noexec_ping_pong.c    |  4 ++--
 tests/intel/xe_pm.c                  |  2 +-
 tests/intel/xe_pm_residency.c        |  2 +-
 tests/intel/xe_prime_self_import.c   |  2 +-
 tests/intel/xe_spin_batch.c          |  2 +-
 tests/intel/xe_sysfs_defaults.c      |  2 +-
 tests/intel/xe_sysfs_scheduler.c     |  2 +-
 tests/intel/xe_waitfence.c           |  3 +--
 29 files changed, 45 insertions(+), 44 deletions(-)

-- 
2.34.1

