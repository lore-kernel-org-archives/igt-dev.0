Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E8AC52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 12:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD1810E08D;
	Thu, 22 Aug 2024 12:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Et6dVIa/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6629E10E08D
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724330877; x=1755866877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zYz03SO8nyFZdGpLAxaMo4bJlYXn/mac0N361qMZMWc=;
 b=Et6dVIa/c6HH7UhAw9hxTe3hARsOIaZal8Pu9lDjEbLZ17qGzQLC07yH
 /xpAZzAYwISHa954MX5En519JVu2sDdqhNmIM23znxQ7jOMB840H1P4L/
 BYGpTGn9I7IbX3OTsHq705ys61MqsYLAKCSQETw2sQcurvyOfjkx9TXrM
 ecoNbV33gZISrpyMsmuygYV6O6JjvgcO3rM2WvkX/04wZPci0FLR8kwG/
 /NfXAxWAwqUYn9fkE8GH1yCE7gUHkzuR9XdIbLS9zS5ctJ8l3LivbiILK
 Iog0bDlmz+Knyj4v8IhbycvQykq5nCMW50Dl0F7ppldQJJFg9ssWvY/sH Q==;
X-CSE-ConnectionGUID: ufsIf24LSG2QqC27AxPajA==
X-CSE-MsgGUID: +DEeQYExS9eMypIqBfF7Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="25636487"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="25636487"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:47:56 -0700
X-CSE-ConnectionGUID: lOg/nxEXTbabaU15AQ8N8g==
X-CSE-MsgGUID: pjBe/mw9Rj2r9x9XR8Jcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="92231741"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.123])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:47:52 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jann Horn <jannh@google.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v3 0/3] Introduce memory mapping tests
Date: Thu, 22 Aug 2024 14:47:41 +0200
Message-ID: <20240822124744.13054-1-krzysztof.niemiec@intel.com>
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

v3:
 - Fix a few style inaccuracies.

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

 tests/intel/gem_mmap_offset.c | 281 ++++++++++++++++++++++++++++++++++
 1 file changed, 281 insertions(+)

-- 
2.45.2

