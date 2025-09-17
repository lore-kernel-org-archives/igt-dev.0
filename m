Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C814CAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 12:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105E210E82B;
	Wed, 17 Sep 2025 12:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esF7r2V2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E8810E822
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 12:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758112409; x=1789648409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+xhWNWAGZYAEjdMFBz6XW+8xK75QIQzedoO2Zj6uPF4=;
 b=esF7r2V2qafs+6UZ2JgqhLx5/G/azwwowpHIGGNa2i3bAJhOG6890vU7
 A2sVkoqeejOYjCGD09F/7As/v81uWfSfU10Q7dvU4AbUWJq2S6F1I3cDk
 DTe6q5xo+YIcB86fEekRV6u94dKHMdDN0vQ+QrslozxEad6TTD0rrUgIf
 iY8tibM6wWZ/XnY2YYGVE4Ku55nnZEw51mLLvOvUtCAv5gH+KptLZ9rod
 SLvebL57vhtia7aeB5NnBo4elKqRzgPHID7I7f/lC4qQRkYsHPhx7d1NC
 qFzJQAlzmwHNsl/ltrHzZCiSTBda64SOvkLN72ZYHHyvWOH0Q3nAFt0t2 Q==;
X-CSE-ConnectionGUID: EqadE+/YQqmTmt/vZUA7pg==
X-CSE-MsgGUID: jTdUIHusTZiuclYMcL7HRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71781632"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="71781632"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:33:29 -0700
X-CSE-ConnectionGUID: nRneOwuSRnG2v8mgydE4Jg==
X-CSE-MsgGUID: lIjVKL/SSPSaKeUD/HSKCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="212379550"
Received: from dut2144ptlh.iind.intel.com ([10.190.232.53])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:33:28 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gajendra.uttamchand@intel.com
Subject: [PATCH v4 i-g-t 1/6] benchmarks: Move xe tests to intel_latency folder
Date: Wed, 17 Sep 2025 12:33:12 +0000
Message-ID: <20250917123312.68977-9-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917123312.68977-8-gajendra.uttamchand@intel.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250917123312.68977-8-gajendra.uttamchand@intel.com>
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

