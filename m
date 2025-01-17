Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496ABC02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 23:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838FF10EB87;
	Fri, 17 Jan 2025 23:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xi3GAOIB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA9810E327
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 23:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737155890; x=1768691890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iHqN32t5SNW+mLBpxZCqXNHKZPtz9llS+Vrwr7WuzTQ=;
 b=Xi3GAOIBFWfgugmebhs8cUFkRwQvfsT0dA9ZvVpZZSg+iAQ0av8ehwyU
 quqoLlJawvyZmL83UU56z9tCm1t4KYTQotiKzh/h0/hNX4wk3ymElGRmR
 q0IgpU9ktFoh4XfgLKHvmAlNmV4uIpT4KoKEF8PCpqRgE1CrWYwTUlgnf
 8eBQuqxJbj/NNgaO/5jdUFyIlJvn9EGL0dYAlIjop6D9UzdqC1lKd3O66
 VOEOxBm36Dltp6EmWHaGRe3G7DuJhoPV9RX+TOSu9TdmsRqQG+NfdP08l
 1yusKyeXKqLxM3qx9ifSDrcKFnWvQ4vSTy7rnYLSIVfKBiPCtYf/vgR6x g==;
X-CSE-ConnectionGUID: ZDtgyNJMTnOaJXhekRFykA==
X-CSE-MsgGUID: jMizvqJ4T0u4VMVq3T8/xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37627816"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="37627816"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
X-CSE-ConnectionGUID: yb4Ok4QKSaSYziL+Ndtvag==
X-CSE-MsgGUID: jscKY3pxRiKKhKC1OWeoow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106819369"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 5/5] runner/resultgen: Add cmdline to results.json
Date: Fri, 17 Jan 2025 15:17:46 -0800
Message-ID: <20250117231751.429703-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250117231751.429703-1-lucas.demarchi@intel.com>
References: <20250117231751.429703-1-lucas.demarchi@intel.com>
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

For easier repro scenarios, add the cmdline to the json: one can see the
exact command executed to try to reproduce a CI failure without needing
extra files.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/resultgen.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 87847bf5b..0d3a569cf 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -2281,7 +2281,7 @@ struct json_object *generate_results_json(int dirfd)
 {
 	struct settings settings;
 	struct job_list job_list;
-	struct json_object *obj, *elapsed;
+	struct json_object *obj, *elapsed, *arr;
 	struct results results;
 	int testdirfd, fd;
 	size_t i;
@@ -2319,6 +2319,11 @@ struct json_object *generate_results_json(int dirfd)
 		close(fd);
 	}
 
+	arr = json_object_new_array();
+	for (i = 0; i < settings.cmdline.argc; i++)
+		json_object_array_add(arr, json_object_new_string(settings.cmdline.argv[i]));
+	json_object_object_add(obj, "cmdline", arr);
+
 	elapsed = json_object_new_object();
 	json_object_object_add(elapsed, "__type__", json_object_new_string("TimeAttribute"));
 	if ((fd = openat(dirfd, "starttime.txt", O_RDONLY)) >= 0) {
-- 
2.48.0

