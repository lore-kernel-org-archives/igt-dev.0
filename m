Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CD2C982D6
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 14:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4604310EF13;
	Thu, 17 Sep 2026 14:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGX7xZa6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA3810EF13
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789655347; x=1821191347;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gY3uS3Avfglq4Po/44vNwAnIZAM3wuYh3OJJpcmuKek=;
 b=GGX7xZa6xXTf/DaAlKPvQ96u2u78FFodNy7a1UjbDt3lQrI1NaZqNdN0
 uVhzIplvCGNh9Ich/HZZunuZzophBdvTlau9egZ9bDfE8L6ooUkpTmll4
 f65sWrMZE/Uklwv4Rgir9VjlpO1hN509OSUjeDfmhAFBe5L6gQQVmEMcY
 YZkZF0kz1fX30aFJ5DCJnNJJxAd4VpLdwfyiAV3BYv5KZUeN7FSKV4EbI
 VR/DvTskW/fij/+pc4Q0F1BvpbdCqRVrBJAPKkaIJ49M2NguR+z4p52BB
 wcKq+F1OlNLrmo4Mx0JjzkldBAsi//mZRU1zOThZpqBLBKP56KUrj4ws1 A==;
X-CSE-ConnectionGUID: /V6UyocFTjefezyaugjrOA==
X-CSE-MsgGUID: ZsUuTj6+RZeRsEeRIA201g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89216616"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89216616"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 07:29:07 -0700
X-CSE-ConnectionGUID: bCnCaT1NSmCrmexzcHodgQ==
X-CSE-MsgGUID: I0b8FAWsTTKssLPFXKx3BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="279051418"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.74])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:29:03 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/2] lib/igt_core: Make build reproducible
Date: Thu, 17 Sep 2026 16:28:49 +0200
Message-ID: <20260917142851.75559-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

  Remove build/data path from libigt.so.0 as this breaks
reproducibility, according to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/190

Before this patch:

strings build/lib/libigt.so.0 | grep build/data
/home/user/igt/build/data

After applying this, it was not found.

v2: changed subject of patch, as I will not verified reproducibility,
  only addresed a build data path present in lib (Kamil)
  reworded description, added second HAX patch for testing (Kamil)

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  lib/igt_core: Remove build path from data paths
  HAX DO_NOT_MERGE: print path for opened data file

 lib/igt_core.c                             | 65 ++++++++++++++++------
 lib/igt_core.h                             |  3 +-
 lib/meson.build                            |  1 -
 tests/intel-ci/i915.fast-feedback.testlist |  1 +
 tests/intel-ci/xe.fast-feedback.testlist   |  1 +
 5 files changed, 51 insertions(+), 20 deletions(-)

-- 
2.55.0

