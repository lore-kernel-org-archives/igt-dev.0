Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DF9C43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 22:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2643C10F315;
	Wed,  8 Jul 2026 22:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dfn2/R0v";
	dkim-atps=neutral
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BC810F31D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 22:34:30 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-ca2fad0ae38so824596a12.3
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Jul 2026 15:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783550070; cv=none;
 d=google.com; s=arc-20260327;
 b=fFwyb5fPPRnuGewyd5+I0mn+emTURFCOxvKYwto6WchWq4j+L1eEQPuggW2RMfCGCe
 KdZlSLbLjTycgvV2578eg5UIfs5sjLHWzCUuQmdigG88FhIzBLFZlVczJhdvCL8XrEwM
 +wmRtEzFRoSNLlUNmv6yKHIsyLSiOAhiR1wUN3FfYCoEEdx3B4vfz1hjFxa9gq+SPSbI
 TMZonOUWPsUeYywdBG3IPjoZ1TcAyygJxVkAUnfIy5wZCHNB9FPFyyYeLqN0y5LBsCpI
 jOONiyQKMwEcBZQ6sHCP+at7KMSoORHFsLnQpLIPRmmQfSk1Ip0eHNOXWYZvA2BPxWJF
 xjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cO9gd889F4E1Q0d/fUyIMFYnlq7fxncAIP7Bcy/Mkjk=;
 fh=NxzZrFImrbc8UIJMbijvN4Il6WdzYshcTVl2oLqC2gs=;
 b=fQAba17la/KQlcTWWiDOZgQZ6uvNfmB3w7b8pYG3yVNVTdqZKCMi948u2+/u3NAKPF
 pKT464hBA5xPQBfff6SObUjseLgJhVbdvPIRgnhb52l4bcz2YfvNk2bRMyphZiRkLZsz
 2h14mW03MZr5k2t3jThsu3fdkjjvHDlDY14EXva0iypRZJLH1txFFNBvp2k1WITAd7xe
 aL2eGmN0efiPLpndVeVyfJzMtrwmCyp5/65/k0EZZOuqXZQ51Gcp4b5shrklRJQEorEH
 5/4N//LKHgI2EaFmJHvwn0BpwbwFjcV44fKJqNvM5XEZ/htfGeG4i2rTUK3ngz8wMDtd
 b44A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1783550070; x=1784154870;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cO9gd889F4E1Q0d/fUyIMFYnlq7fxncAIP7Bcy/Mkjk=;
 b=dfn2/R0vvjUlS+nOvsjX26kucwVegfGaNBDlRtqaL5mD2t9aewQOI1EbAYLHtArEFU
 o5LbbebcG9gwseZwOPhoYgM6JjcjUnpzHQ6rk7ZXZCIK3i08HE4kaONptWcnHAkN87Am
 LaTbsn+JrE05SYSfbIC6WXYIvFRTuIukaU365nfSgi9hQK0H18PX5SRdWQpuQOxM05It
 SsFcSb89TnwqOYeaU9Qbi8gyEPZVP5h/Z7ebcJ4w30IExzgv1357DqrU1C5Rkg6baKMp
 ph1+fFFfDW/Z8AKMJULQkMgIMw7iTi8A4bZs2GthWwlyOgNnuKXK9qApCW0Wvb0k8TGv
 2kxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783550070; x=1784154870;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=cO9gd889F4E1Q0d/fUyIMFYnlq7fxncAIP7Bcy/Mkjk=;
 b=RfI82jlHPylCf7M7edQ4bPEYTl0QgbX4s7OFY097lRZ0Mbz85r+PaYCuSKPNSYmH8Y
 vS3WPTJjyCrgFSq1H6pMXlUhYbsrYnlLzlLr8dTr2Z6YdCDarxvkzDVOic+yfYBLU5jf
 TWcrvGLUU3zDcc2Ohr9jlfP5VqXutF8JwVDKXga+FJbelZGU6AQRnjLXiTjbrsd2pMNH
 PJKZMfkjbaDm4uaziX1AAqILYomognDR9W07JzT9tWB9ockoyItfeNHAMi/Fzt5yg+hV
 gjEPQJ6ndzjZ7gem6HVSJqrMd2avRHmHoYMVh3iI9mpNOpwfOq8VCIrzkJedQ5e7OpZm
 cHqA==
X-Gm-Message-State: AOJu0Yzr+tormysyvAz76N/IjU2GhOMrfl84Pwuc4WFA/4XcxEPk8Ty7
 4rTb8zb62W5NWH+udTLG/VLJO+8uRxHxJRxygBPz9dHIcB/lVUs11YJsIbUAW7RVA9pELisk1uk
 FD6WmLArggFJoqdJSZctMR2iQePnWyITIVjsvIWuc
X-Gm-Gg: AfdE7cmA4JwaYnut+DTGnODCnMnbZDWYSb+xB1GbTMtDh5Ov+8QkZJH6mcZ9hdH3+K8
 BAC4gOZhxo4Xf98Ic4wP0953UAnNC51ABxS7/+sCXOgfoV4oPVF2VQMQl3daLnWnlEaOoBRfUhA
 TDw3v9npAxkEZmWhtnQYm+deqjXznvF7mjLVxjx+hCrUvJhGT2ibljHSDMndl+WJfasHXTExd9e
 WUpaLPyolCOKskYxTw0wNpVcFsmXpoFA+dcNmxiTlVyG1RdQ4CWnF6G4LkhXAWyAosMkq9KE8dS
 Hrj9HCcmyBr1Xmx3WQHDZ58AYtDqo67E+9rNRXRkQZM2sX3fehGKlgYlMgLZ/tQCVI65kH4=
X-Received: by 2002:a05:6a21:4a89:b0:3b4:7b2a:6a0a with SMTP id
 adf61e73a8af0-3c0bd206afdmr5452536637.35.1783550069691; Wed, 08 Jul 2026
 15:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260629015411.32130-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260629015411.32130-1-jason-jh.lin@mediatek.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 8 Jul 2026 15:34:18 -0700
X-Gm-Features: AVVi8CdluxoUaQ1vVh34twusk_j7iLAWSR0qn3ABR7pMXKmjOdF7CIHw85kUzF0
Message-ID: <CAMNLLoSXEVuLL80G_XtX+Fcja0ijX7Pq-jNbnUcO-f5OpyKCwg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: Skip MST outputs in
 SST-style tests
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, 
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ville Syrjala <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>, 
 Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Lancelot Wu <Lancelot.Wu@mediatek.com>, Gil Dekel <gildekel@google.com>, 
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: multipart/alternative; boundary="00000000000058fa600656211c47"
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

--00000000000058fa600656211c47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This makes sense to me,

Reviewed-by: Manasi Navare <navaremanasi@google.com>

@Karthik B S <karthik.b.s@intel.com>  @Swati Sharma
<swati2.sharma@intel.com>  @Kurmi, Suresh Kumar
<suresh.kumar.kurmi@intel.com> : Could we please get feedback from Intel
here to get this landed?

Regards
Manasi

On Sun, Jun 28, 2026 at 6:54=E2=80=AFPM Jason-JH Lin <jason-jh.lin@mediatek=
.com>
wrote:

> MST (Multi-Stream Transport) outputs require topology-wide HDCP
> authentication which is handled by dedicated dp-mst-* subtests.
> Running SST-style tests on MST outputs can cause issues because:
>
> 1. MST HDCP authentication involves the entire topology (hub + monitors)
> 2. Per-connector HDCP state management differs from SST
> 3. The dp-mst-lic-type-0/1 subtests are specifically designed to test
>    MST HDCP scenarios
>
> Skip MST outputs in get_hdcp_outputs() when running non-MST subtests
> to ensure proper test isolation.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_content_protection.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tests/kms_content_protection.c
> b/tests/kms_content_protection.c
> index d931ce7682be..9d1728ed82a6 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -751,6 +751,11 @@ static int get_hdcp_outputs(igt_display_t *display,
> int content_type,
>                         continue;
>                 }
>
> +               if (igt_get_dp_mst_connector_id(output) >=3D 0) {
> +                       igt_info("Skipping HDCP test on %s, MST output
> should use dp-mst-* tests\n",
> +                                output->name);
> +                       continue;
> +               }
>
>                 if (count < MAX_HDCP_OUTPUTS)
>                         hdcp_outputs[count++] =3D output;
> --
> 2.43.0
>
>

--00000000000058fa600656211c47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This makes sense to me,=C2=A0<div><br></div><div>Reviewed-=
by: Manasi Navare &lt;<a href=3D"mailto:navaremanasi@google.com">navaremana=
si@google.com</a>&gt;</div><div><br></div><div><a class=3D"gmail_plusreply"=
 id=3D"plusReplyChip-7" href=3D"mailto:karthik.b.s@intel.com" tabindex=3D"-=
1">@Karthik B S</a>=C2=A0=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReply=
Chip-8" href=3D"mailto:swati2.sharma@intel.com" tabindex=3D"-1">@Swati Shar=
ma</a>=C2=A0=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-9" href=
=3D"mailto:suresh.kumar.kurmi@intel.com" tabindex=3D"-1">@Kurmi, Suresh Kum=
ar</a>=C2=A0: Could we please get feedback from Intel here to get this land=
ed?<br></div><div><br></div><div>Regards</div><div>Manasi</div></div><br><d=
iv class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Sun, Jun 28, 2026 at 6:54=E2=80=AFPM Jason-JH Lin &lt;<a href=
=3D"mailto:jason-jh.lin@mediatek.com">jason-jh.lin@mediatek.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">MST (Multi-S=
tream Transport) outputs require topology-wide HDCP<br>
authentication which is handled by dedicated dp-mst-* subtests.<br>
Running SST-style tests on MST outputs can cause issues because:<br>
<br>
1. MST HDCP authentication involves the entire topology (hub + monitors)<br=
>
2. Per-connector HDCP state management differs from SST<br>
3. The dp-mst-lic-type-0/1 subtests are specifically designed to test<br>
=C2=A0 =C2=A0MST HDCP scenarios<br>
<br>
Skip MST outputs in get_hdcp_outputs() when running non-MST subtests<br>
to ensure proper test isolation.<br>
<br>
Signed-off-by: Jason-JH Lin &lt;<a href=3D"mailto:jason-jh.lin@mediatek.com=
" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt;<br>
---<br>
=C2=A0tests/kms_content_protection.c | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.=
c<br>
index d931ce7682be..9d1728ed82a6 100644<br>
--- a/tests/kms_content_protection.c<br>
+++ b/tests/kms_content_protection.c<br>
@@ -751,6 +751,11 @@ static int get_hdcp_outputs(igt_display_t *display, in=
t content_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (igt_get_dp_mst_=
connector_id(output) &gt;=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0igt_info(&quot;Skipping HDCP test on %s, MST output should use dp=
-mst-* tests\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output-&gt;name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (count &lt; MAX_=
HDCP_OUTPUTS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 hdcp_outputs[count++] =3D output;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--00000000000058fa600656211c47--
