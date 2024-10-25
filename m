Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B0BD0C5FA
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 10:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0A210EA72;
	Fri, 25 Oct 2024 10:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EC1Wfq90";
	dkim-atps=neutral
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DEE10EA72
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 10:26:58 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6db20e22c85so16479417b3.0
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 03:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729852017; x=1730456817; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5bXVE01QamUTUzO0zx4so4Vj/9sid5EhLBtmA4YPblE=;
 b=EC1Wfq90wIRe9Vfa3CzCCxNpdlo0Fx9lS+XY9ZUOFQIrXLC7lvY3l71pp03gq5WXka
 fZ2qVwpn586VR8iXtw92RSxd5QuGzt6VqxNAeSGF8Ve6Tb+ZI4GIrVn8tAEUBeHN/WjI
 cOg0aI6JsJ1/OlZHvqnuCwPRGzuIbzMhLuWYSTbl6Hx2Sa7ydYa3GWMPAdUQycf2prvy
 moz6oRf1oML7LWm763TUOsZvDuxRVryREnzrfURrEGwDdA/rlZTZCbkjx2h7hfSqG1as
 pae07dAVJzPdIsLX405p3dZ3EBR8slyPsQrxmvFmzFGXfXiImy+IXBIWBf7FTAsIkgdl
 sLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729852017; x=1730456817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5bXVE01QamUTUzO0zx4so4Vj/9sid5EhLBtmA4YPblE=;
 b=b1t32qHTKhW6PMpNc38JXldedkrEzS7w/mB57uztcL8lYQ6Tdzu7erjn/uP45STHWC
 gFUPPBJ6usXsvZW5pzCQB4ZfOpwHc3NwUL+QQadopMxEpevrxGAfNR1glBt18J2qBlf+
 3W+nkOfODPFcM9Y47TYa5VipsvoI9JUDhzBHAOmN+q04evLZQmI9EnAdRgCiiG6FFMoh
 7EsDmq5ubOEvKsZ6JmNeArZx8SfSzSHBul/dacwtZgL2cP165UoXvgmdqK1TpgFdGZTi
 Y/CYo+eXQbbY/CdqhWwXOmRaNQV2t/Cp/8vx2a9tRWZkIPwj0RE9VhJkTsBXXTizQzmv
 /BpQ==
X-Gm-Message-State: AOJu0Yzl42EajOLTjHDaAK36+qD2jYcnKUydVfhfKv4PsUNK8QNNdiXL
 HD6Hkm3UB8N5HeLeA8LydhMl1OZMNntd3KTgQCLlnhFfMgASqLRwwVkiVyOpNlK7z4/E4glL+fO
 NnGJBjjXH1XjuiQ0Cno9gKFL+hnUk1Gdws4Qvog==
X-Google-Smtp-Source: AGHT+IE+X/B3pbxkookw2Jv+ETMoiaMihDa0c2CwSZrtJimrQvlh5U2yR//qKSimqL0BMG9mt/kT4EfOnZhLCmetS5Q=
X-Received: by 2002:a05:690c:9682:b0:6e5:bf26:574 with SMTP id
 00721157ae682-6e858192d54mr56110887b3.27.1729852017247; Fri, 25 Oct 2024
 03:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241018120058.42240-1-dmitry.baryshkov@linaro.org>
 <CAA8EJpqMaD0Hyjtb0M57gsOWu9fiLEDS8MDBSffuM9NXDn34UQ@mail.gmail.com>
 <Zxsx-askWn17OxIU@intel.com>
 <CAA8EJprtZSurjVKt5rc_x3d+Tm07MNzBHPqVXETQC3h23O-Wfw@mail.gmail.com>
 <ZxtvU6ShNgULKinM@intel.com>
In-Reply-To: <ZxtvU6ShNgULKinM@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 13:26:47 +0300
Message-ID: <CAA8EJpp+d9Ntuy9YEdySTjtBc7pUMAbbNTjREcLc+=6i13CcpA@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_properties: rework immutability checks
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>
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

On Fri, 25 Oct 2024 at 13:13, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Oct 25, 2024 at 12:53:29PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 25 Oct 2024 at 08:51, Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Thu, Oct 24, 2024 at 09:29:03PM +0300, Dmitry Baryshkov wrote:
> > > > On Fri, 18 Oct 2024 at 15:01, Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > Following the discussion on IRC, it is actually an error to requi=
re that
> > > > > properties that can not be chaged are marked as immutable.
> > > > >
> > > > > First of all, it creates inconsistent uAPI. Some drivers might ha=
ve an
> > > > > immutable property, while others will have it mutable. Yes, there=
 are
> > > > > known examples for such behaviour (e.g. zpos), but they are clear=
ly
> > > > > documented in this way.
> > > > >
> > > > > Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE de=
fines
> > > > > more of the 'direction' of the property (whether it is set by the=
 kernel
> > > > > or it is expected to be set by the userspace) rather than simply =
states
> > > > > that there is no way for the userspace to change the property.
> > > > >
> > > > > Rework the immutability checks to verify that the properties defi=
ned as
> > > > > immutable have this flag set. Keep the "immutable if single value=
"
> > > > > property just for the "zpos" property.
> > > > >
> > > > > Fixes: 29ae12bd764e ("tests/kms_properties: Validate properties h=
arder")
> > > > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > > Link: https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#333=
74622
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >
> > > > Gracious ping for the patch. We need it to be able to proceed with =
the
> > > > HDMI rework for the drm/msm driver, otherwise IGT tests fail.
> > > >
> > > > >
> > > > > ---
> > > > > Changes since v1:
> > > > >  - Moved GAMMA_LUT_SIZE and DEGAMMA_LUT_SIZE to DRM_MODE_OBJECT_C=
RTC.
> > > > >  - Added debug print to help debugging possible issues.
> > > > > ---
> > > > >  tests/kms_properties.c | 110 ++++++++++++++++++++++++++++++++---=
------
> > > > >  1 file changed, 87 insertions(+), 23 deletions(-)
> > > > >
> > > > > diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> > > > > index a93c93cccf64..57f07e69909a 100644
> > > > > --- a/tests/kms_properties.c
> > > > > +++ b/tests/kms_properties.c
> > > > > @@ -416,16 +416,80 @@ static void test_object_invalid_properties(=
igt_display_t *display,
> > > > >                 test_invalid_properties(display->drm_fd, id, type=
, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
> > > > >  }
> > > > >
> > > > > +enum prop_imm_flags {
> > > > > +       IMMUTABLE_REQ,
> > > > > +       IMMUTABLE_IF_SINGLE_VALUE,
> > > > > +};
> > > > > +
> > > > > +static const struct {
> > > > > +       uint32_t obj_type;
> > > > > +       const char *name;
> > > > > +       enum prop_imm_flags flags;
> > > > > +} prop_settings[] =3D {
> > > > > +       /* generic */
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "EDID", IMMUTABLE_REQ },
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "PATH", IMMUTABLE_REQ },
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "TILE", IMMUTABLE_REQ },
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "WRITEBACK_PIXEL_FORMATS", I=
MMUTABLE_REQ },
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "non-desktop", IMMUTABLE_REQ=
 },
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "panel orientation" ,IMMUTAB=
LE_REQ },
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "privacy-screen hw-state", I=
MMUTABLE_REQ },
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "subconnector", IMMUTABLE_RE=
Q },
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "suggested X", IMMUTABLE_REQ=
 },
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "suggested Y", IMMUTABLE_REQ=
 },
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "vrr_capable", IMMUTABLE_REQ=
 },
> > > > > +
> > > > > +       { DRM_MODE_OBJECT_CRTC, "DEGAMMA_LUT_SIZE", IMMUTABLE_REQ=
 },
> > > > > +       { DRM_MODE_OBJECT_CRTC, "GAMMA_LUT_SIZE", IMMUTABLE_REQ }=
,
> > > > > +
> > > > > +       { DRM_MODE_OBJECT_PLANE, "IN_FORMATS", IMMUTABLE_REQ },
> > > > > +       { DRM_MODE_OBJECT_PLANE, "SIZE_HINTS", IMMUTABLE_REQ },
> > > > > +       { DRM_MODE_OBJECT_PLANE, "type", IMMUTABLE_REQ },
> > > > > +       { DRM_MODE_OBJECT_PLANE, "zpos", IMMUTABLE_IF_SINGLE_VALU=
E },
> > > > > +
> > > > > +       /* driver-specific */
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "hotplug_mode_update", IMMUT=
ABLE_REQ }, // qxl, vmwgfx
> > > > > +       { DRM_MODE_OBJECT_CONNECTOR, "implicit_placement", IMMUTA=
BLE_REQ }, // vmwgfx
> > > > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_BLEND_LUT_SIZE", IMMU=
TABLE_REQ }, // amdgpu
> > > > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_DEGAMMA_LUT_SIZE", IM=
MUTABLE_REQ }, // amdgpu
> > > > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_LUT3D_SIZE", IMMUTABL=
E_REQ }, // amdgpu
> > > > > +       { DRM_MODE_OBJECT_PLANE, "AMD_PLANE_SHAPER_LUT_SIZE", IMM=
UTABLE_REQ }, // amdgpu
> > > > > +};
> > >
> > > Not really a fan of having a list like this. All of these look
> > > like they are just regular immutable properties, with zpos being
> > > the only exception. Or is that not the case?
> >
> > Yes. The goal is to perform the ABI check: which properties are
> > documented to be immutable. All other properties are expected to be
> > mutable.
> >
> > >
> > > What was the problem of just dropping the check that non-immutable
> > > properties must have multiple possible values?
> >
> > See the discussion at [1] and then the response by Sima [2] to the
> > patch similar to your proposal.
> >
> > [1] https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622
> > [2] https://lore.kernel.org/igt-dev/Zpjn2dTHDrBBuTVH@phenom.ffwll.local=
/
>
> I'm not seeing any real conclusions there. Looks to me
> like the correct thing would be to just remove that
> single value =3D> immutable assumption.

Sima rejected such a patch, [2].

>
> And I'd follow that up with a kernel patch to make zpos
> non-immutable. I'm thinking this shouldn't break anything
> since the property can already be non-immutable.
>
> And checking that all standard properties look sane
> should probably be a new subtest, and it should
> validate more than the immutable bit.

I think the best thing I can do is to split this patch into two, one
dropping the immutable check and another one adding immutable checks
via properties enumeration. Then we can work on adding more tests to
the "standard properties" feature tests. WDYT?

>
> > >
> > > And perhaps there should be instead a check that immutable
> > > properties must not have more than one possible value?
> >
> > This is not a correct assumption, immutable props might have any
> > number of values. The difference is on semantics side: the driver
> > controls immutable properties, userspace controls mutable ones.
>
> Hmm, yeah I suppose one could use it eg. to relay back some
> sink capabilities as an enum property.

The subconnector comes to my mind: the kernel specifies to userspace
(so, immutable) the subtype of the connected dongle (so, one value
from many supported by the enum).


--=20
With best wishes
Dmitry
