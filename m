Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAE5D35693
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 10:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAE710E635;
	Wed, 28 Jan 2026 10:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhK8SHMx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF48D10E635
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769595166; x=1801131166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iURWpT0OmeiPyxS5trSqxhMnZf5qXEFZ7iIDng9q/ho=;
 b=BhK8SHMx2r+e2OvdkMgyUPMgvXy9GexNLAMwmazeeRlJ7Joj4y3Zwq7Z
 WWEavJM7UCBZ/cArfnpoDgLj7KP9N3Zfj894X+45RhNiNgF726Ftik4s/
 aNn1PADhrpM5zE+/qMomARnRZTFtFuRuH7awn4t40CfoEHR0GM4DgSmMY
 btpAJTucNEDDLpqhboCNEFKkGCCtb9JVRVmvFjKjKGEstZa5xuA9QPpD6
 RFixQ8wVMo/02BeyIzrrgBW5ageicHeURx90Mgr9GE8lTqqemYtUIuVA5
 VZtgKR8wRJHrdejMLiHMhlw67hDX+qHfHLxtLbmQxcZCEz6+juw9JCd5U A==;
X-CSE-ConnectionGUID: RPqtUcwBQmSOcTSNbBW8cw==
X-CSE-MsgGUID: 5xPTu22OQHOyH5W9cIBDiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="96264740"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="96264740"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 02:12:45 -0800
X-CSE-ConnectionGUID: 1xL4Nn6pRJKTFjpH9+pYbw==
X-CSE-MsgGUID: 5J/92tGSSzagimx6zq/SUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207362637"
Received: from prudnick-desk.igk.intel.com ([10.91.34.80])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 02:12:43 -0800
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
 Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: [PATCH i-g-t v2 0/2] xe_eudebug_online: Fix test_interrupt_other wait
 logic
Date: Wed, 28 Jan 2026 11:15:13 +0100
Message-ID: <20260128101529.401653-4-piotr.rudnicki@intel.com>
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

Fix test_interrupt_other to wait for the correct client after reset instead
of the original debugee. Also improves cleanup handling when debugee has
already terminated.

V1 -> V2:
 - Split into separate library and test commits
 - Use wait_for_workload_start helper to verify second workload started

Piotr Rudnicki (2):
  lib/xe: xe_eudebug - Add pipe validation and cleanup improvements
  tests/intel/xe_eudebug_online: test_interrupt_other wait fix

 lib/xe/xe_eudebug.c             | 16 +++++++++++-----
 tests/intel/xe_eudebug_online.c | 23 +++++++++++++++++++----
 2 files changed, 30 insertions(+), 9 deletions(-)

-- 
2.43.0

