Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F227C5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 05:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DE110E640;
	Mon, 17 Aug 2026 05:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7cph9qS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F1810E640
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 05:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786944694; x=1818480694;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=00lca9J2YaqZ82YyVuXyYfEXIDaNrptzy4a9L3JNcIo=;
 b=n7cph9qShnTXlVGL8Z2E0Vs3dHFkKX4j/xGEBSfzoMk/fX3wSgpJHeYY
 urGeFzqQ8dlIhezqtoP9N/qI8IWawtQjifAvulm4/y7wxaxIW0nxZIpsQ
 jefAOYg5gFpS2+gbBf4E0rYiUiaz2U8sTWGNGZkuBTImnpoiMRllD/J33
 /5BZUplqt1QPXo2dFk2c72C6+WlvUowXY0kmT6W2mDTDFanu4UhDwm5qK
 bkrLrmGUeea91HdCezHDjerD34EC6ZD98bEG0Pnr+W3b1mbiVTD88DN0e
 gwETr6ivm5PcEwziLzcoGdIniWmYIFzXwBJze6ZzwQpNUMzS+rIcSWkPE g==;
X-CSE-ConnectionGUID: c3783I7SQ3i2MHiOksEo9w==
X-CSE-MsgGUID: hpFRxbwCSzaPnovzXOfDEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87538547"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="87538547"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 22:31:34 -0700
X-CSE-ConnectionGUID: IiPCBJ83S7SrPNE6aQV4Lg==
X-CSE-MsgGUID: CymGqFN+Ty2CoNfUmwN2UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="268298868"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 22:31:34 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v2 0/2] Add BO Allocation and VM Bind stress infra
Date: Mon, 17 Aug 2026 05:31:02 +0000
Message-ID: <20260817053107.887805-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

This series adds the base BO allocation infra for excercising Xe VM
Bind/Unbind with varying BO Sizes and execution workloads 

This infra supports individual and array VM binds, random sized BO
allocation , threaded execution across engines, unaligned VA access and
leak/eviction scenarios


Sobin Thomas (2):
  tests/intel: add BO allocation stress coverage
  test/intel/xe_bo_alloc: Add oversubscribe concurrent bind stress
    subtest

 tests/intel/xe_bo_alloc.c | 1483 +++++++++++++++++++++++++++++++++++++
 tests/meson.build         |    1 +
 2 files changed, 1484 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

-- 
2.52.0

