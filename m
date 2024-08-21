Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C95C52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 14:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3304F10E5EA;
	Wed, 21 Aug 2024 14:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jV8DygtL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B6510E5EA
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724249199; x=1755785199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SAfeToi0otqM69sApBQpBT6C8pLW0VjGoLgHJ9Za5M4=;
 b=jV8DygtLo/NycMI/hU6IDEDPUOEhXmQxKDnlotBV+FdbvPo2/9l41FRU
 eWu5F4zITDu97ziVn2+WbZ9bAN9IPMXrbvoN/H/LnqE24R7INrGf76d7d
 J8UmrkeNoTC1EZ5ja4GduzOAjBDg+LUX8n311cW+c1Cd42Yqm72bPW+vI
 YNyOQhOWwqknWrI+ektF5KYgAFJloouVrXi9mYRa/WNTkw9NgdjMoaKtj
 sf5CqLlT810hQDX0SoJRMK4hYD63X+i8ohNi+SlSCiMfZh5zVxrTzrQpy
 ArqBgMClXb1TuBI3Y3Ny7tBFMAHieH9GNHI2+7vpQlhwfPnKBfgPD+Dub Q==;
X-CSE-ConnectionGUID: ILtlQ7MJT0Co+DNWO/p3DA==
X-CSE-MsgGUID: SkHPHNNPRNqnS1tr/WYmlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22142364"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22142364"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:05:56 -0700
X-CSE-ConnectionGUID: Ir1bsi16SViHKQfOTsgWxQ==
X-CSE-MsgGUID: uqm4nAuFRoCMSjr01nbMBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61859786"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.38])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:05:52 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jann Horn <jannh@google.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 0/3] Introduce memory mapping tests
Date: Wed, 21 Aug 2024 15:59:40 +0200
Message-ID: <20240821135943.31340-1-krzysztof.niemiec@intel.com>
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

partial-mmap and partial-unmap (both in patch 1) were developed to
replicate Mesa usage, as suggested by Lionel Landwerlin.

This series has been used to test these patches:

1ac5167b3a90 ("drm/i915/gem: Adjust vma offset for framebuffer mmap offset")
8bdd9ef7e9b1 ("drm/i915/gem: Fix Virtual Memory mapping boundaries calculation")

and

https://patchwork.freedesktop.org/series/136981/

Changelog:

v2:
 - Wrap uint64_t to pointer casts in from_user_pointer() so that the
   tests compile on 32-bit machines,
 - Fix duplicate handle assignment in mmap-unmap,
 - Prevent the tests from failing, if a map call fails - it might
   succeed on another offset type,
 - Swap mmap fail check and memory access in mmap-unmap to prevent a
   segfault,
 - Use gem_close() at the end of tests.

Thanks
Krzysztof

Chris Wilson (1):
  tests/intel/gem_mmap_offset: Partial mmap and munmap

Krzysztof Niemiec (2):
  tests/intel/gem_mmap_offset: Introduce mmap-boundaries test
  tests/intel/gem_mmap_offset: Introduce mmap-unmap test

 tests/intel/gem_mmap_offset.c | 285 ++++++++++++++++++++++++++++++++++
 1 file changed, 285 insertions(+)

-- 
2.45.2

