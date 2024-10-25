Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2587D0C61C
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 14:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C31D10EAFC;
	Fri, 25 Oct 2024 14:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlPXTrXG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E327410EAFC
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729866989; x=1761402989;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ub705IfRr44s+93MhhCTOWj3SduyodI1ICxuZ7EjRbw=;
 b=hlPXTrXGNKZCe5KLg/74NvIGdUHX2jty+8QcCryYvmFLv5qFWel9FEVb
 aWxVKM1t3PFQV+c+9MblXNKiTzwvUVhkUQe1QQQF+UIH8pAELwBCzoJat
 wAsCVGyrDkM0KncDy4cJuTFKw1ZDCHXtFbTxhSVyPNiFGtbUPgAvrxs3F
 G555b4cFwbsemKuA32xYg2KadrnpGggCJyKJQNSqLlXH6niohG8rcdJ7V
 zwWy8c39HM6KIx+BNFtqWoW8ivyV/Tl2rdOnQ1aYsqPCax67O4bNPdKYH
 gTLxQrRh+73DCsW4hxZplI8sTwzFwi0nDyvzn/K1g6MB7L7SFFYlJOyWE g==;
X-CSE-ConnectionGUID: K/VKuwBGTW21IFRVCyAz7Q==
X-CSE-MsgGUID: YUMshwgkRoOBnK+6UvFvmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29401837"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29401837"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 07:36:28 -0700
X-CSE-ConnectionGUID: 0RY/CRnERwymS1u9IFdz1g==
X-CSE-MsgGUID: PuXFxfVXTjGgt/VUSagJow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81039879"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 25 Oct 2024 07:36:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Oct 2024 17:36:24 +0300
Date: Fri, 25 Oct 2024 17:36:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Simona Vetter <simona@ffwll.ch>, igt-dev@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH i-g-t v2] tests/kms_properties: rework immutability checks
Message-ID: <Zxus6Go3vAEZBCj0@intel.com>
References: <20241018120058.42240-1-dmitry.baryshkov@linaro.org>
 <CAA8EJpqMaD0Hyjtb0M57gsOWu9fiLEDS8MDBSffuM9NXDn34UQ@mail.gmail.com>
 <Zxsx-askWn17OxIU@intel.com>
 <CAA8EJprtZSurjVKt5rc_x3d+Tm07MNzBHPqVXETQC3h23O-Wfw@mail.gmail.com>
 <ZxtvU6ShNgULKinM@intel.com>
 <CAA8EJpp+d9Ntuy9YEdySTjtBc7pUMAbbNTjREcLc+=6i13CcpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJpp+d9Ntuy9YEdySTjtBc7pUMAbbNTjREcLc+=6i13CcpA@mail.gmail.com>
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

On Fri, Oct 25, 2024 at 01:26:47PM +0300, Dmitry Baryshkov wrote:
> On Fri, 25 Oct 2024 at 13:13, Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Fri, Oct 25, 2024 at 12:53:29PM +0300, Dmitry Baryshkov wrote:
> > > On Fri, 25 Oct 2024 at 08:51, Ville Syrjälä
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Thu, Oct 24, 2024 at 09:29:03PM +0300, Dmitry Baryshkov wrote:
> > > > > On Fri, 18 Oct 2024 at 15:01, Dmitry Baryshkov
> > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > >
> > > > > > Following the discussion on IRC, it is actually an error to require that
> > > > > > properties that can not be chaged are marked as immutable.
> > > > > >
> > > > > > First of all, it creates inconsistent uAPI. Some drivers might have an
> > > > > > immutable property, while others will have it mutable. Yes, there are
> > > > > > known examples for such behaviour (e.g. zpos), but they are clearly
> > > > > > documented in this way.
> > > > > >
> > > > > > Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE defines
> > > > > > more of the 'direction' of the property (whether it is set by the kernel
> > > > > > or it is expected to be set by the userspace) rather than simply states
> > > > > > that there is no way for the userspace to change the property.
> > > > > >
> > > > > > Rework the immutability checks to verify that the properties defined as
> > > > > > immutable have this flag set. Keep the "immutable if single value"
> > > > > > property just for the "zpos" property.
> > > > > >
> > > > > > Fixes: 29ae12bd764e ("tests/kms_properties: Validate properties harder")
> > > > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > Link: https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > >
> > > > > Gracious ping for the patch. We need it to be able to proceed with the
> > > > > HDMI rework for the drm/msm driver, otherwise IGT tests fail.
> > > > >
> > > > > >
> > > > > > ---
> > > > > > Changes since v1:
> > > > > >  - Moved GAMMA_LUT_SIZE and DEGAMMA_LUT_SIZE to DRM_MODE_OBJECT_CRTC.
> > > > > >  - Added debug print to help debugging possible issues.
> > > > > > ---
> > > > > >  tests/kms_properties.c | 110 ++++++++++++++++++++++++++++++++---------
> > > > > >  1 file changed, 87 insertions(+), 23 deletions(-)
> > > > > >
> > > > > > diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> > > > > > index a93c93cccf64..57f07e69909a 100644
> > > > > > --- a/tests/kms_properties.c
> > > > > > +++ b/tests/kms_properties.c
> > > > > > @@ -416,16 +416,80 @@ static void test_object_invalid_properties(igt_display_t *display,
> > > > > >                 test_invalid_properties(display->drm_fd, id, type, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
> > > > > >  }
> > > > > >
> > > > > > +enum prop_imm_flags {
> > > > > > +       IMMUTABLE_REQ,
> > > > > > +       IMMUTABLE_IF_SINGLE_VALUE,
> > > > > > +};
> > > > > > +
> > > > > > +static const struct {
> > > > > > +       uint32_t obj_type;
> > > > > > +       const char *name;
> > > > > > +       enum prop_imm_flags flags;
> > > > > > +} prop_settings[] = {
> > > > > > +       /* generic */
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "EDID", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "PATH", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "TILE", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "WRITEBACK_PIXEL_FORMATS", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "non-desktop", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "panel orientation" ,IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "privacy-screen hw-state", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "subconnector", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "suggested X", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "suggested Y", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "vrr_capable", IMMUTABLE_REQ },
> > > > > > +
> > > > > > +       { DRM_MODE_OBJECT_CRTC, "DEGAMMA_LUT_SIZE", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_CRTC, "GAMMA_LUT_SIZE", IMMUTABLE_REQ },
> > > > > > +
> > > > > > +       { DRM_MODE_OBJECT_PLANE, "IN_FORMATS", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_PLANE, "SIZE_HINTS", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_PLANE, "type", IMMUTABLE_REQ },
> > > > > > +       { DRM_MODE_OBJECT_PLANE, "zpos", IMMUTABLE_IF_SINGLE_VALUE },
> > > > > > +
> > > > > > +       /* driver-specific */
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "hotplug_mode_update", IMMUTABLE_REQ }, // qxl, vmwgfx
> > > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "implicit_placement", IMMUTABLE_REQ }, // vmwgfx
> > > > > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_BLEND_LUT_SIZE", IMMUTABLE_REQ }, // amdgpu
> > > > > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_DEGAMMA_LUT_SIZE", IMMUTABLE_REQ }, // amdgpu
> > > > > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_LUT3D_SIZE", IMMUTABLE_REQ }, // amdgpu
> > > > > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_SHAPER_LUT_SIZE", IMMUTABLE_REQ }, // amdgpu
> > > > > > +};
> > > >
> > > > Not really a fan of having a list like this. All of these look
> > > > like they are just regular immutable properties, with zpos being
> > > > the only exception. Or is that not the case?
> > >
> > > Yes. The goal is to perform the ABI check: which properties are
> > > documented to be immutable. All other properties are expected to be
> > > mutable.
> > >
> > > >
> > > > What was the problem of just dropping the check that non-immutable
> > > > properties must have multiple possible values?
> > >
> > > See the discussion at [1] and then the response by Sima [2] to the
> > > patch similar to your proposal.
> > >
> > > [1] https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622
> > > [2] https://lore.kernel.org/igt-dev/Zpjn2dTHDrBBuTVH@phenom.ffwll.local/
> >
> > I'm not seeing any real conclusions there. Looks to me
> > like the correct thing would be to just remove that
> > single value => immutable assumption.
> 
> Sima rejected such a patch, [2].

Looks rather to me that a bunch of people agreed we don't
need the immutable on zpos. And if we don't have other wonky
properties like this then the problem is would appear to be
solved.

-- 
Ville Syrjälä
Intel
