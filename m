Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CCACCF9E9
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 09:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2081310EB81;
	Thu, 26 Sep 2024 09:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dA83iwdY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F26E10EB81
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 09:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727343980; x=1758879980;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=d8zy4SG4n6yU4uzOAITyQf7KEpLrLGg+EQikz9dB40I=;
 b=dA83iwdYZsGsX3+zt1447MbHkxcONEyknra6pT802rbl6pLdauIYj1es
 c2892L8C2Bn4L0X9UabobPIG/zoYviqQsyBXiJEop074oyffGBlSK0hiP
 m8PYOj9aDloQPE1msictqPkns6l9FVTaBLz9xsNmawGpMeGy20m7w9Ktf
 kvSOkiFRULrgTMEYt90fmRweYpW0g/V4PSnAar1seQ/5dSo8I+kKkdIlm
 4YXFvxkaWMNmKtmVMTlguaWLGLvLbwGcA3BsAD1PV8yszJUAwvCjVri0S
 tHxDoi7XS6RtDprVg6xmPwb2lIm5ZioMSNOmdQcVnjPcc/7s9tJdGgA0L A==;
X-CSE-ConnectionGUID: hW3+MVZ2SJGTdlUut4mDiQ==
X-CSE-MsgGUID: OAIviWZRT0GD/SWRZlv6Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="25936525"
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; d="scan'208";a="25936525"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 02:46:20 -0700
X-CSE-ConnectionGUID: Ai8SM4U3Rhmq20a2n4LqSQ==
X-CSE-MsgGUID: aZeDIjJHQRqcjoloYgKnQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; d="scan'208";a="72230405"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 26 Sep 2024 02:46:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 26 Sep 2024 12:46:14 +0300
Date: Thu, 26 Sep 2024 12:46:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH i-g-t v7 09/16] drm-uapi/xe: Sync with eudebug uapi
Message-ID: <ZvUtZlbFuwXU1Hnm@intel.com>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
 <20240918113017.144687-10-christoph.manszewski@intel.com>
 <ZvRjJlSZ2tDeyoxq@intel.com>
 <b9f43675-db3d-401a-92ec-f77db112fa20@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9f43675-db3d-401a-92ec-f77db112fa20@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Sep 26, 2024 at 11:01:22AM +0200, Manszewski, Christoph wrote:
> Hi Ville,
> 
> On 25.09.2024 21:23, Ville Syrjälä wrote:
> > On Wed, Sep 18, 2024 at 01:30:10PM +0200, Christoph Manszewski wrote:
> >> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> >>
> >> Align with kernel commit 09411c6ecbef ("drm/xe/eudebug: Add debug
> >> metadata support for xe_eudebug") from:
> >>
> >> https://gitlab.freedesktop.org/miku/kernel.git
> >>
> >> which introduces most recent changes to the eudebug uapi.
> >>
> >> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> >> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> >> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> >> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> >> ---
> >>   include/drm-uapi/xe_drm_eudebug.h | 341 ++++++++++++++++++++++++++++++
> > 
> > I don't think non-upstream stuff should go here. This
> > will now screw up anyone (namely me) attempting to do
> > a bulk update the uapi headers.
> 
> Can you share how exactly? And also where it should go according to 
> you/how that would fix the problem?

include/drm-uapi-experimental or something?

> 
> In general, the kernel reference for this series tries to keep up with 
> the latest Xe driver. If there is some breaking change in the Xe uapi, 
> then just let us know, we will adapt this header ourselves.

I don't care what's in the header. If I simply follow the documented
procedure to update the headers this header is going to be deleted.

And the fact that the eudebug stuff is disabled by default in
meson_options means that I probably wouldn't even notice that
anything broke. This time I did catch the issue manually because
having a header completely deleted looked a bit suspicious in
the diffstat.

One hopes that CI would also have caught it, but I don't actually
know whether CI enables this stuff either?

-- 
Ville Syrjälä
Intel
