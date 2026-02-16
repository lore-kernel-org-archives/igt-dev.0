Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20F8E81A23
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 13:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27CD10E055;
	Mon, 16 Feb 2026 13:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezOT/u61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83AF10E055
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 13:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771250340; x=1802786340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d/aRN6O9UdbbllFuPfRCK6+NtSbDaI5pvyTqHcU8R3k=;
 b=ezOT/u61OwY1ztgh7+uaLruib5BTboWwBr6NnlPHHjY2SRLdOEYywZMy
 vyq2UdfnetUXJxW6iNiyMlZ0/6+hNv557Tt1ow0cqp0WfSAEomvI2rky2
 NotJZp9eTvO8h9kPaYWVZ33h/8olU6PtoxhhIREGfwxblaRdgRtIpO1+d
 EOEYMV8b3PU+Lt84EdQUieHZs3D9B9cdD0h3gpFp3Y5HF38AclVOaZDLW
 P/INENcQ4x00xOxAJGjncZe+Oq1vZUy+SuyTrccQa5khC4xyRojq1nHoq
 40G4vtMYh5lKl/9LVHnShr0TsJo5tzz2+jK6MU5nbhf39a0tzLquF+0// g==;
X-CSE-ConnectionGUID: zUwmN7veTg+IEMHiCIYqoA==
X-CSE-MsgGUID: DLBiB6+QQfuJ0EAEbX1Piw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71528793"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="71528793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 05:59:00 -0800
X-CSE-ConnectionGUID: IidokrHzSo2b4Emll5rsTg==
X-CSE-MsgGUID: C0xZQKJVRfSlITjjWJ6A/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="211951647"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 05:58:58 -0800
Date: Mon, 16 Feb 2026 14:58:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, kunal1.joshi@intel.com,
 ankit.k.nautiyal@intel.com, mohammed.thasleem@intel.com
Subject: Re: [PATCH i-g-t v2] tests/kms_content_protection: Fix multi outputs
 using same pipe
Message-ID: <20260216135847.o4xzh4ggenl5adfj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, kunal1.joshi@intel.com,
 ankit.k.nautiyal@intel.com, mohammed.thasleem@intel.com
References: <20260209103445.1468369-1-santhosh.reddy.guddati@intel.com>
 <5dbbbe95-52ed-4c62-b159-3b9dd6ec4c39@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5dbbbe95-52ed-4c62-b159-3b9dd6ec4c39@intel.com>
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

Hi Karthik,
On 2026-02-16 at 09:09:15 +0530, Karthik B S wrote:
> 
> On 2/9/2026 4:04 PM, Santhosh Reddy Guddati wrote:
> > dp-mst subtests fails with both outputs trying to use pipe A.
> > 
> > The test finds a free CRTC and this CRTC is not being used and instead
> > uses a hard coded pipe with igt_output_set_crtc.
> > 
> > Fix by using the found CRTC directly and remove unused pipe variable.
> > 
> > Fixes: 4122d450aef2 ("tests/kms: Convert to for_each_crtc(), part 4")
> > 
> > V2: Add fixes tag and fix commit subject (Kunal)
> > 
> > Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Thank you all, I fixed merge conflict and pushed this.

Regards,
Kamil

> > ---
> >   tests/kms_content_protection.c | 6 +-----
> >   1 file changed, 1 insertion(+), 5 deletions(-)
> > 
> > diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> > index 40f9c418d..d2bbea351 100644
> > --- a/tests/kms_content_protection.c
> > +++ b/tests/kms_content_protection.c
> > @@ -867,15 +867,12 @@ test_content_protection_mst(int content_type)
> >   	igt_output_t *output;
> >   	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
> >   	igt_crtc_t *crtc;
> > -	enum pipe pipe;
> >   	bool pipe_found;
> >   	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
> >   	for_each_crtc(display, crtc)
> >   		max_pipe++;
> > -	pipe = PIPE_A;
> > -
> >   	for_each_connected_output(display, output) {
> >   		if (!output_is_dp_mst(output, dp_mst_outputs))
> >   			continue;
> > @@ -891,8 +888,7 @@ test_content_protection_mst(int content_type)
> >   		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
> > -		igt_output_set_crtc(output,
> > -				    igt_crtc_for_pipe(output->display, pipe));
> > +		igt_output_set_crtc(output, crtc);
> >   		prepare_modeset_on_mst_output(output, false);
> >   		dp_mst_outputs++;
> >   		if (output_hdcp_capable(output, content_type))
