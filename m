Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADABC3ABB0
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 09:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF0510E3A9;
	Mon,  5 May 2025 09:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5t21j9s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A0F10E3A9
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746436684; x=1777972684;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=I30bTFgulgeB6lcTQmRM7J5QoNoSzsP4YxEpe5+efnM=;
 b=h5t21j9sf0tp9ip0VEW5E4FD5sbogaRK2tqG9LgbrUH6fhWSsrjGhjL8
 MEHTC2qB6Tnf2KzrdzDA51Q5QCXPv39uh/XjWl7SpiHemRdWDp0zXVft8
 ZMlASgNv+d2oALtbTehnrHeDfsBkCc5OouqxA/+JOhavKPX6iTTkFJ0/q
 qa+RR1XeeEq3kOzAdCyeD0ouaNfxuMX09Vba4oOd49/1KxLKO7PLfU5bX
 wUyLlNiLtOwqMoXYMh7gY2O8/tV65YQ48pbpZP/c1VbHq7w+NtGkXTEiy
 +OJAOb0rhdbEcDTWFdcSephRTxfjpn3OQdQcSi3p0siKZNpmcZJUJqcQ4 g==;
X-CSE-ConnectionGUID: HPUQsS2RTCaodwaOrr181Q==
X-CSE-MsgGUID: wNQftQ2vShSvvxfp+OrBpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="59427958"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="59427958"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 02:18:03 -0700
X-CSE-ConnectionGUID: LgH+6CX7RLGCsP4ruNo4Bw==
X-CSE-MsgGUID: OHLTOgG5R1SO5dgol7OVcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="139210287"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.113.30])
 ([10.245.113.30])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 02:18:02 -0700
Message-ID: <c7105616-5074-45a9-8ed5-0b3cd981f5cb@linux.intel.com>
Date: Mon, 5 May 2025 11:17:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci/xe.blocklist: remove device_reset
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250428113356.17810-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250428113356.17810-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 4/28/2025 1:33 PM, Kamil Konieczny wrote:
> device_reset test is driver agnostic so remove it from Xe
> blocklist.
> 
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 541917393..1c43b7a26 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -37,7 +37,6 @@ igt@xe_live_ktest@xe_bo_shrink
>   # Exclude all other non-Xe tests
>   ##################################################################
>   igt@debugfs.*
> -igt@device_reset

Probably we still want to block the igt@device_reset@.*reset-bound cases ?

>   igt@drm_read
>   igt@dumb.*
>   igt@prime_.*

