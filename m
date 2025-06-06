Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C3CC61CE8
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 09:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D3110EA14;
	Fri,  6 Jun 2025 09:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhZ7araD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8606910EA0C
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749203170; x=1780739170;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f7dPiMhSKm1g2oTYlwtPTTvmiiHXtWWxAHbG2SbzYvo=;
 b=KhZ7araDvaDVsfPXWIA9kKD5pMawgjDyk5JDl0ADZ2pEHMK702UNTvrf
 z61t2KbEuCCIU5SYyLpeCi1ia+aTN4Bi6037WEJMrqRFg9shi+xKs8my1
 OevlJfewXLFj/7IihgydqDaD+EzwpVd7xBXRASlLea+5t2rLPHHOpJC/f
 DUZCuKKNBwaJG8sFn2ImiPRzfldjyJB2QAm+NZRJxlCZUY0/gnKgGC3Ip
 PlCQFdzu4tPyDUV8TkEs3+sodOJN+Dl54ua51VqkFH51ClwEr/4yVcjcY
 Nt4C37Ei6//EZDSlIq2kGKNk0GUuqMNxqaCwwmod9uzztlXDv0qBvY35Y w==;
X-CSE-ConnectionGUID: uoHufKVJRMCgI4IP+zZVDw==
X-CSE-MsgGUID: 4LiR7129TK6JsSYViqLNCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="62745034"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="62745034"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:46:07 -0700
X-CSE-ConnectionGUID: EMW/++nBT0SdBDiYOD4bzA==
X-CSE-MsgGUID: YdgCxCGbT2+G+Jsi1p08+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="182974790"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:46:04 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v3 0/5] Add render-node,
 gt reset and suspend engine activity tests
Date: Fri,  6 Jun 2025 15:40:03 +0530
Message-ID: <20250606101008.1949955-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add tests to validate engine activity on render node, after gt reset,
suspend and multi-client.

Also add a test to validate engine activity by opening PMU fd after
starting the cork

Tests added:

1) engine-activity-gt-reset
2) engine-activity-gt-reset-idle
3) engine-activity-suspend
4) engine-activity-after-load-start
5) engine-activity-render-node-idle
6) engine-activity-render-node-load
7) engine-activity-render-node-load-idle
8) engine-activity-multi-client

Rev2: Add multi-client test
      fix render node test

Rev3: Add gt reset idle test    

Riana Tauro (5):
  tests/intel/xe_pmu: Validate engine activity on gt reset
  tests/intel/xe_pmu: Validate engine activity after suspend
  tests/intel/xe_pmu: Add tests to validate engine activity on render
    node
  tests/intel/xe_pmu: Add a test to validate engine activity after
    starting load
  tests/intel/xe_pmu: Add multi client engine activity test

 tests/intel/xe_pmu.c | 201 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 195 insertions(+), 6 deletions(-)

-- 
2.47.1

