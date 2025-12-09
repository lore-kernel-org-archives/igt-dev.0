Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F29D3B983
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 17:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E32A10E107;
	Tue,  9 Dec 2025 17:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBro17IK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F11310E107
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 17:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765299612; x=1796835612;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p7W+RIOsG9NU0C0aVsbd0QmeY3uAKXqyhweNOVcLQdg=;
 b=jBro17IKyuVqLNao7icUNNps+xgvWT0Lk5jAaWxO8tXO85c6o0S3oa2S
 nLmLtayoRBfTFwAhFI7Vz9vKh64AL2u4PJDsWd53G9UgrL6VsBloBEc5L
 pO2chjzsmI9av/zPwWqtD/FAcdmvQReZWazv1AM844r40YoRSfns+N9Pe
 SbHrfMOf1zF372kyzvw2DskWocg4gG1QqfyctXr1vJ2zPlrAOkl6sI499
 zX3FMBIBmolDrNsgt7l27TxRKrEdupOPzXBjnJaXRmCe3D6p9ok1JEdPJ
 mbOA43BhWxhXTBznMoNmN7IGDdiULZx8qvVEtUcxZngtuvXaaPc5iWror A==;
X-CSE-ConnectionGUID: 2T/pehUyT/a3frdwjeTMMA==
X-CSE-MsgGUID: GaVYyFBgQYSOv6AI5EdM3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67313283"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="67313283"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 09:00:12 -0800
X-CSE-ConnectionGUID: UeVkrePWQYuAvJVpxW3g/A==
X-CSE-MsgGUID: JoSOon20RSyAALwYgHCirw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="200754203"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 09:00:11 -0800
Date: Tue, 9 Dec 2025 19:00:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 7/7] scripts/cocci: Add iterators.cocci
Message-ID: <aThVlkpmwIunyby_@intel.com>
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
 <20251120191415.4236-8-ville.syrjala@linux.intel.com>
 <aSTS9ENX7KARW9lb@intel.com> <aSTezLxIt39WVdQK@intel.com>
 <4526e3a0-fa44-4200-8f87-eb1e84217c63@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4526e3a0-fa44-4200-8f87-eb1e84217c63@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Dec 04, 2025 at 01:56:50PM +0100, Hajda, Andrzej wrote:
> W dniu 24.11.2025 o 23:40, Ville SyrjÃ¤lÃ¤ pisze:
> > On Mon, Nov 24, 2025 at 11:49:40PM +0200, Ville Syrjälä wrote:
> >> On Thu, Nov 20, 2025 at 09:14:15PM +0200, Ville Syrjala wrote:
> >>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>>
> >>> Coccinelle often chokes on magic iterator macros. We
> >>> can lend it a hand by explicitly declaring those macros
> >>> as iterators. Start collecting them in
> >>> scripts/iterators.cocci which people can easily include
> >>> in their cocci scripts.
> >>>
> >>> The "struct dummy" is there because coccinelle doesn't
> >>> like an empty script. Dunno if there's a cleaner way
> >>> around that?
> >>>
> >>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>> ---
> >>>   scripts/iterators.cocci | 53 +++++++++++++++++++++++++++++++++++++++++
> >>>   1 file changed, 53 insertions(+)
> >>>   create mode 100644 scripts/iterators.cocci
> >>>
> >>> diff --git a/scripts/iterators.cocci b/scripts/iterators.cocci
> >>> new file mode 100644
> >>> index 000000000000..90d3ae437a15
> >>> --- /dev/null
> >>> +++ b/scripts/iterators.cocci
> >>> @@ -0,0 +1,53 @@
> >>> +// SPDX-License-Identifier: MIT
> >>> +//
> >>> +// Use with
> >>> +// #include "scripts/iterators.cocci"
> >>> +// at the start of your cocci script
> >>> +
> >>> +@@
> >>> +iterator name for_each_collection_data;
> >>> +iterator name for_each_combination;
> >>> +iterator name for_each_connected_output;
> >>> +iterator name for_each_connector_mode;
> >>> +iterator name for_each_ctx_engine;
> >>> +iterator name for_each_disconnected_output;
> >>> +iterator name for_each_format;
> >>> +iterator name for_each_if;
> >>> +iterator name for_each_output;
> >>> +iterator name for_each_pipe;
> >>> +iterator name for_each_pipe_static;
> >>> +iterator name for_each_pipe_with_single_output;
> >>> +iterator name for_each_pipe_with_valid_output;
> >>> +iterator name for_each_plane_on_pipe;
> >>> +iterator name for_each_prime_number;
> >>> +iterator name for_each_sriov_enabled_vf;
> >>> +iterator name for_each_sriov_num_vfsfor_each_sriov_vf;
> >>> +iterator name for_each_sriov_num_vfs_in_rangefor_each_sriov_vf_in_range;
> >>> +iterator name for_each_sriov_vf;
> >>> +iterator name for_each_sriov_vf_in_range;
> >>> +iterator name for_each_subset;
> >>> +iterator name for_each_subset;
> >>> +iterator name for_each_sysfs_gt_dirfd;
> >>> +iterator name for_each_sysfs_gt_path;
> >>> +iterator name for_each_sysfs_tile_dirfd;
> >>> +iterator name for_each_tiling;
> >>> +iterator name for_each_valid_output_on_pipe;
> >>> +iterator name for_each_variation_nr;
> >>> +iterator name for_each_variation_r;
> > 
> >>> +iterator name igt_for_each_drm_client;
> >>> +iterator name igt_list_for_each_entry;
> >>> +iterator name igt_list_for_each_entry_reverse;
> >>> +iterator name igt_list_for_each_entry_safe;
> >>> +iterator name igt_list_for_each_entry_safe_reverse;
> > 
> > And now that I think about it, I seem to recall cocci having
> > some kind of builtin heuristic for this...
> > 
> > Indeed, parsing_c/parsing_hacks.ml says:
> > let regexp_foreach = Str.regexp_case_fold
> >    ".*\\(for_?each\\|for_?all\\|iterate\\|loop\\|walk\\|scan\\|each\\|for\\)"
> > 
> > So I guess we don't actually need to declare any of the
> > iterators above. IIRC I generated that list with a simple
> > 'grep for_each', more or less just in case.
> > 
> >>> +iterator name igt_dynamic;
> >>> +iterator name igt_dynamic_f;
> >>> +iterator name igt_fixture;
> >>> +iterator name igt_fork;
> >>> +iterator name igt_require;
> >>> +iterator name igt_subtest;
> >>> +iterator name igt_subtest_f;
> >>> +iterator name igt_subtest_group;
> >>> +iterator name igt_subtest_with_dynamic;
> >>> +iterator name igt_subtest_with_dynamic_f;
> >>
> >> Couple of other needed iterators I apparently forgot to include here:
> >>
> >> +iterator name igt_until_timeout;
> >> +iterator name igt_while_interruptible;
> > 
> > All of this stuff I had to add manually to actually make
> > cocci parse the code succesfully. And we can see none of it
> > will match that heuristic regexp.
> > 
> >>
> >> I should also check if cocci supports regexp with iterator names since
> >> that could reduce this list quite a bit...
> > 
> > Doesn't seem to be the case. But at least I can reduce
> > the list due to the builtin heuristic.
> 
> Nice work. What cocci coverage in percents do you achieve with this?

Original was:
 NB total files = 1000; perfect = 479; pbs = 521; timeout = 0; =========> 47%
 nb good = 2725082,  nb passed = 6531 =========> 0.23% passed
 nb good = 2725082,  nb bad = 61818 =========> 97.79% good or passed

This is what I get after this stuff:
 NB total files = 1000; perfect = 522; pbs = 478; timeout = 0; =========> 52%
 nb good = 2728902,  nb passed = 6721 =========> 0.24% passed
 nb good = 2728902,  nb bad = 57989 =========> 97.92% good or passed

That's all pretty much due to the igt_main stuff because I couldn't
find any way to use the iterators.cocci script with --parse-c.

Using the macro based approach for the iterators I get:
 NB total files = 1000; perfect = 892; pbs = 108; timeout = 0; =========> 89%
 nb good = 2776744,  nb passed = 5443 =========> 0.19% passed
 nb good = 2776744,  nb bad = 10147 =========> 99.64% good or passed

So I guess that's about what one may now expect when using
iterators.cocci.

Anyways, this is all pushed now. Thanks for the acks.


PS.
For including the cocci scripts in the commit message I switched to
using the following format:
 #include "scripts/iterators.cocci"

blah
blah

Ie. just put one extra space before the '#' so that git doesn't
think it's a comment and strip it.

There is a way to change the comment character in git, but I'm not
sure it's a good idea if only some people do that. Someone else
grabbing those commits and doing an interactive rebase might get
bitten by it.

Cocci doesn't even seem to mind the extra space, so you can still
copy-paste the script from the commit message as is.

> 
> I have asked once cocci author about the same issue some time ago, she 
> proposed different solution [1] - to provide --macro-file-builtins with
> defines for problematic macros.
> Not sure which approach better solves IGT issues, defines seems for me 
> more flexible, but I do not feel an expert in this area.
> 
> Anyway adding parenthesis to igt macros makes them look more 'c like' :)
> 
> Acked-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> [1]: 
> https://lore.kernel.org/cocci/4aed4763-9b3c-c21f-693a-e7d4281f8384@inria.fr/
> 
> Regards
> Andrzej
> 
> > 
> >>
> >>> +@@
> >>> +struct dummy
> >>> -- 
> >>> 2.49.1
> >>
> >> -- 
> >> Ville Syrjälä
> >> Intel
> > 

-- 
Ville Syrjälä
Intel
