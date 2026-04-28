Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50488FF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 06:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F5510E06A;
	Tue, 28 Apr 2026 06:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYr8yScL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4891E10EA2F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 06:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777359271; x=1808895271;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5U27mJi69P7y7VLjJm/G+qTI8oX3xspuCdYNy5bhqt0=;
 b=SYr8yScL0c+eyobFbWcHgJcv/YHnISuJ7Sijr81xqHKLRZ8A9F5uvMlg
 Roj2Bts4pVqgGYDr9jE9N75VJqyBb47o3XU92Vmjpo/evwF99OIUu74fT
 HQ9jMpSkZjDBT2vLhK0MSTdAjDCTWcdDvNNrD7AZEPKv7Bn54OvPpsONC
 ATFWc+WjqbbrJCw3BcODchpZ1VMDsKZEFHEsdtMdkWRyhIKT0f70+1pkZ
 o4FVXnDVYyM+TDrwFXGOaoACA+XRTLK2nzA5o5R4yLiuZh4AQkM6m2HnB
 rncbAKcJcGDxU4FYkc5ANHAIb68ypF2suTkrbZ64aGd563+/TY9sMJ3ho w==;
X-CSE-ConnectionGUID: n9oL7ofIRRarCYzYwgWnWg==
X-CSE-MsgGUID: qTGr5fSMSt27/GBsGoDTHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78137869"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78137869"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 23:54:30 -0700
X-CSE-ConnectionGUID: 1g52wzN4Q/aHF2ydIctpQQ==
X-CSE-MsgGUID: YyJpMVoTQ+G+MJwP8rAqvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="232863004"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.161])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 23:54:30 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 0/6] Initial dmem cgroup support
Date: Tue, 28 Apr 2026 08:54:05 +0200
Message-ID: <20260428065411.4222-1-thomas.hellstrom@linux.intel.com>
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
Patch 4 adds some vm_bind functionality from Sobin Thomas
Patch 5 adds the xe dmem cgroup test
Patch 6 adds an additional subtest testing the O_NONBLOCK functionality

v2:
- Use Sobin's patch for patch 4 rather than a local crafted one.
- Add the O_NONBLOCK subtest.

Sobin Thomas (1):
  lib/xe: Add failable variant of xe_vm_bind_lr_sync()

Thomas Hellström (5):
  lib/igt_cgroup: add cgroup v2 and dmem controller helpers
  tests/cgroup_dmem: add dmem cgroup controller test
  lib/xe: add xe_cgroup_region_name() helper
  tests/xe_cgroups: add dmem cgroup eviction test
  tests/xe_cgroups: add write_eviction_nonblock subtest

 lib/igt.h                |   1 +
 lib/igt_cgroup.c         | 638 +++++++++++++++++++++++++++++++++++++++
 lib/igt_cgroup.h         |  56 ++++
 lib/meson.build          |   1 +
 lib/xe/xe_ioctl.c        |  35 ++-
 lib/xe/xe_ioctl.h        |   2 +
 lib/xe/xe_query.c        |  32 ++
 lib/xe/xe_query.h        |   2 +
 tests/cgroup_dmem.c      |  92 ++++++
 tests/intel/xe_cgroups.c | 307 +++++++++++++++++++
 tests/meson.build        |   2 +
 11 files changed, 1158 insertions(+), 10 deletions(-)
 create mode 100644 lib/igt_cgroup.c
 create mode 100644 lib/igt_cgroup.h
 create mode 100644 tests/cgroup_dmem.c
 create mode 100644 tests/intel/xe_cgroups.c

-- 
2.53.0

