Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A25ACD98C6
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 06:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A135610ECF3;
	Thu, 11 Jun 2026 06:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMNtc4qb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64A410ECF3
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 06:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781159476; x=1812695476;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=12XMTAfvV6f7L3m6zdwzHZrJnuWhF8m1YL6aupH4d1s=;
 b=PMNtc4qbpI8Zx1SFa90qFlLLfgjnTdBTtttmzbJY1Aumn19KNKZKpFCS
 Mep7Ce72TSRWwW1n7sVxNk0fylKmYRnYolmBKVn1FNgTLNXnVo1Ti/Icx
 Gv5Bb8L9k4xJaKbks5SRp/Fm9apoK2E3H68Cw7hSClQ4t8JFR1s5aoyaH
 N9lPnm3fAO7UX95j65Lzs/QBS9HD6EntY8tF2KOzqsVF5FUW0FUg0SGnk
 A/5/AroUQeLWf29u0BKWWd86+ISV6nsjW+LlPV1zumA+AttZsRyyhxQrZ
 t+Dr5CaPxGh70qH93yJR272J2mJ0b0IktjxxWondc5mWf8tmkrA8fG+jP Q==;
X-CSE-ConnectionGUID: PdJkIaY6S5mNe09Kbij9dg==
X-CSE-MsgGUID: Edbe3Ud+RjqU7HzL9zsyNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69509276"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="69509276"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 23:31:15 -0700
X-CSE-ConnectionGUID: if5F5MwyQYWBxIDQ+JvOsg==
X-CSE-MsgGUID: h/4zrfKPT4SkdL6yHiHk2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="246263077"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa008.jf.intel.com with ESMTP; 10 Jun 2026 23:31:13 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v5 0/2] Improve max-bpc query error handling
Date: Thu, 11 Jun 2026 12:12:11 +0530
Message-Id: <20260611064213.1300403-1-pranay.samala@intel.com>
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

