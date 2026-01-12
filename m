Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B954C9EC82
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D12910E3C5;
	Mon, 12 Jan 2026 13:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpJ/z67u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AFD10E3C5
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222823; x=1799758823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=COUCeREL3W06h1B9lvWWVuvkJrpTzyBeZfLFZlnC7bE=;
 b=kpJ/z67uzh/Ij1v1pDhRB7R15XWu47ofgTB9fc0Vc2gSBg4omCmuCSWB
 VZkB35X4LXoAvKnTbYJPMbds0JBzdXcvj3guyMANzxKdB612Htyjat8A/
 IK4KDCvVV9YhyIoTDw8gv9PPCeAl6ZV5vzBu5ucDzBESPR3gsQEjZrcyx
 O6F5S6zrqvEUNAJUYyRzBdhTzEDwwWAPi151TNqMlNtTqEKwUNs70Ud1v
 LIg/t1xB8T4IG/IbTEBAWXRkWDOMiqN6d1lMYvUugJ/YPmIrZfkTQtyzL
 zuhs9exbdQUc0v57XfZplCSPuxrsoHWG8bPAA6KhBXygtE+ml1WBE2zUh g==;
X-CSE-ConnectionGUID: yBSkda7ZQrqYWIqRbTgGUQ==
X-CSE-MsgGUID: 4Pn4yFWHRl6TufedTCz8rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545509"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545509"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:22 -0800
X-CSE-ConnectionGUID: pI5dje0/Qgu/Qp+NBE0Csg==
X-CSE-MsgGUID: UyuYzQyCRfmV+vHlFrLOVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204094900"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:19 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 00/21] eudebug: uapi changes on connect and metadata
Date: Mon, 12 Jan 2026 14:59:46 +0200
Message-ID: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Hi,

Here are the patches that should bring the igt/eudebug in sync
with https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-v6

Majority of changes are due to connection opening changes
and metadata rework.

-Mika

Christoph Manszewski (11):
  tests/intel/xe_eudebug_sriov: Align expected return code
  tests/xe_eudebug: Adapt basic-read-event
  lib/xe_eudebug: Adapt to vm_bind debug data
  tests/xe_eudebug: Adapt basic-vm-bind and remove
    basic-vm-bind-extended
  tests/xe_eudebug: Adapt some ufence reliant tests to new vm_bind event
    interface
  tests/xe_eudebug: Adapt vm-bind-clear* subtests to debug data
  lib/xe_eudebug: Remove unused xe_eudebug_client_vm_bind wrappers
  tests/xe_eudebug: Add vm-bind-debug-data-ufence subtest
  lib/intel_batchbuffer: Add dummy OP_DEBUG_DATA operation to
    __xe_alloc_bind_ops
  tests/xe_eudebug_online: Adapt set-breakpoint test to work with new vm
    bind event interface
  tests/xe_eudebug_online: Adapt several subtests to work with new vm
    bind event interface

Mika Kuoppala (10):
  lib/xe/xe_eudebug: Dont compare if everything filtered
  lib/xe/xe_eudebug: Make sure debugger drains events
  lib/xe/xe_eudebug: Avoid matching if event is filtered
  eudebug: Remove metadata tests
  eudebug: Remove EVENT_OPEN and adjust tests
  tests/intel/xe_eudebug: Fix connect-user test
  tests/intel/xe_eudebug: Mold ufence reconnect test to disconnect
  lib/xe/xe_eudebug: Add callback for session work
  tests/intel/xe_eudebug: Add render node testing
  eudebug: Update xe_drm_eudebug.h uapi

 .../drm-uapi-experimental/xe_drm_eudebug.h    |  266 ++--
 include/drm-uapi/xe_drm.h                     |   36 +
 lib/intel_batchbuffer.c                       |   82 +-
 lib/xe/xe_eudebug.c                           | 1038 +++++++-------
 lib/xe/xe_eudebug.h                           |   88 +-
 tests/intel/xe_eudebug.c                      | 1211 ++++++++---------
 tests/intel/xe_eudebug_online.c               |  304 ++---
 tests/intel/xe_eudebug_sriov.c                |    2 +-
 8 files changed, 1495 insertions(+), 1532 deletions(-)

-- 
2.43.0

