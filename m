Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B291CCD184
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 07:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA6010E101;
	Wed, 18 Sep 2024 07:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEP0B+Tj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADB510E101
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 07:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726644986; x=1758180986;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mMBOb3JaR8RLFQ8wlA/iJqhwOVzwCGNnN9RrL4ZGCQk=;
 b=mEP0B+Tjc2rNtoVAvimQ8vm4Ak0ROMwhrG4iXD+eIyXKlLKYmMwNT9xF
 zuuA8X0A2QNOKefdsEOw6AYu1C8qRVMQSy3HL8unrjUQvILA5JCNdnLcU
 V9vghSqFv1rBT5aHGV41iBbkJVXCOpexzope6ZGw0UPqLQRFXMZC2xBpk
 MTCEqI1hu+f2KiuFdi5frutUuRytSLUIgtu0nQUfe5BIrANRSs9JZUA6c
 zoOJH4rmzKwfMzIFgpWxZKOaEkJGm9lXhZHRrgxywPvTgVj/WzxZ+EyvE
 VfkbuDej0yMTL9v0VGqjyCQRN3Yy3irXPjx1AMaTSzJEp03dJ0eZp/CbR g==;
X-CSE-ConnectionGUID: jAOadzwPSFCwXqNpniPipQ==
X-CSE-MsgGUID: +uhGwguQS5mKFeTsDq2viA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25359019"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25359019"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:36:25 -0700
X-CSE-ConnectionGUID: kIk+eo9hQGeY08hupeuV6g==
X-CSE-MsgGUID: 6TSZn3J8ThSXoJL6LvPnxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="73806706"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:36:23 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 kunal1.joshi@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 0/3] Add tests for ultrajoiner validation
Date: Wed, 18 Sep 2024 13:04:10 +0530
Message-Id: <20240918073413.28598-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
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

This series adds subtests to validate basic ultrajoiner modeset and
negative tests to validate invalid pipe configs on both ultrajoiner
capable display and on non ultrajoiner capable display using the force
joiner debugfs option.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (3):
  tests/kms_joiner: Add tests for ultrajoiner validation
  lib/kms: Update force joiner helpers to accomodate ultrajoiner
  tests/kms_joiner: Add subtests for force ultrajoiner validation

 lib/igt_kms.c                                 |  77 +++++-
 lib/igt_kms.h                                 |  19 +-
 .../intel/{kms_big_joiner.c => kms_joiner.c}  | 254 ++++++++++++++++--
 tests/meson.build                             |   2 +-
 4 files changed, 317 insertions(+), 35 deletions(-)
 rename tests/intel/{kms_big_joiner.c => kms_joiner.c} (61%)

-- 
2.39.1

