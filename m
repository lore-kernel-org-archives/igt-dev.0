Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0F3C83030
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 19:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6C210E013;
	Thu,  3 Jul 2025 19:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7nt5m32";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6A310E013
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 19:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751570725; x=1783106725;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q4A47DwCIWSKT30dK2Ozb6r2PwO2cmUbtz15tndCaA8=;
 b=i7nt5m32X1JtHzRE0gEDLJwQaV293byLEeLIZG/GaEsDT7KwijSvhEMZ
 gtNwVMoKhRbtRmxFb+7HAnImjfDpnSG0OL96s61Ak2AqdAIKdfSU6DD7O
 aaNKQSInm+Mzc03BZW+QPYTTxlaR4sieLIcSYA4+tZZog1kyZsUyJ3YW+
 1HKvbEbuGDklpN+EPORtzj15Jo9T9pCRk8ZqmASzCjThJqoHnxn+PXdVl
 ZRQT+isNXhEszmy+vRkk3wZoPQBmR7xU73DhlSF6kTp4yO1SP24+jQija
 Q016779xbvxj5RT6YT7iGQ+x+AdFr2lGBZv9NE7ZlflmJmUn2dmkZ5JtU g==;
X-CSE-ConnectionGUID: FGSrYpNPTpG+PSNfGvuFAQ==
X-CSE-MsgGUID: QTokZvGWSayuTpcVVew+5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57684465"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="57684465"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:25:25 -0700
X-CSE-ConnectionGUID: zB205jqYQKm8r/5GNJIVZg==
X-CSE-MsgGUID: VSFfBSZ8QwiC1H/igUlWpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="178115125"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:25:23 -0700
Message-ID: <16a59eea-100c-4198-91e4-8e5e6ece34b5@linux.intel.com>
Date: Thu, 3 Jul 2025 21:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/2] Add post-gpukmod-unbind igt_hook
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250703150304.101208-1-peter.senna@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250703150304.101208-1-peter.senna@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Sorry Lucas and Gustavo for the typo in your email address...

On 7/3/2025 5:03 PM, Peter Senna Tschudin wrote:
> his patch introduces a new IGT hook: IGT_HOOK_POST_GPUKMOD_UNBIND
> (post-gpukmod-unbind), designed to facilitate kmemleak scans in our CI
> workflows.
> 
> As suggested by Lucas de Marchi, a useful strategy for detecting memory
> leaks is to run kmemleak scans both before binding and after unbinding
> the GPU kernel module. This patch adds support for the latter scenario,
> enabling automated scans immediately after the GPU module is unbound.
> 
> 
> Example test-list:
>  igt@xe_module_load@load
>  igt@core_hotunplug@unbind-rebind
>  igt@xe_module_load@unload
> 
> Usage Example:
>  IGT_PING_HOSTNAME='10.211.176.1'
>  IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
>  ./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120 \
>    --overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4 \
>    --use-watchdog --inactivity-timeout 90 \
>    --abort-on-monitored-error=ping,taint --disk-usage-limit=10M \
>    --facts --hook 'post-gpukmod-unbind:OUTF=/tmp/kmemleak-post-unbind && \
>                    echo $IGT_HOOK_TEST_FULLNAME $IGT_HOOK_TEST $IGT_HOOK_SUBTEST >> $OUTF && \
>                    echo scan > /sys/kernel/debug/kmemleak && \
>                    cat /sys/kernel/debug/kmemleak >> $OUTF' \
>    --test-list ~/igt/test-list \
>    /home/gta/igt/0
> 
> Known Limitations: In certain cases, such as when running
> igt@core_hotunplug@unbind-rebind, the unbind operation is explicitly
> managed by igt_runner if the module is already loaded. However, if the
> unbind occurs outside of igt_runner, the hook will not be triggered and
> the scan will not run.
> 
> Cc: Gustavo Sousa <gustavo.sousa@linux.intel.com>
> Cc: Lucas de Marchi <lucas.demarchi@linux.intel.com>
> 
> Peter Senna Tschudin (2):
>   igt_core: igt_hook_get_pointer() for external hooks
>   lib/igt_kmod: Add IGT_HOOK_POST_GPUKMOD_UNBIND
> 
>  lib/igt_core.c | 12 ++++++++++++
>  lib/igt_core.h |  9 +++++++++
>  lib/igt_hook.c |  5 +++++
>  lib/igt_hook.h |  1 +
>  lib/igt_kmod.c |  7 +++++++
>  5 files changed, 34 insertions(+)
> 

