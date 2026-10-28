Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB69660A2606
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 16:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KITZ0+gb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHBf08L9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6952910E6A7;
	Wed, 28 Oct 2026 16:47:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7FA10E6A7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 16:46:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SFAbpR423463
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 16:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FIMQL8/b9fEltuxt099CZFZ9xmOjJqRvwcH810B5YpY=; b=KITZ0+gb20mFWbw3
 pVLu3laY/1inmrDivrg6I62NVH8esRLx8H9GJzoQGsdtNR0Cy7/JIQdEp4deMzvb
 gqZhwNY0PUubvoLp5lgDzBQLFw/L0RpiPbrQxPDym3OLj7PalL5tFyIJk25sJbfj
 jXVY31I3OdySu1a19bR9gKbW+ulgtAf968D/jxV6h76TXbdcAYGYtemDeS3eLAXl
 igDXtN3/0uzDcabSIKm25YctcVhXI8s67nHs9/Vo661rwwufR4EuSBZTQ97L8Js1
 znJElg6Xz9JXZs2e5/zg5FtBZ8P9MUkjqI/HA1Nm4I6Rw+dMMkXOi6kHKyYuioGZ
 QO9piQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1xar-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 16:46:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-8a0688a43d3so955648b3a.0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 09:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793205987; cv=none;
 d=google.com; s=arc-20260327;
 b=nkFLSIo0FT5K58WWZzi1NNLtOboRQwfVf7oOrpFY8Lou5e0qhyrE3Mq9nLaCwN4EpG
 XKGrRqKm2L3O5xTpN9ygswMS3r8/494VzTBf1Z1TbvIa5FAk0TD9cgA8ugNGXSw6uCUE
 fZ3Zo6+vo5cUyAX4d5QwSrpJ2yAEjHwtFg70hyxVzgzqUG8c0xHm2iNbOxtxMh4/Nlvv
 z/FtuXlARcWEHZMP2/ZSPlgPzpueJ43PCs9WJ6VP6TFdJn8UCTdv+Op3B0hPVukwaVhv
 oc9uVz7dSkC5hIz7tIBh+GAlGjgs37woow6RbWlHu4FK5idcjcpGRZKDATrb+rsL897P
 UWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FIMQL8/b9fEltuxt099CZFZ9xmOjJqRvwcH810B5YpY=;
 fh=+fUdGQGlPJ5THYLso3BjsSPriEv2v2P2+/mYbHsfA8k=;
 b=Mr8DgWCvUcLquasjpZit5ZxSdhgUeqi4hrpTgbNNgq6K1V0DeAqM+89EhDDL7a8kdt
 YM/9VQEddJXraL2+nN9b+8fa/XlQzfCNsAsue7UU+w5L/12zN/Dv9418SXjVmbkDIS2Y
 mUS6nJ5/AZtzO9xZvVI8/g56UQVqXSnWBHm4ljKLsg16jvesjrT7GxsvG28rJ8sxZ2ab
 pc9qEFrQ1KA3D3vnVWCDyVJxTqR4tITxCE3f5B8O5d6nA+WJHdvBYL3pCMWKmQvNwMy5
 YQ8W9mT4uyGuNjO7iOWCFZLTxScebMv8TNOpjz3X5jCB2rF2vbAG4n/wBZJuKR2Dob+L
 YXUA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793205987; x=1793810787;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :from:in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FIMQL8/b9fEltuxt099CZFZ9xmOjJqRvwcH810B5YpY=;
 b=PHBf08L9+t7cVWKsJquQ99TGx3SyF1Tt8k1x44jx1H9HfPm3moIXqZFI5kBVzdjiks
 h5FQmsCoNhhd8Eb7Xnpyqebr+Ta22FYfefqkTluIREEmrh8yfBL4eTIInns6iA1PVLuI
 nobQyBKVNadZRqLnhJWK5kW/HgxMsv8KBOuidQU7+zgFJi5SqkY3//G1uxZOOemCVIkr
 LsDYM5HvwAxrurgJNEYldnzReuIJ96HhivW6meO2ryqsuRW25+OKJHcAkb9vO050pj5Q
 3gWENoX1gF37hHqjuQZtangynFok5FZUyS9SqfT4SMTJLEHXZVmJtPojfGBEej/4nsjL
 NoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793205987; x=1793810787;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FIMQL8/b9fEltuxt099CZFZ9xmOjJqRvwcH810B5YpY=;
 b=2xh+2u5SOROwaKbZJoBGylowWv0fsa7VgXBVP5BVdzHKhKbl3GNkKmz4yxVU3GHMMH
 5JihrTt2SMM6IViIJhMN82U2Lv5Fl6Rjf1/lWTO1X6UcuZG0qn/xFRjj+zE+ZnyfJwlU
 WwMILwd67Ti6Qp34gnT6bz1+dNhYT23dhMhggsfsquIjBL38Cgxn1SDOvQ77NOYewKjA
 szyJ77nhQA7cYs67vdlzG86ynDiZoEgmSuAQqM07kTDf0JWXxgmt3WLO3MKB8Q7y1nTh
 dJbND+rQYwatqbVxXFzeTiWIkxUGrOhc8/1AmhfYQMYWyDq6FAR5Xn5SZMpouK+J6LBn
 F5fw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwKuRvacld5NCIDZI7Mo1LtexoBeAjFNaCimteFcP/jkRe056jVOY44bUAiZ1zQ3gg1Y4OQZOUe@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLnbPdhOW6ASkFnI9/oFs38+L9p9cfY7cEg7GRv1dK04NeiSiMx
 E9IpTjq75gYUn6Ie7vs0iQIE3U6DNY+BqI4v/lMxdcf7dMSqa43gut+ugqSKH2WTD7XX2UO+LXr
 exTS6n+YuHTjk8toKEWRQYDoE0zz4OM/1TIMaRLjcioyrJSDuKDX2DSkBQcodhy0+Fl2TR1QwfA
 u/XtBbtVGTh9S7WliBYx7y2KF8CLpYYdMyJnCHKEy1dLXKLqihnA4vPQ==
X-Gm-Gg: AYBFou089cSkqmozsmjauXpEAU+JP5ZQuwu+NwptHdwTg0LiPWoCISYdGhgvmwoVdvx
 Nchp2BGe+1Td2vWl418KAkJF1gUk6P3xXSuHHVsc9WK0wgj3DBxRwx1oxZ1z4pNfm5+2cyHTrNH
 f8X9UeY1rrdfaHzuKNFVsoN1/FiD8HXsOHoziYHgi0BwrR+W9V+vwojoK4CQ==
X-Received: by 2002:a05:6a00:4f82:b0:891:3049:8ef8 with SMTP id
 d2e1a72fcca58-8a6e8f6be0bmr2415994b3a.47.1793205987407; 
 Wed, 28 Oct 2026 09:46:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f82:b0:891:3049:8ef8 with SMTP id
 d2e1a72fcca58-8a6e8f6be0bmr2415981b3a.47.1793205986874; Wed, 28 Oct 2026
 09:46:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260626212743.16149-1-ricardo.salveti@oss.qualcomm.com>
 <20261026102344.hv2e2ctanvo666iu@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20261026102344.hv2e2ctanvo666iu@kamilkon-DESK.igk.intel.com>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:45:50 -0300
X-Gm-Features: AclHuK-Kt4DA9aLbj9P38VBkFrtce4f41r8aWGKZ4m2u-i3nJ2pm0cyO0-q0b4s
Message-ID: <CAA_5yosFi2uHxBp6SpoOgjqLybSdK2=HYzNREizK7gV-UKwDkw@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_basic: use a portable spin-wait
 CPU hint
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org,
 Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Ig-lBn5Hr8zBrMXzQ5j5fzyqjyvO_N66
X-Proofpoint-ORIG-GUID: Ig-lBn5Hr8zBrMXzQ5j5fzyqjyvO_N66
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae226e4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=9sWsb9wArxMMNJqASPIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NiBTYWx0ZWRfX89ReLY8+7jJi
 emqiEuA/A5TGo6/i2IjbGUOqQ7Orr0t826uBPy0U8A5wfeImPPxcR9Rvm9RKAbaipObuPw1sS8T
 FRVt6dx/u67/znpAT6oaQl6ySSrP9z0x8GaUJbseA9wa/1GsYdutRCiYPfRSz4VyZINE0BuCDIX
 VOTOoMGvw+0ql1f5e/ec+5mY4BWPbmeiiFlgQM/Y8zruWPlf6s2wSWa06MYdUiuTS0Kpf5zEyw2
 SZamSjkfIi8wBkYz/2T3IvlWbRhpT7HxkruMiqZUf6pjK2xssJb0uCH8J8rTQO4f9fZYZ6e/eZc
 eLXti5tbxHTd0v/TAy+tSj5Y/s9ADyxExNiqntIG0iYt+Qnn9RgWX9vXWeN2+ESrPItPI5FNj4N
 ZRvEftAjWqrfMq1GdQ8U+JIpdleM2AX+OAo2Vywhw3okzZL2dLcNaHQclKcJCZOfERmcBW55s2H
 sjNIIbQvxNbd1e8hHvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NiBTYWx0ZWRfX1EZ63mBuWEOh
 W9o6cQv5Y7wJJ9sttbNLVYlCYyt42Jn+UNmrQHZp4C8IKYwsPaEpTv5MHX+mERMdtPpkS5SgUY+
 HKcaIHPRRuxYgjC24s7O+FqNoXVIgYk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280066
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 7:24=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Ricardo,
> On 2026-06-26 at 21:27:43 +0000, Ricardo Salveti wrote:
> > wait_for_value64() polls a 64-bit value and, when no polling interval i=
s
> > requested, issues a CPU spin-loop hint through inline assembly. The hin=
t
> > was hardcoded to the x86 'pause' instruction, which is not a valid
> > mnemonic on other architectures, so assembling it on aarch64 (or arm)
> > fails:
> >
> >   {standard input}: Error: unknown mnemonic `pause' -- `pause'
> >
> > The breakage is easy to miss because it only surfaces in unoptimized
> > builds. wait_for_value64() is static and both of its callers pass a
> > non-zero compile-time constant for check_interval_ns. At -O2 the compil=
er
> > inlines the function, folds 'check_interval_ns > 0' to true and discard=
s
> > the else branch holding the 'pause' as dead code, so the bad instructio=
n
> > never reaches the assembler and the build happens to succeed. At -O0
> > there is no inlining, constant propagation or dead-code elimination: th=
e
> > branch is emitted as written and the assembler rejects it. Builds that
> > select a debug / unoptimized build type therefore fail to cross-build t=
he
> > amdgpu tests for non-x86 targets, while optimized builds do not.
> >
> > Define a cpu_relax() helper guarded by architecture, mirroring the idio=
m
> > already used in tests/kms_cursor_legacy.c: __builtin_ia32_pause() on x8=
6,
> > a 'yield' (the equivalent spin-loop hint) on aarch64/arm, and a plain
> > compiler barrier elsewhere. This assembles on every architecture
> > regardless of optimization level.
> >
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
>
> Sorry for missing your patch, it looks like it was one solution
> for recent compilation problem on ARM-based hardware.

Right, it is to solve the same issue as discussed at
https://lore.kernel.org/igt-dev/81a6187d-0454-4188-b655-e3eee2063a80@amd.co=
m/,
which proposed to just remove the block instead.

Should I send a v2 to keep moving this to cpu_relax instead?

Thanks,

Ricardo
