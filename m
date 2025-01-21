Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EE7C0218C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 12:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4513E10E56B;
	Tue, 21 Jan 2025 12:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8FjYqrV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB76F10E56B
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737460821; x=1768996821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=taJiNKNyDRK01EwEvch0S5p+ojFt+7j6lVwISyBFJwg=;
 b=B8FjYqrVwKAO5uUafwpGFojbT19u6wOIWqvZObnZiqKK8cWpGiLUNo5q
 xvJQGy6Can5wrbPDk111RyuAdg8R1wv3jrixmxbAsyckbJzsxFMgJiI0n
 csHos3b+lpwWvAQqW2mSBVzzAs3QODzlWxQSOMb4eWZNs8sWJQZBhUeB1
 +pnkok07drKM5R8zSO83ExtccKo2tVdDTSWJKgEE1QOA3gb82N3lwOfH6
 IJ10Mk68BbuWc6T678XAzYB/gteVj3kB4YPGFRZOORldfbFfvuaGSkqjr
 qy171TG/JHesDxkcrqp8/MDmqYs+bCzRxCP4BJqaP9byKIR9aLPqb/p7i w==;
X-CSE-ConnectionGUID: /NrMrYJ1RTOQKDFgwNZmng==
X-CSE-MsgGUID: hSu6dCdPSGejCLQ2Rv5eBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55279524"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="55279524"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 04:00:20 -0800
X-CSE-ConnectionGUID: QwJC3ElFQN6N1m4dw7oKFg==
X-CSE-MsgGUID: 71vkmYZTRMSZMlo96KvQ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111404260"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 04:00:18 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t v3 0/1] Add test for configurable OA buffer size
Date: Tue, 21 Jan 2025 17:29:34 +0530
Message-Id: <20250121115935.1654625-1-sai.teja.pottumuttu@intel.com>
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

The patch series extends an existing test non-zero-reason to use/test
configurable OA buffer size capability.

Sai Teja Pottumuttu (1):
  tests/intel/xe_oa: Extend non-zero-reason test

 tests/intel/xe_oa.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.34.1

