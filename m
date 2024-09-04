Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEE0CA0ED3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 08:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA2C10E6CC;
	Wed,  4 Sep 2024 08:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gL/CIsrf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2B510E6CC
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 08:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725439382; x=1756975382;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cHJLXpxJFEL5kuhuFeFf21zBubUX1dhM6L4hdUSgJgk=;
 b=gL/CIsrflJHC/YMLwoGdSCf0mHdnK3/gO7M0OYovG+cpuTERe1KbzUMr
 4pUI5zkiWXgQJ6US5ihyD9hFCYNj/Xt+8LCiQ6yCqltn7UbTR3a9g2z8E
 /5ZI5yI9+iRzMB8viHf8mQtdBBC+R9TWVO071axfAzEN66Mw6qoWJhA92
 bb2F/Yzp8kcWspDJmQL/0bjO3ue7MYiLCdVsTv1nojjBKqoMdCbl9xkfW
 +r49nrQ8yHiEfPl9M4Dotn3Vjs/C04PNpW7ioHvhl2lEGgliQKGk2OxxY
 5T07H/jEhFvdOkn/Iaib9nzWJSXJ7vkXvJfqevMvaZLaMyiBBLMZooZ7N Q==;
X-CSE-ConnectionGUID: amsP7sjAQbeg4tBXGTLgLg==
X-CSE-MsgGUID: ikRFJ3EsRoq0TDoTVY2huQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23645222"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="23645222"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:43:02 -0700
X-CSE-ConnectionGUID: bo4jafY9QsOuwIGXgpjHgg==
X-CSE-MsgGUID: 7/EC+nBlT/SWGpmWvIGqxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="70005177"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.15])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:43:01 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 0/1] Introduce intel_bb_create_with_context_in_region
Date: Wed,  4 Sep 2024 10:42:48 +0200
Message-Id: <20240904084249.4365-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

This patch extends __intel_bb_create to take memory region as argument,
making it possible to create batchbuffer in given memory region.
Existing helper functions preserve original behavior.

To make use of this extension, intel_bb_create_with_context_in_region
is introduced, that creates bb with given context in given memory region.

v2:
 - Support both i915 and xe in intel_bb_create_with_context_in_region
 - Extend intel_bb_create_full to use region argument
v3:
 - Introduce is_i915 variable to avoid calling is_i915_device() twice
 - Squash "Fix igt_require in intel_bb_create_no_relocs"
   gem_uses_full_ppgtt() calls gem_gtt_type(), that expects i915 drm
   file descriptor. Wrap the igt_require in is_i915_device() check
   to fix the issue.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (1):
  lib/intel_batchbuffer: Introduce
    intel_bb_create_with_context_in_region

 lib/intel_batchbuffer.c | 74 +++++++++++++++++++++++++++++++----------
 lib/intel_batchbuffer.h |  5 ++-
 tests/intel/xe_pat.c    |  4 +--
 3 files changed, 63 insertions(+), 20 deletions(-)

-- 
2.34.1

