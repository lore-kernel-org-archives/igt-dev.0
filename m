Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91C7D116F6
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 05:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8F610E02E;
	Fri, 25 Oct 2024 05:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+Ldids2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D8710E02E
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 05:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729835518; x=1761371518;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vB+qOe8JBN+FqVEUgqC6OMHPqPg8mByuR0SdwZi+TjE=;
 b=l+Ldids2wL3LuUuZz/bB3K4JyA40ynPZkGST4J7GhNHNHEx0RHfKiTAT
 ZIvq7S2BrABhD3ip4GMVycN5VYiqYopkvzGKWbr6tc+cgVg1fJSrzuNWz
 u3G4wM6DwJ/aoX2Vnhr5GcspuNSnZ14FwGZfJoYlWBYEn/sU/XQybXN8f
 /nvCf9NUMDQusx+nJAPn/dZ7XB4OcoHKArriKOK+8p/4bYCZaNqWrewNy
 2NbXwZRmSgLIeuXPQ689Y9UXkh6YRE6XRbWQmRV90vq+DhA69ZqtHsLR1
 26q/Ghg18KEuRdMghHqEKc4WLcCsijL2k4UttmrDOcWT/jrqXeFMyYf7R A==;
X-CSE-ConnectionGUID: tnWuh5GcTRmApIqIInYXpQ==
X-CSE-MsgGUID: phASg0IHS/qBRooOnfUJ5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29619993"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29619993"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 22:51:57 -0700
X-CSE-ConnectionGUID: rQQs9qDVScWkZzLTe+hPEQ==
X-CSE-MsgGUID: m/XYWo2ZSDCzhub1UCM/jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80919123"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 24 Oct 2024 22:51:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Oct 2024 08:51:53 +0300
Date: Fri, 25 Oct 2024 08:51:53 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: igt-dev@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH i-g-t v2] tests/kms_properties: rework immutability checks
Message-ID: <Zxsx-askWn17OxIU@intel.com>
References: <20241018120058.42240-1-dmitry.baryshkov@linaro.org>
 <CAA8EJpqMaD0Hyjtb0M57gsOWu9fiLEDS8MDBSffuM9NXDn34UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJpqMaD0Hyjtb0M57gsOWu9fiLEDS8MDBSffuM9NXDn34UQ@mail.gmail.com>
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

On Thu, Oct 24, 2024 at 09:29:03PM +0300, Dmitry Baryshkov wrote:
> On Fri, 18 Oct 2024 at 15:01, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Following the discussion on IRC, it is actually an error to require that
> > properties that can not be chaged are marked as immutable.
> >
> > First of all, it creates inconsistent uAPI. Some drivers might have an
> > immutable property, while others will have it mutable. Yes, there are
> > known examples for such behaviour (e.g. zpos), but they are clearly
> > documented in this way.
> >
> > Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE defines
> > more of the 'direction' of the property (whether it is set by the kernel
> > or it is expected to be set by the userspace) rather than simply states
> > that there is no way for the userspace to change the property.
> >
> > Rework the immutability checks to verify that the properties defined as
> > immutable have this flag set. Keep the "immutable if single value"
> > property just for the "zpos" property.
> >
> > Fixes: 29ae12bd764e ("tests/kms_properties: Validate properties harder")
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Link: https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Gracious ping for the patch. We need it to be able to proceed with the
> HDMI rework for the drm/msm driver, otherwise IGT tests fail.
> 
> >
> > ---
> > Changes since v1:
> >  - Moved GAMMA_LUT_SIZE and DEGAMMA_LUT_SIZE to DRM_MODE_OBJECT_CRTC.
> >  - Added debug print to help debugging possible issues.
> > ---
> >  tests/kms_properties.c | 110 ++++++++++++++++++++++++++++++++---------
> >  1 file changed, 87 insertions(+), 23 deletions(-)
> >
> > diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> > index a93c93cccf64..57f07e69909a 100644
> > --- a/tests/kms_properties.c
> > +++ b/tests/kms_properties.c
> > @@ -416,16 +416,80 @@ static void test_object_invalid_properties(igt_display_t *display,
> >                 test_invalid_properties(display->drm_fd, id, type, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
> >  }
> >
> > +enum prop_imm_flags {
> > +       IMMUTABLE_REQ,
> > +       IMMUTABLE_IF_SINGLE_VALUE,
> > +};
> > +
> > +static const struct {
> > +       uint32_t obj_type;
> > +       const char *name;
> > +       enum prop_imm_flags flags;
> > +} prop_settings[] = {
> > +       /* generic */
> > +       { DRM_MODE_OBJECT_CONNECTOR, "EDID", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_CONNECTOR, "PATH", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_CONNECTOR, "TILE", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_CONNECTOR, "WRITEBACK_PIXEL_FORMATS", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_CONNECTOR, "non-desktop", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_CONNECTOR, "panel orientation" ,IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_CONNECTOR, "privacy-screen hw-state", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_CONNECTOR, "subconnector", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_CONNECTOR, "suggested X", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_CONNECTOR, "suggested Y", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_CONNECTOR, "vrr_capable", IMMUTABLE_REQ },
> > +
> > +       { DRM_MODE_OBJECT_CRTC, "DEGAMMA_LUT_SIZE", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_CRTC, "GAMMA_LUT_SIZE", IMMUTABLE_REQ },
> > +
> > +       { DRM_MODE_OBJECT_PLANE, "IN_FORMATS", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_PLANE, "SIZE_HINTS", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_PLANE, "type", IMMUTABLE_REQ },
> > +       { DRM_MODE_OBJECT_PLANE, "zpos", IMMUTABLE_IF_SINGLE_VALUE },
> > +
> > +       /* driver-specific */
> > +       { DRM_MODE_OBJECT_CONNECTOR, "hotplug_mode_update", IMMUTABLE_REQ }, // qxl, vmwgfx
> > +       { DRM_MODE_OBJECT_CONNECTOR, "implicit_placement", IMMUTABLE_REQ }, // vmwgfx
> > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_BLEND_LUT_SIZE", IMMUTABLE_REQ }, // amdgpu
> > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_DEGAMMA_LUT_SIZE", IMMUTABLE_REQ }, // amdgpu
> > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_LUT3D_SIZE", IMMUTABLE_REQ }, // amdgpu
> > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_SHAPER_LUT_SIZE", IMMUTABLE_REQ }, // amdgpu
> > +};

Not really a fan of having a list like this. All of these look
like they are just regular immutable properties, with zpos being
the only exception. Or is that not the case?

What was the problem of just dropping the check that non-immutable
properties must have multiple possible values?

And perhaps there should be instead a check that immutable
properties must not have more than one possible value?

> > +
> > +static void validate_prop_immutable(const struct drm_mode_get_property *prop,
> > +                                   uint32_t obj_type, bool single_value)
> > +{
> > +       bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
> > +       int i;
> > +
> > +       igt_debug("Testing property \"%s\"\n", prop->name);
> > +
> > +       for (i = 0; i < ARRAY_SIZE(prop_settings); i++) {
> > +               if (prop_settings[i].obj_type == obj_type &&
> > +                   !strcmp(prop_settings[i].name, prop->name))
> > +                       break;
> > +       }
> > +
> > +       if (i == ARRAY_SIZE(prop_settings)) {
> > +               igt_assert(!immutable);
> > +               return;
> > +       }
> > +
> > +       igt_assert(immutable || prop_settings[i].flags != IMMUTABLE_REQ);
> > +       igt_assert(immutable || !single_value ||
> > +                  prop_settings[i].flags != IMMUTABLE_IF_SINGLE_VALUE);
> > +}
> > +
> >  static void validate_range_prop(const struct drm_mode_get_property *prop,
> > -                               uint64_t value)
> > +                               uint64_t value, uint32_t obj_type)
> >  {
> >         const uint64_t *values = from_user_pointer(prop->values_ptr);
> >         bool is_unsigned = prop->flags & DRM_MODE_PROP_RANGE;
> > -       bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
> >
> >         igt_assert_eq(prop->count_values, 2);
> >         igt_assert_eq(prop->count_enum_blobs, 0);
> > -       igt_assert(values[0] != values[1] || immutable);
> > +
> > +       validate_prop_immutable(prop, obj_type, values[0] == values[1]);
> >
> >         if (is_unsigned) {
> >                 igt_assert_lte_u64(values[0], values[1]);
> > @@ -458,15 +522,14 @@ static void validate_enums(const struct drm_mode_get_property *prop)
> >  }
> >
> >  static void validate_enum_prop(const struct drm_mode_get_property *prop,
> > -                              uint64_t value)
> > +                              uint64_t value, uint32_t obj_type)
> >  {
> >         const uint64_t *values = from_user_pointer(prop->values_ptr);
> > -       bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
> >         int i;
> >
> >         igt_assert_lte(1, prop->count_values);
> >         igt_assert_eq(prop->count_enum_blobs, prop->count_values);
> > -       igt_assert(prop->count_values != 1 || immutable);
> > +       validate_prop_immutable(prop, obj_type, prop->count_values == 1);
> >
> >         for (i = 0; i < prop->count_values; i++) {
> >                 if (value == values[i])
> > @@ -478,15 +541,14 @@ static void validate_enum_prop(const struct drm_mode_get_property *prop,
> >  }
> >
> >  static void validate_bitmask_prop(const struct drm_mode_get_property *prop,
> > -                                 uint64_t value)
> > +                                 uint64_t value, uint32_t obj_type)
> >  {
> >         const uint64_t *values = from_user_pointer(prop->values_ptr);
> > -       bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
> >         uint64_t mask = 0;
> >
> >         igt_assert_lte(1, prop->count_values);
> >         igt_assert_eq(prop->count_enum_blobs, prop->count_values);
> > -       igt_assert(prop->count_values != 1 || immutable);
> > +       validate_prop_immutable(prop, obj_type, prop->count_values == 1);
> >
> >         for (int i = 0; i < prop->count_values; i++) {
> >                 igt_assert_lte_u64(values[i], 63);
> > @@ -501,7 +563,7 @@ static void validate_bitmask_prop(const struct drm_mode_get_property *prop,
> >
> >  static void validate_blob_prop(int fd,
> >                                const struct drm_mode_get_property *prop,
> > -                              uint64_t value)
> > +                              uint64_t value, uint32_t obj_type)
> >  {
> >         struct drm_mode_get_blob blob;
> >
> > @@ -515,6 +577,8 @@ static void validate_blob_prop(int fd,
> >
> >         igt_assert_lte_u64(value, 0xffffffff);
> >
> > +       validate_prop_immutable(prop, obj_type, false);
> > +
> >         /*
> >          * Immutable blob properties can have value==0.
> >          * Happens for example with the "EDID" property
> > @@ -532,10 +596,9 @@ static void validate_blob_prop(int fd,
> >
> >  static void validate_object_prop(int fd,
> >                                  const struct drm_mode_get_property *prop,
> > -                                uint64_t value)
> > +                                uint64_t value, uint32_t obj_type)
> >  {
> >         const uint64_t *values = from_user_pointer(prop->values_ptr);
> > -       bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
> >         struct drm_mode_crtc crtc;
> >         struct drm_mode_fb_cmd fb;
> >
> > @@ -543,7 +606,7 @@ static void validate_object_prop(int fd,
> >         igt_assert_eq(prop->count_enum_blobs, 0);
> >
> >         igt_assert_lte_u64(value, 0xffffffff);
> > -       igt_assert(!immutable || value != 0);
> > +       validate_prop_immutable(prop, obj_type, value == 0);
> >
> >         switch (values[0]) {
> >         case DRM_MODE_OBJECT_CRTC:
> > @@ -568,7 +631,7 @@ static void validate_object_prop(int fd,
> >
> >  static void validate_property(int fd,
> >                               const struct drm_mode_get_property *prop,
> > -                             uint64_t value, bool atomic)
> > +                             uint64_t value, bool atomic, uint32_t obj_type)
> >  {
> >         uint32_t flags = prop->flags;
> >         uint32_t legacy_type = flags & DRM_MODE_PROP_LEGACY_TYPE;
> > @@ -589,16 +652,16 @@ static void validate_property(int fd,
> >
> >         switch (legacy_type) {
> >         case DRM_MODE_PROP_RANGE:
> > -               validate_range_prop(prop, value);
> > +               validate_range_prop(prop, value, obj_type);
> >                 break;
> >         case DRM_MODE_PROP_ENUM:
> > -               validate_enum_prop(prop, value);
> > +               validate_enum_prop(prop, value, obj_type);
> >                 break;
> >         case DRM_MODE_PROP_BITMASK:
> > -               validate_bitmask_prop(prop, value);
> > +               validate_bitmask_prop(prop, value, obj_type);
> >                 break;
> >         case DRM_MODE_PROP_BLOB:
> > -               validate_blob_prop(fd, prop, value);
> > +               validate_blob_prop(fd, prop, value, obj_type);
> >                 break;
> >         default:
> >                 igt_assert_eq(legacy_type, 0);
> > @@ -606,17 +669,18 @@ static void validate_property(int fd,
> >
> >         switch (ext_type) {
> >         case DRM_MODE_PROP_OBJECT:
> > -               validate_object_prop(fd, prop, value);
> > +               validate_object_prop(fd, prop, value, obj_type);
> >                 break;
> >         case DRM_MODE_PROP_SIGNED_RANGE:
> > -               validate_range_prop(prop, value);
> > +               validate_range_prop(prop, value, obj_type);
> >                 break;
> >         default:
> >                 igt_assert_eq(ext_type, 0);
> >         }
> >  }
> >
> > -static void validate_prop(int fd, uint32_t prop_id, uint64_t value, bool atomic)
> > +static void validate_prop(int fd, uint32_t prop_id, uint64_t value,
> > +                         bool atomic, uint32_t obj_type)
> >  {
> >         struct drm_mode_get_property prop;
> >         struct drm_mode_property_enum *enums = NULL;
> > @@ -649,7 +713,7 @@ static void validate_prop(int fd, uint32_t prop_id, uint64_t value, bool atomic)
> >         for (int i = 0; i < prop.count_enum_blobs; i++)
> >                 igt_assert_neq_u64(enums[i].value, 0x5c5c5c5c5c5c5c5cULL);
> >
> > -       validate_property(fd, &prop, value, atomic);
> > +       validate_property(fd, &prop, value, atomic, obj_type);
> >
> >         free(values);
> >         free(enums);
> > @@ -687,7 +751,7 @@ static void validate_props(int fd, uint32_t obj_type, uint32_t obj_id, bool atom
> >         igt_assert(properties.count_props == count);
> >
> >         for (int i = 0; i < count; i++)
> > -               validate_prop(fd, props[i], values[i], atomic);
> > +               validate_prop(fd, props[i], values[i], atomic, obj_type);
> >
> >         free(values);
> >         free(props);
> > --
> > 2.45.2
> >
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
Ville Syrjälä
Intel
