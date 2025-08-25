Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7533ECA0EFA
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 16:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6A310E4F0;
	Mon, 25 Aug 2025 16:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtG9AeeJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2C310E4F7
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756137605; x=1787673605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BKJfPGzaQjI7mbwjn6TZNqQH7htt5DuZeEjubGNCBoY=;
 b=JtG9AeeJrrhz88f9S6Hlq4XK3BDzC8XQrrUjk+dKUABawl3duZSY+oLf
 6SMgsmN1zWsc0OcGmlg4nWau/bmHL9QUBxN47BiYHLnR9nuNa1u9rIvUl
 04aYrnk8lm3DbqA8nanVKkxrApL+gHxqIn5/5omeZEFkHfE4J3JOCLNXE
 9Au9AhwuHiHGKFzQDF+264N8HdtEF9umQjz4MgkJaUOyKTebONcj1bRaK
 MOzFnXRJ+O67cNcXfGYqEhVC47YQj+PywwnwqmyMJBh6khFky+m6zoYos
 gtlXjjqOStqlDGMs9F4y2pIpsbZo5J1VBoUH8WeX4yIWJErT5xaA4njZx Q==;
X-CSE-ConnectionGUID: 5N2YNUvqSeikLt5oltb/kg==
X-CSE-MsgGUID: FFo5hgSfRu2SBWJjTY7/1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68948331"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="68948331"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:00:04 -0700
X-CSE-ConnectionGUID: uiYCPa/xTIeRJKstvXnywg==
X-CSE-MsgGUID: zK0A9gETRX+cf6L98hUi0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168578243"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:00:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t v2 2/4] tests/intel/xe_configfs: Unbind before testing
 engines_allowed
Date: Mon, 25 Aug 2025 08:59:44 -0700
Message-ID: <20250825-configfs-unbind-v2-2-62e7508d3ed7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
References: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Future kernel change will require the driver not to be bound yet in
order to allow this configfs setting because it has no effect
otherwise. Make sure we unbind before testing this.

Reference: https://patchwork.freedesktop.org/patch/669151/?series=151729&rev=4
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2:
- s/bind/bound/ where appropriate (Riana)
---
 tests/intel/xe_configfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 57f770b0b..bed92714f 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -73,6 +73,12 @@ static void test_engines_allowed_invalid(int configfs_device_fd)
 		"rcs0asdf",
 	};
 
+	/*
+	 * These only test if engine parsing is correct, so just make sure
+	 * there's no device bound
+	 */
+	igt_kmod_unbind("xe", bus_addr);
+
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
 		const char *v = values[i];
 
@@ -93,6 +99,12 @@ static void test_engines_allowed(int configfs_device_fd)
 		"rcs000",
 	};
 
+	/*
+	 * These only test if engine parsing is correct, so just make sure
+	 * there's no device bound
+	 */
+	igt_kmod_unbind("xe", bus_addr);
+
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
 		const char *v = values[i];
 

-- 
2.50.1

