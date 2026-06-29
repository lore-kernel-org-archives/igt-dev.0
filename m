Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29AFC43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 09:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804D810E79A;
	Mon, 29 Jun 2026 09:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tgesv33I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956C710E7A4
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 09:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782724065; x=1814260065;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oDsJCOhBy5KWyw3/HsOZDmLcXn/AIJleEr6FowQYnlw=;
 b=Tgesv33IJCRuCnF5sE7AiURhPSfa90efJzX4nfnjZstgo/3jbg9vnouX
 iqj6PiADfw0+aNgIqcsqyVXnHWGCHqFrmIki3kdzIRJ525asFLWEVz/qN
 XG6epo82wi2n6CP8WDHIFp9KBtjz8zptAoh4EdxEHh6BwLoUIpVJUFJsz
 403dpk9JU/1PcFoVVVdgOD+mLeVipY9hPGZsYObkatLiV2FT1v1bphR3+
 9gYwavjASHHVtUIZ6DdTeo1iliDHidfXJzfg7CaZsntxZ5ZabaGFsGjGH
 0ZBNy719gXT2mBkClWSvcnsViMnmy7IBqMFEGiC+4YhEie3EQ22je4hMn w==;
X-CSE-ConnectionGUID: IbTUGOpDRMigqMzA73bhzg==
X-CSE-MsgGUID: zy17EeFJRuGBSYwJ3EaGvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94893468"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94893468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:07:45 -0700
X-CSE-ConnectionGUID: +RkzDsnmSbSaxSURQdxL+g==
X-CSE-MsgGUID: HpmEtuLMRF6+dZnDvfda6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="247449744"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 02:07:43 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 0/3] sharpness_filter: limit suspend
Date: Mon, 29 Jun 2026 11:07:37 +0200
Message-ID: <20260629090740.2706320-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next series of limiting # of executed suspend tests, but applied
to kms_sharpness_filter.

Other series:
 * kms_ccs, v1: [1].

Series already merged:
 * kms_flip, v9: [2].

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20260622225811.1703400-1-michal.grzelak@intel.com/
[2] https://lore.kernel.org/igt-dev/20260330075508.1003899-1-michal.grzelak@intel.com/

Michał Grzelak (3):
  tests/sharpness_filter: fix typo
  tests/sharpness_filter: limit #outputs used during suspend
  tests/sharpness_filter: limit #crtcs tested during suspend

 tests/intel/kms_sharpness_filter.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

-- 
2.45.2

