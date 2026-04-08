Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848F810F9940
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 14:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F160F10E689;
	Wed,  8 Apr 2026 14:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhRXBqf2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkCjgEas";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EC110E68D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 14:43:22 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 638CJLtF2860432
 for <igt-dev@lists.freedesktop.org>; Wed, 8 Apr 2026 14:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ClAKDJfmWBFls9OPkx7qUlAj7+OgCjQmar4xJOQNIrY=; b=Bh
 RXBqf2Ou5ZiqCIdRzKcJR7Fvd0qVOvnOlcgJFZ9ArdKmyWZiq/6H71EDQrto7urh
 mZKOyZiypR3ke3yo5fA0wTpyLWVXQ3cIKviw6eOHGlu8voi1jX9RHPuROAVTMWzo
 J/7N1hEn/2dmfTE8i4dXrAeTSxfOGqqgcIhQ3lnbz+tJAQPlrxIHfWWbflH9HBF5
 UXn/64ATQIw/ue9CzTaKTtXjcqdWxybm80n0iZauAM323k2rANmYHPco9m6ww3DR
 Ksc3lkchnTnmiN+Kh4oMcfrWgxG79Ahg6SLFLG/Ks5HWumu2scxp2d0oHA3lknfM
 odl1CrtNKB57uIqBc1ZA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8uam8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Apr 2026 14:43:21 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-423306870bdso8822488fac.3
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Apr 2026 07:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775659400; cv=none;
 d=google.com; s=arc-20240605;
 b=EAflLV+bOTgAEMW7OrM2c9D4hp1th+2yJEmzL36cokBQMU07Nh3DdjQ1eKmXxwxaUP
 1qrJjGDXBta0L4ZtM2FtcVoDOQamtaTrGuTpuNgO5/2ts5aWPdCK8hSt9A3zVx7CeFwm
 BxsgrYlWtrKUXCNcKAiL/K9UdteO8cu65FLXlNWkClgAwTsri5mlornS5yUjO/kYcMbO
 5160twP/jbmzlR7836CbVhXRKlsET3HG39qd0C1xxtAFhJ5egpBKXtXd5gD8u5QWNKNg
 tnq4HS2AVF8No+yUU5i89TxeJJdHC3VURcrj30ozCne8WARPirdhICZYLJoh5dTtFrp8
 wORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=ClAKDJfmWBFls9OPkx7qUlAj7+OgCjQmar4xJOQNIrY=;
 fh=53XYSkoRVZxXupJivxjk/13XObPrevielVZkELcYL74=;
 b=fcYwfCVIhWLKCYSRF5bN2kQZAQOUCfm4xcUrTUWjMAkpmhY0bUC6wdiD5y4Wx5Gr4s
 fCjYg556SvgIgweew3wuHdXF3rILlyJMoG2v9o88XhHbWdFm4xgkhCtE+F65pmSBKML/
 PI6SibKomx4Coh4qnhmp2a1zQmwI3Zt5y3jXbiEPlNVeNiGm6JeXnB0cJkPe/wuBvYKr
 TRpGqWV4Qrwlb2R6fpTenTrA2nKpgXD/t8YAigiOa9J9NJMdpA+MBhjOCvdEaT22hU0L
 fEGax7B3/6Ur6X1BtBhINXsReysx7D8uzH+PdNp9L5FEwuTacNewG7SDanqxjujgoWdD
 ggNg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775659400; x=1776264200;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ClAKDJfmWBFls9OPkx7qUlAj7+OgCjQmar4xJOQNIrY=;
 b=PkCjgEasxmiRmspZbqTlKvckzvp4WKJS0qwyrhcBK1fT99so2kXLPiT+OpS9VzetYp
 CSo2JH7AjM++8rA7dE9FxZ/sY0GnV8ME56gc1gHYDHTipS2204R55vTs1vNaDQ4eBZK/
 q662RAynoZQmZCsIda6FXncYRa9iJHpYsNHgPsLgW40n7FSt6HwB3gdchSmUIUTuISPy
 zLcr1ULCogYyQTstOHRM5kVN77Fv2t6398Q9mOxXFz9iLUk1JiwgsOvDl8wtY1WbokM9
 r+RsUfA/da8CoOYUm7y3HHY7U8HmoUtG/33aAkzvskrL0nLX22cvxirdZ/Vjwyh6tWjE
 oT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775659400; x=1776264200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ClAKDJfmWBFls9OPkx7qUlAj7+OgCjQmar4xJOQNIrY=;
 b=aVxmQjJ9K7vGeWcMfK1yhJLD2tvQbGwQhA13RypmXIMzXOBKkmcdgvdJqTocCc33xd
 AvF7UP5ZSu3fuu3A4639Y81gFgODN6cu1T7+Low2+it63GbuknJM9geKdhILPfTclQaH
 RB4BxsEqkl+g4OsQdxQ3uddvs3/92Sihy/6lQH1DG0aRwR54/iA/+wDR7tyVqVWNPrmu
 duCELU/kA2f+b9Y/H7ksmO5MG6WM/eUd/hRCoouHdjKuufUP+Ba7IcTNzwLeZYb1SdgJ
 pssxiYd81Ol9kzGKAbg/HwwAWz7qDF///7dxx8fPMWnPm4sgok1wM28VMxatFTxFrd+X
 HuFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKEy+ncynlwcQuuIb9LUbzzAI2rtPinosMpVHF6XOA+4dcMu0hmghA/f4kbsjtF7Q5BKoOBTO3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxPb0ixv6WtRrFr+c3PapGd85hEmGZivAZw2NWWX3SLhIXpVUN
 02B+R8vlxPv9KAYkXa6w/h2MneEzereKzZ/7RBwE6eZYd2Q2omLN2uNIlYo45RNkYCCLh7LYk9n
 iO0HrW//UOm8ZdXCSiXDscjPABg8HujhURjLlCj06Sz713jWX4gKJhiXHlndQahE2VADNifaJGv
 5v5beYzN6bTwqfbBu+zDq353o1DQeRNf1kjBMKRmwqQo0=
X-Gm-Gg: AeBDiesEPRYMpDB7DOOF/1jZgydTpmAk0H3EYrE0fdPWtko4OmXaKt9Ia2by9r9iG4z
 yvoHL8N3p0jq32J5/k+QrZhcRzmeJXm85lk+iPMig4YJj+IYoo0tUS5ytWl53AS/dUypcAq2pHu
 6PxesqoXW3G+M0ZD33yygxO9Uwy6IPYu17C74QSb9Y3Dv16/XAtmeyKo0prFgbvfk7F6AVEUd6Z
 MthWTW/Pk5WJctfOmlwNcR2rrR/wVZqSwN1ng==
X-Received: by 2002:a05:6870:171d:b0:417:54ec:6a5 with SMTP id
 586e51a60fabf-4230fc8925fmr11720044fac.4.1775659400266; 
 Wed, 08 Apr 2026 07:43:20 -0700 (PDT)
X-Received: by 2002:a05:6870:171d:b0:417:54ec:6a5 with SMTP id
 586e51a60fabf-4230fc8925fmr11720021fac.4.1775659399826; Wed, 08 Apr 2026
 07:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260407202953.3871752-1-harshdeepdhatt@gmail.com>
 <9019ee70c852a5dd27bad9877d8fefca656b50c6@intel.com>
In-Reply-To: <9019ee70c852a5dd27bad9877d8fefca656b50c6@intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 07:43:08 -0700
X-Gm-Features: AQROBzAfHbnhqg2ERKUStVBWrKr_XTAL-rkmESDwLw9VSspUNbrk19jteXJV_PA
Message-ID: <CACSVV02OyKqnJv5r0raGq6n+ajRsUg+zxre_gMjDR6V++aDjNA@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib/igt_kms: Identify writeback connectors in msm
 driver on android
To: Jani Nikula <jani.nikula@intel.com>
Cc: Harshdeep Dhatt <harshdeepdhatt@gmail.com>, igt-dev@lists.freedesktop.org, 
 Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: YIviJoWcEwmLVeWXmuOrbXroQotsDcBE
X-Proofpoint-GUID: YIviJoWcEwmLVeWXmuOrbXroQotsDcBE
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d66989 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=trr7gcD7-ZkpKlZaxIAA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEzNiBTYWx0ZWRfXx5J1JRWt+XXA
 7NXNGHY4Gh0Cm/eUGTzFcYLB70mXgyhNTQjCrPVdVcEgIkFvSPHCWC1tURU4prC2GQB96wo6U4J
 y29eKYTzv2vMAOJAKE0Bhp/JFMpbvAn0uBv+zO4H+Rg6J4aB1HIiVFWcIOJHu4gmPYwk65hOdPM
 kGgL9fIt08Lav7wyfKJjVZR4UrYLGdnZVJsuYVc5y+sQSZqGngDhWgbjUVJ4fqC7lidCW8bnNTT
 npWgexLa8JeDQMxOcUijI5DFVGzwThmtA9LSVHWhE3DvR82SlhgJvrizRZsB4zrZXDYT+FVCkvQ
 xVy2nSyXH5Wh7JNEO2X7jFkwPs3jT1Cg/rieBy/PnPKfxVExBRbagFWm6Ar4j+MIJfXduqS+zKY
 esW7PKIxyfDQGHL40VdZrLr9PqbNr/TmnlH3lyPbVtB8BRI8m5M+zpUr3OfWCOQg1LylRRlgZ9u
 NAQ2ye1p2Ny93dEsEBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080136
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Apr 8, 2026 at 2:17=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> On Tue, 07 Apr 2026, Harshdeep Dhatt <harshdeepdhatt@gmail.com> wrote:
> > The msm drm driver that runs on android platforms sets up its writeback
> > connectors as DRM_MODE_CONNECTOR_VIRTUAL instead of DRM_MODE_CONNECTOR_=
WRITEBACK.
> > This means when setting up the drm resources, these connectors get expo=
sed
> > to userspace even though userspace has not explicitly asked for writeba=
ck
> > connectors. These connectors are by default in the connected state. Whe=
n we
> > try to configure one of the crtc's for this output (to get the primary =
plane),
> > the msm driver bails because this connector (being a writeback connecto=
r)
> > doesn't have an output framebuffer assigned to it. To avoid this failur=
e, get the
> > correct property id for setting up the output framebuffer id for writeb=
ack connectors
> > as defined by the msm driver on android. Allocate and bind a dummy outp=
ut fb for
> > these connectors.
>
> Is this msm android driver in upstream linux kernel?

I _think_ this is about the downstream android driver.  Which AFAIU
relies enough on custom properties/etc that there may be a lot of
"quirks" compared to an upstream drm/kms driver.

BR,
-R

> If not, why should we add this in upstream IGT?
>
> BR,
> Jani.
>
>
> >
> > Signed-off-by: Harshdeep Dhatt <harshdeepdhatt@gmail.com>
> > ---
> >  lib/drmtest.c |  5 +++++
> >  lib/drmtest.h |  1 +
> >  lib/igt_kms.c | 28 ++++++++++++++++++++++++++++
> >  3 files changed, 34 insertions(+)
> >
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 4a788ea7a..2e6895618 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -143,6 +143,11 @@ bool is_msm_device(int fd)
> >       return __is_device(fd, "msm");
> >  }
> >
> > +bool is_msm_android_device(int fd)
> > +{
> > +     return __is_device(fd, "msm_drm");
> > +}
> > +
> >  bool is_nouveau_device(int fd)
> >  {
> >       /* Currently all nouveau-specific codepaths require libdrm */
> > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > index 37874d729..c042a2b20 100644
> > --- a/lib/drmtest.h
> > +++ b/lib/drmtest.h
> > @@ -147,6 +147,7 @@ bool is_amdgpu_device(int fd);
> >  bool is_i915_device(int fd);
> >  bool is_mtk_device(int fd);
> >  bool is_msm_device(int fd);
> > +bool is_msm_android_device(int fd);
> >  bool is_nouveau_device(int fd);
> >  bool is_vc4_device(int fd);
> >  bool is_xe_device(int fd);
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 04b1f3972..3948426bc 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -950,6 +950,14 @@ igt_atomic_fill_connector_props(igt_display_t *dis=
play, igt_output_t *output,
> >       for (i =3D 0; i < props->count_props; i++) {
> >               drmModePropertyPtr prop =3D
> >                       drmModeGetProperty(fd, props->props[i]);
> > +             /*
> > +              * msm android driver installs writeback fb id as a custo=
m property which can be
> > +              * identified by "FB_ID" string
> > +              */
> > +             if (is_msm_android_device(fd) && (!strcmp("FB_ID", prop->=
name))) {
> > +                     output->props[IGT_CONNECTOR_WRITEBACK_FB_ID] =3D =
props->props[i];
> > +                     continue;
> > +             }
> >
> >               for (j =3D 0; j < num_connector_props; j++) {
> >                       if (strcmp(prop->name, conn_prop_names[j]) !=3D 0=
)
> > @@ -1003,6 +1011,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_=
output_t *output,
> >       int drm_fd =3D output->display->drm_fd;
> >       drmModeModeInfo *mode;
> >       struct igt_fb fb;
> > +     struct igt_fb out_fb =3D {0};
> >       igt_plane_t *plane =3D NULL;
> >       uint32_t crtc_id;
> >       int i;
> > @@ -1016,6 +1025,23 @@ static igt_plane_t *igt_get_assigned_primary(igt=
_output_t *output,
> >
> >       crtc_id =3D crtc->crtc_id;
> >
> > +     /*
> > +      * msm android driver exposes writeback connectors as DRM_MODE_CO=
NNECTOR_VIRTUAL and not
> > +      * DRM_MODE_CONNECTOR_WRITEBACK. The driver will bail if the outp=
ut fb is not specified for
> > +      * this connector. Hence, allocate a dummy output fb here and ass=
ign it to the connector.
> > +      */
> > +     if (is_msm_android_device(drm_fd) && igt_output_has_prop(output, =
IGT_CONNECTOR_WRITEBACK_FB_ID)) {
> > +             igt_require(igt_create_fb(drm_fd, mode->hdisplay, mode->v=
display,
> > +                     DRM_FORMAT_XRGB8888,
> > +                     DRM_FORMAT_MOD_NONE,
> > +                     &out_fb) =3D=3D 0);
> > +             igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK=
_FB_ID, out_fb.fb_id);
> > +             igt_assert(drmModeConnectorSetProperty(drm_fd, output->id=
,
> > +                     output->props[IGT_CONNECTOR_WRITEBACK_FB_ID],
> > +                     output->values[IGT_CONNECTOR_WRITEBACK_FB_ID]) =
=3D=3D 0);
> > +     }
> > +
> > +
> >       /*
> >        * Do a legacy SETCRTC to start things off, so that we know that
> >        * the kernel will pick the correct primary plane and attach it
> > @@ -1039,6 +1065,8 @@ static igt_plane_t *igt_get_assigned_primary(igt_=
output_t *output,
> >
> >       /* Removing the FB will also shut down the display for us: */
> >       igt_remove_fb(drm_fd, &fb);
> > +     if (out_fb.fb_id !=3D 0)
> > +             igt_remove_fb(drm_fd, &out_fb);
> >       igt_assert_f(plane, "Valid assigned primary plane for CRTC_ID %d =
not found.\n", crtc_id);
> >
> >       return plane;
>
> --
> Jani Nikula, Intel
