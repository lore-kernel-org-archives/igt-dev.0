Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC06C6FD1F
	for <igt-dev@archiver.kernel.org>; Sat, 23 Mar 2024 16:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2FC10E916;
	Sat, 23 Mar 2024 16:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XMSxP0Hd";
	dkim-atps=neutral
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973D710E916
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Mar 2024 16:23:22 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a46ba938de0so425745266b.3
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Mar 2024 09:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711211000; x=1711815800; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nA/ZkoP7wmH3sL/MHm35EC60jWY2jvdkd0SSdm1cWZ8=;
 b=XMSxP0HdzJWBUlc7Id5eN+LPj/dXAmOHc3164q+420oDt5hi6CfOzt0m6RreuQu7ld
 pnab+aAzgtnMQdE7NMGctlMJfVMl8xeUERPP8tuTYQYmHIdY1T2lwWMPjS5Q3p/y6rPI
 XON6KParomPEhH0Quz9lBIyXAn17spo64SqJXV1OqAP7pKzdfU/u79eqYcTRHtEuhqaZ
 SvMhfys6Ctl2El3u4h0GGbh2Rldh6WMOQTAB138dbo+pxaBuWvJ2iTMb8TugIaYz3Zdj
 870ygZYv2pn7hcIsX2IxibfwysDvEPJWMa3jTio9qfZPNB/yixrzMXDuZvTq9P7eww5A
 dyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711211000; x=1711815800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nA/ZkoP7wmH3sL/MHm35EC60jWY2jvdkd0SSdm1cWZ8=;
 b=Ldu+Khw3697wIAq7OJevSRbLdLmGGuRAFXN2MnClByL5RFk+3VqHx2mDPvjkir2e8r
 kQ+fmKKPvW9AG96hSKEm+Dxoj4SAQ6AcO8w6oWRXFkqLFdHyKIxLRNCxba83LVrF8hQx
 tFpzJtgRp4sM+W0nExev48lnWYCW2XuZtLaTJKxzVeLeIZk1FkO+qQfruil69Sf+HSVx
 2t3flj1JelXf/jSBu5TPD3rEygv3piHbpKsl0Ubw8qokwwTHdbdsGWQlqz3wiJ29cGmo
 h6QSAvA1CadIEm9k746PDm1oHyaa88M2S0d8jxq6UOF/aVKMie6fCvRAJnj7zAZGs2uK
 3W6w==
X-Gm-Message-State: AOJu0YxQv3vwqKs1KzGT+20zeoCIXvweEcSaIIfLhqGSGRi/h3My+V4K
 aOJA3bzjj98Em5xZeLSDbXcLIDP1M/p4hQoE1HaDuB9jyGxDEGABoyVjjPalWO3YfHM7exh17zj
 34zop/eyzp8y/4Dpr5U/0FEFcdT8Lky0D1cg=
X-Google-Smtp-Source: AGHT+IFGXtcbkS1uFT2y0YoLJlxEvj/dG0kleE57q5F5/DccH7G4AgHmFGemvecKyJQYB2sPe1+92Ajj2pg8jn+vqs4=
X-Received: by 2002:a17:907:7214:b0:a47:4efb:b0f5 with SMTP id
 dr20-20020a170907721400b00a474efbb0f5mr40166ejc.67.1711210999960; Sat, 23 Mar
 2024 09:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MoWDrG2MVo5qWApRKqRzpykLZ2WpmYusRkmkUd_49e=57xHQ@mail.gmail.com>
In-Reply-To: <CA+MoWDrG2MVo5qWApRKqRzpykLZ2WpmYusRkmkUd_49e=57xHQ@mail.gmail.com>
From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 23 Mar 2024 17:23:06 +0100
Message-ID: <CA+MoWDrqWX2gM4V8QOKh5QmqUAPc80H48nP_0KUZ-JZMYax8xg@mail.gmail.com>
Subject: Re: Can you help me debug an issue?
To: igt-dev@lists.freedesktop.org
Cc: "Mistat, Tomasz" <tomasz.mistat@intel.com>
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

On Sat, Mar 23, 2024 at 2:05=E2=80=AFPM Peter Senna Tschudin
<peter.senna@gmail.com> wrote:
>
> Dear List,
>
> I found a commit that introduced a regression that broke the tests
> gem_exec_capture@many-4k-incremental and
> gem_exec_capture@many-4k-zero. Reverting 93c5ec210 fixes the issue,
> but it does not tell what the problem is.
>
> The problem is that `e` gets corrupted when `many()` calls the macro
> `find_first_available_engine`, and the corruption happens at the line
> `saved =3D configure_hangs(fd, e, ctx->id);`. By corrupted, I mean that
> the field name gets empty and the field class gets a large number.
>
> After `e` gets corrupted, the call to __captureN() will fail because
> it expects 'e' to be valid. A simple fix is to add `e =3D
> &saved_engine.engine;` before the call to __captureN().
>
> I have been trying to understand why `e` gets corrupted for a few
> hours, and I ran out of ideas. To make the code more gdb-friendly, I
> have unfolded the macro find_first_available_engine, but that did not
> help me find the reason for the `e` corruption. Here is how I have
> unfolded the macros:
>
> -       find_first_available_engine(fd, ctx, e, saved_engine);
> +       ctx =3D intel_ctx_create_all_physical(fd);
> +       igt_assert(ctx);
> +       for (struct intel_engine_data i =3D
> intel_engine_list_for_ctx_cfg(fd, &(ctx)->cfg);
> +            (e =3D intel_get_current_engine(&i));
> +            intel_next_engine(&i)) {
> +               if ((gem_class_can_store_dword(fd, e->class)))
> +                       break;
> +                }
> +       igt_assert(e);
> +       printf("e->name: %s\n", e->name);
> +       saved_engine =3D configure_hangs(fd, e, ctx->id);
> +       printf("e->name: %s\n", e->name);
>
> Reverting 93c5ec210 stops the corruption from happening, and I am
> trying to understand why. Can you help me debug this further?

I believe that the problem is caused by trying to access the contents
of the variable i after the scope of the variable has ended. I believe
that the variable i is limited in scope to the lifetime of the for
loop inside the macro for_each_ctx_cfg_engine().

for_each_ctx_cfg_engine() iterates through elements of a structure
struct intel_engine_data. This structure contains an array of struct
intel_execution_engine2 and a pointer to struct
intel_execution_engine2. The pointer will save the address of one of
the array elements. My take is that due to the block scope of i,
attempting to access elements of the array engines after the loop has
ended is resulting in invalid memory access.

Based on my analysis, the root cause seems to be the attempt to access
contents of i outside the loop's scope. If this theory holds, the
block scope of variable i would invalidate access to engines and i
after the loop. I am considering that reverting 93c5ec210 and having
the issue fixed is a coincidence rather than a solution.

Can you validate this theory and suggest how to fix the problem?


--=20
                         Peter
