Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7903D41D74
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 10:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7041A10E114;
	Mon, 15 Dec 2025 10:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amkVXLrK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEC510E114
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 10:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765794796; x=1797330796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8FGcfghlvuG0XpDw6b6iOjF9anU0+qBsGwgGbIM4SJc=;
 b=amkVXLrK3u3jhTL18Nfc26/bX9C26j1cwz6ZRjmEyNWb2ywq1A1Rl4eA
 X+B2zeW+6u1h4/zoBdhg7hJafJvhe6gQ4RyjpUwY5TyTkUJ+sz2i6aqAh
 R2s1rUY5rj61dvcF7LeaHvRUEz1mVNKPkFMBWu1nZOIJJJ+OkTEiZpA2t
 LvLlmsXn/uCHpLyjOTzVr8ak9/fd+GtXIBhKqfn6ZjeMki0nftzA8ZCFp
 9m3ZX7/VDfgxzYzVKww+DKfKDT5mmms78WtQeFNoa4HG3KiCltxIUrWgW
 ioebrd/4VBk/dTyk0S4U+W0B4l9bMTOg+6YYkQoYAaTQpzWo3y0EBkFVG w==;
X-CSE-ConnectionGUID: kXW8EKNITLWHFduCYblhcA==
X-CSE-MsgGUID: wxKZbpkXRDKWTXAiLgb85Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="79148272"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="79148272"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:33:15 -0800
X-CSE-ConnectionGUID: N6a7d64cTeyCCF3ivgkreA==
X-CSE-MsgGUID: 6ArEtXpZSCOFe7RRXiWiNw==
X-ExtLoop1: 1
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:33:15 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/1] Enable/Disable DRM debug logging between tests in
 shard mode
Date: Mon, 15 Dec 2025 10:33:04 +0000
Message-ID: <20251215103305.445335-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
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

In shard mode, when disk usage limit is exceeded during a test, DRM
debug logging is disabled by writing "0" to /sys/module/drm/parameters/debug
to prevent premature exit. However, this disabled state persisted across
subsequent tests in the same shard, causing loss of debug information for
tests that did not exceed the disk limit.

Add a global flag to track when DRM debug was disabled in a previous test.
At the start of each new test in monitor_output(), check this flag and
restore DRM debug logging to the original value (or default "14" if the
original value could not be saved). Verify the write succeeded by reading
back the value, retrying up to 10 times with 100ms delays if needed.

The original DRM debug value is saved once at startup in execute() before
any tests run, ensuring we can restore to the correct state. The per-test
logging_disabled flag remains local to monitor_output() to track state
within the current test execution.

This ensures each test starts with a clean state and proper debug logging,
while still allowing dynamic disabling when disk limits are exceeded.

Sobin Thomas (1):
  feat: Enable/Disable DRM debug logging between tests in shard mode

 runner/executor.c | 148 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 1 deletion(-)

-- 
2.51.0

