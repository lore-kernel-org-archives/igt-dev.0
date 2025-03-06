Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E51BC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 10:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F288E10E8C1;
	Thu,  6 Mar 2025 10:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FkLr6NG9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6FF10E8C1
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 10:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741258572; x=1772794572;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lIdSg20ppZtBrUugyORMSg2ZEG38SqoyD2mLp3BG52A=;
 b=FkLr6NG9aL6mXdjS8ZE7YQl4sCfjMP5Lx88ltW0mK9Yr73v3Y0a8EPEo
 oT4vJZSxGhiw85D6rZxmHAzI1ueMrFz8iRygrE6NK4/803ZZ9lo63Y/8x
 qu0G3XIHqpFUiMQsvIXrO2vJBRwfuWdnPXh5H90jAHWlnrqOo5zliKXIP
 OichA2e26kVYJN8t13la983/goc+Sree0JyObXRFZRHItCSWT8Ulq7AAx
 vGbEMh5MGO+/mfFK3paT9xJoYEmSHr2Edgch1mLBFS4gJZXUsq3vF22VE
 91iifMlNtMTWFBATxF9xou+/YQRtIrKvMjB3dpl95XihXJIgOw+1wJ//d w==;
X-CSE-ConnectionGUID: ncT18N+6RvaFeSyg/4COig==
X-CSE-MsgGUID: kA6DNSvzQJmupIA0lTUswQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29845440"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="29845440"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 02:56:11 -0800
X-CSE-ConnectionGUID: 0waV0jmUTN+Ma5Zi64slng==
X-CSE-MsgGUID: SMVtxIHjT1OABUxO35pRcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="118800000"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 02:56:08 -0800
Date: Thu, 6 Mar 2025 11:56:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Group utilization
 tests and skip when no utilization data
Message-ID: <20250306105606.ctufackrn2promhy@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250304185640.1333849-1-marcin.bernatowicz@linux.intel.com>
 <20250304185640.1333849-2-marcin.bernatowicz@linux.intel.com>
 <20250305121514.tojpbo7jlwbwcqt3@kamilkon-desk.igk.intel.com>
 <609f3be5-d1f7-427b-b7ee-c7065c4a50d2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <609f3be5-d1f7-427b-b7ee-c7065c4a50d2@linux.intel.com>
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

Hi Bernatowicz,,
On 2025-03-05 at 17:31:43 +0100, Bernatowicz, Marcin wrote:
> 
> 
> On 3/5/2025 1:15 PM, Kamil Konieczny wrote:
> > Hi Marcin,
> > On 2025-03-04 at 19:56:39 +0100, Marcin Bernatowicz wrote:
> > > Wrap all utilization-related subtests in an igt_subtest_group and add
> > > a fixture that ensures utilization data is available before running
> > > them.
> > > 
> > > Link: https://lore.kernel.org/r/20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com
> > > 
> > > Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> > > Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> > > Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > ---
> > >   tests/intel/xe_drm_fdinfo.c | 122 ++++++++++++++++++++----------------
> > >   1 file changed, 67 insertions(+), 55 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> > > index 7330b4330..d18fe10d8 100644
> > > --- a/tests/intel/xe_drm_fdinfo.c
> > > +++ b/tests/intel/xe_drm_fdinfo.c
> > > @@ -735,10 +735,6 @@ igt_main
> > >   	igt_subtest("basic-mem")
> > >   		basic_memory(xe);
> > > -	igt_describe("Check if basic fdinfo content is present for engine utilization");
> > > -	igt_subtest("basic-utilization")
> > > -		basic_engine_utilization(xe);
> > > -
> > >   	igt_describe("Create and compare total and resident memory consumption by client");
> > >   	igt_subtest("mem-total-resident")
> > >   		mem_total_resident(xe);
> > > @@ -751,57 +747,73 @@ igt_main
> > [...]
> > 
> > > +	igt_subtest_group {
> > > +		igt_fixture {
> > > +			struct drm_client_fdinfo info = { };
> > > +
> > > +			igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
> > > +							 ARRAY_SIZE(engine_map),
> > > +							 NULL, 0));
> > 
> > Problem with require placed here is that it will trigger also
> > for all other test outside of group. That will clobber output.
> 
> Does it mean the igt_subtest_group is deprecated and the description
> no more valid ?
> 
> "
> /**
>  * igt_subtest_group:
> 
> ...
> 
> * This macro allows to group together a set of #igt_fixture and #igt_subtest
>  * clauses. If any common setup in a fixture fails, only the subtests in
> this
>  * group will fail or skip. Subtest groups can be arbitrarily nested.
> "
> 

Well, you could group it to show logical part, use fixtures in them
for opening/closing files, just do not use igt_require as it should
be used only in first global fixture in igt_main, not in following
ones.

> > 
> > > +			igt_require(info.num_engines);
> > 
> > Both these should be placed in each subtest wrapped in function
> > (see below) but imho this looks like a global requires at begin
> > of a test? Or am I missing something?
> > 
> > > +		}
> > > +
> > 
> > Create function like:
> > 
> > void require_utilization(int xe, ... engine_map)
> > {
> > 	struct drm_client_fdinfo info = { };
> > 
> > 	igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
> > 					 ARRAY_SIZE(engine_map),
> > 					 NULL, 0));
> > 	igt_require(info.num_engines);
> > }
> > 
> > and use it in each utulization subtest like:
> > 
> > 	igt_describe("Check if basic fdinfo content is present for engine utilization");
> > 	igt_subtest("basic-utilization") {
> > 		require_utilization(xe);
> > 		basic_engine_utilization(xe);
> > 	}
> 
> That is the repetition I wanted to avoid ;)

I agree it looks like repetition but it is better to have it.
With require in fixture you could ancounter failure logs with
unrelated message like 'require X fails'.

Other solution would be to create a speparate test for these
tests.

Regards,
Kamil

> 
> ---
> marcin
> 
> > 
> > Regards,
> > Kamil
> > 
> > > +		igt_describe("Check if basic fdinfo content is present for engine utilization");
> > > +		igt_subtest("basic-utilization")
> > > +			basic_engine_utilization(xe);
> > > +
> > 
> > [...]
> > 
> 
