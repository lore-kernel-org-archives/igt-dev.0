Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64D010F9951
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 15:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A06210E68B;
	Wed,  8 Apr 2026 15:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwJHATUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA3710E4D2
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775662161; x=1807198161;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=HDZKH9hVeZvM+h0WP/aLT+bY+CTHC9MJiJizN+ji6YI=;
 b=dwJHATUIkTSzTygK8MYWyv7Y+3d2z2LHp7HQPdno3x0BBA0K2iE3awsm
 EJCjBFmjgWabMeOElz2bQPPBWUFEZwH1/gdMHEyhcNBdiXScMaxclWqjw
 u/aVRCNrbgAd0/2lmZ8JLA9u5k/3SIIwrRagVGwcS/EGDHUrXTPQsOFJS
 S9YEkkzOM0f6q7y2Yel5SR4ZaGw6hDaRTHlxSTWw2i0IOtznxhgPWo+rw
 23Xn3YtVDOyLshPnxIq5sEIHiz2fGZ9z1AHaWxdXvi6ch4psQnXSYDuGE
 ZjDNVG+sfejmmOuCkcux/rIm19nvXsmPHo+tPnMMCzGGyn7UkKbUoDvSd Q==;
X-CSE-ConnectionGUID: GUuFFzwiR+KlieBkTY4XuQ==
X-CSE-MsgGUID: 9G+Iu/OQTVewpjJyQy4OLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="86940094"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="86940094"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 08:29:21 -0700
X-CSE-ConnectionGUID: qyoeSJA7SXy+0rO0yzO8yA==
X-CSE-MsgGUID: g1hgFo4yQ5m/MoSwb5qm4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="233451673"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 08:29:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: rob.clark@oss.qualcomm.com
Cc: Harshdeep Dhatt <harshdeepdhatt@gmail.com>,
 igt-dev@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH i-g-t] lib/igt_kms: Identify writeback connectors in msm
 driver on android
In-Reply-To: <CACSVV02OyKqnJv5r0raGq6n+ajRsUg+zxre_gMjDR6V++aDjNA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407202953.3871752-1-harshdeepdhatt@gmail.com>
 <9019ee70c852a5dd27bad9877d8fefca656b50c6@intel.com>
 <CACSVV02OyKqnJv5r0raGq6n+ajRsUg+zxre_gMjDR6V++aDjNA@mail.gmail.com>
Date: Wed, 08 Apr 2026 18:29:15 +0300
Message-ID: <8e61be678da46c7ec762d9d4c3069ce141d7aea1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Wed, 08 Apr 2026, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> On Wed, Apr 8, 2026 at 2:17=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
>>
>> On Tue, 07 Apr 2026, Harshdeep Dhatt <harshdeepdhatt@gmail.com> wrote:
>> > The msm drm driver that runs on android platforms sets up its writeback
>> > connectors as DRM_MODE_CONNECTOR_VIRTUAL instead of DRM_MODE_CONNECTOR=
_WRITEBACK.
>> > This means when setting up the drm resources, these connectors get exp=
osed
>> > to userspace even though userspace has not explicitly asked for writeb=
ack
>> > connectors. These connectors are by default in the connected state. Wh=
en we
>> > try to configure one of the crtc's for this output (to get the primary=
 plane),
>> > the msm driver bails because this connector (being a writeback connect=
or)
>> > doesn't have an output framebuffer assigned to it. To avoid this failu=
re, get the
>> > correct property id for setting up the output framebuffer id for write=
back connectors
>> > as defined by the msm driver on android. Allocate and bind a dummy out=
put fb for
>> > these connectors.
>>
>> Is this msm android driver in upstream linux kernel?
>
> I _think_ this is about the downstream android driver.  Which AFAIU
> relies enough on custom properties/etc that there may be a lot of
> "quirks" compared to an upstream drm/kms driver.

Right.

>> If not, why should we add this in upstream IGT?

So the question remains. And where do you draw the line with the
plethora of downstream vendor kernels and drivers?

BR,
Jani.

>>
>> BR,
>> Jani.
>>
>>
>> >
>> > Signed-off-by: Harshdeep Dhatt <harshdeepdhatt@gmail.com>
>> > ---
>> >  lib/drmtest.c |  5 +++++
>> >  lib/drmtest.h |  1 +
>> >  lib/igt_kms.c | 28 ++++++++++++++++++++++++++++
>> >  3 files changed, 34 insertions(+)
>> >
>> > diff --git a/lib/drmtest.c b/lib/drmtest.c
>> > index 4a788ea7a..2e6895618 100644
>> > --- a/lib/drmtest.c
>> > +++ b/lib/drmtest.c
>> > @@ -143,6 +143,11 @@ bool is_msm_device(int fd)
>> >       return __is_device(fd, "msm");
>> >  }
>> >
>> > +bool is_msm_android_device(int fd)
>> > +{
>> > +     return __is_device(fd, "msm_drm");
>> > +}
>> > +
>> >  bool is_nouveau_device(int fd)
>> >  {
>> >       /* Currently all nouveau-specific codepaths require libdrm */
>> > diff --git a/lib/drmtest.h b/lib/drmtest.h
>> > index 37874d729..c042a2b20 100644
>> > --- a/lib/drmtest.h
>> > +++ b/lib/drmtest.h
>> > @@ -147,6 +147,7 @@ bool is_amdgpu_device(int fd);
>> >  bool is_i915_device(int fd);
>> >  bool is_mtk_device(int fd);
>> >  bool is_msm_device(int fd);
>> > +bool is_msm_android_device(int fd);
>> >  bool is_nouveau_device(int fd);
>> >  bool is_vc4_device(int fd);
>> >  bool is_xe_device(int fd);
>> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> > index 04b1f3972..3948426bc 100644
>> > --- a/lib/igt_kms.c
>> > +++ b/lib/igt_kms.c
>> > @@ -950,6 +950,14 @@ igt_atomic_fill_connector_props(igt_display_t *di=
splay, igt_output_t *output,
>> >       for (i =3D 0; i < props->count_props; i++) {
>> >               drmModePropertyPtr prop =3D
>> >                       drmModeGetProperty(fd, props->props[i]);
>> > +             /*
>> > +              * msm android driver installs writeback fb id as a cust=
om property which can be
>> > +              * identified by "FB_ID" string
>> > +              */
>> > +             if (is_msm_android_device(fd) && (!strcmp("FB_ID", prop-=
>name))) {
>> > +                     output->props[IGT_CONNECTOR_WRITEBACK_FB_ID] =3D=
 props->props[i];
>> > +                     continue;
>> > +             }
>> >
>> >               for (j =3D 0; j < num_connector_props; j++) {
>> >                       if (strcmp(prop->name, conn_prop_names[j]) !=3D =
0)
>> > @@ -1003,6 +1011,7 @@ static igt_plane_t *igt_get_assigned_primary(igt=
_output_t *output,
>> >       int drm_fd =3D output->display->drm_fd;
>> >       drmModeModeInfo *mode;
>> >       struct igt_fb fb;
>> > +     struct igt_fb out_fb =3D {0};
>> >       igt_plane_t *plane =3D NULL;
>> >       uint32_t crtc_id;
>> >       int i;
>> > @@ -1016,6 +1025,23 @@ static igt_plane_t *igt_get_assigned_primary(ig=
t_output_t *output,
>> >
>> >       crtc_id =3D crtc->crtc_id;
>> >
>> > +     /*
>> > +      * msm android driver exposes writeback connectors as DRM_MODE_C=
ONNECTOR_VIRTUAL and not
>> > +      * DRM_MODE_CONNECTOR_WRITEBACK. The driver will bail if the out=
put fb is not specified for
>> > +      * this connector. Hence, allocate a dummy output fb here and as=
sign it to the connector.
>> > +      */
>> > +     if (is_msm_android_device(drm_fd) && igt_output_has_prop(output,=
 IGT_CONNECTOR_WRITEBACK_FB_ID)) {
>> > +             igt_require(igt_create_fb(drm_fd, mode->hdisplay, mode->=
vdisplay,
>> > +                     DRM_FORMAT_XRGB8888,
>> > +                     DRM_FORMAT_MOD_NONE,
>> > +                     &out_fb) =3D=3D 0);
>> > +             igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBAC=
K_FB_ID, out_fb.fb_id);
>> > +             igt_assert(drmModeConnectorSetProperty(drm_fd, output->i=
d,
>> > +                     output->props[IGT_CONNECTOR_WRITEBACK_FB_ID],
>> > +                     output->values[IGT_CONNECTOR_WRITEBACK_FB_ID]) =
=3D=3D 0);
>> > +     }
>> > +
>> > +
>> >       /*
>> >        * Do a legacy SETCRTC to start things off, so that we know that
>> >        * the kernel will pick the correct primary plane and attach it
>> > @@ -1039,6 +1065,8 @@ static igt_plane_t *igt_get_assigned_primary(igt=
_output_t *output,
>> >
>> >       /* Removing the FB will also shut down the display for us: */
>> >       igt_remove_fb(drm_fd, &fb);
>> > +     if (out_fb.fb_id !=3D 0)
>> > +             igt_remove_fb(drm_fd, &out_fb);
>> >       igt_assert_f(plane, "Valid assigned primary plane for CRTC_ID %d=
 not found.\n", crtc_id);
>> >
>> >       return plane;
>>
>> --
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
