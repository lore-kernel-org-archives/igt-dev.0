Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDD9C47DD9
	for <igt-dev@archiver.kernel.org>; Sun, 24 Mar 2024 16:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9939010E11C;
	Sun, 24 Mar 2024 16:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RIrql25x";
	dkim-atps=neutral
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC14C10E11C
 for <igt-dev@lists.freedesktop.org>; Sun, 24 Mar 2024 16:54:38 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a46f0da1b4fso458383066b.2
 for <igt-dev@lists.freedesktop.org>; Sun, 24 Mar 2024 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711299276; x=1711904076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lFPzV3ONb6vvCR3r5IHzyseRhBSKxgWZ1sa+GI0a2r8=;
 b=RIrql25xTTPnmp4xbtWqCdbQUKtttUTcCjV9sOZDMroNYUpfAKSm8kh8xmRCSB6QQt
 nK4Htg0IZSM155lS5aFCoW81aLuzrgFyfk+ftgdAmq4gmtx5uMNd2Qc5r7W6MAsRf20b
 2h+uUMkE7W8bzC9wzNpA9sgozxyXqvFJyIkv/pRd5r8XL7Cy/ejegaxuzSD6sjqYIatr
 cxQQgcTxGzoirJDgcLvZFaBL3SxRU0qz+2vO/FwTsO+ZIaxPD3LeWhTehHGzfclsWFJu
 l4iAS+Ds4kFm6mxfmv+oqQ643fzKYtAHE0k2nllOZW9TdcSTJ1pSGo7/mO0TjLLUW0tq
 Yopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711299276; x=1711904076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lFPzV3ONb6vvCR3r5IHzyseRhBSKxgWZ1sa+GI0a2r8=;
 b=ouZ/rAbn1+pQvisr237MYWDBSFC/JBQpjmqGZ9I43udclQ6lagPE/RZPWVTzPFn5y0
 dQQKYpbolUQOTzeklBoWM4jDrq5PPz1iObgQ6OH0rKpwMUN8VpiopYYSF6qgTahWM4bc
 3G9fDCYC/84kHH1VeEOL/SKRLUupuHfR9p2IZ/igqFRhE5zEheTdhH93/iTc8vPH1HXq
 5H9ixiXw417cXM5+r5O3VEkYr1whgtWbsF74xt0gkP1/H/dfAtUBdtzLUooWaXXAYtLU
 9ipY61JCg1FbOp9BHUh+cESErJmQ+WkwDxaC7f6LIC951I+FAN+x0LK9Is5GRekWBbd7
 WkMw==
X-Gm-Message-State: AOJu0YyOCU4fosxY/trzdJ9gza1iDxoZIlhaztOOYs+lRiNC+bb06nM0
 rJKhkOJ1X1CA7ab+0zCIrfxEQjMzGkk6l+KXtToBscAVoIjxmz89ZpUuXz2otEw3k+uO63t2ABy
 R06bbRkuF6kEk8nWrqkw1DjpRH3d/WVnvEVs=
X-Google-Smtp-Source: AGHT+IHOgA4j1yENQ+mIwZ0q9+EM2QPGbXUHOwjsW0XGTRLj8jLTAqkwgx8qh4mf25MhStjv9qrkoY3E2E4FMA7hCG4=
X-Received: by 2002:a17:906:2a0a:b0:a46:1fa:fc12 with SMTP id
 j10-20020a1709062a0a00b00a4601fafc12mr3236574eje.18.1711299276352; Sun, 24
 Mar 2024 09:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MoWDrG2MVo5qWApRKqRzpykLZ2WpmYusRkmkUd_49e=57xHQ@mail.gmail.com>
 <CA+MoWDrqWX2gM4V8QOKh5QmqUAPc80H48nP_0KUZ-JZMYax8xg@mail.gmail.com>
In-Reply-To: <CA+MoWDrqWX2gM4V8QOKh5QmqUAPc80H48nP_0KUZ-JZMYax8xg@mail.gmail.com>
From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sun, 24 Mar 2024 17:54:24 +0100
Message-ID: <CA+MoWDpGR-NJfuUhjgbTs0gmK8yfhhX_Ngs+jRCHQ0w14AKYvA@mail.gmail.com>
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

On Sat, Mar 23, 2024 at 5:23=E2=80=AFPM Peter Senna Tschudin
<peter.senna@gmail.com> wrote:
>
> On Sat, Mar 23, 2024 at 2:05=E2=80=AFPM Peter Senna Tschudin
> <peter.senna@gmail.com> wrote:
> >
> > Dear List,
> >
> > I found a commit that introduced a regression that broke the tests
> > gem_exec_capture@many-4k-incremental and
> > gem_exec_capture@many-4k-zero. Reverting 93c5ec210 fixes the issue,
> > but it does not tell what the problem is.
> >
> > The problem is that `e` gets corrupted when `many()` calls the macro
> > `find_first_available_engine`, and the corruption happens at the line
> > `saved =3D configure_hangs(fd, e, ctx->id);`. By corrupted, I mean that
> > the field name gets empty and the field class gets a large number.
> >
> > After `e` gets corrupted, the call to __captureN() will fail because
> > it expects 'e' to be valid. A simple fix is to add `e =3D
> > &saved_engine.engine;` before the call to __captureN().
> >
> > I have been trying to understand why `e` gets corrupted for a few
> > hours, and I ran out of ideas. To make the code more gdb-friendly, I
> > have unfolded the macro find_first_available_engine, but that did not
> > help me find the reason for the `e` corruption. Here is how I have
> > unfolded the macros:
> >
> > -       find_first_available_engine(fd, ctx, e, saved_engine);
> > +       ctx =3D intel_ctx_create_all_physical(fd);
> > +       igt_assert(ctx);
> > +       for (struct intel_engine_data i =3D
> > intel_engine_list_for_ctx_cfg(fd, &(ctx)->cfg);
> > +            (e =3D intel_get_current_engine(&i));
> > +            intel_next_engine(&i)) {
> > +               if ((gem_class_can_store_dword(fd, e->class)))
> > +                       break;
> > +                }
> > +       igt_assert(e);
> > +       printf("e->name: %s\n", e->name);
> > +       saved_engine =3D configure_hangs(fd, e, ctx->id);
> > +       printf("e->name: %s\n", e->name);
> >
> > Reverting 93c5ec210 stops the corruption from happening, and I am
> > trying to understand why. Can you help me debug this further?
>
> I believe that the problem is caused by trying to access the contents
> of the variable i after the scope of the variable has ended. I believe
> that the variable i is limited in scope to the lifetime of the for
> loop inside the macro for_each_ctx_cfg_engine().
>
> for_each_ctx_cfg_engine() iterates through elements of a structure
> struct intel_engine_data. This structure contains an array of struct
> intel_execution_engine2 and a pointer to struct
> intel_execution_engine2. The pointer will save the address of one of
> the array elements. My take is that due to the block scope of i,
> attempting to access elements of the array engines after the loop has
> ended is resulting in invalid memory access.
>
> Based on my analysis, the root cause seems to be the attempt to access
> contents of i outside the loop's scope. If this theory holds, the
> block scope of variable i would invalidate access to engines and i
> after the loop. I am considering that reverting 93c5ec210 and having
> the issue fixed is a coincidence rather than a solution.
>
> Can you validate this theory and suggest how to fix the problem?

This is a simple patch that fixes the issue but introduces memory
leaks(by not freeing `e` after use). I tried to craft a proper 'fix'
for the issue, but I did not find a good solution, and I will
appreciate feedback on how you want me to fix it.

-- // --
diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.=
c
index afb576afb..264dd696c 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -189,12 +189,26 @@ static int __query_engine_list(int fd, struct
intel_engine_data *ed)
 struct intel_execution_engine2 *
 intel_get_current_engine(struct intel_engine_data *ed)
 {
+       struct intel_execution_engine2 *ret =3D NULL;
+
        if (ed->n >=3D ed->nengines)
                ed->current_engine =3D NULL;
        else if (!ed->n)
                ed->current_engine =3D &ed->engines[0];

-       return ed->current_engine;
+       // This function is called from the macro for_each_ctx_cfg_engine()
+       // which defines *ed inside a for loop. Not memcping ed->current_en=
gine
+       // will lead to a memory access violation when trying to dereferenc=
e
+       // ed->current_engine after the end of the for loop.
+       if (ed->current_engine) {
+               ret =3D malloc(sizeof(*ret));
+               if (ret)
+                       memcpy(ret, ed->current_engine, sizeof(*ret));
+       }
+
+       // One can always buy more RAM... This patch does not free the memo=
ry
+       // on the call sites...
+       return ret;
 }

 void intel_next_engine(struct intel_engine_data *ed)
-- // --
--=20
                         Peter
