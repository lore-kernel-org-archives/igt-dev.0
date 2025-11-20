Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDF7CF857B
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 10:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945A410E73E;
	Thu, 20 Nov 2025 10:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KlPIqM8H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB8510E73E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763634514; x=1795170514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d/EkrV8STnYTGFHBqnMypx7XGpPg39f2wGcEHH0OWJA=;
 b=KlPIqM8Hl/j+tYTAPJ7EuU+gNJFfKxnXlRM8TXYqLcxcyMWslOZ3LBeF
 pm3DvIMqCDjfHDbTmJ3d35qHxdkIPkpPhQN6V+tSxcz/nMhPC/y6UTETA
 6l6AgUFVKNpiYioX2Upvhrn7nFLmbiBrxwUNyItiQW+X9jRbZyZx8FPkB
 MNOP83ml1xxp3jAXN7SC0uvxHY+busx2KOrTIkaHOpiz21zTaSvilhEHR
 okQs7Rs8vNoUXREn0gSQ6B1odJQYK4NXUoRzgyIS/7XQD41JMJn/BkrlN
 bclVRxa9CM2SEj+D1S7c1OCb5X6C0n5wAHaOUX5C2BEMrc/QF4vIGC/mQ g==;
X-CSE-ConnectionGUID: FQHW/fHiQw66UrAiZ3XzzA==
X-CSE-MsgGUID: 9lDD7d4CQA61Pbcb4MfFqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65736281"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65736281"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:28:33 -0800
X-CSE-ConnectionGUID: YvT2ipbuRHOvRZkgEFeduQ==
X-CSE-MsgGUID: hQCzHUZLRa6ovUUPkXYxSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="221966468"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:28:33 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/3] Update sharpness filter test and related CI changes
Date: Thu, 20 Nov 2025 16:05:29 +0530
Message-Id: <20251120103532.1055144-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Update sharpness filter test and apply necessary CI adjustments.

Swati Sharma (3):
  intel-ci: Add sharpness filter chamelium test
  intel-ci: Add sharpness filter tests to i915 blocklist
  tests/kms_sharpness_filter: Skip pipes without minimum scaler support

 tests/intel-ci/i915.blocklist.txt           | 2 ++
 tests/intel-ci/i915.chamelium-only.testlist | 1 +
 tests/kms_sharpness_filter.c                | 6 ++++++
 3 files changed, 9 insertions(+)

-- 
2.25.1

