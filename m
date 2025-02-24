Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610CDC021BC
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 14:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E7710E3EE;
	Mon, 24 Feb 2025 14:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AS6+t1YW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB88E10E3C1
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740408448; x=1771944448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NuzxqVkVnklWhUJtutoK1jwzAdVkvxg5coSBnmyHZZw=;
 b=AS6+t1YWuO2j3HhdHRZnzh1cdRP3sT5CSFcKXSfBWHKKrhF8CtmAXHwV
 HZArsL6bD+bUtxn9jz92ktqXqhDtfWKwniTl9V6xKzcBuT91dQEHu07Vp
 w79/EV29ebFiHnqu1FcodhDmYvrUtmM+BW3FB3HKG5DQYp9loxC1X7pxz
 ED2rAjBAA2aUlXkRpzAc3cmBZKzfQHpwPrL/hT5cKv37CxsB8SefrrmAe
 qGWn3emeaIdE++Bz5DFY9tdKlu/G4dA3yCqHMTW05dlV5bdnA2eySRuaM
 3zBHT4wDe16SjwlSc2VBSMuWtzwsfBkl8LI8+JruEcD61ewxib2iMIF4S w==;
X-CSE-ConnectionGUID: O+Hi2Hq3QBCPRNvjXbwuSw==
X-CSE-MsgGUID: NXNZtLsBTsmnyXO/3W4k4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51793276"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51793276"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:47:20 -0800
X-CSE-ConnectionGUID: AHJhqSqBTXuG5j5ci4CNfQ==
X-CSE-MsgGUID: N3dEG0SQRomJOGHYlUMOpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="120689942"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.122])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:47:18 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v2 0/6] Prepare lib/intel_compute for SVM/system allocator
Date: Mon, 24 Feb 2025 15:46:08 +0100
Message-ID: <20250224144705.1019940-1-francois.dugast@intel.com>
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

This series provides a series of changes to give more control to the
user of lib/intel_compute when executing a compute kernel. This will
help to test corner cases requiring a specific execution environment
as well as to test the system allocator from the compute kernel
context.

v2: Add patch 1/6, rebase others on top of it, improve documentation

Francois Dugast (6):
  lib/intel_compute: Make loop count a parameter
  lib/intel_compute: Rename variables for input and output data
  lib/intel_compute: Allow the user to provide a vm
  lib/intel_compute: Allow the user to provide a custom compute kernel
  lib/intel_compute: Give option to skip results check
  lib/intel_compute: Allow the user to provide input and output buffers

 lib/intel_compute.c       | 291 +++++++++++++++++++++++---------------
 lib/intel_compute.h       |  31 +++-
 tests/intel/gem_compute.c |   2 +-
 tests/intel/xe_compute.c  |   4 +-
 4 files changed, 212 insertions(+), 116 deletions(-)

-- 
2.43.0

