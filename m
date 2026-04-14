Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F29FED7B93
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 09:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A6110E5C7;
	Tue, 14 Apr 2026 09:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OByEbGJP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF1E10E58E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 09:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776160335; x=1807696335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YMwbppbTNPg5Cv+4lwczTz7V4jdLU5dHmTGkwC03Rvw=;
 b=OByEbGJPZCRGAdMWovdDC2XoRyc7QLImVfld7WAb5UeRH3KOWIn3dviH
 RQSI6Z9pkTBqP4DUb8CwvQ0egOi1dF6bHrvI7xlOIz3N/03eD7z3oTHit
 zERzvM0NPFsT7YWG4HuhCfhV84GjiZEd750Cz5k61xuTWuA4PGVkRJ3Ky
 CEK6oTo+l3LMorug9ZAVg2w7UfVM7VZ0Z9I+BDCwfn7mfccQmnascsJT8
 /zVH9rNGsL96/iumwaNqNHlidSXFA0GPB2UibWMjvzXjdZ66F770aekDl
 qo7O8GaHdIJSIJTVq7aZs3LsGxzGZLvsj5MhpQ54gDWR2lhYKuf8IgVom w==;
X-CSE-ConnectionGUID: FHmdaz0FTXyrq24ZEDG33Q==
X-CSE-MsgGUID: SOssZUZmQn6XVT3L00/VQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77293500"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77293500"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:52:15 -0700
X-CSE-ConnectionGUID: K8p64LLERFaGin9GclfG3A==
X-CSE-MsgGUID: tZf0U7P4QDerY3lLNVf2LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234979964"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 02:52:12 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 0/4] Enable and Add new tests for DC3CO
Date: Tue, 14 Apr 2026 15:20:10 +0530
Message-ID: <20260414095014.55950-1-jeevan.b@intel.com>
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

 tests/intel/kms_pm_dc.c | 157 +++++++++++++++++++++++++++++++++++++---
 tests/kms_vrr.c         |  33 +++++++++
 2 files changed, 178 insertions(+), 12 deletions(-)

-- 
2.43.0

