Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE8FCD8CB2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 07:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F98310E762;
	Wed, 10 Jun 2026 07:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxqYEtO6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6D710E754
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 07:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781075574; x=1812611574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SAUXGNHigPA8mwcCV41cs+k620dFJfgPJtfrQHM9Cxw=;
 b=mxqYEtO6ZsYz3I1KFKCayg0JHzl4Agih+J0eBHnHJJkNiIwFpUniSTHj
 TXJ22MZmFVwKEmHBhi4iz0SYCU952IxYzMGUy9yQQt3MGhkN6yZzkd57w
 cfpXNDGw9Lm06uiFTSs/7PitXy0liipWC3kOKnntJCsgzQ/mnODRAmuXt
 KOCPRGQ9ynyXpOtmk4pJZ+fRz9iGWVhry9MZt5Ll91FfLWJSbeUinOyi+
 llij+r4Wlj6qLp9doJigY6Oz9uZpZ9qXgkeqonyzJPdsxmlUhtC1hdqYb
 /kOoWEpjT62NaKf30aZciCjm2Yt0FDVrDWz5CLbLXQlI7hhgolvqI6tc7 g==;
X-CSE-ConnectionGUID: IHFTzl+7RDGUgVIzvlTMcg==
X-CSE-MsgGUID: WdcyvBN/RnytG9OCfHV5VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92180152"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92180152"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 00:12:53 -0700
X-CSE-ConnectionGUID: AfoEsCIIQ5yHBH0r/ujL2w==
X-CSE-MsgGUID: u848m31eQJumCAi83oS9rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251167508"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2026 00:12:52 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v4 0/2] DC5 DPMS/PSR suspend/resume validation test
Date: Wed, 10 Jun 2026 12:32:51 +0530
Message-ID: <20260610070253.25329-1-mohammed.thasleem@intel.com>
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

This test validates dc5 dpms/psr before and after suspend/resume cycle.

Mohammed Thasleem (2):
  tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume validation test
  tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume validation test

 tests/intel/kms_pm_dc.c | 46 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

-- 
2.43.0

