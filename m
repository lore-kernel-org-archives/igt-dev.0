Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDB3C54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 10:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EFB10E42D;
	Tue, 27 May 2025 10:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKlC2Ioy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6820F10E401
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748340641; x=1779876641;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vPQlti9ZkGUbeVZSlL+YYLtyNV+xGBJfXiQUpYtQQis=;
 b=gKlC2IoyqUgouN/EPojJdFkKVoYB/D8iqTkuDH8ENFRCwyRc9DOR2zic
 1XZtL1Vzy3krdYBthhxInglpDr5eSYcieP4+TAqVCMBZXvKkqDhpGifcd
 JoXCDlvEeP7vH7vjRzJMkBNTyN0zPLpSDbE8OHvDLsJyOactqRkskODWs
 5hv87VNVN20hpVt0ySeR3UfAPckIgFL9wZuirRWq2GV7G0pIrfUJOTJ/8
 RhumBBds7lv+QH7qmQNJweQezUzkJzSpEnML7TuFmA9dLfECGbatFX7/T
 VVkzMqf8iTwOxh0tWaRjHfEVRLGLkb3nl61PbWkO9uIPkz5a0LPaGgPcg g==;
X-CSE-ConnectionGUID: Adqvtl9KTMqO7HkE77r7JQ==
X-CSE-MsgGUID: 1kwQR7OxR0+KlqbijssZXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67741847"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="67741847"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 03:10:40 -0700
X-CSE-ConnectionGUID: zaQpLbF7TRm0By3jZ8RXbA==
X-CSE-MsgGUID: VZAn/zEdQBucETFpULrAQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="142667502"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 03:10:37 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t 0/3] Add render-node,
 gt reset and suspend engine activity tests
Date: Tue, 27 May 2025 16:04:30 +0530
Message-ID: <20250527103433.910475-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add tests to validate engine activity on render node, after gt reset
and suspend.

Also add a test to validate engine activity by opening PMU fd after
starting the cork

Tests added:

1) engine-activity-gt-reset
2) engine-activity-suspend
3) engine-activity-after-load-start
4) engine-activity-render-node-idle
5) engine-activity-render-node-load
6) engine-activity-render-node-load-idle

Riana Tauro (3):
  tests/intel/xe_pmu: Validate engine activity on gt reset and suspend
  tests/intel/xe_pmu: Add tests to validate engine activity on render
    node
  tests/intel/xe_pmu: Add a test to validate engine activity after
    starting load

 tests/intel/xe_pmu.c | 101 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

-- 
2.47.1

