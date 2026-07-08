Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142EBC43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 22:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B841D10F315;
	Wed,  8 Jul 2026 22:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gBDacUqg";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F79E10F315
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 22:29:10 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2caf228a910so8617935ad.2
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Jul 2026 15:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783549749; cv=none;
 d=google.com; s=arc-20260327;
 b=olLmCkYgYbpqg4NPskQI+7X1Ohaa7BlrZr0JbM0IwKjw5gcZG2TMcGQuVKfpF+xGkV
 ibTa7lYvZkg9xYC7Kx0rSuiig6JRZOBojxZwllairRDc7/T0gAA7cdvr2V6lX01lJd9y
 jr45om/XnFr2JmzPtrlwF9TuCSMukqpg+MLbS9x8WPL8FqNOr4DKUazgacDq81LWq9nU
 vn0UCjd87LVyF6Ty0o8Fnqw7KA01WRdTCPuJ1a06z96S8uGR+VByqarQzbI2QIn5jB1y
 ukNtyIjWgM3XKN8G6YXYF9jDUXnJzO6qOb6IcBy0z7UF+vmPOjuaxAudUa8TkEY5dhio
 Sb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=w5ekPLrJYp1XrRWfI5f95/SdFVnjmjWE2ExQeGopIVs=;
 fh=Vs62QYrMpJaa0Hxg2QjRSi65MxyE1RcVZ7RYga5v0jI=;
 b=X9hyJusbH3CawPxDCdGecYCMNxlWNwqM9KDpew95OmjgAgZ7afKhkp7qZSmobrbXLC
 +nSmqCqfxg+e436sXGdNd3A/+dJva9bTXeSRPYSpyImn0oFFuVQeTaSIs9zCojgC3D56
 dalcKaBm/IJhm8hbciZHoZwTSGcTDYs5Pq6TfX694bNgC+f625WZVAVh1cvAQ4PH4XCA
 5LWO4fuMPvNbnJxnklqOnK/XRqIiAsjQ0fcn+1hnXYjZByOqNvaH8jJxp3lgiMLNKSO5
 MYu0sDfv1EHbSUpHzxSi6HKEXeNRh6r7n4ZtGL8Z7Xezffgrt9EwlUsBJe/QxgVnfnpd
 N5ew==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1783549749; x=1784154549;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=w5ekPLrJYp1XrRWfI5f95/SdFVnjmjWE2ExQeGopIVs=;
 b=gBDacUqggyFeRSZIelKG3V4W77qsBWg3aSJFoekOsCQC92QQ95JJxIyW9DNVjqLX05
 JjKPtPK5N9qG+p/NjfcIUXFF64X4lTeyIJUJj6ZekQwWJnrGHLPNaxk6AkgryBcGwLVe
 kxn0XcFSORvxMRpoHAx4r2Cx8WEAgkLLcDsFloqlkg0MLa672x2X27TESPghrX2sV5e3
 UFH2AjbW5KlfDWrXDpN6PaRivfj6126HB5uHr+A4oAhauWa42c+AFvtf8nxm7tNPZ8Jn
 gkgJsAlOr2OpWG85orZOPb4sOKZDKmJ1xwoeqWfAvprD6JlKOBsnNCHeuqbGHF15geiR
 JdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783549749; x=1784154549;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=w5ekPLrJYp1XrRWfI5f95/SdFVnjmjWE2ExQeGopIVs=;
 b=jObtyVjTAMyC+IUhlbqiaoUF2mtoNjh2zXc9062r1QW9GV6TsgPZT1wkAzVavpP0+J
 +Va7sGzGJZrgA8vGGI+2y+pDGjfy+qgHgeC98J6+SSTPgr7Z3NYukYNL1UgNPYRlCT85
 cplLLCLEfc94XXIimLhVo6DOxmUdwwV5NVmkPm3PFdkGPAsnMZpLys14wbJVlUDlkPxe
 GTrl/mxiK+LnFv42opJQbTJBrTM+WWFaOo81WEhe+Dc6NqetW7qgTs/iEMt8PLLDBPYH
 u/Hxwcn0N0cx9Q9IBXpb6gRzLXf+8JaXrCa5mR6sOJTLO8aNoZu5ZIcLuNWTbLi4MKnY
 I5GA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrDgEn9Vz4/jWYmyqP08d/8iyZxRnJpwLMNKxzIsFKzMDXkOi/G6BnkD4g6v6ZbOGtbKFhyINFb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYhw5o2zhDsjPXtY0UTRQ7JuCEj4ZH7HAn+rho/jsKg5zoe3Rc
 Y7KikCDUbLA5YSE8atg71IcAtWUa7iZTWogjFqYmjocksq4200izvwbYboTAeHehX3FXuL3HX1P
 H5hvNDFx1EqmFY1dozgEcYw1W0PF6odGuqM4qqR38
X-Gm-Gg: AfdE7cm1WUsRcSsSlxsjint4tEcGzEKzUHZkpEONJ2NEQCWEjTqPsxs26WkTbn8ULom
 wGrNuekIkHTQVO8FdXwfV1eiRSrCLDNQCskmeAnHw/LMb6gf9qGs8gx2EHwLJ6fZnQqY96mAj5r
 oGoa+HdvTojoHKDLGsfINeI8kdSicSN1GCZWEOQ4QbGqynXxVgTl/uRvVuih6YYBIYOjclCPXtE
 YMOfUpBRx3eIuBf+HkBACDyA5mNE3e7GxbHkCUqQ7hLYL4+XVFn/Mjlyt+ZPq9FMCm2LFTcs1Nn
 9h3DKlkbjbj39iu4HHmIVj15GU4xnh6kvinUaQ61eShbXwjShsg/WiGkiPlu1m9o64Yukxw=
X-Received: by 2002:a05:6a21:6817:b0:3bf:a0e5:99a1 with SMTP id
 adf61e73a8af0-3c0bcc26966mr5350247637.51.1783549748885; Wed, 08 Jul 2026
 15:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260621081043.598388-1-jason-jh.lin@mediatek.com>
 <520d7fe2b1ef01d81cbb9cba7ca79e5cbd15922c.camel@mediatek.com>
In-Reply-To: <520d7fe2b1ef01d81cbb9cba7ca79e5cbd15922c.camel@mediatek.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 8 Jul 2026 15:28:57 -0700
X-Gm-Features: AVVi8CfybJBZkjmkOHJKhradWkfvuX4oEqp9fdteFUZQwg9ub6KASBgyc1Q0GqM
Message-ID: <CAMNLLoTHYoE3AiFeTaCj14ktcvuMjR0LoewUnmR+AXpoEoxpZw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "fshao@chromium.org" <fshao@chromium.org>, 
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>, 
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
 =?UTF-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>
Content-Type: multipart/alternative; boundary="0000000000003a102806562109dc"
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

--0000000000003a102806562109dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi @Swati Sharma <swati2.sharma@intel.com>  @Karthik B S
<karthik.b.s@intel.com> , @Kurmi, Suresh Kumar
<suresh.kumar.kurmi@intel.com> :

Could we please get Intel's help here to get this landed, Jason has already
addressed the review comments from Swati.
This is blocking the tests from Google side.

Regards
Manasi

On Sat, Jun 27, 2026 at 10:16=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5) <
Jason-JH.Lin@mediatek.com> wrote:

> On Sun, 2026-06-21 at 16:07 +0800, Jason-JH Lin wrote:
> > Check if the primary plane supports the test format before attempting
> > to create framebuffer. This allows the test to gracefully skip
> > formats
> > not supported by the hardware (e.g., FP16 formats on MediaTek)
> > instead
> > of failing with assertion errors.
> >
> > Fixes: 5d46625cfb21 ("tests/kms_hdr: add FP16 format coverage")
> > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> >
> > ---
> >
> > Change in v2:
> > 1. Fix grammatical error "not" -> "dosen't"
> > 2. Rebased on: https://patchwork.freedesktop.org/series/168759
> >
>
> Hi Swati,
>
> I've modified your comments in the previous version:
> https://patchwork.freedesktop.org/patch/726414/
>
> Could you please help review and add a Reviewed-by tag?
> Thank you very much.
>
> Regards
> Jason-JH Lin
>
> > ---
> >  tests/kms_hdr.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> > index 2079bc154412..ac75f66f34a0 100644
> > --- a/tests/kms_hdr.c
> > +++ b/tests/kms_hdr.c
> > @@ -298,9 +298,17 @@ static void test_bpc_switch(data_t *data,
> > uint32_t flags)
> >
> >                               igt_dynamic_f("pipe-%s-%s-%s",
> >                                             igt_crtc_name(crtc),
> > output->name,
> > -
> > igt_format_str(hdr_test_formats[i]))
> > +
> > igt_format_str(hdr_test_formats[i])) {
> > +                                     igt_require_f(igt_plane_has_
> > format_mod(data->primary,
> > +
> >              hdr_test_formats[i],
> > +
> >              DRM_FORMAT_MOD_LINEAR),
> > +                                                   "%s: Primary
> > plane doesn't support format %s.\n",
> > +
> > igt_output_name(output),
> > +
> > igt_format_str(hdr_test_formats[i]));
> > +
> >                                       test_bpc_switch_on_output(da
> > ta, crtc, output,
> >
> > hdr_test_formats[i], flags);
> > +                             }
> >
> >                               test_fini(data);
> >                       }
>
>

--0000000000003a102806562109dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-2=
" href=3D"mailto:swati2.sharma@intel.com" tabindex=3D"-1">@Swati Sharma</a>=
=C2=A0=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-3" href=3D"mai=
lto:karthik.b.s@intel.com" tabindex=3D"-1">@Karthik B S</a>=C2=A0,=C2=A0<a =
class=3D"gmail_plusreply" id=3D"plusReplyChip-4" href=3D"mailto:suresh.kuma=
r.kurmi@intel.com" tabindex=3D"-1">@Kurmi, Suresh Kumar</a>=C2=A0:<div><br>=
</div><div>Could we please get Intel&#39;s help here to get this landed, Ja=
son has already addressed the review comments from Swati.</div><div>This is=
 blocking the tests from Google side.</div><div><br></div><div>Regards</div=
><div>Manasi</div></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 27, 2026 at 10:16=E2=80=
=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5) &lt;<a href=3D"mailto:Jaso=
n-JH.Lin@mediatek.com">Jason-JH.Lin@mediatek.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2026-06-21 at 16:07=
 +0800, Jason-JH Lin wrote:<br>
&gt; Check if the primary plane supports the test format before attempting<=
br>
&gt; to create framebuffer. This allows the test to gracefully skip<br>
&gt; formats<br>
&gt; not supported by the hardware (e.g., FP16 formats on MediaTek)<br>
&gt; instead<br>
&gt; of failing with assertion errors.<br>
&gt; <br>
&gt; Fixes: 5d46625cfb21 (&quot;tests/kms_hdr: add FP16 format coverage&quo=
t;)<br>
&gt; Signed-off-by: Jason-JH Lin &lt;<a href=3D"mailto:jason-jh.lin@mediate=
k.com" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; <br>
&gt; Change in v2:<br>
&gt; 1. Fix grammatical error &quot;not&quot; -&gt; &quot;dosen&#39;t&quot;=
<br>
&gt; 2. Rebased on: <a href=3D"https://patchwork.freedesktop.org/series/168=
759" rel=3D"noreferrer" target=3D"_blank">https://patchwork.freedesktop.org=
/series/168759</a><br>
&gt; <br>
<br>
Hi Swati,<br>
<br>
I&#39;ve modified your comments in the previous version:<br>
<a href=3D"https://patchwork.freedesktop.org/patch/726414/" rel=3D"noreferr=
er" target=3D"_blank">https://patchwork.freedesktop.org/patch/726414/</a><b=
r>
<br>
Could you please help review and add a Reviewed-by tag?<br>
Thank you very much.<br>
<br>
Regards<br>
Jason-JH Lin<br>
<br>
&gt; ---<br>
&gt; =C2=A0tests/kms_hdr.c | 10 +++++++++-<br>
&gt; =C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c<br>
&gt; index 2079bc154412..ac75f66f34a0 100644<br>
&gt; --- a/tests/kms_hdr.c<br>
&gt; +++ b/tests/kms_hdr.c<br>
&gt; @@ -298,9 +298,17 @@ static void test_bpc_switch(data_t *data,<br>
&gt; uint32_t flags)<br>
&gt; =C2=A0<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_dynamic_f(&quot;pipe-%s-%s-%s&=
quot;,<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 igt_crtc_name(crtc),<br>
&gt; output-&gt;name,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<br>
&gt; igt_format_str(hdr_test_formats[i]))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<br>
&gt; igt_format_str(hdr_test_formats[i])) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_require_=
f(igt_plane_has_<br>
&gt; format_mod(data-&gt;primary,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdr_tes=
t_formats[i],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_FOR=
MAT_MOD_LINEAR),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;%s: Primary<br>
&gt; plane doesn&#39;t support format %s.\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
&gt; igt_output_name(output),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
&gt; igt_format_str(hdr_test_formats[i]));<br>
&gt; +<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_b=
pc_switch_on_output(da<br>
&gt; ta, crtc, output,<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=C2=A0<br>
&gt; hdr_test_formats[i], flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_fini(data);<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
<br>
</blockquote></div>

--0000000000003a102806562109dc--
