Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4C9EDEC04
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 04:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F9710E0EA;
	Wed,  4 Mar 2026 04:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+hwBAcG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C1610E0EA
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 04:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772599067; x=1804135067;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fMjt6EHhEs7fe4hkVtjsQeJQHN+w0dlr7DiTpLMlW6k=;
 b=d+hwBAcGuBMXc20lW8AlOBvkGuFAsKLsZRLdGGl0ugV36X3J6ffG37RT
 vFIc7Z3Zj5t5V8V/biC5u3JUjCORSh14w9boRghtT4nqxXm2hmIhhbsJU
 un/eNPNNl30Dlz7QINpDbSOoPo28PYosGRBrPKa9FlDZua6gc4Z4iE2Yk
 becaUcdFfZIzaRY8VOkKqgBa/aHsz1T2FjO9seedR506ME9x+29/y7jsW
 trN+NubsemjtN1DBW/RjGYf/82BdHiH4zH17/aa0zPLAV/Rc5xb7n2RAn
 vNaUIoozIgcLjrIZ904KFKCUcZ5hBNzWHyRcYp1y008CRcPl0hQ7CbSBE g==;
X-CSE-ConnectionGUID: 5juHhWi0SqGN8xy6WV4q7w==
X-CSE-MsgGUID: hrgIYQwaRIaUmZJZ5m7cmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73560225"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73560225"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 20:37:46 -0800
X-CSE-ConnectionGUID: KCrQjGTeS6miBiaDq8fcXg==
X-CSE-MsgGUID: b6MKMcZ+Sxq5U2Wn33lGJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218332503"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 20:37:44 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/4] Enable and Add new tests for DC3CO
Date: Wed,  4 Mar 2026 10:08:01 +0530
Message-ID: <20260304043805.572087-1-jeevan.b@intel.com>
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

Enable DC3CO tests for PSR/PR for display versions >= 35, add a new
test for DC3CO to validate frame drops, and test DC3CO with LOBF.

Jeevan B (4):
  tests/intel/kms_pm_dc: Replace require with proper assertion
  tests/intel/kms_pm_dc: Enable DC3CO test for PSR2/PR modes
  tests/kms_vrr: Add new test for DC3CO validation with LOBF
  tests/intel/kms_pm_dc: Add new test for dc3co framedrop validation

 tests/intel/kms_pm_dc.c | 120 ++++++++++++++++++++++++++++++++++++----
 tests/kms_vrr.c         |  33 +++++++++++
 2 files changed, 142 insertions(+), 11 deletions(-)

-- 
2.43.0

