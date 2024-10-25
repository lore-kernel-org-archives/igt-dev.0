Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB498D149E7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 18:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BED710EB74;
	Fri, 25 Oct 2024 18:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhL3iNNL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E2710EB76
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729882336; x=1761418336;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IpQB2v2YabTnolarA5bTJNuFz3Gv9JK3y+tzGmXAkoQ=;
 b=jhL3iNNLfsVWxHgpRvMvGa8ZXZtsCDzcXpeVnFBUZEIfXHaFtbmaxblj
 /eZQphBD4fIgJkuUDExRS9h4CUVGNw2Pypp4P0P1GfplDt9cmLKe1jHw6
 K61K8ICGQqw1dKhuXSd53tyHJNQ6HLrUus2NXCBfP1fGthKfoSZaySl5M
 sI0+fwXw3x/gUtNZpfwWsklQBJ/8XuxVOB0Ijwa51Rt5uDCJ7ngCpYv8f
 6lG99VdWPF2Z4rt+1CHXuOXHeA+pyDSkl+fvV8r8/t8egUxtR14GKB39O
 /ybp/S9tV7lyJ5PDiv9MlHrVdI5fkGgzdm16gLv6GDg2sSefaXGSyTfTC w==;
X-CSE-ConnectionGUID: QORkXX3CQ1aYjSevxti8IQ==
X-CSE-MsgGUID: uk1g5BbDTQSt7pTRY4LRXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29736720"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29736720"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 11:52:16 -0700
X-CSE-ConnectionGUID: xIi+pQWVSbyZAYd5b+lnQA==
X-CSE-MsgGUID: vs3cBU7YQuCGbMyecqfX1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81143010"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 11:52:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/oa: Tests for OA syncs
Date: Fri, 25 Oct 2024 11:52:03 -0700
Message-ID: <20241025185205.1327235-1-ashutosh.dixit@intel.com>
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
  drm-uapi/xe: Sync with OA syncs uapi update
  tests/intel/xe_oa: Tests for OA syncs

 include/drm-uapi/xe_drm.h |  29 ++++-
 lib/xe/xe_oa.c            |   6 +-
 lib/xe/xe_oa.h            |   2 +
 tests/intel/xe_oa.c       | 261 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 290 insertions(+), 8 deletions(-)

-- 
2.41.0

