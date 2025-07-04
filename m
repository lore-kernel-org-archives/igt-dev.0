Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAC2C8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 07:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B183210E282;
	Mon,  7 Jul 2025 07:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kg4ejyYX";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3D510E346
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 16:15:43 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564F1hs7029558
 for <igt-dev@lists.freedesktop.org>; Fri, 4 Jul 2025 16:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=Zfi5koi+JzSrlUxe/eB/uH03edlTdfD1c33jiELZQ+U=; b=Kg
 4ejyYXLxRSq+6ufHA/RnFR2EvNTmeOFpfThLgsUOQyj5YSSAM4Uy2QQAcFf/Xd+s
 VNjucGys5m7xdaqImxsxOtowaKDPpL1tTIo87C7AzwXa/Mn0brlQQ15OMULRzSDq
 qqrt8DS27YChhY7m396qWrV+K6skUhAJayxey97hJ+JnebFFUaAaK3tgxGD9gGaF
 x1yfAeN/nS/ySQc7KBDmqFWe/w1+tS6KDBSJUoDJjNdoUAKur6XZM4FRBEk+OFEV
 5eEvsHk4pUJ25KxvlRDF3GPZm4M3jvdndkHcNoISbpn+hQJnGUJL4nDPcaoXKb+g
 Y06fU3wD6ovcezZLFdvw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s5w1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 04 Jul 2025 16:15:42 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-40d04995b67so272801b6e.3
 for <igt-dev@lists.freedesktop.org>; Fri, 04 Jul 2025 09:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751645741; x=1752250541;
 h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zfi5koi+JzSrlUxe/eB/uH03edlTdfD1c33jiELZQ+U=;
 b=eg0KIp7MTDQop4y1zQDaqeZPRveDor4ma2j6yVMxGtpHBl2Xc2Xd8Dc/D5Tf6lySJ3
 1IKx1OgYMXIagOZRVFs317YfDRgDdSOgTOQtAHjaIyKXCOFIHxi6RP4bR7/CyxNBc7KE
 MEQ2uF7C0yUUnNJZiUAWnxEHojqynSbiv10k+5dtXVijWX0ymiuRJVOMzkNh77J6jJw+
 0A8GNXfKXTnN3hCWtOuCmIZVesw3VOSagAiqEhhDFh61JYkUZbOl7Sx9NKI1e3QfqX40
 yWOVgzKJynzdOWZDPXkMYNFyUzeuiNgl9X9kpiRBhn2myeCYtzi80YJzY8OMUGK+8gsI
 EGaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvHQnCGcokgKLUYw8JiJij1nTgZbUEHrnNpnHTLiaJ3vQBnOzYw3s8h9SvtmDOODVTfuZm651z@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsNKNa9rKorTUB6YlgmU4xbBjsFMoVDAAdxmxpJu90OeyWUOXK
 7zqzHUhupEMgEZD/EYpLTr25yKyreKcI1Cq/UKaT9Qp1gJzmYpApJR9Ume5Q/rjHnW9KwjIjdn7
 eOvtWfZX4xP/6eKtR8DmaETb335nQbDQKIdkM+P61YtsEIM2nR6bOE4ejO5g4c/lfW/3gKFxXBZ
 2ZjiNVcegNBlXXntVb5qD4mlYJ4CFbdkO+9MlM0uJBZLQ=
X-Gm-Gg: ASbGncs/trz9G/Gs5Kkj2QrhdGtupRPHMOboLd4ZJswewgmKgMGHzSQv0VgbuvZn+xM
 X+kjcCTtColB+SEOcPuu5nppp9RpK4Bpfx5zn/58jI7v1iiMZhPJtuRBZjtB7TVri/MhQYESbDC
 F4o/LRAIp83hQuQR1QnO5VqFI8zdOAiSjvk7A=
X-Received: by 2002:a05:6808:1b25:b0:408:fb4c:859f with SMTP id
 5614622812f47-40d0448d56emr2508447b6e.38.1751645741254; 
 Fri, 04 Jul 2025 09:15:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx8txNhErOqqsLdUspkv5bdmjMfqA/P1vHiKj8V0z+kg77onhz0wanDNjFgM0iHk4KRHQariXUOFXbvY26ScA=
X-Received: by 2002:a05:6808:1b25:b0:408:fb4c:859f with SMTP id
 5614622812f47-40d0448d56emr2508426b6e.38.1751645740816; Fri, 04 Jul 2025
 09:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
 <20250704161100.k27itcxbiprtr3a4@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250704161100.k27itcxbiprtr3a4@kamilkon-DESK.igk.intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 09:15:30 -0700
X-Gm-Features: Ac12FXyCNIFU3lZRjCOSHzDv4xJuykkPHJVK8EjFjchAv8f7DUIddJbTKOaGCHo
Message-ID: <CACSVV02N+nY7ZdnAMBn7dLsdJx3kXySfnp2dEJpMKr-u6ZeraQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 0/9] msm: recovery and mapping updates
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>, igt-dev@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=6867fe2e cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=QyXUC8HyAAAA:8 a=k485oyZX0DvZ86tFK4YA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyMyBTYWx0ZWRfXwLYLK15t1RCO
 u8nmV+qeOytGzuxheQQln7oPe1Gtj6BBoW9fAFs1qPuOhr1c4wUvOgme0L7PVit+I+uhjIkAAMA
 9oIVu7Y3CnrQ7vbfub+UIfTusx81SSxadxTnoJTIgAqRWzX1MfnJN5HwODA+5DGWjUPwvo3zy0C
 /90NjlRfwwtD7tpr9H73/BB/KXU7w1e/aTw2Nck6fVYz7pKNXJoFD6Tx4ULDlTFILJRlGp/GceW
 WFTRABNvlJw8ESgFth85qUE4GIm47045j61cIRzqoj4dU+MWcO48Z9D56/w31SIirF1D2/3xIDr
 i1YFBZovEoDiJg6tPu9fioad/4RYI9HdE5sK+UgkEitcgHPVybBVS6oZn9/SQilRXXaJwyNt5vr
 mwiFoy4jcDJTpBcgPbsiHHgM0cCaEEAD2PrGkLGEqBtu5Kc74JYlY6w8FZM9MyqQYGOJs1nS
X-Proofpoint-GUID: _CFBPHWAGHEbNWzBdEMWcaOpB6ubaI9r
X-Proofpoint-ORIG-GUID: _CFBPHWAGHEbNWzBdEMWcaOpB6ubaI9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040123
X-Mailman-Approved-At: Mon, 07 Jul 2025 07:48:33 +0000
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Fri, Jul 4, 2025 at 9:11=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2025-07-02 at 12:02:40 -0700, Rob Clark wrote:
> > Mostly updates to address flakes, and updates related to newer kernels.
> > Plus a few additional sub-tests.
>
> Thank you, I merged it.

Thanks, I'll send a patch to uprev igt in drm/ci

BR,
-R


> Regards,
> Kamil
>
> >
> > Rob Clark (9):
> >   tests/msm/msm_mapping: Fix memory leak
> >   tests/msm/msm_recovery: Wait for devcore
> >   tests/msm/msm_recovery: add iova-fault-stress test
> >   tests/msm/msm_mapping: update for sparse
> >   tests/msm/msm_mapping: Handle BO names with spaces
> >   tests/msm/msm_mapping: Add additional subtests
> >   tests/msm/msm_mapping: Wait for devcore
> >   tests/msm/msm_mapping: Handle larger gmem file size
> >   tests/msm/msm_mapping: Add wait for stall-on-fault to re-arm
> >
> >  tests/msm/msm_mapping.c  | 93 +++++++++++++++++++++++++++++++++++-----
> >  tests/msm/msm_recovery.c | 38 +++++++++++-----
> >  2 files changed, 110 insertions(+), 21 deletions(-)
> >
> > --
> > 2.50.0
> >
