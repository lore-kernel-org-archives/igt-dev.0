Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF7AC54F54
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 17:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A7110E199;
	Fri, 31 Jul 2026 17:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="CbYkW7R7";
	dkim-atps=neutral
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00D910E199
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 17:19:02 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-51c15bf5000so5006841cf.3
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 10:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785518342; cv=none;
 d=google.com; s=arc-20260327;
 b=WXIXGwvLeHwgTB97uovl7UOAsGyHp4DLZN4E4Gd97A0XbIFZ4eeEkSCzxQrtvsrHw8
 PwKQ+CLRl9fpu/wmddgswbBVPYGCKpzyHIO+CfK9dJd67/oQapBAat4Bg09HVtQ41rXs
 DheIiuvdJ9HbXEkGHPDssJdqQM+Ky6NNLPPq32/RXgLKoGHAUlJ3kFwZBBBsmOXXsuTn
 EuVnKtWdnSn9BZ6LGgCW7Nh5vkLkCbi/Gruc8ioKCJz7DBbt891uhw7LFA25X8O11ZpA
 c7czCMXufQ9HWv/ZrwPhkPuxeNcvchwR5Hb6HjJeMgWkGX7M4UxEjQv+WW0L1gkLuFS3
 45LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=WS4mdp1IWRyOkBdQHk9V5GIe8efE3yqCwstH4uWqbHs=;
 fh=XxB4B6l0ybtYohYzperj4kB+G+amKxwGW2FZyiMTZ0s=;
 b=Lws2/JZbOWWddQKBZjUM94XDGFgC/ZAD9kjqHRNyc9NF/Lxn+9RytfqzyUDjFtQ/jY
 uMW4GTLp6H9cB5sGf44FapDtlxKAlmawwTUjN45G++Zen2eOcv4lDW06SFTniYWMNqN5
 ZAXFM4YXuGHg64R2Q1ReK/Q1x8wWkJbU8lNCGLkjiuQYpoWBV7MwVvqjA8Im6OkwJi7y
 hWNjSmdotZnqKlIYQYHdGCfErqnwFmjKkDlx9f9fPOJSG2XNMSuwdDAp8elouxa4o3x1
 BAalAhNVfwxitbBmIkVpvs8U96r+iEfOGzb2FELfgvtxEvowQ1yba2cEHTVvMXCe5ZRa
 C0HQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1785518342; x=1786123142;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=WS4mdp1IWRyOkBdQHk9V5GIe8efE3yqCwstH4uWqbHs=;
 b=CbYkW7R74tUqQ6DrepRdvR7vr4PpMb1pSqDl6smU3apXMaxxoyx37iX3OOnERy8fJf
 Uq/chymvkD3XhJVWulkyKmqyt5RnRGQLMn7DSVIHi4rhrqa+LGS0kp27GJe4bkHlSZB0
 4zz/V5Z4MCfLV79RLw6IPBgvDyEw6DMHKF3BxJQv+svHfJm9n/NbOrZcV0alUU3+ppoS
 njrE3eU0HG4ym/7HX0DFlW9TAHn9R2h5FAAxWpLYbcids0Se7tOgvDrwvgbAjLveYJtd
 GFbkgFDPGI0rtL+wq/CSuMn6yZUG0zH7WwGtDHtg0l5yZDWxkEvxAgqHnGJOF06hUfRe
 Ihsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785518342; x=1786123142;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=WS4mdp1IWRyOkBdQHk9V5GIe8efE3yqCwstH4uWqbHs=;
 b=lk0DlCNQhaG6EF+0zKWA02dLl6pq/5KV4cY2AHZpcgWsONHcihkZAEgRgV56llKdyv
 aAtVsJDB7Cj/nLPHApPwdJpoAf9bkSS5yFml0lL2aHVLqYOuvWwYU4qlfOV36YXPo4xL
 XZdNSDbHQg6AoZn2OYHoyNsAOPDiVAtGdni22ZjxyV906FWNFOXNaLgFOg0NvUghCxuV
 rHcXh8/0DiVjJ8wSelpO50jVKwVNjUNMIopKKwiFlDE5r+U7pF3HrzeyyLg7FXaCMAa+
 h2hgCZSkEeuRj212VNAvpcFK3NkcAU0pJgvKFApCn6Zz9nOKmCbLTu7GFHxH/fq7vkBl
 NBwA==
X-Gm-Message-State: AOJu0YxXgJ00wVYfIYdx29VuMSjpFugQe2AexKLyjhxZSwkfVlgc8zw0
 CdYYFvAWNJvxllhZm1dQZ5QDn1uQ5TArwuSsUq+McC5b4fhoH6GGVGt8hIQoiDcRx70q68a0MK0
 PUDkHE4++l7tjCO1fPBFwmjjTJArqIbwXyXonvIYv
X-Gm-Gg: AR+sD11kJJfYHA3XuEnlQxB2eZlW4GuzKbqWZae+cvl8aEdTCswkhOaOeCRCz7eZYnz
 VC7Dt1n89Zuk7te9jxQve0GTrh07DDJimIj0B8W73NVNu4aAWdyBlFjj7vZBg5ZeVbH66vosFi9
 b/HZkA2sPHIje7O5A3cOttrzYu3G4/TnBSiiygA7+bDxYMQu+ny5p/0tWxs2h4W2NVYXypgQLJW
 w7YV7FmrqRRBzdfxuvP7adiMN7ISJFW7vMYKWux3qx/cvMVQRLvG+sUELgpl0I2tjNuU4YRyMvC
 pOGSbPJT/y1CaiV7EerUXyzKXzoZTw8jPyfnm6XCkDwW94UJA3TGTBRCl8RE5rTni8dbRzYhy2s
 =
X-Received: by 2002:a05:622a:5c17:b0:51b:ee04:5a4e with SMTP id
 d75a77b69052e-52b567bfe2bmr21063571cf.31.1785518340690; Fri, 31 Jul 2026
 10:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260727142200.3042096-1-markyacoub@google.com>
 <7a8feae5-b874-4e6a-bea6-f01e2b77198c@bootlin.com>
In-Reply-To: <7a8feae5-b874-4e6a-bea6-f01e2b77198c@bootlin.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Fri, 31 Jul 2026 13:18:49 -0400
X-Gm-Features: AUfX_mzQM1fHU9n-R2tBKuqv0nFzXneFL-mcyOAGaDU4bQqZzLsk1Mv1HnzbPbU
Message-ID: <CAC0gqY7tCMM4GMgB=5H7SFk81PZsGXUMRQQ46HCqDGeYAcSb8Q@mail.gmail.com>
Subject: Re: [PATCH] android: glib: add g_key_file_get_boolean stub
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000007172dc0657eb62e7"
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

--0000000000007172dc0657eb62e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied. Thanks!

On Fri, Jul 31, 2026 at 1:14=E2=80=AFPM Louis Chauvet <louis.chauvet@bootli=
n.com>
wrote:

>
>
> On 7/27/26 16:22, Mark Yacoub wrote:
> > This stub function is necessary to allow IGT Unigraf dependencies to
> successfully compile on the Android platform.
> >
> > Suggested-by: Mark Yacoub <markyacoub@google.com>
>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>
> > ---
> >   include/android/glib.h | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/include/android/glib.h b/include/android/glib.h
> > index 0b6658287..aacfcf138 100644
> > --- a/include/android/glib.h
> > +++ b/include/android/glib.h
> > @@ -55,6 +55,9 @@ static inline double g_key_file_get_double(GKeyFile
> *key_file,
> >       const char *group_name, const char *key, GError **error) { return
> 0.0; }
> >   static inline bool g_key_file_load_from_file(GKeyFile *key_file,
> >       const char *file, int flags, GError **error) { return false; }
> > +static inline bool g_key_file_get_boolean(GKeyFile *key_file,
> > +     const char *group_name, const char *key, GError **error) { return
> false; }
> > +
> >
> >   static inline GRegex *g_regex_new(const char *pattern, int
> compile_options,
> >       int match_options, GError **error) { return NULL; }
>
>

--0000000000007172dc0657eb62e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Applied. Thanks!</div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 31, 2026=
 at 1:14=E2=80=AFPM Louis Chauvet &lt;<a href=3D"mailto:louis.chauvet@bootl=
in.com">louis.chauvet@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
<br>
On 7/27/26 16:22, Mark Yacoub wrote:<br>
&gt; This stub function is necessary to allow IGT Unigraf dependencies to s=
uccessfully compile on the Android platform.<br>
&gt; <br>
&gt; Suggested-by: Mark Yacoub &lt;<a href=3D"mailto:markyacoub@google.com"=
 target=3D"_blank">markyacoub@google.com</a>&gt;<br>
<br>
Reviewed-by: Louis Chauvet &lt;<a href=3D"mailto:louis.chauvet@bootlin.com"=
 target=3D"_blank">louis.chauvet@bootlin.com</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0include/android/glib.h | 3 +++<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/include/android/glib.h b/include/android/glib.h<br>
&gt; index 0b6658287..aacfcf138 100644<br>
&gt; --- a/include/android/glib.h<br>
&gt; +++ b/include/android/glib.h<br>
&gt; @@ -55,6 +55,9 @@ static inline double g_key_file_get_double(GKeyFile =
*key_file,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *group_name, const char *key, GEr=
ror **error) { return 0.0; }<br>
&gt;=C2=A0 =C2=A0static inline bool g_key_file_load_from_file(GKeyFile *key=
_file,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *file, int flags, GError **error)=
 { return false; }<br>
&gt; +static inline bool g_key_file_get_boolean(GKeyFile *key_file,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *group_name, const char *key, GError *=
*error) { return false; }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static inline GRegex *g_regex_new(const char *pattern, int=
 compile_options,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int match_options, GError **error) { return =
NULL; }<br>
<br>
</blockquote></div>

--0000000000007172dc0657eb62e7--
