Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC41F01808
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 07:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6BA10E39F;
	Fri,  6 Mar 2026 07:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpkFixJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFA810E39F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 07:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772783893; x=1804319893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yOCUceMj22JT4mAf4HoQYrYGrnwrci5U7IwCKviLsu8=;
 b=SpkFixJ7njH99Ykg0YqKkwMDFy7XnkW8Pwa4NsBWYBsGT4gUocTl3m+o
 bn3G1ziAb6wHsbEIcNBH52u3ot6nTCJ/3p8ZF7owhnzQwaw1JChxMPoCn
 egBq09BfKWtiwlGQElM7bVh8X9jvsVaSbvlXD2E1uYpnw1FwqwBWqJNAa
 krohg2xcxHrpIfgKG+AanNta+ofUD8GIg+cdVDDxqWzjf2mahhaJnQmzB
 djM5xDsv346Sv82mNu/KmHoGWGeiuROS3WutdPrHDlKfY6LlJvEYUOSmj
 mZJI+sZkmmboEjcosKAHP3ZwDw25SRIp+vNPlAnRbZmAPg+N/ZMnMtNGP w==;
X-CSE-ConnectionGUID: iuk1VSRLRu66pDzIGWOxYg==
X-CSE-MsgGUID: j4QFHi/1R4CvmQWNtLApQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73934226"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73934226"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:58:12 -0800
X-CSE-ConnectionGUID: 5MXWsVsrSBq4C5urN+sCUA==
X-CSE-MsgGUID: xn6vkuz8TOeFYpBpme4R2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="249416158"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:58:10 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Nishit Sharma <nishit.sharma@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v6 2/6] lib/intel_compute: Extend userenv by adding
 input and output bos
Date: Fri,  6 Mar 2026 08:58:02 +0100
Message-ID: <20260306075759.1153032-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
References: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
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

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Acked-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_compute.c | 70 ++++++++++++++++++++++++++++++++++-----------
 lib/intel_compute.h |  4 +++
 2 files changed, 58 insertions(+), 16 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 8425e9dbd5..cff0a8345c 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -89,6 +89,7 @@ struct bo_dict_entry {
 	const char *name;
 	uint32_t handle;
 	enum bo_dict_type bo_type;
+	bool is_owner;
 };
 
 struct bo_sync {
@@ -171,14 +172,17 @@ static float *get_input_data(const struct bo_execenv *execenv,
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
+		if ((!user) || (user && !user->input_bo))
+			bo_randomize(input_data, execenv->loop_count);
 	}
 
 	return input_data;
@@ -191,7 +195,7 @@ static float *get_output_data(const struct bo_execenv *execenv,
 	const struct user_execenv *user = execenv->user;
 	float *output_data;
 
-	if (user && user->output_addr)
+	if (user && user->output_addr && !user->output_bo)
 		output_data = from_user_pointer(user->output_addr);
 	else {
 		struct bo_dict_entry *entry;
@@ -299,6 +303,7 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 			uint32_t placement, flags = 0;
 
 			bo_sync->sync = 0;
+			bo_dict[i].is_owner = true;
 
 			switch (alloc_prefs) {
 			case EXECENV_PREF_SYSTEM:
@@ -314,14 +319,38 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 				break;
 			}
 
-			bo_dict[i].handle = xe_bo_create(fd, execenv->vm, bo_dict[i].size,
-							 placement, flags);
-			bo_dict[i].data = xe_bo_map(fd, bo_dict[i].handle, bo_dict[i].size);
-			xe_vm_bind_async(fd, vm, 0, bo_dict[i].handle, 0, bo_dict[i].addr,
-					 bo_dict[i].size, &sync, 1);
-			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
-				       INT64_MAX);
-			memset(bo_dict[i].data, 0, bo_dict[i].size);
+			/*
+			 * For input/output buffers skip their creation if
+			 * were passed from the user
+			 */
+			if (execenv->user && bo_dict[i].bo_type == BO_TYPE_INPUT &&
+			    execenv->user->input_addr) {
+				bo_dict[i].handle = execenv->user->input_bo;
+				bo_dict[i].addr = execenv->user->input_addr;
+				bo_dict[i].size = execenv->array_size * sizeof(float);
+				bo_dict[i].is_owner = false;
+			} else if (execenv->user && bo_dict[i].bo_type == BO_TYPE_OUTPUT &&
+				   execenv->user->output_addr) {
+				bo_dict[i].handle = execenv->user->output_bo;
+				bo_dict[i].addr = execenv->user->output_addr;
+				bo_dict[i].size = execenv->array_size * sizeof(float);
+				bo_dict[i].is_owner = false;
+			} else {
+				bo_dict[i].handle = xe_bo_create(fd, execenv->vm, bo_dict[i].size,
+								 placement, flags);
+			}
+
+			if (bo_dict[i].handle) {
+				xe_vm_bind_async(fd, vm, 0, bo_dict[i].handle, 0, bo_dict[i].addr,
+						 bo_dict[i].size, &sync, 1);
+				xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
+					       INT64_MAX);
+			}
+
+			if (bo_dict[i].is_owner) {
+				bo_dict[i].data = xe_bo_map(fd, bo_dict[i].handle, bo_dict[i].size);
+				memset(bo_dict[i].data, 0, bo_dict[i].size);
+			}
 
 			igt_debug("[i: %2d name: %20s] data: %p, addr: %16llx, size: %llx\n",
 				  i, bo_dict[i].name, bo_dict[i].data,
@@ -387,11 +416,20 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
 
 		for (int i = 0; i < entries; i++) {
 			bo_sync->sync = 0;
-			xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
-			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
-				       INT64_MAX);
-			munmap(bo_dict[i].data, bo_dict[i].size);
-			gem_close(fd, bo_dict[i].handle);
+			if (bo_dict[i].is_owner) {
+				xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
+				xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
+					       INT64_MAX);
+				munmap(bo_dict[i].data, bo_dict[i].size);
+			}
+			/* Keep user buffers intact */
+			if (execenv->user)
+				if ((execenv->user->input_bo && bo_dict[i].bo_type == BO_TYPE_INPUT) ||
+				    (execenv->user->output_bo && bo_dict[i].bo_type == BO_TYPE_OUTPUT))
+					continue;
+
+			if (bo_dict[i].handle)
+				gem_close(fd, bo_dict[i].handle);
 		}
 
 		munmap(bo_sync, bo_size);
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

