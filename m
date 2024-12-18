Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2EFE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 08:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAEC10EAFF;
	Wed, 18 Dec 2024 08:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFMQcMxN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2DB10EAFD
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 08:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734511879; x=1766047879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AkhsAVmYgWuMqE3kPk0T/pQHpNrJiel5mECDf/6ylF8=;
 b=iFMQcMxNZBPdXstVDIrMYwDGXBIP8xOnBHNh/NH1imNY3QD8xmRabOG+
 cYYmGEYStu1RunrfPVPULXwlvM3U7ssc/E+jIrwMKgjbho9vWZsjXf4KX
 a9YXoNEpyG76H8XAicdtaB8EB8GHS9B00KPH4WYg8ErzpUOIvEMWcaJ5F
 sdmhmCe0ViwbmdzO+1LUFmraVdS6mz+RU2SLo8rIQ2OfzPf79QShzyK7w
 qCF+D/Csjhp1LA3kDYKG1pyPeKmNOCXs/xsVTi+ziDFpjmaD8J9C2Sg7x
 +g1qaMbZ5xPzOT9yuDIcppkbZBAHSSxz1g/QopjMEbkkZv+ByzWqjS93H w==;
X-CSE-ConnectionGUID: HzzIyZ3EQ9eKHtAgJahxmA==
X-CSE-MsgGUID: l0lMMRvrTguP24YchgImkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34867248"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="34867248"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:50:51 -0800
X-CSE-ConnectionGUID: TLxt5AYhT6afP2YOUqAJZg==
X-CSE-MsgGUID: ICTGelyTTZGN/CrB3YdjKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102890794"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:50:49 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t 0/2] Miscellaneous OA Refactors
Date: Wed, 18 Dec 2024 14:11:32 +0530
Message-Id: <20241218084134.2898703-1-sai.teja.pottumuttu@intel.com>
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

The patch series cleans up some unused arguments and also removes
hardcoded time heuristics.

Sai Teja Pottumuttu (2):
  tests/intel/xe_oa: Remove unused function arguments
  tests/intel/xe_oa: Remove hardcoded time heuristics

 tests/intel/xe_oa.c | 51 +++++++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 16 deletions(-)

-- 
2.34.1

