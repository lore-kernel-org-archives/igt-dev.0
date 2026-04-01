Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD77D35162
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 09:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D747210EFEC;
	Wed,  1 Apr 2026 09:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mamg78im";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71D110ECE3
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 09:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775034633; x=1806570633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uv69XMh8eE7KA9hYeNkj7txeZmN/q248HkXQRjAgLBw=;
 b=Mamg78imWv0F6qi39WoOO08FgRR+GeUEdLP23+unU8NLDxwxrnZJfCMd
 D+tVXRK4lCbcY+eqdNY8PIo2jnRTdGBIC+1mES5lKq0nJiUqCSO6KKHKJ
 JB6tb3HQW1c//9UMLGe/2FGjoZnRKCffn6QOJ9lujwW5c/7agDYv6hcxX
 lJ0y4p99R6VWqXOtIrBm92q7fpZpiMCZZs2ZVzsaqrY9zX2BdyP6EwWUu
 2ESuiB2F/TUtzWQmss+woUCUPmfpN07fVpCgkdgtnAw5H2oxW7b4D8Xgk
 VTU96waCG/kkWbtphCVjAu15SH3iin9LmNoeDJcjK0Ne7oTJHk5tGz7hU w==;
X-CSE-ConnectionGUID: BX3RStXlQzG7liuQfZfj3g==
X-CSE-MsgGUID: keRdtu+QS8+7n4diNwNskw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78659427"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="78659427"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:10:33 -0700
X-CSE-ConnectionGUID: QulD8QMnSbGzYm3TysnHlw==
X-CSE-MsgGUID: buOOqohGRA6V+cF6WuHhcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="222255538"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.181])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:10:31 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 2/3] tests/xe_compute: Don't use FAULT_MODE flag when
 not needed
Date: Wed,  1 Apr 2026 11:10:20 +0200
Message-ID: <20260401091017.2772519-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401091017.2772519-5-zbigniew.kempczynski@intel.com>
References: <20260401091017.2772519-5-zbigniew.kempczynski@intel.com>
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

For buffers which are normal BO using FAULT_MODE is not needed.
Remove this flag when buffers passed to compute library aren't
system allocated (SVM).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_compute.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 762e66fcd3..ef2d891667 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -563,6 +563,7 @@ test_compute_square_userenv(int fd, uint32_t flags)
 {
 	struct user_execenv env = {};
 	uint32_t input_bo, output_bo, vm, size = SZ_4K;
+	uint32_t vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
 	int va_bits = xe_va_bits(fd);
 	float *input, *output;
 	int i;
@@ -570,8 +571,9 @@ test_compute_square_userenv(int fd, uint32_t flags)
 	size = ALIGN(size, xe_get_default_alignment(fd));
 	env.array_size = size / sizeof(float);
 
-	vm = env.vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
-				   DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	if ((flags & INPUT_IN_SVM) || (flags & OUTPUT_IN_SVM))
+		vm_flags |= DRM_XE_VM_CREATE_FLAG_FAULT_MODE;
+	vm = env.vm = xe_vm_create(fd, vm_flags, 0);
 
 	if ((flags & INPUT_IN_SVM) || (flags & OUTPUT_IN_SVM)) {
 		struct drm_xe_sync sync = {
-- 
2.43.0

