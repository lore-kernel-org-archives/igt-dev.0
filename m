Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C53C28B2E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 11:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD6B10E3F8;
	Mon, 10 Mar 2025 11:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLQHbe40";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A34D10E3F7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 11:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741604744; x=1773140744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fLDanqFSmjTdnx8tbfyUkbiLIFJHDN4Ze+sUGqUZ4+I=;
 b=fLQHbe40Cr6jBVcPGpu+cCYHxKLZ6ohVLKmp2gcsBtYtuWFrdo4vEp+c
 AVNNFYIw9wpGWCqVUnTx8DPPjjrGbiGTV+JOVWod866S2W3qUbVGZMtws
 OkDx/I3EV+9Mi4jn66yh15AObP1L30M3FGxp466rD2Utquf7nS65+RTzD
 Pp8Z+IBXq9Kq3v7g7IUpTxMYj+UlQs8budXehwSybux8Uu40hgNs9lRa1
 WE9QjrKh1ATraJiUdm8GCot7voDcFIzpC2aOb8H2sWm1LRhyZsL/FMTHa
 /fksPt6wYvArC5/obrlgNwnRUZk7HnDk64DTPEnqS0P+D09G6f3egPI7b g==;
X-CSE-ConnectionGUID: HsfDqupbQKCEko3IhpkOfg==
X-CSE-MsgGUID: 5ztZ3S8ISM+OIiRbGNX32g==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53585388"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="53585388"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 04:05:41 -0700
X-CSE-ConnectionGUID: 3WD62TNhSyW9uKMjPU7HUQ==
X-CSE-MsgGUID: 7Mt+k0DtR66xe0lZrI7XVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="120479816"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 04:05:38 -0700
Date: Mon, 10 Mar 2025 12:05:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 jonathan.cavitt@intel.com
Subject: Re: [PATCH v8 i-g-t 0/3] Integrate kmemleak scans in igt_runner
Message-ID: <20250310110535.64wzfwpqbevxm4ws@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 jonathan.cavitt@intel.com
References: <20250307093426.90479-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250307093426.90479-1-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-03-07 at 10:34:23 +0100, Peter Senna Tschudin wrote:
> This patch series introduces a library to interact with the Linux kernel's
> kmemleak feature and integrates it into igt_runner. If kmemleaks are
> detected, they will be saved in the igt_runner results directory in a file
> named kmemleak.txt.

Thank you all, pushed.

Regards,
Kamil

> 
> During testing, the size of the kmemleak.txt file varied significantly.
> Larger files, up to 2 MB, were observed when running i915-BAT on a Tiger
> Lake DUT. Conversely, smaller files, typically under 100 KB, were generated
> when running Xe BAT on the same DUT.
> 
> Large files often contain numerous false positives, with the e1000 driver
> being a frequent source of noise. The time required for the Linux kernel to
> complete a kmemleak scan ranges from 5 to 60 seconds.  This variability can
> cause igt_runner to slow down by a factor of 4 when using the -keach
> option.
> 
> Transient leaks are a common phenomenon but are mostly undetected by the
> current version of this library. A typical transient leak occurs when
> pointers are reused, such as in linked lists. For example, if 10 calls to
> kmalloc are made, storing the address in the same variable and freeing only
> the final allocation, the previous 9 allocations become transient leaks.
> These leaks will go undetected unless the kernel thread performs continuous
> scanning.
> 
> To enable continuous scanning:
>  # echo scan=1 > /sys/kernel/debug/kmemleak
> 
> This configures the kmemleak kernel thread to scan the memory continuously
> with 1 second pauses. While this may increase the likelihood of detecting
> transient leaks, it can significantly impact system performance. In most
> cases, the igt_runner slowdown remains in the 4x range, but the kernel
> thread will consume 100% of a CPU core, as observed with tools like top.
> 
> When using scan=1, transient leaks that exist during an active scan will be
> detected. However, detection remains non-deterministic due to timing. It is
> recommended to reset the scan interval to the default value of 600 seconds
> after completing your tests.
> 
> v8:
>  - Update commit messages
>  - Fix new line and documentation issues
>  - Use fd instead of fp
>  - Use open() and close() instead of fopen() and fclose()
>  - Update error checking from (!fd) to (fd < 0)
>  - Add error check for lseek()
>  - Rename to KMEMLEAK_RESFILENAME
>  - Increase buf size to 16KB to speedup copy
>  - Rename the ifndef guard to RUNNER_KMEMLEAK_H
> 
> v7:
>  - Update scripts/run-tests.sh to support:
>    - igt_facts
>    - kmemleak integration
> 
> v6:
>  - Update copyright year to 2025
>  - Remove double newline from runner/executor.c
>  - Fix indentation issues caused by renaming igt_kmemleak* to
>    runner_kmemleak*
> 
> v5:
>  - move the code from lib/ to runner/
>  - rename igt_* to runner_*
>  - replace calls to igt_info() with calls to fprintf(stderr, ...)
>  - #includes on kmemleak.c:
>    - remove #include "igt_core.h"
>    - sort includes aplhabetically
>  - refacor the if statement for handling the optional argument to -k
>  - changed where 'k::' is located inside the string for getopt_long()
>  - fix one ident error
>  - use two separate assignments instead of making two at the same time
>  - replaced two calls to errf() by a single call with a multiline string
>  - commit message: explain the changes to runner unit testing
> 
> v4:
>  - Cleaned-up CC list
>  - Fixed typo in patch numbering
>  - Fixed Reviewed-by tag
>  - Reintroduced ',' after "results-path". It was removed by accident
>  - Changed unit testing for calling igt_kmemleak() with and without sync.
> 
> v3:
>  - Removed '>' from the end of one of the email addresses in the cc list
>  - Removed email addresses that no longer exist
> 
> v2:
>  - Pass igt_kmemleak_sync as a function variable to igt_kmemleak instead of
>    keeping it stored as a global variable
>  - igt_kmemleak_found_leaks(): Remove call to fseek() after close()
>  - igt_kmemleak_write(): Increase retry counter when writing 0 bytes
>  - igt_kmemleak_write(): change type to bool
>  - Unit Testing: Move the call to igt_kmemleak_init() to a fixture.
>  - igt_kmemleak_append_to(): Add brackets to the if statement for improved
>    readability
> 
> Cc: vitaly.prosyak@amd.com
> Cc: christian.koenig@amd.com
> Cc: alexander.deucher@amd.com
> Cc: jesse.zhang@amd.com
> Cc: harry.wentland@amd.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: ryszard.knop@intel.com
> Cc: lucas.demarchi@intel.com
> Cc: katarzyna.piecielska@intel.com
> Cc: jonathan.cavitt@intel.com
> 
> Peter Senna Tschudin (3):
>   runner/kmemleak: library to interact with kmemleak
>   runner/executor: Integrate igt_kmemleak scans
>   scripts/run-tests.sh: Add support to kmemleak reports and igt_facts
> 
>  runner/executor.c             |  26 +++-
>  runner/kmemleak.c             | 277 ++++++++++++++++++++++++++++++++++
>  runner/kmemleak.h             |  16 ++
>  runner/meson.build            |   9 ++
>  runner/runner_kmemleak_test.c | 267 ++++++++++++++++++++++++++++++++
>  runner/runner_tests.c         |  13 +-
>  runner/settings.c             |  31 +++-
>  runner/settings.h             |   2 +
>  scripts/run-tests.sh          |  10 +-
>  9 files changed, 645 insertions(+), 6 deletions(-)
>  create mode 100644 runner/kmemleak.c
>  create mode 100644 runner/kmemleak.h
>  create mode 100644 runner/runner_kmemleak_test.c
> 
> -- 
> 2.34.1
> 
