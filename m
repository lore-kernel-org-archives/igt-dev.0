Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DAAC19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 12:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F33410E75B;
	Wed,  5 Mar 2025 12:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYPsrHxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7385010E759
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 12:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741176920; x=1772712920;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=70kN7oQPc0+QMmOdMZSwmEBAP9KK+/cAkG+GFF393Fs=;
 b=hYPsrHxubl/XrAWDkUEfbkQfjj52oD7ps4JiUdluFzz2juFKCpe76mRR
 hq7yQgiQDEaoLb+8lCT0TiOkbGF6kB3BvDnMx47QyYfo8Xpm1UkNhLpw4
 dQAVFanSg+tuTQI/UTdlhLoEW0Uu04ZtC9NzV/ZJv4CPNZAjHK5m7cGoZ
 kIWzLP7tPhdSxzyJ7H0Q5OSNVXYsbtTGdAa3iQaHo0MQ4EMyRSJyRqWtp
 q5cIFRLhgEpTlXTnQuauWR8nA/vsuH4SEHsSZGPA/vVNNw5QqdGl8K+/3
 ouPh7zb3xkmqQPUhZbKx+k4qLe0b6CQvQjgblogX0JZ0t9o1s8+Su2npv g==;
X-CSE-ConnectionGUID: WO+e8YMCTDa6bPaW4B9CLw==
X-CSE-MsgGUID: h3/SeX9mQO+qZZnJFbjOkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="67505253"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="67505253"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 04:15:20 -0800
X-CSE-ConnectionGUID: ReFEuaJsSoeoBMAZt1fpJg==
X-CSE-MsgGUID: hmvzkDCSQ3qyRj++z0g1qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="123614534"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 04:15:19 -0800
Date: Wed, 5 Mar 2025 13:15:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Group utilization
 tests and skip when no utilization data
Message-ID: <20250305121514.tojpbo7jlwbwcqt3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250304185640.1333849-1-marcin.bernatowicz@linux.intel.com>
 <20250304185640.1333849-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304185640.1333849-2-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-03-04 at 19:56:39 +0100, Marcin Bernatowicz wrote:
> Wrap all utilization-related subtests in an igt_subtest_group and add
> a fixture that ensures utilization data is available before running
> them.
> 
> Link: https://lore.kernel.org/r/20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  tests/intel/xe_drm_fdinfo.c | 122 ++++++++++++++++++++----------------
>  1 file changed, 67 insertions(+), 55 deletions(-)
> 
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 7330b4330..d18fe10d8 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -735,10 +735,6 @@ igt_main
>  	igt_subtest("basic-mem")
>  		basic_memory(xe);
>  
> -	igt_describe("Check if basic fdinfo content is present for engine utilization");
> -	igt_subtest("basic-utilization")
> -		basic_engine_utilization(xe);
> -
>  	igt_describe("Create and compare total and resident memory consumption by client");
>  	igt_subtest("mem-total-resident")
>  		mem_total_resident(xe);
> @@ -751,57 +747,73 @@ igt_main
[...]

> +	igt_subtest_group {
> +		igt_fixture {
> +			struct drm_client_fdinfo info = { };
> +
> +			igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
> +							 ARRAY_SIZE(engine_map),
> +							 NULL, 0));

Problem with require placed here is that it will trigger also
for all other test outside of group. That will clobber output.

> +			igt_require(info.num_engines);

Both these should be placed in each subtest wrapped in function
(see below) but imho this looks like a global requires at begin
of a test? Or am I missing something?

> +		}
> +

Create function like:

void require_utilization(int xe, ... engine_map)
{
	struct drm_client_fdinfo info = { };

	igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
					 ARRAY_SIZE(engine_map),
					 NULL, 0));
	igt_require(info.num_engines);
}

and use it in each utulization subtest like:

	igt_describe("Check if basic fdinfo content is present for engine utilization");
	igt_subtest("basic-utilization") {
		require_utilization(xe);
		basic_engine_utilization(xe);
	}

Regards,
Kamil

> +		igt_describe("Check if basic fdinfo content is present for engine utilization");
> +		igt_subtest("basic-utilization")
> +			basic_engine_utilization(xe);
> +

[...]

