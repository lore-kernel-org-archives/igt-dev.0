Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DE2C02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 10:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1748610E2A4;
	Mon, 27 Jan 2025 10:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TjgKnfp9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A9010E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 10:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737975264; x=1769511264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JXu3C72/UuqamIjgVECrzCljBocR+l01mJkoHTld7vw=;
 b=TjgKnfp9EyGE+k+U1W40BfRRacENcr1RlWr/I8dOsPgyE2Jl+l5c/3az
 GSZBh9sPkLIS1XnoowubUy777jekP+lc9N662/m/I6rWClhPvjfr8It8K
 FTjBGPNLkwTKuHCebm1ujAAkO5Y5Rz7dktRL9tmB/LV7AAib68Fa1k5po
 /F8oxfIczmghPIKWWQJ3YJ2h1VhfgzZ0ooP7n2qxeKMqYxA914ZZjLIUU
 7mN8eqz8HPc8DMiAWXefxN++Y0AG/NCcFscQgNnXit8b5k+f62qo5LsvD
 D2zDJMt9gZFeMM5Mx3uu9xqpHTmzfU4AamGFhjsKErTojUpdcJUPehtyZ Q==;
X-CSE-ConnectionGUID: MQ6kq8cqRQ6CSIs/BE+hcg==
X-CSE-MsgGUID: x8WIQIjxSd+XjuWkxv6EoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="48933362"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="48933362"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 02:54:23 -0800
X-CSE-ConnectionGUID: VL6cC8aJSJmGMlACbKesEQ==
X-CSE-MsgGUID: yGJp5xzlRMCCyDNdmSKALQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145620413"
Received: from nwochtma-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.83.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 02:54:20 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>, stylon.wang@amd.com,
 Rodrigo.Siqueira@amd.com, ramadevi.gandi@intel.com, ryszard.knop@intel.com,
 sameer.lattannavar@intel.com, lucas.demarchi@intel.com,
 jani.saarinen@intel.com, katarzyna.piecielska@intel.com,
 matthew.d.roper@intel.com, gregory.f.germano@intel.com,
 clinton.a.taylor@intel.com, jianshui.yu@intel.com,
 balasubramani.vivekanandan@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v2 0/2] Integrate kmemleak scans in igt_runner
Date: Mon, 27 Jan 2025 11:53:39 +0100
Message-Id: <20250127105341.181527-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121112944.115491-1-peter.senna@linux.intel.com>
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
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

This patch series introduces a library to interact with the Linux
kernel's kmemleak feature and integrates it into igt_runner. If
kmemleaks are detected, they will be saved in the igt_runner results
directory in a file named kmemleak.txt.

During testing, the size of the kmemleak.txt file varied significantly.
Larger files, up to 2 MB, were observed when running i915-BAT on a
Tiger Lake DUT. Conversely, smaller files, typically under 100 KB, were
generated when running Xe BAT on the same DUT.

Large files often contain numerous false positives, with the e1000
driver being a frequent source of noise. The time required for the
Linux kernel to complete a kmemleak scan ranges from 5 to 60 seconds.
This variability can cause igt_runner to slow down by a factor of 4
when using the -keach option.

Transient leaks are a common phenomenon but are mostly undetected by
the current version of this library. A typical transient leak occurs
when pointers are reused, such as in linked lists. For example, if 10
calls to kmalloc are made, storing the address in the same variable
and freeing only the final allocation, the previous 9 allocations
become transient leaks. These leaks will go undetected unless the
kernel thread performs continuous scanning.

To enable continuous scanning:
 # echo scan=1 > /sys/kernel/debug/kmemleak

This configures the kmemleak kernel thread to scan the memory
continuously with 1 second pauses. While this may increase the
likelihood of detecting transient leaks, it can significantly impact
system performance. In most cases, the igt_runner slowdown remains in
the 4x range, but the kernel thread will consume 100% of a CPU core,
as observed with tools like top.

When using scan=1, transient leaks that exist during an active scan
will be detected. However, detection remains non-deterministic due
to timing. It is recommended to reset the scan interval to the
default value of 600 seconds after completing your tests.

v2:
 - Pass igt_kmemleak_sync as a function variable to igt_kmemleak instead of
   keeping it stored as a global variable
 - igt_kmemleak_found_leaks(): Remove call to fseek() after close()
 - igt_kmemleak_write(): Increase retry counter when writing 0 bytes
 - igt_kmemleak_write(): change type to bool
 - Unit Testing: Move the call to igt_kmemleak_init() to a fixture.
 - igt_kmemleak_append_to(): Add brackets to the if statement for improved
   readability

CC: stylon.wang@amd.com
CC: Rodrigo.Siqueira@amd.com>
CC: ramadevi.gandi@intel.com
CC: ryszard.knop@intel.com
CC: sameer.lattannavar@intel.com
CC: lucas.demarchi@intel.com
CC: jani.saarinen@intel.com
CC: katarzyna.piecielska@intel.com
CC: matthew.d.roper@intel.com
CC: gregory.f.germano@intel.com
CC: clinton.a.taylor@intel.com
CC: jianshui.yu@intel.com
CC: balasubramani.vivekanandan@intel.com
CC: jonathan.cavitt@intel.com

Peter Senna Tschudin (2):
  lib/igt_kmemleak: library to interact with kmemleak
  runner/executor: Integrate igt_kmemleak scans

 lib/igt_kmemleak.c       | 274 +++++++++++++++++++++++++++++++++++++++
 lib/igt_kmemleak.h       |  16 +++
 lib/meson.build          |   1 +
 lib/tests/igt_kmemleak.c | 267 ++++++++++++++++++++++++++++++++++++++
 lib/tests/meson.build    |   1 +
 runner/executor.c        |  25 +++-
 runner/runner_tests.c    |  18 ++-
 runner/settings.c        |  31 ++++-
 runner/settings.h        |   2 +
 9 files changed, 630 insertions(+), 5 deletions(-)
 create mode 100644 lib/igt_kmemleak.c
 create mode 100644 lib/igt_kmemleak.h
 create mode 100644 lib/tests/igt_kmemleak.c

-- 
2.34.1

