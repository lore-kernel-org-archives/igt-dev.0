Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFF8E94625
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 00:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0369F10E370;
	Tue, 10 Feb 2026 00:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5Qx3xhr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7826A10E370
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 00:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770682250; x=1802218250;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wopClqKaX9OUthO4OOEgFw2gBpVsDohyHOHcfZeZLKw=;
 b=M5Qx3xhrLgFBugTa+sN7CycGr1bTnuvw6sNuWu1k3fjFWFkxBZtxR4lB
 GZBAAlh5qMNuEXAb55XZihXEC1TwJD/mx7M9m6ts2A1GKVUashRia3QCe
 j2RvMZdEJ+rLKGt9rT2lKzrWUP9ECfnOu3tgiVrBrfYnJs55S05FeOREk
 40GQLDrV+iBzcvLvZ1VH1ZcOlnFk+xNvPT9ZEDgJqraZb5FjiVUwSnl8o
 ZqFcHK0P5wGm4Ovulg2dzGRM0kdETHy25h808R6LhR9KBihaJeRUpQXYH
 G+tDgXwFMOsUGyTcON50ROuucJrgvJHZlCZbqS2zLBnylP8S/NVVmQup4 w==;
X-CSE-ConnectionGUID: YdPEokWTSZyLhOICIpvVSQ==
X-CSE-MsgGUID: byeaTtZnTNyvU+BSJbWrAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89218509"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89218509"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 16:10:49 -0800
X-CSE-ConnectionGUID: 6e5BJRq7S4imEP75Lm0J/w==
X-CSE-MsgGUID: yMOoroCgQnONv8Fvm7VVeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211762841"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 16:10:48 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 0/3] kms_flip: limit number of subtests run 
Date: Tue, 10 Feb 2026 01:10:23 +0100
Message-ID: <20260210001026.3923885-1-michal.grzelak@intel.com>
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

Next version of [1]. It addresses incompletes seen mostly in 2x-*
configs.

[1] https://lore.kernel.org/igt-dev/20260202082700.3194987-1-michal.grzelak@intel.com

BR,
Michał

---
Changelog:
v1->v2
- split pipe limiting into 2x- and single subtests
- add output pair limiting

Michał Grzelak (3):
  tests/kms_flip: test suspend on one pair of pipes
  tests/kms_flip: run suspend tests on one pipe per output
  tests/kms_flip: limit output pairs when testing suspend

 tests/kms_flip.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

-- 
2.45.2

