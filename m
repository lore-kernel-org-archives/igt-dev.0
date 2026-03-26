Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF2A10A88E3
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 16:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D7010E25F;
	Thu, 26 Mar 2026 16:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oc6rj9Si";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EBA10E25F
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 16:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774541428; x=1806077428;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HqNWtcZydydAfxNpO3noFv+uAEkg9WXTVURCe2YTtGI=;
 b=Oc6rj9SiJYA7nEJsfn1zjY/lunV0qgPuful7hLuipwrM4DfSnu/+UA47
 MybbXOzzYdYJlmUUh8iMEle/rnIQ8LQa1Z6tXQTyeUqRObwKhHNIJQb1u
 JJ9GDHKH7vlilhU3+vob6tK+oCVsZdm0z8skm402ezLiSDQugOvraDTGy
 WUXsV0ub+dmP8ry3XROEDL/qOwH57fzMEaK8Z6tWU4T9ma8y5o7lGjGDj
 k32B2N5bzp9fs5GJqEirvaiQHEuDK77jSRVdnQWeEJ5bO5YJALHbstEEB
 9Ax3Ub6CIW6/SYEDFyu/VBP7THrVUH09JCesry9TcAgYkdRjWhzpJs7tB w==;
X-CSE-ConnectionGUID: cWP84X4UQ26slw/f8M6cVg==
X-CSE-MsgGUID: ZVeHxqIPT5iidsbD5RK3nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75488960"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75488960"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 09:10:27 -0700
X-CSE-ConnectionGUID: vgektBIKSLuEBuvu4q2RLw==
X-CSE-MsgGUID: olovTh2uQrGzblNguWYcRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229505924"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.251])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 09:10:26 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dev@lankhorst.se,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 0/5] Initial dmem cgroup support
Date: Thu, 26 Mar 2026 17:10:02 +0100
Message-ID: <20260326161007.39294-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

This series introduces library support for some trivial cgroup v2
dmem manipulation.

It also adds a test for the library support itself and then an
xe test where cgroup functionality is exercised. In particular
lowering the max allocated amount of vram beyond what's already
allocated.

That functionality is not in the kernel yet, but a series for it
is pending.

Patch 1 adds library functionality.
Patch 2 adds a test for the library functionality. It's device
      agnostic.
Patch 3 adds a function to get the xe driver cgroup controller
      region name for an xe device VRAM region. Also library
      functionality.
Patch 4 extends the library vm_bind functionality, pending
      completion of https://patchwork.freedesktop.org/patch/714000/?series=163579&rev=3
Patch 5 adds the xe cgroup test (some KMD functionality still missing).

Thomas Hellström (5):
  lib/igt_cgroup: add cgroup v2 and dmem controller helpers
  tests/cgroup_dmem: add dmem cgroup controller test
  lib/xe: add xe_cgroup_region_name() helper
  lib/xe: add __xe_vm_bind_lr_sync() failable bind helper
  tests/xe_cgroups: add dmem cgroup eviction test

 lib/igt.h                |   1 +
 lib/igt_cgroup.c         | 644 +++++++++++++++++++++++++++++++++++++++
 lib/igt_cgroup.h         |  58 ++++
 lib/meson.build          |   1 +
 lib/xe/xe_ioctl.c        |  79 ++++-
 lib/xe/xe_ioctl.h        |   3 +
 lib/xe/xe_query.c        |  32 ++
 lib/xe/xe_query.h        |   2 +
 tests/cgroup_dmem.c      |  92 ++++++
 tests/intel/xe_cgroups.c | 296 ++++++++++++++++++
 tests/meson.build        |   2 +
 11 files changed, 1195 insertions(+), 15 deletions(-)
 create mode 100644 lib/igt_cgroup.c
 create mode 100644 lib/igt_cgroup.h
 create mode 100644 tests/cgroup_dmem.c
 create mode 100644 tests/intel/xe_cgroups.c

-- 
2.53.0

