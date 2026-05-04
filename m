Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF403CD3430
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 15:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DEB10E3C5;
	Mon,  4 May 2026 15:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9iBFQKr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B0010E3C5
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777908513; x=1809444513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hXUlQC8pRgwl6wVM/nQCWkFodw45j11mSwny+LqP7Ig=;
 b=W9iBFQKrG4bZwTb27roUkekgcCdV3lkXgUb+kp/MlAyTEUO41RIUAnp3
 LRf6d1M7lGzn6TGJJ3j9LVuMLdoCM+aXm9H5VvCfKH97sE2291hQj8sxe
 xDq1DPcTF3tdexrvCrOwU+Y7XKzAEXgvx7x2i+GaSlgXgYMR067DJnTig
 FD7QmUtpB6Da5l5RS2YFLmJAVdsTjM99LLtIkYXRllSkBleX2lQlKdNMZ
 li19inYBGy214UeQ4Sc/+Jbqt2kmbaXtpngW12CYzg1TLYu1Xx2Ipd91E
 AxQX7/sZSrArT9OybRpixB2IXk6nhYTVfMkYunJp6ey9KZrrFx0Y3FYN7 A==;
X-CSE-ConnectionGUID: f9iaQJVmQp2El3AJr5mQEQ==
X-CSE-MsgGUID: m+MnWMQLQ6iZocMEM8bLeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="96193455"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="96193455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 08:28:32 -0700
X-CSE-ConnectionGUID: cDzVCkcLTMSMj+dpWZd/fg==
X-CSE-MsgGUID: EiH230KlQBeGuGeqPiqm/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="235800309"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 08:28:29 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] tests/xe_exec_system_allocator: Don't use NaN in an
 input buffer
Date: Mon,  4 May 2026 17:28:21 +0200
Message-ID: <20260504152820.3825451-2-zbigniew.kempczynski@intel.com>
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

Setting input buffer memory to random byte (in this particular case
0xff) and then use it as a float causes doing compute square on NaN
numbers. It's nothing wrong about this but comparing NaN in between
returns false according to IEEE-754 rules. Buffer compare function
does assertion if output is not equal to expected output so we hit
this randomly in 'eu-fault*' tests.

Replace memset to loop which sets all input floats to real numbers
thus avoiding NaN arithmetic and comparison.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 5580099f78..0f1d6ee9c7 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2339,7 +2339,8 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 		igt_assert(compute_input);
 		env.input_addr = to_user_pointer(compute_input);
 
-		memset(compute_input, rand() % 255 + 1, size);
+		for (int j = 0; j < env.array_size; j++)
+			compute_input[j] = rand() / (float)RAND_MAX;
 
 		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
 
-- 
2.43.0

