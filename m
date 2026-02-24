Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42E4E9B264
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 13:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2308510E58D;
	Tue, 24 Feb 2026 13:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVpB5IJx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B24610E589
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771939978; x=1803475978;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l5SZZwgo+NgPbqMAPD9FH+YRJguIZqXdFrIddg8WntY=;
 b=dVpB5IJxU20gTAGqWYSueVQZYG1kLsCcC20slr89VeNgQuGdIR4XbLqP
 Hh2qGkvEDX9MDyckAacHZnMf9zBtM7JCYfyQDUaBE+7wJeAK0Okx0xT5K
 1bNvXTHZZEWimq9G/YetPNPmyGQ4A33VOup52mXf27qDufnhGedezXxwu
 CzF24pdBWx5Gg4nRq9bHEuPyeXEaor7FtUEIu7Ms/Fb8TEcKcJoh6SN9+
 hPMR+3TePcNyouaZpUkEEs2RtlvYOPuqe9cMdSgAJt2cdT2SkIDAdmwKz
 YwKtDXEMmSgLub3QzHIjFkHwX7XaPhaiCXktkxQuubtu0JdVhM3r3arnm Q==;
X-CSE-ConnectionGUID: r9L/PzZ8QaWcvRAEDL39mg==
X-CSE-MsgGUID: uzt9zI4ASLCPNRPOxbYuFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84410052"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84410052"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:32:57 -0800
X-CSE-ConnectionGUID: EdIblFa5ROKoC5eJ5JtR5A==
X-CSE-MsgGUID: 1o8DQPXoQDevZWr9KJSfAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="246476791"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 24 Feb 2026 05:32:56 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v6 0/6] kms_flip: limit number of subtests run
Date: Tue, 24 Feb 2026 14:32:36 +0100
Message-ID: <20260224133242.1678232-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next version of [1]. This series addresses both 2x-* and single output
tests. It also handles timeouts seen on SNB. This series has been tested
on config with 4 outputs connected.

[1] https://lore.kernel.org/igt-dev/20260213084930.252273-1-michal.grzelak@intel.com

BR,
Michał

---
Changelog:
v5->v6
- fix typo in commit message (Thasleem)
- clarify selecting compatible mode (Thasleem)
- add init of devid & SNB WA

v4->v5
- rename all_pipes to all_crtcs during rebase

v3->v4
- change \gt into \ge sign

v2->v3
- ease counting of pairs of outputs
- limit number of tested outputs
- narrow pair & output limiting to suspend subtests
- add separate param for pair and connector limiting

v1->v2
- split pipe limiting into 2x- and single subtests
- add output pair limiting

Michał Grzelak (6):
  tests/kms_flip: test suspend on one pair of pipes
  tests/kms_flip: run suspend tests on one pipe per output
  tests/kms_flip: limit output pairs when testing suspend
  tests/kms_flip: limit number of outputs wrt suspend
  tests/kms_flip: initialize global devid
  tests/kms_flip: test suspend at most twice on SNB

 tests/kms_flip.c | 70 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 8 deletions(-)

-- 
2.45.2

