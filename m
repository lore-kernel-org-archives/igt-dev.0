Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9551FF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 23:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885C610E8BE;
	Mon,  4 May 2026 23:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBgM6zX9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D3A10E8BE
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 23:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777937370; x=1809473370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ufg0rgqTOL0Bd7PXSffbkSERy2H/YAwQGZxtB1d95ZM=;
 b=HBgM6zX9RzLR/F2TshRFrYhZm1q/u+bKNyG6mZgJN6y1ot8Uf2HRaKN3
 KYSNeHssfcqBhtxPgmHSn/vo7VD+RVvNrd7dZY+zUi3B8mWfe5eKxUsav
 +8sURmbMLHPrqvIjlZrvLsPrmlSf94OQ5aHYD1awVvnBwTCzAHQz6UTja
 Ldbffg0a3CBABr6ZX4plQLjTufXWgfOHGXXxAWN2Ep3WRMZh9BsMkTzIP
 hHtjnSj9ba1HmbsMZCDd35NtzML84nm0KiKgEetyKkpqF6xu6ziRVzun8
 V6bD/5BcgLuxba1Ty5Amem1tLBWz+H+VW4GDemcYkAwgm3NXA47eudKiB w==;
X-CSE-ConnectionGUID: CrBEcUWASP2B85ZDiiPUSQ==
X-CSE-MsgGUID: KsDJ9QJsQx6ddrj/gzbqXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78993542"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="78993542"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:29:30 -0700
X-CSE-ConnectionGUID: dbaGvDwrSHGoY8g503WWLg==
X-CSE-MsgGUID: r1Co3oUNR/CwxTRVIcjM6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="232509841"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:29:29 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	x.wang@intel.com
Subject: [PATCH v3 0/2] tests/intel/xe_exec_multi_queue: Replace sleep with
 deterministic wait
Date: Mon,  4 May 2026 16:29:19 -0700
Message-ID: <20260504232921.16367-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

In 'priority' subtest, sleep() is used to ensure some submissions have
reached the hardware before we proceed in the test. But sleep duration
is indeterminate. Instead use a more deterministic method to ensure
those submissions have reached the hardware.

v2: Read timestamp to check if queue is started
    Use usleep to ensure all semphore updates are visible to GPU
v3: remove unwanted preempt flag setting (Stuart, Xin)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>

Niranjana Vishwanathapura (2):
  tests/intel/xe_exec_multi_queue: use timestamp to check job start
  tests/intel/xe_exec_multi_queue: replace sleep with barrier queue

 tests/intel/xe_exec_multi_queue.c | 93 ++++++++++++++++++++++++-------
 1 file changed, 72 insertions(+), 21 deletions(-)

-- 
2.43.0

