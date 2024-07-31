Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B4CC3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 17:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48EB10E649;
	Wed, 31 Jul 2024 17:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WY+VNU9E";
	dkim-atps=neutral
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA1610E649
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 17:57:13 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f032cb782dso66056801fa.3
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 10:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722448632; x=1723053432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/if4J4c4sijJGJqgKEKOzM4KMdwvwR1xY1hv8hevX9I=;
 b=WY+VNU9E5r0BUt5FBFE9jhkW8LPTyRQSWqvEko0Y2F6ZSGI3gxwZDV9cj7OPD5FAP/
 FH3UhetqS2xAxGO0Jq4prPycHuTQkVXBzDbfwWyUDX6seEbE5ezr8VEI7mLr5JPiyCY3
 Kz6ke5mGTh9afkggDShEltN8lBlnb934+ka+T/ZH8kvXYeqBd13EdMac0KEVyP+YCvum
 qCGbNSs4fwYatGP6R/oxKGx/jsyjzcEKV8p5NuXQi1WqCwB/YIi0QR+2U8IOf+6f5182
 l19ix/Bu5CU9k7zaDjRt5dnfDiea9jc9Ls/ezVXGDsA1SHRbFDiq27Cwyc2yhOutFewC
 qM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722448632; x=1723053432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/if4J4c4sijJGJqgKEKOzM4KMdwvwR1xY1hv8hevX9I=;
 b=XHfEmkg/XTvk6/j0+EB9MFBaDwuVCgFDCAfPvnT2B+TTP7CV0MotSbGNI74slku+xl
 wHnqdid9gBzX4sHr+JAL6q8mWNqmnp2DHdxoWyJzhBoN5JpXUfXkuGl1vlqz9sB//7HG
 bs5GqkgKUrvM9Q//CRGkoSn8I8gCgyuWtBZMkqXy0eUsIAgboje9K7fgku7cFQxsFpqk
 XiyqMnFrbDoWszP6P+xdAtIYbccDBOA0C3+DH+XGXXXEUWxg8PG5hziVxmXfakfmpKex
 3lwdVhUs5orE9HE5IxPkpcdH+IET3wxgP6GRZcSXJhZF6OVm9c+cr7gkKMEy9d2FiFvP
 BP3Q==
X-Gm-Message-State: AOJu0YyHCjtfahLD+uk75IupgEONztgNVzfMOqMW25mn6yOaMRkCb9+o
 pwg4J+8o/sDvfF/9q2hJXvleNff6qgpHNBR2HdgD28f+jdbn2zHcyZh/dSx/haLl0ycCFSCOPot
 AOh6sQcmOA3KH+g5KNgCViSN/Ta3mSw==
X-Google-Smtp-Source: AGHT+IEkQSiTiUeL3j3mhRY/DVDpfVdz3SqrsPW4UDTAYx5EKPY4Xns+63WiLjIhNy0IGdVBs4/YEjX0+ROT8cWlXqw=
X-Received: by 2002:a05:651c:10a7:b0:2ef:26f2:d3e6 with SMTP id
 38308e7fff4ca-2f15328a18cmr1233631fa.34.1722448631427; Wed, 31 Jul 2024
 10:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240731082037.1069-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240731082037.1069-1-krishnaiah.bommu@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 31 Jul 2024 18:56:59 +0100
Message-ID: <CACvgo52=CF4Ms3eL16k_1yOJykvS6AMWvicW2NVF1cmrh_-1Fw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v3] tests/core_setmaster: Adjust loop control in
 tweak_perm
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
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

Hey everyone,

On Wed, 31 Jul 2024 at 09:31, Bommu Krishnaiah
<krishnaiah.bommu@intel.com> wrote:
>
> The `tweak_perm` function now uses `continue` instead of `break` when
> encountering non-existent card paths. This change addresses the assumptio=
n
> in existing userspace that card paths are contiguous, which may not be tr=
ue
> if cards are dynamically removed.
>
> Problem Description:
> The test fails after running the `core_hotunplug@hot*` subtest, where car=
d0 is missing.
> This leads to a failure in the subsequent `master-drop-set-user` test.
>
> Command sequence for reproducing the issue:
> - Check available cards: `ls /dev/dri/`
>   - Output: by-path  card0  renderD128
> - Run the test: `# ./core_hotunplug --r hotrebind-lateclose`
> - Check again: =E2=80=98ls /dev/dri/=E2=80=99
>   - Output after failure: by-path  card1  renderD129
> - Run the test: `# ./core_setmaster --r master-drop-set-user`
>
> This failures on both XE and i915 for above sequence.
>

The commit message is still a bit strange, but I'll refer that to your
colleague who already gave you good tips.

Fwiw the "existing usespace" refers to mesa, Xorg (both server and
drivers) as well as gstreamer, if I recall correctly. There may be
others assume there's no gaps.

> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  tests/core_setmaster.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 9c2083f66..a2758e2f2 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -116,9 +116,10 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsi=
gned max_perm, bool save)
>         for (i =3D 0; i < max_perm; i++) {
>                 snprintf(path, sizeof(path), "/dev/dri/card%u", i);
>
> -               /* Existing userspace assumes there's no gaps, do the sam=
e. */
> +               /* Userspace cannot always have continuous card0...N due =
to
> +                * dynamic unloading or removal of cards */

Is this "dynamic unloading or removal of cards" a relatively new
thing? Back when I wrote there test, unloading DRM modules wasn't
supported (I believe) hence, it wasn't possible to have gaps.

Or does this feature/work that only affects IGT and normal day-to-day
userspace will never hit this case?

Should probably mention a word or two about this in the commit
message/inline comment.

HTH,
Emil
