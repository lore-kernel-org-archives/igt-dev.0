Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956DFC54FC6
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 05:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64C810E288;
	Mon, 26 May 2025 05:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJl7nMeB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A85210E288
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 05:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748238721; x=1779774721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bh+Er6VmnfHIdOV1srJu2R0DVFFpbcRrer4Ijb1jk/s=;
 b=jJl7nMeBSoCbmTzbdZ3gyn0oscB30MPEfVUnWksZ2EA5fjMU8yWNYuz3
 2rgzRLJOTd+BY2Je+01ZynS/Nd/U1uKcLduoqWfuisfJNwDhdQn/MotwU
 Hk9p+z4l3ZUu/GZeR0gOeg25YuEXO0CW36FV0EEeJwpuNqavwfM74dr9d
 ScKVZWP7rbL5NhY1n1qd8NORd5hODo7pJ+NaqoUxMM0wub7jvxOyhE3JZ
 I1xgVfrciYv7UtxQvd4GV59w8GSGFkxT9GyXVFfgPXbPCEn8tNBK9e7Y3
 zBfB2BJnUVl9ylIpebveaK+bBqY0YcbokIT2HlR3HOHzmfOKVneIhrPUu A==;
X-CSE-ConnectionGUID: sJ2C+4GnSCyI4fgzJy0mbg==
X-CSE-MsgGUID: 4CDN6iqnRBK6BNcg5Kr1/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="75595082"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="75595082"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 22:52:01 -0700
X-CSE-ConnectionGUID: 5p+IFxhATYiDT9gACqRNIA==
X-CSE-MsgGUID: E47yb6wQS1CdrO4NFBOVsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142135649"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 22:52:00 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v11 0/5] Support for IN_FORMATS_ASYNC plane property
Date: Mon, 26 May 2025 11:12:12 +0530
Message-Id: <20250526054217.127802-1-santhosh.reddy.guddati@intel.com>
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

Use IN_FORMATS_ASYNC property to get list of async modifiers
and improve async flips test to add coverage for the supported modifiers
and formats.

Santhosh Reddy Guddati (5):
  lib/igt_kms: Add support to retrieve async modifiers and formats
  tests/kms_async_flips: use in_formats_async for async modifiers
  tests/kms_async_flips: Add test for all async format modifiers
  tests/kms_async_flips: Remove allow_fail flag from async flip tests
  tests/kms_async_flips: Skip Async Flips with Linear Modifier

 lib/igt_kms.c           |  73 +++++++++++--------
 lib/igt_kms.h           |   7 +-
 tests/kms_async_flips.c | 158 +++++++++++++++++++++++++++++++++++-----
 3 files changed, 191 insertions(+), 47 deletions(-)

-- 
2.34.1

