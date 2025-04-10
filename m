Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B336C369A4
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 09:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F29110E86E;
	Thu, 10 Apr 2025 09:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUi3lAsg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB2210E86E
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 09:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744277629; x=1775813629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ehwfVBtalLYdiQVjHqvgi6Bewsrx8QzJyDilrwkJcfE=;
 b=LUi3lAsghzEE5Ub1YRGZAv4iSEXJD4jycmNGtewf3buSFm8rCnGUpEAU
 0y5zRXrm/R9jFpPjld4gAS+fRq9m/DYlMvn9TUdbhSrQi3kIBySfB6jYd
 4PMupE9iK1iFt9JOxhXfgcdRdzNG1b6IalXIu/UDxNEtsDxrKCm+z3fnB
 6Cu5HqszMCt6/MbPyZctcTuiIVapS+KDus5JN4P9Mfo2MuHTH27hfm0Q2
 fzq8pn0rOF9rtqeShfFRZ4ekClcoukwvvoS/ar6tpXH++yaNwKr2gSKRH
 z+qGZs3bNauOzjjeNOauIGrarqFHGV43dNHpBaouh07Bs8VZ01VPzHElp g==;
X-CSE-ConnectionGUID: Kac9IWCzTQiUVB6ilNB/kQ==
X-CSE-MsgGUID: RyQaJMjrT1WHzjMgrvbHrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49626014"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="49626014"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 02:33:08 -0700
X-CSE-ConnectionGUID: BHoRGW/2TMmKVnFT01JbqA==
X-CSE-MsgGUID: 7eBi4fD6TU61nNpuq/JoHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133571299"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 02:33:06 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
	kamil.konieczny@intel.com
Subject: [PATCH v6 i-g-t 0/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Date: Thu, 10 Apr 2025 09:17:14 +0000
Message-Id: <20250410091715.2611957-1-sobin.thomas@intel.com>
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

This test validates that invalid string inputs are correctly rejected
by engine sysfs write. It ensures that the property values remain
unchanged when invalid inputs are provided.

Sobin Thomas (1):
  tests/intel/xe_sysfs_scheduler: Add invalid string test for engine
    sysfs properties

 tests/intel/xe_sysfs_scheduler.c | 99 ++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
-- 
2.34.1

