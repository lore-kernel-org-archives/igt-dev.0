Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F5BCFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 08:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0E110E2D2;
	Tue,  2 Dec 2025 08:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aC9h0vGY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183DF10E2D2
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764664941; x=1796200941;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZAYhyOl8GxoSSBpr5CZTkYdkYaCiDiL5P5EcAKzySxA=;
 b=aC9h0vGYZug80yoYbHf+U2wglTa9uBg/d5bc2/LhGl6wPKFKJbK9B8+s
 L6R7qcHl0Th8x8sBWUOCoSeO96Mft0UOqz6LzFgpFYc07FJOmaNI0KS65
 24SrH1NM4m8eKwqth21HMJumV5SUJc4PVR9+iRLrj3/+vHvnejlDbcCcc
 f6JExEo74zCoDw/AUndUK8ku5g6DmdAzehYcpiNCToGIQK8c25QzoxvJu
 l/pAvHPcxAl/2tKSFnQ3YVU3qEs4o+cN0NZt3nZbVA5nno6rY3bPLtUhw
 tUilVJK34nsYO6YpeNb05BFoR6Yv7AhVUaP8dlmQU/i1lk/irpzEV2Yxv Q==;
X-CSE-ConnectionGUID: t0CqcUsrQceVKjrEgK24LQ==
X-CSE-MsgGUID: cWdNVzRyTKmOns+oTREIkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76943127"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="76943127"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:42:21 -0800
X-CSE-ConnectionGUID: 534cR+e2T9SoqR/nzXWDYw==
X-CSE-MsgGUID: H+sEdA6+QpS6rgjj8N/Mkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="198693490"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:42:19 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, kamil.konieczny@linux.intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 0/2] tests/intel/kms_joiner: Add function for pretest
 checks
Date: Tue,  2 Dec 2025 14:12:41 +0530
Message-ID: <20251202084243.2677718-1-karthik.b.s@intel.com>
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

Revert the patch which was added to cleanup the igt_require checks by
adding them to subtest groups as this can lead to spurious skips and
corresponding noise in logs.

After the revert, add the clean up patch which moves the igt_require
checks in invidual subtests to a function which is called from all the
subtests to avoid code duplication.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (2):
  Revert "tests/intel/kms_joiner: Cleanup igt_require checks"
  tests/intel/kms_joiner: Add function for pretest checks

 tests/intel/kms_joiner.c | 256 ++++++++++++++++++++++-----------------
 1 file changed, 142 insertions(+), 114 deletions(-)

-- 
2.43.0

