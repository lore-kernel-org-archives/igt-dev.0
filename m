Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E94CCD1AB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 08:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E2110E046;
	Wed, 22 Oct 2025 08:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TqqnLKHE";
	dkim-atps=neutral
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF6310E046
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 08:34:42 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-5db24071011so156473137.1
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 01:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1761122081; x=1761726881;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DY7Vu3pKnkIMQxYDNTIRKoWNsPSvbhGXg/Fuq6dTPXQ=;
 b=TqqnLKHEwNqif9tJ4pFF6/YvrAxNoHeDkQZrbr8KpwJh9kTb4qU9U15HQbgtJL3hgA
 c5kmwjppYj0TLHj/DQp9QDBzms+65qVFJiwug+gELRfVgVkQ7rm4Mu3jbqi5+zcgg2Rq
 /3SwiacYDeuJjUnELeAUfKHsx9GVYnf61d7h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761122081; x=1761726881;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DY7Vu3pKnkIMQxYDNTIRKoWNsPSvbhGXg/Fuq6dTPXQ=;
 b=uYZfLZzbm3J+vCcimxINsyR+BZMFUGQ/DNysBhJck0DtVvFlZ3A7O/g5iNcFmPoAuw
 XukJp5UI1BLdI43w/ZJGq/30aiPaNcny4skTfkU6aSIru/lOmsMhgxbYb0+tp2nOkCDZ
 XTO3KMy9zbIVJLROfV8GkkQpwkk3jn6Kb9f9GGlba7lvEGiT8i5b3TM1NXSILLO+dOT3
 hTTLT/qvbI1TsbWR5eGQIXfuQ5KkPMYTH8l2ys91TMu+2pRy0tQOEcb1Z5C3QHwsKv15
 Ako6O34KQBXW9JhmJiF6Gve/Tw+4TUzXh5ZQtmB2ihBo0pNrWTThCc4Y2p2SaC/5bBPQ
 wnvQ==
X-Gm-Message-State: AOJu0YwPb3XhBAh+irTakaHbvS4lBQ9Skqdjgp5vyQT9tRduitIR9Y1U
 aXyb06Pe713GI7qvFT9Juzal+oDXxI8MnMPGkcZzOSPqvKcvm/tBdbWlQfFJUwfDkD5tdxBYQQo
 t0dc=
X-Gm-Gg: ASbGncsc/jud36+uu3/mAPoP0Xcu5lgDftKY5PXVzWvClmMW8WXNZtnWSzWGw9zixsf
 lqxePnDPUcppgHbGmu/ccv5XNH952yRf+mwZRvX9b96ylrjkTcJQRGUCWCvh/MqChZP7vLekZtT
 k8qG/GT62X2dzdlUbJxzCKegjPNu6QdJRe9cQR70q9xRmi6hrrTwq2dZr9Uat/yEphL29ZbDgKT
 r9ZxGmJqPtcz20s3MmmX9C8Bx4TDVgC3x9lcWWaHmmmyd1ExbyroJfXA+86N8u8mdBvWc7tAtSX
 tEOUTWCsrjVDpLkxkJd/Udh8nXKkwIuiR1/WxPcE9Q7ErsbhoQYG+JCIEysDqSh7+7QNr2Sr9Wj
 hFqMRHjPbmFWQQnXqL+vxqZkykBx3yIL/oO3VMrbjMaaZ8vvk7ZnZLlf1mhHgHoQIr5vb2u/x9k
 uOWBiuwsrK3wfpSOAe347YUnb0K4SOyLlBMcI5ex+U+OWT3w==
X-Google-Smtp-Source: AGHT+IF0S+hZfXtcn43XyuwLilqsZ8fQll0f1TiidxLS3FTpTE1pDe4Nk5lkZLItyyYc8vSDNJZEHA==
X-Received: by 2002:a05:6102:44c2:20b0:51c:4443:16c7 with SMTP id
 ada2fe7eead31-5db1b3d2691mr877311137.6.1761122081636; 
 Wed, 22 Oct 2025 01:34:41 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5db23d61d56sm138642137.8.2025.10.22.01.34.40
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 01:34:40 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-5db24071011so156453137.1
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 01:34:40 -0700 (PDT)
X-Received: by 2002:a05:6102:1a14:10b0:59c:d78:dca with SMTP id
 ada2fe7eead31-5db1b3fe897mr706638137.15.1761122080511; Wed, 22 Oct 2025
 01:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
 <20251021173912.4050926-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20251021173912.4050926-6-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 22 Oct 2025 16:34:04 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh_Fr2z-NV=N-0hDAyCBU06zoqYVxGLdLCH2tmh8ZsnbA@mail.gmail.com>
X-Gm-Features: AS18NWADhS4C-OX_5l8Gq2cbAD3gSd7PR1dpjnT0v3kEzXhoygIA-Uf_A9h2r8c
Message-ID: <CAC=S1nh_Fr2z-NV=N-0hDAyCBU06zoqYVxGLdLCH2tmh8ZsnbA@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 5/5] lib/igt_edid: Fix monitor name parsing and
 trim EDID string padding
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

On Wed, Oct 22, 2025 at 1:39=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Fix the EDID parsing logic by supporting EDID_DETAIL_MONITOR_STRING in
> addition to EDID_DETAIL_MONITOR_NAME. Also, trim the trailing padding
> spaces from the monitor vendor name when parsing the EDID string to
> ensure the monitor name is correctly returned.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  lib/igt_edid.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Fei Shao <fshao@chromium.org>
