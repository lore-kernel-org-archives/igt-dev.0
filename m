Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA06C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 08:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1377210E251;
	Tue, 18 Jun 2024 08:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TiNWpgnV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72A010E251
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718700268; x=1750236268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ghm5iWZOFrdQGkzRduhIVrr4ihG0/NVnHi/xOrkHvj0=;
 b=TiNWpgnVM+Dq4unSH3g4dl4EQGker0U4SxreB1cZrTqGO1+ZSpuPALVi
 f9FBP9Obpmso9aj0xVaZxNpW+sdwQTZoEgd4CF7d6wKFTcIK/lwSOjWYD
 wYkjKJyly5WsR2AvpQZUzJ61euwpIcBJpX2HO+Um8HZuKSvKsBo7bGFua
 5rDhOokeo+OVcSwbc90Nle/zzLct4TEkd0g28GIPLNU6kyCoZFatzrAhw
 Ip5q9B2El/Deqt/uY1kxPsKDSOPHA6NyYMjY+tOgFM79oi2+M4+Mx6neZ
 IuuVsdAJWj1Essxbbrq4snF8uAHR/rtEsEICmhpOZsFt/UEBUjseT5s0n g==;
X-CSE-ConnectionGUID: V5Zsr0p0TdGYdCqhdZiqtQ==
X-CSE-MsgGUID: B0FhHiHhQAK+7yZtYQtdlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15707785"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15707785"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:44:27 -0700
X-CSE-ConnectionGUID: +enXwO/kTyeB6zGPYaqjsQ==
X-CSE-MsgGUID: LPO10VXES9qIzk+pinFm7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41342652"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by fmviesa007.fm.intel.com with ESMTP; 18 Jun 2024 01:44:26 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 0/2] Add new test to validate adaptive sharpness filter
Date: Tue, 28 Mar 2023 14:58:36 +0530
Message-Id: <20230328092838.147903-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

This test to validate adaptive sharpness filter.

Swati Sharma (2):
  lib/igt_kms: Added "sharpness strength" as crtc property
  tests/kms_sharpness_filter: Add adaptive sharpness filter test

 lib/igt_kms.c                      |   4 +
 lib/igt_kms.h                      |   1 +
 tests/intel/kms_sharpness_filter.c | 668 +++++++++++++++++++++++++++++
 tests/meson.build                  |   1 +
 4 files changed, 674 insertions(+)
 create mode 100644 tests/intel/kms_sharpness_filter.c

-- 
2.25.1

