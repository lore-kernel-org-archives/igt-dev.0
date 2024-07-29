Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD29C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 09:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0610410E383;
	Mon, 29 Jul 2024 09:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="RWzUvNJK";
	dkim-atps=neutral
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFFD10E381
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 09:58:49 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-81f96eaa00fso99352839f.1
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722247129; x=1722851929;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7R234FFrrITXoQgwRf63stCYIaOA6Q2eh/vOcgVyefE=;
 b=RWzUvNJKaeUKZod6sGSZGO4sWFN2bry06dpNSAhQjvLoomkZB0fiA/9MXWW/rU8+Te
 hCwjK3b8tPKCsa03PAOPEoEC2LPQHTX9BW/zn3919UoxUzMBXHBhcLx0qigUOH/EEWZ4
 ipUk5/5iuSp1H5hmIjbK2toLMTMUAq3JOEBU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722247129; x=1722851929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7R234FFrrITXoQgwRf63stCYIaOA6Q2eh/vOcgVyefE=;
 b=mQnfC78Zzi8H7lScRALF0wsAq2KBxtNymqvcAnN1LWzSAQEAb/YSTDR7Q8jJ572BZR
 eiONku9bpvt0LyGxPghj/B52rVmytEnf8Viy1CBqzajiSl7RlFgAOOxTaEb8ZDUmCXhW
 4a5CKs3TPKqdGSz5K+/GGSi89cTblKFe6Ri0jxgUZj7RWKvQqRjQ0hbefrzAQmkLDGw8
 WN/PD6jOv7QvbTjgjNYoAO1/dZzkbJAmNYDfd4NEmTY5oNWhWfctieWbGjOAWmr+FGfF
 jQ4sQzzXhO2798sIj3wy0Zlll6KuEY6DKPWiSZHGpl5d5OlL2w9Bjkz2s/iDNT2ONddv
 s5OA==
X-Gm-Message-State: AOJu0YxoGvTSSjg/JIkpvVA4c29U5gbkwmb3LkBkegglNVA1+u3MStC+
 Kv1iD0ox5aF3q9vWKVUUuxyYue9dC0REu0Ro3Hsc1YgNlDyjvVwQvEqb6/geXmlAG/ScamMLri+
 W1lDMddUC6ipKeOm0frYXnTO5xE4LHzlTGMpGaIEm7DclnSs27k1m
X-Google-Smtp-Source: AGHT+IEd0VKK5eqPWM/Wp4JM1AsyIiY9Exwqo0UYf56pJ4nwHk9/mMzPeap2gtvLXtigdcCbvdywNYrnDK5Wm7MkhSs=
X-Received: by 2002:a05:6602:c82:b0:803:85ba:3cf9 with SMTP id
 ca18e2360f4ac-81f95a49db8mr914658639f.10.1722247128757; Mon, 29 Jul 2024
 02:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240729043846.1892343-1-zack.rusin@broadcom.com>
In-Reply-To: <20240729043846.1892343-1-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Mon, 29 Jul 2024 12:58:37 +0300
Message-ID: <CAKLwHdUoj8bghv7O5JUVx5BCOnZcXnzsrJ_ejt7vGqET3UW8hQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v4 0/4] Add vmwgfx prime tests
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: igt-dev@lists.freedesktop.org, ian.forbes@broadcom.com, 
 maaz.mombasawala@broadcom.com, kamil.konieczny@linux.intel.com
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

LGTM to the series.

Signed-off-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin

On Mon, Jul 29, 2024 at 7:38=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
> The following series makes some adjustments for testing prime/dma-buf
> on vmwgfx, adds a vmwgfx dedicated test for it and fixes some minor
> issues.
>
> The last patch in the series adds very basic prime tests to dumb_buffer
> test to verify dumb_buffer<->prime functionality.
>
> v2: Add a reference counting and dumb buffer tests plus fix issues
> spotted by Kamil
> v3: Fix a silly compile error in vmw_prime test and remove dumb buffer
> test
> v4: checkpatch.pl improvements suggested by Kamil
>
> Maaz Mombasawala (1):
>   tests/vmwgfx: Removing incorrect assert in mob_repeated_unref
>
> Zack Rusin (3):
>   lib/vmwgfx: Allow using any buffer handle as a surface backing
>   tests/vmwgfx: Add a prime test
>   tests/vmwgfx: Fix and extend the reference counting test
>
>  lib/igt_vmwgfx.c                |  76 ++---
>  lib/igt_vmwgfx.h                |  43 +--
>  tests/vmwgfx/meson.build        |   7 +-
>  tests/vmwgfx/vmw_mob_stress.c   |   5 +-
>  tests/vmwgfx/vmw_prime.c        | 584 ++++++++++++++++++++++++++++++++
>  tests/vmwgfx/vmw_ref_count.c    | 214 +++++++++---
>  tests/vmwgfx/vmw_surface_copy.c |   8 +-
>  tests/vmwgfx/vmw_tri.c          |  12 +-
>  8 files changed, 821 insertions(+), 128 deletions(-)
>  create mode 100644 tests/vmwgfx/vmw_prime.c
>
> --
> 2.43.0
>
