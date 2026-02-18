Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B540E9A02C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 16:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0C989A5D;
	Wed, 18 Feb 2026 16:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJj1lvjo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF9E88FBD
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 16:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771433080; x=1802969080;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fIQKz3CZbjikrdVhnnoFh1hnawb4ZFtDIqHjg8MlNwI=;
 b=aJj1lvjo9yC0358pN0U+RwEMUPR0mZl/TdKUnlZGv3W8wd2cnypjFaBn
 1cZ02hX1rLYdn2KV5VZ8rUi655rgIFf1S5mYnXFoizOK8JtmZCwe9Yzu1
 cwNtFKmNm6U6pwNwFyP7c3Mmp0negm6/qaBImQ7AVWK2a4tJjnf8erril
 GWPvMW031nunDra2eRdEk8M+q/NCJie04JYRN8b0sKNqt2dXGkwtKkP2+
 kSEOo8f+gHvTWEV6V++6jD9sfikQSEZMffNF05cRiyZ9p/iwKRwuLrf7Z
 OtVkRc22bZBJ39IYvbiXQbrk6PWaREosdb+muAvGi+7Way0MCd3FcEIb/ Q==;
X-CSE-ConnectionGUID: sKEofFs2QwKt/bZvbOrn8Q==
X-CSE-MsgGUID: wHx7kge1QKuK0C/q8z7tvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72555933"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72555933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 08:44:40 -0800
X-CSE-ConnectionGUID: 2ukoHBLhTc+BCSn17BKaUA==
X-CSE-MsgGUID: imcEJRtcSECyfbSRV7v7+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="251936452"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 08:44:40 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/1] tests/xe_vm: Add oversubscribe concurrent bind
 stress test
Date: Wed, 18 Feb 2026 16:44:16 +0000
Message-ID: <20260218164417.856114-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

Add an xe_vm subtest that oversubscribes VRAM and issues
concurrent binds into a single VM (scratch-page mode) to
reproduce the dma-resv/bind race found under memory pressure.
Prior coverage lacked any case that combined multi-process bind
pressure with VRAM oversubscription, so bind/submit could
panic (NULL deref in xe_pt_stage_bind) instead of failing cleanly.
The new test expects successful completion or ENOMEM/EDEADLK.

Sobin Thomas (1):
  tests/xe_vm: Add oversubscribe concurrent bind stress

 tests/intel/xe_vm.c | 421 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 421 insertions(+)

-- 
2.52.0

