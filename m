Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7842C27C43
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 07:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B8A10E2F9;
	Tue, 28 May 2024 07:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJlNlr/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A6610E2F9
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 07:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716883148; x=1748419148;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nYe17mLn1sZY2lqD1bj0LLkNthMsK/zgZF66loZV1SI=;
 b=AJlNlr/ouqkC8IpekmUripCyjWXuTQFTzLuQWVjpgXAnDqf26UZog4cJ
 T7iQzNHiYteY3mZaBiSdke10SUyuuv3JhSvnucLLrxj2IYMgJ/VpSk6PI
 tqHs5q9GgoI4079CYgFIyaNPL1GdgQ2HjTgyVuacRwWnLqy6Q0ZBaJmUL
 8ZV47e35HXM73ARvozgHPuUXB24LOiwcJBI8D77ZVgEBKdaMwyT3wUlaE
 IWZjkyx9VwFVZ6qxOdJmZ8Tbo76+mXBg56S2/DqTxL9GhvDGzqqoP7RqT
 Gow4sclqOAVIcI/D1RvE80inqgwlO360gibbqUy2JKAZc2Qr0PmQQjnBz A==;
X-CSE-ConnectionGUID: wmI810OOQ2qQCmJyWtxfIA==
X-CSE-MsgGUID: iHuh6RbUTfecr3OQKp45dA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11722493"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="11722493"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:59:07 -0700
X-CSE-ConnectionGUID: 21gkcYLtTf6kVIOmcqY1/A==
X-CSE-MsgGUID: I8hti8hHRG2w25nt3rxcwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="35045332"
Received: from dgoldx-mobl1.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.249.36.167])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:59:06 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t v2 0/2] check drmModeGetConnector() return value in some
 missing places
Date: Tue, 28 May 2024 10:58:53 +0300
Message-Id: <20240528075855.463729-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
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

Hi,

There are some places where the return value of calls to the
drmModeGetConnector() function are not checked, even though it can
return NULL in some cases.

Fix that in lib/igt_chamelium and intel/i915_pm_rpm.

In v2:
   * change igt_warn() to igt_debug() [Kamil]
   * set connected to false when we can't get the connector [Kamil]
   * added Chromium stakeholders in Cc. [Kamil]
   * shortened the commit message a bit. [Kamil]

Please review.

Cheers,
Luca.


Luca Coelho (2):
  lib/igt_chamelium: check drmModeGetConnector() return in
    wait_for_connected_state()
  tests/intel: check drmModeGetConnector() return in i915_pm_rpm

 lib/igt_chamelium.c       | 5 +++++
 tests/intel/i915_pm_rpm.c | 6 ++++++
 2 files changed, 11 insertions(+)

-- 
2.39.2

