Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AC1CD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 11:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C441E10E9E2;
	Fri, 12 Jun 2026 11:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DA1B+Hgj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6969810E9E2
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781262417; x=1812798417;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rglTSm2dyeUAWSKq1oZvAOs+wQqYWlU2+3Gby8lK4qk=;
 b=DA1B+Hgj1V8IqX0X/v4frEwk0C0YCsU10UEDHX2uJW7JMOf9tzx0wAb0
 wFbdeatw0dq60uYfxf8FG0My1jhb++h5UtVkarYdNIErPZKK7V/mmQ97P
 XmB/buJCTDFbJIJfc2jklKeBJCPSu6jAGyAuZYOw+TK8rtYHAYXFxar52
 qrjjcoTq8bXTcaheN1MhdSpaqeNDAtGJVHAqYZt9KcOfZXTVF6heKcLh7
 iZ4SnnIO32Y2wz6UANvI01TDZ0GdxW2evy+xdMJwzUgtiET2gUCw0P+vJ
 VCZz3PaTx8PcAqFFJIa223d22jZ9SWP05YFrDZ7PT3uuq9jdQBh80f6V3 w==;
X-CSE-ConnectionGUID: VvNubT7qS/qMlHHSK+/Umw==
X-CSE-MsgGUID: q1OK4VQJQ9yoSvcg4A2+/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81997592"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="81997592"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:06:57 -0700
X-CSE-ConnectionGUID: B+lxWLB8Svyph2SHfNyh+Q==
X-CSE-MsgGUID: forsajvOSv6gbwF+brvhaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="250717724"
Received: from slindbla-desk.ger.corp.intel.com (HELO fedora) ([10.245.245.68])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:06:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lahtinen Joonas <joonas.lahtinen@intel.com>
Subject: [PATCH i-g-t 0/4] xe: watch queue event support and VM restart
 recovery
Date: Fri, 12 Jun 2026 13:06:15 +0200
Message-ID: <20260612110619.103198-1-thomas.hellstrom@linux.intel.com>
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

This series adds IGT support for two new Xe kernel interfaces: the watch
queue event notification mechanism and the VM restart IOCTL.

The watch queue allows a userspace process to subscribe to device-scoped
events delivered through a pipe — notably VM errors caused by memory
pressure.  The VM restart IOCTL lets userspace synchronously trigger a
re-run of the preempt-rebind worker to recover a VM after such an error.

Together they enable a fault-tolerance loop: a listener thread receives
VM error events carrying an error code and VM id; when the error is
-ENOMEM or -ENOSPC the test can immediately attempt to restart the
affected VM rather than letting it stay faulted.

The xe_exec_compute_mode test is extended to demonstrate this: it
subscribes to file events at fixture time, logs all notifications, and
automatically calls VM restart on memory-pressure errors.

Thomas Hellström (4):
  lib/xe: add xe_vm_restart ioctl helper
  lib/xe: add xe_watch listener for watch queue events
  tests/intel/xe_exec_compute_mode: Add a listener for file events
  tests/intel/xe_exec_compute_mode: Restart VM on ENOMEM/ENOSPC errors

 include/drm-uapi/xe_drm.h          |  84 +++++++++++
 include/drm-uapi/xe_drm_events.h   |  71 +++++++++
 lib/meson.build                    |   1 +
 lib/xe/xe_ioctl.c                  |  44 ++++++
 lib/xe/xe_ioctl.h                  |   2 +
 lib/xe/xe_watch.c                  | 221 +++++++++++++++++++++++++++++
 lib/xe/xe_watch.h                  |  80 +++++++++++
 tests/intel/xe_exec_compute_mode.c |  92 +++++++++++-
 8 files changed, 591 insertions(+), 4 deletions(-)
 create mode 100644 include/drm-uapi/xe_drm_events.h
 create mode 100644 lib/xe/xe_watch.c
 create mode 100644 lib/xe/xe_watch.h

-- 
2.54.0

