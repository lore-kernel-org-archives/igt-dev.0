Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B163CC48BF6
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 01:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2BE10E070;
	Tue, 27 Feb 2024 01:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OxFcMUgA";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B7C10E070
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 01:04:53 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41R0eZkH020146; Tue, 27 Feb 2024 01:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=nF278DFeduv6hGu/YrZMI9BXOKABokJNfXhsCoKH54k=; b=Ox
 FcMUgAmuV6TmUDe7kBO27BMp1BalrBg+kQF+ioloSxohE+lkIM1j8SbJ0goqaeu8
 F8p9+pb5juuvWx2nRsicf5gDGEMbaTyfSpb1A4QTncOIwLLumODgPQIWXqSCOLlg
 Y9+FAvLxdwmqt8IOtzhj/d8IFjcd/RTJnhE6zLiIEFX+XxyGvD1BUb7cms9jxqDk
 ERH+h+5sJdrKiDrNkHOyGJKN0Pi4cuyJ9X7kVRCM/J3ws0jwV94HU/Yx6WWynldf
 XnAIwC9ThfGzN4MB95y9D7/eKqNNbtEWgnA0Z8wPnXWI5VeI4/RwhK/irJMh/IxH
 jNuHWj/TDV6JPXdzGd/Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxnah7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 01:04:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41R14oit023798
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 01:04:50 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 17:04:50 -0800
Message-ID: <5586ea0b-d9f7-43a3-aac8-493aa9e22b2d@quicinc.com>
Date: Mon, 26 Feb 2024 17:04:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/kms_bw: Use reduced blanking mode
 1920x1080p timings
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
CC: Rob Clark <robdclark@chromium.org>
References: <20240215221900.327042-1-robdclark@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240215221900.327042-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qZwA9zcuK6poyVA4O57hSu9HOu1b2zP1
X-Proofpoint-GUID: qZwA9zcuK6poyVA4O57hSu9HOu1b2zP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270006
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



On 2/15/2024 2:18 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The previous timings don't work with the ti-sn65dsi86 bridge that is
> used with some of the sc7180 qcom devices in drm/ci.  Let's switch the
> timings so that we can get some kms_bw test coverage.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Hi Rob,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # Trogdor (sc7180)

Thanks,

Jessica Zhang

> ---
>   tests/kms_bw.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index dd10d640dc13..f1d2a1b64577 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -64,12 +64,12 @@ typedef struct data {
>   } data_t;
>   
>   static drmModeModeInfo test_mode[] = {
> -	{ 173000,
> -	1920, 2048, 2248, 2576, 0,
> -	1080, 1083, 1088, 1120, 0,
> +	{ 147840,
> +	1920, 1968, 2000, 2200, 0,
> +	1080, 1083, 1089, 1120, 0,
>   	60,
> -	DRM_MODE_FLAG_NHSYNC,
> -	0x40,
> +	DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PHSYNC,
> +	0x48,
>   	"1920x1080p\0",
>   	}, /* test_mode_1 */
>   
> -- 
> 2.43.0
> 
