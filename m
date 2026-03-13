Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D647D105F7A6
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 13:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B26610EC13;
	Fri, 13 Mar 2026 13:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kuY/p9me";
	dkim-atps=neutral
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8944410EC13
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 13:24:44 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-89a1347051aso22393416d6.2
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 06:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773408283; cv=none;
 d=google.com; s=arc-20240605;
 b=BphGd+zXvaKpHiapdLD/eBfRfD7Q+LxkpKvNphz+ahHBl1NVSukXZuCeqjREofk3xs
 4MvaCB5r2sJrkf3YvTqrLLxmBWQzex49QxcmLWV3X+avCVMHbKy0UJLAWQAqU7u++inI
 2CQGwiv3Dv25Qm/ztrwIW/keGcjfEvNALMplouQwOt0hEnjlZGsRdCVRT2c4LSxyU4rG
 BGVojWghpFQqVTpw08J/61JO29WiZPKlF9Wx+NDQrFB+n63e7n7z7H6K4ZDuAQuaJSOO
 mpgXYQzO2rdO7/HWhtK5ZLM2uQCisagwG9e6Sg8ifr1h4Shw40ybW7AZe7GXdaifGGsh
 hZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=uFJzfzb2OgIQFDpiprAmVUjtMdiCr1NOP9SEAAjNAJo=;
 fh=MChUxLBt6JsSjCxkQI52R8Ye/jkVsVioepUU4YHa56I=;
 b=I+8nXiDC7mEkPk3PJLAOf04bp0ov8n19iMGn1cfniR5VvwX412ygA0UiICAoumsTeU
 vdHnSqsvDmxdlrP2sXGZcYoS1WkYvMHk/5+xe42cUH667yRYZ0uWRkl3nGlg4HXRlRgS
 Gvm5lJApNeganzjOOmiX6IY8EIYH8f6BJAfOlM1kHrymadNxaOCUXww7UfbbV37+ALdt
 BEjVvXwmn1B4zzDis1TSbto94X2vskoXXvnQ4a4R90T3CxTCYPwi3Ijyad9orWAcVY5m
 FKTFawsH5qD78TxW0EnQiz8VvurumqHAaOxham01zsTUzTF8WkiE31JBoV+fXFHdnMKY
 jfTQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773408283; x=1774013083;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uFJzfzb2OgIQFDpiprAmVUjtMdiCr1NOP9SEAAjNAJo=;
 b=kuY/p9me7h0Vl4fnUqBe1YfYQ8pEW0+pCTxA3F6u0P4EVEokNa7Qa9H10eolvr/24y
 i06Xed5+j23iGOCUuDPxbva0Wc+/laJB1xHMePGALfA9QXc2ic+VND4mVz8S4Siamili
 h0eb+EMqhn4C6JadOoVQRPayI6wcfUD0MDkW7Wj8g1CAwylBWv6ltDRbuCPkr/chBSXh
 DLTCj05thMr19jv6MK266EwZm27KyZ/JETk5TzlelG88RrUoFNcCOflAIDdTXOFbEYTS
 AkEK1Gnt1H1YWECn66M8fQLmI+gDND8BBKUaoM6cpCi9WaK792ATSmRJpeuDq7w/xTG0
 mrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773408283; x=1774013083;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uFJzfzb2OgIQFDpiprAmVUjtMdiCr1NOP9SEAAjNAJo=;
 b=HMATu+c0Qd0ctRwHz5RsofPXc+4cyZCVshoRQnOmr6bj2OSIFl5DazGB2NkHOKX1vh
 DfoyqMuN5ZLtzEWXst+0ImFxe7QXdNrXqzHlj+sYcXQCIIGUq+aAWEoqeCyueMm94f1q
 MVmQAi9f+2TYFXd99+/VWiXrVJSChmn20C7WyEUGHOGBeDtiTPLnqQwElot7w0C83b9q
 wE5XpQuYbKCJepr9ULu3nXO1O1JXr4knsurdMFMTlL48JcgkAsI3r9cB/NdcGbm2Wz1v
 svkhzuWN+Tv7l/toBTCgSaHBZQJRKBTpcI08AITVjfnsl8xqZA0r6hXVu5rq6TT2EPsk
 8PFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv6DIB1BdGGoTFqqaH/HbUbzau4i8f+q1dPUwFig8UsctRb2sY95/2b1e5C1yn8Cc/1A5rG2JW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZD5e93rv2uY53vOYrfIM0E4a9KmvkcwjYprEh6FYrpai0Vsvi
 UBHlne88rUD2xFqTr+Ce9ep0goyaIf+38CYBBKrpwHPdbR6f2Ki914dnBeadcL/V3YSOWNneiw/
 TaKgGTYpyyKzGUBihcsWHkX1aF6NpnRSwL05wCoH2
X-Gm-Gg: ATEYQzx3KPV7LiXg5HsA5PZ9/uylHqanFK375YkXf9A1eHQKwdOp0EkESSrEvhnOsvR
 2w1pXlUZEw6Pa7BxroeU6QKeurzruRxTwmTn39TD85Gy4F0GuEa2SKgZpzK2HX/OgAfjCsuuyCF
 HkqHV3PxuUQ4eCS11+0CjI1mJFkwAc0GI4+narFhQop/HnRK9fvRcSFaVnBpRqVmZxeMB029niN
 N8BqQf8nwG7FJYGarImGICquheMvR3HQfRIgH+JgJj8+Ct/Nm/10dtj+OKUSa8gEq+sxR092TA+
 KbCNAdJW0I2trXN84RHGqt0VpZGinkZEMtRvfQ==
X-Received: by 2002:ad4:5743:0:b0:89a:629:2203 with SMTP id
 6a1803df08f44-89a81d44b05mr50840376d6.11.1773408280374; Fri, 13 Mar 2026
 06:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260312141541.2333628-1-jason-jh.lin@mediatek.com>
 <CAC=S1njbrk172CFZGqzUj1KRLg8PWqmhVVTNAvBHC=BzQbMRKw@mail.gmail.com>
In-Reply-To: <CAC=S1njbrk172CFZGqzUj1KRLg8PWqmhVVTNAvBHC=BzQbMRKw@mail.gmail.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Fri, 13 Mar 2026 09:24:28 -0400
X-Gm-Features: AaiRm53isWJCkqtHbPt2Y3fbDmzxrDUZutFWZ22NGdWjJwcKbNrUN8B9BDDzatY
Message-ID: <CAC0gqY5puCRsE0_8eYwRbXX3yTM6iD4kYjEXNeT-h5g3V_Gn0w@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_plane: Add vblank waits for MediaTek
 CRC timing
To: Fei Shao <fshao@chromium.org>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org, 
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, 
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: multipart/alternative; boundary="0000000000009992cd064ce7caa3"
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

--0000000000009992cd064ce7caa3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines/1623315

On Thu, Mar 12, 2026 at 10:45=E2=80=AFPM Fei Shao <fshao@chromium.org> wrot=
e:

> On Thu, Mar 12, 2026 at 10:15=E2=80=AFPM Jason-JH Lin <jason-jh.lin@media=
tek.com>
> wrote:
> >
> > On MediaTek hardware, CRC generation requires additional time to
> > stabilize after certain operations. This patch adds targeted vblank
> > waits for two specific scenarios:
> >
> > 1. Pixel format changes: After a format change in
> >    capture_format_crcs_single(), the CRC hardware needs at least one
> >    vblank to generate valid CRC values for the new format. Without
> >    this wait, tests may read stale or transitional CRC values.
> >
> > 2. Cursor plane updates: In test_plane_position_with_output(), cursor
> >    plane updates are non-blocking on MediaTek hardware. A vblank wait
> >    ensures the CRC reflects the updated plane configuration.
> >
> > These waits are guarded by is_mtk_device() checks to avoid affecting
> > other platforms.
> >
> > Fixes failures in:
> > - pixel-format: CRC mismatch due to reading before format stabilization
> > - plane-position-hole: pipe-A-plane-3 failures with cursor plane
> >
> > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> > ---
> >  tests/kms_plane.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
>
> Reviewed-by: Fei Shao <fshao@chromium.org>
>

--0000000000009992cd064ce7caa3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Applied:=C2=A0<a href=3D"https://gitlab.freedesktop.org/dr=
m/igt-gpu-tools/-/pipelines/1623315">https://gitlab.freedesktop.org/drm/igt=
-gpu-tools/-/pipelines/1623315</a></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 12, 202=
6 at 10:45=E2=80=AFPM Fei Shao &lt;<a href=3D"mailto:fshao@chromium.org">fs=
hao@chromium.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Thu, Mar 12, 2026 at 10:15=E2=80=AFPM Jason-JH Lin &lt;<=
a href=3D"mailto:jason-jh.lin@mediatek.com" target=3D"_blank">jason-jh.lin@=
mediatek.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On MediaTek hardware, CRC generation requires additional time to<br>
&gt; stabilize after certain operations. This patch adds targeted vblank<br=
>
&gt; waits for two specific scenarios:<br>
&gt;<br>
&gt; 1. Pixel format changes: After a format change in<br>
&gt;=C2=A0 =C2=A0 capture_format_crcs_single(), the CRC hardware needs at l=
east one<br>
&gt;=C2=A0 =C2=A0 vblank to generate valid CRC values for the new format. W=
ithout<br>
&gt;=C2=A0 =C2=A0 this wait, tests may read stale or transitional CRC value=
s.<br>
&gt;<br>
&gt; 2. Cursor plane updates: In test_plane_position_with_output(), cursor<=
br>
&gt;=C2=A0 =C2=A0 plane updates are non-blocking on MediaTek hardware. A vb=
lank wait<br>
&gt;=C2=A0 =C2=A0 ensures the CRC reflects the updated plane configuration.=
<br>
&gt;<br>
&gt; These waits are guarded by is_mtk_device() checks to avoid affecting<b=
r>
&gt; other platforms.<br>
&gt;<br>
&gt; Fixes failures in:<br>
&gt; - pixel-format: CRC mismatch due to reading before format stabilizatio=
n<br>
&gt; - plane-position-hole: pipe-A-plane-3 failures with cursor plane<br>
&gt;<br>
&gt; Signed-off-by: Jason-JH Lin &lt;<a href=3D"mailto:jason-jh.lin@mediate=
k.com" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/kms_plane.c | 16 ++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 16 insertions(+)<br>
<br>
Reviewed-by: Fei Shao &lt;<a href=3D"mailto:fshao@chromium.org" target=3D"_=
blank">fshao@chromium.org</a>&gt;<br>
</blockquote></div>

--0000000000009992cd064ce7caa3--
