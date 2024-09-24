Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9A6CF9C6B
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 07:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9CB10E59D;
	Tue, 24 Sep 2024 07:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YAnNgYWm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABEF10E59D
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 07:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727164177; x=1758700177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+nj3TkS3uF/EcakRqEBH2J2NJoZfPSPQkzZUWfylpxM=;
 b=YAnNgYWmHCowT9esF7KmWya7OlNu4Myw0B8N88YcndztwYXQuYtaLn5m
 jpMXqWhHE+wY6fz0wzDXImRKdRi8/HZdmJlmp0ijrYWlqykJiUozaP8qu
 BeaKmLvqTRxzQjn2BitpFcgRZiMEqYCMmkoVJiq3vF29o0pVhvo2navpm
 iOAwDr+QpDQbuxYWIAiEWnftSPpHU+RbL6v8NKdpb4Jlco9cUe1c3ARZD
 knzuwrbn0Sl68wvlEDbdKRzv4jHjFMReHGvdD43AxQWZ37mWdZQdqWGjD
 9IJzTOy1HaHcvsZOTErjf6VL2xXwOjk6XOgC8O9cbWjetH1FBr/QC+18v g==;
X-CSE-ConnectionGUID: ZGJRMwtZSaaOODzTwECymA==
X-CSE-MsgGUID: +wsIw5pPQSee9I/4r7/dsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43612483"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="43612483"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 00:49:37 -0700
X-CSE-ConnectionGUID: DkbvXlNGRHSeIxG08QxxbQ==
X-CSE-MsgGUID: NOQ58aGwR3K/ZstgOF2n4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="75433776"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 00:49:35 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_pm_residency: Add an assertion on
 MI_STORE execution time
Date: Tue, 24 Sep 2024 13:33:57 +0530
Message-Id: <20240924080357.1961472-1-karthik.poosa@intel.com>
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

MI_STORE_DWORD generally completes within couple of ms.
Assert if it takes more than 1.2 seconds, as it will cause
IGT test to timeout due to sleep of 120 seconds which is
the current per test timeout.

v2: Correct couple of typos in patch and commit message.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pm_residency.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 0e687558b..75cdeeeee 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -144,6 +144,15 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 			  1e-3 * submit,
 			  1e-3 * (elapsed - submit));
 
+		/*
+		 * MI_STORE_DWORD generally completes within couple of ms.
+		 * Assert if it takes more than 1.2 seconds, as it will cause
+		 * IGT test to timeout due to sleep of 120 seconds which is
+		 * the current per test timeout. Currently there is no way to
+		 * read this timeout from IGT test.
+		 */
+		igt_assert((uint64_t)elapsed < (uint64_t)(1.2 * NSEC_PER_SEC));
+
 		syncobj_reset(fd, &syncobj, 1);
 
 		/*
-- 
2.25.1

