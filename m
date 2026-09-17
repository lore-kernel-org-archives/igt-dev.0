Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A187CC982D6
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 14:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3237A10E02B;
	Thu, 17 Sep 2026 14:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqcDSewm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A427010E02B
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789656817; x=1821192817;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lm7wl2VgklPs22gWnUP6aAPjXLMAfW5NAdXiBBAwpvM=;
 b=AqcDSewmjliwhRz7oye9ZKNbMt268hdVq8i5/3htsaM2zhxwnQ/HCxXN
 FcoHEJjE5Q2SOJKDiDKmTKkavF8flSIoMlk6P5G4ryfuYlYcAv0uJbb68
 e+xZnBVVsmHSdOg4v7FfO35nvEKLd5/+VPxVPpBJwcc+Y1H43Rv+PB5d/
 BVPQFYmIzRXQx7ml2NWzXpG3Ss3RU7lV/hWkGK0+zuwhRuDwsP9Sy6TkK
 v5VDjBWytipAmb6GBnEP0eSj98AqKJBPHLMT+kFHWz2kmJd2G/LilV3Gj
 mtTHsZr4fdNYfN0CG1zCXlZG5EJEPG1tQ7k45pwsnOs9pvHZF0TPLFw5q g==;
X-CSE-ConnectionGUID: YF2CeQ+mTCyQPoaTpAgUwQ==
X-CSE-MsgGUID: 8MB+RaXmQdq0wteQknPWew==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92595434"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92595434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 07:53:36 -0700
X-CSE-ConnectionGUID: OCMYhYrmQESIpeMwHYvcgA==
X-CSE-MsgGUID: YT/NNoXQSSeWCAnvHopbTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="279070387"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.74])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:53:35 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 0/2] lib/igt_core: Make build reproducible
Date: Thu, 17 Sep 2026 16:53:29 +0200
Message-ID: <20260917145331.78274-1-kamil.konieczny@linux.intel.com>
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

v3: reworded subject and description (Kamil)

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  lib/igt_core: Create new way for finding PNG data files
  HAX DO_NOT_MERGE: print path for opened data file

 lib/igt_core.c                             | 65 ++++++++++++++++------
 lib/igt_core.h                             |  3 +-
 lib/meson.build                            |  1 -
 tests/intel-ci/i915.fast-feedback.testlist |  1 +
 tests/intel-ci/xe.fast-feedback.testlist   |  1 +
 5 files changed, 51 insertions(+), 20 deletions(-)

-- 
2.55.0

