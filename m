Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346C0C27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 23:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD2C10EB5D;
	Fri, 21 Jun 2024 23:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MD8sjYCm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F2E10E114
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719010913; x=1750546913;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aR6tF1bD+kEdxk+AGU2RiCStS1BhLKMNohIY2/j/stk=;
 b=MD8sjYCmt+ObTPdF4v38JnRyWBTkbMxWmKNiChIBTdFu02KLLWiCbNb0
 dbuoG8ItNIdrni8MTatXUbTboNcC6YGcjd7cQW0jJHuwoBLdDK8WO9j5X
 H8ZovpGt2AqVHh56wtx4xy4kUFQkx4BQfZjTwasSOff8sgz+cKehQLV7U
 WZ+0SPIgnhbcZOAe8jyI3W+27BpxDjs1h+2zhCIQksb43CirCFnAtSQcC
 3+qM7M5NwcCN8gd3eaUtNG8fD9VZrkLId7tGJQOK+v7LoJkjXfhUMZG4F
 ft49RgsAl5ty+1eGew6kmLj9KMeRCIcfUSjBaddv62s5rpt6J7G1ulsHV w==;
X-CSE-ConnectionGUID: 4n3SoR9XQvOiUhyZcSkquA==
X-CSE-MsgGUID: GEeGLWQyRISn4jpWYWd9Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16204929"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="16204929"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:07 -0700
X-CSE-ConnectionGUID: KFg6pOF5R1ihb0kVTAKPTg==
X-CSE-MsgGUID: dDkc4gsaQaehkY59DN5gRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="42597319"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/8] tests/intel/xe_drm_fdinfo: Add helper to read
 utilization for all classes
Date: Sat, 22 Jun 2024 07:00:56 +0800
Message-Id: <20240621230102.238397-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
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

Add a helper that captures utilization for all classes.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index e624029b8..41409b2d2 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -39,6 +39,11 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 
 #define BO_SIZE (65536)
 
+struct pceu_cycles {
+	uint64_t cycles;
+	uint64_t total_cycles;
+};
+
 static const char *engine_map[] = {
 	"rcs",
 	"bcs",
@@ -46,6 +51,20 @@ static const char *engine_map[] = {
 	"vecs",
 	"ccs",
 };
+static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
+{
+	struct drm_client_fdinfo info = { };
+	int class;
+
+	igt_assert(pceu);
+	igt_assert(igt_parse_drm_fdinfo(xe, &info, engine_map,
+					ARRAY_SIZE(engine_map), NULL, 0));
+
+	xe_for_each_engine_class(class) {
+		pceu[class].cycles = info.cycles[class];
+		pceu[class].total_cycles = info.total_cycles[class];
+	}
+}
 /* Subtests */
 static void test_active(int fd, struct drm_xe_engine *engine)
 {
-- 
2.34.1

