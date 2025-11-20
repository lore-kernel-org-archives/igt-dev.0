Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52124CF8840
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 10:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056CF10E73F;
	Thu, 20 Nov 2025 10:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYa07U2T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4B510E73E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763634515; x=1795170515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dxwxN9nG2lZ4Mi0HK7k7UFIejnQ3XFt0QMhX5tPfq+w=;
 b=HYa07U2TFG79xUSC50quotWz1CHy1zclnV3UHiD27uv9mG7HI6VjzO7J
 0GZ3A/trpmWOOFvwMikLBNoYnoDdpgqfyumCt5ZBw/jVnMXgRu3rvn/3U
 v7gArN8QQhjmskopVn79hgFC7GHURe+YxR0ODSEjnJ55oTdfeao8Por/w
 h42xC0PxspK4rDHBsKO75UMkUSGnF5gbDopcVeFcYFZr6mZJ6MCLpNTEx
 DL2Fuum4ntuplMtGvMdXwnasGSc0hEaGbEy8tHw8djQttSWzal+YaiDzg
 5mJSCOgub+g9yft2ndZWqNnz7Ybdw/FpcuU45UqHYUN17dZY+txEnolL+ g==;
X-CSE-ConnectionGUID: b2HDqMWCSEy7HVto4EtrKA==
X-CSE-MsgGUID: 9f6aX/P9RrS6m+QUASXNuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65736283"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65736283"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:28:35 -0800
X-CSE-ConnectionGUID: 4oq/t+xiSr+4Ng+s5m3KEA==
X-CSE-MsgGUID: sVOt0JVdStO9HOWSP55tIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="221966472"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:28:34 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/3] intel-ci: Add sharpness filter chamelium test
Date: Thu, 20 Nov 2025 16:05:30 +0530
Message-Id: <20251120103532.1055144-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251120103532.1055144-1-swati2.sharma@intel.com>
References: <20251120103532.1055144-1-swati2.sharma@intel.com>
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

Add the Chamelium-based test for validating the display engine
sharpness filter.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/i915.chamelium-only.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
index 22e12108d..99d2f2409 100644
--- a/tests/intel-ci/i915.chamelium-only.testlist
+++ b/tests/intel-ci/i915.chamelium-only.testlist
@@ -65,4 +65,5 @@ igt@kms_chamelium_hpd@vga-hpd-fast
 igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
 igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
 igt@kms_chamelium_hpd@vga-hpd-without-ddc
+igt@kms_chamelium_sharpness_filter@filter-basic
 igt@kms_tiled_display@basic-test-pattern-with-chamelium
-- 
2.25.1

