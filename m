Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC46C369A1
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 12:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE5010EBC5;
	Fri,  4 Apr 2025 12:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qz7dyupS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602D110EBC5
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 12:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743769906; x=1775305906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KOrGvWIcad4Rhv08c0xYl4k5rkQdOP3NjLgWrvYrvMU=;
 b=Qz7dyupSscG6eXGa4zEi4WN5WPH6w/Ztc63EZFfyM+6xWdq5g1OyaSgK
 Zy3VqlJXQ+qiH+wJFxZMRyaQIWEhuS/l9JWY/k56eUqZ0ppQAqHlowcKp
 +9q5Ty6oWtcNoTz/iy0rGcNm7YCnIlDyUXMztqxY8i9ix5ACleBc6e/VU
 fZVpIFOPx0RsP5VGhuARjqPCANl+tgY6gP1y/SkevAl7DvCsc7AF+Dn2v
 3qwU4eBlqlhgvIcKinhRinxTilqoyK9T+NiUl/E1+/6roIQpqyFw3DQOy
 PEKIx9o9SYgzwPA19G+HZNdRyABU+0mfLm1F2Pdi20SoXZ8TEikIlZeIG Q==;
X-CSE-ConnectionGUID: O9IF71ZfS7KIsa4bnIF/qw==
X-CSE-MsgGUID: b3Egkn7TT2SFAmdBN9k+iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55841455"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="55841455"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 05:31:45 -0700
X-CSE-ConnectionGUID: kn5Z0NDkTMG1K7OS7JdU7w==
X-CSE-MsgGUID: AHWAh8c6THGkUXZsMj7Z3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="127281641"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.53])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 05:31:44 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v2 0/5] Replace loop in WMTP tests
Date: Fri,  4 Apr 2025 14:31:35 +0200
Message-Id: <20250404123140.260143-1-zbigniew.kempczynski@intel.com>
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

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Zbigniew Kempczyński (5):
  lib/intel_compute: add support for stoppable loop
  lib/intel_compute_square_kernels: use stoppable loop for LNL/BMG
  lib/intel_compute_square_kernel: add loop shader binary for PTL
  tests/xe_compute_preempt: adjust number of children according to ram
    size
  tests/xe_compute_preempt: consume all ram for wmtp

 lib/intel_compute.c                | 39 ++++++++++++---
 lib/intel_compute.h                |  2 +
 lib/intel_compute_square_kernels.c | 77 ++++++++++++++++++++++++++++++
 opencl/loop.cl                     |  9 ++++
 tests/intel/xe_compute_preempt.c   | 54 ++++++++++++++++++---
 5 files changed, 168 insertions(+), 13 deletions(-)
 create mode 100644 opencl/loop.cl

-- 
2.34.1

