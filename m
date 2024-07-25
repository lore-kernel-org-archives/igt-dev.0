Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78389C3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 12:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F05810E7E6;
	Thu, 25 Jul 2024 12:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkO0qMxE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F5010E7EC
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 12:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721910382; x=1753446382;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pt0P8SZCCEtolF/XyCM9CtPP0fUDiVzBKu/FN6l/iIo=;
 b=hkO0qMxEOUYvFFQGo3O6mquck9JcKvTaIrf4iyu4qAWOIUVaNO1dfGt8
 9ZgA6n++PG5P4SpeKF+UqKLHMSeRNBkYkC/4CREtuSAiHZh/hmFg7kthM
 Obnp2rx7dJfSyCgV+NU4nl6MLXf+tdY5ZipyWo7RIcTl0RJ1LgH3F/zDt
 3TDwZc2scHuUdpS8F6zKHvE0XbPrI8XAqFQNQDsnxlscMArMTuHzRkReY
 lM5hL8I55B/1sRORS9qqlJ50Pas+KirWbDwxyioRRZACXSy0XlFimY0Q0
 FK4f7Dzvo+fvIBn1LNA/eFNZqkadJfCCe2D7KgBURL8/Kxhh6ApyVBypx g==;
X-CSE-ConnectionGUID: Es6DScGUQt20yegVPOSE/w==
X-CSE-MsgGUID: d1/5tisqTDuT+1lIlHY8NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="23504888"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="23504888"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:26:22 -0700
X-CSE-ConnectionGUID: PfYu8gQKQhqidoqpL0VU/g==
X-CSE-MsgGUID: urpKTXhBStiCTfgqpaYVFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="57709725"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.0.122])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:26:20 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tursulin@igalia.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com
Subject: [PATCH v3 i-g-t 0/2] benchmarks/gem_wsim: support gens without
 relocations and mmap fix
Date: Thu, 25 Jul 2024 14:26:10 +0200
Message-Id: <20240725122612.1290090-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

This patch series introduces two key enhancements to the gem_wsim
benchmark tool.

The first commit improves support for generations that do not use
relocations. It adopts the approach used in 'lib/igt_dummyload',
leveraging the 'intel_allocator' to compute offsets for these
generations. This change also introduces a shared 'struct vm' for
both i915 and Xe, which includes a 'vm_id' used by the 'intel_allocator'
for address assignment. This enhances the compatibility of 'gem_wsim'
with newer platforms running i915.

The second commit addresses an issue with the 'gem_mmap__wc' function,
which was found to be incompatible with discrete graphics cards.
The mapping approach from 'lib/igt_dummyload' has been adopted.

v2: Split mmap change to separate patch (Tvrtko)
v3: Correct brace balance, indentation (Kamil)
    Remove redundant 'ptr' variable

Marcin Bernatowicz (2):
  benchmarks/gem_wsim: Support gens without relocations
  benchmarks/gem_wsim: Fix mmap for discrete graphics cards

 benchmarks/gem_wsim.c | 111 +++++++++++++++++++++++++++++++-----------
 1 file changed, 83 insertions(+), 28 deletions(-)

-- 
2.31.1

