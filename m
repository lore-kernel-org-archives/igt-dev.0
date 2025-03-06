Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B94C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 13:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAA710E1E1;
	Thu,  6 Mar 2025 13:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxiPECOy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7F710E0C0
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741266084; x=1772802084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Tm9Nn8wY6zvy3hLRqIwW7+d8X8k3O/VOd5sg5SVOZrM=;
 b=mxiPECOygtEoJSQjNk50PG/I/Cje74nRUTsLHKep5z26kzWP+LL5Vsl3
 Y9Y8Poq8VjP5AMR3a+b7msoYpc2UWjcGNCshoHFbpXDIzkq0VfgTIRgTF
 npjDYab7Vs6z/Gh28AM6/fYNLMtBLx3+pF2NFFHrlSaW5bvW7vFRA+1tC
 a3DYKbUaSltgV0Q1GADEMMKLi+T6EFmkHpqZzELeoodK239377L1WfEy4
 IpG20sMy1aSbMdOunnWZn8DrlKBxr39sEm6SMMd8JlwavRHBDREoGQwY/
 dGKLpknwon+lWOtUWM76AeMRDgsEmc/1ZAYh3ypLxypnDl4tm7UrTEzjZ Q==;
X-CSE-ConnectionGUID: xUR32NwsQ+a9fDbc54rFOA==
X-CSE-MsgGUID: F0K8E5llQmO8Jr2KAByJHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53256741"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="53256741"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:01:23 -0800
X-CSE-ConnectionGUID: YSTiOJBQTWCKOSrbKb9rtQ==
X-CSE-MsgGUID: xFgj2TTfShS4gqU/K17/rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156233113"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:01:22 -0800
Date: Thu, 6 Mar 2025 14:01:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/kms_draw_crc: Skip formats not
 supported by the plane
Message-ID: <20250306130119.ikrjxb26hljrt4qn@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250303110235.15976-1-ville.syrjala@linux.intel.com>
 <CAJ=qYWRt0KPS_SGhRRWou+iBzAttLZxRnStEeS5NMkQB-zXWoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ=qYWRt0KPS_SGhRRWou+iBzAttLZxRnStEeS5NMkQB-zXWoQ@mail.gmail.com>
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

Hi Juha-Pekka,
On 2025-03-05 at 16:40:07 +0200, Juha-Pekka Heikkilä wrote:
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 

Thank you, applied.

Regards,
Kamil

> On Mon, Mar 3, 2025 at 1:02 PM Ville Syrjala
> <ville.syrjala@linux.intel.com> wrote:
> >
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > The test only checks igt_display_has_format_mod() before
> > deciding to test a specific format. But that doesn't
> > mean the actual plane supports that format. Also check
> > for that once we know which plane to use.
> >
> > Should turn the fp16 failures into skips on IVB because it
> > doesn't have fp16 support on the primary plane.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  tests/intel/kms_draw_crc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
> > index 9c350853cfd9..62c6c64be710 100644
> > --- a/tests/intel/kms_draw_crc.c
> > +++ b/tests/intel/kms_draw_crc.c
> > @@ -158,6 +158,8 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
> >
> >         primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> >
> > +       igt_require(igt_plane_has_format_mod(primary, drm_format, modifier));
> > +
> >         igt_create_fb(drm_fd, mode->hdisplay, mode->vdisplay,
> >                       drm_format, modifier, &fb);
> >         igt_plane_set_fb(primary, &fb);
> > --
> > 2.45.3
> >
