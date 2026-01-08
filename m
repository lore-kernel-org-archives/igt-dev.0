Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AFCD1D483
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 19:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9C010E7CC;
	Thu,  8 Jan 2026 19:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZNYj2uV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8361E10E7BC
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 19:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767901695; x=1799437695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ojXIo2R0g6gq/2z0HVKgZ6tH/cgJaWbZwH93j7LttLU=;
 b=DZNYj2uVec/TiZFTFboDz5nKfds00n9AV8hssRlcapjQCeVDnkOZd970
 Tf5HPCTQzge2IxiL+sN5K+3dEgiZ8V0HAI26vaI1Ir0nXUnffikPqDcqA
 eNbWKHPzaGx+upoTGx98Pr7un6nBkmI8O7Bgny2KhZmvMKhcdz5rXiovw
 9ssG4/tfmgm05oa26093JEj7TVBB627GxRkOladIkBKzImwUAtM/lghVf
 FhbVcIQuQeBVGfflQlac6YnpAQy+ppoowmGQwVBKSbaqyh8QzMzMqbBd0
 lPERA5UEoxII3mpLHQCKRfySjcjO3p/DGexLVaNOZ4dxVFV0BzEDUz8G8 Q==;
X-CSE-ConnectionGUID: sCQN+aoISsKFISbGKTeFKw==
X-CSE-MsgGUID: gJjTSA6KT8i37nrgNX8gpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73136097"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="73136097"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:48:15 -0800
X-CSE-ConnectionGUID: wg2vj5ojS7uyWs7JSUKb6g==
X-CSE-MsgGUID: haSUzIqWSAeNQKZlICm/vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="202496603"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:48:11 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 2/2] HAX: Add throttle_basic_api test to fast feedback list
Date: Fri,  9 Jan 2026 01:19:01 +0530
Message-ID: <20260108194858.2124790-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108194858.2124790-4-sk.anirban@intel.com>
References: <20260108194858.2124790-4-sk.anirban@intel.com>
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

Add throttle_basic_api test to fast feedback list.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 15fce6a42..bd5b1789d 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -135,6 +135,7 @@ igt@xe_exec_reset@cm-close-fd-no-exec
 igt@xe_exec_reset@virtual-close-fd-no-exec
 igt@xe_exec_store@basic-store
 igt@xe_gpgpu_fill@basic
+igt@xe_gt_freq@throttle_basic_api
 igt@xe_gt_freq@freq_basic_api
 igt@xe_gt_freq@freq_fixed_idle
 igt@xe_gt_freq@freq_range_idle
-- 
2.43.0

