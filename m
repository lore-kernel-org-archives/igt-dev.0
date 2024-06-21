Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2747AC27C78
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 23:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A535A10E18D;
	Fri, 21 Jun 2024 23:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRgbb+ki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886CE10E18D
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719010914; x=1750546914;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pe03rkn4VYJclHFt+FSSKRq+djydrhS2oF/HPU+dJIc=;
 b=gRgbb+kiPgrIfpjNRSl92djoZdq18MbeEdk7IxywVMxvzAx5kFJZYgMc
 sSF7hwZKHrPama18jKnT9mRv3ITZvH6drVbkXecpXexfXkGOgANEZ9yOA
 AqiSjGcewB9G40nmYQxCuw8wzpIO3gqtfSynWtUaNe+ZwVD4AA/+K/utm
 EsQF6PNnl5NOdXHHEUhHPpAbxaugqX7wV1Ylq0LeIxOF7Lglmyz5EjjNk
 S165MFJcYhR+h80eQ5v0qPgYWm8bgTig8V7BAIUKsHcZHboK0KRac4XNS
 wNHgXJ0So0TYcQpEbEoT77A6iIH8qiWy+wLWX7xaaOvpGNExFtH6EErYQ A==;
X-CSE-ConnectionGUID: 6hamthLjTvK+naVPft9FAA==
X-CSE-MsgGUID: GGQVmtPbRW2/24/VcBPWuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16204933"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="16204933"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:07 -0700
X-CSE-ConnectionGUID: gwfLZmNYTvO7vO6GHq3lhw==
X-CSE-MsgGUID: ir4ZqOpUQxeKk9TFWUeHwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="42597332"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 6/8] tests/intel/xe_drm_fdinfo: Add an iterator for
 virtual engines
Date: Sat, 22 Jun 2024 07:01:00 +0800
Message-Id: <20240621230102.238397-7-umesh.nerlige.ramappa@intel.com>
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

Add a helper iterator for virtual engines.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 8f8b4d599..2d25c2fbd 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -87,6 +87,34 @@ static const uint64_t batch_addr[] = {
 	0x1d0000,
 	0x1e0000,
 };
+
+#define MAX_GTS 2
+#define MAX_INSTANCE 9
+struct virtual_hwe {
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	int count;
+} vhwe[MAX_GTS][DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
+
+static void list_virtual_engines(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	xe_for_each_engine(fd, hwe) {
+		struct virtual_hwe *v;
+
+		igt_assert(hwe->gt_id < MAX_GTS);
+		igt_assert(hwe->engine_class < DRM_XE_ENGINE_CLASS_COMPUTE + 1);
+		v = &vhwe[hwe->gt_id][hwe->engine_class];
+
+		igt_assert(v->count < MAX_INSTANCE);
+		v->eci[v->count++] = *hwe;
+	}
+}
+#define xe_for_each_multi_engine(__fd, __hwe, __count) \
+	for (int igt_unique(gt) = 0; igt_unique(gt) < MAX_GTS; igt_unique(gt)++) \
+		for (int igt_unique(c) = 0; igt_unique(c) < DRM_XE_ENGINE_CLASS_COMPUTE + 1; igt_unique(c)++) \
+			for_if((__hwe = &vhwe[igt_unique(gt)][igt_unique(c)].eci[0]) && ((__count = vhwe[igt_unique(gt)][igt_unique(c)].count) > 1))
+
 static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
 {
 	struct drm_client_fdinfo info = { };
@@ -702,6 +730,7 @@ igt_main
 		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
 		igt_require(info.num_engines);
 
+		list_virtual_engines(xe);
 		xe_for_each_engine(xe, hwe) {
 			num_engines++;
 			igt_assert(hwe->engine_class < ARRAY_SIZE(classes));
-- 
2.34.1

