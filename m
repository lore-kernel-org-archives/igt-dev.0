Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11A2CDB471
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 16:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FADA10E187;
	Tue, 23 Jun 2026 16:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jFJwJPpo";
	dkim-atps=neutral
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1FC10E187
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 16:23:02 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-30c03b09e02so10847673eec.1
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 09:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782231781; cv=none;
 d=google.com; s=arc-20240605;
 b=dCnRMPynOX6F7OlYA8BpKVBkY9xUsG2IoHGz0srVQ9HakljHRQDvLK1PH5KgD9u2Kt
 L2iW0rB6V3mcqHJHV5iWPECrHZJ2OAad8aa12EYpAb87t2yr7udn8SmJ0JqXf6nibGkx
 r3CPjLocxIYWuUmwERBmKaONwT+AwbL261oUqxJuUdgITKUJnQh3fXswzFH4LqxigwFq
 oX9naildKB5tpjfFEnWrjaiMm+gQlthgxrS4vJ7lfWGnwD0Ixq6rJX4BZvSFqdfY472G
 7SqNHRIhckxWuaEEDjmiwsz2UbFOFBJ4fraLcjjM7vkXre/HdDhCCDKUcjoFmKXcJz0T
 4pCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=uDevQVxwpDtvUIdyMQ768/7z4qhNcYfSPvlx1nruiBo=;
 fh=AhhIrwD5L2oRjjNZsoI/n2AXgAxTDl3uEwb3VojYWuM=;
 b=XFUmpX1ZdJSTnczecSX15zqw79wdHnInpfj7WnyicW8fsH9UPaQ97U7UU/kzbymW9J
 dEiT9/ZUoEFkoC11UTWUdSDZD/VYJaPVV1awFEoZ+mAbaGh4xVVSYxhjbZx8Ih7bfXQp
 HakrbJ/0e+mOHyhQqLcFFY31YmmOTF8Zm1Ufrtki4HH3KtBzTyGh/Mjd5gENbNC4WlCN
 XWrn9FkrsOOOcbYq7r87QK+IEyec1bwjFv/IZX/WOcYJ8A3MV5Nsa6SqihkK4Jlsaywy
 Ts3shAmgna/BYEooMGPzulICuZTuhF7pFisdPvn3TIKAxkufqm39ZIh7QNrcZNoZu10e
 OyVw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1782231781; x=1782836581;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uDevQVxwpDtvUIdyMQ768/7z4qhNcYfSPvlx1nruiBo=;
 b=jFJwJPpojG5SSZJSAlEaYOJxlxYGay+IuzYu+F2JNZHREmscR0lGQJ/0kX1ikVxd3J
 QwGFmYlyCn7CQ/NTKLbd3f/cgVuLd0mOsirG1eQg9S5BLcFwaSuhX3UJyBqkEwyceC77
 5bEI4TG7/39LgvjpkPwzIfOX9jmnE6ilYS0WeZbCHFZcBPgQ12ZWcxyGbFG/UrDL4dch
 +EgB66SGXkFd3HOdEJvYmXtCvDwJCir+0K3lDKzD36tIM9yl7dyfGJkcQAgpbL2ZRjBo
 aO5AwPFwlY4hzDDX5wHEUx5ftpAo2LJYlIykgkoU81U1iV2RtpRHfpKq6UzphYW1Er+N
 PprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782231781; x=1782836581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uDevQVxwpDtvUIdyMQ768/7z4qhNcYfSPvlx1nruiBo=;
 b=sBwSYYHWuK5epgQv0pRZPca6LT7udJUaqzNF4EnBW2Ok/abum0v/9GAu1gYH5rCY9I
 sqcrEA9XwVniJ+biuleXyn69nwGBVqsGC8JavIQTzEbNNc14BnVxoHtU+E7ofM5/oZDc
 vsOabnWw28BZ6LT84U5jefYathx0PgyksLGEsfTpfOdDZtZ6rG7JXCVb3RgsoI+3Rxzs
 FYibS3jMj7x1hSt0r+LbOwxSXXIKOYMtiiByy3dj3ofUUGoKhf+suLLL1PfRujXAfm5+
 SiZUOXzOlq1wFc9u4z80NKky4tUHg+5TAxpq7KL+MNBV687zATDmcxTHA2aQ9AEzEmxE
 q3/A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpRTjgDSnrQ8RJ2JhWZ/Aku8Q80gNYwdZdcBQuS2tGnvFAeFsB3uzeZUy6JDmoqf3C/D1NUH82U@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhXPmYqrvVLn0kL0hRvtX3GOkzjJefE4x50spaBU7Zi/7W5tLY
 aPUSv0D8FcwnJtpnqCyw6sa1CHagj9nkyg68av+NO/2iyK0rzp0hJYomMKr0HnbrHsBupHTdqez
 qeAf4obK1bAj4rHbR9qAJFktcgQkTcCS2QT+FhYGx
X-Gm-Gg: AfdE7cmOoh3QBSMK6bq/4WcvRjMN26zBeDlREuobI3brpMCPV6gCEAKxFM6QJSgkSl2
 N/yr6RMadCArMCCL+UOTOd6vYljMw8mk0iGzFK3CcGPqrUDS+GGhA2NxWt/7H8JJdechHkhcFTW
 elKglJEbAM+KsCeJRRgFXPzf+TNJM01C3VXG/XGQta8SLhauB6H1mQ9xu2cXEZiKUiRvxbHdxvh
 9TRRxNAHA4UNuG1j+YOLztbtlz5qpqeoAUA7zJJ7ER6TS/qk5M7QOzzyTXPO/u62gEvTg==
X-Received: by 2002:a05:7300:3213:b0:304:8366:9fb6 with SMTP id
 5a478bee46e88-30c589f2bf7mr2817005eec.2.1782231780641; Tue, 23 Jun 2026
 09:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260615174422.212996-1-kamil.konieczny@linux.intel.com>
 <bymznjea4aboe5gu2irek3kaqt7ae66zphpwldmvtfn7ey7asg@nhnz3efzfnib>
In-Reply-To: <bymznjea4aboe5gu2irek3kaqt7ae66zphpwldmvtfn7ey7asg@nhnz3efzfnib>
From: enh <enh@google.com>
Date: Tue, 23 Jun 2026 12:22:48 -0400
X-Gm-Features: AVVi8CeIY4MMJ4nkWGR_1QRX64ahmZ5DJh8GjxHp5avxjtMLz60YKwx3co7tQZA
Message-ID: <CAJgzZopwpuWQyEWxC-3NDJhqZiOwZ_2BPvv_yoDHjXQu=pdXow@mail.gmail.com>
Subject: Re: [PATCH i-g-t v1] include/linux_scaffold: drop _AC macro
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

sorry, was ooo last week, but this lgtm and has fixed our builds.
thanks everyone!

On Tue, Jun 16, 2026 at 5:36=E2=80=AFAM Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> On Mon, Jun 15, 2026 at 07:44:22PM +0200, Kamil Konieczny wrote:
> > The macro _AC is causing a compilation error on current android
> > using linux 7.0 uapi headers on RISCV. It seems the macro is not
> > really needed as it is encoding only two constants, 0UL/0ULL and
> > 1UL/1ULL. Drop _AC macro and write out directly these numbers.
> >
> > Cc: enh <enh@google.com>
> > Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  include/linux_scaffold.h | 24 ++++--------------------
> >  1 file changed, 4 insertions(+), 20 deletions(-)
> >
> > diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
> > index 0c970c860..39f68b8d2 100644
> > --- a/include/linux_scaffold.h
> > +++ b/include/linux_scaffold.h
> > @@ -22,30 +22,14 @@ static inline s64 sign_extend64(u64 value, int inde=
x)
> >       return (s64)(value << shift) >> shift;
> >  }
> >
> > -#ifndef _AC
> > -#  define _AC(X, Y)      X##Y
> > -#else
> > -#  error "_AC macro already defined"
> > -#endif
> > -
> >  /* Make IGT build with Kernels < 4.17 */
> > -#ifndef _AC
> > -#  define _AC(X, Y)  __AC(X, Y)
> > -#endif
> > -#ifndef _UL
> > -#  define  _UL(x)            (_AC(x, UL))
> > -#endif
> > -#ifndef _ULL
> > -#  define _ULL(x)            (_AC(x, ULL))
> > -#endif
> > -
> >  #define GENMASK(h, l) \
> > -     (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
> > -     (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
> > +     ((~0UL - (1UL << (l)) + 1) & \
> > +     (~0UL >> (BITS_PER_LONG - 1 - (h))))
> >
> >  #define GENMASK_ULL(h, l) \
> > -     (((~_ULL(0)) - (_ULL(1) << (l)) + 1) & \
> > -     (~_ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
> > +     ((~0ULL - (1ULL << (l)) + 1) & \
> > +     (~0ULL >> (BITS_PER_LONG_LONG - 1 - (h))))
> >
> >  #define BITS_PER_BYTE 8
> >  #define BITS_PER_TYPE(t) (sizeof(t) * BITS_PER_BYTE)
> > --
> > 2.54.0
> >
>
> LGTM,
>
> Reviewed-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
>
> --
> Zbigniew
