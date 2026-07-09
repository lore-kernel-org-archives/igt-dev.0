Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBA4C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 16:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4497910E089;
	Thu,  9 Jul 2026 16:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Oo+URmK0";
	dkim-atps=neutral
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8244710E089
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 16:01:06 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-c9c26a5fb98so16257a12.0
 for <igt-dev@lists.freedesktop.org>; Thu, 09 Jul 2026 09:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783612866; cv=none;
 d=google.com; s=arc-20260327;
 b=XeJhhwDIe9p0Fwdyvnvvjbc6aH0g3f80eQ2QO7vTQxAF4bWrT3oTfhdREXRChXonVf
 LqtVCpmxeucP/5uQBEWm1lIAqZDnB9invy4o7IGI8JTXFBOylyf8mPz2vqt9xfw0/T80
 qOcOtL964kTYgi62E3iC2IN1k8Rbn7hPNKgyu+n22zs7i3nsjqnyJS33ZqVy7S7etkoa
 tZ9EBPyhco69BLzA8Asa2NRoPiAziyIsq9uzBAouvRqCVRBlaNPEgzZPlTvQt0uiYmJ4
 yeVe8E4Lcu2oVPZTT408xLdqueLZ7puRG8/gaEQAIOhweJBicM+04jsXXw3LUNUmQA/P
 D0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=oDt2FXKN7jvA/G9FjNoXw5r8b+AcLfU43AIg6Zfz9q4=;
 fh=OSrNk70Wiq3JPy4sECjZejNy0bGZNHNCBWb2KbPvKtc=;
 b=BvEm62mD/5ScExPhTVtsPE8z9OcTfgh81GZiF3P417z+F2K1Rslk3KQvGLewMCnMjA
 eum2NLbnVAHoo4mIqF9zWNWvOjXrKWFZhswnqNYl0bUvxaDuAz+HBgPn3XHZRpPE2aqH
 Ngv2g6MOaZFFFz+n6F7inDEopUeJvcG2bm8zRt17xQbEwI+h9Iddj5SYX9Uy+Nu8UNmO
 EaO/ueAGC2tsp1xlaiHRdcwGgJ/qMIU5wgaDHcgsJ54y//FUhEzJdwavGcJexHX8yDKH
 +3yZs2a1CJCSlwvZTApVXncn71wf2Y26oboD8l/PoUDDPLVt1EWs7aaCiypiz3IwJLc9
 COkw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1783612866; x=1784217666;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=oDt2FXKN7jvA/G9FjNoXw5r8b+AcLfU43AIg6Zfz9q4=;
 b=Oo+URmK0P6VNBTl7dfNTozqyq1QhYJ71AI+BizB8UHENSBwA2Tjp7CPzpn1cwasSks
 qOL2AoUSVIvYw4bsIf2WIdAuEoIH2NnEy4Hsz3waAKDEDT0xyBV2RcUf2CIFDccPZZxA
 oecSlUUuAr9L+QGgidNDiEBlIMBJP3DYK+dSwrwnuMMi+XyiCaEad9m0Ls2JCWTf5pyk
 VqEJRtJkfhvbAKL1YnHzx8q11aAktyrnAnVASDGAa9s6MHTfSyExND0kuppKyUviqhLm
 9GNFLSVbUtt69qAc4pumhYFBQ0qR/2FQPjJdQTaf1GWbrcFgAras0wphJvThrzYlzTrH
 9XAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783612866; x=1784217666;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=oDt2FXKN7jvA/G9FjNoXw5r8b+AcLfU43AIg6Zfz9q4=;
 b=CdzjDVy29q6mKOUUEQDXEgV11/vgTLNEGGaCGDewNWmPZDVFZDI24HRryHScPnCaKD
 8sZeyW3lQRbz3fikY4Pv2msmazwmpLC8b6FVc6rblDPCGtkb4vd5sFZFhhUA0SdMrjjE
 uk6JclXzM/2ur3te05kex5lqzhOJjBa5lc7gstNWPtZeFtSEOaC5pJvoqc6gTfoLyMVL
 FkxfYwyd0kivd7To0KhqRot2RtMBFpY08uq7I9q2LoTNgjU0NkUqJN6rYwU7hCO/35KX
 EkIKQjNfR6y3XRFTtMAJJb76jDwd9SZjVVUwX6NScFQLg8SrOqWf7AUt7Lqxug3/bqm6
 24hQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoZosRgbDRJ83UPeI9RioHTUWzqoevfp0/zG2EVQnxwuKF1O7UxJ/Wf1cravewOhg5US0qFtJNL@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2Vj5lyCVi+2XQ/ZD8wtDoZtMjFps42SbHDnwxatuyE3LpDVbS
 a9oouCe8n1lBR75fX3itWAYLtWtIleKYIc7ct2VrQeyEj4+uqY/kmN6bpsdW9+WPhWbwUV5L3tB
 u/QYa252Xu6gnsfGLCbfsJZXSpfVjIrzkEAiqhnkM
X-Gm-Gg: AfdE7clgO2MKeAYU8KVe8E12HYdfGsL4iX/gDSZkWfRkfvmRr1FvyXcp/eQaN5OH0FL
 J/NCWN96r/WnLgX9M9JOZfwr0KOHQ/ypMHm5Ks6wNF4xQjgkD/yDQrDFS1O6SGsGLeseAwc7YSz
 Ns5X+YxL7xdHDna1ehl7ccFQYFtB+GAhF/X0ERX4QSZXoPMW8ynOpRru/3DAwvefEeqmNem80zH
 SyjDpveTNsSLJAoJL9CMoLqy6gdLQSBGzSAkU512o5FY43IGDOTO46R7uYONB6XzlRWjxZrqjS/
 2b68otf5ozObuHGsZEMdoQwbIjYsq5Aj2XzhX0P+6dUOt1RhMoa+9N7J02KTNDgoM4YW6fI=
X-Received: by 2002:a05:6a21:339c:b0:3bf:ecf8:abe with SMTP id
 adf61e73a8af0-3c0d6118f1cmr5534928637.0.1783612865317; Thu, 09 Jul 2026
 09:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260621081043.598388-1-jason-jh.lin@mediatek.com>
 <520d7fe2b1ef01d81cbb9cba7ca79e5cbd15922c.camel@mediatek.com>
 <CAMNLLoTHYoE3AiFeTaCj14ktcvuMjR0LoewUnmR+AXpoEoxpZw@mail.gmail.com>
 <bd0165e7-d245-4780-ae78-691589bc808a@intel.com>
 <e6b4e5b8b39eae29a2749d15e1d13a34b7d24b04.camel@mediatek.com>
In-Reply-To: <e6b4e5b8b39eae29a2749d15e1d13a34b7d24b04.camel@mediatek.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Thu, 9 Jul 2026 09:00:53 -0700
X-Gm-Features: AVVi8CcZf_-2nH_XO4QSaEIMBKVJDoj1hyoM0W-dKe00HUfQwbasc4uq_fP3wz8
Message-ID: <CAMNLLoTHdWGyA5xbcFY5AUPDJ8N1b8cyArGvArJsKawHJt50PA@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "suresh.kumar.kurmi@intel.com" <suresh.kumar.kurmi@intel.com>, 
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>, 
 "jani.nikula@intel.com" <jani.nikula@intel.com>, 
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "gildekel@google.com" <gildekel@google.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>, 
 =?UTF-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>, 
 "fshao@chromium.org" <fshao@chromium.org>
Content-Type: multipart/alternative; boundary="0000000000004289bb06562fbb0a"
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

--0000000000004289bb06562fbb0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks  Jason for fixing the error and resending it, @Swati Sharma
<swati2.sharma@intel.com>  please have a look and see of it addresses
everything necessary to get this landed.

Regards
Manasi

On Thu, Jul 9, 2026 at 12:43=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5) <
Jason-JH.Lin@mediatek.com> wrote:

> On Thu, 2026-07-09 at 12:00 +0530, Sharma, Swati2 wrote:
> >
> > Hi Jason,
> >
> > Rev2 https://patchwork.freedesktop.org/series/166923/#rev2 i see IGT
> > build failure,
> >
> > can you please check?
> >
> Hi Swati,
>
> Because the series https://patchwork.freedesktop.org/series/168759
> haven't landed at that time.
> I have confirmed this patch has no conflicts in the latest codebase.
>
> I resend it again, but it seems [i-g-t v2 RESEND] will not trigger a
> new build. So I sent a [i-g-t v3], please help check it.
> https://patchwork.freedesktop.org/series/166923/#rev3
>
> Thanks!
>
> Regards,
> Jasdon-JH Lin
>

--0000000000004289bb06562fbb0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks=C2=A0 Jason for fixing the error and resending it,=
=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=3D"mailto:sw=
ati2.sharma@intel.com" tabindex=3D"-1">@Swati Sharma</a>=C2=A0 please have =
a look and see of it addresses everything necessary to get this landed.<div=
><br></div><div>Regards</div><div>Manasi</div></div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Jul 9, 2026 at 12:43=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5)=
 &lt;<a href=3D"mailto:Jason-JH.Lin@mediatek.com">Jason-JH.Lin@mediatek.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Thu, 2026-07-09 at 12:00 +0530, Sharma, Swati2 wrote:<br>
&gt; =C2=A0<br>
&gt; Hi Jason,<br>
&gt; =C2=A0<br>
&gt; Rev2 <a href=3D"https://patchwork.freedesktop.org/series/166923/#rev2"=
 rel=3D"noreferrer" target=3D"_blank">https://patchwork.freedesktop.org/ser=
ies/166923/#rev2</a> i see IGT<br>
&gt; build failure,=C2=A0<br>
&gt; =C2=A0<br>
&gt; can you please check?<br>
&gt; =C2=A0<br>
Hi Swati,<br>
<br>
Because the series <a href=3D"https://patchwork.freedesktop.org/series/1687=
59" rel=3D"noreferrer" target=3D"_blank">https://patchwork.freedesktop.org/=
series/168759</a><br>
haven&#39;t landed at that time.<br>
I have confirmed this patch has no conflicts in the latest codebase.<br>
<br>
I resend it again, but it seems [i-g-t v2 RESEND] will not trigger a<br>
new build. So I sent a [i-g-t v3], please help check it.<br>
<a href=3D"https://patchwork.freedesktop.org/series/166923/#rev3" rel=3D"no=
referrer" target=3D"_blank">https://patchwork.freedesktop.org/series/166923=
/#rev3</a><br>
<br>
Thanks!<br>
<br>
Regards,<br>
Jasdon-JH Lin<br>
</blockquote></div>

--0000000000004289bb06562fbb0a--
