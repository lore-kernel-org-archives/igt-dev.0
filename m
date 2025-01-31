Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7359CC0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 17:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3078F10E409;
	Fri, 31 Jan 2025 17:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNmOYxSr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B40010E409
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 17:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738344544; x=1769880544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ri5bGdkgcW7gS1l5SEjNqsQWsYZ+7ZbjLW4ruNZfhh8=;
 b=dNmOYxSr7ZOjgqPhcIicRLODCde2YLwLMdfEkouGUn+fWGS84FSB5EJD
 HmPdTPJC55HfQECwQKCksTX+dVoRNSBW3l+RD1zTSJEtuFmtWK/YLT+KG
 WQqvFUG9/8ren95cRNWgJGIlW0UOvkVZU3VLrOY/gsdErD/83fYU/zDXi
 GV8LY0fe4TBj5CUGbbAuh7xx8yqUencuYfmnNKkur3DSFHxbaIxSw2IgR
 WS9DmHZ/erCTyIqHo1ueotwscRVfQsv/J7sHGY7Yd/8gkGkCBwx4957if
 YvUb6iMZ6poMhusUdWXsk4qClIqcTHMEvOB6TWJLNuHCrqZJHDU31XxdF A==;
X-CSE-ConnectionGUID: L584RhqPSZqpCqN/h36Zcg==
X-CSE-MsgGUID: S1oHY0jfSlqu2HK1Ljv2wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49578509"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="49578509"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 09:29:04 -0800
X-CSE-ConnectionGUID: 7HKS8FUbRLSDqfe05KwrRw==
X-CSE-MsgGUID: ZPcQCVp2RTCaHG/9x6rIkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="114683403"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 09:29:02 -0800
Date: Fri, 31 Jan 2025 18:28:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_create: Stop treating the
 extension field as MBZ
Message-ID: <20250131172848.btsuno7ilopsoaud@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20250130221457.1092670-1-daniele.ceraolospurio@intel.com>
 <20250130221457.1092670-3-daniele.ceraolospurio@intel.com>
 <20250131125928.ivnojwqamlsvem6s@kamilkon-desk.igk.intel.com>
 <008c9383-5022-4f5e-8a85-022100d15242@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <008c9383-5022-4f5e-8a85-022100d15242@intel.com>
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

Hi Daniele,
On 2025-01-31 at 09:09:43 -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 1/31/2025 4:59 AM, Kamil Konieczny wrote:
> > Hi Daniele,
> > On 2025-01-30 at 14:14:56 -0800, Daniele Ceraolo Spurio wrote:
> > > A new extension for the xe_create ioctl will be added to support PXP [1],
> > > so in preparation for that to be merged stop expecting the field to always
> > > be zero.
> > > 
> > > [1] https://patchwork.freedesktop.org/patch/634550/
> > Please add also lore.kernel.org link (could be done at merge)
> > here and in next patch, Thanks!
> 
> Should I just replace this link instead of adding a new one?

Write both links or only lore, up to you.
Please note that sometimes links get lost so it could help giving
also a subject of patch(series) (for example above in next line
after [1]).

Regards,
Kamil

> 
> Thanks,
> Daniele
> 
> > 
> > Regards,
> > Kamil
> > 
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > ---
> > >   tests/intel/xe_create.c | 5 -----
> > >   1 file changed, 5 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> > > index e3be6b774..e3ebb9fd4 100644
> > > --- a/tests/intel/xe_create.c
> > > +++ b/tests/intel/xe_create.c
> > > @@ -243,11 +243,6 @@ static void create_invalid_mbz(int fd)
> > >   	gem_close(fd, create.handle);
> > >   	create.handle = 0;
> > > -	/* No supported extensions yet */
> > > -	create.extensions = -1;
> > > -	igt_assert_eq(__ioctl_create(fd, &create), -EINVAL);
> > > -	create.extensions = 0;
> > > -
> > >   	/* Make sure KMD rejects non-zero padding/reserved fields */
> > >   	for (i = 0; i < ARRAY_SIZE(create.pad); i++) {
> > >   		create.pad[i] = -1;
> > > -- 
> > > 2.43.0
> > > 
> 
