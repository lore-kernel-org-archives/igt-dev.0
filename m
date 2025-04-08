Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E30C369A7
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79D110E171;
	Tue,  8 Apr 2025 18:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3qhxmLl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E5610E171
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744138253; x=1775674253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F1ApfWBYy93U9bgVGVBLa4SD3kBXMjqYK1O++bB69EI=;
 b=e3qhxmLlTv6V/jvaKx0pHSNTPlUH1TG7375CBgFRD7DYgGPdzYu+NCfQ
 h4R7priD+LP5qwQonIcR7bc5U8TrkXCJk96ptUuR/o5aEFlI0XIGkq59N
 kVgn7uNPOH6qWLrRKbjlgR4Ee9V8Tef15XxfMfYQaH8qvAVMs8wpBNQiX
 7L19yXji1xiT3Ccu+UXBWq9Gu6c6WNPDwN8YV8AM4X3CdyqIBzb63PNko
 2Tz3RlkUT+XQpmftIR4wWH5KhUxhaDYlroNJLkxMwZ9hGRTU0KHC84zWc
 f0pcj9afsgWE1uwRcxdhptcKB+iuOE8dCkwezv7nsR74O+dHIqeV1N8vT w==;
X-CSE-ConnectionGUID: U5OEptwiQJ+HSbZqKB9G0Q==
X-CSE-MsgGUID: tBi3Ew5ORMC8mk34WpAUHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45477721"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45477721"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:50:53 -0700
X-CSE-ConnectionGUID: mDniMfnQT7qDAlcqaN0img==
X-CSE-MsgGUID: 7yBvM+BsQ1G7Y6JFhm9hqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="132487046"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.170])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:50:50 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v3 0/5] Replace loop in WMTP tests
Date: Tue,  8 Apr 2025 20:50:40 +0200
Message-Id: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Current solution where we run loop with some number of iterations
is problematic because we tweak this number for different platforms.

Start to migrate to loop stoppable from cpu side, where we can
immediately stop long running job via simple memory write instead
of waiting until loop will complete all iterations.

v2: - adjust test number of children according to available ram
    - add compute-preempt-many-all-ram subtest
v3: - use same MAGIC_LOOP_STOP definition + comment (Francois)
    - don't touch threadgroup preempt test logic (yet)

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Zbigniew Kempczyński (5):
  lib/intel_compute: add support for stoppable loop
  lib/intel_compute_square_kernels: use stoppable loop for LNL/BMG
  lib/intel_compute_square_kernel: add loop shader binary for PTL
  tests/xe_compute_preempt: adjust number of children according to ram
    size
  tests/xe_compute_preempt: consume all ram for wmtp

 lib/intel_compute.c                | 40 +++++++++++++---
 lib/intel_compute.h                |  2 +
 lib/intel_compute_square_kernels.c | 77 ++++++++++++++++++++++++++++++
 opencl/loop.cl                     | 12 +++++
 tests/intel/xe_compute_preempt.c   | 54 ++++++++++++++++++---
 5 files changed, 172 insertions(+), 13 deletions(-)
 create mode 100644 opencl/loop.cl

-- 
2.34.1

