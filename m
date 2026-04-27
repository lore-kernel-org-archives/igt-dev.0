Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FAEFF8861
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 10:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D3010E09F;
	Mon, 27 Apr 2026 10:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hnby4v+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E942C10E69D
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 10:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777286793; x=1808822793;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LZ5K3ySbDb2oR3cFzllQBLnWEfSOj1T+VBAoqkon3PY=;
 b=Hnby4v+cliVNTR/dc2A5nGwWDs/xOwWsvX7qgfBlKouNlp4aRPGSneFo
 zIAKqRfMsvAkBYf62NMq4d4vAp0VOzaQVnjmHscL+QCxicAyU0TEGEr9R
 hhW7MyJ08r8Y1xfIPmDwtoGSYK7yKz8PNSsCDfpQ1CSUzxhUYkkpSYxvR
 xQUvRtp2xpv2mYbQ0KznmntRlskkT4cf9v9gYDz+3Cu56sR2egvZx8ULV
 q1KBTk4KZa7mIa6L33fqJxBbqsRau09Q8zJzukEcdBS0DGH7/0ZFCCcgT
 vwZ328P+I/l3buyCO/hmfhFFh48XQbwVHwPxc6Ci/uKsrMuCySIgUA7RO Q==;
X-CSE-ConnectionGUID: rvVVJ9bwRg28UHjggE8LjQ==
X-CSE-MsgGUID: V0s+k6OGSp22XUpF8710mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78154914"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78154914"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 03:46:33 -0700
X-CSE-ConnectionGUID: 57zvDfLtRTKuRDG+MyOrPg==
X-CSE-MsgGUID: BzRs6Y+8RI60+ik0+4M+pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="227073028"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 03:46:31 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/2] tests/kms_colorspace: Add Colorspace connector
 property test
Date: Mon, 27 Apr 2026 16:25:12 +0530
Message-Id: <20260427105514.2239876-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a new IGT test (kms_colorspace) for the DRM Colorspace connector
property. This is a basic sanity validation suite — it does NOT perform
pixel-level comparison or color-accuracy verification. Instead it
exercises the kernel interface to confirm that:

  - The Colorspace enum property is exposed with expected values.
  - Each colorspace value can be set and read back via atomic commit
    (16 parameterized subtests per connector type).
  - CRC sanity checks confirm the display output is not corrupted
    when each colorspace value is active (no pixel comparison, just
    ensuring the output remains valid).
  - Colorspace survives DPMS off/on and suspend/resume cycles.
  - Invalid enum values are correctly rejected with -EINVAL.
  - HDMI-only enums are absent on DP connectors and vice-versa.

Patch 1 adds the Colorspace property plumbing in lib/igt_kms.
Patch 2 adds the kms_colorspace test with all subtests above.

Swati Sharma (2):
  lib/igt_kms: Add Colorspace connector property support
  tests/kms_colorspace: Add Colorspace connector property test

 lib/igt_kms.c          |   6 +
 lib/igt_kms.h          |   1 +
 tests/kms_colorspace.c | 925 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   3 +-
 4 files changed, 934 insertions(+), 1 deletion(-)
 create mode 100644 tests/kms_colorspace.c

-- 
2.25.1

