Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE55CD98EE
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 06:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B3110E0A5;
	Wed, 17 Jun 2026 06:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTVyPo9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A5A10E0A5
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781678966; x=1813214966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uzPMnQb14LqMd39pRYgy/MPKb/OfmcNbGX/MZQVihl8=;
 b=XTVyPo9t1xTXI+SARmBDwXfn7MqmFG5g7XcOGzvU+3YMw3H+r+MF/NoA
 v0gzqbQGIDXHo544pMHnYrJKjsfbbPE3MUI42BUBjaNfCW/pvAX5S23RW
 FS7Oi6JkMs3YmXha9BGO+93awJLSYPuysjvnrw6tUmN8tpXEtqxcrPKOr
 epCm5NECai6x6B/OdqFPKV0xrsD+PwkTwopY7GFpl5ecbMp9houYjcoFu
 M1u9NMGWWPgQqfBxlKhk8tAur6QnzSeoYF3BS0aOcpaJINNZUFRnB4GOX
 ilyr9P4DGNqcoaNBxx9WIZ1M0q9ymCTj/XSI2T2f+MpLlMu9aXByoUwGc g==;
X-CSE-ConnectionGUID: MSruv22GTyWXzWh0ZwG+Aw==
X-CSE-MsgGUID: jfiYCWBDQOOD8gOBihjkVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86305065"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="86305065"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 23:49:25 -0700
X-CSE-ConnectionGUID: xaRqdj/RRBirX5JLS0v9Rg==
X-CSE-MsgGUID: gw0oui1LSpiNec4L56+H7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="248046585"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by orviesa007.jf.intel.com with ESMTP; 16 Jun 2026 23:49:24 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Subject: [PATCH v9 0/2] tests/kms_vrr: Add full-range refresh rate testing
Date: Wed, 17 Jun 2026 07:48:45 +0100
Message-ID: <20260617064847.860438-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
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

This series extends kms_vrr to validate hardware stability across the
entire VRR refresh rate spectrum, rather than only fixed step increments.

The first patch reverts a previous workaround that started virtual RR
tests above the midpoint to avoid mode fallback. This workaround is no
longer needed once full-range testing is in place.

The second patch introduces a 'full-range' testing mode to kms_vrr.
When enabled, the test iterates from maximum down to minimum refresh
rate (stepping by 1Hz), covering all supported rates within the VRR
range. For eDP displays, the test is skipped if the panel does not
support multiple refresh rates. Standard behavior (min-to-max with
defined step size) is preserved for existing subtests.

Lee Shawn C (2):
  Revert "tests/kms_vrr: Start virtual RR test above midpoint to avoid
    mode fallback"
  tests/kms_vrr: add support for full range refresh rate testing

 tests/kms_vrr.c | 184 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 142 insertions(+), 42 deletions(-)

-- 
2.53.0

