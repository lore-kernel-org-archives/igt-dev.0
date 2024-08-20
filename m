Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD02C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 08:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A19E10E501;
	Tue, 20 Aug 2024 08:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvRkNwUV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5A910E501
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 08:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724141708; x=1755677708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rx8mEbVHP6rsuGOjHr+RYU0qOibn0HLfTmU4a3bQ3PM=;
 b=kvRkNwUVkdgfiUTrLw4fzTHMytlVP8ez6rE86s4d+JvsEwjhxtSfZVN3
 3/UhGo0uuaHDAkZuEuOxrhEd3TkzZnDW45D1fib7UkkUqdp/7mJnPZguf
 YkjseayU3Twou4OguThVwzsV1PuoRlivR1lB5MwFG1qd2DveLP+7x6L23
 LW8Uz53Gmd3pt8GGrSwygW2Q0JZk5R6lSiI5ldIgaWZZNveBqXTff/zbF
 xpS39JWALfB8X7IASoX8UJDoG65UmrjRn5aZ4KS/34cfbpY2X+LDXVsct
 CGIQXQO/kJKVbiYFdnEPB3zVklOzxEFBzHtfjYI4EXBWcGamPtaRMBYoJ w==;
X-CSE-ConnectionGUID: GDzLm0N4TgOtA3/6OuVIUg==
X-CSE-MsgGUID: KGSlk/0EQSaEzmS4pEfnjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="44948233"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="44948233"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:15:00 -0700
X-CSE-ConnectionGUID: ocbXF+2iQDS2l5b8NRKBkA==
X-CSE-MsgGUID: WzMyPN0mS1qaJ43EVrqTCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="91418354"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa001.fm.intel.com with ESMTP; 20 Aug 2024 01:14:58 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 0/5] Improve MST HDCP tests
Date: Tue, 20 Aug 2024 13:42:27 +0530
Message-ID: <20240820081233.4092203-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

Improve HDCP MST test by doing the following
-Eliminate unnecessary loops and wait times
-Add retry logic for mst test cases
-Change screen color based on HDCP Encryption Status

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (5):
  tests/kms_content_protection: Move HDCP output checks earlier
  tests/kms_content_protection: Move try commit call
  tests/kms_content_protection: Rename igt_commit_style variable
  tests/kms_content_protection: Add retry logic for mst usecase
  tests/kms_content_protection: Set screen red/green based on CP Status

 tests/kms_content_protection.c | 186 ++++++++++++++++++++++-----------
 1 file changed, 125 insertions(+), 61 deletions(-)

-- 
2.43.2

