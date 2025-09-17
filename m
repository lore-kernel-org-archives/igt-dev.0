Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928A8CA0EE8
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 12:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C2910E739;
	Wed, 17 Sep 2025 12:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSpHXnfG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D03310E1B1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 12:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758111405; x=1789647405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+xhWNWAGZYAEjdMFBz6XW+8xK75QIQzedoO2Zj6uPF4=;
 b=lSpHXnfGovVei8v5gr6JFnZrZxN6opxsL6nZSMxuOUcWCygZTbIf43YD
 qlySj++eWbjadFdmH0yPWZ9IQ2q+c5oLptLdXBlb2b2+8ApWr6TkKrGUM
 8qh6lNcztsqXvKYMbpnlseg1AngTAm3ZPnXUFCAjiLbS55+g6lOM595xA
 uQ2GLbj3gtH3mBqoQAUivuDDSEGlHg7Ny4iSdByk1XqNhzhuAElvmRBh2
 FCuhfMkJQ649K7jKazVMqcBarg6XX5ptMejbVfbxJ8q9AievP22XdCdAR
 x+uwxpjoVJ1EkfF9AJHxpBQ14uyDwOoC/r+baA59eTtCQP0jQJgUWKFhj w==;
X-CSE-ConnectionGUID: N4VtWV9cSLSxxFeyzncVRg==
X-CSE-MsgGUID: 16qxSaFURgCLiN4Gu4pZvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71840422"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="71840422"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:16:45 -0700
X-CSE-ConnectionGUID: OL88Znj2RC6ddx5vRu+llQ==
X-CSE-MsgGUID: 3/RZ9OUsSH6xQCU18svS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175309020"
Received: from dut2144ptlh.iind.intel.com ([10.190.232.53])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:16:44 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gajendra.uttamchand@intel.com
Subject: [PATCH v4 i-g-t 1/6] benchmarks: Move xe tests to intel_latency folder
Date: Wed, 17 Sep 2025 12:16:25 +0000
Message-ID: <20250917121626.67917-9-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
References: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
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

Move existing xe benchmark into folder intel_latency to
separate those from other benchmarks

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 benchmarks/{ => intel_latency}/xe_blt.c      | 0
 benchmarks/{ => intel_latency}/xe_create.c   | 0
 benchmarks/{ => intel_latency}/xe_exec_ctx.c | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename benchmarks/{ => intel_latency}/xe_blt.c (100%)
 rename benchmarks/{ => intel_latency}/xe_create.c (100%)
 rename benchmarks/{ => intel_latency}/xe_exec_ctx.c (100%)

diff --git a/benchmarks/xe_blt.c b/benchmarks/intel_latency/xe_blt.c
similarity index 100%
rename from benchmarks/xe_blt.c
rename to benchmarks/intel_latency/xe_blt.c
diff --git a/benchmarks/xe_create.c b/benchmarks/intel_latency/xe_create.c
similarity index 100%
rename from benchmarks/xe_create.c
rename to benchmarks/intel_latency/xe_create.c
diff --git a/benchmarks/xe_exec_ctx.c b/benchmarks/intel_latency/xe_exec_ctx.c
similarity index 100%
rename from benchmarks/xe_exec_ctx.c
rename to benchmarks/intel_latency/xe_exec_ctx.c
-- 
2.43.0

