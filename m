Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133E4EA3F18
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 22:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4EE10E071;
	Tue, 10 Feb 2026 22:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBJD+SLa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EE010E071
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 22:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770764158; x=1802300158;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o+d9vrrIMVIzc2CDON8vwRGM8ZWFc9phTTFrrqPn7qY=;
 b=MBJD+SLavSWkomLsdMj4wk85moeFmb4DqheeNd4gH60l1sqsbPfdt65V
 x9LPi53kcFgi/geMuSfmvoE7JLvP4mNWordPWUU8s4ulSIBU2sntYhY+/
 vaMw35+7U+0cIRY4nwqNdcNO9F2GLv99XcYi9W5iKoJs45hiOetjqtSm2
 EXwGqYmRi7CR7MZ8LcZ6YbjuN6PBrp2zdQltYjqZ92Q9cxtfjzVTep8Y8
 QL8Y5fQAXGghhoZ8Esq+ZgdeZDmFWSv59vR3DVg4RfUq8LqueL6wGe8f2
 xH2wJc77Zm+rBXPJd9jKwHZqZEMF5/1IMhFu0Aauuixi7cImXu5WDc1IM A==;
X-CSE-ConnectionGUID: 65n7PKeDQfaeUpt803FzTw==
X-CSE-MsgGUID: ju8ZrVKFRvaF1hDcS4BwKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72094840"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72094840"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:55:57 -0800
X-CSE-ConnectionGUID: juMwAGfCREqF21/MQWxlRw==
X-CSE-MsgGUID: KOOX9JIQSrOjalI1XBTpCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211503814"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2026 14:55:57 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 0/4] kms_flip: limit number of subtests run
Date: Tue, 10 Feb 2026 23:55:42 +0100
Message-ID: <20260210225546.153728-1-michal.grzelak@intel.com>
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
tests.

[1] https://lore.kernel.org/igt-dev/20260210001026.3923885-1-michal.grzelak@intel.com

BR,
Michał

---
Changelog:
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

