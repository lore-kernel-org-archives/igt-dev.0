Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F503D6ED15
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1AB10E27F;
	Thu, 21 Nov 2024 12:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOCkJvt4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763A710E1CF
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732191819; x=1763727819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7d7FJvA9b1qvMULTs+YGBR4d9yzehkZy3mOVvrhd1L8=;
 b=kOCkJvt4trouZ5KCDxUvVQWAWCgNEDxbkrahJEjZQDazStn4MCRzvclh
 rpp03e4E+pRiTzy83KRVXNOSjEBnJxn41Bng1a5zkNud1ufpOfeVX3jHD
 60cCIkpAih3ef34LtuC/UW3JWu+FFJHy8hdabLnQkV2KmESg6se0aBg9Y
 TlFt21gRvw+VJz9oNWux/4ZsbH0HG8pWHRyKtGJBemxQ27Hb6CoYyvWLO
 BvBk/Qj5/hCoUOdiD7MyBHwtu1ypsG1GwnKAK5x6O4adhFirKxTpZpeDN
 YuGWsb/bLELZGGtGE+QC3VSdLSKN5jDyzdtO3BBKVbXxW1YcOw9K0Cp9m w==;
X-CSE-ConnectionGUID: 1GU6FF4WTauvbrvhIxXdiw==
X-CSE-MsgGUID: XhSkrdBoRfCeWVAGEjXmZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43365041"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43365041"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:23:38 -0800
X-CSE-ConnectionGUID: NQsZLWiwRfWWs51LzqPaTg==
X-CSE-MsgGUID: Bz+jmzB4SQOawDGuOjZW8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="91052605"
Received: from carterle-desk.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.80])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:23:36 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, christoph.manszewski@intel.com,
 jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
Subject: [PATCH i-g-t v2 0/4] tests/intel/xe_eudebug_online: Introduce
 read/write pagefault tests
Date: Thu, 21 Nov 2024 14:22:25 +0200
Message-ID: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
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

Gwan-gyeong Mun (2):
  lib/gppgu_shader: Add read D32 from ppgtt virtual address
  tests/intel/xe_eudebug_online: Add read/write pagefault online tests

Jonathan Cavitt (2):
  lib/gppgu_shader: Add write D32 to ppgtt virtual address
  eudebug: Add eudebug pagefault event declarations

 .../drm-uapi-experimental/xe_drm_eudebug.h    |  13 ++
 lib/gpgpu_shader.c                            | 188 ++++++++++++++++++
 lib/gpgpu_shader.h                            |   3 +
 lib/iga64_generated_codes.c                   |  42 +++-
 lib/xe/xe_eudebug.c                           |  11 +
 tests/intel/xe_eudebug_online.c               | 178 ++++++++++++++++-
 6 files changed, 429 insertions(+), 6 deletions(-)

-- 
2.46.1

