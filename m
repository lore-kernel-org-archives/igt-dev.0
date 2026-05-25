Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E957CD5BBF
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 09:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B108110E05F;
	Mon, 25 May 2026 09:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEkqBmcN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0D010E05F
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779700538; x=1811236538;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uqua2C1zqQkMEo38ja5AtW+CnRrpFGkGIqjvMh68au4=;
 b=VEkqBmcNIWDHSPKw94rQLrRl/g7nkHSPrJ99a9HBTZPnmq9dZZoRcpKb
 qxN5pGV0m+kSV3E0/9lN0zVsaWZ4biYJvsvCDAb/X+XsKgsd83XEfhndx
 AApaPkh2rAnetCo6XZ6nhZA7ug81GB2wXSjrPhVNzaPclXbQ3WtIBCKCk
 lxim4ZH5IpOwonzqzdiKAEKErXjjmSObSLd7lJVBJN/+R8RBTsX5wlplX
 cQBbSFx1+CDdi8id8BAHVuqoqSIO2W2+w1tqibj01pRkUalHd5dKaGCp2
 ERWcwgmy2Vw5YCA7K1Fu9vXUNYJLa8Vd9bLwlDD1qQDjF/AC6k+F+W/L5 Q==;
X-CSE-ConnectionGUID: LyekKxssSNinOy/MiZKg1A==
X-CSE-MsgGUID: 48SKdw04QMSiNvzZaMvMdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="98097360"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="98097360"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:15:37 -0700
X-CSE-ConnectionGUID: tr5xKiZMQ+6YJj6psof6Hw==
X-CSE-MsgGUID: sySHcrdcTiy0VpLqn7g+4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="246627464"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa005.fm.intel.com with ESMTP; 25 May 2026 02:15:25 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 0/2] Improve max-bpc query error handling
Date: Mon, 25 May 2026 14:56:19 +0530
Message-Id: <20260525092621.668816-1-pranay.samala@intel.com>
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

 lib/igt_kms.c                          |  38 ++++--
 lib/igt_kms.h                          |   2 +-
 tests/amdgpu/amd_bypass.c              |   6 +-
 tests/amdgpu/amd_dp_dsc.c              |  10 +-
 tests/intel/kms_dsc.c                  |  13 +-
 tests/intel/kms_frontbuffer_tracking.c |  10 +-
 tests/kms_color_helper.c               |   5 +-
 tests/kms_dither.c                     |   9 +-
 tests/kms_hdr.c                        | 182 ++++++++++++++-----------
 9 files changed, 173 insertions(+), 102 deletions(-)

-- 
2.34.1

