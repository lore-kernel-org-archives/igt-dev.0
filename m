Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4870F4368B
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 10:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7041C10E9DD;
	Fri, 17 Apr 2026 10:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UP5e8xwZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD02610E9DD
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776421881; x=1807957881;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=b509s65Pft9K1EzjEBxppNx6vRNg24C85l25szOevpA=;
 b=UP5e8xwZP+/WIOzFmbjziO02pkQgeLwD9Nx0VUwgzLrbtzrWRDZo3OHH
 vqgq7rCsfuX5GR5JIK9lEAXph7joP/Ta/fB6P2gJVlCmYGzvOh4npvDgF
 8oZaddn22zhS4ZI4FWSbVm0E4926qSzbbRUHESsod7yMCz25z7p3d6Qc5
 Q94uVhpmwt439twUvmxV2uVfmw3TMHfKNJl2iyRBN2AVecocn1w/+OGh/
 czvgJw+rhTJsOPYoRwXmHi7yfHtgiAfsvaIT26cEu67/fXAG5xzYXAhr8
 b1LOaqnwByMBkLfJ9T8ezu3AwWR2cSpb/qcQ6HkTrkBlrR8DY4Tbp6Ma6 A==;
X-CSE-ConnectionGUID: 3MWLqAK5TuSIePd8ZnkiZw==
X-CSE-MsgGUID: SckdU0FAQj6u5h5x55/2Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77311016"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77311016"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 03:31:21 -0700
X-CSE-ConnectionGUID: /pjK3vPvS1CtY+9DszydYQ==
X-CSE-MsgGUID: SKk4X1G8RFqBN96KhaARSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="234991432"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.245.176])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 03:31:19 -0700
Date: Fri, 17 Apr 2026 13:31:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@linux.intel.com
Subject: Re: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 1b85a9b04681
Message-ID: <aeIL84BK_pmBS48s@intel.com>
References: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
 <20260417041031.2187889-2-ankit.k.nautiyal@intel.com>
 <4b8f88f0-e1c2-4702-a262-651b3104545b@intel.com>
 <3bd2ed35-97b4-40f0-8d18-21e23f697826@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bd2ed35-97b4-40f0-8d18-21e23f697826@intel.com>
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

On Fri, Apr 17, 2026 at 11:47:14AM +0530, Nautiyal, Ankit K wrote:
> 
> On 4/17/2026 11:09 AM, Karthik B S wrote:
> > Hi Ankit,
> >
> > On 4/17/2026 9:40 AM, Ankit Nautiyal wrote:
> >> Synchronize intel_vbt_defs.h with kernel commit:
> >> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
> >>
> >> Bspec:20142
> >> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >> ---
> >>   tools/intel_vbt_defs.h | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> >> index 6612d3a4ec49..550a9bfba868 100644
> >> --- a/tools/intel_vbt_defs.h
> >> +++ b/tools/intel_vbt_defs.h
> >> @@ -1090,6 +1090,7 @@ struct bdb_edp {
> >>       u16 edp_dsc_disable;                    /* 251+ */
> >>       u16 t6_delay_support;                    /* 260+ */
> >>       u16 link_idle_time[16];                    /* 260+ */
> >> +    u16 joiner_enable;                    /* 261+ */
> >
> > The variable name should be 'pipe_joiner_enable'. With this updated,
> >
> > Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> 
> 
> Thanks Karthik, will fix this and send shortly.

How was this even different? You didn't retype these by hand into the
igt copy of the header did you? The proper procedure is to actually
copy the whole file from the kernel tree.

-- 
Ville Syrjälä
Intel
