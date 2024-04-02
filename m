Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5969ECD128D
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 22:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323DD1120E5;
	Tue,  2 Apr 2024 22:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWiTgKoA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79BA1120E5
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 22:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712096218; x=1743632218;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DR8BWBHhJY2UaUlYEY8e1P/u2Zt6H0s16FAq4SAmMTQ=;
 b=OWiTgKoAt5xwnm0Ad6HgMhA1ZyoqjC4MzIMoVLsQ8KJrLFglYNahMsrG
 iGuYJs1tR5r+20iyWYUmMd/ooXb9MC+a6pNJUVxvLEYjRWees5GTbXd5O
 iIbTDngRHdzwP9qApi8MHyFC5yCQF27cGEwkiv6zgRXGQZDZqcrktGwHo
 baHOOPTtrz2HwQAJyiSJyp83RuCrLbBHY+Cum+e73FxeLvHCrZEUNZiIr
 v0xRq964k9aw94MogYJ1ZH5k7uNBHJ0EW33VxaPP83Vq/lV3Ub28iIiNE
 zAhKgGWbnThM1iwd1K2LgYNQdreLh8fmq+Hmn3ddSRTlM6ky/mso1caH+ w==;
X-CSE-ConnectionGUID: 3+kF0BROTjajNVIXhmL44w==
X-CSE-MsgGUID: vOJ8jLQmRfu94VKt4rgXjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7424318"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7424318"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
X-CSE-ConnectionGUID: RzLQ6PGzTFWSPlxbB+mLow==
X-CSE-MsgGUID: UT7mpuEASC21zGhJn8XjpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18035591"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 0/8] Refactors and fixes for drm_clients
Date: Tue,  2 Apr 2024 15:17:08 -0700
Message-ID: <20240402221716.1840148-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Some refactors and fixes I did while adding support for
gputop in xe. I will send those later on top, but I think
these can already be reviewed.

Last patch should NOT be applied for now. In my mind the lazy approach
makes total sense and should be faster. But reality doesn't agree with
me and after timing igt_drm_clients_scan() it shows a ~10% slow down.
Hard to explain. Maybe I didn't have enough coffee when benchmarking it. 

I don't like much the strstartswith() with and extra output param.
Maybe changing its name to something else would make it better.

Lucas De Marchi (8):
  lib/igt_drm_clients: Use calloc
  lib/igt_drm_clients: Fix sizeof calculation
  lib/igt_drm_clients: Fix leaks
  gputop: Free clients on exit
  lib/igt_drm_fdinfo: Simplify find_kv()
  lib/igt_drm_fdinfo: Stop passing key twice
  lib/igt_drm_fdinfo: Remove prefix arg from parse functions
  lib/igt_drm_clients: lazy stat process

 lib/igt_drm_clients.c |  74 ++++++++++++-----------
 lib/igt_drm_fdinfo.c  | 137 ++++++++++++++++++++----------------------
 tools/gputop.c        |   2 +
 3 files changed, 108 insertions(+), 105 deletions(-)

-- 
2.43.0

