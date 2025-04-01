Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E33C36018
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 11:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E8F10E0ED;
	Tue,  1 Apr 2025 11:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIHN+EGv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBB010E0ED
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 11:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743508794; x=1775044794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+t2rSucOvaA5dKzuKjt1/qlvEtBKeBkQoP03FwhKC0s=;
 b=ZIHN+EGv9nFIx9ZlJBfuVD7TWXhRm7KpWDypnJ8HLfaRkC6AaHYvhj5I
 FYMxZ4n0Dm4sLvlja4iwCDPXFQcxI8CBLteJ7B5kUYK7SeS+ARXGENZ3w
 kV5Bgq6h45vqc1PHif9r3IVvLVU5w/JskHEaYVqwUJi2ECSTQwCjt/Fp5
 PDEuVJ/MegOQ9GrZb5zafZFs5GWV5OeZUsjZWSp0OuQ2iB+XRu5eRMpZV
 fh9lTtI9w7TtoPTFbusk13RNnbVPcWvIbTpYY3yYvQmBjdqSE/sTHT4xy
 s58w87TAMQANx1V0lnvpydy/5PuzT51wHHC98lp25uQ3z90qhI5dFaXo2 A==;
X-CSE-ConnectionGUID: dBJumAxtQ5exhTtbOr1DwQ==
X-CSE-MsgGUID: JxxJIhKjRiuaUoEt9Pgosw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44926925"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44926925"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 04:59:53 -0700
X-CSE-ConnectionGUID: l+k6Fuw1SiO5ZV9EFR4G2g==
X-CSE-MsgGUID: cpqASSJiTGy396qGJlueoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="163594524"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by orviesa001.jf.intel.com with ESMTP; 01 Apr 2025 04:59:52 -0700
From: replace_with Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com
Subject: [PATCH v3 i-g-t 0/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Date: Tue,  1 Apr 2025 11:45:28 +0000
Message-Id: <20250401114529.1828868-1-sobin.thomas@intel.com>
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

From: Sobin Thomas <sobin.thomas@intel.com>

This test validates that invalid string inputs are correctly rejected
by engine sysfs write. It ensures that the property values remain
unchanged when invalid inputs are provided.

Sobin Thomas (1):
  tests/intel/xe_sysfs_scheduler: Add invalid string test for engine
    sysfs properties

 tests/intel/xe_sysfs_scheduler.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
-- 
2.34.1

