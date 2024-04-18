Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0BAC001CC
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 20:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1661B10E83D;
	Wed, 17 Apr 2024 20:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l67eJNXX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F33610E513
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 20:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386932; x=1744922932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/ETgXe9ct/Wc5MdgWrtVg0LGSmucL7WKJHphlu11GNM=;
 b=l67eJNXXD6paC5yGBmCuW/Fy4R/If3al9cJNwl0p13JhZkG4jHAbBxWH
 7HwbwYpiMPst3cf88pCfBccse83DuU2gaqBOcK2yuIEiPBBSvJNt/uoOU
 cRAnSDg86LUrS+aw/qSfT9LIlVrMGiZMeZE6JsYcQPE7+FcAIQy0ibofv
 hOklL58EuD1X2s5fKD/jPD1y8JncsyqQJOXKz6UtkrF2Xnf9mjA/UBH5x
 v116JE9724hJ8OmJUlQo4BYoZtzoNtKO9qg/cWJ663GrAa5cEGEhPG9kQ
 lq2dTqrJm1jUwuQpNlNLQT0Jdhas1rDeePUlQBrdex82iBHIccs3IC3Wr g==;
X-CSE-ConnectionGUID: 41DwSNBuTDSxwv+MkJJWSw==
X-CSE-MsgGUID: pCHDUVxZRkqEu5n4G2nUHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9071275"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="9071275"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:48:52 -0700
X-CSE-ConnectionGUID: Ien2+2HBQoazqh+LLrmHTQ==
X-CSE-MsgGUID: REBpu1dKTHCCVlm78pqLrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="60173266"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:48:51 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v6 0/2] Update compression check based on platform
Date: Thu, 18 Apr 2024 01:46:41 -0700
Message-Id: <cover.1713429755.git.akshata.jahagirdar@intel.com>
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

In Xe2+ platforms, we need to run the xe_ccs test regardless of the status of
flat-ccs.
Check if the platform supports compression and has flat ccs enabled,
and if it doesn't, then update the check on compression
and proceed with the test.

Akshata Jahagirdar (2):
  lib/intel_blt: Add helper function to ensure platform has  flat-ccs
    enabled
  tests/xe_ccs: Update compression check based on flat-ccs  enablement

 lib/intel_blt.c      | 14 ++++++++++++++
 lib/intel_blt.h      |  1 +
 tests/intel/xe_ccs.c | 26 ++++++++++++++++++++++----
 3 files changed, 37 insertions(+), 4 deletions(-)

-- 
2.34.1

