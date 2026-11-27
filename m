Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3B6606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 04:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GCsP7QsP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A1710E799;
	Fri, 27 Nov 2026 04:46:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639FE10E799
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 04:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795754708; x=1827290708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F326g/oYYj+zc4NEgp0iGRgzU6yS/6eBzLo+CXqMcQo=;
 b=GCsP7QsPPWqFjnw8+kXRU9HAor43lNflKIfJe5tvrEbbL9C2DNoYH2fN
 4YJYOSqAIxGYv0XexZEd/PeUFEhw0ILG9QJS/tBAcbBQ1oYKUEYEE2CYS
 2DOKdTw+9BLR0LGp+wWaW/JMA5fXsavIidTTSGe5vqZYV5CTThJx13N8Z
 GnYlyWNk3zEeSd0YyDo/OqfOzmVRuF94pMKZZyKAXG+ENnu8i9QBsCohx
 YUTo7aCRNvhaXJO6orHU5apgfKPaN2Htm/Mp+/2qZczYQQw+FJ/mi/uou
 kLVz+s24Pf+DCu5uaI1E98p4M3UfUStBmy/TuHz+2jl36jYOuAGb5TBmi A==;
X-CSE-ConnectionGUID: 0MC2h+SGQAqR57KM1EhIhQ==
X-CSE-MsgGUID: v53qBq6fQIyP9eYW0pubXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4674226"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4674226"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 20:45:07 -0800
X-CSE-ConnectionGUID: w7ooucSdQmib3r/piS1PsA==
X-CSE-MsgGUID: blWZ4d0oQ/mcJgJEsN7fBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12096036"
Received: from hgirotra-desk.iind.intel.com ([10.190.216.57])
 by orviesa008.jf.intel.com with ESMTP; 26 Nov 2026 20:45:05 -0800
From: Himanshu Girotra <himanshu.girotra@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com, nishit.sharma@intel.com,
 zbigniew.kempczynski@intel.com
Subject: [PATCH i-g-t 0/2] Enable TG preemption testing on CRI
Date: Fri, 27 Nov 2026 10:15:02 +0530
Message-ID: <20261127044504.4119774-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CRI (Xe3p_XPC, 35.11) advertises only WMTP in the compute preempt
table, so xe_compute_preempt@compute-threadgroup-preempt is skipped on
CRI. Thread group preemption is supported on CRI and uses the same
xe3p preemption path as 35.10.

Patch 1 advertises PREEMPT_TGP for 35.11.
Patch 2 enables the test in CRI CI.

Tested on CRI silicon (kernel 7.4.0-rc4):
- xe_compute_preempt: all subtests pass

Himanshu Girotra (2):
  lib/intel_compute: Enable TG preemption for Xe3p_XPC 35.11
  tests/intel-ci: Unblock compute-threadgroup-preempt on CRI

 lib/intel_compute.c                      | 2 +-
 tests/intel-ci/xe.cri.core.blocklist.txt | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

-- 
2.53.0

