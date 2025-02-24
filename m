Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6852C021BB
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 14:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655D610E3C1;
	Mon, 24 Feb 2025 14:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTbX9MJu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E4D10E3EA
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740408450; x=1771944450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AYVHqhPjjFmj2fP916FRyydp95HExSoW6zdWcaY7fog=;
 b=XTbX9MJudyel1gw84lubbEHeeqHLEfER6B/JDzixYMzuS5+QHyXKoaE9
 Gmz/7CTFqpZatBY3GjRePEd/62GSh9StKtb+0eX+HTTi2lum6Qoa9qeeQ
 cVa7R5UpFDKzssky5D7Onv5MJZrtYrV8nYXM6oLfhg08fh+dBlVenYLHW
 XcRJV8YfjNgVIUJPULeDbvwy5GBwEnrEr+N0pLbAnwJ+H1TSrhM1XdmjY
 XISCEV8qVPZzZtn5qYAD055gtL8vun9byIr8uUN8i3vYhffBpmWjIenrX
 jrsqUjkbPNhaUfykqorJjHwByKCq17Dx9vUU1xhylMSONHBJPR5Qus2dd w==;
X-CSE-ConnectionGUID: bJWi07r8SXK5ik65+TNJKw==
X-CSE-MsgGUID: rZEsEMWlSNuJ1fTw6WmS9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51793296"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51793296"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:47:28 -0800
X-CSE-ConnectionGUID: MQ8xF8pPRgyRucOYaRpfdg==
X-CSE-MsgGUID: sOgVF2bPSvS6QaJutBZioQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="120689966"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.122])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:47:26 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v2 5/6] lib/intel_compute: Give option to skip results check
Date: Mon, 24 Feb 2025 15:46:13 +0100
Message-ID: <20250224144705.1019940-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224144705.1019940-1-francois.dugast@intel.com>
References: <20250224144705.1019940-1-francois.dugast@intel.com>
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
 lib/intel_compute.h |  2 ++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 04fb83321..4818c0ff7 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -753,7 +753,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
 		if (output != expected_output)
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
-		igt_assert_eq(output, expected_output);
+		if (!user || (user && !user->skip_results_check))
+			igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, BO_DICT_ENTRIES);
@@ -1033,7 +1034,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		if (output != expected_output)
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
-		igt_assert_eq(output, expected_output);
+		if (!user || (user && !user->skip_results_check))
+			igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
@@ -1243,7 +1245,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 		if (output != expected_output)
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
-		igt_assert_eq(output, expected_output);
+		if (!user || (user && !user->skip_results_check))
+			igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
@@ -1609,7 +1612,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		if (output != expected_output)
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
-		igt_assert_eq(output, expected_output);
+		if (!user || (user && !user->skip_results_check))
+			igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
@@ -1701,7 +1705,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		if (output != expected_output)
 			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
 				  i, input, output, expected_output);
-		igt_assert_eq(output, expected_output);
+		if (!user || (user && !user->skip_results_check))
+			igt_assert_eq(output, expected_output);
 	}
 
 	bo_execenv_unbind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 3f6d0bb1d..dc0fe2ec2 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -53,6 +53,8 @@ struct user_execenv {
 	const unsigned char *kernel;
 	/** @kernel_size: size of the custom kernel, if provided */
 	unsigned int kernel_size;
+	/** @skip_results_check: do not verify correctness of the results if true */
+	bool skip_results_check;
 };
 
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
-- 
2.43.0

