Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA61E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 14:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BC410E440;
	Wed, 18 Dec 2024 14:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="By4xbJQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB58410E440
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 14:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734531535; x=1766067535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YwDCzhdsp+5PvTknQIhNic3tP5a9YXPvzGo2O88A5hE=;
 b=By4xbJQjk3FhtOsg9GIAp5Z+P8PLpDyIvNkGl+6nrWANlJbuvWp79/EH
 6o9jsqClfN2k2tuHKesgGlUneglD6ehv8q6NMOdAI0OTSgHtnSGjtXP6X
 e0Hpu1TqTdWUrMlTb7Hv897LYvAvLL4itfRh86bAD+k5PvaUyfYrzzTvr
 QWCUuGJ058BGPogSC59g5Fd8Q8i/yEOCGPPi92kv2Z2/NeWg4SvQI3iZJ
 ZKIaNI1/gMyU1FL8i0EiQlWtZw25NLklFXpTFUi3cZ7hNrQDc+cucLA7S
 JtPbt1RostvJ4bT3Ld6TeVczDAUgD5PcCSoeAcwwRkgNmoYO1YzPCVu9X g==;
X-CSE-ConnectionGUID: hhJn9mgcTemmF6CHqinsGA==
X-CSE-MsgGUID: u0FoAmEsQLOtErQ3yq5OfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38944232"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="38944232"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:18:55 -0800
X-CSE-ConnectionGUID: RUNT3r57RKu+tA/Aac+Opg==
X-CSE-MsgGUID: GAiA3u9IRLeHSxLWnb0lnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102484883"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:18:54 -0800
Date: Wed, 18 Dec 2024 15:18:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 akshata.jahagirdar@intel.com
Subject: Re: [PATCH i-g-t] xe-ci: Disable xe_evict subtests that are expected
 to possibly fail
Message-ID: <20241218141839.cosbnxdmkg6eeh2j@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 akshata.jahagirdar@intel.com
References: <20241218124519.4697-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218124519.4697-1-thomas.hellstrom@linux.intel.com>
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

Hi Thomas,
On 2024-12-18 at 13:45:19 +0100, Thomas Hellström wrote:
> Threads may compete over VRAM resources, and since there is no
> serialization in TTM, threaded evict tests may have a high
> possibility of failing.
> 
> Disable such tests until we have a working exhaustive eviction
> implementation in place.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <akshata.jahagirdar@intel.com>

Looks reasonable, please only change prefix into
tests/intel-ci/xe*:

also consider writing it a little shorter, like:
[PATCH i-g-t] tests/intel-ci/xe*: Disable few xe_evict subtests

With this
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Please also see one nit below.

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 5 -----
>  tests/intel-ci/xe.blocklist.txt          | 7 +++++++
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 727be9230..f16ca9188 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -263,19 +263,14 @@ igt@xe_exec_threads@threads-mixed-shared-vm-basic
>  igt@xe_exec_threads@threads-mixed-fd-basic
>  igt@xe_exec_threads@threads-mixed-userptr-invalidate
>  igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
> -igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
>  igt@xe_evict@evict-beng-small
>  igt@xe_evict@evict-beng-small-cm
>  igt@xe_evict@evict-beng-small-external
>  igt@xe_evict@evict-beng-small-external-cm
>  igt@xe_evict@evict-beng-small-multi-vm
>  igt@xe_evict@evict-cm-threads-small
> -igt@xe_evict@evict-mixed-threads-small
> -igt@xe_evict@evict-mixed-threads-small-multi-vm
>  igt@xe_evict@evict-small
>  igt@xe_evict@evict-small-cm
>  igt@xe_evict@evict-small-external
>  igt@xe_evict@evict-small-external-cm
>  igt@xe_evict@evict-small-multi-vm
> -igt@xe_evict@evict-small-multi-vm-cm
> -igt@xe_evict@evict-threads-small
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index e29e745a0..ed9e572a5 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -90,3 +90,10 @@ igt@sriov_basic@enable-vfs-autoprobe-on$
>  igt@sriov_basic@enable-vfs-bind-unbind-each$
>  igt@sriov_basic@bind-unbind-vf$
>  ##################################################################
> +# Exclude xe_evict tests that are not expected to succeed
> +# due to missing TTM exhaustive eviction
> +##################################################################
> +igt@xe_evict@*-multi-vm-cm*
> +igt@xe_evict@*-threads-*
> +# igt@xe_evict@*-cm* # Rebind and VM_BIND may race.

Did you mean that
igt@xe_evict@evict-cm-threads-small

should stay in BAT?

Regards,
Kamil

> +##################################################################
> -- 
> 2.47.1
> 
