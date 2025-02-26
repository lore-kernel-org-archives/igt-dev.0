Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2333EC021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 11:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DFD10E255;
	Wed, 26 Feb 2025 11:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPM1AOtA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8092410E255
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 11:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740569192; x=1772105192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UqxkoT06MSUzHAarePHXXO8AkNr1zFV1c91IcHdFrhw=;
 b=TPM1AOtAe/l1xsJF7APMRId1fjeDvrVt0QoyK7YE48+tcMXVwjYICKOw
 GQoZyzkWv5VsrtE/N00Jk6xefUtsyfSUhm0uihkdXdrDryuoCXhl6PlCo
 DuUpAIeag1nzlAk8RLSNxMv0C8tU7nqQTYDF/5HrkgrbwuyfzsOiRypWj
 Vu2kFXpbV8853e3UTS8yP9Rhyi6r/0mZwbCj8AwMgzDEBbBHXT6Vvn2Lw
 cEPNvvVGT8+zv+6+VcKLj5o4H6FPED5VAiSnAmrqqvNIzeWYjI5KtMdoZ
 AlT18TEmR4+lhkOt9kMLNG+Oq40cGj7v3aSZkbl1ZpyQRjeTvEoHqzj3V Q==;
X-CSE-ConnectionGUID: nsLcroXkRgG7zRBxdJse1g==
X-CSE-MsgGUID: yaLAyD3xT8OUYGR/ygMBPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="66781257"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="66781257"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:26:32 -0800
X-CSE-ConnectionGUID: NWrXhgFtR2idCDKCc9rQsA==
X-CSE-MsgGUID: ozoewKZOSii88w3C6r4Wog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117166612"
Received: from slindbla-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.75])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:26:28 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v3 5/6] lib/intel_compute: Give option to skip results check
Date: Wed, 26 Feb 2025 12:24:06 +0100
Message-ID: <20250226112532.1332367-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226112532.1332367-1-francois.dugast@intel.com>
References: <20250226112532.1332367-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

