Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192BFE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 14:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B224710E012;
	Wed, 18 Dec 2024 14:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxCS2L2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DAD10E012
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 14:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734531152; x=1766067152;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jVO0+Mu8edm5itvlzs+6r40w9axmoCoAMVEPr8BJu8w=;
 b=QxCS2L2GRQ7z2hakePhIRsboa1yv0js6HMsuw8AzAnaUQYkd0LcefB7n
 +COLvWWhMrNQ0qSEZ1vEVold/Nom1xP7VUOFdYWFFhuuvb9bv2qqJ5pk6
 hJYmNzqZebumlzKqaR2saMhVFYGDCOFYgyF0Hj5LSkwXr0leAfOQf2qEQ
 QxSTqkm3yGc24ycKCRAtrQYDAPMg3KgpfHlUq0DrsV4bzG/GqaddyByay
 LEYqH4EYwHOtkAZ0r+iRROzInQf5PlLyGbYu7Mg8/2lGbiDlhtd96jijs
 9C+UlLX8WlYZePVcpN0AdHT4SVQgTA4vdVzWVzML1c4V7YpujKDmONjaN w==;
X-CSE-ConnectionGUID: +eOU3xLVS0eLuVLWg9KsyQ==
X-CSE-MsgGUID: Tuni+vHYTQijw2Lj5jdZJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38682895"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="38682895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:08:20 -0800
X-CSE-ConnectionGUID: jMRMB2bZRVOxd23DPTuO/Q==
X-CSE-MsgGUID: qm1+66mqQ2CO2qHWnTgy5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98694587"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.195.20])
 ([10.245.195.20])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:08:19 -0800
Message-ID: <a65f8a1e-a386-4f68-85b8-e8538cd53eac@linux.intel.com>
Date: Wed, 18 Dec 2024 15:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] xe-ci: Disable xe_evict subtests that are expected
 to possibly fail
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, akshata.jahagirdar@intel.com
References: <20241218124519.4697-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241218124519.4697-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 12/18/2024 1:45 PM, Thomas Hellström wrote:
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

Saw many failures of these tests on BMG


Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
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
> +##################################################################
