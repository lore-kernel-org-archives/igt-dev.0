Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92637CA0EF5
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 20:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE0310E677;
	Tue, 19 Aug 2025 20:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msVsO1bU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544CF10E211
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 20:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755636069; x=1787172069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BCtQoeXXpJqQdzGfbIJpDw9pxbsT9PAAaLfVNo34848=;
 b=msVsO1bUfiFNWslXb+UEA7BULfs2Dbw4wQ5le18L4YEq3dinwbgWN0jf
 iqM5WxBdJLxUHriBA8TRmZ411+GUyzElhcJHCzkxkuiY8kxtOseO9hslU
 1wUObHQQ3uaF0PYEyMDmhscXFoibKtqYKJtBj5AWsZizG58ju0LRp9j0f
 lIPZnw5aSSPLlDA1cX/NXb2KJ+EYTjvJ+Azlap7HF1mjiZaDLlxoR6gng
 czCNWjyroEcItcbm8UUrCpS+EeT4zGDeW4sgyK0VeVjwn4uFCxoYD+2eY
 IgtcM2QobQS1W0UqgeVlCioEwHSDoVWeun6Oii1aBnm7f5gj4TowdqV7y g==;
X-CSE-ConnectionGUID: EDyZzcUnR6CMP0VuFfQcbw==
X-CSE-MsgGUID: pW5h+zevQpi9XaIUJqqVbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57846804"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57846804"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 13:41:08 -0700
X-CSE-ConnectionGUID: iz+YjFhdS4OIaYxG64hEnA==
X-CSE-MsgGUID: O43kvLApTJC3W9Mqgl5YCw==
X-ExtLoop1: 1
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 13:41:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/xe_configfs: Unbind before testing
 engines_allowed
Date: Tue, 19 Aug 2025 13:40:41 -0700
Message-ID: <20250819-configfs-unbind-v1-2-8359e66e3241@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
References: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
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
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index f01b13e13..1510f25f0 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -73,6 +73,12 @@ static void test_engines_allowed_invalid(int configfs_device_fd)
 		"rcs0asdf",
 	};
 
+	/*
+	 * These only test if engine parsing is correct, so just make sure
+	 * there's no device bind
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
+	 * there's no device bind
+	 */
+	igt_kmod_unbind("xe", bus_addr);
+
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
 		const char *v = values[i];
 

-- 
2.50.1

