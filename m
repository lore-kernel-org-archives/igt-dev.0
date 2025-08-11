Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B1AC87FD2
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 09:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0437F10E131;
	Mon, 11 Aug 2025 09:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TJQwL6nw";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D65C10E131
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 09:02:32 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2401b855980so29334275ad.1
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754902951; x=1755507751; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ro5R4fwRPOAVrg24VLWW5VWkTv1IA3sI90dvjDTDpQ0=;
 b=TJQwL6nw8HQ7D1d8y3cfO3X+M5SbzO9lUYBqxprt4KUfqB0etU4Hhe62Pyqj3heTfE
 BPd3TbTsJYgETz0pxxIFzT9k9vV0mhBYWWPSDDc3MhYWjYcXAYo6p70IHRUo9hpX8NjV
 uvCThMir5YYDhHgy27I9peJbabL643Cb1qZqexAXOJqi98VkjJKK9JYgYd9DwDKeBJX7
 o1ACE8AvgS4Vx/vRenQH0DrJ/rksaviqzDeG7UyQ96ej2LI2Dd7x7S1LBSKihLK5yjmP
 3lDZVR08E4Inc7fhGG3IKNchaUxGRsaFyeSSODyXPRdCVqb5jVFVnMcNamjMCmPQ55zX
 6rDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754902951; x=1755507751;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ro5R4fwRPOAVrg24VLWW5VWkTv1IA3sI90dvjDTDpQ0=;
 b=kTyXwAi/aR0dIzYhf+8x4THRqQZZk0K3LnaNFctSZ5OPhf75MtFNsd6rzQk30Ioaqf
 FnWyZXqbMN1kbubrAOBiM0NiFP8g33MRZWfsZc/SVqqQJiS7ptBSj3BR0pdgJIixx232
 HuVZDq4/25yMHTPI50JACs9kcn0oCa/n8AfenySyl7wJSZctSnfoM6n5XXHaqjYcG34t
 F06XOMhANdXik6TcYXwN26ZqxMw8ydh6oKslxgWL4Fy009ojMQPVj0qIdljJLHlM5OZv
 OvtGq20mEFSqpMQQxkOTHLVbyIxwbBgnMa1LxGvvXOkBR5BU6cJNFnGR4j8/5WZN6KzS
 4jDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRAhzyAKihSQYT0DSIWQB33oHdOQaZLM+VMTy9NhdefSWclIyVyxOJLtuw6hutCW4+5iJmPNqE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFAS6Tjir71KJEqe1RrWQbP2hoYtEegx0MHATxJdfbi2wRv+zu
 GfjO2ukkhNN9RLSwlgN9pmD5Ia5aEAZAxjqU3SPQKqqhffEZcnnL7qPiulW2/aUcD8AcTi/WmVK
 ERPXdT9fIY/t60MEmvagz5g8jkuqbP38=
X-Gm-Gg: ASbGncu6FE4Y//q39hhJDkyi91iyfmEUqgVP4u+s6d8VGZ0I5n5Xq4x2uFeBZ0ZTn+2
 jVA9pJesXU5vaWMxocUqpSXBzDm/535Q7SYcGAMDjJTpg8bGfLf7nKSvNEppwWIWRrupP/fQUYk
 vu7IQCM8Q+opfKx7KMXnH4/IGSx912jnhY/0HL7cmdCTpbUJhCCdcmU/9h153gQDvkEmatShKLg
 4gbIzQObw==
X-Google-Smtp-Source: AGHT+IFEZMGGYElWZIwuZ4SSKwnwrBZaqJvalxgk5UJGduAhzsOV4Yi17z9Kym/g2VGUK/A3sw8SmlLMIH3XVRhd1Mg=
X-Received: by 2002:a17:902:f544:b0:240:c9b6:f8ee with SMTP id
 d9443c01a7336-242c225f966mr175151245ad.50.1754902951477; Mon, 11 Aug 2025
 02:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250722073906.99759-1-tvrtko.ursulin@igalia.com>
 <7b81801d-42aa-4364-b0a1-e5a50d817cd1@ursulin.net>
In-Reply-To: <7b81801d-42aa-4364-b0a1-e5a50d817cd1@ursulin.net>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Mon, 11 Aug 2025 12:02:20 +0300
X-Gm-Features: Ac12FXw5jcS3RW1E6ArCAMH56OAj2vKPHPkDgfkBkf-T2KuhRBG0Uj-8x0sBWzQ
Message-ID: <CAJ=qYWR597CmdV+7wUM3_-8936oB-ZnZOS1LGBUe_Pg8WoznDw@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib/intel/veboxcopy: Respect buffer MOCS index
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, igt-dev@lists.freedesktop.org, 
 Imre Deak <imre.deak@intel.com>, 
 =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>, 
 Mika Kahola <mika.kahola@intel.com>
Content-Type: multipart/alternative; boundary="00000000000009c8de063c132f91"
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

--00000000000009c8de063c132f91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tvrtko,

I'll add this to my list, Kamil was already earlier asking me about this. I
got back from vacation and needed to sort other things first.

/Juha-Pekka

On Mon, Aug 11, 2025 at 11:43=E2=80=AFAM Tvrtko Ursulin <tursulin@ursulin.n=
et>
wrote:

>
> On 22/07/2025 08:39, Tvrtko Ursulin wrote:
> > Set the MOCS indices in surface state from the source and
> > destination buffers. So far it was done only for the input
> > buffer and only for 4Tile formats. Always setting it alings
> > with how rendercopy does it and it fixes the AuxCCS tests on
> > ADL when target is of the MC flavour.
> >
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Cc: Imre Deak <imre.deak@intel.com>
> > Cc: Juha-Pekka Heikkil=C3=A4 <juha-pekka.heikkila@intel.com>
> > Cc: Mika Kahola <mika.kahola@intel.com>
> > ---
> > Lets see what the CI will think of this change.
>
> CI is happy. Any takers for review?
>
> Regards,
>
> Tvrtko
>
> > Curiously the AuxCCS tests where target is RC, so rendercopy
> > which does set the MOCS correctly is used, are still flaky so
> > that sounds like a different problem.
> > ---
> >   lib/veboxcopy_gen12.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
> > index 4e3aefaf1f44..2193433a1c00 100644
> > --- a/lib/veboxcopy_gen12.c
> > +++ b/lib/veboxcopy_gen12.c
> > @@ -258,6 +258,8 @@ static void emit_tiling_convert_cmd(struct intel_bb
> *ibb,
> >
> >       if (HAS_4TILE(ibb->devid))
> >               tc->tc1_2.input_mocs_idx =3D IS_DG2(ibb->devid) ? 3 : 9;
> > +     else
> > +             tc->tc1_2.input_mocs_idx =3D src->mocs_index;
> >
> >       tc->tc1_2.input_tiled_resource_mode =3D src->tiling =3D=3D
> I915_TILING_Yf;
> >
> > @@ -278,6 +280,8 @@ static void emit_tiling_convert_cmd(struct intel_bb
> *ibb,
> >                       dst->compression =3D=3D I915_COMPRESSION_RENDER;
> >       }
> >
> > +     tc->tc3_4.output_mocs_idx =3D dst->mocs_index;
> > +
> >       if (HAS_4TILE(ibb->devid))
> >               tc->tc3_4.output_mocs_idx =3D IS_DG2(ibb->devid) ? 3 : 9;
> >
>
>

--00000000000009c8de063c132f91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Tvrtko,</div><div><br></div><div>I&#39;ll add=
 this to my list, Kamil was already earlier asking me about this. I got bac=
k from vacation and needed to sort other things first.</div><div><br></div>=
<div>/Juha-Pekka</div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 11, 2025 at 11:43=E2=80=
=AFAM Tvrtko Ursulin &lt;<a href=3D"mailto:tursulin@ursulin.net">tursulin@u=
rsulin.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
On 22/07/2025 08:39, Tvrtko Ursulin wrote:<br>
&gt; Set the MOCS indices in surface state from the source and<br>
&gt; destination buffers. So far it was done only for the input<br>
&gt; buffer and only for 4Tile formats. Always setting it alings<br>
&gt; with how rendercopy does it and it fixes the AuxCCS tests on<br>
&gt; ADL when target is of the MC flavour.<br>
&gt; <br>
&gt; Signed-off-by: Tvrtko Ursulin &lt;<a href=3D"mailto:tvrtko.ursulin@iga=
lia.com" target=3D"_blank">tvrtko.ursulin@igalia.com</a>&gt;<br>
&gt; Cc: Imre Deak &lt;<a href=3D"mailto:imre.deak@intel.com" target=3D"_bl=
ank">imre.deak@intel.com</a>&gt;<br>
&gt; Cc: Juha-Pekka Heikkil=C3=A4 &lt;<a href=3D"mailto:juha-pekka.heikkila=
@intel.com" target=3D"_blank">juha-pekka.heikkila@intel.com</a>&gt;<br>
&gt; Cc: Mika Kahola &lt;<a href=3D"mailto:mika.kahola@intel.com" target=3D=
"_blank">mika.kahola@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; Lets see what the CI will think of this change.<br>
<br>
CI is happy. Any takers for review?<br>
<br>
Regards,<br>
<br>
Tvrtko<br>
<br>
&gt; Curiously the AuxCCS tests where target is RC, so rendercopy<br>
&gt; which does set the MOCS correctly is used, are still flaky so<br>
&gt; that sounds like a different problem.<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0lib/veboxcopy_gen12.c | 4 ++++<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c<br>
&gt; index 4e3aefaf1f44..2193433a1c00 100644<br>
&gt; --- a/lib/veboxcopy_gen12.c<br>
&gt; +++ b/lib/veboxcopy_gen12.c<br>
&gt; @@ -258,6 +258,8 @@ static void emit_tiling_convert_cmd(struct intel_b=
b *ibb,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (HAS_4TILE(ibb-&gt;devid))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;tc1_2.inp=
ut_mocs_idx =3D IS_DG2(ibb-&gt;devid) ? 3 : 9;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;tc1_2.input_mo=
cs_idx =3D src-&gt;mocs_index;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;tc1_2.input_tiled_resource_mode =3D s=
rc-&gt;tiling =3D=3D I915_TILING_Yf;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -278,6 +280,8 @@ static void emit_tiling_convert_cmd(struct intel_b=
b *ibb,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dst-&gt;compression =3D=3D I915_COMPRESSION_RENDER;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;tc3_4.output_mocs_idx =3D dst-&gt;mocs_ind=
ex;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (HAS_4TILE(ibb-&gt;devid))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;tc3_4.out=
put_mocs_idx =3D IS_DG2(ibb-&gt;devid) ? 3 : 9;<br>
&gt;=C2=A0 =C2=A0<br>
<br>
</blockquote></div></div>

--00000000000009c8de063c132f91--
