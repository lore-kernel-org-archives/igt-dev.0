Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A649DD65C7C
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 14:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A4A10E0DE;
	Fri, 15 Nov 2024 14:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ky4+0N9w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7C610E0DE
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 14:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731679943; x=1763215943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DCkcxbrLktMLZ0KrPmLvB7e+bK6E+y1Z8CkvRsMlO+M=;
 b=ky4+0N9wvMJvVIs7yJkM/5FCTNILrA5b28jLiW5IcPPVkNLjITlw66EK
 QLbHuQQOxprPkIHCFkUUAd9RWxv1rbURavOYLsvPWGHMnYbqMfXbL6oP9
 OPzafNQ7Z5wNGvvGPuQPssIx2qx/nACkqYd7Y3BjJ+3ipTUEExus0t0bu
 p7N6ivzw6B8THaSR6FjY217b/Pk+LF+bnF/a2we9S7IUb7iz9MVFutRh7
 22BU4h71UyF0noutxSO+LwG6BdQHER63rWErUVL8/Ze5vIvk3xrVmp5cb
 J4Hw8Go9p9maHDZH4l+UPOjc4XUkKOp4fADL3BR+5gNGaTEIvbompCb/3 g==;
X-CSE-ConnectionGUID: AIHocoDTTuC0cCf2V4doQw==
X-CSE-MsgGUID: wN3b5cx2R5WY10fidiU/gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31822540"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31822540"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:12:23 -0800
X-CSE-ConnectionGUID: 1Ie9e5jiR7G0aclZmCeY+g==
X-CSE-MsgGUID: mIZWjETISrWWFlOU/pptpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88979954"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:12:19 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
Subject: [PATCH i-g-t 0/4] tests/intel/xe_eudebug_online: Introduce read/write
 pagefault tests
Date: Fri, 15 Nov 2024 16:11:28 +0200
Message-ID: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
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

Gwan-gyeong Mun (2):
  lib/gpgpu_shader: Add causing a read pagefault from the eu thread
  tests/intel/xe_eudebug_online: Add read/write pagefault online tests

Jonathan Cavitt (2):
  lib/gppgu_shader: Add write to ppgtt offset
  eudebug: Add eudebug pagefault event declarations

 .../drm-uapi-experimental/xe_drm_eudebug.h    |  13 ++
 lib/gpgpu_shader.c                            | 201 ++++++++++++++++
 lib/gpgpu_shader.h                            |   3 +
 lib/iga64_generated_codes.c                   | 100 +++++++-
 lib/xe/xe_eudebug.c                           |  11 +
 tests/intel/xe_eudebug_online.c               | 219 +++++++++++++++++-
 6 files changed, 542 insertions(+), 5 deletions(-)

-- 
2.46.1

