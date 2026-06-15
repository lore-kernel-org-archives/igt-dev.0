Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DA9CD98E0
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 12:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2391210E3D2;
	Mon, 15 Jun 2026 12:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzHalhAG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDE610E3D2
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781526302; x=1813062302;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2SsNo5Y6cYRUgVrOYTNva3RrLqtMd1TFreW7SEVxvgo=;
 b=YzHalhAGMFJkO+SkimiHUZh0oLHUrij4VrKeS7qbXtk+/BWcGqGXZ8QM
 CHe12gaD/Pb6GJothGEpSOn76D5yxQtSwNsYXQ26wRfTIyiKThVruUzVr
 53UOSl0xwf104yxgZNoHsvMPJDCPA+z3iR21kBCOa3IFqDpzVg3FQIVNo
 8pAQ6QQPfNzEw4NBRhA2RKz7sz9J4iFVJjyM3I31u0xamDrlghnc+iuvW
 VP8wk2MiTbmeTmvccKQ2aCzQPjjZejdLc/ns5JNEpOeJiG2i3gUOEgCAo
 4rAYh8JzBdkiWTjTOt6vSBfavj1C4OYuZxck1yEs1qts1jcKpl8mHs6Ie g==;
X-CSE-ConnectionGUID: igqNv0L5TsW5LvGM44FKrA==
X-CSE-MsgGUID: bzV5lMI7QcydL9QYYNfl8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82248709"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82248709"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:25:02 -0700
X-CSE-ConnectionGUID: nGF1nHsyQHqjE9fn98KP7A==
X-CSE-MsgGUID: 5bR+CW5XTi2GSrAbf08IIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="243299202"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa010.fm.intel.com with ESMTP; 15 Jun 2026 05:25:01 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Subject: [PATCH v2 0/3] Negative tests for VM_BIND decompression 
Date: Mon, 15 Jun 2026 18:01:06 +0530
Message-ID: <20260615123109.2286386-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527054210.2147520-1-smitha.balasubramanyam@intel.com>
References: <20260527054210.2147520-1-smitha.balasubramanyam@intel.com>
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

Changes in v2:
 - Patch 1: Add xe_has_vram() require in vm_bind_decomp_test_setup() so
   the negative tests skip cleanly on integrated GPUs.
 - Patch 3: Change igt_subtest_with_dynamic to igt_subtest for
   vm-bind-decompress-ccs-corruption-suspend-resume. The subtest had no
   igt_dynamic() body and was reporting a spurious SKIP
   ("No dynamic tests executed") on BMG CI.

Smitha Balasubramanyam (3):
  tests/intel/xe_ccs : Add helpers and Negative test for VM_Bind Decomp
  tests/intel/xe_ccs: Add fault-mode helper and VM_BIND decomp neg test
  tests/intel/xe_ccs : Add CCS corruption neg test for VM_BIND decomp

 tests/intel/xe_ccs.c | 1185 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 1185 insertions(+)

-- 
2.43.0

