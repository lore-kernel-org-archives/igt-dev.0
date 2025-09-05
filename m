Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0F1CA0FED
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 21:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F5310EC46;
	Fri,  5 Sep 2025 21:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fF7KQ0u8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA90010EC46
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757106087; x=1788642087;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7o6F/e4BFHVefzzFGWVyRz+/2FvMnJSJod9w0RZOTVs=;
 b=fF7KQ0u83oFYdR9kVRDpU2zaiFtNqTnyAKgnqOYiLEoR574VM1bHA5Wf
 x1EYhjM/jSfh0nqANVHuL6fcueULc5CYm0oAH/eJi97dg/f1i8ICaEL8J
 kr4SNvD1quYWp1hqkBKvMkJrea4nyKwAMqi2wqWzUI3zs+edwh2rKS6HG
 L7KmVj/bCtyi0b7K5xmhOyV0drDB6Se9LaJe4UDqbJFqieRkc7r7YENlP
 ftZy5dYMva0WFibz0wuNEBtUjAKUFhxAdzFWXjMD6rd9Y9/+do1LAi2Tw
 MhoS1DAFsoBbWE+E7q1EoejIUPemiUnu5apisnzB7FckOsK6NFLK8YChn Q==;
X-CSE-ConnectionGUID: 4bDybyjmTDGZAYKNa8XQdQ==
X-CSE-MsgGUID: xbLEZzDQQDiNaKNRCgeK5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59530904"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59530904"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:01:26 -0700
X-CSE-ConnectionGUID: gk4EppxYTKGIE6CJkp2zYw==
X-CSE-MsgGUID: ME/dJhT4Snq4bXtmbSSqVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="177459191"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 14:01:25 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v4 0/4] Add dsc+bigjoiner subtest
Date: Sat,  6 Sep 2025 02:38:12 +0530
Message-Id: <20250905210816.319104-1-swati2.sharma@intel.com>
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
  tests/kms_joiner_helper: Add igt_is_joiner_supported_by_source()
  tests/intel/kms_dsc_helper: Add helper func()
  tests/intel/kms_dsc: Add force dsc and joiner test cases

 lib/igt_kms.c                   |  22 ++++
 lib/igt_kms.h                   |   1 +
 tests/intel/kms_dsc.c           | 198 ++++++++++++++++++++------------
 tests/intel/kms_dsc_helper.c    |  54 +++++++++
 tests/intel/kms_dsc_helper.h    |   3 +
 tests/intel/kms_joiner.c        |   9 +-
 tests/intel/kms_joiner_helper.c |  33 ++++++
 tests/intel/kms_joiner_helper.h |   2 +
 tests/meson.build               |  17 ++-
 9 files changed, 255 insertions(+), 84 deletions(-)

-- 
2.25.1

