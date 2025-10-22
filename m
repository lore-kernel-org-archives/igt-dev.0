Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F12CCD1AB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 08:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42F510E6F4;
	Wed, 22 Oct 2025 08:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IsnWA569";
	dkim-atps=neutral
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2B210E6F1
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 08:34:31 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-54a8514f300so4107796e0c.2
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 01:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1761122070; x=1761726870;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vxrOlt+gsz63c4Vz0AuQ+P6eVqRbGSH+zitp7ALS5zk=;
 b=IsnWA569kRHFmYC6iQ0GZPby52F6BQsyiCJAopxz/sk40sAJXTeEn3/4h1zqVIvLFv
 RnkRsyGEfB9J6+P/MUjXzvD0+2Ox47AYYQPihAfche54MoqigtIaXEtIw/eSZEgA1Vnw
 ivLNiqNhLvS6OAbsx1O2oDAVWULwWcZgMadjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761122070; x=1761726870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vxrOlt+gsz63c4Vz0AuQ+P6eVqRbGSH+zitp7ALS5zk=;
 b=G/tVJIzdcO5io+LsCGnwHXX6dmAMdPruxr1d0grab5cXMk6ZOGucEOSHEvAqx4/UBX
 UqODfwly2uvByqypuf+X3c1WH/TldTRKL7lt9LQJUPCquzT2IhljBaqXEi3+DraVyRBw
 MCRXLOnysBKQZOaNlFVzplGJARBn9SGFBgxC1ir9ZuN8QTLfV98ilBOImChgn0D/RcO6
 JcD8GaLSQZeKwiu6F+U7mcBy/FeLbeVcdD41FpcTnutjYflXzgubuV8IM0cN4UOcUIKW
 ZJE+tz9ry8JF52vmBe928KO02w2iMWVCMHX0dX5512jbcyy00+ZpkhP2TGo24A2lV4IM
 7n1w==
X-Gm-Message-State: AOJu0YzxcrjanOt6KUscA8IkQS2xT+HrLeUeA2fVNbUPGrW67OoyZQ1l
 XYpWHkt3ig9elvP/p2ABoswkrArtwhxMDdyv6gJD5zWNnvIVSPMzo+Mmmx5YFs7tiQpZtv5HaV5
 rIlI=
X-Gm-Gg: ASbGncv8Xn7t/CzJ3iOG4l7N44cgaCdrBsUbHncn767k77HCMLMJy7+kuBgt4Ht2pgO
 ZvhOXafnsovn7Ju00M7zFrMvgKHwr8oxvv+8Vmf5CpMJxNndqwwx9H/dZCFVW92/pz8m0QiTmU5
 4oqVlQORzwsauL4eA0rKbGJw4OXJFFymzoE9jB+lNo4w/jVZ6qJoVE8F5Ep7WkDLPW4tEILPYwh
 3gyo2gG4zuhwdjFbAkZpsMU724My56rHHxCRVT4Qd9MrcToRsfqDets4xKD57MUqZ+3AwrPT/I0
 5iUUpprhJOxruA/7kdHkq06+8j981phpRVDXkXmkeQZFx36vqLQabDwWAB5jwQUZMinY3gwWu8F
 ItoWUEaqMf6S4pJzLvOFH92iH78ru2LTeYjsrdcUCGwha43XuZLm3BTahLUXJkt11RCUgc4iLgI
 3GritwcrRI0OOXiL12UVMr548OPeBQshnPe+aRgxrsGjCkKA==
X-Google-Smtp-Source: AGHT+IFX3kfGs7qKvZpJTWAu82k0fVDVokuvNRgI53DdI/iCTj6pUEsW78L/kI1g3VLEaoUBIQVBXg==
X-Received: by 2002:a05:6122:1346:b0:54c:3fe6:6281 with SMTP id
 71dfb90a1353d-5564ee23106mr5973308e0c.6.1761122070202; 
 Wed, 22 Oct 2025 01:34:30 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-556620d8d28sm4247996e0c.17.2025.10.22.01.34.29
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 01:34:29 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-932c42aaf14so2979560241.3
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 01:34:29 -0700 (PDT)
X-Received: by 2002:a05:6102:2928:b0:534:1aae:2d7b with SMTP id
 ada2fe7eead31-5d7dd66394fmr6334987137.24.1761122069450; Wed, 22 Oct 2025
 01:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
 <20251021173912.4050926-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20251021173912.4050926-5-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 22 Oct 2025 16:33:52 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngDy_XpZttCdimXXukKYQUQsuoUuEJhmdTaeR-5YcO63Q@mail.gmail.com>
X-Gm-Features: AS18NWBonvVeh0OyVbrjdiL1kmztg-y00-A5Q_U8no07q-_svr0z1rkPg2hj-nU
Message-ID: <CAC=S1ngDy_XpZttCdimXXukKYQUQsuoUuEJhmdTaeR-5YcO63Q@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 4/5] tests/kms_content_protection: Add MediaTek
 device support for HDCP debugfs
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
> Add is_mtk_device() check and support for reading
> "mtk_hdcp_sink_capability" from debugfs to enable HDCP tests on
> MediaTek platforms.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_content_protection.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Fei Shao <fshao@chromium.org>
