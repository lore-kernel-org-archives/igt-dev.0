Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1D2CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 16:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5F910E1CF;
	Thu, 21 May 2026 16:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+/FS52C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838F110E1CF
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 16:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779382139; x=1810918139;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4XQEoi9LPlI4t5FwDv25mzgIpynl28k5ytP2duApyJ4=;
 b=N+/FS52CW6bKDAQ1eRQ9C5ioQxabw7iXX7/KCDmi6IhSrpacy6Tnb90Z
 sJFNwvOxjRgUfvDpaBychemRqGaX6wbKKPjdjvqZAPvFqxkkDitgI9+2k
 dX5RTkiIBmgus3NCG6puaRHRtgFKSf57Zy+XM4qoayYB5cVmi7mLCmDoN
 kHHhM0RSzu+auNLmH85LEbm4XOa6wBQACKB70KAVvPeqcGmu2tzTEbBg3
 emu95wHdVm6ipPiKhZdxBJyAC7SqiP2B7K6gvjQZA/xXppwvEoWG8unnq
 BJnx4PjvHRanaV+/crYNRoG5066WguHbGjVX3mETLI+oy5vhEc7UL0gii A==;
X-CSE-ConnectionGUID: iJyTaefcT0OcEiY75Ni6pg==
X-CSE-MsgGUID: /TsoP0j/QMCsSniZ8H1MJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80339380"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="80339380"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 09:48:58 -0700
X-CSE-ConnectionGUID: VzI5NpVRTjOJ9+sxER/Ksw==
X-CSE-MsgGUID: sIydTNEYT0mlzg1v/r5wng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="236156886"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 09:48:57 -0700
Date: Thu, 21 May 2026 18:48:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] tests/xe_compute: Skip SVM tests on
 platforms without fault mode vm
Message-ID: <20260521164854.v2vynilydtc7rh7b@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>
References: <20260521072536.796712-4-zbigniew.kempczynski@intel.com>
 <20260521072536.796712-5-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521072536.796712-5-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2026-05-21 at 09:25:38 +0200, Zbigniew Kempczyński wrote:
> Group SVM tests and skip them if platform on which they are executed
> doesn't support fault mode vm.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_compute.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 406d708bcd..2f70f22910 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -688,14 +688,19 @@ int igt_main()
>  	igt_subtest("compute-square-userenv-large-buffer")
>  		test_compute_square_userenv(xe, LARGE_BUFFER);
>  
> -	igt_subtest("compute-square-userenv-isvm")
> -		test_compute_square_userenv(xe, INPUT_IN_SVM);
> +	igt_subtest_group() {
> +		igt_fixture() {
> +			igt_require(!xe_supports_faults(xe));
> +		}

Fixture in a subtest groups, while possible, could create
a noise when a failure happens outside this group. There
could be then a message 'requirement failed', unrelated
to failed subtest.

Thats why in such cases it is better to have igt_require()
repeated in each subtest.

Regards,
Kamil

> +		igt_subtest("compute-square-userenv-isvm")
> +			test_compute_square_userenv(xe, INPUT_IN_SVM);
>  
> -	igt_subtest("compute-square-userenv-osvm")
> -		test_compute_square_userenv(xe, OUTPUT_IN_SVM);
> +		igt_subtest("compute-square-userenv-osvm")
> +			test_compute_square_userenv(xe, OUTPUT_IN_SVM);
>  
> -	igt_subtest("compute-square-userenv-iosvm")
> -		test_compute_square_userenv(xe, INPUT_IN_SVM | OUTPUT_IN_SVM);
> +		igt_subtest("compute-square-userenv-iosvm")
> +			test_compute_square_userenv(xe, INPUT_IN_SVM | OUTPUT_IN_SVM);
> +	}
>  
>  	igt_fixture()
>  		drm_close_driver(xe);
> -- 
> 2.43.0
> 
