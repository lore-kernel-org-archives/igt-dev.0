Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CFBCA5FAC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 12:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5479110EE8C;
	Tue, 29 Sep 2026 12:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qimn3Ol0";
	dkim-atps=neutral
Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com
 [74.125.224.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB9B10EE82
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 12:33:24 +0000 (UTC)
Received: by mail-yx2-f42.google.com with SMTP id
 956f58d0204a3-67375a844dfso3762155d50.2
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 05:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790685203; cv=none;
 d=google.com; s=arc-20260327;
 b=qg7ytV6NNxIgZfTUoF1EBlm3aGb1bjYNKIeX+LUP6fzaOc0ooeI/ziJzLejP5+kvdC
 ouKgaDSd/NkR4opM0mHEvCHDlO+tTtsJ0aP5xXjaq56t4M0e3vE5NRgpo4jPDi0fLqBW
 yed6ex8fMiCTZ0qRgs+X6np0JX0Xznu4YOicD7uiKZ0TJ5liA3GOsYPQrJ4lCZQsdpWW
 KrZ3NtFVWrIzOQs9lVnzktWVaEujL/KRGCSmhczxZamcLN5D7n5n+AArGcbns3Z7DBe9
 ftiwbV783XWMGCV+bJ5YVTFTxFJimXb5aj7bCH+ARNzTgBeONeJv1dyQtQkAVTOc0n0w
 IlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=jRotJCre6rCUB9x3zHeGKiioN9GFfWueEq3dm1ffkIc=;
 fh=0LlDfLvlqiBN9rAyH9VzSvxFkrCJTnQhZB+8mrD+Mjs=;
 b=eYChSzn3mkTxb2QM4DcZZyMok5WnWDZS2zqKjOnIROVjQ2RRzWTvylYccn9qcjsPFT
 y1H+wCJr9PQqFJidp1FbenSbkr1CVHMIWYAhbUyY8NkZsPnT8u4hWodt/DO5afobA8Ik
 vlZlVUGesheFSTvYsaqZDFtNqOJzCiIO5Tk+/xbua5YJ3fS+017kWqj0Xq5C4RfbYsuZ
 JxPmOiz1gkRbUqjn2URBr5DdVh5M7gUHgby+9X+maZ0N+qplPM+GqNgIpo3aPbT3kKvT
 PWgzhhT0Pb2tCea6wiWqRfDS2MWQhHV8+M2sR+2XgMEkNxAHJN9xSRDXyeCBUtVdNIZz
 aGWA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790685203; x=1791290003; darn=lists.freedesktop.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=jRotJCre6rCUB9x3zHeGKiioN9GFfWueEq3dm1ffkIc=;
 b=Qimn3Ol01nSEIm1aXhgkfasZmji90lhFRDo0LgJMTPVWSmop2J6kmf0LSNM3buij5a
 6WzuEPJKbRUsqqwKTalxyXGY01/oBf+Oh30DTEumY51x39J6Ao5NyPoREQ86afFiwnqc
 TgTQLiSA80xSclnUVWcCgPHL2XNR46B0Vkw7RDxs4d45YRURc4basowXCKt00tJxlvr5
 bavMMZkFUN7DtbS+OGcHP7K+YNxSktqI93WI0MGa4/2w3A0wtO9Uxbgcly4TvM0nd4nb
 cwLt7e4naDpMaDV3nyztGgwIaLu7woIaTHmLc8cWSBln4T5uJl8zaBKD9FYvK/3U0Jw2
 CuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790685203; x=1791290003;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jRotJCre6rCUB9x3zHeGKiioN9GFfWueEq3dm1ffkIc=;
 b=et/ocJ107E/+hkcMul/vpXOYmGKBCF7Glnm7ZEmPU8grCt9Qnj1C1Vx3MyYZ8CNeDT
 rONj/G4kxTvg2xJaheGN0A512f8O+BhaHl5xNKILpd3gytPLq733dBIx66J/RY3Cex7C
 gglrYry7B/JxIMofLheyyV4cEV0/D6uAJN/HZY7+AzsWygIv+Yrowb6T0cGJ3JVvzwfL
 KOUDLvR2PjSjj0I9qlfPDjR+jrwafHBnh9fyk6uMW4Z81Y1aIwDqWiag9JbxsOAqQgbH
 cja8olPpdCnO+rCNcApCtWy6x9UtwzbK7O7Iv9iAv4rmDuTMK914eTpefb0KjnFzqfLq
 n44g==
X-Forwarded-Encrypted: i=1;
 AKwUvBy9IpP0XNKNp4G85brBhQCRV/VS03BgePTRWKpQX6F+f31WO74Fg6MidLdLzpBc791b5TMN8yes@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLG9wU3FdC8TwOvzSNm+OKP6QusE7NM+zKleWajXOOzHdBXK+BN
 FalRG3S32QqCDydrxQ/1RJzzbmCyJbxlId3RTjyjTd0LSAi/hnsIgyNPmegghQD69cHcO6ruWg1
 nlMlemPN44ccbTxauNgc3U4/VhMKPdAg=
X-Gm-Gg: AYBFou1GvU3BlWHlKGtcozQlTi/ODgDSDbRp5SQoPxWrKJJtkBZKGAStGhMZOcPrYuj
 DkFn9MRokmZu0Qisq+FOB1rNeBU72kMkxcP9dgm9vEPAUb7Gg5NSNytXQivn1gy9V7YoKlmPEY3
 iK7CKMq0xZAxvFPmJwP4kYXKBpuFgAELQ7LvstDkDAUr3SESE4r3j3873y+Udfh/nbtFW1qOpog
 wj4AMURQSpx4gXsQh/q7vy2P1YPWXvKYxPQqg2yL6uwGcIZjjLGuRd8umW0QSl6F7cANZ9luhTk
 aRTboKPqJ6SbpPKIHNOYjV50GHNfIr40tuIr7YAxQyeO4GuzqjFNxA==
X-Received: by 2002:a05:690e:d58:b0:671:70d2:528f with SMTP id
 956f58d0204a3-672ed3c2caamr7456866d50.82.1790685203435; Tue, 29 Sep 2026
 05:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260926152341.783867-1-gye976@gmail.com>
 <20260928113121.fenmiefp7fv26xul@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260928113121.fenmiefp7fv26xul@kamilkon-DESK.igk.intel.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Tue, 29 Sep 2026 21:33:12 +0900
X-Gm-Features: AclHuK95Ar3M1lts94nfLzlRl6YI4EdnqOVy7gMpfcT92mCmyqCppcejG1BXP7E
Message-ID: <CAKbEzntYNNr=OLGuMuq4eQXcy4B9-+epQ+pt-Zynrr8jtN9JqA@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/imagination: Add VM map and remap tests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gyeyoung Baek <gye976@gmail.com>, 
 igt-dev@lists.freedesktop.org, imagination@lists.freedesktop.org, 
 alessio.belle@imgtec.com, luigi.santivetti@imgtec.com, 
 robert.mazur@imgtec.com, matt.coster@imgtec.com, sarah.walker@imgtec.com, 
 frank.binns@imgtec.com
Content-Type: text/plain; charset="UTF-8"
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

Hi Kamil,

> > @@ -0,0 +1,192 @@
> > +// SPDX-License-Identifier: GPL-2.0 or MIT
>
> Missing (c) line.
>
> > +#include "igt_os.h"
> > +#include "igt_pvr.h"
> > +#include "igt_sizes.h"
> > +
> > +#include "pvr_drm.h"
>
> Hmm, should this be in igt_pvr.h?

Yeah that should be dropped.

> Add here also global IGT_TEST_DESCRIPTION(), see for example
> igt_coregetversion.c
>

I'll fix the rest and send a v2.

-- 
Thanks,
Gyeyoung
