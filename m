Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3C9E77180
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 10:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD0710EFA0;
	Fri, 13 Dec 2024 10:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=adrinael-net.20230601.gappssmtp.com header.i=@adrinael-net.20230601.gappssmtp.com header.b="m0wlq/Wz";
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072A310EFA0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 10:34:24 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so1639622e87.0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 02:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adrinael-net.20230601.gappssmtp.com; s=20230601; t=1734086062; x=1734690862;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjwAsZ2A68gABaB8pYw6v5OvQNrAfgTMrDt2dDVBQ9A=;
 b=m0wlq/Wz2MS16HB3nnv+8LIzTltwxcPXk6y4k6b/FS/ihUnczydQ64evnrSg3r9a+4
 46LkjNpkNON4im2m9lvcwlQEKFlL9w9/rf02Onk2wyS94wCrje9W6nQJ+Ds/xIM+MGbE
 z+NE+2Oojfr/EmIDQk32UKo8SYRuSO9MeNF//7BnyB3L+g82NEUq6YCRD5Dx3nznBE1O
 rqFx0NMx8bbkiBLJ6a+cc9qt8FQxG2Rg1ZARy6vRYF9imYVHBke+9UTPwmih6Oab4uTz
 FSRoiCwFhJpR8//qrRjKSYDev3EnT9Wyd40/IQYxTYN4ui9eYjwPlbmwjvQH/HcYTLik
 M7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734086062; x=1734690862;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KjwAsZ2A68gABaB8pYw6v5OvQNrAfgTMrDt2dDVBQ9A=;
 b=WV+fPuXTM4BtlpmrZqdWxImRLdFlWKae7CsKuK1mPrINz3O+M05L8uLdC7pZJg584a
 y/x7BsCJMcT0ikr2r9HGKw2/HJ3zBgCHKKB+m7OupHpXCcEldrLYxm+04jUHhEDWVoOk
 CBV42I2tVwaL/vNu3ywLB8RpJiKlcDQSryZZ7wtdTVWsEXhosrCm0P5XrCaB6JwLtswL
 qcgfc52kj1mSPIfVBknJHJ6IPYNbbduxRXWQqKR4lV2MNkvqWV0rYXXN+0XUAukQyhHz
 QDLjQ4ANYwWUPlymWCS+FUPWCblRPxVLFupGxrLOPe+L3WgHduQa85Ns7lQJXSPIsHhU
 EXYQ==
X-Gm-Message-State: AOJu0Yw//SnFNQ8vMCq86gAaoKzZuThWZKYJYQvpq6fhpG54BMiwwLZH
 AWwmBvxV/6YeEM7ea+U4aYTMg5vOVZzSozYRipuA1fgjjnXVUAI+qj/On7b+bDFMX70qgg87z0b
 aZxbZHl6WqAOVCQwAihqDBjY6sAnw8m6huxCp4RbF8QnAqI/xQ0c=
X-Gm-Gg: ASbGncvBfXzrxmNZc5GOpxUegxYOFE5LGCzn2E8s2YnWX7z3ApU/9v1d23sQ36ulU94
 ac7P7C+GKPGP77OtwNSF9o2ZD4t8ieq0/1hNs
X-Google-Smtp-Source: AGHT+IGzunsIH4Msl1kzt+7m3U+WXp7spgkcwy7nEgyAlDIvDtvIGM29YhLOkU51DBNEHY6GTq0JgAsy8yCVfdeqDgw=
X-Received: by 2002:a05:6512:3d21:b0:53a:1a81:f006 with SMTP id
 2adb3069b0e04-54090563f80mr667195e87.31.1734086062201; Fri, 13 Dec 2024
 02:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20241213101547.13411-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241213101547.13411-1-kamil.konieczny@linux.intel.com>
From: Petri Latvala <adrinael@adrinael.net>
Date: Fri, 13 Dec 2024 12:34:11 +0200
Message-ID: <CAGiqM9nuApm7Gvczp6xtFQYemPrgMybL_0h7nSDwtx8wDpArog@mail.gmail.com>
Subject: Re: [PATCH i-g-t] Update MAINTAINERS
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>
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

On Fri, Dec 13, 2024 at 12:15=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Add Karthik B S.
>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90c3c0880..afc5dbb36 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4,3 +4,4 @@ Kamil Konieczny <kamil.konieczny@linux.intel.com>
>  Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>  Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
>  Ashutosh Dixit <ashutosh.dixit@intel.com>
> +Karthik B S <karthik.b.s@intel.com>
> --
> 2.47.1
>

Acked-by: Petri Latvala <adrinael@adrinael.net>
