Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6414CCD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 14:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A9710EC7D;
	Wed, 10 Apr 2024 14:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNjj94i9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5724C10EC7D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712760209; x=1744296209;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=7/7kP4YdbTTNOkoYmTHQwQJin3PkQCHRJXu1Y17WqhM=;
 b=ZNjj94i9D8FgJClP72/UBAW8l71cnlRYEyjkMA/HFOWXv8X4kDz10aXG
 RAYb0WAX53v1pDrZsBKHLplm1HznJI5kUmN2S5ovME7bi70DBb/0k8CS5
 bw1vqULHWeutrCK435nJ0z65rCkIAK8h6obWAZOpKBgh0tFDq23yQGfpp
 lhkaML42e1rR1Mv+UCS1o4upBa108HwGqLRhorhnX241KYU4JYLfxfjrM
 0snlpiH1VVbJ8Q712x6vjG1rlgtH8k7wk8fYe5IqLqFfAYxPdRp8kyFSh
 VA02HWhOLQJOWqj9vqxwwELX7W3AqYrqsjMNSSZFoCKe0ZgaANh/lynqP g==;
X-CSE-ConnectionGUID: gwAUI2RNSXiDeomElXDO9A==
X-CSE-MsgGUID: a4flrUz5QIeroOWY5uuhgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18732387"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18732387"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:43:27 -0700
X-CSE-ConnectionGUID: JkzeY6OAQGSGi6rQXpktkQ==
X-CSE-MsgGUID: +Juz3UkwQ9qIzKBUTeHVJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="43828878"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:43:27 -0700
Received: from linux.intel.com (unknown [10.245.244.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CB65920B56EB
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 07:43:26 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1ruZAa-00000000Bf5-3UQD for igt-dev@lists.freedesktop.org;
 Wed, 10 Apr 2024 16:43:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 0/4] Fix warnings with gcc 14
Date: Wed, 10 Apr 2024 16:42:34 +0200
Message-ID: <20240410144321.44766-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

GCC version 14 now checks if arguments for calloc() are at the right
order, producing warnings otherwise.

Fix it.

Mauro Carvalho Chehab (4):
  benchmarks: fix calloc calls with inverted arguments
  assembler: fix calloc calls with inverted arguments
  tests: fix calloc calls with inverted arguments
  lib: fix calloc calls with inverted arguments

 assembler/gram.y                        | 6 +++---
 assembler/main.c                        | 2 +-
 benchmarks/gem_exec_reloc.c             | 6 +++---
 benchmarks/gem_latency.c                | 2 +-
 lib/igt_chamelium.c                     | 4 ++--
 lib/igt_kms.c                           | 6 +++---
 tests/amdgpu/amd_multidisplay_modeset.c | 2 +-
 tests/chamelium/kms_chamelium_frames.c  | 2 +-
 tests/intel/gem_exec_alignment.c        | 4 ++--
 tests/intel/gem_exec_fair.c             | 4 ++--
 tests/intel/gem_fence_thrash.c          | 4 ++--
 tests/intel/gem_ppgtt.c                 | 4 ++--
 tests/intel/gem_render_tiled_blits.c    | 2 +-
 tests/intel/gem_userptr_blits.c         | 2 +-
 tests/kms_atomic_transition.c           | 6 +++---
 tests/kms_flip.c                        | 4 ++--
 16 files changed, 30 insertions(+), 30 deletions(-)

-- 
2.44.0

