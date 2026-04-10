Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A4DF459E4
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 14:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326BF10E96F;
	Fri, 10 Apr 2026 14:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLV04U5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6343910E96F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775832893; x=1807368893;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1ucuFOyOtfE4VgaUu1cTJQ72cBmNC3ib1+kVhTiqOK8=;
 b=LLV04U5VYiv5jYs/GVphKUMLpc1NO9UPzb4ZvrKIn+tFMtK5WkpxHL+2
 VH0PN0wy21JchCR9MYO+Gi8wPFoPM8+i9SJZluF5nunOM2JF4KdJIgblK
 N2NGb24V/I6XYOwdd94seD+c5mhem6pjmX1/9L3iVam1YdpZltcPZ725B
 118RI8eMumybMnVp3Byzat7kRZNXi6OKGPA6l4U7cw7wYAr/hGjwCemdt
 yL/BShLTdkDHp5k62MQqOtWM6fvvA/M+rm14eof7YGFDACsTKwyFHvKhR
 9mLWnONbdHk1IbjisBEUjAlWxe/CdjuPV56Ki1epvDUkXN3IHVzE4y6Ee w==;
X-CSE-ConnectionGUID: hiOWSmPVQY+8dYePfrNZTw==
X-CSE-MsgGUID: C7bTNT0YRnu7prrWt4e3fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76814442"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76814442"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 07:54:53 -0700
X-CSE-ConnectionGUID: bAvGig0BT0i+RVHy/UzgPg==
X-CSE-MsgGUID: HgxbyOQXTHSrp/wrS591ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="230826004"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 07:54:51 -0700
Date: Fri, 10 Apr 2026 16:54:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/7] tests/intel/kms_mst_helper: Add kernel-doc for
 existing function
Message-ID: <20260410145449.7hehy6g6ecilfmx4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "Joshi, Kunal1" <kunal1.joshi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
 <20260401160627.1338526-2-kunal1.joshi@intel.com>
 <DM3PPF208195D8D55ECFE3FCDB212EB2C8AE351A@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D55ECFE3FCDB212EB2C8AE351A@DM3PPF208195D8D.namprd11.prod.outlook.com>
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

Hi Kandpal,,
On 2026-04-02 at 04:00:38 +0000, Kandpal, Suraj wrote:
> > Subject: [PATCH i-g-t 1/7] tests/intel/kms_mst_helper: Add kernel-doc for
> > existing function
> > 
> > Convert the doc comment on igt_find_all_mst_output_in_topology
> > to proper kernel-doc.

Maybe wrote 'proper IGT doc.'

Add also a note about a typo fix.

> > 
> > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > ---
> >  tests/intel/kms_mst_helper.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c index
> > aef74cd31..38859cffc 100644
> > --- a/tests/intel/kms_mst_helper.c
> > +++ b/tests/intel/kms_mst_helper.c
> > @@ -5,11 +5,12 @@
> > 
> >  #include "kms_mst_helper.h"
> > 
> > -/*
> > +/**
> > + * igt_find_all_mst_output_in_topology:
> >   * @drm_fd: DRM file descriptor
> >   * @display: pointer to #igt_display_t structure
> >   * @output: target output
> > - * @mst_outputs: filled with mst output of same toplogy as @output
> > + * @mst_outputs: filled with mst output of same topology as @output
> >   * @num_mst_outputs: filled with count of mst outputs found in topology
> >   *
> >   * Iterates over all connected outputs and adds each DP MST
> 
> Can we have the following way of documenting functions? This is what we do in kernel
> igt_find_all_mst_output_in_topology() - Find all MST outputs

I do not know if that is possible without breaking already
exiting IGT documentation.
+cc few more KMS devs and Pawel

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Pawel Sikora <pawel.sikora@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

> arguments like you have done above
> Description of function like you have already done
> 
> Rest Looks good
> 
> Regards,
> Suraj Kandpal
> 

Format here is what we currently use in other IGT parts, see
for example lib/igt_alsa.c so with commit description fixed 

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> > --
> > 2.25.1
> 
