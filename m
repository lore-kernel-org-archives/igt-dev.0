Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743F9C02196
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 10:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F198D10E1A2;
	Wed,  5 Feb 2025 10:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DT6IXY+B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E635210E0E0
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738750712; x=1770286712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hvCIKtVDtktKjSpAQNmTN5F5/+78szpUF8eNX90aY1M=;
 b=DT6IXY+B/aU7AMz3WOPvtMdGRqkEsaBmxtqZuGc8/X2E8EdRrYFyJ/wc
 x1JhUm/eZWO6eoPBWOWp3U+qrdgiJGzLYKknGJEYNts8cT11DGzZEUrsD
 ArQ3sITZ7Nl4ZJix6mzMvBTMfcSxMHS/ST6GgDnVTOgnmAGZF1hNSMPWS
 md5Yx2uPY16PUdn7kA+bOTTdUZsFwRc1PrnfDnwFf9OmyAEYGh8X3N0qB
 +6EQ3ReUkzqUkIve4ch0oS1k6WjdlTlEq9mc4dn2uMNQhQlMPE/GX6Qpj
 41DPJStrInh9Zo4xGIGfxIfSkfb+8OPSpKVg45e5t3Pd+3Kz6KXy6ZGNu g==;
X-CSE-ConnectionGUID: zIa56344RlaZ1NsM9nbZBQ==
X-CSE-MsgGUID: zXbPnND9SX2PNiWY70+Flw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50700689"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="50700689"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:18:28 -0800
X-CSE-ConnectionGUID: vI2vEslGQ/Kh7XNpRmHVDw==
X-CSE-MsgGUID: GExCMqkSTHulqXW940r9eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111299219"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.221])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:18:27 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 5/5] lib/intel_compute: Allow the user to provide input
 and output buffers
Date: Wed,  5 Feb 2025 11:17:06 +0100
Message-ID: <20250205101748.1117809-6-francois.dugast@intel.com>
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
index db6e81c38..6dc8ffd79 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1662,6 +1662,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
+	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
+	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1672,16 +1674,24 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 
 	memcpy(bo_dict[0].data, kernel, size);
 	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
-	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
-	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
+	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
+	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr);
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
@@ -1794,6 +1804,12 @@ static bool __run_intel_compute_kernel(int fd,
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
index f32da2734..3e2fd7266 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -38,6 +38,8 @@ struct user_execenv {
 	const unsigned char *kernel;
 	unsigned int kernel_size;
 	bool skip_results_check;
+	uint64_t input_addr;
+	uint64_t output_addr;
 };
 
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
-- 
2.43.0

