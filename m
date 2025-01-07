Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537A0E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 18:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44DD10E770;
	Tue,  7 Jan 2025 18:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRwd1scB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA3310E1B6
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 18:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736275921; x=1767811921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/h+16nSojkH3iT0ImLXY6tjd1lh91A01IGlvcxVuCiM=;
 b=TRwd1scBaj8nLjlCsNduVTzhzBE5kM3nfAywdKQutuz1pG+lvXXFdtIh
 YFmfmy2shAlsptQi5m/twcXbmRGAx63cj2fRLYDB08IIbOZntH2OA/rjG
 +xElRNNlRgRnbGmgvXRHxULMieDu+yg0pP2jGX1waLA58DCAA7L959nI8
 mHNx6lHDW15Seiu6WSzG/ElIrI9B/1taRw0OWAHimn74+uXjP3A0akmEL
 3u0ggg+2YMynqfeyBDJ22+qfmV/YE4j0EQpmF6cHd50SpRiBpWVDaG7QJ
 0QnIk3IRYRjJpCwAhuLdLkkXgW6d8Pu41Xi/bJvP/scNL/c3XBgIW5F4Q g==;
X-CSE-ConnectionGUID: DeEWXKoOQ36dP1CFCpD1qg==
X-CSE-MsgGUID: Hln+UwfSRUqQpPzFEFII+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="58942021"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="58942021"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:52:00 -0800
X-CSE-ConnectionGUID: sFvInLVSQn6KQMB6rBNpKA==
X-CSE-MsgGUID: Xb9upaTzTX6lHlOc34cUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103706852"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:51:58 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/4] Add dsc+bigjoiner subtest
Date: Wed,  8 Jan 2025 00:27:05 +0530
Message-Id: <20250107185709.116756-1-swati2.sharma@intel.com>
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

New subtest is added to validate dsc + big/ultra joiner use cases.

Swati Sharma (4):
  lib/igt_kms: Add igt_get_joined_pipes_name()
  lib/igt_kms: Add igt_is_(big|ultra)_joiner_supported_by_source()
  tests/intel/kms_dsc_helper: Add helper func()
  tests/intel/kms_dsc: Add force dsc and joiner test cases

 lib/igt_kms.c                |  64 ++++++++++++
 lib/igt_kms.h                |   3 +
 tests/intel/kms_dsc.c        | 192 ++++++++++++++++++++++-------------
 tests/intel/kms_dsc_helper.c |  46 +++++++++
 tests/intel/kms_dsc_helper.h |   2 +
 tests/intel/kms_joiner.c     |   8 +-
 6 files changed, 238 insertions(+), 77 deletions(-)

-- 
2.25.1

