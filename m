Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57BDC44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 09:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A48810E14F;
	Wed, 15 Jul 2026 09:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pp1NJALe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB41510E14B
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784106772; x=1815642772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jzFqtz+jwsoU7cfmQJTtbQqq3URNDhIzST1RM7fvUsM=;
 b=Pp1NJALekMXtyZJOVuqzVYUa6aqjnSYC1VgtSzu9Wd9naHMSRvtCETpI
 oRdG7O64JGRvyGCv29k7Hwa+yr371NM4+EuxS3Spj14gObaSNd48GxrdM
 BwyKkyOSeJNhMoVwRp7wYRs48xbov8QyNuD8qgOod7P+9ixH0gEZL7xX1
 ccpB1Fm2/aHuOTcgS/3U3Si6DJQlBYpOVc4GORDumohthvRCi9rKYuJ4o
 Y5ad3t15IPQTzGjTXTE/Gtmvy8VhGy5hW5nrhWwiyKLVPamByHmL9xS+F
 iX5tJUxyhWm+YtHihR6ij/gDZqZ/2mwhhRKGeOLvrafm10HKZnsCe/iia A==;
X-CSE-ConnectionGUID: K3difrjjREqLj3KY7sydzg==
X-CSE-MsgGUID: pIwynChsRquADt6J+g1HrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84619953"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84619953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 02:12:51 -0700
X-CSE-ConnectionGUID: tYJB1jCNRNuolE6R/0n/rw==
X-CSE-MsgGUID: I++FPVUmRz2ZQBf3Qy6OLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255002442"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:12:49 -0700
Date: Wed, 15 Jul 2026 11:12:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 VijayaKumar Nallamothu <vijayakumar.nallamothu@intel.com>,
 Piotr Rudnicki <piotr.rudnicki@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel-ci: Block EUdebug-related tests on
 VF/VM runs
Message-ID: <20260715091247.fjffb4zcbsnewnl5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 VijayaKumar Nallamothu <vijayakumar.nallamothu@intel.com>,
 Piotr Rudnicki <piotr.rudnicki@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20260713165312.413941-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713165312.413941-1-jakub1.kolakowski@intel.com>
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

Hi Jakub,
On 2026-07-13 at 16:53:12 +0000, Jakub Kolakowski wrote:
> SR-IOV and EUdebug are mutually exclusive features.
> Block EUdebug tests on SR-IOV VF/VM runs since they will
> inevitably skip.
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: VijayaKumar Nallamothu <vijayakumar.nallamothu@intel.com>
> Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>  tests/intel-ci/xe.sriov-vf.blocklist.txt | 8 ++++++--
>  tests/intel-ci/xe.sriov-vm.blocklist.txt | 9 +++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> index 4a19aa943..7b5bd2165 100644
> --- a/tests/intel-ci/xe.sriov-vf.blocklist.txt
> +++ b/tests/intel-ci/xe.sriov-vf.blocklist.txt
> @@ -9,7 +9,6 @@ igt@xe_module_load@.*
>  # tests applicable for PF only
>  #
>  igt@sriov_basic.*
> -igt@xe_eudebug_sriov.*
>  igt@xe_pmu@.*fn-engine-activity.*
>  igt@xe_sriov.*
>  #
> @@ -60,4 +59,9 @@ igt@xe_query@.*cs-cycles
>  #
>  # Tests that need to be executed in VM instead.
>  #
> -igt@xe_live_ktest.*
> \ No newline at end of file
> +igt@xe_live_ktest.*
> +#
> +# Tests related to EUdebug

Please add a reason here, why they are blocked.

> +#
> +igt@xe_eudebug.*
> +igt@xe_exec_sip_eudebug@.*
> diff --git a/tests/intel-ci/xe.sriov-vm.blocklist.txt b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> index 6271b1a70..0a02abaa8 100644
> --- a/tests/intel-ci/xe.sriov-vm.blocklist.txt
> +++ b/tests/intel-ci/xe.sriov-vm.blocklist.txt
> @@ -10,7 +10,6 @@ igt@xe_ccs@suspend-resume
>  # tests applicable for PF only
>  #
>  igt@sriov_basic.*
> -igt@xe_eudebug_sriov.*
>  igt@xe_pmu@.*fn-engine-activity.*
>  igt@xe_sriov.*
>  #
> @@ -57,4 +56,10 @@ igt@xe_pmu@gt-frequency
>  #
>  # The feature query_cs_cycles is not supported on VF
>  #
> -igt@xe_query@.*cs-cycles
> \ No newline at end of file
> +igt@xe_query@.*cs-cycles
> +#
> +# Tests related to EUdebug

Same here.

Regards,
Kamil


> +#
> +igt@xe_eudebug.*
> +igt@xe_exec_sip_eudebug@.*
> +igt@xe_live_ktest@xe_eudebug
> -- 
> 2.43.0
> 
