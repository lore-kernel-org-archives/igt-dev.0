Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42713D58D64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 16:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0473310E69C;
	Mon, 25 Nov 2024 16:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6APKdt4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C138F10E69C
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 16:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732551569; x=1764087569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j/0UtKVEtU5rOV1c49m7mkGim18XoRq47G56U/BOnCg=;
 b=C6APKdt4Z5gjtmgpFN0ZbO5y+qyJmKll2EIWPeLMmig0Q5qqMyFk+lxx
 4vzJ5oWVLiEBVdbmF+szUaFtjP/UWJDrJBTULglxy+PIub0gDRjRd9xHC
 h59EK4J7x6aQ3yxhv5BglMYjN3rmIeRgbd9adcE139zOd7P/uR414xdgP
 vm5HHB8kRtyoy3ooZknQAoJXta7yGdSFljoDxdHlV19sfQsHiNA6uMJSA
 EsKUyrYxju8ruju8XMj8S3SIIPRZVBDo2oIdwCnqjbJSWByCO+FUl7RJL
 RJ/Itfb8zuc9kXyJOatOkm8GjIMDmWIeXFbPAu6W3cVHY3HEfdhryPX43 w==;
X-CSE-ConnectionGUID: ib1nOU1lQYibqsGnXxbyWg==
X-CSE-MsgGUID: +nZLV2jSStidGyNWl5LDyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="55171116"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="55171116"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 08:19:29 -0800
X-CSE-ConnectionGUID: HU05D+ioRa20kpIFDkkLAg==
X-CSE-MsgGUID: ujkbLqBGRVSr7gvaRuB3qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="91768468"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 08:19:26 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH 0/3] Skip test if joiner display is connected
Date: Mon, 25 Nov 2024 22:04:23 +0530
Message-Id: <20241125163426.382975-1-jeevan.b@intel.com>
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

Skip tests on joiner outputs to prevent failures caused by high-resolution
displays. This ensures the test suite runs smoothly without unnecessary issues.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  lib/igt_kms: Add is_joiner_mode function
  tests/kms_display_modes: Skip test if joiner display is connected

Santhosh Reddy Guddati (1):
  tests/kms_async_flips: Skip async flips on joiner output

 lib/igt_kms.c             | 31 +++++++++++++++++++++++++++++++
 lib/igt_kms.h             |  1 +
 tests/kms_async_flips.c   | 18 ++++++++++++++++--
 tests/kms_display_modes.c |  3 +++
 4 files changed, 51 insertions(+), 2 deletions(-)

-- 
2.25.1

