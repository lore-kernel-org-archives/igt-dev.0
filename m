Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA083E7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 08:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7780410EF5A;
	Fri, 13 Dec 2024 08:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIe0nPj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E3A10EF5A
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 08:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734079199; x=1765615199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7aC/cv0LKUOjM1ohPV4urVL8WVMBKuETxaZWIvmGgcg=;
 b=LIe0nPj03JBCCn9YkKz1JYsLyBGL1VYz+25TUb7MWXvSNVFySgtBETdM
 +DUo1xU4tJk5yDHpIm9ZdODyhCW6f992z8OcaDelUaRUBPGVKid6X9W1d
 oYFxnvZzR7nm1QdZdV0Qn1IJB0HfjAtHtZszQEqK8YyX4L36cWzlndwnh
 Chmi5QABiHogz084D703uHrPv5yKB1OSvAX9b/M4MA2ttc8m01ug44QJT
 ZjNVuakNZ41wt/rsGUJ/8WamYWxsixEPbExqs+w/kTKeg8JLba2eQgCVk
 awYx/v2qghO6E43eLbk8v9bGRgZqNY5XsDl4bvcntXciigXcvsHTUH2Vt g==;
X-CSE-ConnectionGUID: zL0SkscwR62HCo5NRYGBFA==
X-CSE-MsgGUID: iGtNPQ6BR3GDTKALh535CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="37374481"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="37374481"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 00:39:59 -0800
X-CSE-ConnectionGUID: EKwzaOUuTD2zMElioltRJw==
X-CSE-MsgGUID: 2DKs3cFnR1uvVVnvs93Qjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="97035355"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2024 00:39:58 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v9 0/2] tests/xe_spin_batch: Add spin-timestamp-check
Date: Fri, 13 Dec 2024 14:07:28 +0530
Message-Id: <20241213083730.642423-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Move the spinner related functions to lib.
check the ctx_timestamp register post gt reset for each engine.

Pravalika Gurram (2):
  lib/xe/xe_spin: move the spinner related functions to lib
  tests/xe_spin_batch: Add spin-timestamp-check

 lib/xe/xe_spin.c            | 203 ++++++++++++++++++++++++++----------
 lib/xe/xe_spin.h            |  52 +++++----
 tests/intel/xe_drm_fdinfo.c | 195 ++++++----------------------------
 tests/intel/xe_spin_batch.c | 121 +++++++++++++++++++++
 tests/intel/xe_vm.c         |  17 +--
 5 files changed, 343 insertions(+), 245 deletions(-)

-- 
2.34.1

