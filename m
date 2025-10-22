Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CB2CCD195
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 08:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1D010E046;
	Wed, 22 Oct 2025 08:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="P5dLBBas";
	dkim-atps=neutral
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4E010E046
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 08:34:25 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-54b27d51ef7so2612854e0c.1
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 01:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1761122064; x=1761726864;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/w/md+aqJK9w5fwFktq4QkNQDx5+bBItdpQJ+bEaKyo=;
 b=P5dLBBasVDcYwY4peKp39D0g7lwWFeJa9+HpA+bGYhfisPmk2Y5zlGCQUjRxh7L4Sf
 Eq9cd8yoBEhMYnb5vuF98smvRd6asKR82ziQzeILERudIXwdRJvX0EiJBGjctBK+gTmr
 CfDvWQf5+pLJoG6SIY3qozNe5goNp5zp7LZ+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761122064; x=1761726864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/w/md+aqJK9w5fwFktq4QkNQDx5+bBItdpQJ+bEaKyo=;
 b=to0f4p0EQQ0Scmz25mBvryUa0VQBNWsypG+X4m6mIG0n3/MiWYKbnUVpZ0zePqQ1dm
 vWoKrdBJbXuE15gBXyhHqeqn/enaJyQD6Pwxhjo5ZE0559iFqiNKIbjsF8DjKNpZQOOe
 yyHnM2qloFDLTErvNDmWuzfnNLov4TEC9bhYn1gC5h0kAFYbUTE5eao9ywfSllInwp6A
 F0xqc0ZiRsdjjL+qeMBpMk1AmeXIKhVrUrj9J4pRBDLkbr+Lu4Hxq8OkJtevI4aQ1n05
 m08lllNo8mQNrAiHWlQHQeIHSd8L5sdKMlckWzN0HPI369LcT8H77SNxlJzKfzxMIvmM
 8moQ==
X-Gm-Message-State: AOJu0YwOLldTs1wJGkAA4L4XujGrgvm3PEaa7HkBib94TET5R1E/L2wt
 1w9//YEfuizVCCR6vDnL7Sks7Cg/+kSP7rPFqJjVlBnM9s9BlO/PCNAuBbbnpwyrnR1WsB0AmaC
 MGTQ=
X-Gm-Gg: ASbGncu0sKw+KpCk72/MK3Yiy9lGhi3hTDp+AXopWxVQPmbCm4qV0WkEbaDT2N9T+3N
 OUkt2PDPPR+V5OsOA+NV2NNoIHNx1FJlQWzgBauFsdCBTGn4upcjzI6hfChMBDpFiZOH0F4rMiv
 mYu+WrPtpCzqi6Uf3FDGv1W37zXR3Y7Xg73SsF68oaYVgOLbvUugsekDbf4T16jFJ1l+qv9JzZR
 EfT5oid12QIn4VBp3D6k/SN/QmFfnKruX3UCDfw2FSs2i5yn7Cstfuar+CFJKCaBd3D/52H5m8m
 rzKgIFfzhGRJW6qucPK3BHAlTCZeunkKj0GCbPqF5iTwNQ6j/aLqZhPOOw4EXzMw6woDNKSSwmi
 roscsQIKSjX2r7FvGPkJacBJDZH4lsL2T4BGfjRJiZz1imMnEm9jrxvqFsDe/o5x7JzT9HQjAWD
 9FUcY2d73xRQHvnpDw4mh6fCi/3IQnq9IsTTM3/AIZ/yGtzA==
X-Google-Smtp-Source: AGHT+IHDqj7CmGWrejVWN7Gt2QC20W3WqXR+vdbfxXCpjOdeOags9KbseQbTOVHCy81S0EdcDAHKFw==
X-Received: by 2002:a05:6122:c9a:b0:54a:9e47:7624 with SMTP id
 71dfb90a1353d-5564ef5bdbemr6029709e0c.14.1761122063798; 
 Wed, 22 Oct 2025 01:34:23 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5568319eb26sm2101109e0c.25.2025.10.22.01.34.22
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 01:34:23 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-5db1e29edbcso236463137.0
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 01:34:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3f46:b0:5d6:731:fbc0 with SMTP id
 ada2fe7eead31-5d7dd5ecfd8mr6429537137.36.1761122062238; Wed, 22 Oct 2025
 01:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
 <20251021173912.4050926-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20251021173912.4050926-4-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 22 Oct 2025 16:33:44 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhu0ywS1rPYcp9nqLKQe4c6hmJ=GsM8HjvMATy1oS1eXA@mail.gmail.com>
X-Gm-Features: AS18NWAI7j3kZ8_feHc-HF9nRYomVHUiC0wbrABCTgjW8mw4-B4v7f5-ON25g74
Message-ID: <CAC=S1nhu0ywS1rPYcp9nqLKQe4c6hmJ=GsM8HjvMATy1oS1eXA@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 3/5] tests/kms_content_protection: Exempt outputs
 with no EDID sink name
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
> Mark outputs with an empty sink name as test exempt to avoid
> unnecessary test failures on panels without EDID sink name.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_content_protection.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Fei Shao <fshao@chromium.org>
