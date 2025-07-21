Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3A9C83F26
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 15:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728EF10E2BC;
	Mon, 21 Jul 2025 15:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQnuaDnf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8B510E2BC
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 15:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753113546; x=1784649546;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PssJE8JnL8h1iZROfMrfSc4mUzlIJzdCrRMxyhL3GSo=;
 b=UQnuaDnffGbzi2Q5p1wuezQDZwR/KGRmUgHduFYc5j2U6fu+N2LaVQap
 ym9CCHIbiRU+viBHdX756k6VMAm8x0HD6dBQ2tWBOY5oQnNUKZQgR0or5
 PreqvvrMfNyqoQY1c4b8xJK+ECX/1PK57A/hYVV9dDJyAOuShHuwmyKDu
 B3nKIiWTWAq23RiCMCkEZ+BYjCERSXrOD78MuqEB3hW5dIaQjXHLV2iuP
 4InxDLjOD+nyk0v4dDhOniUhwg8Xbbmefrx7/FSwVLrGqr/2DuzygKEGT
 h6i2t98ynMHMJnHSy+pIr2RV1zXS6VZoe8U3135BgfbAgLzsuHHKgPqh0 A==;
X-CSE-ConnectionGUID: chSxN0NDRyCzfy8i3jLutw==
X-CSE-MsgGUID: g2CaphL+QEOubFmEolxkzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="65597001"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="65597001"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 08:59:03 -0700
X-CSE-ConnectionGUID: kyJSnWu3TySJ+fkJo6SThQ==
X-CSE-MsgGUID: rkTK96xbRderk2WIntJOJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="162924112"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.55])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 08:58:39 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 zlice <zlice555@gmail.com>
Subject: [PATCH i-g-t v2 0/2] Fix igt v2.1 compilation on Void Linux with musl
 C libs
Date: Mon, 21 Jul 2025 17:58:22 +0200
Message-ID: <20250721155824.112474-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

This fixes a compilation on Void Linux as reported
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/179

v2: merged xe*c change (Kamil)
  changed vc4 define into VC4_GPU_PAGE_SIZE (Riana)

Cc: zlice <zlice555@gmail.com>

Kamil Konieczny (2):
  lib/svga/vm_basic_types: fix musl libs compilation on Void Linux
  lib/igt_vc4: Fix musl libc compilation

 lib/igt_vc4.h               |  2 +-
 lib/svga/vm_basic_types.h   | 10 +++++++++-
 tests/vc4/vc4_create_bo.c   |  4 ++--
 tests/vc4/vc4_label_bo.c    |  6 +++---
 tests/vc4/vc4_lookup_fail.c |  2 +-
 tests/vc4/vc4_mmap.c        | 12 ++++++------
 tests/vc4/vc4_tiling.c      | 12 ++++++------
 tests/vc4/vc4_wait_bo.c     |  4 ++--
 8 files changed, 30 insertions(+), 22 deletions(-)

-- 
2.50.1

