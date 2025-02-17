Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BE5C021A9
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 21:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED6810E5E1;
	Mon, 17 Feb 2025 21:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPwbEYCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0BF10E5E5
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 21:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739827816; x=1771363816;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3ts8GDL9dJOXKh/TPAkrPxp/YfdoNYK5ob89aKoIVS4=;
 b=PPwbEYCyLlDivaP6HCqTKOK0TGwfSI+Fzgb6oFauSIeQi51wnJeKgvlU
 XDxIvOEfaDxAAQjh2lapsCUbRctlG8ZI91Nm7m6KEYEI3RlPYwK4qWHIG
 n5s2boQ4GxfF/exdwP5kfORfMfq1kh3/GPDBZ1ItELMu31GzAhJphTRYA
 fZk06mvAIWs7qvKHNydS9SlWXmfC6Vo/+AHXUzG/DmCxjZ4JUd+0jfRUL
 DThtReecYN8cikrfMxVQCrYhhRP3r3cMiXWkbH6EuoyD0kkNTFt62eWGa
 PbS+jzQpT7jWPwBZtnFhCTyIjWrAzP7AVeT9Vke91Hbw7Fh6e0MEubp+R A==;
X-CSE-ConnectionGUID: GJABxxL8TAS0bZZuJB8Q/w==
X-CSE-MsgGUID: p6I97IfMTxCysMH7srxGZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39750684"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="39750684"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 13:30:15 -0800
X-CSE-ConnectionGUID: +EY/raEIQoCp/iWQ5tOvig==
X-CSE-MsgGUID: i8vPQsrtQuiKQ75skeO8WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="114411198"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 13:30:14 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/5] tests/intel/kms_cdclk: Refactor mode setting and CD
 clock verification
Date: Tue, 18 Feb 2025 03:05:26 +0530
Message-Id: <20250217213531.402162-1-swati2.sharma@intel.com>
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

Based on the review comments received, add highres and lowres
functions to lib and made corresponding changes in the lib.
On top, broken initial patches into smaller patches to better
review.

Swati Sharma (5):
  lib/igt_kms: Add func() to read and parse cdclk debugfs
  lib/igt_kms: Add highres() and lowres() func
  tests/intel/kms_cdclk: Add conditions to filter valid outputs
  tests/intel/kms_cdclk: Introduce set_mode()
  tests/intel/kms_cdclk: Use igt_get_max_cdclk()

 lib/igt_kms.c             | 110 ++++++++++++++++----
 lib/igt_kms.h             |   4 +
 tests/intel/kms_cdclk.c   | 207 +++++++++++++++-----------------------
 tests/intel/kms_dsc.c     |  14 +--
 tests/kms_display_modes.c |  14 +--
 5 files changed, 177 insertions(+), 172 deletions(-)

-- 
2.25.1

