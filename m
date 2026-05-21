Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA801CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 14:35:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6616810E20C;
	Thu, 21 May 2026 14:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsoLGOYI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4D310E20C
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 14:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779374109; x=1810910109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DsL/v/EIMJvOcYnpF8a7M3NtABnDssT0RBrO3Wxenso=;
 b=HsoLGOYIhVN/+DIUfRVYk5BtwUZ8q2c0jM8huOVcotz9U5MtfpvH2mcJ
 OpwSjz5k6AbqRzq7h4xzoqMqZpUfv6XtpDngW4TKTKW12wHIXCtERIqVi
 M34dXxzDmY7+mqWZ35KgwnmyE4WxIFYTyMqgh/CkQvvPPUiJsHY4XChdt
 uzvxIiQ5vJ0eb3Xx69e3xRw31xqpkal0C0W77M5pv8tdMBg15Kgr1RbKw
 2ummtH/eFUx+tLLnQh1wE1ZHPg8q9wrtiT1qGWH/LFSHojjAuBE5RPY8r
 0Y9m/WAo8aLd21MoEqvZjwARVOcNfWiyVJLCl8HHhO1klbbTPBhCACEW2 g==;
X-CSE-ConnectionGUID: Rcxo9RxUQEKwoZ7xX+ex2w==
X-CSE-MsgGUID: dMSa3f/ARsWCPF2ueQgTCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80147349"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80147349"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:35:06 -0700
X-CSE-ConnectionGUID: VwLFnG0/QdOBP98qjb+6fg==
X-CSE-MsgGUID: unRD7aYeQtu8k40RNJZl3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="278650366"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:35:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH RESEND i-g-t 0/3] xe: Test LR and fault mode workloads across
 suspend/resume
Date: Thu, 21 May 2026 16:34:36 +0200
Message-ID: <20260521143439.6927-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Sorry for the resend. I messed up the CC-list.

These patches extend xe_exec_compute_mode and xe_exec_fault_mode with
tests that verify GPU workloads survive system suspend and resume.

The new subtests run a preemptible spinner on a copy engine and then
trigger a full suspend/resume cycle — covering s2idle, S3 and S4 — while
the workload is active.  After resume, the tests confirm the workload is
still making forward progress before stopping it cleanly.  This exercises
the driver's ability to park and restore LR-mode and fault-mode execution
contexts across power state transitions.

Thomas Hellström (3):
  tests/xe_exec_compute_mode: Make lr-mode-workload spinner preemptible
  tests/xe_exec_compute_mode: Add workload subtests with suspend
    variants
  tests/xe_exec_fault_mode: Add fault-mode workload subtests with
    suspend variants

 tests/intel/xe_exec_compute_mode.c |  51 ++++++++++--
 tests/intel/xe_exec_fault_mode.c   | 123 ++++++++++++++++++++++++++++-
 2 files changed, 165 insertions(+), 9 deletions(-)

-- 
2.54.0

