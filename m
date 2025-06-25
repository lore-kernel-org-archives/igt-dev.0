Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2458AC7EE2A
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 14:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA46310E73A;
	Wed, 25 Jun 2025 14:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="agfx0Yyk";
	dkim-atps=neutral
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0797310E73A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 14:07:05 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-31384c8ba66so813576a91.1
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 07:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750860425; x=1751465225; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ng76ftjYjxIUTWVRMNU20XrVlj2b9tdtcP1is29J+a8=;
 b=agfx0YykImMWrBBZcX91/4N71Cq+QhtRcRwW/xq7MZqE3K+opKcaG2RCxMF9peukGV
 ZVu2hsGOPHbiUYjaPz0sDdo7XONo2jsLvk8/lK3nC3PR5ducUr5+ib4aWo0xvhrxwy9J
 iPfDLwIoGLXBrHNuDqgMVoBDrCMo4p6ZTnA6m0A5DOtIxqDdRjYx+rrlrO27g9ShpcEq
 OwkG67rVxpl1oARfEw5FA0sVwzOHeW2PAyV/3zCtjRpVIvsMojIJiSVFuDIJ9gWzRxz4
 dqXDz3MLd3CJ7XO7sPjvc6T4DdG90qfzcRLRiaLgmOCzLQq8H/rjurEf/ZGMJBvtkEK0
 9WOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750860425; x=1751465225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ng76ftjYjxIUTWVRMNU20XrVlj2b9tdtcP1is29J+a8=;
 b=lyT0+3pFLbGmvS/6BjPdYpg2jJ9qGivLfbqu2lWJgB91VNRsUrSJfzy0E9NNgKQpUE
 1LvFJ0lUBpoNLyJo0ihsg+oWlvB2HY9R9LJZAHxqIil7xfOL+SARIotP65IQFwAxo8uo
 dAL+gEPlmTP7gn2Niu+5zkCNgBgRj+WF5XbQoW/YUoZIvT/k8h/tykZaGsTNSjL37vTL
 NvP5wgpoMhcP/3X4rbNjM0H6owdAg9aedNKmvyxG1J8x9doCiTlBDSvKcd2Y8OO6ZyAK
 yNXDOEyYq5w/egWqpEkEX/F+DDpxqkP3Et7JARUgL2crLE8NuEWojtJ+9oyLkCRunPWI
 YXDg==
X-Gm-Message-State: AOJu0YxUFY7ockldhEM3mFvS5vvUPA23Nrmqva65i7fUfrySEYCexyFR
 QThdMgE4DVzBraxOVxDktHmVUOyWG68+Mk6abEIC/ts3TmNpIKx10W15diJmV6pklHfSnvUMJaz
 KQihFHx3iCzDkgD+SmYWsfvQjrOjXms8=
X-Gm-Gg: ASbGncvj+885EGQEdf2iRWs0Tl7C9HBv51CxhlRVDcda8qxX6p69QHw4xhvlFJjXk7u
 DHtIbBckM6RnGHCniBHCypssSPd8R5lu2PzVjo+bnv0ls/cgVWSMzPCK5QLZ7FByypbnStgJcZY
 DfGAuazoE16X2j+GkntrbpXwLQ+WQ2hu8JCCfYlK1LhcAi
X-Google-Smtp-Source: AGHT+IGe3zBKhfOUf5eYFEHU3O91h+tqTFQe3aImg65x38HPX644/0r6/GTehp498X87P73WkCe1kRVDPyOQQvsqbMM=
X-Received: by 2002:a17:90b:3906:b0:311:9c9a:58e8 with SMTP id
 98e67ed59e1d1-315f26ca40amr1665997a91.7.1750860424422; Wed, 25 Jun 2025
 07:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250625042133.6609-1-alexander.deucher@amd.com>
 <20250625042133.6609-2-alexander.deucher@amd.com>
In-Reply-To: <20250625042133.6609-2-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Jun 2025 10:06:51 -0400
X-Gm-Features: AX0GCFtwodo10aG2eRhm9jyM8PUKrxBgTRHAgghUvXlmNqKlrS-A1xhm6soNACo
Message-ID: <CADnq5_M7dF03F_E=zGU_7PahTbL+eo6VxbHa8Yod1_BTC4cmsA@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib/amdgpu: fix valid error codes for deadlock asserts
To: Alex Deucher <alexander.deucher@amd.com>, "Zhang,
 Jesse(Jie)" <Jesse.Zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: igt-dev@lists.freedesktop.org
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

+ Jesse, Vitaly

On Wed, Jun 25, 2025 at 12:22=E2=80=AFAM Alex Deucher <alexander.deucher@am=
d.com> wrote:
>
> If the job was guilty it will return -ETIME for the fence,
> so add that.  This fixes the deadlock tests for per job resets.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_=
helpers.c
> index 0cd83f061..f7845edb0 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -164,7 +164,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle=
, unsigned int ip_type, uin
>
>         r =3D amdgpu_cs_query_fence_status(&fence_status, AMDGPU_TIMEOUT_=
INFINITE, 0,
>                         &expired);
> -       if (r !=3D 0 && r !=3D -ECANCELED && r !=3D -ENODATA)
> +       if (r !=3D 0 && r !=3D -ECANCELED && r !=3D -ENODATA && r !=3D -E=
TIME)
>                 igt_assert(0);
>
>         /* send signal to modify the memory we wait for */
> --
> 2.49.0
>
