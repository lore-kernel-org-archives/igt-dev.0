Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC008FA3741
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 10:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C1910E247;
	Fri, 13 Sep 2024 10:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGe4Ct7Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A8110E247
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 10:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726224281; x=1757760281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BHemykLe3h/IPzxhGgOv5m3WStGWW9JU5X/K4P0cMv0=;
 b=KGe4Ct7Y62d10sAqBQp/+1swQrUKHS2M4Ew4C35BJ8dpzVDroElSVvYz
 g/R/hKbPWGfSJz7CuJHQCNb0t1CnZpSEBMSdhaDOi3FDubCblUkOvwcc6
 7b+xWHKAn9ljXNqGhOc4nLorkYynHnw+wT7M75yI6pZmE4QbwKSArxbi2
 Pc8sy7G7QuUXokT2RTNHS0ZQTxiM4BFwF81hffjXFU26cFeZV8Zhf/llj
 LnOsxtqaNdsuZNROCq/XAYHsVoJ/1soSqX7IfBYVtjVz/37BsULPCsDui
 xnxGLCiO2VMM+vefr5R8hRsihIsw5f9SsbwCxqZnGguHTzLiHBKKJ0rkk Q==;
X-CSE-ConnectionGUID: QG7hs0G5SUC2RsaOMg2+Xg==
X-CSE-MsgGUID: 6rQalZ2RRr6ggi4yEZg4Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35692470"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="35692470"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 03:44:41 -0700
X-CSE-ConnectionGUID: HqQaxV3rQYCWnGZdFRdyWA==
X-CSE-MsgGUID: HigugtzwS/mMdjbT2m+56Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="98704211"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.162])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 03:44:39 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Martin Peres <martin.peres@linux.intel.com>,
 Simon Ser <contact@emersion.fr>, Petri Latvala <adrinael@adrinael.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH i-g-t 0/3] Switch the FFT library to meow_fft
Date: Fri, 13 Sep 2024 12:44:31 +0200
Message-ID: <20240913104434.56529-1-kamil.konieczny@linux.intel.com>
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

This is a resend of Ryszard Knop series from here:
https://patchwork.freedesktop.org/series/107093/

with a rebase and small cleanup in lib/igt_audio.c
and adding a SPDX licence to meow_fft files.

Old series description:

   In Chamelium tests, FFT is used to compare the transmitted vs received
signal. Currently this is done with the GNU GSL library.

GSL is available under the GPL license which is incompatible with MIT,
as noted in #38. Switch to meow_fft, licensed under 0-clause BSD.

Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Martin Peres <martin.peres@linux.intel.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Ryszard Knop (3):
  lib/uwildmat: Move to a dedicated vendored library directory
  lib/vendor: Add the meow_fft library
  lib/igt_audio: Replace GSL FFT usage with meow_fft

 lib/igt_audio.c                      |   74 +-
 lib/meson.build                      |    7 +-
 lib/vendor/meow_fft/meow_fft.c       |   12 +
 lib/vendor/meow_fft/meow_fft.h       | 2402 ++++++++++++++++++++++++++
 lib/{ => vendor}/uwildmat/uwildmat.c |    0
 lib/{ => vendor}/uwildmat/uwildmat.h |    0
 6 files changed, 2480 insertions(+), 15 deletions(-)
 create mode 100644 lib/vendor/meow_fft/meow_fft.c
 create mode 100644 lib/vendor/meow_fft/meow_fft.h
 rename lib/{ => vendor}/uwildmat/uwildmat.c (100%)
 rename lib/{ => vendor}/uwildmat/uwildmat.h (100%)

-- 
2.43.0

