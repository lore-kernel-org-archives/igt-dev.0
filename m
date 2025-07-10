Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54102C83F17
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 12:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B0210E8C8;
	Thu, 10 Jul 2025 12:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHsKvUwS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5137510E8C8
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752152355; x=1783688355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fu2pztgGupY4qyUzfRXGSbdgq7bbNWDyjgkNURPs3Ps=;
 b=WHsKvUwS0sTYVQ/JhYgdv70azvMb8h2SDDY4Y4eQ86WI0l/lFN85Qt21
 MjLDI540Kpa8co3l85UABa+H8F+iSMVS8sO3bMmI2gPBoOfTtduK3nUB4
 8+AZsfskfuAZoT3hgQbAdj2daqOPRaQq/9B2srt2CY+g/TsRXH/IsPsE4
 16+9wcbEf+u1YAerv7VleW+bkTkpI/V/hvv8TlvvDrsBmAM/fvNGJfeD8
 XkEq+8MGhVZTBYvadjJxOx8aK0XQYHju/WFPYA+i0wbBs5/otw87ZQaec
 dBGVeTkXXZoRTOIy9sDQGTYBjxGpIQvEtskMSYEAdYBS/AopAqwlu0iJa w==;
X-CSE-ConnectionGUID: WXXlRQaHR7+0EVNJciwx1A==
X-CSE-MsgGUID: uikhdy/QQCWmUa8ckTSupQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54559294"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54559294"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 05:59:15 -0700
X-CSE-ConnectionGUID: E08X2v8kTn6lLB8FLu7L6w==
X-CSE-MsgGUID: 4Wh/M0DKRU2zNpB9SXVdPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="193284537"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 05:59:15 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v3 i-g-t 0/1] xe_copy: Add memset/memcpy test checks.
Date: Thu, 10 Jul 2025 12:58:51 +0000
Message-Id: <20250710125852.1742211-1-sobin.thomas@intel.com>
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

Added checks for platforms with graphics_ver < 20 (e.g. PVC) in memcpy
and memset for tests with extended parameters.

This update includes:

- Handling of tests for  PAGE_COPY mode (memcpy) and larger-sized 
  writes (memset).
- On platforms with graphics_ver < 20, memset is limited to a
  maximum fill width of U18-1  and memcopy tests using page 
  copy is skipped.
- Any values greater than 0x3FFFF will now be skipped for memset-linear
  to prevent overflows or undefined behavior.


Sobin Thomas (1):
  tests/intel/xe_copy : Add check for memset and memcpy tests.

 tests/intel/xe_copy_basic.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.34.1

