Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4166FCCD185
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 16:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E974510E858;
	Wed, 15 Oct 2025 16:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+cWOYRw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4D310E87A
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760544241; x=1792080241;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q9hYqxxG1ctBfnX8ivLrccB/rg+V9PloKFxJQB4ep/E=;
 b=j+cWOYRwqYw6yFDm4twE6qCIuKwEmx4AhBOI356pFZfxqDvNev/KmDqW
 jVWRdAEgR4RHUzaE66lVla7Kl8QbYZYy45j3HQs7T/Rj6KMSc0umjlFkv
 z5Jgj1BU9+DKc2mYQQ4E4Oh7vmmWj3Kni+ovan5GWgQM+QTI8FfruO6HH
 euXzFg2tJSP3j+C77k0Gru/rOQ5kB6WHoyEk+hO7EaWhmJgnm68dC2r04
 RlLlksIp3Aed73YyDD4UoCHwX0LEbWRnn140dURVIQv0bGIB4Jv+EO64B
 n4swjB+mg1nNVg1NxHjtV/cRILoeMANkUGeh4R1zpJKvjaVFWumHQit5b g==;
X-CSE-ConnectionGUID: vpo0OWh+RnG6v1tAP+v9UA==
X-CSE-MsgGUID: dMGj6gy1SJ6eNRlxOHwTYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62762749"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62762749"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 09:04:00 -0700
X-CSE-ConnectionGUID: KbU2r1pARfemBCpST64+7A==
X-CSE-MsgGUID: zBjJfVJPQ+S6q8yZKHIB7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182007847"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 09:03:59 -0700
Date: Wed, 15 Oct 2025 18:03:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com
Subject: Re: [PATCH i-g-t] tests/intel-ci : Add Xe Multigpu blocklist file
Message-ID: <20251015160356.gfqnwn5qd7jw66f6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com
References: <20251015064406.4076-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251015064406.4076-1-himanshu.girotra@intel.com>
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

Hi himanshu.girotra,
On 2025-10-15 at 12:14:06 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>

please remove space in subject before ':' so it will be:

[PATCH i-g-t] tests/intel-ci: Add Xe Multigpu blocklist file

> 
> Add Xe Multigpu Blocklist and unblock multigpu tests from core specific
> Blocklist to display the metrics on Grafana.
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel-ci/meson.build               | 1 +
>  tests/intel-ci/xe.bmg.core.blocklist.txt | 7 -------
>  tests/intel-ci/xe.multigpu.blocklist.txt | 5 +++++
>  3 files changed, 6 insertions(+), 7 deletions(-)
>  create mode 100644 tests/intel-ci/xe.multigpu.blocklist.txt
> 
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index ca50e93aa..0c3b79d51 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -21,6 +21,7 @@ intelci_files = [
>    'xe.lnl.core.blocklist.txt',
>    'xe.lnl.display.blocklist.txt',
>    'xe.lnl.eudebug.blocklist.txt',
> +  'xe.multigpu.blocklist.txt',
>    'xe.ptl.core.blocklist.txt',
>    'xe.ptl.display.blocklist.txt',
>    'xe-fast-feedback.testlist',
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
> index 25da760aa..15dbbf2b8 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -18,13 +18,6 @@ igt@xe_media_fill@media-fill
>  ##################################################################
>  igt@xe_pat@pat-index-xe3p-xpc
>  ##################################################################
> -# Expected skip on single card machines
> -##################################################################
> -igt@xe_peer2peer@.*
> -igt@xe_query@multigpu-query-.*
> -igt@xe_create@multigpu-create-massive-size
> -igt@xe_exec_basic@.*multigpu.*
> -##################################################################
>  # Expected skip - small bar not supported
>  ##################################################################
>  igt@xe_mmap@small-bar
> diff --git a/tests/intel-ci/xe.multigpu.blocklist.txt b/tests/intel-ci/xe.multigpu.blocklist.txt
> new file mode 100644
> index 000000000..387c3413e
> --- /dev/null
> +++ b/tests/intel-ci/xe.multigpu.blocklist.txt
> @@ -0,0 +1,5 @@
> +#####################################################
> +# Blocklist for Xe MuitiGPU tests
> +#####################################################
> +igt@(?!.*xe.*multigpu.*|xe_peer2peer.*).*

Please make it more readable, like:

igt@xe_.*@.*multigpu.*
igt@xe_peer2peer@.*

Regards,
Kamil

> +#####################################################
> -- 
> 2.40.0
> 
