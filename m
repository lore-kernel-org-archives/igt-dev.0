Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBD0C5AD5A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 19:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E2310E453;
	Wed, 12 Aug 2026 19:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="SYhay1bg";
	dkim-atps=neutral
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C95A10F121
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 19:28:36 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-38e69bdb0fcso1430808a91.1
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 12:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786562916; cv=none;
 d=google.com; s=arc-20260327;
 b=G4QeX7uKhEfhq+VKpi0cu3H0RCTfNm39G40Lh+nOD9VQaVUgdRqHEhrtU1ZGTFDm9H
 llNgrbX+Y/tVJMTu6CdBDIlqgXdy+vCjeefkQNAU0sSXbdeAkZll1aLcEoYUmlLnXfw7
 NxdePr2PwwxU8/PagU4PBDEAdhWSl7lZifGxujgt7IlXTJAVzGErInHZC8/+nCpr0WyM
 JjRFGOOBC0p8E/wRRFhwofJzlGPALKzBiw9RZA2KzXf2Iha2e8UBPRqLGhlqObJLKLxR
 Tp0aAv6vbhgJAFOEH6Z086avSPN9Rwe0TB4jIeYybNUGAzRybov2dk8XME2sCgnB4nCm
 tdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=yOK/1M3elbc1nhhu/rxdVM1pbmBkSyX8LvWZYzPEO38=;
 fh=Tc952vv6JDoBaNSrZUFpmXX0uVRXdT+vEVq50nB4PoM=;
 b=InLfzbXwjVkJvx7Nwk2Gp/jL8Xr1yK2kUGR1BDN3jxZYeSZ+5fHsMGYPd0rbxUmyTu
 IDFjZLUOrZYhL6wiqN70kwxHCCgAPwRILD/E2+sTf+FEe1t3J3H6oSfNETJ0eexdBtft
 0CsM5p9AlpAp5i8zuJ6d9XfgAwL8/7lbUuw/Q6GzHnx0QYxSbuwgaEROfXNoV+GU82wg
 v866oveB/sluIJ7in2C8D1IIYa/iUUuKS013IKiRxcNK2yWZ5NSCG74cA3T5p4DWqsIh
 REuyoqbxVXBeMgR6sbMJmDUjBDknFq4DS5ZvHgaXKu0GwphvGWIbd97qnXHZJ5AB9/rM
 EIYw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1786562916; x=1787167716;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=yOK/1M3elbc1nhhu/rxdVM1pbmBkSyX8LvWZYzPEO38=;
 b=SYhay1bgq/0cEgxCUPI5oOpLrdV4KIA5AoVwYYS8f1UHMz77z6Igmsu1pRL7TNqB6G
 /kpgxeZdn5CiA4R2U/cnF6JDrhOyYMGyYsTg9QTx3iaSSIQKIU+Wle3j38lcldooT/aY
 Gb36RpIaRnNdd6u+iNA5cEagdWPiTL3LTvnToqHu5EnzO/l00N2w2NUnG4gzOoDm9CS0
 IZ8XPUZAXW+9w8x3oooVuaLa9sf/qr9N2eSxW7dDaKocZjP3SYXykAMhP/dzkEXZ4vEt
 eTm48z+FqnO/QqL3Tgr18h7RD07/SCfuCroJEO/o1r/rkwfgblNDaJDKJwphsRYcVgHf
 Gw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786562916; x=1787167716;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=yOK/1M3elbc1nhhu/rxdVM1pbmBkSyX8LvWZYzPEO38=;
 b=rvaTuC3kftxuf9O2paMx3gqC9c0BrdQ1s2b4xi5KWJxWTUbT3vq+5OWaEYKPTV40K6
 9B4z28nsJF7PjjrIAZng2xzjxnA7+7FJM3sQhcT3vKTzrFs/N0ljwoRgk99kx7zBZkGS
 tLw6S/WSdmlr8x2tTMmDDCxikVxlfL2KIAONUeITJetESTEIoEC1e67oVYK5oQefgntr
 YfYFspNJ78srtFGsLD/XbQ1RbQaIsG9dxM35QNzK/1KjE8P69ugOaRt2xX7RH5vv2ZSC
 4xDbx7gu4FLzbKyX8BxrdxWGemDZC0yt6YuUGcOgXBUGTJSnxg4f//hn7TCc1MPtLPLv
 aaRg==
X-Gm-Message-State: AOJu0Yx05SRRp35pWFnjkHvVPELV5zJ5cKk1QFj6yZKuvzXyzUCV3T79
 hORfusQDlY7sIBCejmFZBinNq+f58MLlFWyBcLsyOYFpkVD7H+kOlNkP6nZwiM+NpHP+TPLZlt6
 yD9kSGJU6+DPUHTQNm2povPU9bT8cFfC71lkg18V9
X-Gm-Gg: AR+sD12VerJfArITCUAqXjDU9BFywqJh8CZx/+NjXwMj9QAypNWUW9Hytv0p5x5OULN
 HfFqMnTcW5HSL+JVwv4ejQWA5Zr+aw1MxPcogtMgqUPxWb3UTDmrFSCX+Vhopcg378mKcX+oowy
 pQxQUhMhrpot6kEOFLP8DdvNEmMH3JjaQycs7/v9g+w640ASw4ES9Zoe/4NlcR5oTkpOy2xtCGO
 +fbCu0S0IV4hLaPpBvWu7dvZuv4wUPqnCeDx9mQBjjSwvKEJRezRZ1wWCTUIxM+/wf04AfO0UfX
 DbfPLOSj/k2AuaCHW/yxauZd+sgbsbxfkMUZoG1TFTaMw8k/JZadl4DKHVaDXgCLmD0qdjCkDLY
 1HyiZ6Omv2/x94fD9LWe/vjby2FPSLQyJw80im1wLVfQ=
X-Received: by 2002:a17:90b:1d44:b0:37c:607b:2cd9 with SMTP id
 98e67ed59e1d1-3931de20696mr726619a91.0.1786562915542; Wed, 12 Aug 2026
 12:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260811161417.716771-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260811161417.716771-1-jason-jh.lin@mediatek.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 12 Aug 2026 12:28:24 -0700
X-Gm-Features: AUfX_myVDcPpKJHg_E7j1GbtV8GmW9CLSgKXlROBGHEpeTKjh1pOyxNDuL9bXuI
Message-ID: <CAMNLLoSv09Owc1AKjnPWxdfH8mwDyKhqR54nA6E5v71Z8z4FKA@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_plane: Remove redundant CRC frame
 sequence check
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ville Syrjala <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>, 
 Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Lancelot Wu <Lancelot.Wu@mediatek.com>, Gil Dekel <gildekel@google.com>, 
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: multipart/alternative; boundary="000000000000f402e90658de971f"
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

--000000000000f402e90658de971f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks @Jason-JH Lin <jason-jh.lin@mediatek.com>  for the patch.

@Karthik B S <karthik.b.s@intel.com>  this addresses your review comments,
could you PTAL and help get this landed?

Regards
Manasi

On Tue, Aug 11, 2026 at 9:14=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediatek=
.com>
wrote:

> The capture_crc() function validated that the CRC frame sequence
> returned by igt_pipe_crc_get_for_frame() matches the expected value.
> However, igt_pipe_crc_get_for_frame() already guarantees
> crc->frame >=3D expected via its internal loop:
>
>     do {
>         read_one_crc(pipe_crc, crc);
>     } while (igt_vblank_before(crc->frame, vblank));
>
> The additional check in capture_crc() is therefore redundant.
> Remove it and rely on the library's existing guarantee.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_plane.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 12dfbfe1d82b..fe8ee2ab26ab 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -765,11 +765,6 @@ static int num_unique_crcs(const igt_crc_t crc[], in=
t
> num_crc)
>  static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *cr=
c)
>  {
>         igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank,
> crc);
> -
> -       igt_fail_on_f(!igt_skip_crc_compare && !igt_run_in_simulation() &=
&
> -                     crc->has_valid_frame && crc->frame !=3D vblank,
> -                     "Got CRC for the wrong frame (got %u, expected %u).
> CRC buffer overflow?\n",
> -                     crc->frame, vblank);
>  }
>
>  static void capture_format_crcs_single(data_t *data, igt_crtc_t *crtc,
> --
> 2.43.0
>
>

--000000000000f402e90658de971f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyCh=
ip-0" href=3D"mailto:jason-jh.lin@mediatek.com" tabindex=3D"-1">@Jason-JH L=
in</a>=C2=A0 for the patch.<div><br></div><div><a class=3D"gmail_plusreply"=
 id=3D"plusReplyChip-1" href=3D"mailto:karthik.b.s@intel.com" tabindex=3D"-=
1">@Karthik B S</a>=C2=A0 this=C2=A0addresses your review comments, could y=
ou PTAL and help get this landed?<br></div><div><br></div><div>Regards</div=
><div>Manasi</div></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 11, 2026 at 9:14=E2=80=
=AFAM Jason-JH Lin &lt;<a href=3D"mailto:jason-jh.lin@mediatek.com">jason-j=
h.lin@mediatek.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">The capture_crc() function validated that the CRC frame s=
equence<br>
returned by igt_pipe_crc_get_for_frame() matches the expected value.<br>
However, igt_pipe_crc_get_for_frame() already guarantees<br>
crc-&gt;frame &gt;=3D expected via its internal loop:<br>
<br>
=C2=A0 =C2=A0 do {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 read_one_crc(pipe_crc, crc);<br>
=C2=A0 =C2=A0 } while (igt_vblank_before(crc-&gt;frame, vblank));<br>
<br>
The additional check in capture_crc() is therefore redundant.<br>
Remove it and rely on the library&#39;s existing guarantee.<br>
<br>
Signed-off-by: Jason-JH Lin &lt;<a href=3D"mailto:jason-jh.lin@mediatek.com=
" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt;<br>
---<br>
=C2=A0tests/kms_plane.c | 5 -----<br>
=C2=A01 file changed, 5 deletions(-)<br>
<br>
diff --git a/tests/kms_plane.c b/tests/kms_plane.c<br>
index 12dfbfe1d82b..fe8ee2ab26ab 100644<br>
--- a/tests/kms_plane.c<br>
+++ b/tests/kms_plane.c<br>
@@ -765,11 +765,6 @@ static int num_unique_crcs(const igt_crc_t crc[], int =
num_crc)<br>
=C2=A0static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t =
*crc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_pipe_crc_get_for_frame(data-&gt;drm_fd, dat=
a-&gt;pipe_crc, vblank, crc);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fail_on_f(!igt_skip_crc_compare &amp;&amp; =
!igt_run_in_simulation() &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0crc-&gt;has_valid_frame &amp;&amp; crc-&gt;frame !=3D vblank,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;Got CRC for the wrong frame (got %u, expected %u). CRC buffer over=
flow?\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0crc-&gt;frame, vblank);<br>
=C2=A0}<br>
<br>
=C2=A0static void capture_format_crcs_single(data_t *data, igt_crtc_t *crtc=
,<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--000000000000f402e90658de971f--
