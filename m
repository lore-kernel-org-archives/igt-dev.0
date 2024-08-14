Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531DFC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 13:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D77710E47D;
	Wed, 14 Aug 2024 13:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvhU4b7R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BCA10E47D
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723641888; x=1755177888;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PEhy2TTXXeks/9su2yTe7TfpE2mrDresvAUKkF2tlTM=;
 b=gvhU4b7R8G/xrUpr0fplkcVq5tb53fdGQ4mFQxdYfArf/IlC3L3aZJ/C
 Oj3puGJ/YMsvyqfQVl8CQ9ThnuwPLvNuSsi+VdvTyAwVTMfzTb8WMRzXk
 A2iBtPliGFArtFjkBT/tdFfr9Viie5tPngLTWYciawnbONw4WEfXu7+nl
 D2Jw93auZbWUdhuc5Sqiwus9C4M1d3aLLLa1N8VLmmdkBHjRE27qeVhOt
 fZmPiKETB3rndXhgB0mbOYV9WtN1FCA6EFjO/V2sEvDse6pOz1s2m/308
 2RLJyDDXzzaq24C0fghNrTOqs63XgZdCLPiJMrCMme33BZVt2S2Scwm1y A==;
X-CSE-ConnectionGUID: dDA1KapjSRGY2l8/4J2CkQ==
X-CSE-MsgGUID: v4IUlICBTomuwanz724YQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33243362"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="33243362"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:24:47 -0700
X-CSE-ConnectionGUID: CDp4uiq2RE+XlDCnj9vkwA==
X-CSE-MsgGUID: vxP4IlpdQXWY7XS5c3VVIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="58981785"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.89])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:24:43 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jann Horn <jannh@google.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 0/3] Introduce memory mapping tests
Date: Wed, 14 Aug 2024 15:24:01 +0200
Message-ID: <20240814132404.18392-1-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

Hi,

This series introduces various tests related to memory mapping.

partial-remap (patch 1), mmap-boundaries (patch 2) and mmap-unmap (patch
3) tests were developed based on test cases made by Jann Horn.

partial-map and partial-unmap (both in patch 1) were developed to
replicate Mesa usage, as suggested by Lionel Landwerlin.

This series has been used to test these patches:

1ac5167b3a90 ("drm/i915/gem: Adjust vma offset for framebuffer mmap offset")
8bdd9ef7e9b1 ("drm/i915/gem: Fix Virtual Memory mapping boundaries calculation")

and 

https://patchwork.freedesktop.org/series/136981/

Thanks
Krzysztof

Chris Wilson (1):
  i915/gem_mmap_offset: Partial mmap and munmap

Krzysztof Niemiec (2):
  tests/intel/gem_mmap_offset: Introduce mmap-boundaries test
  tests/intel/gem_mmap_offset: Introduce mmap-unmap test

 tests/intel/gem_mmap_offset.c | 279 ++++++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)

-- 
2.45.2

