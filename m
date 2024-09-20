Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57273CF58FA
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 09:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C18910E06C;
	Fri, 20 Sep 2024 09:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7JF/8uF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AED010E06C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 09:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726824802; x=1758360802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T/8VsnZgFP28coNewjLQOZoHqCznMTxmuGkNTbXTdxk=;
 b=k7JF/8uFhLrOl27N9zwEeczvDrEK7wkG6uukyYwu/XWaatO4p0Km+t30
 Sewl8507DD2tYXV4KgIjuy+o4PAEIuifnRgtF92qbdbN77PuhQmAcVfMT
 t+ewJOYKZzDxbtpim8vQnYh8D0tFMN5TsgcM6agoovBj01gWQYw1oaMwb
 7ZmpuF21y5gs+eY/CABizi2oueUBuTz90fxMxUytcqVm0D0hGpgacX5rB
 w9S6kQq5/k+Poo1ZY8o3BsdiMm2CcXer33zr5jg0BvcE6goKUfQxFmcCj
 cfUNodhVNy2dZc/Mc3LQOj5neb3NHHYzyHEmjlwsLBtTRFDGjDKFjZKo/ g==;
X-CSE-ConnectionGUID: Q0/3ZoJkRLKjDKZz6WNdsQ==
X-CSE-MsgGUID: XMvLC+HKSbm720P9ez/Q8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="28721543"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="28721543"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 02:33:22 -0700
X-CSE-ConnectionGUID: bWeA9RnvRdqaKqW4LyLpfA==
X-CSE-MsgGUID: dIl1l4EpTSm4hvKoUd5Odg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70276744"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 02:33:20 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, santhosh.reddy.guddati@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] tests/kms_vrr: Update LOBF test to resuse the
 existing logic
Date: Fri, 20 Sep 2024 15:15:19 +0530
Message-Id: <20240920094521.1222304-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

Removed the test_lobf function and used test_basic instead to simplify
the code. Improved validation and error messages to make LOBF testing
more reliable.

v2: Added new patch to check alpm status and check before exeucting the
    LOBF test.

Jeevan B (2):
  lib/igt_kms: Added library functions for aux-less ALPM status
  tests/kms_vrr: Update LOBF test to reuse the existing logic

 lib/igt_kms.c   | 23 ++++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c | 52 +++++++++++++++++++------------------------------
 3 files changed, 44 insertions(+), 32 deletions(-)

-- 
2.25.1

