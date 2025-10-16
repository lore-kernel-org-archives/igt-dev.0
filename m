Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C00DCCD194
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 06:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CED210E948;
	Thu, 16 Oct 2025 06:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zab5RoWD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1AD10E948
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 06:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760595247; x=1792131247;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AAUzWK+NYpTOtXvvXXoSz8H4IS+7IupZ/PjXnk/+EeQ=;
 b=Zab5RoWDi0Zk5n2PhpNdwYwL55UTEI/DTAd+5kmVk2ScLGOHVJD7oCTx
 6GaAu8z/72Ttzv5mROlDuHi6jk8LmHsQRm9ICabVqL3FdxZ4Tty2XVbPy
 6XuDyU1WSEUPH5DF2bMq9/bgQwHcGBxOzea0SBnxIl1zS/z+01YIAlXT1
 +B80UQ3rczt2QF3eHXYj/pZmr3v2Y0PCpd/JqKlsLDHK6e4FsjxJrxEeX
 GPolm/3kgZaFK9zAj9WcAzl5X1h6fnLmmTGqIBQGMNkZBbbcdunuYyJ0W
 W8olOximNTNqMZwrX8oMYTuUC0nJgYb0S/RJLiuj4FYMHkyCeoCs9wYVK A==;
X-CSE-ConnectionGUID: yJlSQ7a1TS+go397f+NQ9g==
X-CSE-MsgGUID: tditg0FdR6is3Gh0a4JUUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="85398006"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="85398006"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 23:14:07 -0700
X-CSE-ConnectionGUID: IhRzIAMVT7uYi+AXt1sNRw==
X-CSE-MsgGUID: CQBqwO0YRs69Qcr5pDQlkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="187461824"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 23:14:05 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, pranay.samala@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 0/2] Change debug mask to reduce log level
Date: Thu, 16 Oct 2025 12:01:36 +0530
Message-ID: <20251016063138.2955320-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

To mitigate disk usage during CI runs with multiple outputs,
this patch restricts debug logging to DRM_UT_DRIVER for
subtests when more than two outputs are connected.

Sowmiya S (2):
  tests/kms_cursor_legacy: Change debug mask to reduce log
  tests/intel/kms_dp_linktrain_fallback: Change debug mask to reduce log

 tests/intel/kms_dp_linktrain_fallback.c | 2 ++
 tests/kms_cursor_legacy.c               | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.43.0

