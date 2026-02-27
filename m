Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD6AFD7F97
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 11:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18D410EB10;
	Fri, 27 Feb 2026 11:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAO3pgCR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E2810EB0C
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772192502; x=1803728502;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V4er+0MZsDCWPql+I1yKG01VC1MQEbOhA4MwQUa+8K0=;
 b=dAO3pgCRTtnSgaehftTdQnq/rkgtuXXQCRYgN99dPK0QWD4Y/YJAh1Vi
 taRTVrgIh5mGrbaHi3gxUGLYh5cvHH8Qc77jZa56S0QJvcvTcR9Dpq+49
 oHhwLhauaNbfx+Y1CkpDx2R++ksFC2SI6GHwcGh+XIyhWmOVrT4SS+VDh
 /v/gfJWSbpubk+1SP7H3mOc7kwrAvfE3ae9hGXwSNc35k7DshybWzh+5s
 Ry1Hy5excB50f+o0Ldt80WLZaDYqxrj8QuZbAmpgTIWlNOZt/XcDAyWKt
 pgBK7k1KosMXqaRRDmBaIbtUM3KfZCuVx2vCozhJW12LHqF/lwuOjWHEX w==;
X-CSE-ConnectionGUID: MuVZvD5kTem7rIw2z/x8Fg==
X-CSE-MsgGUID: eDqFKWqEQuCBOoIVCXyvMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73241313"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73241313"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 03:41:42 -0800
X-CSE-ConnectionGUID: kLaCE6/UQyymBtm+IeOtDQ==
X-CSE-MsgGUID: CidNQuKqRVS6am0j9SBUxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="254655430"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 03:41:42 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/2] tests/intel/xe_eudebug_online: Fix sporadic failures due
 to unhandled fsync errors
Date: Fri, 27 Feb 2026 12:41:31 +0100
Message-Id: <20260227114133.2850125-1-jan.maslak@intel.com>
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

Fix sporadic failures in xe_eudebug_online pagefault tests caused by
fsync() on the debugger VM fd silently failing when the GPU cache flush
hardware is temporarily busy.

Jan Maslak (2):
  tests/intel/xe_eudebug_online: Set timeout for debugger VM fd sync
  tests/intel/xe_eudebug_online: Assert fsync return on debugger VM fd

 tests/intel/xe_eudebug_online.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

-- 
2.34.1

