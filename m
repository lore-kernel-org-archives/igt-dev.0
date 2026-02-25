Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B80FD45E4
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 19:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74F110E81C;
	Wed, 25 Feb 2026 19:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TH4vSeQH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E7810E81C
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 19:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772048676; x=1803584676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PwhwyOTHQWyjc/dqzAbwe+oENrrLmu2GQY3kUFQ9lUs=;
 b=TH4vSeQHG3G/rPFCXHwuNPvfvRK8hZHj/PSsnTzxBKzKTbXg3XIYrQvJ
 XNgNigmsJyKINM4FRtrrvywA+1UzGzh4bHxEH4k8bp2xOyfENOKTHJ7ep
 ZlizudH5Ijpbvmfrsd5Uw9wULEtFCMoy7Pb0QHogwS3AjRxi3mFU4E5GC
 53zFrKGAAmvtlvX8SlR5e6IBjfSAEgyMxRMEllV3uL0Uek7/IPqYluejI
 UftXVHnx4Ai1M2sN93erJtkTbsSAL/sZmn3AhR62KPbNckEjjTXD9mwtq
 OzUPKEYwWnMBk1qFlEuO2s1u7gr26PZkqigeJqleejKt3FCHHuOAHEMOO g==;
X-CSE-ConnectionGUID: SCqvi6zHQEie0QPVzaBpGA==
X-CSE-MsgGUID: xs5r/18sTsOlvrDLwvHwSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73277511"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73277511"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 11:44:34 -0800
X-CSE-ConnectionGUID: ZVx9nF81Rk6jAkBUHVZBmw==
X-CSE-MsgGUID: FEtdNRsVRRiIm6XLPK0/cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="215443741"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.6])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 11:44:33 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 2/4] lib/intel_compute: Extend userenv by adding input
 and output bos
Date: Wed, 25 Feb 2026 20:44:24 +0100
Message-ID: <20260225194421.2544088-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225194421.2544088-6-zbigniew.kempczynski@intel.com>
References: <20260225194421.2544088-6-zbigniew.kempczynski@intel.com>
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

Input and output addresses if were passed by userenv were related to
SVM addresses so buffers were created in the library and only bound
to offsets user wanted.

Extend this allowing user to pass addresses as well buffer objects
what allows user to set its own input and output data.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 41 +++++++++++++++++++++++++++++++++++------
 lib/intel_compute.h |  4 ++++
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index ddcb76d1a4..9428158c4e 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -169,14 +169,17 @@ static float *get_input_data(const struct bo_execenv *execenv,
 	const struct user_execenv *user = execenv->user;
 	float *input_data;
 
-	if (user && user->input_addr) {
+	if (user && user->input_addr && !user->input_bo) {
 		input_data = from_user_pointer(user->input_addr);
 	} else {
 		struct bo_dict_entry *entry;
 
 		entry = bo_dict_find_by_type(bo_dict, entries, BO_TYPE_INPUT);
 		input_data = (float *) entry->data;
-		bo_randomize(input_data, execenv->loop_count);
+
+		/* Don't randomize on user passed bo */
+		if (user && !user->input_bo)
+			bo_randomize(input_data, execenv->loop_count);
 	}
 
 	return input_data;
@@ -189,7 +192,7 @@ static float *get_output_data(const struct bo_execenv *execenv,
 	const struct user_execenv *user = execenv->user;
 	float *output_data;
 
-	if (user && user->output_addr)
+	if (user && user->output_addr && !user->output_bo)
 		output_data = from_user_pointer(user->output_addr);
 	else {
 		struct bo_dict_entry *entry;
@@ -295,6 +298,7 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 
 		for (int i = 0; i < entries; i++) {
 			uint32_t placement, flags = 0;
+			bool clear_buffer = true;
 
 			bo_sync->sync = 0;
 
@@ -312,14 +316,34 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 				break;
 			}
 
-			bo_dict[i].handle = xe_bo_create(fd, execenv->vm, bo_dict[i].size,
-							 placement, flags);
+			/*
+			 * For input/output buffers skip their creation if
+			 * were passed from the user
+			 */
+			if (execenv->user && execenv->user->input_bo &&
+			    bo_dict[i].bo_type == BO_TYPE_INPUT) {
+				bo_dict[i].handle = execenv->user->input_bo;
+				bo_dict[i].addr = execenv->user->input_addr;
+				bo_dict[i].size = execenv->array_size * sizeof(float);
+				clear_buffer = false;
+			} else if (execenv->user && execenv->user->output_bo &&
+				   bo_dict[i].bo_type == BO_TYPE_OUTPUT) {
+				bo_dict[i].handle = execenv->user->output_bo;
+				bo_dict[i].addr = execenv->user->output_addr;
+				bo_dict[i].size = execenv->array_size * sizeof(float);
+				clear_buffer = false;
+			} else {
+				bo_dict[i].handle = xe_bo_create(fd, execenv->vm, bo_dict[i].size,
+								 placement, flags);
+			}
 			bo_dict[i].data = xe_bo_map(fd, bo_dict[i].handle, bo_dict[i].size);
 			xe_vm_bind_async(fd, vm, 0, bo_dict[i].handle, 0, bo_dict[i].addr,
 					 bo_dict[i].size, &sync, 1);
 			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
 				       INT64_MAX);
-			memset(bo_dict[i].data, 0, bo_dict[i].size);
+
+			if (clear_buffer)
+				memset(bo_dict[i].data, 0, bo_dict[i].size);
 
 			igt_debug("[i: %2d name: %20s] data: %p, addr: %16llx, size: %llx\n",
 				  i, bo_dict[i].name, bo_dict[i].data,
@@ -389,6 +413,11 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
 			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
 				       INT64_MAX);
 			munmap(bo_dict[i].data, bo_dict[i].size);
+			/* Keep user buffers intact */
+			if (execenv->user)
+				if ((execenv->user->input_bo && bo_dict[i].bo_type == BO_TYPE_INPUT) ||
+				    (execenv->user->output_bo && bo_dict[i].bo_type == BO_TYPE_OUTPUT))
+					continue;
 			gem_close(fd, bo_dict[i].handle);
 		}
 
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 28c1efd55f..0775c8e86c 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -59,6 +59,10 @@ struct user_execenv {
 	bool skip_results_check;
 	/** @array_size: size of input and output arrays */
 	uint32_t array_size;
+	/** @input_bo: override default bo input handle if provided */
+	uint32_t input_bo;
+	/** @output_bo: override default bo output handle if provided */
+	uint32_t output_bo;
 	/** @input_addr: override default address of the input array if provided */
 	uint64_t input_addr;
 	/** @output_addr: override default address of the output array if provided */
-- 
2.43.0

