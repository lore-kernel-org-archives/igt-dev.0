Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E76F588C3
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 13:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB1710E5BB;
	Mon, 20 Apr 2026 13:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKR769kB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884F710E5BB
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776690242; x=1808226242;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bEqHxnTLRuYjU1w8XFd4REeLQY/lfm/CjgWm0eAVFq4=;
 b=RKR769kBzrM1WpsH66GYHyrs+YRdQXfUXCnEg8Kx3yEjNQF46OHQ9EF9
 xPghI2d5Vn0LEa2visy11N8VHBRVvLkOW5ZrCvTn4dVrFqQ9Y1znkgFfL
 KLye0d8PTJY20zFuzY5j8m15iV6Asf3na3pzbQSFDrR6S6unctNYcMVgR
 larZp1VLTxGtxv5k8mYmvzMJOy0bbMP1S7k/S1ARh0zHGPgZ7CwlakP73
 5N/z3DbY5F8qZ9U9mJdNaKY6lIi79s8K7uVfAQ3Nq+sS53UA+kIhxcdv6
 oEGhIN5tpFbl8regSpc3N+nl0N87+FxldfpWaUow69UaYwhyK5xs8bV9J w==;
X-CSE-ConnectionGUID: 8sfU7VPzSAChSB0tgixwGA==
X-CSE-MsgGUID: RxO3vf67RduJ4Y4RZSC9Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95007227"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="95007227"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 06:04:02 -0700
X-CSE-ConnectionGUID: 9iLEWxSZSZmxZO1d+Mo8Qw==
X-CSE-MsgGUID: CyvSwwzFRYmRffakI9OmmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="231999898"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 06:04:01 -0700
Date: Mon, 20 Apr 2026 15:03:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 1b85a9b04681
Message-ID: <20260420130358.wy64hybr7f3vibaf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
References: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
 <20260417041031.2187889-2-ankit.k.nautiyal@intel.com>
 <4b8f88f0-e1c2-4702-a262-651b3104545b@intel.com>
 <3bd2ed35-97b4-40f0-8d18-21e23f697826@intel.com>
 <aeIL84BK_pmBS48s@intel.com>
 <da72e919b7cbd787e793f0141697f7c37957f998@intel.com>
 <aeKFxTbWGjrh_N9K@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeKFxTbWGjrh_N9K@intel.com>
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

Hi all,
On 2026-04-17 at 22:11:01 +0300, Ville Syrjälä wrote:
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
[cut]
> > 	done
> > done
> 
> Good enough to put this into scripts/ with a quick howto at the top?
> And then reference it from the generated commit messages so that the
> next person is more likely to find it as well.

+1 to that suggestion, any usefull helpers could be in igt scrtips/

Regards,
Kamil

> 
> -- 
> Ville Syrjälä
> Intel
