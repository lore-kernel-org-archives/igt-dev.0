Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D93DCD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 03:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDDE10E461;
	Mon, 11 May 2026 03:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAuRbAqA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E5610E461
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 03:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778471603; x=1810007603;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Z/1FArL+WKXN6FsDG/VjgDFA1IQfFnuHLrnd5J/oEs=;
 b=kAuRbAqAAwQPmJlktKZRkbe14tyQNxsseMwPDUO8BxlZegkxaOmctftn
 usay4TQMzOmxCEnRs2U1wWFgd22DpBp6he1dFHmG1tY5N8b68sA8zc0iu
 QJr8/Aq7tTD5y1hUT+sPYkIBgNbTB/DpHyGQv/JVxibsDWdW34cw6+ftH
 c4AsSZYRthUIqHWfq2oawIx/EdEwwvTImL47o5W39W7PCwoLTOqImzewK
 wy39djNDcf5uOcWwiI9hAwVmivkj3OvodPGPIstfZzhyG+iXdKi0hFOIq
 EnstTLHfCTJ2xmdXcnGD9MSK0cEu1Bj1tZqrPuplUj/wXN/9DjHmynkih Q==;
X-CSE-ConnectionGUID: xVRHTD0GSoCOF6NQ/jwAKg==
X-CSE-MsgGUID: 9Qyj6jZhR/GP3XH3T4eT/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90052995"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90052995"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 20:53:23 -0700
X-CSE-ConnectionGUID: YWPbwgSeQD6J6dW8tg9OZQ==
X-CSE-MsgGUID: jgD+YMnZRs2JN78pNuXI1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="232857133"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 20:53:22 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arvind.yadav@intel.com, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v2 0/4] tests/intel/xe_madvise: Add atomic madvise
 subtests
Date: Mon, 11 May 2026 09:22:55 +0530
Message-ID: <20260511035310.32323-1-varun.gupta@intel.com>
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

Add three subtests to validate DRM_XE_MEM_RANGE_ATTR_ATOMIC madvise on
fault-mode SVM VMAs:

  atomic-device — GPU MI_ATOMIC_INC succeeds via fault handler
  atomic-global — CPU atomic increments + GPU MI_ATOMIC_INC with
                  fault-driven SMEM-to-VRAM migration
  atomic-cpu    — GPU MI_ATOMIC_INC rejected (-EACCES), engine reset

Patch 1 generalizes the test metadata and groups existing purgeable
subtests so the atomic subtests can coexist without being gated on
purgeable support.

v2:
  - Add UNMAP of CPU_ADDR_MIRROR binding before xe_vm_destroy in all
    three atomic tests (Nishit)
  - Add pagefault count print before/after exec in atomic-device and
    atomic-global (Nishit)
  - Add comment explaining single-engine rationale in atomic-cpu (Nishit)

Varun Gupta (4):
  tests/intel/xe_madvise: Generalize metadata and group purgeable
    subtests
  tests/intel/xe_madvise: Add atomic-device subtest
  tests/intel/xe_madvise: Add atomic-global subtest
  tests/intel/xe_madvise: Add atomic-cpu subtest

 tests/intel/xe_madvise.c | 379 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 336 insertions(+), 43 deletions(-)

-- 
2.43.0

