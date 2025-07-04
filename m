Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DADC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 08:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B55410E973;
	Fri,  4 Jul 2025 08:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NImC8WPn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445C810E973
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751616697; x=1783152697;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iyECBrKVzYtajarHcgoweMlryidQQbnEg6rxtQpbZb8=;
 b=NImC8WPni1wuaxDbdH0eRIdouLbMOibPk2QpM2Rj0yFIau5XKTNMccOi
 cbkdQGzdgaFxfk3Npg9NCUKHhylgGhIZFzN/bx1d2vjI+diWSKGFgYRTh
 4J1U12Wa1HoAF4sCGQKcynwRF9YisHpiTZBvM2OYJ+Yycn734idmcuS2D
 ksJUfS+l379tWyoKhNZzmeaEKopHZgnHZO7OwLitD/U95GfABbm/+i53W
 QtqQWKFpltKGgBMHEqp8K3MOhgVhDGamenwEdLQK0WmUD3gBihigVdiiz
 XnSINELnd84umj3ur3iISqZTxZKLpjiYudW0Fjzi3iPBtqNQew2OO13ug g==;
X-CSE-ConnectionGUID: 2iIfUwPvQH6rdWUfDEFztg==
X-CSE-MsgGUID: 3L8MqpW1Q3OwOtIL2T28cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57757680"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="57757680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:11:37 -0700
X-CSE-ConnectionGUID: O5pG/JGQSpCGgVhTLkHYww==
X-CSE-MsgGUID: 34HJng2bQF+LU43UwKM1Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="158858766"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.42])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:11:36 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] lib/intel_compute: reuse bo checking code
Date: Fri,  4 Jul 2025 10:11:32 +0200
Message-ID: <20250704081131.895088-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use previously added bo checker helper to reduce code size.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 65 +++++++--------------------------------------
 1 file changed, 10 insertions(+), 55 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 6126bdb3f7..147dd29163 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -882,17 +882,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-	for (int i = 0; i < execenv.array_size; i++) {
-		float input = input_data[i];
-		float output = output_data[i];
-		float expected_output = input * input;
-
-		if (output != expected_output)
-			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
-				  i, input, output, expected_output);
-		if (!user || (user && !user->skip_results_check))
-			igt_assert_eq_double(output, expected_output);
-	}
+	if (!user || (user && !user->skip_results_check))
+		bo_check_square(input_data, output_data, execenv.array_size);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -1170,17 +1161,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-	for (int i = 0; i < execenv.array_size; i++) {
-		float input = input_data[i];
-		float output = output_data[i];
-		float expected_output = input * input;
-
-		if (output != expected_output)
-			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
-				  i, input, output, expected_output);
-		if (!user || (user && !user->skip_results_check))
-			igt_assert_eq_double(output, expected_output);
-	}
+	if (!user || (user && !user->skip_results_check))
+		bo_check_square(input_data, output_data, execenv.array_size);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -1388,17 +1370,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-	for (int i = 0; i < execenv.array_size; i++) {
-		float input = input_data[i];
-		float output = output_data[i];
-		float expected_output = input * input;
-
-		if (output != expected_output)
-			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
-				  i, input, output, expected_output);
-		if (!user || (user && !user->skip_results_check))
-			igt_assert_eq_double(output, expected_output);
-	}
+	if (!user || (user && !user->skip_results_check))
+		bo_check_square(input_data, output_data, execenv.array_size);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -1789,17 +1762,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-	for (int i = 0; i < execenv.array_size; i++) {
-		float input = input_data[i];
-		float output = output_data[i];
-		float expected_output = input * input;
-
-		if (output != expected_output)
-			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
-				  i, input, output, expected_output);
-		if (!user || (user && !user->skip_results_check))
-			igt_assert_eq_double(output, expected_output);
-	}
+	if (!user || (user && !user->skip_results_check))
+		bo_check_square(input_data, output_data, execenv.array_size);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
@@ -1887,17 +1851,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 
 	bo_execenv_exec(&execenv, ADDR_BATCH);
 
-	for (int i = 0; i < execenv.array_size; i++) {
-		float input = input_data[i];
-		float output = output_data[i];
-		float expected_output = input * input;
-
-		if (output != expected_output)
-			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
-				  i, input, output, expected_output);
-		if (!user || (user && !user->skip_results_check))
-			igt_assert_eq_double(output, expected_output);
-	}
+	if (!user || (user && !user->skip_results_check))
+		bo_check_square(input_data, output_data, execenv.array_size);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
-- 
2.43.0

