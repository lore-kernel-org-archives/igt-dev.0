Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B55CD4F3D
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 14:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABD910E487;
	Thu, 21 May 2026 14:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dp6Cv22u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521BB10E487
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779373031; x=1810909031;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j+APlaFPgrW2URCknQPWyquFSqDtKC5ocQGu6/lGLN8=;
 b=Dp6Cv22u2XxzXJ/KWGXQrbMfPUFq0gdk766MS7kqOKB1p0PCVqvTMLxZ
 DjZbU8i0BpkxT7/w/X6hXcKpGFaF2hd5xGzTdBdYYehXG7ZBRPybQeBcE
 IjdsgT+4dBkMgi4FCW+a7u4gG+GAYhbeAmPtkpDSShlw/l35qra36gxc3
 QQYevOSujDgi9cWth+KxLCBQYh9EWLe4nEdAb8+o4njPSSoupuVMccXT6
 lWg/uimHWYaMDI+ych7hOVVFZtBdIDoO+hkqJAru5JYh+cQWRk2Oo4dQr
 td+VIzzEXcPIRl9pTk2O91Z/d/DnenSTncE1QavgYq0ZcpxjxY2V2U08U w==;
X-CSE-ConnectionGUID: akTEP0sVQQqW3TVd0COZzg==
X-CSE-MsgGUID: fWFwdI86Tamhw4oZG8Ru8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97863664"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="97863664"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:17:11 -0700
X-CSE-ConnectionGUID: a5wPDM7oSCevE5AH+7HwDg==
X-CSE-MsgGUID: bsm4+fMyQ3iGlHmYiUFD+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="236121739"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.105])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:17:04 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "./cccmd"@freedesktop.org,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 0/3] xe: Test LR and fault mode workloads across
 suspend/resume
Date: Thu, 21 May 2026 16:16:41 +0200
Message-ID: <20260521141644.6502-1-thomas.hellstrom@linux.intel.com>
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

