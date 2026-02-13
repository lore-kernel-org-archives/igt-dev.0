Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED59BEF48E8
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 08:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E2E10E0A6;
	Fri, 13 Feb 2026 08:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LbluAjH4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA7910E0A6
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 08:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770972624; x=1802508624;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BqIatVO4Fl5wREh8Z6Ke8krS6Tf6fezI6xnxOanSGFc=;
 b=LbluAjH4+9yRfm+gMJWRi0HjAGJJmDvVCNXqCKJNMqvtybrt9a5DUBb7
 6G/Cm7bTEJYuRwgzOQfGYQpvPjJrj2QJWYnOYHKm8ed4UCeYasPD2x4fo
 en72JO6+CjBpN6H4G47OhAcT6nw0CGuLzKZPBu/SUy46VXKmKzVZXugW1
 iJrLVoW/xScwZsS+6ZDeIeDcezMpTYIipaYJSDqDg3qYHCkhosjH5h2Et
 56QY2vyWOJxD0zKvdnVHt1aaKzRPHHNTCaoKSPN5s31OYPTq8Lgy0tjnR
 EKAU2J0Rvw4kzcCyh5M8MTEJ8LKwHNhbc6gSIT6scdj9DdG/1+VqI4pwI g==;
X-CSE-ConnectionGUID: BTUSD/9CQuagMGKyaBQ46Q==
X-CSE-MsgGUID: 0fL7U4S7RW2IqR8ym7WZwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71181706"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="71181706"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:50:23 -0800
X-CSE-ConnectionGUID: tu0CtI/SQgmarddr1qZJWQ==
X-CSE-MsgGUID: IdlxpoY6TYaTseVjx4SFwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211774811"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 00:50:22 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 0/4] kms_flip: limit number of subtests run
Date: Fri, 13 Feb 2026 09:49:26 +0100
Message-ID: <20260213084930.252273-1-michal.grzelak@intel.com>
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
tests. This series has been tested on config with 4 outputs connected.

[1] https://lore.kernel.org/igt-dev/20260212111023.189261-1-michal.grzelak@intel.com

BR,
Michał

---
Changelog:
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


Michał Grzelak (4):
  tests/kms_flip: test suspend on one pair of pipes
  tests/kms_flip: run suspend tests on one pipe per output
  tests/kms_flip: limit output pairs when testing suspend
  tests/kms_flip: limit number of outputs wrt suspend

 tests/kms_flip.c | 74 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 61 insertions(+), 13 deletions(-)

-- 
2.45.2

