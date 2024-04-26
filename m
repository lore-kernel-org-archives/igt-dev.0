Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE451C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 09:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE2C10F448;
	Fri, 26 Apr 2024 09:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SyhJpvyX";
	dkim-atps=neutral
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1AC11AA06
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 04:30:31 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2def8e58471so21009441fa.0
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 21:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714105829; x=1714710629; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6V2hM+h6pS0gu/m4gL1FgRP8pL4W82EnInwVaM15E1Y=;
 b=SyhJpvyXvlb4OtZ/2cuySkimp+YytJSzWko20nCL51cC6AY4XCP5+to7J2qOJxzFhN
 rDy5LlzcL5moLFngAAmNIgTu7fheDbSBby22jCMTyxg5ml3336iMz9pBFhTpxF+3hjSz
 mTutuLGlLjubT74bsElzZ3zTjRkYdeqDexAumoSO4CdPGmERpzZzW8Lj8iSY7Uxa84nx
 OpF8zeEuVs4drLBtz3+Va36nqUibiQRE4nZKJGohicOTXt03Tw0xXDv7XfpEAiTX+eEJ
 vZqemTJgBYYsDsJyEu2bR6D0tNKRTgvsvT/KrE3aqmZTf9aJzxj2NdRZFFTwDBnuuS/C
 e2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714105829; x=1714710629;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6V2hM+h6pS0gu/m4gL1FgRP8pL4W82EnInwVaM15E1Y=;
 b=PHIrC56A8DHVQp8rq4q0e/kZk/1wGnYWZWqZY99zgRRQJpIR/TOvx4mCAz3+7Sd0vP
 3Lx8kXDQrgIBqS+UKAPkcQEURKmyuNF2qcqcAeyXkwwuuWaJAWAcK3Xi1P7DxRsKlHsY
 28nVFqYxYiDPUwxrzszR64kZ+cX7Rw0unQApeGDTzkPdQ2knw1rqQYhGZLriL3q4VJyv
 tvYniQa5Xj0Pkl/HmHsZhgHnxVZCNB/2jRI6RaDBZ/8sgWhByDqwL581pdwUdTHXwOnG
 g1RskvHIn+NOUtMNoj6fyETC74NKBq71eNV1J7YtPf7kwbgszukoIchWrT4stnQJWbSj
 x4Dg==
X-Gm-Message-State: AOJu0Yym3l7K1WH9ZU3O4rYTI7ZVFWqiClV7PHGtHsi7CPM6Ae2GI38P
 yCDb50QR5PJvJIheb5FTBMvlhUcwed9yj2wXX4yOQjyvFTETnl0iQ8eSyGCPfyNNgeacJcoUIuc
 xPsAJgEtgWYXuQWBCqugYOszdMYo=
X-Google-Smtp-Source: AGHT+IHgEUbLY8ASr33Uw3/WafAOT5cyauDPLnQ2JZkoSFlF0K3kFRp8ca/7JJ5t6ga0iGRClragBTa2RI4nuLvxdHw=
X-Received: by 2002:a05:651c:11c7:b0:2de:3421:9ef6 with SMTP id
 z7-20020a05651c11c700b002de34219ef6mr744435ljo.33.1714105828799; Thu, 25 Apr
 2024 21:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MoWDqANoCnEUbZ1s+rbH=KMttjX+xobRze3EM-PLZMfSFHfg@mail.gmail.com>
 <20240426035444.abkx3xo2mghlkurj@zkempczy-mobl2>
In-Reply-To: <20240426035444.abkx3xo2mghlkurj@zkempczy-mobl2>
From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Fri, 26 Apr 2024 06:30:15 +0200
Message-ID: <CA+MoWDq6SSC4pXOWdu268qg0+P5w2+2ssLWbXZ_Vs_eyuveQ0A@mail.gmail.com>
Subject: Re: tests/intel/gem_exec_capture: changing the test size breaks the
 run
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000087dd90616f85da5"
X-Mailman-Approved-At: Fri, 26 Apr 2024 09:41:15 +0000
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

--000000000000087dd90616f85da5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 5:54=E2=80=AFAM Zbigniew Kempczy=C5=84ski <
zbigniew.kempczynski@intel.com> wrote:

> On Thu, Apr 11, 2024 at 09:41:11PM +0200, Peter Senna Tschudin wrote:
> > Dear list,
> >
> > After my change*, most of the subtests from gem_exec_capture work, but
> > only if called one by one using --run-subtest. Here is an example:
>
> <cut>
>
> Unfortunately this is related to IGTs construction. I mean if one
> subtest will allocate the memory and due some reason it won't free it
> then next subtest doesn't start from scratch, but from some changed
> state. Subtests which fail mostly left drm fd in some state which
> might affect next subtests. We're using igt_runner to separate subtests
> execution and make sure each runs in own process. I'm not saying subtests
> shouldn't run fluently one by one, but in CI we won't rely on that.
>

Thank you! I had this idea that there was some leftover in memory, but I
failed to find it. I tried Valgrind, but it did not help much...

I created an issue, and I took the liberty to copy your comment there.

The issue is here:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/154

[...]


>
> --
> Zbigniew
>


--=20
                         Peter

--000000000000087dd90616f85da5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Fri, Apr 26, 2024 at 5:54=E2=80=AFAM Zbigniew Kemp=
czy=C5=84ski &lt;<a href=3D"mailto:zbigniew.kempczynski@intel.com">zbigniew=
.kempczynski@intel.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Apr 11, 2024 at 09=
:41:11PM +0200, Peter Senna Tschudin wrote:<br>
&gt; Dear list,<br>
&gt; <br>
&gt; After my change*, most of the subtests from gem_exec_capture work, but=
<br>
&gt; only if called one by one using --run-subtest. Here is an example:<br>
<br>
&lt;cut&gt;<br>
<br>
Unfortunately this is related to IGTs construction. I mean if one<br>
subtest will allocate the memory and due some reason it won&#39;t free it<b=
r>
then next subtest doesn&#39;t start from scratch, but from some changed<br>
state. Subtests which fail mostly left drm fd in some state which<br>
might affect next subtests. We&#39;re using igt_runner to separate subtests=
<br>
execution and make sure each runs in own process. I&#39;m not saying subtes=
ts<br>
shouldn&#39;t run fluently one by one, but in CI we won&#39;t rely on that.=
<br></blockquote><div><br></div><div>Thank you! I had this idea that there =
was some leftover in memory, but I failed to find it. I tried Valgrind, but=
 it did not help much...</div><div><br></div><div>I created an issue, and I=
 took the liberty to copy your comment there.</div><div><br></div><div>The =
issue is here:=C2=A0<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-t=
ools/-/issues/154">https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issue=
s/154</a></div><div><br></div><div>[...]</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
--<br>
Zbigniew<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0Peter</div></div></div>

--000000000000087dd90616f85da5--
