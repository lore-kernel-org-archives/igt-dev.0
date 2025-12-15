Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7DDD5B873
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 22:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4EC10E289;
	Mon, 15 Dec 2025 22:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cX780rwC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EEF10E289
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 22:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765838216; x=1797374216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qf2gwBOsd26D9IMpafEtYje+W5GDUDISbNrDdLkk3cU=;
 b=cX780rwCQ+C0944me20x694+FmIMf2J4KcVoQJIryKOQt5bk588k4DtN
 lM8h0o3gYEfVarErOKeBnWYC9c/5Amhajx5AbNcc8cYEWo9xliF5G3+Qk
 +KQqrLz8SJ1pRwOxifG7hLOzUlQ71wyIpic1iYn541IPyiLY19JZ0vIhT
 0KL++nkA0BlEVNcnXld5NE8AH0/+6ZXltFZHLR5fX3X2A/BaAhuunuRjL
 wivwAI4jfLDLTJxcxpydBzbSzX4H0kBdios1n86RxKUEh8MxF70G9Kdf1
 N48Ja+fWFqboiFW7FFgjmf/vw1M2cAKDCdToPUDUuVbJgTOV3O377TwZO w==;
X-CSE-ConnectionGUID: /9vpxnljRCeEQN73BWS3Xg==
X-CSE-MsgGUID: HlgyCfIFRbKSu3P15CJEQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78389440"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="78389440"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:36:56 -0800
X-CSE-ConnectionGUID: vPPcnZ98QhypSl8ynw8D4g==
X-CSE-MsgGUID: plGn/JMqRKe3q1nKcjb7WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197740312"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:36:55 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 4/4] tests/prime_udl: Fix i915 device opening
Date: Mon, 15 Dec 2025 23:36:39 +0100
Message-ID: <20251215223639.117028-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
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

There are now Intel cards handled by Xe driver so make sure we
open one handled by i915.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/prime_udl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index 8dcbfa58c..fec5e2f02 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -49,6 +49,11 @@ static int find_and_open_devices(void)
 			intel_fd = open(path, O_RDWR);
 			if (intel_fd == -1)
 				return -1;
+
+			if (!is_i915_device(intel_fd)) {
+				close(intel_fd);
+				intel_fd = -1;
+			}
 		} else if (venid == 0x17e9 && udl_fd == -1) {
 			udl_fd = open(path, O_RDWR);
 			if (udl_fd == -1)
-- 
2.52.0

