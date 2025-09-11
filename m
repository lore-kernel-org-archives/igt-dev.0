Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7A6CAC58E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 17:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E254610EB78;
	Thu, 11 Sep 2025 17:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8Nt1kax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ECF10EB78
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 17:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757613532; x=1789149532;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MjPjEw8jUjQSkV5VRHS6hXrjpzaXGvttv6fZreD0aKE=;
 b=k8Nt1kax0ZWrsh3osIhlqoY1cQt2qbAEeWUyG5Cesed4aRNCxn3a177v
 oYdDr//dG7Q6JE8zWEdzwLwdqziYvKCvxE7kiyhOtyYsJFMZWRdY1c+ZX
 AsB5+UEQVbp4+HKpG6wxtYxmHiqlb0dYFIlJ9rJHmzh8ZFajB5hp1RLAH
 Kzqicbpjs6fDAjNbIzFTMUiNCtx3dmRrE10LrIjN31pQhLzcOXRdx30F2
 QLng7v18qvgXozJY0i5EjevY+PzfOLsvzgQZykL56LfW+xVAql94W3YGq
 D76pv5pREzRPQzudLVwL9IgMpYMupwYSMhU84+SQ0JVQlagA1/Oru2v2m Q==;
X-CSE-ConnectionGUID: IfSyhVooTXWiI2iKjo9Jyw==
X-CSE-MsgGUID: xM1hyGT+SG6EWLfG2tqWOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60017173"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60017173"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:58:52 -0700
X-CSE-ConnectionGUID: GqvRbuvtTve4/Un50Pztjg==
X-CSE-MsgGUID: KWnl0DQfRlG1UIS1hrgeRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178941273"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 10:58:51 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] Revert "intel-ci: Reorder chamelium audio tests to fix
 init issue"
Date: Thu, 11 Sep 2025 23:28:41 +0530
Message-ID: <20250911175841.1298783-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

This reverts commit 939fac7f7b11a8902ebcf9a4bc9c26c14e87e8a6.

Reordering the tests is not a valid solution. A proper fix to handle
the initialization issue is being worked on separately.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/i915.chamelium-only.testlist | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
index 22e12108d..fa4e4e588 100644
--- a/tests/intel-ci/i915.chamelium-only.testlist
+++ b/tests/intel-ci/i915.chamelium-only.testlist
@@ -1,6 +1,8 @@
 igt@kms_feature_discovery@chamelium
 igt@kms_chamelium_audio@dp-audio
 igt@kms_chamelium_audio@dp-audio-edid
+igt@kms_chamelium_audio@hdmi-audio
+igt@kms_chamelium_audio@hdmi-audio-edid
 igt@kms_chamelium_color@ctm-0-25
 igt@kms_chamelium_color@ctm-0-50
 igt@kms_chamelium_color@ctm-0-75
@@ -56,8 +58,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
 igt@kms_chamelium_hpd@hdmi-hpd-storm
 igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
 igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
-igt@kms_chamelium_audio@hdmi-audio
-igt@kms_chamelium_audio@hdmi-audio-edid
 igt@kms_chamelium_hpd@vga-hpd
 igt@kms_chamelium_hpd@vga-hpd-after-suspend
 igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
-- 
2.43.0

