Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D62EFCD6D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA4310E4B0;
	Mon,  9 Mar 2026 09:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Icc89Sl/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE07710E4B0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773048341; x=1804584341;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dXXkpLD+VDas/nCSh+Y/uB1Hwx2hrEm+cgL6/kiZkoI=;
 b=Icc89Sl/jkPo02nMm+8qi0xAKbdRAOrZ8jySN7R0nqLlphHu5ApVWL2N
 HTdXWY5tsLCkaRatGFlwT7XrQP3mjt20DNKYh8DO8ZNcaDYeXbwmmL4mp
 njStg5050krz/2k08wTihM/oIp3pz2rnyUq6sf3QVBpeB4MZmzaUUmoh6
 JV52OEpOG81cW/K3Y/dazz8nt8TsMnAllrwx5YPjfL6fxCwdAKvbRbKUK
 oPROTWf1EaypSs7s+95dU81H/UxqWe0Zm3YmeDW2yp5AR1TDtFcndbbiy
 A0Qpr8i0xOiWh2aOtfMvSgabMX22zxw4VeFQ9JNj2QjjTopjtFYoTMAzg Q==;
X-CSE-ConnectionGUID: 3TdbGCmvTjORHFe6R9WigQ==
X-CSE-MsgGUID: j06kP0LfQk6PeGQJ8WtJLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77918365"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77918365"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:25:40 -0700
X-CSE-ConnectionGUID: lWaAxfCSRZKOnzxu1fOMgA==
X-CSE-MsgGUID: w1bS4tgiQdaNNS0WYixSYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="257620281"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 09 Mar 2026 02:25:40 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v8 0/6] kms_flip: limit number of subtests run
Date: Mon,  9 Mar 2026 10:25:22 +0100
Message-ID: <20260309092528.3336467-1-michal.grzelak@intel.com>
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
tests. It also handles timeouts seen on SNB & BMG. This series has been
tested on config with 4 outputs connected.

[1] https://lore.kernel.org/igt-dev/20260226083115.1747856-1-michal.grzelak@intel.com

BR,
Michał

---
Changelog:
v7->v8
- add WA for BMG

v6->v7
- remove unused global vars (Jani)
- staticize rest of global vars (Jani)

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
  tests/kms_flip: staticize & remove unused global vars
  tests/kms_flip: test suspend at most twice on SNB && BMG

 tests/kms_flip.c | 82 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 68 insertions(+), 14 deletions(-)

-- 
2.45.2

