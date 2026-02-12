Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAFAEB4901
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 11:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8640110E723;
	Thu, 12 Feb 2026 11:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdZ1WXTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F56910E724
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770894638; x=1802430638;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W6iI7PqdsVvxzTmfc3REUPVhCSitb4KsdPv2fWnsTSk=;
 b=ZdZ1WXTW2M5nMIyVcUzJaBIbD2SwArwWZWCZz980Lia9lnzt8D3tzEYT
 /1yHauCuASLi8AC9stvU14FsuZTryhs+DyWxMgCg7gVEEyhHem2yjGwUN
 K5hUtTTRGzDxW3ZpytWuDnkWK5JzkXZfDe9mIyZH/0WWJ1qdiTeazBjxJ
 0wjZi3P8Hm3lQ92gVtfWtx2OdoDTVWJDynSOIxU1KHJxzJhgRjGGN/47Y
 gzWZBNynxJ7AmdtHRinMJ+RxpeU0JIepxBgB/ADaMCtKWL7zixfO4rAYO
 WSAhg1Vf9cQ7AYAOCb7QYmInFg2fautbfeeCyR9Z1Ujzbha6RyrNGudpM A==;
X-CSE-ConnectionGUID: fzkU0tY8TWSK/8w6qy3JYg==
X-CSE-MsgGUID: H+1ib/Z/RTu5YepjgWYn+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75907658"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="75907658"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 03:10:38 -0800
X-CSE-ConnectionGUID: DTN/hTgbRmqJJpUo6qqf3A==
X-CSE-MsgGUID: iT1AnK0rS0uxRZtHTSeJWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212674310"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa007.jf.intel.com with ESMTP; 12 Feb 2026 03:10:37 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 0/4] kms_flip: limit number of subtests run
Date: Thu, 12 Feb 2026 12:10:18 +0100
Message-ID: <20260212111023.189261-1-michal.grzelak@intel.com>
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

[1] https://lore.kernel.org/igt-dev/20260210225546.153728-1-michal.grzelak@intel.com

BR,
Michał

---
Changelog:
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

