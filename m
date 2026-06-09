Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C105CCD8CAE
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 05:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5320410E08F;
	Tue,  9 Jun 2026 05:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReeEDfTM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBAD10E08F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 05:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780983962; x=1812519962;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=12XMTAfvV6f7L3m6zdwzHZrJnuWhF8m1YL6aupH4d1s=;
 b=ReeEDfTM1JWanjOoOvBGXVytErolPkz25Q46WnznJzmiwLjZ/GXgnE3C
 wJ0aBL6G32RB76uGb5K269Vz1HUvGA3dGWVksaZK+zqlhfucTmrE1chOk
 ICWRCSS+IPXRuXBhT6zQn1EDHj9/Vmdg1so/+OiSARk7To4zZKqQDPuJo
 YK5yf7Ir0Mrf0unSCeqzmrSo1cCMqnbjeE9fg7h3XGqnd481ZKr8FpqnV
 Lvi0t2f2JAKG/4EK/OzrAQNk6gM9tyPeXlPvN2equ5WR+4CHh9evesttL
 7OywvZGaSJJviFfztORR2uwY6OXH8bKlwVun8/omszLX8H2KWIigg9rc6 A==;
X-CSE-ConnectionGUID: HN4N9nOHQ5igPdGaWSlWRg==
X-CSE-MsgGUID: CMooAXwVQeeH2cJfzilW6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92057030"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="92057030"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 22:46:01 -0700
X-CSE-ConnectionGUID: wL6WUll3SJWI8gBn3Y6SWg==
X-CSE-MsgGUID: lQNYte0FST+5mGkglJIzJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="269773717"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa001.fm.intel.com with ESMTP; 08 Jun 2026 22:45:59 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 0/2] Improve max-bpc query error handling
Date: Tue,  9 Jun 2026 11:26:57 +0530
Message-Id: <20260609055659.1025146-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series moves max-bpc failure handling to the helper/API level.

The previous change modified kms_hdr dynamic-subtest flow to handle
max-bpc read failures, but the real issue was that
igt_get_output_max_bpc() handled read/parse failures internally.

Restore the original kms_hdr flow and update
igt_get_output_max_bpc() to return status so callers can explicitly
handle failures with clearer skip/continue decisions and logging.

Pranay Samala (2):
  Revert "tests/kms_hdr: Move capability checks inside dynamic subtests"
  lib/tests: make igt_get_output_max_bpc() return status and handle
    failures in callers

 lib/igt_kms.c                          |  41 ++++--
 lib/igt_kms.h                          |   2 +-
 tests/amdgpu/amd_bypass.c              |   6 +-
 tests/amdgpu/amd_dp_dsc.c              |  10 +-
 tests/intel/kms_dsc.c                  |   5 +-
 tests/intel/kms_frontbuffer_tracking.c |  10 +-
 tests/kms_color_helper.c               |   5 +-
 tests/kms_dither.c                     |   9 +-
 tests/kms_hdr.c                        | 187 +++++++++++++++----------
 9 files changed, 180 insertions(+), 95 deletions(-)

-- 
2.34.1

