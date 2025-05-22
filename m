Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD47C54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 07:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F7010E13F;
	Thu, 22 May 2025 07:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TjXmksPQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC7910F245
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 07:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747900535; x=1779436535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+UPT1FpCd7yFqNjergtPufBcFfQNOb/mt8RoorawCW8=;
 b=TjXmksPQh41P7yRLVL9fp9A9rFgkl98St5xK8ibl1oCcY85/HoNdewyd
 tTCqOGAEyjULN0lLaXbTGaUHh2r1q9/3aYuXdXdB1PLTXnZk3xcTKRvYM
 tLk9S/zgyDiLlMMxWGorWVAJNLaGJ41G+46zn6C/L0W9DKOQY26qP64pc
 UphBIgdbJ307PODfGdsI7XRTJUHv4MXDaT1dJhqrGubZrBaQQUkDbbj7k
 WSx7J45oR0guHkL1/GMPz96cKzhicuTT52MCgpVLp/VPDzK6/4mYM+tQv
 j5M2Ga1xBsjiIPCygPPNO1zm9866RAvpqwzM6fK3jelZ6GPmBCEidZI9Q w==;
X-CSE-ConnectionGUID: eSMIJv/KSgi+iY5iZlSAnw==
X-CSE-MsgGUID: eSPGoA/lSyCDyIg6kKL5KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50051016"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="50051016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:55:35 -0700
X-CSE-ConnectionGUID: 9tOuDAnyROytsCLBVMBXKw==
X-CSE-MsgGUID: amhI1x3sRd+S3NsTssmHlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140888594"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:55:34 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v2 4/4] lib/intel_compute: refactor to remove code
 duplication
Date: Thu, 22 May 2025 09:55:15 +0200
Message-ID: <20250522075515.168920-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522075515.168920-1-zbigniew.kempczynski@intel.com>
References: <20250522075515.168920-1-zbigniew.kempczynski@intel.com>
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

Establishing input and output data looks same in all compute functions.
Create a functions to avoid code duplication.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 110 ++++++++++++++++----------------------------
 1 file changed, 40 insertions(+), 70 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index d47e2b08ef..06f831f68c 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -122,6 +122,36 @@ static void bo_check_square(float *input, float *output, int size)
 	}
 }
 
+static float *get_input_data(const struct bo_execenv *execenv,
+			     const struct user_execenv *user,
+			     void *data)
+{
+	float *input_data;
+
+	if (user && user->input_addr) {
+		input_data = from_user_pointer(user->input_addr);
+	} else {
+		input_data = (float *) data;
+		bo_randomize(input_data, execenv->array_size);
+	}
+
+	return input_data;
+}
+
+static float *get_output_data(const struct bo_execenv *execenv,
+			      const struct user_execenv *user,
+			      void *data)
+{
+	float *output_data;
+
+	if (user && user->output_addr)
+		output_data = from_user_pointer(user->output_addr);
+	else
+		output_data = (float *) data;
+
+	return output_data;
+}
+
 static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 			      struct drm_xe_engine_class_instance *eci,
 			      struct user_execenv *user)
@@ -809,20 +839,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
 			     IS_DG1(devid) ? 0x200 : 0x40, execenv.array_size);
 
-	if (user && user->input_addr) {
-		input_data = from_user_pointer(user->input_addr);
-	} else {
-		input_data = (float *) bo_dict[4].data;
-		srand(time(NULL));
-
-		for (int i = 0; i < execenv.array_size; i++)
-			input_data[i] = rand() / (float)RAND_MAX;
-	}
-
-	if (user && user->output_addr)
-		output_data = from_user_pointer(user->output_addr);
-	else
-		output_data = (float *) bo_dict[5].data;
+	input_data = get_input_data(&execenv, user, bo_dict[4].data);
+	output_data = get_output_data(&execenv, user, bo_dict[5].data);
 
 	if (IS_DG1(devid))
 		dg1_compute_exec_compute(bo_dict[6].data,
@@ -1109,20 +1127,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 				  execenv.array_size);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	if (user && user->input_addr) {
-		input_data = from_user_pointer(user->input_addr);
-	} else {
-		input_data = (float *) bo_dict[4].data;
-		srand(time(NULL));
-
-		for (int i = 0; i < execenv.array_size; i++)
-			input_data[i] = rand() / (float)RAND_MAX;
-	}
-
-	if (user && user->output_addr)
-		output_data = from_user_pointer(user->output_addr);
-	else
-		output_data = (float *) bo_dict[5].data;
+	input_data = get_input_data(&execenv, user, bo_dict[4].data);
+	output_data = get_output_data(&execenv, user, bo_dict[5].data);
 
 	xehp_compute_exec_compute(bo_dict[8].data,
 				  ADDR_GENERAL_STATE_BASE,
@@ -1334,20 +1340,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
 				   execenv.array_size);
 
-	if (user && user->input_addr) {
-		input_data = from_user_pointer(user->input_addr);
-	} else {
-		input_data = (float *) bo_dict[2].data;
-		srand(time(NULL));
-
-		for (int i = 0; i < execenv.array_size; i++)
-			input_data[i] = rand() / (float)RAND_MAX;
-	}
-
-	if (user && user->output_addr)
-		output_data = from_user_pointer(user->output_addr);
-	else
-		output_data = (float *) bo_dict[3].data;
+	input_data = get_input_data(&execenv, user, bo_dict[2].data);
+	output_data = get_output_data(&execenv, user, bo_dict[3].data);
 
 	xehpc_compute_exec_compute(bo_dict[5].data,
 				   ADDR_GENERAL_STATE_BASE,
@@ -1742,20 +1736,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 				   execenv.array_size);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	if (user && user->input_addr) {
-		input_data = from_user_pointer(user->input_addr);
-	} else {
-		input_data = (float *) bo_dict[4].data;
-		srand(time(NULL));
-
-		for (int i = 0; i < execenv.array_size; i++)
-			input_data[i] = rand() / (float)RAND_MAX;
-	}
-
-	if (user && user->output_addr)
-		output_data = from_user_pointer(user->output_addr);
-	else
-		output_data = (float *) bo_dict[5].data;
+	input_data = get_input_data(&execenv, user, bo_dict[4].data);
+	output_data = get_output_data(&execenv, user, bo_dict[5].data);
 
 	xelpg_compute_exec_compute(bo_dict[8].data,
 				   ADDR_GENERAL_STATE_BASE,
@@ -1849,20 +1831,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				   execenv.array_size);
 	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	if (user && user->input_addr) {
-		input_data = from_user_pointer(user->input_addr);
-	} else {
-		input_data = (float *) bo_dict[4].data;
-		srand(time(NULL));
-
-		for (int i = 0; i < execenv.array_size; i++)
-			input_data[i] = rand() / (float)RAND_MAX;
-	}
-
-	if (user && user->output_addr)
-		output_data = from_user_pointer(user->output_addr);
-	else
-		output_data = (float *) bo_dict[5].data;
+	input_data = get_input_data(&execenv, user, bo_dict[4].data);
+	output_data = get_output_data(&execenv, user, bo_dict[5].data);
 
 	xe2lpg_compute_exec_compute(bo_dict[8].data,
 				    ADDR_GENERAL_STATE_BASE,
-- 
2.43.0

