Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD43ED75E58
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 14:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9429C10EB96;
	Fri, 22 Nov 2024 14:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8AgQ6Jf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8935910EB96
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 14:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732286101; x=1763822101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QjQ7pnmbGzgDESvm9PrlwzIGzngdErTKmOnG8RWqWPk=;
 b=X8AgQ6JfaTa3b0vclnuQX5OPWxYmGHFjAwxIYMLef9HjjE9LwFA9DSQ/
 wpSN91z9OslcsK8UUNpVBK/0KfrRat9Zdf3DtZw4aK65OGu+1PppSqZdZ
 JhcXohb92qjrDeoaz+Wy17J3iLjKe7ioy+INo2NWPUsxJaUJW+ncF1o8j
 qmKdFb1J1MtHMcNRrm2NeoQTKbWMAi2Pkmr1o0IuKVoW+ioZFdlYd7UE9
 sFsZFgoQk1eAoXaviARNoy6krNrPDEJje8mzbHtGyl6lD7lYsMQIW9tgv
 Yh0N6nzg0jR9UvgkMplRtr5lHNtIyzhRx48lZFBaoQlbaEE89gCk2O6ZK Q==;
X-CSE-ConnectionGUID: 5VWRImj7QGWoUSRMaulMlg==
X-CSE-MsgGUID: SJVmhtQ6TO6A/TsaMsMUtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="57845197"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="57845197"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:35:01 -0800
X-CSE-ConnectionGUID: 1a8B1RI/RoCPtrh4PVFihQ==
X-CSE-MsgGUID: zikqDfU1QOCrBL5xux3Xdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="91383948"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.141])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:34:59 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, christoph.manszewski@intel.com,
 jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
Subject: [PATCH i-g-t v3 0/4] tests/intel/xe_eudebug_online: Introduce
 read/write pagefault tests
Date: Fri, 22 Nov 2024 16:34:42 +0200
Message-ID: <20241122143446.659440-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
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

Add a pagefault read/write test case so that the xe_eudebug_online test can
validate the invalid access pagefault scenario that the eu thread can cause.

For these tests, use the newly introduced DRM_XE_EUDEBUG_EVENT_PAGEFAULT 
event and struct drm_xe_eudebug_event_pagefault.

The added test cases are shown below.
	xe_eudebug_online@pagefault-read
	xe_eudebug_online@pagefault-write

changes in v2:
    Fix the function name to be more clear. (Andrzej, Christoph)
    Refactor of output attention bits on pagefault event handling (Andrzej)
    Remove / update redudant code (Andrzej, Christoph)
    Use igt_container_of() macro (Andrzej, Christoph)

changes in v3:
    Make block write/read to 1 word (d32) from 4 words(d32 x 4) (Andrzej)
    Update the function name (Andrzej)
    Drop not needed code (Andrzej)
    Integration to handle pagefault scenario in eu_attention_resume_trigger() callback. (Christoph)

Gwan-gyeong Mun (2):
  lib/gppgu_shader: Add read D32 from ppgtt virtual address
  tests/intel/xe_eudebug_online: Add read/write pagefault online tests

Jonathan Cavitt (2):
  lib/gppgu_shader: Add write D32 to ppgtt virtual address
  eudebug: Add eudebug pagefault event declarations

 .../drm-uapi-experimental/xe_drm_eudebug.h    |  13 ++
 lib/gpgpu_shader.c                            | 180 ++++++++++++++++++
 lib/gpgpu_shader.h                            |   3 +
 lib/iga64_generated_codes.c                   |  40 +++-
 lib/xe/xe_eudebug.c                           |  11 ++
 tests/intel/xe_eudebug_online.c               | 146 +++++++++++++-
 6 files changed, 386 insertions(+), 7 deletions(-)

-- 
2.46.1

