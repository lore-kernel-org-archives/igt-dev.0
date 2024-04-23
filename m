Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4BBC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 09:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC40610FB6B;
	Tue, 23 Apr 2024 09:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPaYlIR4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEB910FB6B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713866039; x=1745402039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ChNO1c/EXMumQafsL9cG8LJ3emmpsutYjXuZkSQnmHA=;
 b=gPaYlIR4b2KZXEvmCDPjwCilMXEVN6+8ZSfUN2OD/rgBoxKTi+o77lVH
 uNK47GvxaNKx4d9s3mHSRlTBWeOpFixSx4dveHrAnmd6acalt0lwk9Lm7
 kKfy2TiyCbaKCHSR9je+JNlAj/iSFaWnTgaoKVVLOM8MAY3gwswWuXXwh
 KB4TLeI/Lxwqrn1uKfCL12vW6NzuMYYOYunJtrsbp6nbKsIYFXyZEqh3l
 q9YoxatYxLeRcdnoJUPX6Gvjj6ZX0cnkudXC39T3XxUYtlFb5Dyw695A0
 GwETnNoDiMiO3Mp0vpujy1XGZRS28/2ev9w3Cb/NiqId5eaGpta05FG4w g==;
X-CSE-ConnectionGUID: hP1Xjt7hR6CBZr1SPeq+AA==
X-CSE-MsgGUID: zmieYD7zS7K6mKonAAqrFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9306066"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9306066"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:53:58 -0700
X-CSE-ConnectionGUID: sBE3ky1RRQeAOs7yPV+U1w==
X-CSE-MsgGUID: xJmU36OwSsGCGCvnJu+/dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24322524"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:53:56 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v2 0/3] Put "Run type" highest in documentation hierarchy
Date: Tue, 23 Apr 2024 09:53:41 +0000
Message-Id: <20240423095344.3518545-1-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
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

Let's put "Run type" at highest place in documentation hierarchy. It
will be reflected in html generated documentation.

v2: Make that change in Xe, i915 and KMS (Mauro)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Katarzyna Piecielska (3):
  tests/intel: Put "Run type" highest in Xe documentation hierarchy
  tests/intel: Put "Run type" highest in KMS documentation hierarchy
  tests/intel: Put "Run type" highest in i915 documentation hierarchy

 tests/intel/i915_test_config.json | 150 +++++++++++++++---------------
 tests/intel/kms_test_config.json  |  94 +++++++++----------
 tests/intel/xe_test_config.json   |  66 ++++++-------
 3 files changed, 155 insertions(+), 155 deletions(-)

-- 
2.34.1

