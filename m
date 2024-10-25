Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E05BD0C5F8
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 09:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2548A10EA5A;
	Fri, 25 Oct 2024 09:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y5gG/zBK";
	dkim-atps=neutral
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D2A10EA5A
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 09:53:41 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6e34fa656a2so19338547b3.1
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 02:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729850020; x=1730454820; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wei3UYUjHDshVO7eKSDTVMDVW221u6g4Uvabqg1jfQA=;
 b=Y5gG/zBKMhhTDBOCetHTnhi//zaEOUTFTzcXNoAP2Wq+QHyNfZpMIDJPKyA2xAJ9QS
 KMJ42SEgKsY1OOUsfPfEnBKeynNQKv3SdeUWeLcnkVDyOq9JojQ0bsxmgmRlKEyczXC6
 1VqW4JKy/OJhHMK8qLCFSDBAaICnPyL5gS47bjFmG+4e53xW7jrPXfmGUtZCXjvjxyoG
 FFWjHLIBluo3fZfcshEXJs5dqphRDARSK356eEWWaGlceGd+Q1L24BOueZIR9HveMD3V
 8JblSealqLOmhkhHfs/vEmidYF5Y9DXk+M91iWXW6dcj/XEORL6203w3MHEJQ6MkbqqD
 P3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729850020; x=1730454820;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wei3UYUjHDshVO7eKSDTVMDVW221u6g4Uvabqg1jfQA=;
 b=DcffYm2i4g1fiLzMER7l/WSIWeTt7F64Vug91yhCIuztA757WE33cTFc4WBbFqPvcp
 zjpNOEB9ROTwCz4mIG4d+zvcbq/A1AdNSXRoV1n/uVlRyyWrd5oznP3yfOYC3Zf4Ywnb
 3cWMuoFRZKxg/LyX+GH0/MNJKTQEOUqtmp9jOqRjSOB1/W0r/ms7co30g58IV5puvfvY
 tU/U34p5aXmuWL7d3JXaLijR1eTHD8lcOVuBWw/174A2omy1yZftSKSd5+mdqQDfaww8
 JNX6rKzqpO54XLnO+kS1XNGHORXDBdwxkXoSR2oAtCXmqE7tG3WH4nyU/zVDlhT+Vfjh
 H/vA==
X-Gm-Message-State: AOJu0YyNSF24knYrBvhsQO6hmM2xeq5PgnO5zkQbsxieWRkwYmllASeR
 F8hH14ChoB3VHPBYk5yUEUM7iBzSXp0wWT42FITKoADFNEA85wtHp4P61riDVBHUFH5HmSCKWP7
 V31R+aNQBb3YLG3mM3XN43VdjRALMXUb8TpoQrA==
X-Google-Smtp-Source: AGHT+IHY5dZiRtnZBaBXpLayEF7nh9aSbzXjvp62trAQH761dif1N3pOiyoQIy5U3u2VlND8D20mAtCNsKbUKkAnbv8=
X-Received: by 2002:a05:690c:f12:b0:6e9:b591:a333 with SMTP id
 00721157ae682-6e9b591b729mr40301007b3.2.1729850020438; Fri, 25 Oct 2024
 02:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241018120058.42240-1-dmitry.baryshkov@linaro.org>
 <CAA8EJpqMaD0Hyjtb0M57gsOWu9fiLEDS8MDBSffuM9NXDn34UQ@mail.gmail.com>
 <Zxsx-askWn17OxIU@intel.com>
In-Reply-To: <Zxsx-askWn17OxIU@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 12:53:29 +0300
Message-ID: <CAA8EJprtZSurjVKt5rc_x3d+Tm07MNzBHPqVXETQC3h23O-Wfw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_properties: rework immutability checks
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 25 Oct 2024 at 08:51, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Thu, Oct 24, 2024 at 09:29:03PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 18 Oct 2024 at 15:01, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > Following the discussion on IRC, it is actually an error to require t=
hat
> > > properties that can not be chaged are marked as immutable.
> > >
> > > First of all, it creates inconsistent uAPI. Some drivers might have a=
n
> > > immutable property, while others will have it mutable. Yes, there are
> > > known examples for such behaviour (e.g. zpos), but they are clearly
> > > documented in this way.
> > >
> > > Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE define=
s
> > > more of the 'direction' of the property (whether it is set by the ker=
nel
> > > or it is expected to be set by the userspace) rather than simply stat=
es
> > > that there is no way for the userspace to change the property.
> > >
> > > Rework the immutability checks to verify that the properties defined =
as
> > > immutable have this flag set. Keep the "immutable if single value"
> > > property just for the "zpos" property.
> > >
> > > Fixes: 29ae12bd764e ("tests/kms_properties: Validate properties harde=
r")
> > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Link: https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#3337462=
2
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
> > >  tests/kms_properties.c | 110 ++++++++++++++++++++++++++++++++-------=
--
> > >  1 file changed, 87 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> > > index a93c93cccf64..57f07e69909a 100644
> > > --- a/tests/kms_properties.c
> > > +++ b/tests/kms_properties.c
> > > @@ -416,16 +416,80 @@ static void test_object_invalid_properties(igt_=
display_t *display,
> > >                 test_invalid_properties(display->drm_fd, id, type, ou=
tput->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
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
> > > +} prop_settings[] =3D {
> > > +       /* generic */
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "EDID", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "PATH", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "TILE", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "WRITEBACK_PIXEL_FORMATS", IMMUT=
ABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "non-desktop", IMMUTABLE_REQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "panel orientation" ,IMMUTABLE_R=
EQ },
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "privacy-screen hw-state", IMMUT=
ABLE_REQ },
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
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "hotplug_mode_update", IMMUTABLE=
_REQ }, // qxl, vmwgfx
> > > +       { DRM_MODE_OBJECT_CONNECTOR, "implicit_placement", IMMUTABLE_=
REQ }, // vmwgfx
> > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_BLEND_LUT_SIZE", IMMUTABL=
E_REQ }, // amdgpu
> > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_DEGAMMA_LUT_SIZE", IMMUTA=
BLE_REQ }, // amdgpu
> > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_LUT3D_SIZE", IMMUTABLE_RE=
Q }, // amdgpu
> > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_SHAPER_LUT_SIZE", IMMUTAB=
LE_REQ }, // amdgpu
> > > +};
>
> Not really a fan of having a list like this. All of these look
> like they are just regular immutable properties, with zpos being
> the only exception. Or is that not the case?

Yes. The goal is to perform the ABI check: which properties are
documented to be immutable. All other properties are expected to be
mutable.

>
> What was the problem of just dropping the check that non-immutable
> properties must have multiple possible values?

See the discussion at [1] and then the response by Sima [2] to the
patch similar to your proposal.

[1] https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622
[2] https://lore.kernel.org/igt-dev/Zpjn2dTHDrBBuTVH@phenom.ffwll.local/

>
> And perhaps there should be instead a check that immutable
> properties must not have more than one possible value?

This is not a correct assumption, immutable props might have any
number of values. The difference is on semantics side: the driver
controls immutable properties, userspace controls mutable ones.

>
> > > +
> > > +static void validate_prop_immutable(const struct drm_mode_get_proper=
ty *prop,
> > > +                                   uint32_t obj_type, bool single_va=
lue)
> > > +{
> > > +       bool immutable =3D prop->flags & DRM_MODE_PROP_IMMUTABLE;
> > > +       int i;
> > > +
> > > +       igt_debug("Testing property \"%s\"\n", prop->name);
> > > +
> > > +       for (i =3D 0; i < ARRAY_SIZE(prop_settings); i++) {
> > > +               if (prop_settings[i].obj_type =3D=3D obj_type &&
> > > +                   !strcmp(prop_settings[i].name, prop->name))
> > > +                       break;
> > > +       }
> > > +
> > > +       if (i =3D=3D ARRAY_SIZE(prop_settings)) {
> > > +               igt_assert(!immutable);
> > > +               return;
> > > +       }
> > > +
> > > +       igt_assert(immutable || prop_settings[i].flags !=3D IMMUTABLE=
_REQ);
> > > +       igt_assert(immutable || !single_value ||
> > > +                  prop_settings[i].flags !=3D IMMUTABLE_IF_SINGLE_VA=
LUE);
> > > +}
> > > +
> > >  static void validate_range_prop(const struct drm_mode_get_property *=
prop,
> > > -                               uint64_t value)
> > > +                               uint64_t value, uint32_t obj_type)
> > >  {
> > >         const uint64_t *values =3D from_user_pointer(prop->values_ptr=
);
> > >         bool is_unsigned =3D prop->flags & DRM_MODE_PROP_RANGE;
> > > -       bool immutable =3D prop->flags & DRM_MODE_PROP_IMMUTABLE;
> > >
> > >         igt_assert_eq(prop->count_values, 2);
> > >         igt_assert_eq(prop->count_enum_blobs, 0);
> > > -       igt_assert(values[0] !=3D values[1] || immutable);
> > > +
> > > +       validate_prop_immutable(prop, obj_type, values[0] =3D=3D valu=
es[1]);
> > >
> > >         if (is_unsigned) {
> > >                 igt_assert_lte_u64(values[0], values[1]);
> > > @@ -458,15 +522,14 @@ static void validate_enums(const struct drm_mod=
e_get_property *prop)
> > >  }
> > >
> > >  static void validate_enum_prop(const struct drm_mode_get_property *p=
rop,
> > > -                              uint64_t value)
> > > +                              uint64_t value, uint32_t obj_type)
> > >  {
> > >         const uint64_t *values =3D from_user_pointer(prop->values_ptr=
);
> > > -       bool immutable =3D prop->flags & DRM_MODE_PROP_IMMUTABLE;
> > >         int i;
> > >
> > >         igt_assert_lte(1, prop->count_values);
> > >         igt_assert_eq(prop->count_enum_blobs, prop->count_values);
> > > -       igt_assert(prop->count_values !=3D 1 || immutable);
> > > +       validate_prop_immutable(prop, obj_type, prop->count_values =
=3D=3D 1);
> > >
> > >         for (i =3D 0; i < prop->count_values; i++) {
> > >                 if (value =3D=3D values[i])
> > > @@ -478,15 +541,14 @@ static void validate_enum_prop(const struct drm=
_mode_get_property *prop,
> > >  }
> > >
> > >  static void validate_bitmask_prop(const struct drm_mode_get_property=
 *prop,
> > > -                                 uint64_t value)
> > > +                                 uint64_t value, uint32_t obj_type)
> > >  {
> > >         const uint64_t *values =3D from_user_pointer(prop->values_ptr=
);
> > > -       bool immutable =3D prop->flags & DRM_MODE_PROP_IMMUTABLE;
> > >         uint64_t mask =3D 0;
> > >
> > >         igt_assert_lte(1, prop->count_values);
> > >         igt_assert_eq(prop->count_enum_blobs, prop->count_values);
> > > -       igt_assert(prop->count_values !=3D 1 || immutable);
> > > +       validate_prop_immutable(prop, obj_type, prop->count_values =
=3D=3D 1);
> > >
> > >         for (int i =3D 0; i < prop->count_values; i++) {
> > >                 igt_assert_lte_u64(values[i], 63);
> > > @@ -501,7 +563,7 @@ static void validate_bitmask_prop(const struct dr=
m_mode_get_property *prop,
> > >
> > >  static void validate_blob_prop(int fd,
> > >                                const struct drm_mode_get_property *pr=
op,
> > > -                              uint64_t value)
> > > +                              uint64_t value, uint32_t obj_type)
> > >  {
> > >         struct drm_mode_get_blob blob;
> > >
> > > @@ -515,6 +577,8 @@ static void validate_blob_prop(int fd,
> > >
> > >         igt_assert_lte_u64(value, 0xffffffff);
> > >
> > > +       validate_prop_immutable(prop, obj_type, false);
> > > +
> > >         /*
> > >          * Immutable blob properties can have value=3D=3D0.
> > >          * Happens for example with the "EDID" property
> > > @@ -532,10 +596,9 @@ static void validate_blob_prop(int fd,
> > >
> > >  static void validate_object_prop(int fd,
> > >                                  const struct drm_mode_get_property *=
prop,
> > > -                                uint64_t value)
> > > +                                uint64_t value, uint32_t obj_type)
> > >  {
> > >         const uint64_t *values =3D from_user_pointer(prop->values_ptr=
);
> > > -       bool immutable =3D prop->flags & DRM_MODE_PROP_IMMUTABLE;
> > >         struct drm_mode_crtc crtc;
> > >         struct drm_mode_fb_cmd fb;
> > >
> > > @@ -543,7 +606,7 @@ static void validate_object_prop(int fd,
> > >         igt_assert_eq(prop->count_enum_blobs, 0);
> > >
> > >         igt_assert_lte_u64(value, 0xffffffff);
> > > -       igt_assert(!immutable || value !=3D 0);
> > > +       validate_prop_immutable(prop, obj_type, value =3D=3D 0);
> > >
> > >         switch (values[0]) {
> > >         case DRM_MODE_OBJECT_CRTC:
> > > @@ -568,7 +631,7 @@ static void validate_object_prop(int fd,
> > >
> > >  static void validate_property(int fd,
> > >                               const struct drm_mode_get_property *pro=
p,
> > > -                             uint64_t value, bool atomic)
> > > +                             uint64_t value, bool atomic, uint32_t o=
bj_type)
> > >  {
> > >         uint32_t flags =3D prop->flags;
> > >         uint32_t legacy_type =3D flags & DRM_MODE_PROP_LEGACY_TYPE;
> > > @@ -589,16 +652,16 @@ static void validate_property(int fd,
> > >
> > >         switch (legacy_type) {
> > >         case DRM_MODE_PROP_RANGE:
> > > -               validate_range_prop(prop, value);
> > > +               validate_range_prop(prop, value, obj_type);
> > >                 break;
> > >         case DRM_MODE_PROP_ENUM:
> > > -               validate_enum_prop(prop, value);
> > > +               validate_enum_prop(prop, value, obj_type);
> > >                 break;
> > >         case DRM_MODE_PROP_BITMASK:
> > > -               validate_bitmask_prop(prop, value);
> > > +               validate_bitmask_prop(prop, value, obj_type);
> > >                 break;
> > >         case DRM_MODE_PROP_BLOB:
> > > -               validate_blob_prop(fd, prop, value);
> > > +               validate_blob_prop(fd, prop, value, obj_type);
> > >                 break;
> > >         default:
> > >                 igt_assert_eq(legacy_type, 0);
> > > @@ -606,17 +669,18 @@ static void validate_property(int fd,
> > >
> > >         switch (ext_type) {
> > >         case DRM_MODE_PROP_OBJECT:
> > > -               validate_object_prop(fd, prop, value);
> > > +               validate_object_prop(fd, prop, value, obj_type);
> > >                 break;
> > >         case DRM_MODE_PROP_SIGNED_RANGE:
> > > -               validate_range_prop(prop, value);
> > > +               validate_range_prop(prop, value, obj_type);
> > >                 break;
> > >         default:
> > >                 igt_assert_eq(ext_type, 0);
> > >         }
> > >  }
> > >
> > > -static void validate_prop(int fd, uint32_t prop_id, uint64_t value, =
bool atomic)
> > > +static void validate_prop(int fd, uint32_t prop_id, uint64_t value,
> > > +                         bool atomic, uint32_t obj_type)
> > >  {
> > >         struct drm_mode_get_property prop;
> > >         struct drm_mode_property_enum *enums =3D NULL;
> > > @@ -649,7 +713,7 @@ static void validate_prop(int fd, uint32_t prop_i=
d, uint64_t value, bool atomic)
> > >         for (int i =3D 0; i < prop.count_enum_blobs; i++)
> > >                 igt_assert_neq_u64(enums[i].value, 0x5c5c5c5c5c5c5c5c=
ULL);
> > >
> > > -       validate_property(fd, &prop, value, atomic);
> > > +       validate_property(fd, &prop, value, atomic, obj_type);
> > >
> > >         free(values);
> > >         free(enums);
> > > @@ -687,7 +751,7 @@ static void validate_props(int fd, uint32_t obj_t=
ype, uint32_t obj_id, bool atom
> > >         igt_assert(properties.count_props =3D=3D count);
> > >
> > >         for (int i =3D 0; i < count; i++)
> > > -               validate_prop(fd, props[i], values[i], atomic);
> > > +               validate_prop(fd, props[i], values[i], atomic, obj_ty=
pe);
> > >
> > >         free(values);
> > >         free(props);
> > > --
> > > 2.45.2
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel



--=20
With best wishes
Dmitry
