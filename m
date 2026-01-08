Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A362D1D47E
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 15:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD91010E345;
	Thu,  8 Jan 2026 15:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEAp47lg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2097E10E345
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 15:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767886978; x=1799422978;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xeaklmInvOGAkFgNm1jqLkY/fRnSYYP07R2DYaQYwfQ=;
 b=cEAp47lgEahCaoUYnupFyEwFHycq7rqrp+/uOEVaeSqVFT0/Z3bv/PLm
 v48iOh489Mbrmeu9nIqQlofd/9vIliSgSRSdUTw9CyMWcaV9bVpCmovU+
 o1SFTQK6y/3JlzsHaMOksJUhEwDSz4kH2h8CxBqAllxF64l/Rs1TTP3XF
 V7YNVvlL7a4/u1qY4c6FsKw2aBzQF2MBPB/+gu9XyJxWiQMdL6feT4BXc
 OyaC5S1SQmczknGPYXW458yGkKD22DRQlZ3Jkt8F64CFY6RHcT+2chTd8
 PeA/SY4LsYLdSShPRSuZlaVoAqH5uG9XlBCU25irOUrSaTXB0ArYi8f2F g==;
X-CSE-ConnectionGUID: W41T+fu9Sxm31ATfs3DvWg==
X-CSE-MsgGUID: H45oD0BFT2WXmRQpnFnSkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80712048"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="80712048"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:42:58 -0800
X-CSE-ConnectionGUID: n0/MLpJ1R0C91QN1fG616A==
X-CSE-MsgGUID: TL3EoGdtRs+HWIGlMSHQcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="203014764"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 07:42:57 -0800
Date: Thu, 8 Jan 2026 16:42:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] Avoid crash from uninitialized pipe_crc pointer
Message-ID: <20260108154234.qyoayts3d236n4rj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260106084906.31185-1-pranay.samala@intel.com>
 <f5c94af2-b045-46ec-a5eb-d3ab65d5084f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f5c94af2-b045-46ec-a5eb-d3ab65d5084f@intel.com>
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
On 2026-01-06 at 14:37:38 +0530, Reddy Guddati, Santhosh wrote:
> Hi Pranay,
> 
> Please add closes tag if issue is known otherwise, LGTM,
> Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> 

It already got merged but please in future consider adding a prefix
where/what was changed, so anyone could see what is a scope of your
change, here subject could be better:

[PATCH i-g-t] tests/intel/kms_fb_coherency: Avoid crash from uninitialized pipe_crc pointer

or even a shorter one would be better:

[PATCH i-g-t] tests/intel: Avoid crash from uninitialized pipe_crc pointer

Reason behind this is that lib fixes could have greater impact.
Also reading git log --oneline would reveal how large is a change.

Regards,
Kamil

> On 06-01-2026 14:19, Pranay Samala wrote:
> > The data_t structure was not initialized, leaving pipe_crc with an
> > undefined value on first use and could result in freeing an invalid
> > pointer.
> > Initialize data_t to zero so pipe_crc starts as NULL and the
> > cleanup path safely manages the CRC object.
> > 
> > Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> > ---
> >   tests/intel/kms_fb_coherency.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
> > index 59bc29d19..ca915bc16 100644
> > --- a/tests/intel/kms_fb_coherency.c
> > +++ b/tests/intel/kms_fb_coherency.c
> > @@ -238,7 +238,7 @@ static void select_valid_pipe_output_combo(data_t *data)
> >   int igt_main()
> >   {
> > -	data_t data;
> > +	data_t data = { 0 };
> >   	igt_fixture() {
> >   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> 
