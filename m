Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97B3C02194
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 10:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F2010E770;
	Wed,  5 Feb 2025 10:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axblBzFh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E6D10E1A2
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738750712; x=1770286712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XyZuoXtopKbMFluj4UkrC1RSqnV2glUVNzJMmbavRY8=;
 b=axblBzFhDS+PlozUxMmimI02gb9D70hbsm2Lof/NLvxNJsvxQ4pI1UlZ
 MP5FbmIviCXVWT+AiwMqyn28QOYFIsRokggsnA3VB6/d93y7IFl7KkXtv
 eZ4fIj49iCn2N9Zz3nmLqRCSlTNjX6m9vutSU6fWGywASu2znDOpW4jj/
 OnRlp8QKgqLYhMNRLK3bxWSfkEvEKrch8nmonFj6C7ur2cLEmGUbuePFs
 cTbjQ6toEjp/wsXRN4sUt3grR3kL1ilwWbuzPt9gRSWDaAkVGOq114ydp
 YkEx9619vvYXCvmTowyOjkv7h49Jqh3PtT6eEDRC5IJaktArQfz7k2Wfe Q==;
X-CSE-ConnectionGUID: k3djn5djTdeNJHTN5ueD6A==
X-CSE-MsgGUID: MfbdSt32TTG8zXs1grFr4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50700685"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="50700685"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:18:26 -0800
X-CSE-ConnectionGUID: 6n9OUTq+TqGpYVaBSV/uhw==
X-CSE-MsgGUID: 4jsYgrSoSNCUDe84aLMHIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111299209"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.221])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:18:25 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 4/5] lib/intel_compute: Give option to skip results check
Date: Wed,  5 Feb 2025 11:17:05 +0100
Message-ID: <20250205101748.1117809-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205101748.1117809-1-francois.dugast@intel.com>
References: <20250205101748.1117809-1-francois.dugast@intel.com>
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

This is useful when using a custom compute kernel which produces
different results than the default one (square) and when those
results should be ignored because they are not the purpose of the
test.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 15 ++++++++++-----
 lib/intel_compute.h |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index a826d58c0..db6e81c38 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -752,7 +752,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
 		if (output != expected_output)
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
-		igt_assert_eq(output, expected_output);
+		if (!user || (user && !user->skip_results_check))
+			igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, BO_DICT_ENTRIES);
@@ -1031,7 +1032,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		if (output != expected_output)
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
-		igt_assert_eq(output, expected_output);
+		if (!user || (user && !user->skip_results_check))
+			igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
@@ -1240,7 +1242,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 		if (output != expected_output)
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
-		igt_assert_eq(output, expected_output);
+		if (!user || (user && !user->skip_results_check))
+			igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
@@ -1606,7 +1609,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		if (output != expected_output)
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
-		igt_assert_eq(output, expected_output);
+		if (!user || (user && !user->skip_results_check))
+			igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
@@ -1698,7 +1702,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		if (output != expected_output)
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
-		igt_assert_eq(output, expected_output);
+		if (!user || (user && !user->skip_results_check))
+			igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 6096bb83a..f32da2734 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -37,6 +37,7 @@ struct user_execenv {
 	uint32_t vm;
 	const unsigned char *kernel;
 	unsigned int kernel_size;
+	bool skip_results_check;
 };
 
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
-- 
2.43.0

