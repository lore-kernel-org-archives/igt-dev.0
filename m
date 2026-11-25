Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2563606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aPgST9Hl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2V6UEZA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9571121B5;
	Thu, 26 Nov 2026 08:50:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D0C10E34C
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 21:07:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6APJgkDM1138127
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 21:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2kLYOxSEXpNEeX5lRspD2fbNHe6GAwVqzxZ2sW3ciB0=; b=aPgST9Hl0Ty30izr
 F9di/B/I+n4PwsJ7M2tpyj5huM4ypbl7ZpOjf9B6wk7i0xXt5LfhgkwaZCFm3cNo
 +2Xjuhr1xJTxDY5IlQW1nAtdpparmqRMHgs8l/cdcgwCI8H39MK/2xSwQspp8Y3C
 3OvPkksJlyIMz9QlzjXQrUgN0GfZmgkdX11N3WE+Y8AK/muaJJTRdYAqhryMZ4qM
 LRyyf64XyZ5Eu3GcDvUNRPvD9Kp4z1q1AOood2Y0HTrHzjk/cNLU6eKrc7cH5h4Z
 xIviuyt12UR7mi+RuhLgZLIxc0GrfQeIGVF+fy7hxo5crW6fWwzCqDn210osvaSp
 DYmB/Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662s881c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 21:07:46 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-154e9d2d94fso1740141c88.0
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 13:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795640866; x=1796245666;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=2kLYOxSEXpNEeX5lRspD2fbNHe6GAwVqzxZ2sW3ciB0=;
 b=O2V6UEZA4ql5hbra08AKh+6q4D4SKllvamGXvQqzUDMbhngHUbWfshc84Wi7oAcu7m
 Zdc8cdCEWm95Lz+2FeXij1+72L8zoCbSU305BgcfCaHPcZ8NdMyGWwSTcZsDnYcPdg5J
 5rmyoWksefapbkK5LkytTcU8k66tzBMXhX3nFCrQ2s6dDqUn1ej9cUTWSI3bsjs4Rdy1
 +LgmWJ8ssAprkzyrIc1OYNmq9+O2YhhbQ06OKkBLS7/bfps0xNrj21Ynq6GCgMYd1t1H
 Jl2nSr0M8g1ksuZVcuVUcbjz1G8tWra7ABVcqSbwuFmnrQ35D6enDZIl4jA6AQFs7QSD
 jZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795640866; x=1796245666;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2kLYOxSEXpNEeX5lRspD2fbNHe6GAwVqzxZ2sW3ciB0=;
 b=BuGcns+zBRgKsib7v+PadqQYCuTwH54vikWS5Q2rcVkK+ui0GQdfkt5yQlfQBlQbIP
 6noqzZ/zIO+Bcqa+RaGpfdKIIFVmRUkjsli00s3aX+F+YBkFs+qH6kko2h1tDj6H1ygo
 VMzZnKkjJDu5PQ4bjnz1p1Ztmlp6MLWeETirDNrxYMOJ4mcJjV9KxewiG530yvXfTc8l
 UpZVs7DH7FhS43Z2lTlQT0uh5VcYIQDQU2LIEYEAfBJAAlYwfTjvE/LYi9Qzvx46nY/O
 s2U3jkz9Z2vIN2+jBGQEZPDvWMweQi3ySo+UYKvIl2B6zzIftAd/KmSKKNIL3dXjlk7S
 ygmw==
X-Forwarded-Encrypted: i=1;
 AL+hErGF5TaBB56Au9EQaSNPGQ1O6A7v2sEzXcvmd5lFMgULOabkMVZHOfs8fARraf2+q1SkkLr7UqOl@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/80mcDgd/077+j6G3aRfpLKVPdPwZrFuxSQ9JNtthuXSC2bjLM
 /0T2ZXH3BBBLloodkeWd8/bTcshm1kA+Q8Ea13dfp1uYZ6RpxyM7KvSg3PBtQhu8+lxIXkQx3AD
 pTxwldJxse3Q91awEIIU9ZgUwbW8ydE+Ow8skXk6WFzStAPAVN+9ahwKmLQ0c7vuZiT9O
X-Gm-Gg: AZFdTZeUlTT0eZsq3suK0bB3sa/md7EJki2CyNjl+KoNd3zCCWYuZyaEQXFiEild03O
 DL6W/PLqfJrzP1cM7lX5+cu1VrCvrsL+p797yXXWUyIb68R7lCilaYglMrBWBRGWEs+AJh0bmVO
 Lq5szrFtejbghYLTthSpjIX0KoDq0S5jFzEXuGmNZS5cITcr5gRCl7Z8Hq9PjvQmamF/ESBe0+U
 5/MUrKynXrS0lt/1WUKELpxy4xjo95v+EHg/d4MTnfcyHKX3bD7L03aC+R4016UXh6RNMyAWrpn
 jRhE7khtWxcE319N8J9NG4oR2ndwMGlyLUZec57icGT+wUMhkhIzasNnvDwi0+51BiQhvYzL74t
 2Ha0UoC1iRU2XWUhauNzgRFuD2Hccji9RZsKf3BllRXY0iW76UXo59nhM2Ta3nEla2LY4Q+WWt2
 33MHaZF8I/9cu4rYCPo9fSdImLLFVgSpc=
X-Received: by 2002:a05:7022:38b:b0:1b5:2dce:1b6d with SMTP id
 a92af1059eb24-1b55689ab30mr22931016c88.17.1795640865815; 
 Wed, 25 Nov 2026 13:07:45 -0800 (PST)
X-Received: by 2002:a05:7022:38b:b0:1b5:2dce:1b6d with SMTP id
 a92af1059eb24-1b55689ab30mr22930986c88.17.1795640865074; 
 Wed, 25 Nov 2026 13:07:45 -0800 (PST)
Received: from [10.226.48.50] (Global_NAT1.qualcomm.com. [129.46.96.20])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b56ef9fd16sm33942193c88.4.2026.11.25.13.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 13:07:44 -0800 (PST)
Message-ID: <02d226c2-15ce-46ae-aa64-4b635cb6af4a@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:07:42 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/9] drm-uapi/drm_ras: Sync with kernel c95c93b6e26c
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
 <20261124213532.3674338-12-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <20261124213532.3674338-12-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b074e22 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=gwNYrdjX_Drv5Ma7rbgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: C4BQ1V8IqSGDPANKPnye8ghcVY7uRFIT
X-Proofpoint-ORIG-GUID: C4BQ1V8IqSGDPANKPnye8ghcVY7uRFIT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA4NCBTYWx0ZWRfX5OGsz0iDOfac
 m9sqA5hTS+XU+vSFR5BpWl46WDchO2AGM5Rd9QtUneDAIJtw5ZMMRI0l+WMvUGtYMzlsH0hh6ki
 dmstEEjWaalZbshByzGqDbvusAA1/5G+yr0axegj70EDOpGLT2m0tX9ICZhpWFKIYsBSVLxgED9
 h57wVWUWxxb0wVXuIhQ3eBN3PTQopSH+moNT3RKeQACpuTQ0AItCT3dmHJlMvN7jpangxut0uwu
 J9/IJgMCGRFSC+0HfYyo73vj8SU3CQTtB6KF8/d5+73JilRd8vlLffRcsTpdRCAqFuu/KQ4CyXr
 N75bLwGvcLm4r9oZeLAzG66L+fYVwIF8ShGg4wdOkIoLGRnIb7STYJQv+zDO60rsWkbe2DW4yKY
 43ZI2Hheuyk4FqMc3XTGfoSpvdrteZsmvGMeQllMbacyUye1k+UMsXbh+WkttPEty5tTFNvosgJ
 cgPPmZOioNvPq5oRvww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA4NCBTYWx0ZWRfX91itdSyX25Kl
 1DNsg7CBJmj+9E9S6Tp1bqvta2NXwveP/49GB+s7nU1OyshjuTsxgS80ZDIrdLEl/YEUsDh6vLS
 2UoBZA4uUb8oQ8rX2X4VpG80yr/sYW4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1011 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250084
X-Mailman-Approved-At: Thu, 26 Nov 2026 08:45:46 +0000
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/24/2026 2:35 PM, Rodrigo Vivi wrote:
> Sync drm_ras uapi up to drm-misc-next commit c95c93b6e26c, this will
> bring the following change:
> 
> c95c93b6e26c ("drm/drm_ras: Extend DRM RAS interface to include
> telemetry nodes")
> 
> Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   include/drm-uapi/drm_ras.h | 44 ++++++++++++++++++++++++++++++--------
>   1 file changed, 35 insertions(+), 9 deletions(-)
> 
> diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
> index 54a4cf2e4..56e0588af 100644
> --- a/include/drm-uapi/drm_ras.h
> +++ b/include/drm-uapi/drm_ras.h
> @@ -1,20 +1,31 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2026 Intel Corporation
> - */
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/drm_ras.yaml */
> +/* YNL-GEN uapi header */
> +/* To regenerate run: tools/net/ynl/ynl-regen.sh */
>   
> -#ifndef _LINUX_DRM_RAS_H
> -#define _LINUX_DRM_RAS_H
> +#ifndef _UAPI_LINUX_DRM_RAS_H
> +#define _UAPI_LINUX_DRM_RAS_H
>   

These header guards appear to be from the kernel source, but the README 
specifies that these headers should be updated via make headers_install 
first, which has the old _LINUX_DRM_RAS_H guard.

Otherwise,
Reviewed-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
