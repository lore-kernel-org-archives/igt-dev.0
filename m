Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3F5606A326
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 22:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JF0ysYIr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IiLF09nJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B265E10E317;
	Wed, 25 Nov 2026 22:00:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C478810E317
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 21:59:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6APJgiQd1138119
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 21:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2kLYOxSEXpNEeX5lRspD2fbNHe6GAwVqzxZ2sW3ciB0=; b=JF0ysYIrOJmo3DoY
 tHX7Tt4BT15Q7F3uad3FrGhwWlGr10QO5vlVa87Ml9Lfox4HlyQwhbOCyynpAQ5e
 CY2Fm/VQ+LvaR5paPS/qfaEXFZ/x8puXZg6RzKxA/z6iW6FtRXYhz+VWuuO0y3VF
 VGPcynXasd+/W0fPFLmaNNVfi7o3//6fw2qmEc4oFJHKZuxjheWL10vUKHO8vC1s
 BBJM+lGnsVW/xRIf7QeNBfl2+zTr9qN0ECOth7q60m+WnyJBHMNo7xQywqQwEKvt
 qVSmXC2u7am0+6qKATHqYHWO98sd0M/s5f2AKaRZRhnhKtg+/Ye8sutnzBGu2rj4
 w4LDKg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662s8cfy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 21:59:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-1b587ffea77so700550c88.1
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 13:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795643940; x=1796248740;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2kLYOxSEXpNEeX5lRspD2fbNHe6GAwVqzxZ2sW3ciB0=;
 b=IiLF09nJBIQHXAEVykU4yo2SjGTcP/AwqA0VZH6/7jWEbXItcx61sVxxSMgfvTFMhf
 4h8/7AXsoud1gSaVjyizDdMSfinJImXXYQ9ll3eIH1DV56IenTjbVCLxoL1lNIg59EHu
 pHLGhteSBYlZGKLEpxIz1jtJk+a0xVhjeL10K8t/Ga6YdmP/L1Ee6jI73qI7GNOV6Bmq
 /0FUFfF6qWUnNqfPiF3r+c6PgAgK6Bqe0RI3JzaMQAg8dUQwBBZFxLp3ojUlZm0vZ6sI
 +5lXtAwbNRLjnKYf7udI8Rk9VO2zB5Bme2xfqiwIl8BD5lC/kLen+3I4gj5/jxCvg/uW
 hm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795643940; x=1796248740;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2kLYOxSEXpNEeX5lRspD2fbNHe6GAwVqzxZ2sW3ciB0=;
 b=pXE4FbS1xiVa9ShUQi78I8QLkyf9AM1AXvH8DgMAL8ez5TJJb1yEdjD6LF41L8oaV7
 9nVuQjobAo77fjcauxi47hkIwYvueQCwQy3aVvsRCNCesbEWqEN20sAcyjeVjb3J/G/1
 y8epnZccfCBV/wb7HRs2xj5ytdTiNOBqygLtsdhXGSqkrjfUqvLl79dquL5lgd7sDrX1
 ijFvb7oBqhJ5F084OESVPggzjSHIT3Uxj3ny9n0feu1C3LEKoH1LZ6TaCw783BMl4Twd
 R9HsMh6RFYo6U1npz2kf0hlx9uFon8O4Gt5/Ls6lIEHMenDAJ9Xx+zEr2KlOZOCoXncY
 E6gQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFpUEi4+zbKxpb2ThUUrRnLwV6S76FddC+9LS9KtmScmJ88LUR+Je1794sK/v6qsItBo5nDfiuo@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9g93hnmn9BffVad+6QJFcQiaa/UyBHpT/Tcjaxn/wJnIw+qPVV
 fxdupVcthKXEyL+pRH2fO0WGXlHLzinpWxIe5RTkxnyXJAV2p7f2yz9eUP3oovPNZtL9JfgR/jx
 HL5Bhx4z/ufXUF7PtEy4DUhn0zJV32uERWaUbfpSYrJArsMmr+dCs8AaqG/ljTLTycyWZ
X-Gm-Gg: AZFdTZe+M6dEldDAkr6VzDh5k+Rpvzo9ioPKLrq5SGqXJWFCygnifoGhBOaKRPVJfIh
 26oXLwEktc2penQ1CS53fWc7DvrH1h9P2d6K+/5bkVjT7Oll0f3Wpli1vVukOBMrNp6+sSYXQdU
 UbpM9zxrfBLhPsHSpKDzANyj2TYGh+2gv3r9jvJ3D/Q9aXiszibaVXP0SNX/y6SRwMINNsRUpSM
 30qF4lyWjcg/QMjdHd06PxxARQJZHw3anVp7WyfVvLhzWxCrNiEe8tdLlVVCe98tJAknIuhTUSi
 sMxI2Bc2IlVVcYkA5pTZVkZyL3iEnGgEa7BVwWmjBXKi6qb1SxIh33IULESfqJFbgm6A3jNo60k
 H28dYFEVnPhGY+zdqvo22cbNQmgII3u+WISyvUR4p/yBV8hhDq6GxUSbtkJi+6yG6rRD7yz57dT
 bOML+8V4mZKr4au7evto37oT3VYBzu0Xk=
X-Received: by 2002:a05:701b:4503:10b0:1b5:86ea:6c01 with SMTP id
 a92af1059eb24-1b586ea6dcemr4223896c88.5.1795643940032; 
 Wed, 25 Nov 2026 13:59:00 -0800 (PST)
X-Received: by 2002:a05:701b:4503:10b0:1b5:86ea:6c01 with SMTP id
 a92af1059eb24-1b586ea6dcemr4223866c88.5.1795643939286; 
 Wed, 25 Nov 2026 13:58:59 -0800 (PST)
Received: from [10.226.48.50] (Global_NAT1.qualcomm.com. [129.46.96.20])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b556840494sm44857169c88.12.2026.11.25.13.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 13:58:58 -0800 (PST)
Message-ID: <120b2a7a-b96c-495f-a318-8e5f30c010b5@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:58:57 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Subject: Re: [PATCH i-g-t 3/9] drm-uapi/drm_ras: Sync with kernel c95c93b6e26c
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
 <20261124213532.3674338-12-rodrigo.vivi@intel.com>
Content-Language: en-US
In-Reply-To: <20261124213532.3674338-12-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b075a24 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=gwNYrdjX_Drv5Ma7rbgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: oKzY3xDIH8va-RRFfRdO7d4m9A_5xfBH
X-Proofpoint-ORIG-GUID: oKzY3xDIH8va-RRFfRdO7d4m9A_5xfBH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA4NyBTYWx0ZWRfXwzxyp8lb9xOb
 EeclUcUIb7AaF7Sv0363WkHeBya1tjzs5ZB1NG8yodwHa6BiXIBQF/eXfc/yCpXCdj9xUvTbTUU
 Y4UqydZImMXrw8fBbDydtobWOR5YIPAZAYK56x5q5/LfBXrHfaPQVKfkFMUqN+g1TmlYDLSUGLl
 fTGsx8lm+2EQsd6eHcOx7/ABXbHj3ZMwlEP4NmxfgWBijWncbUZWw4r62n2WAZZe+MfD+I0ipuC
 jFQXiYv85Fz9L9RCuS3t2sqOjIdB9odLD6yIEPIRU4re2K+rSFN3plW8KOwOCEFA7DqObJgE3wO
 PiSLpEfn+/OA2J9nHiQPACGxYKu7C7YQ43drXJPDL88haDqYYpVKSYTAzoK4rxqFU0DVF9AlAkR
 3T+C9cdqM3cBpdsxgsvC82NYySzUtY18hS/KSoWQKWKjK3CdR09M3CHAFYl235vukE/7TF15t0h
 UWT++Gb6+oIWqBriDRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA4NyBTYWx0ZWRfX1kIsX/KuQAZi
 KSRvp63tGC/Kdll0/4pxdhZzizf3vVPg2vIPE09q5eN/JZ/1+xHP+TL+hPj7zJjb7pOF1Z4hLBO
 0gieV1kTsHUKy5EhGGC+rNOxmSiXWX4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250087
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
