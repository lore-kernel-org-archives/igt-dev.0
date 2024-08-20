Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5562C52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 00:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7134710E320;
	Tue, 20 Aug 2024 00:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGURPZdv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669AB10E040
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 00:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724113868; x=1755649868;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xBKX13k4BO7fBllUBH+G9P+jRPfPC1+kHiPtpHLUE2g=;
 b=ZGURPZdvvysKdj4g2lboR2xFyPZ3yKXr/lfQlfcyQ895vyEV+mf/AmDa
 IGIeiKqUQGNQnaPTMI0MIUrRk9MiJ5Ml/K+si3Dh3xGpCYb1og8DIlwdp
 DVLn0c74LWD8v9x8BxKHPOFrVTBenO4/omRqpJb79WWTXhD4wTBJfzzdH
 CZqHUbF7CQSonpwtIbWnujoWn0+BSbSc8eDAIhGWkHpOwQ+EJaDZ9kg/g
 9p3fQ0zrTdYszXVQa0QmIDvCs3ehirWvVKKhE9u2L6+Di6cUgcYpY+WKp
 3qQPQSbe3xHeHccBACVzylMDE1JNZtzA3645/6j472jf9NP4A9pxNTNpH g==;
X-CSE-ConnectionGUID: daGPK9RDQXC188AW5Bgj1A==
X-CSE-MsgGUID: zUCpEmImT9e27Kpenw4uMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33544868"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="33544868"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:31:07 -0700
X-CSE-ConnectionGUID: 6ZTO+lmISoCVVN3PmGFXUg==
X-CSE-MsgGUID: z48jPWrVSlqbTnhemRnruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="61101265"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:31:07 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 0/2] tests/intel/oa: Tests for OA syncs
Date: Mon, 19 Aug 2024 17:31:02 -0700
Message-ID: <20240820003104.1407398-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Ashutosh Dixit (2):
  tests/intel/oa: Add syncs-signal test for OA syncs
  tests/intel/oa: Add syncs-ufence test for OA syncs

 include/drm-uapi/xe_drm.h |  18 ++++
 lib/xe/xe_oa.c            |   6 +-
 lib/xe/xe_oa.h            |   2 +
 tests/intel/xe_oa.c       | 209 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 232 insertions(+), 3 deletions(-)

-- 
2.41.0

