Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0E0D116F7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 06:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCA610E02E;
	Fri, 25 Oct 2024 06:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luI0x/nE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C86D10E02E
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 06:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729836055; x=1761372055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ENx5ybiJ7J7WbyWlj+hFP8CaUK4IItgO5rW6CagQ0RA=;
 b=luI0x/nEs+5WzgzMdx8O99E3xWVoJ8g0N1H8onQmvWJjowcpSsBRB1W+
 gzDObiDVgXNZta1Pct9RRr/ziRv0KjCVcxFrmqRkBNZUtd+vPhDzWziYL
 3zq8bgU7UroXq3QoVMFOLp2M2xJD/pmWGb1Tpkr1sthRwqPW6CNOd5Iz8
 I3L2un2iHCocroJhWOvHGQUhngVjrOEXgiuFcM75tR7RnbfAKHunh/5GR
 Pga2tCicQ9EYwhVpxH82fstJdfNThjUdhNRIPhzYKPoiUG7Bj7yexClKv
 uPddKIHyap1aoCbAXdY7L1POrGaGCj9vdZr0lKRf1gZUY/p446cBY7w7j A==;
X-CSE-ConnectionGUID: Wt5QKZjZT++zBtVFtg6pBw==
X-CSE-MsgGUID: MmOxt9EMT5qkJs2ZV/EDVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29435237"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29435237"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 23:00:49 -0700
X-CSE-ConnectionGUID: xUSgQsBCSF2GOgVIWPVFWA==
X-CSE-MsgGUID: lAMEiFR0Q6OWdwaIVop7jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80921195"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 24 Oct 2024 23:00:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Oct 2024 09:00:45 +0300
Date: Fri, 25 Oct 2024 09:00:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: igt-dev@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH i-g-t v2] tests/kms_properties: rework immutability checks
Message-ID: <Zxs0DXIKQDtsCO4k@intel.com>
References: <20241018120058.42240-1-dmitry.baryshkov@linaro.org>
 <CAA8EJpqMaD0Hyjtb0M57gsOWu9fiLEDS8MDBSffuM9NXDn34UQ@mail.gmail.com>
 <Zxsx-askWn17OxIU@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zxsx-askWn17OxIU@intel.com>
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

On Fri, Oct 25, 2024 at 08:51:53AM +0300, Ville Syrjälä wrote:
> On Thu, Oct 24, 2024 at 09:29:03PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 18 Oct 2024 at 15:01, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > Following the discussion on IRC, it is actually an error to require that
> > > properties that can not be chaged are marked as immutable.
> > >
> > > First of all, it creates inconsistent uAPI. Some drivers might have an
> > > immutable property, while others will have it mutable. Yes, there are
> > > known examples for such behaviour (e.g. zpos), but they are clearly
> > > documented in this way.
> > >
> > > Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE defines
> > > more of the 'direction' of the property (whether it is set by the kernel
> > > or it is expected to be set by the userspace) rather than simply states
> > > that there is no way for the userspace to change the property.
> > >
> > > Rework the immutability checks to verify that the properties defined as
> > > immutable have this flag set. Keep the "immutable if single value"
> > > property just for the "zpos" property.
> > >
> > > Fixes: 29ae12bd764e ("tests/kms_properties: Validate properties harder")
> > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Link: https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Gracious ping for the patch. We need it to be able to proceed with the
> > HDMI rework for the drm/msm driver, otherwise IGT tests fail.
> > 
> > >
> > > ---
> > > Changes since v1:
> > >  - Moved GAMMA_LUT_SIZE and DEGAMMA_LUT_SIZE to DRM_MODE_OBJECT_CRTC.
> > >  - Added debug print to help debugging possible issues.
> > > ---
> > >  tests/kms_properties.c | 110 ++++++++++++++++++++++++++++++++---------
> > >  1 file changed, 87 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> > > index a93c93cccf64..57f07e69909a 100644
> > > --- a/tests/kms_properties.c
> > > +++ b/tests/kms_properties.c
> > > @@ -416,16 +416,80 @@ static void test_object_invalid_properties(igt_display_t *display,
> > >                 test_invalid_properties(display->drm_fd, id, type, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
> > >  }
> > >
> > > +enum prop_imm_flags {
> > > +       IMMUTABLE_REQ,
> > > +       IMMUTABLE_IF_SINGLE_VALUE,
> > > +};
> > > +
> > > +static const struct {
> > > +       uint32_t obj_type;
> > > +       const char *name;
> > > +       enum prop_imm_flags flags;
> > > +} prop_settings[] = {
> > > +       /* generic */
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "EDID", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "PATH", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "TILE", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "WRITEBACK_PIXEL_FORMATS", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "non-desktop", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "panel orientation" ,IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "privacy-screen hw-state", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "subconnector", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "suggested X", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "suggested Y", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "vrr_capable", IMMUTABLE_REQ },
> > > +
> > > +       { DRM_MODE_OBJECT_CRTC, "DEGAMMA_LUT_SIZE", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CRTC, "GAMMA_LUT_SIZE", IMMUTABLE_REQ },
> > > +
> > > +       { DRM_MODE_OBJECT_PLANE, "IN_FORMATS", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_PLANE, "SIZE_HINTS", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_PLANE, "type", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_PLANE, "zpos", IMMUTABLE_IF_SINGLE_VALUE },
> > > +
> > > +       /* driver-specific */
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "hotplug_mode_update", IMMUTABLE_REQ }, // qxl, vmwgfx
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "implicit_placement", IMMUTABLE_REQ }, // vmwgfx
> > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_BLEND_LUT_SIZE", IMMUTABLE_REQ }, // amdgpu
> > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_DEGAMMA_LUT_SIZE", IMMUTABLE_REQ }, // amdgpu
> > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_LUT3D_SIZE", IMMUTABLE_REQ }, // amdgpu
> > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_SHAPER_LUT_SIZE", IMMUTABLE_REQ }, // amdgpu
> > > +};
> 
> Not really a fan of having a list like this. All of these look
> like they are just regular immutable properties, with zpos being
> the only exception. Or is that not the case?

Hmm. I suppose it might be nice to have a "these are the standard
properites and their expected types" kind of test, to make sure no
one breaks uabi with any kernel changes. But that seems orthogonal
to the zpos problem at hand.

-- 
Ville Syrjälä
Intel
