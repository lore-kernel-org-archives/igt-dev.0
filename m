Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB6EF4198E
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 11:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7BE10E6BD;
	Wed, 15 Apr 2026 11:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M6cScg/R";
	dkim-atps=neutral
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7970B10E6BD
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 11:08:27 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-c742723c863so4200862a12.0
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 04:08:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776251307; cv=none;
 d=google.com; s=arc-20240605;
 b=NkBBXfanNaxk2Abd72HsnmsMNyGSlSf0gvh6druHBmb2fbu0K2UsaNqrBPXlnaL+JD
 TsMZ9+Cj3Qqsshd+emmfJofHDdXn0PUdfexbmzMkMsxvZk18ZS9Puw4fHNUIGkTj5l4n
 hYJRz8r0r8eExQ/Ko1u2w7567FNmZhwX9CJHR4TKP4bYamuGXxPXSIMBAnCRD9ZJhDqu
 iiwXjp+NW7RRGLsBORI3SCpuiN6TUHhLi6wWft4s6v6pC+wwjv5cQWQHBrvzjV2p6eEJ
 laRKwiPj2vPofn3cCyqD73eS8NAJCEfT6bzWMIUwQNnaFx0x0zRIP5X+NBa61B2pveg5
 +5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Vcq4HFU7Y+jil/6kUZweUjXm+ox8Bp77FLqGIJmLTx0=;
 fh=bBOdEspSDe+Fu2GFdpJBv3sDvIILUygPFC6gbgyi0co=;
 b=FnUoehGOmWRrTZy5FhZLXuBGrEq+8CAK+AVqYQEWQu1N9gSOSbu0jwFHg19Y29PJpu
 mGBvSPzfh1U7S2dT+FLc49E2lgARIzR7tbHG3D3k/g5eGkIzrK0aLX+Lan7KA8iw9ahG
 2RnxlnBC4NQX1i4NBjxJn0+rA4u7bPzcyjcu9izc06yypTzOz9gMHn67iyjItMJMv+Kd
 BMpOs93QXTKL8cCYHpjibpacUMLotruef+G4KkN3lBC4pxELyJTxyJG+8VqoE3NIQ5Lh
 JxbcTdkx3xY8fM6Hg5Bn/14op4zj04RIz6Ud3VqO8EMWr8Bm9/fmG9g2G3RSgW+tDl2c
 X0yw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776251307; x=1776856107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vcq4HFU7Y+jil/6kUZweUjXm+ox8Bp77FLqGIJmLTx0=;
 b=M6cScg/RTrDv222ohFoIQJD4uZ6Tis0C1rFXv8I0MkE8azGbBCE24NGRF5fS34bTN7
 JZekkdH6D5TFjVE7HHipv2yE4DhP0ufzsu7nqVwGaqoaT9y2TpfVN350be3bWBObkk8G
 du7tJpBCW8b2+LxpMhgQMy5c+PVDAL+ekRkEbPSp56GXo7US129q6iDfuPT54CfPosZW
 f6ZALmm0lL50svvxYT06LMi2HwaeZ5IMtZRXCX6URzNzmWKec/+ZKEK1hz66MQtosD8s
 s4+anEFW6WsHj8u1GtEJmb+fgi2TrMtZMNjjD+nLQy4fbNowpIA1rwntjaOq05/W+kCD
 QC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776251307; x=1776856107;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vcq4HFU7Y+jil/6kUZweUjXm+ox8Bp77FLqGIJmLTx0=;
 b=UI+SB1TYQOsqrvSWrHSQzril2lNdFPxTYL805BAETzweuXsOqrWQQH8aQk63hT8SLO
 C29joEdUFk8ZWqfyNMf1PtNNM8JODzixLk5Peim6WNbh37/Ez0o5dfbuv14UYKeWty7T
 GuClIByjaMvfgW2SgV/xw5cBPKoiItKSaNCIHdW1b6+BChlAXAUl38zbIkYxxps9q/4l
 5z/LzyAyCYkpqN/FcrYmyyZM6uAA4ATam2o+MqO83DWnPVYmxZin7FidRu97e6aepIKU
 VzBtHhVg1kAhCk8934wA85fvA48ogqZPcs3cMJCBVXrdANhN1ZFgJislvzfolSqI0oYy
 hqSA==
X-Gm-Message-State: AOJu0Yx1/aB/7mMHliTwMFfkrtN9ZWHKrr0+5NLuL1ul5gZbelW2jb6i
 nv9T1phtWQD3Ofp2Eelr43V3OPAtRPcMHlVwGjVJEIRA7I4lVRn6gfG52Uwj/9nOMEjbRh8aPgg
 2eQwrlsInqMaT8L9v2zvSDcaVrU27nUU=
X-Gm-Gg: AeBDieufxUd321O6ud2SSer7hnxIeffD+l5mEW1XzSs0UZqHh9qJsra+decHJZyU6cm
 rCwNUQaRgYCM9VikLaNCKoFybJJoP86peOc8RlGjnqmfFsVnLiIUcWW0hMSZp90T0R3pALOWJfg
 JdeWrXs8MwRd68+XA2agXoM+mYui1qCc2QEW9kxU3JvD1M7D5P+EmCGZ7zh3m8yKFzlsWqRrJPw
 XuqDALK/cpHTkozc0Lxz3iTjGhorkWKAC8ixoO/xqimmj+vPmkOFQ4nJ/C3YbQFXvguC0eSlzp9
 1pkroZ9KhUw//pFBQnaZXud89NxlVmXlK6a4M+H7/SLQ3p8oEh6t
X-Received: by 2002:a05:6a20:3d0a:b0:398:787d:4042 with SMTP id
 adf61e73a8af0-39fe4062320mr23554209637.50.1776251306812; Wed, 15 Apr 2026
 04:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
 <20260331190412.1907571-5-juhapekka.heikkila@gmail.com>
 <46b9d351-a1fe-41de-90fa-dc8a6c96540f@intel.com>
In-Reply-To: <46b9d351-a1fe-41de-90fa-dc8a6c96540f@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 15 Apr 2026 14:08:15 +0300
X-Gm-Features: AQROBzBof7yQ_fD_IHn-4Aj3ExfSv7uppKKFmbaPJohtDntbHv__sGRpB2jOYGI
Message-ID: <CAJ=qYWR6cxyNWuS7OvfgjGTeAb=i1wLw52B-22gd7nJVk8e6-w@mail.gmail.com>
Subject: Re: [PATCH i-g-t 4/4] tests/intel/kms_sharpness_filter: Find mode
 with lowest bw requirement for test
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
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

On Fri, Apr 10, 2026 at 9:00=E2=80=AFAM Sharma, Swati2 <swati2.sharma@intel=
.com> wrote:
>
> Hi JP
>
> On 01-04-2026 12:34 am, Juha-Pekka Heikkila wrote:
> > choose mode from connector with lowest bandwidth requirement
> > for tests to try to fit tests into bandwidth limitations
> >
> > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > ---
> >   tests/intel/kms_sharpness_filter.c | 34 +++++++++++++++++++++++++++++=
-
> >   1 file changed, 33 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharp=
ness_filter.c
> > index f08d33d7a..10061b5d9 100644
> > --- a/tests/intel/kms_sharpness_filter.c
> > +++ b/tests/intel/kms_sharpness_filter.c
> > @@ -609,6 +609,24 @@ static void build_test_suffix(data_t *data, enum t=
est_type type,
> >       }
> >   }
> >
> > +static drmModeModeInfo *find_lowest_mode(igt_output_t *output)
> We do have igt_output_get_lowres_mode(), check if this can be reused?

It has different comparison, it would cause different result.

> > +{
> > +     drmModeConnector *connector =3D output->config.connector;
> > +     drmModeModeInfo *low =3D NULL;
> > +
> > +     for (int i =3D 0; i < connector->count_modes; i++) {
> > +             drmModeModeInfo *mode =3D &connector->modes[i];
> > +             int pixels =3D mode->hdisplay * mode->vdisplay;
> > +             int low_pixels =3D low ? low->hdisplay * low->vdisplay : =
INT_MAX;
> > +
> > +             if (pixels < low_pixels ||
> > +                 (pixels =3D=3D low_pixels && mode->vrefresh < low->vr=
efresh))
> > +                     low =3D mode;
> > +     }
> > +
> > +     return low;
> > +}
> > +
> >   static void
> >   run_sharpness_filter_test(data_t *data, enum test_type type)
> >   {
> > @@ -645,7 +663,21 @@ run_sharpness_filter_test(data_t *data, enum test_=
type type)
> >                                        data->mode->vdisplay,
> >                                        data->mode->vrefresh);
> >                       } else {
> > -                             data->mode =3D igt_output_get_mode(data->=
output);
> > +                             if (is_invalid_test(type)) {
> > +                                     data->mode =3D igt_output_get_mod=
e(data->output);
> > +                             } else {
> > +                                     data->mode =3D find_lowest_mode(d=
ata->output);
> > +                                     if (!data->mode) {
> > +                                             igt_info("No mode found o=
n output %s\n",
> > +                                                     igt_output_name(d=
ata->output));
> Fix indentation
> > +                                             continue;
> > +                                     }
> > +
> > +                                     igt_info("Executing on lowest mod=
e %dx%d@%d\n",
> Add output name in igt_info()
> > +                                             data->mode->hdisplay,
> > +                                             data->mode->vdisplay,
> > +                                             data->mode->vrefresh);
> Fix indentation
> > +                             }
> >                       }
> >
> >                       igt_output_override_mode(data->output, data->mode=
);
