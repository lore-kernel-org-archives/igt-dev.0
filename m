Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7F1CCD199
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 13:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B58D10E095;
	Thu, 16 Oct 2025 13:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BTIb96Cs";
	dkim-atps=neutral
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A902D10E095
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 13:50:27 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-88e525f912fso108961885a.1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760622626; x=1761227426;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xlVB/hBve7oXcaEJYl1xee2yb4LjuegQ5/456VfH8Pg=;
 b=BTIb96CseSDjE+1jE+Fj6FJLqD0jPMOicsIiwgJuOFH9cHvQaceVnIda01a9Ypb3t5
 hcCB2xpXkH7xpnN0vayrPeZ2MuHfWol29bWFJ6QgIICvndo1HwMUIHAuKyShyya8ICIo
 vYADrul8SOmZr/Yio5Nx3May8cMc/+G9FjgQBCs67D4kPLl44oVuU0NvfgZ0cXG1YACf
 l2wOlYewtH+Xq0EIOo6h893peNiaU6b/FNrJ3r2CvEpmV9ZjE13vqCNIJWQ5hCkDo002
 J+Ozuuww+uoxhRfyJmfdwZy5KHdwDWGDY+xOK6Iur6VCtz5vr8y9Sh8+MXWzmi7CLw3I
 Alew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760622626; x=1761227426;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xlVB/hBve7oXcaEJYl1xee2yb4LjuegQ5/456VfH8Pg=;
 b=gzm+AXQRY3aBtXx1+UMbzOFlyvEl4mwTqPaK0m8zbP+K76Vf3vxr1bCxk5og9ejvmE
 GrzZKBAwLrJlU0TjYawA3vnl6W3TyojGZYWUOp9RDylRqz0TOB4ooKNZFemvO2cW9zrH
 ZbY99QFKWTYSnUh/Z9fmohiP6+Mz8Dq+Jxppn09cXgi8kFyz5q01EDwgJysQ5eF1ToA7
 Rz+EqVEQ5h4tTJm6Unv5XjZYpeZzH004ipXHAAaHDT0WVmZr2F9IhcQBYi5ClaGfMClr
 wk3DdPqVRjjZq1zA2P21RpZTo26iqj4/DWqYQnjQ/4IJJ2fxLABv8FGPQtGm7JtsgvCa
 IYRA==
X-Gm-Message-State: AOJu0YyFeatDHrXwKvxDL13e6cgiVimuNa3CL7oa/aYwHthsXnhyUNgk
 nYo4Q3TKDnVEOHgakgIRdys2XBkmKJRyGYHaBVIFaPviFTpn0srHU8jZybD8Qp8+DQEgCAZFqRr
 tCpa4KvH700wRV7zSuto/3We7xkL56exj0L5cwkTP
X-Gm-Gg: ASbGncsjr0sTCn3dFL7ddGNapV7BcxARqyybgk9eqLiumXRYYkJ+BBzEa3Oz4Bo/YUQ
 XM2sgHHEOKJr2dR4RjVpAtClyq4LsqcIlR92PhF3Wa4YpPXANFKERDP7bNtCldF8xQjCkHK2OQ6
 XLFzkh6RAY5BdT9k9ve/vtf4zrr5IXRLAP2tFERfKgC2wimzwkQmYsUhYP1LUDxfbOUazHZNeJH
 Bzf4iRw8AM5kWR0/7s0FAMibPaR0ZCKFBuS9jXt9dOJLBECX0OFRv4wXkw0GdNSTGYE9gImKyis
 uJWzWxSe0eiQr7W0l1CCSAoNzmOHWaCD
X-Google-Smtp-Source: AGHT+IExCffcHwS+2AHErQiXy+HjBAU8h9MfkfkYcPa0eKZkXqs0xQt6ro+jRhzaPPdlR0HmcXOt6yHYQT3vbLp4FJA=
X-Received: by 2002:ac8:584b:0:b0:4e8:8f09:4144 with SMTP id
 d75a77b69052e-4e89d21c47amr2581921cf.7.1760622626181; Thu, 16 Oct 2025
 06:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <1fe5cad9c4fe83c20cbc86135fab174d4055e0b4.camel@mediatek.com>
In-Reply-To: <1fe5cad9c4fe83c20cbc86135fab174d4055e0b4.camel@mediatek.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Thu, 16 Oct 2025 09:50:14 -0400
X-Gm-Features: AS18NWD-p4yGhP8Wicino38PPGgyd3KPJRm3IZ9gIuB6CZuMVd7Lib5Dbxf5pno
Message-ID: <CAC0gqY46coQAzqDaRuBxhzAbLPH3Fn_yapb+RJ6pZf9ByAhrGQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t 0/6] Add MediaTek devices support
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>
Content-Type: multipart/alternative; boundary="000000000000389d77064146e6e4"
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

--000000000000389d77064146e6e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello maintainers,
These patches are needed by the MTK team to make IGT run on their platform.
I will ask a team to google to do the reviews. But feel free to interject
at any point if things don't look right to you.
Thanks!

On Thu, Oct 16, 2025 at 12:11=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5) <
Jason-JH.Lin@mediatek.com> wrote:

> Hi Kamil, Juha-Pekka, Bhanuprakash,
>
> Could you please take a moment to review this series?
> Your guidance will be very valuable. Thanks!
>
> Regards,
> Jason-JH Lin
>
> On Mon, 2025-10-13 at 01:13 +0800, Jason-JH Lin wrote:
> > This patch series is aimed at extending IGT GPU Tools support for
> > MediaTek devices. The following changes are included:
> >
> > - Various test case improvements to allow execution on MediaTek SoCs
> > - MediaTek-specific handling for debugfs, suspend tests, and pixel
> > format
> >   requirements
> > - Improvements to EDID parsing and content protection logic for
> > better
> >   cross-platform compatibility
> >
> > Jason-JH Lin (6):
> >   tests/kms_hdr: Use original 512x512 fb size on devices without
> > scaler
> >   tests/kms_plane: Add support for planar-settings on non-Intel
> > devices
> >   tests/kms_pipe_crc_basic: Use SUSPEND_TEST_DEVICES for MediaTek
> >     devices
> >   lib/igt_kms: Add support for mtk_current_bpc debugfs in bpc-switch
> >     test
> >   tests/kms_content_protection: Add MediaTek device support
> >   lib/igt_edid: Fix monitor name parsing and trim EDID string padding
> >
> >  lib/igt_edid.c                 | 13 ++++++++++---
> >  lib/igt_kms.c                  |  2 ++
> >  tests/kms_content_protection.c | 11 +++++++++++
> >  tests/kms_hdr.c                |  6 +++++-
> >  tests/kms_pipe_crc_basic.c     |  8 +++++++-
> >  tests/kms_plane.c              |  8 +++++---
> >  6 files changed, 40 insertions(+), 8 deletions(-)
> >
>
>
>
> ************* MEDIATEK Confidentiality Notice
>  ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
>
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
>
>

--000000000000389d77064146e6e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello maintainers,<div>These patches are needed by the MTK=
 team to make IGT run on their platform. I will ask a team to google to do =
the reviews. But feel free to interject at any point if things don&#39;t lo=
ok right to you.</div><div>Thanks!</div></div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 1=
6, 2025 at 12:11=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5) &lt;=
<a href=3D"mailto:Jason-JH.Lin@mediatek.com">Jason-JH.Lin@mediatek.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>=
<p>
</p><pre>Hi Kamil, Juha-Pekka, Bhanuprakash,

Could you please take a moment to review this series?
Your guidance will be very valuable. Thanks!

Regards,
Jason-JH Lin

On Mon, 2025-10-13 at 01:13 +0800, Jason-JH Lin wrote:
&gt; This patch series is aimed at extending IGT GPU Tools support for
&gt; MediaTek devices. The following changes are included:
&gt;=20
&gt; - Various test case improvements to allow execution on MediaTek SoCs
&gt; - MediaTek-specific handling for debugfs, suspend tests, and pixel
&gt; format
&gt; =C2=A0 requirements
&gt; - Improvements to EDID parsing and content protection logic for
&gt; better
&gt; =C2=A0 cross-platform compatibility
&gt;=20
&gt; Jason-JH Lin (6):
&gt; =C2=A0 tests/kms_hdr: Use original 512x512 fb size on devices without
&gt; scaler
&gt; =C2=A0 tests/kms_plane: Add support for planar-settings on non-Intel
&gt; devices
&gt; =C2=A0 tests/kms_pipe_crc_basic: Use SUSPEND_TEST_DEVICES for MediaTek
&gt; =C2=A0=C2=A0=C2=A0 devices
&gt; =C2=A0 lib/igt_kms: Add support for mtk_current_bpc debugfs in bpc-swi=
tch
&gt; =C2=A0=C2=A0=C2=A0 test
&gt; =C2=A0 tests/kms_content_protection: Add MediaTek device support
&gt; =C2=A0 lib/igt_edid: Fix monitor name parsing and trim EDID string pad=
ding
&gt;=20
&gt; =C2=A0lib/igt_edid.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ++++++++++---
&gt; =C2=A0lib/igt_kms.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
&gt; =C2=A0tests/kms_content_protection.c | 11 +++++++++++
&gt; =C2=A0tests/kms_hdr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++++-
&gt; =C2=A0tests/kms_pipe_crc_basic.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++=
++++-
&gt; =C2=A0tests/kms_plane.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++++---
&gt; =C2=A06 files changed, 40 insertions(+), 8 deletions(-)
&gt;=20


</pre>
<p></p></div><pre>************* MEDIATEK Confidentiality Notice
 ********************
The information contained in this e-mail message (including any=20
attachments) may be confidential, proprietary, privileged, or otherwise
exempt from disclosure under applicable laws. It is intended to be=20
conveyed only to the designated recipient(s). Any use, dissemination,=20
distribution, printing, retaining or copying of this e-mail (including its=
=20
attachments) by unintended recipient(s) is strictly prohibited and may=20
be unlawful. If you are not an intended recipient of this e-mail, or believ=
e
=20
that you have received this e-mail in error, please notify the sender=20
immediately (by replying to this e-mail), delete any and all copies of=20
this e-mail (including any attachments) from your system, and do not
disclose the content of this e-mail to any other person. Thank you!
</pre></blockquote></div>

--000000000000389d77064146e6e4--
