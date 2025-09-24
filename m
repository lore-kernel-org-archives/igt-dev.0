Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC4CCAC5AE
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 19:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56D810E068;
	Wed, 24 Sep 2025 19:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiMmBPWZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3765B10E068
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 19:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758743703; x=1790279703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dEL8UhE7zlEYHwZ/HTcsDEOivEIr0iOjPcK2nPMBSkM=;
 b=PiMmBPWZGkFPoRX/CkphZ7vnDulzCnYe1VwG8aF95ngH//szvQpOco3v
 Qu+2Hyl+CHdFoBiwGvJaqwljNwxdB/1IU0kWVVl2476XhlZnTvDaWTguq
 qvM7t2nuhdyJVyetjsJjblKa0wQVWH6YTDbNmrf/d/Jp280S3BmVHLpe7
 ZCv+ubNdIUCQfukrzKtQMMg4c0MlG7wHirlT2sDrCSxmbiFIdqR9F2Vs8
 uVCgW8yAGWeqHvsSjwNiFFo9J7XMmMuFm9V3vSYtsASbiHkOnGh2K51Hg
 6em/z+HVng2StXvndmamzGin/jhTqBaqfKEkU0DX4sXjYJCd0Rvwc4lpU A==;
X-CSE-ConnectionGUID: V6nnV5UlTm2X6ImpXRegMQ==
X-CSE-MsgGUID: NYHbIEycSs6L5l6jah+m0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60267469"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="60267469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:55:03 -0700
X-CSE-ConnectionGUID: 77ONJT5QQBWIsVmc/D1OXA==
X-CSE-MsgGUID: gfmq/a0tSY2Bp/baDzXj7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="181395217"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:55:00 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v7 0/2] Runner: Abort run when dmesg is flooded
Date: Wed, 24 Sep 2025 21:54:51 +0200
Message-ID: <20250924195453.92680-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

I am not sure if this is enough for preventing flood, also
this could be a limitation for kernel OOPs hapenning just
after test end its execution. Maybe better way would be to
intoduce a size and time limit for dmesg prints after test
exits, or wait a little to let kernel OOPs prints its data
and then check again.

Lets introduce option --dmsg-ratio-limit, active only after
disk usage triggers for option --disk-usage-limit.

With this change comes also HAX test commit with --dmsg-ratio-limit=256KB/s

Previous version:

https://patchwork.freedesktop.org/series/150246/
runner/executor: Abort if dmesg is flooded

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Karol Krol <karol.krol@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  runner: Abort if dmesg is flooded
  HAX DO_NOT_MERGE: runner/settings: set default ratio to 256KB/s

 runner/executor.c | 149 ++++++++++++++++++++++++++++++++++++++--------
 runner/settings.c |  61 ++++++++++++++++++-
 runner/settings.h |   1 +
 3 files changed, 184 insertions(+), 27 deletions(-)

-- 
2.51.0

