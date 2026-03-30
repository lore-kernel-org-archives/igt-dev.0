Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9390EFF4958
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C0310E3EA;
	Mon, 30 Mar 2026 07:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGQYl2xP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957FD10E3EA
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774857313; x=1806393313;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bRk1c5AE8J9wdagVa+++pAGhAC9/QzuofwT2OMZ3Ois=;
 b=bGQYl2xPtfc0fLiSukUS97xjQYABzBsrloEVihrzQiaTjIWJILsfwGXY
 QeruhXtvtiAgACePbSYbOJiG0Qyy4tj1REd/Amgg4YYqZ+gbYTlZ2Czje
 7FpWAJ1m5jKOAoJ+f1u43zBORoyZ/BIYS30pw/55U/EmHy7fvMd8F4JNk
 wDslJHDwzY4RQdIAT+sOB+scVR6QPEgLL0Dg0rqhjZSxo5gXYFMoevLpY
 m40EhEYVM0sjxVEqSA+hzltJzrqg8pcK7OobspJJtRQYeyvniS2bMAU04
 wgoYM24L3zRMkZ74tN2dkrXT6GzKgZUVIL+8TrZevQLYlOQxMn13Y/DaZ g==;
X-CSE-ConnectionGUID: grt6T1oPT+yRlyXeN+1NBQ==
X-CSE-MsgGUID: ncrmTEsZTsKEMq4Vktv9qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75729063"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75729063"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:55:13 -0700
X-CSE-ConnectionGUID: /TRo2Ca4SxClWaCfovEE9A==
X-CSE-MsgGUID: 1de/AcfWQQe0T9iNHkm6sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="227595606"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 30 Mar 2026 00:55:11 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v9 0/6] kms_flip: limit number of subtests run
Date: Mon, 30 Mar 2026 09:55:02 +0200
Message-ID: <20260330075508.1003899-1-michal.grzelak@intel.com>
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

[1] https://lore.kernel.org/igt-dev/20260309092528.3336467-1-michal.grzelak@intel.com

BR,
Michał

---
Changelog:
v8->v9
- change devid from int to uint32_t (Thasleem)
- add all_conns into opt_handler (Thasleem)

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

 tests/kms_flip.c | 85 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 14 deletions(-)

-- 
2.45.2

