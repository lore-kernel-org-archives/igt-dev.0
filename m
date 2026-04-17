Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD07F436BF
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 19:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD35C10E060;
	Fri, 17 Apr 2026 19:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jzI4kCxl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698CE10EA82
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 19:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776453534; x=1807989534;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LvdLDbdFb8bQefdqIU8XMNcp8Kad8APzkL59l08ehbA=;
 b=jzI4kCxlkRJUhgrTInJw4N7eC4f90g0EdfuEUIDq/PHvEzO0ZywIaYPb
 dGBoNq3LiSC/LQWFSiORONpIJX6FRMIZ0DQDEyaqD6T8X0dgk/fkdip+d
 xGomMdjJJM2srURxvWOU/UdQEleKjXQAOKjLxmlA2MnwwLIRe6Z0/r5IC
 zyWJLpCTAYO1GgYM2utSo7CIkTYmSvIf1yuAr2BZNVZjXSuw/QLENKIki
 4s2hAnAu/PaPhMvthsOc/6UBmlQ1/oX31MCUt8ObHCasjpYemXVKx2hRS
 kdowOCWr5+OUCYPCKiFM16Hw0m7WhBTffDyTttd+x0FBoM5DjyMV+1R2M Q==;
X-CSE-ConnectionGUID: Pj1f4fFYSliJh3rTgYs48Q==
X-CSE-MsgGUID: Zx9uWexqTE+koci9iuP7Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77546614"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77546614"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 12:18:53 -0700
X-CSE-ConnectionGUID: 106E2fA+Sku7SzbDWirpuA==
X-CSE-MsgGUID: gHZw84iZRlOqU8ljyS9tQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="228428967"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.245.176])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 12:18:52 -0700
Date: Fri, 17 Apr 2026 22:18:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@linux.intel.com
Subject: Re: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 1b85a9b04681
Message-ID: <aeKHmVtlO__WehBe@intel.com>
References: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
 <20260417041031.2187889-2-ankit.k.nautiyal@intel.com>
 <4b8f88f0-e1c2-4702-a262-651b3104545b@intel.com>
 <3bd2ed35-97b4-40f0-8d18-21e23f697826@intel.com>
 <aeIL84BK_pmBS48s@intel.com>
 <da72e919b7cbd787e793f0141697f7c37957f998@intel.com>
 <aeKFxTbWGjrh_N9K@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeKFxTbWGjrh_N9K@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Apr 17, 2026 at 10:11:01PM +0300, Ville Syrjälä wrote:
> On Fri, Apr 17, 2026 at 02:54:32PM +0300, Jani Nikula wrote:
> > On Fri, 17 Apr 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > On Fri, Apr 17, 2026 at 11:47:14AM +0530, Nautiyal, Ankit K wrote:
> > >> 
> > >> On 4/17/2026 11:09 AM, Karthik B S wrote:
> > >> > Hi Ankit,
> > >> >
> > >> > On 4/17/2026 9:40 AM, Ankit Nautiyal wrote:
> > >> >> Synchronize intel_vbt_defs.h with kernel commit:
> > >> >> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
> > >> >>
> > >> >> Bspec:20142
> > >> >> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > >> >> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > >> >> ---
> > >> >>   tools/intel_vbt_defs.h | 1 +
> > >> >>   1 file changed, 1 insertion(+)
> > >> >>
> > >> >> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> > >> >> index 6612d3a4ec49..550a9bfba868 100644
> > >> >> --- a/tools/intel_vbt_defs.h
> > >> >> +++ b/tools/intel_vbt_defs.h
> > >> >> @@ -1090,6 +1090,7 @@ struct bdb_edp {
> > >> >>       u16 edp_dsc_disable;                    /* 251+ */
> > >> >>       u16 t6_delay_support;                    /* 260+ */
> > >> >>       u16 link_idle_time[16];                    /* 260+ */
> > >> >> +    u16 joiner_enable;                    /* 261+ */
> > >> >
> > >> > The variable name should be 'pipe_joiner_enable'. With this updated,
> > >> >
> > >> > Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> > >> 
> > >> 
> > >> Thanks Karthik, will fix this and send shortly.
> > >
> > > How was this even different? You didn't retype these by hand into the
> > > igt copy of the header did you? The proper procedure is to actually
> > > copy the whole file from the kernel tree.
> > 
> > Yeah, this. The commits aren't in the same order as in the kernel
> > either, and they're missing one.
> > 
> > I've scripted this years ago, for both PCI IDs and VBT defs, and I've
> > shared the scripts too. Here's my current version.
> > 
> > Change KERNEL and IGT paths to yours, update the repos, cd to IGT, and
> > run.
> > 
> > BR,
> > Jani.
> > 
> > 
> > #!/bin/bash
> > 
> > SINCE=962601ac4c78
> > KERNEL=$HOME/src/linux
> > IGT=$HOME/src/intel-gpu-tools
> > 
> > declare -g -A map
> > map["drivers/gpu/drm/i915/display/intel_vbt_defs.h"]="tools/intel_vbt_defs.h"
> > map["drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h"]="tools/intel_dsi_vbt_defs.h"
> > map["include/drm/intel/pciids.h"]="lib/pciids.h"
> > 
> > cd $KERNEL
> > 
> > for infile in "${!map[@]}"; do
> > 	outfile=${map[$infile]}
> > 
> > 	echo "processing $infile -> $outfile"
> > 
> > 	last=
> > 	for commit in $(git log --reverse --pretty=%h $SINCE..HEAD -- $infile); do
> > 		if ! git cat-file -e $commit:$infile 2>/dev/null; then
> > 			continue
> > 		fi
> > 		if git show $commit:$infile | diff -q $IGT/$outfile - >/dev/null; then
> > 			last=$commit
> > 			break
> > 		fi
> > 	done
> > 
> > 	if [[ -z "$last" ]]; then
> > 		echo "last update to $infile not found"
> > 		continue
> > 	fi
> > 
> > 	for commit in $(git log --reverse --pretty=%h $last..HEAD -- $infile); do
> > 		prefix="${outfile%.*}"
> > 		base="$(basename $outfile)"
> > 		ref=$(git cite $commit)

I presume that's your own git alias, or at least I don't have it.
Would need to be typed out fully for other people to use this.

> > 		git show $commit:$infile > $IGT/$outfile
> > 		cd $IGT
> > 		git commit -as \
> > 		    -m "${prefix}: sync ${base} with kernel commit $commit" \
> > 		    -m "Synchronize ${base} with kernel commit:" \
> > 		    -m "$ref"
> > 		cd -
> > 	done
> > done
> 
> Good enough to put this into scripts/ with a quick howto at the top?
> And then reference it from the generated commit messages so that the
> next person is more likely to find it as well.
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Ville Syrjälä
Intel
