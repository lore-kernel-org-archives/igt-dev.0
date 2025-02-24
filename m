Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF92C021BC
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 14:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4E510E3DE;
	Mon, 24 Feb 2025 14:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwrV8uUa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0260010E3C1
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740408450; x=1771944450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j7ICcjIXdpGRRb4V3MIML1q+1abwfY/RAIAWo2qXUEo=;
 b=GwrV8uUaWPj3B6jmhGva/x7rQEJ258Urmi/sWNdgGk3E9noMTleeBtGN
 FBewhC5I1zka0ScXTPMO1veqZTotJZLyQD5V2nmdlNLUPzpLS7OVNAuVI
 X5CeYBvK722oQLuFMqxhQ/EmLJn0ua/JTFe5ATzPwLQzSXMENjl+oOPBQ
 Syc00L1ErGd4ZUdOeUx24pS7qqQnpcBtWzrdutyTO2pEIr04Jxk7GRMbH
 lH13yaK6uGk/qny1/CN6C5LzlfBZhHyiq1ZhJkkqtJ7pmcUZwb4yLTj7w
 P6K82kl3Nn65TqbICOVV59wrrYn7f3dfQ/G+Gz2HK9oKpQAGg/aEtE5Mr g==;
X-CSE-ConnectionGUID: R3ffWf+MRSqPj4ALXvQ8KQ==
X-CSE-MsgGUID: 1bfIEOo0QXOWmvpbRzXGLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51793302"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51793302"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:47:29 -0800
X-CSE-ConnectionGUID: q5rEqv+vROuemaEeh1bxNg==
X-CSE-MsgGUID: +slcbixGQ6unC4daxLi+5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="120689973"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.122])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:47:28 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v2 6/6] lib/intel_compute: Allow the user to provide input and output
 buffers
Date: Mon, 24 Feb 2025 15:46:14 +0100
Message-ID: <20250224144705.1019940-7-francois.dugast@intel.com>
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

Allow the user to create and provide the buffers to be used as input
and as output of the compute kernel. This allows special handling as
well as read/write from outside the compute library. Support is
limited to xe2lpg.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 32 ++++++++++++++++++++++++--------
 lib/intel_compute.h |  2 ++
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 4818c0ff7..cb9561946 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1665,6 +1665,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
+	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
+	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1675,16 +1677,24 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
-	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
-	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
+	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr, SIZE_DATA);
+	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
 
-	input_data = (float *) bo_dict[4].data;
-	output_data = (float *) bo_dict[5].data;
-	srand(time(NULL));
+	if (user && user->input_addr) {
+		input_data = (float *) user->input_addr;
+	} else {
+		input_data = (float *) bo_dict[4].data;
+		srand(time(NULL));
 
-	for (int i = 0; i < SIZE_DATA; i++)
-		input_data[i] = rand() / (float)RAND_MAX;
+		for (int i = 0; i < SIZE_DATA; i++)
+			input_data[i] = rand() / (float)RAND_MAX;
+	}
+
+	if (user && user->output_addr)
+		output_data = (float *) user->output_addr;
+	else
+		output_data = (float *) bo_dict[5].data;
 
 	xe2lpg_compute_exec_compute(bo_dict[8].data,
 				  ADDR_GENERAL_STATE_BASE,
@@ -1802,6 +1812,12 @@ static bool __run_intel_compute_kernel(int fd,
 		return false;
 	}
 
+	if (user && (user->input_addr || user->output_addr) &&
+	    intel_compute_batches[batch].compute_exec != xe2lpg_compute_exec) {
+		igt_debug("GPU version 0x%x does not support user input/output buffers\n", ip_ver);
+		return false;
+	}
+
 	/* If the user provides a kernel, use it */
 	if (user && user->kernel) {
 		kernel = user->kernel;
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index dc0fe2ec2..edc17b894 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -55,6 +55,8 @@ struct user_execenv {
 	unsigned int kernel_size;
 	/** @skip_results_check: do not verify correctness of the results if true */
 	bool skip_results_check;
+	uint64_t input_addr;
+	uint64_t output_addr;
 };
 
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
-- 
2.43.0

