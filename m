Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EE6C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 10:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6C610E57D;
	Tue, 28 Jul 2026 10:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ClTbgD3F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5CF10E495
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785234425; x=1816770425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=14nnUqPAvkbcRaw6o70aePCEAfGdREQXFRFsFgWjVa0=;
 b=ClTbgD3FtBpF9rdaYg6HniLLzTd5HJrRgpR4k/fga07jc1LautiwozqR
 AaUBAOza9+4CDEI+Ch1roD9bSBLAkhXtNaqOlGsOoeW7bK65odQuKp9h/
 sSBxdxUZHyrdi9FyTBhbRgrUTs3kCLGSOCvStaP2zl3idwWlmMVgWQa8w
 kFWzodJxZhTjvCCXPN/HcVwEZHCXhHCLnhoYxWP8SfBy9PDRGtTRs15ps
 AUgd5mOfnhRJMVKt9gKzROFHTFZP7U4kkbEzLjLCe0gYzFRIE+RFIqxiX
 VByGUVnG9ONk4J9u0jkJH6ZcoNhVx1Fu039r0DCA42jxYRswn29aZp1Dm A==;
X-CSE-ConnectionGUID: gcGaoSOvQBSxxJFF9z5JdQ==
X-CSE-MsgGUID: FsGjz8NoSamIaeKHGRL+Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85827957"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85827957"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 03:27:05 -0700
X-CSE-ConnectionGUID: KxTws1f4S4uTn/Xm4+77eg==
X-CSE-MsgGUID: BOiYUJ0nSF6o5VqoP0YwhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="257861956"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.68])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 03:27:04 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/2] gem_wsim: fix batch premature completion
Date: Tue, 28 Jul 2026 12:26:57 +0200
Message-ID: <20260728102659.316861-1-marcin.bernatowicz@linux.intel.com>
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

Fixes sporadic batch premature termination after sustained GPU workload
stress testing by hardening ticks_delta initialization/re-arming:
- initialize ticks_delta to ~0u in xe_spin
- reset ticks_delta to ~0u before fixed-duration batch submission
  in gem_wsim

Marcin Bernatowicz (2):
  lib/xe/xe_spin: initialize ticks_delta to ~0u
  benchmarks/gem_wsim: re-arm ticks_delta before batch submission

 benchmarks/gem_wsim.c | 4 ++++
 lib/xe/xe_spin.c      | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.43.0
