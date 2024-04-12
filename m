Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F1BC04FF0
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 01:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E489610ECF8;
	Fri, 12 Apr 2024 01:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFsYf3JE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3F510ECB6
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 01:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712885975; x=1744421975;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5BVN+K6LetBbERJd3ENZBDy+WS2ltZBpT3dqKC/wJXU=;
 b=bFsYf3JEPxYv++euuTmkj7YT1Kuu8bu9UYz8qGEbkmaPI5C3yB2OpJXt
 H0DhWIFhUmLjqeoa8wMd//TGM+Bwwt0FWLIEJHbi031zeFTpLam88l0gS
 FzNLabghU4iVVEC3nshbKCpcSgeaHgdPMx14/9udGeUQndbGjNeut1NwA
 Zf4ddg2g/o/iwh/UO4a/4uJVmkrc58XO8TuVE6LVeQu0Fi2kp+C9v4yWg
 RPEKlIBEPwodPgWUBUWTWYnDlL2Oauvrpd+33xqZKLTTzESPJGbXNEi3r
 y36zA2iSBZUstEliKqaaVHgK2vIi+OS6WuaaYASKR39FJ4Uw7dV5TLtY4 w==;
X-CSE-ConnectionGUID: c2ciOFCzTeO4F75GenWDNw==
X-CSE-MsgGUID: 0EnRdv+TQoCadR4DHHvF3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19722802"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="19722802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 18:39:34 -0700
X-CSE-ConnectionGUID: 9QSNEFOMQeWSVDQV//AvUQ==
X-CSE-MsgGUID: +HJairtkQnuubhOdEnsFYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="21171261"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 18:39:33 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 jonathan.cavitt@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v4 0/2] Update compression check based on platform
Date: Fri, 12 Apr 2024 06:37:28 -0700
Message-Id: <cover.1712928787.git.akshata.jahagirdar@intel.com>
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
 tests/intel/xe_ccs.c | 13 +++++++++----
 3 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.34.1

