Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADACE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 23:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C070B10E4B2;
	Thu, 19 Dec 2024 23:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjlG1kk0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73EC10E4B2
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 23:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734649535; x=1766185535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aYKCj6KFr7Lm70kV20Lr2OB6Mfm0oolGICtSeWS0sx0=;
 b=cjlG1kk00darHndLLyhvtbdhEmfbaNqZWHiivbz5tr3k3PGB+Lmd5XtM
 UhinI16Cc89cgwE9Z8l6aH6pSjVI7h4q9CekN1N5KqRizrYe14NQ7K0Ay
 LOQmAXe4pxRF24kKUjkPAqqeAxe8BXW/twzVW3rfWGu43sXdUcMGxJJHR
 qetZJxVq+Yzl6MYsL8M7+VX5YK6tq4LDq+7sKe+6pgfcU4/ROEBJ2FdaW
 f6dXZa+h/7dr+gTW9ndwBNXgEaswEU1vDWaV4htn9T7diQZ1qcUawVZ+k
 g6uGL4FWPRizXVOyavAD9/LkXlw2viSyBxmKl3IIMlt7TBzA+Vi3C8AO1 g==;
X-CSE-ConnectionGUID: ZHXBXsvvQCyCbO/ZeG3qlA==
X-CSE-MsgGUID: Ehc4cMHPTvS9Sk1D2zzcHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45874521"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="45874521"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:05:34 -0800
X-CSE-ConnectionGUID: Kehw5TpbQRG0ZNEUYMRNIw==
X-CSE-MsgGUID: ZY1yDLcqSKanZggkrchw2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="98141515"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:05:34 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 2/3] lib/igt_kmod: Make sure errno is not already set
 before unbinding
Date: Thu, 19 Dec 2024 15:05:16 -0800
Message-ID: <20241219230517.2492196-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
References: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
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

We assert that errno is zero after unbinding, so we need to make sure it
wasn't already non-zero beforehand or we might incorrectly fail.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
The non-zero starting errno hitting the assert is reproed when using
unbind in the 1915 reload-with-fault-injection test:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html

 lib/igt_kmod.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d73cb4101..a008b3c29 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -662,6 +662,8 @@ int igt_kmod_unbind(const char *mod_name)
 	int dirlen;
 	DIR *dir;
 
+	errno = 0;
+
 	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
 			  mod_name, mod_name);
 	igt_assert(dirlen < sizeof(path));
-- 
2.43.0

