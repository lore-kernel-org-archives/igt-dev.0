Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DECFEB7EB2
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 09:17:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2793B10E985;
	Wed,  4 Mar 2026 09:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chg0q2tN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC9B10E985
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 09:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772615826; x=1804151826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=15FOlf+lVdAoehFsAi4YaZHUhD2nQb6IpcNiiMRdjvI=;
 b=chg0q2tNcZsXIy9N9b9j7ZyXQOVHToQ4dTJTxZhSGha+MWfjhgcAApGt
 BIKlnwRiNurzdp8Vn1ZWF7brrTG87TH9Ff4POdt2uAhkMmXoDw4DgZoeO
 28LUGm9qsgZnEJL+1nRMUd+INu24LcyIp41lSv0QVHMQTdyHlL/J9FpQ+
 6akMikgz5JvvRnr5AahEmwylwNRQC7KqrMAUnrRItA26tD0+1JEtCbyF6
 vYO0jaRvrqb6QKb65RyarcF+y4EEzU9Cc/kD0nvWvcKbxTy/FVwOwB4KQ
 NKDcKIo153rY+7a8S8nWnZiYYPk5TXKUx/KLK8Opco0IlDq5pCEbEPwhI A==;
X-CSE-ConnectionGUID: cTSE0iwmSvCYtQucpXShnQ==
X-CSE-MsgGUID: h+c4asHyT56zEbsyt3GNHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73579535"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73579535"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:17:06 -0800
X-CSE-ConnectionGUID: CKm0kBJmSfui6zmMvE5AmA==
X-CSE-MsgGUID: N4ZVKn2JQ5Wq0YZOOp6QcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218237115"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:17:05 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Nishit Sharma <nishit.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 3/5] lib/intel_compute: Enhance Xe3p pipeline to
 accept user data
Date: Wed,  4 Mar 2026 10:16:53 +0100
Message-ID: <20260304091649.72814-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304091649.72814-7-zbigniew.kempczynski@intel.com>
References: <20260304091649.72814-7-zbigniew.kempczynski@intel.com>
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

Improve Xe3p pipeline flexibility by accepting user data like
input / output buffers and iteration count. This pattern was
already used in other pipelines and only Xe3p ignored these
overrides.

Cc: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 1165bdafd9..bfe0a75a7c 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2189,6 +2189,8 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	struct inline_data idata = {};
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
+	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
+	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
 	int entries = ARRAY_SIZE(bo_dict);
 	int64_t timeout_one_ns = 1;
@@ -2205,7 +2207,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	memcpy(bo_dict[0].data, kernel, size);
 	memset(bo_dict[1].data, 0, 4096);
 
-	xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
+	xe3p_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
 				  execenv.loop_count);
 	idata.xe3p.indirect_addr_lo = indirect_addr;
 	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
@@ -2233,7 +2235,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	}
 
 	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+		bo_check_square(input_data, output_data, execenv.loop_count);
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
-- 
2.43.0

