Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29E9E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 18:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF0A10E00A;
	Tue, 17 Dec 2024 18:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdnOpKHy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A4C10E00A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734460756; x=1765996756;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=scM48U4XcShNxEXk1nBAw2qkYn/2thi1lgBBzLJeLYo=;
 b=bdnOpKHyVf8W4KMjbVcxEUT5cIc5UJAC7bOcrZhPm1pUPJkAOfI27+OM
 XJTriKv4E4vfBF85hKh0kQYylDJ5AvOvtylIDTIOFUOFh4hNJce4zU+qN
 5Gud0RG9ymapxUPFtkcHIAT/w5QBZtQ/ouiLVMsW2X2F9KfyWXlmBT7ru
 eTsoI4t/pcW6yJf1OifQn4GX0fm+GbSrWW8k8OZwVLNmzH3MHlMldPOfF
 BR1FBdy2c4d/2qa4e79plmvp7bCrWaTGIVL6AgsjOe1Ub9QYAkaob2itJ
 wFatzzOwy2DlO/md+e/PAe1jsXkpxelq6kmjbgvFSjxOwsjNrKLlVQ90t g==;
X-CSE-ConnectionGUID: e6Hn8JCEQjuFZ6GSGzfkhA==
X-CSE-MsgGUID: JKf8S5ORSKe83eAGh61cMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46295575"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="46295575"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 10:39:16 -0800
X-CSE-ConnectionGUID: r1rjaAm3TRq0EQs9kid5+w==
X-CSE-MsgGUID: xsqT1OWkTf+8yZ9Ps5WvDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="97843130"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 10:39:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@linux.intel.com
Subject: [PATCH] lib/core: Let ftrace know when the test started
Date: Tue, 17 Dec 2024 10:39:10 -0800
Message-Id: <20241217183910.1855657-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
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

It's useful to know the start and end of the test in ftrace to be able
to debug some issues. Not sure where to add igt_trace for end, so
posting this patch to get some comments.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/igt_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 407f7b551..6916d6ea4 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -574,6 +574,9 @@ static void _subtest_starting_message(enum _subtest_type subtest_type,
 	igt_info("Starting %s: %s\n",
 		 subtest_type == _SUBTEST_TYPE_NORMAL ? "subtest" : "dynamic subtest",
 		 name);
+	igt_trace("Starting %s: %s\n",
+		  subtest_type == _SUBTEST_TYPE_NORMAL ? "subtest" : "dynamic subtest",
+		  name);
 	fflush(stdout);
 	if (stderr_needs_sentinel)
 		fprintf(stderr, "Starting %s: %s\n",
-- 
2.38.1

