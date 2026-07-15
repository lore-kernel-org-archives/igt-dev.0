Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50D5C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 18:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3AF10E14E;
	Wed, 15 Jul 2026 18:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Qxs+T8Am";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C0A10E14E
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 18:55:57 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2ceae1ed204so31584375ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 11:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784141757; cv=none;
 d=google.com; s=arc-20260327;
 b=ZkfQXdo6fC5d6hnTHzdLLe1CiBHmvoGiMQS8APwH9P4xeJG/V8FVUqXcRCITc1idtA
 dr6+ERSOmsJo62GxcnL4aLOaKDPcohUR82OoOmMDgU3JZZVHoS9KE1mJCWRPJz6Q29OW
 DB2mOAuhD/PEy1JLIltQF2+VM5kp2/datpIT2dmxstCpYhOpfROCI4IiyURAODMfg25U
 gFwMtDbWxobkvt/zt98uVIYi2jglpsq7nqreIYo28JSwuPZbYhNdEOJjU5m3WvW0XFae
 NLHiFoZ9nTzUANI+rLdCkT5/FOKglhwxq3b0nXiyZjP4DKZbVA0qmsAD4Z7sqDTHVwfb
 kp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=vjAm8sTGE03Lurcdh5znuxhwIi7S8FPFVDnOP8krqpQ=;
 fh=tMRKBOoL4bJei+G6MEwhzpmpOh6Qa56X1hWPLmDQyUM=;
 b=WWCzXn2xYzS+Kc2C/SYHDNNaNQCF/aObOh5gPzU2ON8xI6WxWLQHFec2+4rrukwd+O
 aX0hIMfkhNhhP0twlifW3akV/B7EBnZCo/TwYS2NdBWDYjkRkyLAIb7j0Tnrzgo1fUdM
 RUBO+17EJXQXcZaPMAIKuNmxnSYndJmuE2o4DhvVuiAQDHUDtq1TS8oWOo1chBSE73Zs
 jLdkshj6rmlY4/a3HLl9xc2kOVLC/SHu5KarCyHHx6uH8y4THAA6toztixJBxfqm7jsF
 l/QNrQRXviFYpU1b0j7fbKe31FDEeKTqgNZ8sHmrIWoCDLVW4wD3zCMDEmiBzDDmV+kc
 JRpg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1784141757; x=1784746557;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=vjAm8sTGE03Lurcdh5znuxhwIi7S8FPFVDnOP8krqpQ=;
 b=Qxs+T8AmMt8XojIgRKzAkPEWbBkoHZJeHXvLf1GMySXUQWRz3wg5EkXA+YwV1bKa1j
 DqjOmJHNdyXDvlswHtigbZQ5PZD7ohBQNDE/RtUwqijmep/lnH3w6j2q/5Db8rtNsx1b
 IWZJkdKFyGLKNFJ7W50WOwrOwODvHGMe0AlqDcrPStPlUZEAGF52Uc8T1zer2cuZqlq+
 ANWMArTXzC3RTD7YVnPwhIIxrnM5bEjXQ+r7TAwu2cpaU0aFf4YQuYjiJq8N7jiIuASG
 jJn23/Sy2dRNUtr+iS5pSMUxkdxXRMwRrJPOAYdOrdTdOcXb9ATb95M7K8zOOcyq1sTI
 AEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784141757; x=1784746557;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=vjAm8sTGE03Lurcdh5znuxhwIi7S8FPFVDnOP8krqpQ=;
 b=Dp+abmI5MBtdfMkzTHr9apAaol1XVntkjzdATdk1EZwibL2Gn7kfx8AdDfVe6UfIjw
 pgVplPC/I6S7NfNpo8ISyLJTqGpDTLflAZEpMA6ahH8HUdWOtVXed/Pr8HbLPgrChM6F
 0gxryNsw6/Oe7r0tkRYpI7Ib0fSfzHfJ8K3mXnUiInBhHA6M67WRev5Tgb2slFUjai43
 TsZ0j6B+npiArYIBTTW4U+w3+wwwaddpFzVfeiLzodWrk0TCrjYZqLfH4QNOruxUQqqM
 0EBqQUulHkmfWUKxSjKjK5NhG53Ft0JLUiCsQ/veqMXn2Vz5y1wwDhar6BcU+Dmod4OG
 R3Kg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpwGgAG6e3RN5SegsGHIIEORflB2L+VV0AELqjUVluT/ig4XqQErt5MCX0MpdP/fp2pj4rM14X6@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf9a8fJAQnBi+SK5Y4VLiB2xhJA4kgzGnmtEiHeo3WsJMjO4dA
 VtMLkxgfL/d+GnOJpUCbm7p3xVQ5HDgWzBwK62ZwIxf68AFwAQXOFRA78r7f7TdhFFwZCxP5yoO
 H46U9fs4+z7jo50WqPQBdfRJo2FN+KJ5BsaYWqSle
X-Gm-Gg: AfdE7ck6qkCGDZHu92rgihPezlmc/0T3InYUWyxKjc8g3rl2kXr0Yn2BhzwiUjt7ZJJ
 /Raj+Mtih6DukKJPLje2x50lHOOswYhv7yguE13t/hMyagdo0Hj3xDBQDR6RYk3T4ZaWa8O6NQk
 J0YwMzRacOSF+Sm8GtYJhS5OUu5Od78nnnzQu8B+NA3pRc+Cl8hfY5ayyZBI6DYGDQRw50TfUbf
 WNBCYeeDxBvpDa4IDpveLlZ/IAzqQCRUkJoXk1f0L/F89Mrk1dNQUjPd0XpAyaaSia2t1/310+k
 PIBlOOVXYc5y6YWMhymRgPWjEdUkSRgoKbRrhulb8wCpivKR9D4LZy0snTgUh/Hk+J5IjBw=
X-Received: by 2002:a05:6a20:a11c:b0:3bf:a698:ce4d with SMTP id
 adf61e73a8af0-3c110b6e09bmr20970279637.54.1784141756895; Wed, 15 Jul 2026
 11:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260621081043.598388-1-jason-jh.lin@mediatek.com>
 <520d7fe2b1ef01d81cbb9cba7ca79e5cbd15922c.camel@mediatek.com>
 <CAMNLLoTHYoE3AiFeTaCj14ktcvuMjR0LoewUnmR+AXpoEoxpZw@mail.gmail.com>
 <bd0165e7-d245-4780-ae78-691589bc808a@intel.com>
 <e6b4e5b8b39eae29a2749d15e1d13a34b7d24b04.camel@mediatek.com>
 <667d2cc5-a7ab-4c2c-9218-e50e01001b9c@intel.com>
 <dd0fa20c95b8e0b66eb5a4f0cdde4fa44516e5d6.camel@mediatek.com>
In-Reply-To: <dd0fa20c95b8e0b66eb5a4f0cdde4fa44516e5d6.camel@mediatek.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 15 Jul 2026 11:55:45 -0700
X-Gm-Features: AUfX_mzFIvj-U2vUj8v7Odosj3xXqbKCI3L98u2QVvEbft8Mpc8A_ibJVLAH-lA
Message-ID: <CAMNLLoTOnZdL78BcJ15tqP+MaN6WU=-=jSHx0+E81tJGdNPuhQ@mail.gmail.com>
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
 "gildekel@google.com" <gildekel@google.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>, 
 =?UTF-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>, 
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "fshao@chromium.org" <fshao@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000a762dc0656aadf4b"
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

--000000000000a762dc0656aadf4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great, thanks a lot Swati for reviews.
Could we get this landed if CI results look good?

Regards
Manasi

On Fri, Jul 10, 2026 at 12:21=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5) <
Jason-JH.Lin@mediatek.com> wrote:

> On Fri, 2026-07-10 at 02:07 +0530, Sharma, Swati2 wrote:
> >
> > On 09-07-2026 01:12 pm, Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5) wrot=
e:
> > > On Thu, 2026-07-09 at 12:00 +0530, Sharma, Swati2 wrote:
> > > >
> > > > Hi Jason,
> > > >
> > > > Rev2
> > > >
> https://urldefense.com/v3/__https://patchwork.freedesktop.org/series/1669=
23/*rev2__;Iw!!CTRNKA9wMg0ARbw!jJDLK7pG0ZuxmGD136DdZjWzRPf1LZUuc6ZYogtPdi8l=
ydj57e7rG3K-B5-1SJam7TDwVn6K7BDFbovc478SXl_HZk1P$
> > > >   i see IGT
> > > > build failure,
> > > >
> > > > can you please check?
> > > >
> > > Hi Swati,
> > >
> > > Because the series
> > >
> https://urldefense.com/v3/__https://patchwork.freedesktop.org/series/1687=
59__;!!CTRNKA9wMg0ARbw!jJDLK7pG0ZuxmGD136DdZjWzRPf1LZUuc6ZYogtPdi8lydj57e7r=
G3K-B5-1SJam7TDwVn6K7BDFbovc478SXux1w-1m$
> > >
> > > haven't landed at that time.
> > > I have confirmed this patch has no conflicts in the latest
> > > codebase.
> > >
> > > I resend it again, but it seems [i-g-t v2 RESEND] will not trigger
> > > a
> > > new build. So I sent a [i-g-t v3], please help check it.
> > >
> https://urldefense.com/v3/__https://patchwork.freedesktop.org/series/1669=
23/*rev3__;Iw!!CTRNKA9wMg0ARbw!jJDLK7pG0ZuxmGD136DdZjWzRPf1LZUuc6ZYogtPdi8l=
ydj57e7rG3K-B5-1SJam7TDwVn6K7BDFbovc478SXlqtxaxb$
> > >
> > >
> > > Thanks!
> > >
> > > Regards,
> > > Jasdon-JH Lin
> >
> > Hi Jason,
> >
> > Patch LGTM
> >
> > Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> >
> > Please wait for CI results before merge.
>
> That's great, thank you for your review!
>
>
> Regards,
> Jason-JH Lin
>

--000000000000a762dc0656aadf4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great, thanks a lot Swati for reviews.<div>Could we get th=
is landed if CI results look good?</div><div><br></div><div>Regards</div><d=
iv>Manasi</div></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 10, 2026 at 12:21=E2=80=AF=
AM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5) &lt;<a href=3D"mailto:Jason-J=
H.Lin@mediatek.com">Jason-JH.Lin@mediatek.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2026-07-10 at 02:07 +0=
530, Sharma, Swati2 wrote:<br>
&gt; <br>
&gt; On 09-07-2026 01:12 pm, Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5) wro=
te:<br>
&gt; &gt; On Thu, 2026-07-09 at 12:00 +0530, Sharma, Swati2 wrote:<br>
&gt; &gt; &gt; =C2=A0 <br>
&gt; &gt; &gt; Hi Jason,<br>
&gt; &gt; &gt; =C2=A0 <br>
&gt; &gt; &gt; Rev2<br>
&gt; &gt; &gt; <a href=3D"https://urldefense.com/v3/__https://patchwork.fre=
edesktop.org/series/166923/*rev2__;Iw!!CTRNKA9wMg0ARbw!jJDLK7pG0ZuxmGD136Dd=
ZjWzRPf1LZUuc6ZYogtPdi8lydj57e7rG3K-B5-1SJam7TDwVn6K7BDFbovc478SXl_HZk1P$" =
rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https://pa=
tchwork.freedesktop.org/series/166923/*rev2__;Iw!!CTRNKA9wMg0ARbw!jJDLK7pG0=
ZuxmGD136DdZjWzRPf1LZUuc6ZYogtPdi8lydj57e7rG3K-B5-1SJam7TDwVn6K7BDFbovc478S=
Xl_HZk1P$</a><br>
&gt; &gt; &gt; =C2=A0 i see IGT<br>
&gt; &gt; &gt; build failure,<br>
&gt; &gt; &gt; =C2=A0 <br>
&gt; &gt; &gt; can you please check?<br>
&gt; &gt; &gt; =C2=A0 <br>
&gt; &gt; Hi Swati,<br>
&gt; &gt; <br>
&gt; &gt; Because the series<br>
&gt; &gt; <a href=3D"https://urldefense.com/v3/__https://patchwork.freedesk=
top.org/series/168759__;!!CTRNKA9wMg0ARbw!jJDLK7pG0ZuxmGD136DdZjWzRPf1LZUuc=
6ZYogtPdi8lydj57e7rG3K-B5-1SJam7TDwVn6K7BDFbovc478SXux1w-1m$" rel=3D"norefe=
rrer" target=3D"_blank">https://urldefense.com/v3/__https://patchwork.freed=
esktop.org/series/168759__;!!CTRNKA9wMg0ARbw!jJDLK7pG0ZuxmGD136DdZjWzRPf1LZ=
Uuc6ZYogtPdi8lydj57e7rG3K-B5-1SJam7TDwVn6K7BDFbovc478SXux1w-1m$</a><br>
&gt; &gt; =C2=A0<br>
&gt; &gt; haven&#39;t landed at that time.<br>
&gt; &gt; I have confirmed this patch has no conflicts in the latest<br>
&gt; &gt; codebase.<br>
&gt; &gt; <br>
&gt; &gt; I resend it again, but it seems [i-g-t v2 RESEND] will not trigge=
r<br>
&gt; &gt; a<br>
&gt; &gt; new build. So I sent a [i-g-t v3], please help check it.<br>
&gt; &gt; <a href=3D"https://urldefense.com/v3/__https://patchwork.freedesk=
top.org/series/166923/*rev3__;Iw!!CTRNKA9wMg0ARbw!jJDLK7pG0ZuxmGD136DdZjWzR=
Pf1LZUuc6ZYogtPdi8lydj57e7rG3K-B5-1SJam7TDwVn6K7BDFbovc478SXlqtxaxb$" rel=
=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https://patch=
work.freedesktop.org/series/166923/*rev3__;Iw!!CTRNKA9wMg0ARbw!jJDLK7pG0Zux=
mGD136DdZjWzRPf1LZUuc6ZYogtPdi8lydj57e7rG3K-B5-1SJam7TDwVn6K7BDFbovc478SXlq=
txaxb$</a><br>
&gt; &gt; =C2=A0<br>
&gt; &gt; <br>
&gt; &gt; Thanks!<br>
&gt; &gt; <br>
&gt; &gt; Regards,<br>
&gt; &gt; Jasdon-JH Lin<br>
&gt; <br>
&gt; Hi Jason,<br>
&gt; <br>
&gt; Patch LGTM<br>
&gt; <br>
&gt; Reviewed-by: Swati Sharma &lt;<a href=3D"mailto:swati2.sharma@intel.co=
m" target=3D"_blank">swati2.sharma@intel.com</a>&gt;<br>
&gt; <br>
&gt; Please wait for CI results before merge.<br>
<br>
That&#39;s great, thank you for your review!<br>
<br>
<br>
Regards,<br>
Jason-JH Lin<br>
</blockquote></div>

--000000000000a762dc0656aadf4b--
