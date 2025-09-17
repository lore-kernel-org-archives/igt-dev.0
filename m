Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95615CAC599
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 13:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF9910E82B;
	Wed, 17 Sep 2025 13:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZisE+V8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBB510E826
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758114619; x=1789650619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+xhWNWAGZYAEjdMFBz6XW+8xK75QIQzedoO2Zj6uPF4=;
 b=DZisE+V8HJE0GQ1ySHrUMSA1sv+j0vPKcLX1VtEZhR1yXWCfmXaNXDo1
 kW/0uEHUY8sndPy+P1FvjyHb5LhmhEqQq8MepezKjz45Ih9nRqBpHKgjD
 B5wazlHp0ig3YUbN8LTBNoG+v4RLGdPw793RwapDvRL9IgAJrpp0yRLmS
 eE9KFDvnOZwXDHB7alc0h8sBcrbmE60gIVKWtTEJ/JypRqQPjtdrtCVPD
 2atOt+QojjGQXdKCiyFBrIZcucafDvLrR3/uWPbX8cnANOiQJt7V50HDy
 Z0FczP5xOpdAPISs+m0nHlBraPMwM5oML9ZXvg+cNUExW9Sz+qDe20CUK A==;
X-CSE-ConnectionGUID: A1u+cRlJTRa9y0mKxd7yVQ==
X-CSE-MsgGUID: tILLw8BrTvqt5dlOPmTivw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60477367"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60477367"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:10:19 -0700
X-CSE-ConnectionGUID: YZ6GuYAOSICWd5YER7NCVQ==
X-CSE-MsgGUID: Lhe4U8BiTGSr6ORh1edUFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="174526340"
Received: from dut2144ptlh.iind.intel.com ([10.190.232.53])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:10:18 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gajendra.uttamchand@intel.com
Subject: [PATCH v4 i-g-t 1/6] benchmarks: Move xe tests to intel_latency folder
Date: Wed, 17 Sep 2025 13:10:03 +0000
Message-ID: <20250917131003.71762-9-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917131003.71762-8-gajendra.uttamchand@intel.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250917131003.71762-8-gajendra.uttamchand@intel.com>
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

