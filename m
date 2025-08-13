Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7438CC87FCF
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 15:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A89910E744;
	Wed, 13 Aug 2025 15:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrEZNYsC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1126610E744
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755098545; x=1786634545;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ugN+VYCxZcNIc+SewY/I3HvifeeKvh2Wwg8SIpOTI7U=;
 b=UrEZNYsCtk8RA3x7+wukgRoF6h6qgKgLXKnp9BNo3G9NkWxvd1YkMyql
 fZ+bxJZPY8Sr815kTA8CFAsf7Hi+OTGamvF0F0+hiQKjON6u6mMZMyNwC
 djN3GBVptukLfF9jOI3EtAn7Off8hjy3k2LhDhoTNDhh/WYcOMyq/aEVN
 8RbUcv78Zcvp5WKMjhd3vdXCTXDJTU2R8tMer7k+iZSCrCfVHxKEYc+Op
 srJNHd/58oZjfmGFgymemKXbj4dT5SfLo6TsvZ0V8hOXhSvjgqLGOUMQL
 LqZ/KolNr33cBh8WvSL1rm7lZi6vudB5KgQRO2cF2eIowLKSiOb4dGlMX Q==;
X-CSE-ConnectionGUID: DYakc5dSTFORGErpsgyyJA==
X-CSE-MsgGUID: wf3718GTSwOqt3vdzy1frg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56422267"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="56422267"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 08:22:25 -0700
X-CSE-ConnectionGUID: foxytOp1QjOGQRNEbkVorQ==
X-CSE-MsgGUID: TPjiNFFISpChijv6V0HAHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="170636251"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 08:22:23 -0700
Date: Wed, 13 Aug 2025 17:22:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH i-g-t] lib/pciids: sync pciids.h with kernel
Message-ID: <20250813152206.uzygxvqcjkcnflrj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
References: <20250811130901.288178-1-jani.nikula@intel.com>
 <20250812115914.chsogn6zvfxd6ugb@kamilkon-DESK.igk.intel.com>
 <eef2cf9f34025eff3445edb74dcf98eac6d9099b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eef2cf9f34025eff3445edb74dcf98eac6d9099b@intel.com>
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

Hi Jani,
On 2025-08-12 at 18:49:38 +0300, Jani Nikula wrote:
> On Tue, 12 Aug 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > Hi Jani,
> > On 2025-08-11 at 16:09:01 +0300, Jani Nikula wrote:
> >> Syncing lib/pciids.h with kernel include/drm/intel/pciids.h means there
> >> must exist kernel and igt commits where the files are identical,
> >> i.e. the file is copied verbatim at some kernel commit to igt.
> >> 
> >> It does *not* mean syncing the *changes* of a kernel commit to the igt
> >> version of the file.
> >> 
> >> The latest changes to lib/pciids.h have gone out of sync with kernel,
> >> completely missing kernel commit 3c0f211bc8fc ("drm/xe: Add Wildcat Lake
> >> device IDs to PTL list").
> >> 
> >> Properly sync PCI IDs with kernel commit ccfb15b8158c ("drm/xe/bmg: Add
> >> one additional PCI ID"), including the full file.
> >> 
> >> Fixes: 26ddb59c1d5f ("lib/pciids: Add one more PCI ID to BMG")
> >> Cc: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> >> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > Thank you for update of pciids, imho subject could be improved,
> > something like:
> >
> > [PATCH i-g-t] lib/pciids: Add Wildcat Lake
> >
> > so it will be more informative with git log --oneline
> >
> > No need for resend, this could be done at merge so
> >
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Thanks, pushed with the subject updated.
> 
> BR,
> Jani.

It somehow ended up with two lib/...:

lib/pciids: lib/pciids: Add Wildcat Lake

It is not a big deal here as it is still better then former
subject.

Please re-read your submission before pushing, preferably
with
git log -N

and then with
git log -N --oneline

where N is number of patches merged.

Regards,
Kamil

> 
> >
> >> ---
> >>  lib/pciids.h | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/lib/pciids.h b/lib/pciids.h
> >> index 666265b5f8c8..76f8d26f9cc9 100644
> >> --- a/lib/pciids.h
> >> +++ b/lib/pciids.h
> >> @@ -872,6 +872,8 @@
> >>  	MACRO__(0xB08F, ## __VA_ARGS__), \
> >>  	MACRO__(0xB090, ## __VA_ARGS__), \
> >>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> >> -	MACRO__(0xB0B0, ## __VA_ARGS__)
> >> +	MACRO__(0xB0B0, ## __VA_ARGS__), \
> >> +	MACRO__(0xFD80, ## __VA_ARGS__), \
> >> +	MACRO__(0xFD81, ## __VA_ARGS__)
> >>  
> >>  #endif /* __PCIIDS_H__ */
> >> -- 
> >> 2.47.2
> >> 
> 
> -- 
> Jani Nikula, Intel
