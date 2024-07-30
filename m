Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146E9C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 12:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFE110E21A;
	Tue, 30 Jul 2024 12:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PULoWNKG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1480B10E21A
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722343283; x=1753879283;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cImpmMcjc4qtkFv8d776O8BUtKzxCdk+OHQib+ijt4Q=;
 b=PULoWNKGsfAtUdJyJIa9yNp4XaBp4Au6YiV+xUx9P+h09mDTbXXsZzEh
 0auKMv2trO/ieI6OGR6OOAUOgcDShin1SFspN43/V7UENY1ucJz0ZReHT
 2O0N/uYuR+34hEwt6clpOR4PUI9CFeoOetDyK1YY/S1Kh7XVX9wJ4wG0V
 rZnxWKemId7EK2+J3Z7MaR6qJ/fWrQw3PoFh3cI2eo4euEpLYxFnuZ86Q
 rARMywSldZVXzqHuvH4M5l4OdlEiNHtU0qq+qydTasq/Aa/vON1v2DFZk
 7Wt1cJY1AZDUROho78iT3wNy5kIiQMkVroZSopAqEAAZkJ8lJwyJX9U4Y w==;
X-CSE-ConnectionGUID: gckDKDsYTJG8YhhG4x7sdw==
X-CSE-MsgGUID: 35gmOEv1TQuP4IpRZO46IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="45571131"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="45571131"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 05:41:23 -0700
X-CSE-ConnectionGUID: pINCZl/0QgacUcbfTnldTg==
X-CSE-MsgGUID: n+HJoe1RTyONaBtTM247Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="58653072"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 05:41:21 -0700
Date: Tue, 30 Jul 2024 14:41:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH i-g-t v2 01/10] tests/intel/xe_drm_fdinfo: Rename basic
 to basic-memory test
Message-ID: <20240730124105.rgjufkh32avgyakw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-2-umesh.nerlige.ramappa@intel.com>
 <7dw4w7s2sxkf4axlllqtpgf2m4v7fkxpb5tfhlgswvwrvxtity@gnkyeyww3qcy>
 <ZpAY0M6uBVka2lyR@orsosgc001>
 <cpkpadnhngra4rud52uypibg4d3theudfhz7nwqvkexumuelzx@bghu5paxdchc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cpkpadnhngra4rud52uypibg4d3theudfhz7nwqvkexumuelzx@bghu5paxdchc>
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

Hi Lucas,
On 2024-07-11 at 15:36:16 -0500, Lucas De Marchi wrote:
> On Thu, Jul 11, 2024 at 10:39:28AM GMT, Umesh Nerlige Ramappa wrote:
> > On Thu, Jul 11, 2024 at 07:00:40AM -0500, Lucas De Marchi wrote:
> > > On Tue, Jul 02, 2024 at 05:25:23PM GMT, Umesh Nerlige Ramappa wrote:
> > > > Existing basic test is checking memory info in fdinfo. Rename
> > > > accordingly.
> > > > 
> > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > ---
> > > > tests/intel/xe_drm_fdinfo.c | 12 ++++++------
> > > > 1 file changed, 6 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> > > > index 2ceafba24..f0aa23e2f 100644
> > > > --- a/tests/intel/xe_drm_fdinfo.c
> > > > +++ b/tests/intel/xe_drm_fdinfo.c
> > > 
> > > I was also expecting a change to the testlist... but it seems we don't
> > > really have this there.
> > > 
> > > https://intel-gfx-ci.01.org/tree/intel-xe/index.html?testfilter=xe_drm_fdinfo
> > > returns an empty result so it seems we are not even running these tests?
> > 
> > Strange, for rev2 I actually saw these new tests run in the shards list
> > and was expecting the same for newer revs.
> > 
> > https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11334/shards-all.html?testfilter=xe_drm_fdinfo
> 
> yeah... if I use the shards-all.html I can see it.. and that one doesn't
> need a testlist since it's actually "all the tests".

We need change only for hard-coded xe-fast-feedback or if it was
in blocklist. Btw is this correct:

xe.blocklist.txt:igt@drm_fdinfo

imho this should also be running in our tests? Or am I missing something?

Regards,
Kamil

> 
> Lucas De Marchi
> 
> > 
> > Umesh
> > 
> > > 
> > > Cc'ing some people. For the changes here:
> > > 
> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 
> > > thanks
> > > Lucas De Marchi
> > > 
> > > > @@ -22,8 +22,8 @@
> > > > * Feature: SMI, core
> > > > * Test category: SysMan
> > > > *
> > > > - * SUBTEST: basic
> > > > - * Description: Check if basic fdinfo content is present
> > > > + * SUBTEST: basic-memory
> > > > + * Description: Check if basic fdinfo content is present for memory
> > > > *
> > > > * SUBTEST: drm-total-resident
> > > > * Description: Create and compare total and resident memory consumption by client
> > > > @@ -259,7 +259,7 @@ static void test_total_resident(int xe)
> > > > 	xe_vm_destroy(xe, vm);
> > > > }
> > > > 
> > > > -static void basic(int xe)
> > > > +static void basic_memory(int xe)
> > > > {
> > > > 	struct drm_xe_mem_region *memregion;
> > > > 	uint64_t memreg = all_memory_regions(xe), region;
> > > > @@ -299,9 +299,9 @@ igt_main
> > > > 		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
> > > > 	}
> > > > 
> > > > -	igt_describe("Check if basic fdinfo content is present");
> > > > -	igt_subtest("basic")
> > > > -		basic(xe);
> > > > +	igt_describe("Check if basic fdinfo content is present for memory");
> > > > +	igt_subtest("basic-memory")
> > > > +		basic_memory(xe);
> > > > 
> > > > 	igt_describe("Create and compare total and resident memory consumption by client");
> > > > 	igt_subtest("drm-total-resident")
> > > > -- 
> > > > 2.38.1
> > > > 
