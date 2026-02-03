Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4225FE87822
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 12:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33B310E644;
	Tue,  3 Feb 2026 12:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inr43OCK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DA610E320
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770123285; x=1801659285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WGOMyPalW8p/ddtMh64mCb0dokZYXonhrQL2mVxfC60=;
 b=inr43OCKNroipmeew6Homg3BLxwEMtYrP9zMG2eCIcFAgbLldRVUMG01
 KCBOFAhT+yaB0+aaJYd7ZWIP6Q2XG1HlH4iR7GvvnJXgqagczyPOuAgcb
 XdcGNvIvih975IHlwOE36iocikcsBwaqIVTbssJlvqqubniY4LLyNqDgq
 JYXMIivOdh7r1oKjhJyDQFf2IuQWKgTwCZ2XJvrZ7oTn0R+wzk05uyfd0
 Em7pYouJAmsWys0eJAzjfnuy2QxSlRCUkhza1oFQ7kvh9C7mUdPutZYis
 Ov1oUH5D3llHsw5jhXKuC4pyuRGHNqR6/lMWS/zZfEqrn2iaK8t6HLCAX g==;
X-CSE-ConnectionGUID: 01vNH6NLRM2VFNboAuzekQ==
X-CSE-MsgGUID: XtfdOMZASVC3vOwNmeBIdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73889287"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="73889287"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 04:54:44 -0800
X-CSE-ConnectionGUID: 31QiAyX3TWq1ZORqSJJEbg==
X-CSE-MsgGUID: i57eluZ1QVCTjDtvqye6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209631335"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.46])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 04:54:44 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/3] Improve eudebug test cleanup
Date: Tue,  3 Feb 2026 13:54:19 +0100
Message-Id: <20260203125422.32880-1-dominik.karol.piatkowski@intel.com>
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

When there is a debugger fd open and an assert fails, there is a problem
with environment cleanup. If enable_eudebug toggle was previously off,
it is impossible to turn it off in case there is _any_ open debugger fd.

Keep track of all opened debugger fds in igt_main and close any leftover
ones before attempting to restore enable_eudebug state.

Change pthread_join to pthread_timedjoin_np in discovery-race* tests to
avoid hang before reaching cleanup.

Add retry mechanism in xe_eudebug_enable to make sure the cleanup will
not fail due to race conditions. Abort on unsuccessful cleanup to not
leave the environment in potentially dirty state.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (3):
  lib/xe_eudebug: Add retry mechanism in xe_eudebug_enable
  tests/xe_eudebug: Improve cleanup on test fail
  tests/xe_eudebug_online: Improve cleanup on test fail

 lib/xe/xe_eudebug.c             |  18 +-
 tests/intel/xe_eudebug.c        | 297 ++++++++++--------
 tests/intel/xe_eudebug_online.c | 529 +++++++++++++++++---------------
 3 files changed, 465 insertions(+), 379 deletions(-)

-- 
2.34.1

