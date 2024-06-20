Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3826AC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 09:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CCC10E2EA;
	Thu, 20 Jun 2024 09:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvVZIob5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C4D10E2EA
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 09:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718876913; x=1750412913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L5h1L5kRufIcRigiXoQq5TYj5ro61tg+OGY2rS7r46E=;
 b=LvVZIob5a0JuvNZ95tAchj69tAX0U7b58KxXZVYbFOqxATOGxSKOlcQl
 LNsNTw2hvaJYASTTT5n/Tc7bnX8vRyW8cJ2nN4LRGIC8XYRwfdW3hZzxv
 U6iLwIOp7e0ka842LojQjkd5R9NMCR0aILKpYrHn7Xfn6CuafxfvddMj3
 BodD4Zv78JXZuYQxQN9LoWrN37SpK+q6GS/Sw0hnAHBHBd7lXhMFtgDUr
 HRK8t/1xeusG0s9yJ42uubYddASQbzQVOxYmpPoltGxrTTErBH0b/MWGn
 dr4fx2WzdDW0gPfeDZYQBtiSjcj6XVOHpwRir86fnlg91SCXhuz0iE6hG A==;
X-CSE-ConnectionGUID: S9kqsGgkRmWQUNvuYz8wLA==
X-CSE-MsgGUID: LGQfj5ohQ02kL88vSXeYVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15973068"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15973068"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 02:48:33 -0700
X-CSE-ConnectionGUID: U+BRXOVBTn+omHG7oNqmIQ==
X-CSE-MsgGUID: slnRFTesSCGpxr3oDPDbXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42642579"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.55])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 02:48:31 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/2] lib/intel_device_info: Add blitter/render
 definition for BMG
Date: Thu, 20 Jun 2024 11:48:22 +0200
Message-Id: <20240620094822.524239-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620094822.524239-1-zbigniew.kempczynski@intel.com>
References: <20240620094822.524239-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Xe2 definition used for LNL works either for BMG so lets use it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_device_info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 9250abd444..298047e741 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -522,7 +522,8 @@ static const struct intel_device_info intel_battlemage_info = {
 	.has_4tile = true,
 	.has_flatccs = true,
 	.is_battlemage = true,
-	.codename = "battlemage"
+	.codename = "battlemage",
+	.cmds_info = &xe2_cmds_info,
 };
 
 static const struct pci_id_match intel_device_match[] = {
-- 
2.34.1

