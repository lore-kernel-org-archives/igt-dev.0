Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8859ED65559
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 13:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3521B10EC76;
	Wed, 17 Dec 2025 13:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kC4P/cll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B04310EC76
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765977174; x=1797513174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4FfbVc/iGSGidtfQszMk8ka7W8kuyl7tFastqT7A9z4=;
 b=kC4P/cllcOdOGNh4Rt/Ea4MibpLNU4+Lu//apypfrY6KZa07nFzoXYue
 5YbNG62t27/lMWSsQH3oKfAa33JRFpIz2zN3DYEi2WfHeDJOhv1Erd9RO
 vWpDMZOw+njLgigs7vdHDwdgD6Rj4hIy57D6Nr3TWubIrwVrM6iMKECx5
 KsYFoyab20t1/FhhiYfm1rb5vf06Za3xjTQgKxmAbRi6irA6crcZ4fv3c
 GxAh8gqQzVecU5lcFM57UN4YBrVef5nw/ljRbhTRE3oUftekn0eTSquXc
 dvO6ZtS1efLRy2OHVhAHr2fUNGDEmBLZw3HPpNhGseEl88gZVohNyqdgc Q==;
X-CSE-ConnectionGUID: m1fguWgLSlKQkIyGjjg8Sw==
X-CSE-MsgGUID: +OQnQhWFTcqBagoYgNKcQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79030815"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="79030815"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:12:54 -0800
X-CSE-ConnectionGUID: MwPnVTrGRX68mD8sVsAEQQ==
X-CSE-MsgGUID: VSWSTpECQh2gv8JZTHblug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="202496342"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:12:53 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 0/1] Discard wait_for_lmem_ready from fault injection test
Date: Wed, 17 Dec 2025 18:44:07 +0530
Message-ID: <20251217131406.2441143-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

There is a driver patch in-flight which removes the function
"wait_for_lmem_ready" from its code -
https://patchwork.freedesktop.org/series/159150/
This function is used in the fault injection test. So keeping this patch
ready to merge immediately once the driver patch is merged.

Balasubramani Vivekanandan (1):
  tests/xe/xe_fault_injection: Remove probe function wait_for_lmem_ready

 tests/intel/xe_fault_injection.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.43.0

