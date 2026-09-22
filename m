Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9B6C982F1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 11:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BCC10E6B9;
	Tue, 22 Sep 2026 11:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQJk/5n4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AB310E6B9
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790075081; x=1821611081;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0f2eomvvXNhBPjtPxv+QHIsqIYDkWRQbcb483i7i/9c=;
 b=EQJk/5n4dy8Afz3g/L47yXiq7+RiqnhKxUTkQarl2ivkJgcsVbHRWEQ+
 RTu6O3vUwNb8xvGJTLecrZLVBvD5cuyPH2seNpWu9zW9lKybuIVFhYPMp
 rG8qFhS80Tv1udCkSg0cGcxRRbTyREGo4jfNEDtfVPpCQWunYsrgsGd9R
 O74+kiI1rRnpO0CPQ0o+XyIacGAy31fz4/QSz5DgkRkj4fOzB9pq/fymT
 6iqp0dV/4FSM5gVNgrO59Qu4Jm8pEpOalEefv3JYbQkMsdmokRtMO1MzU
 +WUqMB5qTc/BHzWZ4zIr8l3N+xc4UqJQRIOuHtv9MoI+qDLHFiRLpiXuF A==;
X-CSE-ConnectionGUID: oP+7QjVpR6KoLNaVbp+hQw==
X-CSE-MsgGUID: oTfAchJnQ72rU+P+JH1odQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78220515"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="78220515"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:04:40 -0700
X-CSE-ConnectionGUID: TU+CUnJTQwCtG1IwFg2DRg==
X-CSE-MsgGUID: j+J/QknJSaalvxyQRNgeMw==
X-ExtLoop1: 1
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa003.fm.intel.com with ESMTP; 22 Sep 2026 04:04:39 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v5 0/5] Add BO Allocation and VM Bind stress infra
Date: Tue, 22 Sep 2026 11:04:33 +0000
Message-ID: <20260922110438.2402109-1-sobin.thomas@intel.com>
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

Sobin Thomas (5):
  tests/intel: add BO allocation stress coverage
  tests/intel: Add random-size BO leak tests
  tests/intel: Add array-of-binds random-size allocation tests
  tests/intel: Add threaded random-size allocation stress tests
  tests/intel: Add oversubscribe concurrent bind stress subtest

 tests/intel/xe_bo_alloc.c | 1557 +++++++++++++++++++++++++++++++++++++
 tests/meson.build         |    1 +
 2 files changed, 1558 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

-- 
2.52.0

