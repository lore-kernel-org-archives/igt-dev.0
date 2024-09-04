Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B299FCD3431
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 07:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA86A10E6A2;
	Wed,  4 Sep 2024 07:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIdGOvUy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CC810E69E
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 07:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725435508; x=1756971508;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y3cXsi/4d3mX14WL3ZTPOcHPljdfrSqNbIq6R8Eae8Y=;
 b=RIdGOvUy/IEwNESyGm265lN3pBtuyHfScaY+FwhEWR2jPoWw2UasDnVZ
 aVIP0evQ3a9SEoyL1G0Z9mB7u3vYoLNJeTokJuPPlZcQkGfMpqAgYpjby
 2IBIEvofXfil7AL7R46OAYUMkM8A9f/b7Deya2tl9Mycjy6ywnOgB5pM+
 KkV9OHtcIVZgQcNEM2ESNVlm/AWyNNbyxf+vqy1KPtQ1n4DFyoDCK0gLB
 S6FUqL8Rjw0wx+eNSkd7qBQHtvoG+UHphg5HLForhogR/eN29uA3E+Lb2
 WxzTOzWllTbOaHbbqe6lmgMuzHqBqfxHXNXKuS6iOO3d6LSQbrWm2rHdj w==;
X-CSE-ConnectionGUID: JwaFOyIQTVGG1EFNcP74dA==
X-CSE-MsgGUID: 54pWrxI5SPix1ptKxia3xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23953734"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="23953734"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 00:38:15 -0700
X-CSE-ConnectionGUID: CGKdNA1xSJiczAkDnsVq7A==
X-CSE-MsgGUID: FnMvuBMKTO6/jxAlyNsyJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="64997066"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.15])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 00:38:13 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/2] lib/intel_batchbuffer: Introduce
 intel_bb_create_with_context_in_region
Date: Wed,  4 Sep 2024 09:38:01 +0200
Message-Id: <20240904073803.3239-1-dominik.karol.piatkowski@intel.com>
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

This series extends __intel_bb_create to take memory region as argument,
making it possible to create batchbuffer in given memory region.
Existing helper functions preserve original behavior.

To make use of this extension, intel_bb_create_with_context_in_region
is introduced, that creates bb with given context in given memory region.

v2:
 - Support both i915 and xe in intel_bb_create_with_context_in_region
 - Extend intel_bb_create_full to use region argument
 - Fix igt_require in intel_bb_create_no_relocs

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (2):
  lib/intel_batchbuffer: Introduce
    intel_bb_create_with_context_in_region
  lib/intel_batchbuffer: Fix igt_require in intel_bb_create_no_relocs

 lib/intel_batchbuffer.c | 68 +++++++++++++++++++++++++++++++----------
 lib/intel_batchbuffer.h |  5 ++-
 tests/intel/xe_pat.c    |  4 +--
 3 files changed, 58 insertions(+), 19 deletions(-)

-- 
2.34.1

