Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F340CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 12:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1785510E17B;
	Mon, 25 May 2026 12:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HaIz+hXv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E958E10E17B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 12:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779711040; x=1811247040;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=o4K8M5zziA3pfLchVlmOat6NWl+rJzAvZ3qoDKcKNUQ=;
 b=HaIz+hXvc8lSC7NsKISYswkz+gH94agN8ByhoCF52RQMKn3zJsHzgJiJ
 brWzyw+rWk7xb9oJNpyTBMbtPFGYjkP85DGpSISvWcv0nTHr798ZcC/Bk
 /UhBDLS9r2Nx5JL7iVyxgp6Vy0VIwTgjEH5/0aVGsyIj3EGLwlVHEQ8MU
 Ps+E1FtjfyzjPY7avzxd3XOjGLZM5zOAhsusfUQDIr4DBrGbDLuJxWD9+
 7/h5wfMnXjQoa5Xdurqlejy7wTVtoWrbPVoYZZ0PSfvAfvLD60vIXWtu9
 cqpZTwHj2/FDmuS85+jnKnStg9rENkKVOAQH24Ms2qf1MKUq0Pe67yEyO Q==;
X-CSE-ConnectionGUID: 8ZqIFOtbS72fBQbTS4fy4g==
X-CSE-MsgGUID: YbGwZeCERye68ZvTLrhfgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="84383885"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="84383885"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 05:10:39 -0700
X-CSE-ConnectionGUID: 7k4nc3yVQWW4P/Dr5CzdbQ==
X-CSE-MsgGUID: /ziaNSciSuuoqCvg9RIZ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="246670254"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa005.fm.intel.com with ESMTP; 25 May 2026 05:10:39 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 0/3] Negative tests for VM_BIND decompression
Date: Mon, 25 May 2026 17:45:33 +0530
Message-ID: <20260525121537.2128676-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
References: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
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

This series adds negative test coverage for VM_BIND DECOMPRESS flows in
xe_ccs.

Patch 1 introduces resource management structures, helper utilities, 
and a negative uAPI parameter validation test for VM_BIND DECOMPRESS flows.

Patch 2 adds a helper for fault-mode handling along with a 
negative test to validate VM_BIND DECOMPRESS uAPI parameters under fault-mode conditions.

Patch 3 adds negative test coverage for VM_BIND DECOMPRESS 
with CCS corruption, including suspend-resume scenarios.

Changes since v1:

Reworked test split and helper organization
Previous version:
https://patchwork.freedesktop.org/series/162838/

Smitha Balasubramanyam (3):
  tests/intel/xe_ccs : Add helpers and Negative test for VM_Bind Decomp
  tests/intel/xe_ccs: Add fault-mode helper and VM_BIND decomp neg test
  tests/intel/xe_ccs : Add CCS corruption neg test for VM_BIND decomp

 tests/intel/xe_ccs.c | 1184 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 1184 insertions(+)

-- 
2.43.0

