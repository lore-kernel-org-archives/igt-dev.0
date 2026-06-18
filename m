Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCCACD98DE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 06:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A7C10ECA5;
	Thu, 18 Jun 2026 06:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIgbaVSf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC58310F194
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 06:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781763768; x=1813299768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4ZdVVpSmNk6BNrWgylDetnk9dcHXW3E5lXwP+ptL/1o=;
 b=TIgbaVSfC7F1TFe4tm38bNda0s6sv/SHq5dffgPcUMrom3JSwpCHirSC
 d6Me6rhuCyJbhtUrhBW8K5vkz28zjzWfIe/D1+1xTHZLtwJc2bNjhOI+k
 Hr7cpitYlXgJWgH0scWKNJWEbx7izu0pKYogw65IeOhUdwZ7bHTtT2SKD
 zrpfRkBQPu/G2jwIwT/C8tM3aeLbZ0/OCqMHiDWBD5HVFTUogUIMnAy8J
 9SOfKqCQ4hYg/Dywe/MHKZf4CqJHAHHu9KbXzh3cA3AjC1sU35daaVK0E
 ZLRSgP1nlDWKpQBRHcUynqtWZ7LoEEaZoyppbWvoqP0eEMtXip/31g7rc A==;
X-CSE-ConnectionGUID: 6DlA3CISRdCFtVd4Js1rwA==
X-CSE-MsgGUID: rizwtSOfRP6+zhI4MzghDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86430437"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86430437"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:22:47 -0700
X-CSE-ConnectionGUID: xw8VBB/3T2WkuujeDz5vLg==
X-CSE-MsgGUID: c/PWxxchQGKfETUmfSGkdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="241903049"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa009.fm.intel.com with ESMTP; 17 Jun 2026 23:22:46 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v6 0/3] Improve max-bpc query error handling
Date: Thu, 18 Jun 2026 12:03:44 +0530
Message-Id: <20260618063347.2940031-1-pranay.samala@intel.com>
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

Simplify the HDR flag check & ensure remaining formats tested that 
might succeed.

Pranay Samala (3):
  Revert "tests/kms_hdr: Move capability checks inside dynamic subtests"
  tests/kms_hdr: Simplify flag check and continue with next format on
    failure
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

