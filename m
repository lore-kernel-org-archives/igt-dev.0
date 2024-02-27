Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8832BC48BF6
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 00:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265D510EE72;
	Tue, 27 Feb 2024 00:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EqnwlOB9";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8A510EE72
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 00:59:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41R0hoeV027343; Tue, 27 Feb 2024 00:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=F5qlJc13+J3FWUbWUXejL5FoSkb1bkelMtPpvO3VkkQ=; b=Eq
 nwlOB9O6gzcBsT9HFPNxgdVfOgWmN+j4E0CG+ArYAMvP4cZXY++Ag4jSZo72aFZO
 RtcgetXvwBjIg/tsbjABqbdAZ/P0/QXGgAvjJ07DvoUBq+5859DXoWpO/MqbJ3FU
 /RJ90t70Udo3LSTOEqs8ezyGZEikccOa/3ODSMTsOGgYq9+y7enf219JUjV8GVPK
 /kHSep9eMMAVVWnA4WYQp5xfsxG3pDWmf33pjVAQs3rC9ChwLkNBRNBQ8LtL+CqV
 kVL/kiDMrss+6PYNATjOeYqm8ruCY9fE3ucS0cIA6fyM9e5VwDjsMVK30wA5FTbn
 QIsjJjbjBycJbljHY+Aw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxnagwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 00:59:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41R0xbml019610
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 00:59:37 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 16:59:37 -0800
Message-ID: <da5e3fbe-2c02-44a3-92e5-b66b268e4342@quicinc.com>
Date: Mon, 26 Feb 2024 16:59:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/kms_bw: Add 2160x1440p mode
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
CC: Rob Clark <robdclark@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
References: <20240215221900.327042-1-robdclark@gmail.com>
 <20240215221900.327042-2-robdclark@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240215221900.327042-2-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: v8_fr7svuJWS3glxpj7RcqoVvRuLxLxX
X-Proofpoint-GUID: v8_fr7svuJWS3glxpj7RcqoVvRuLxLxX
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



On 2/15/2024 2:19 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an additional mode so that we can get more kms_bw coverage on
> sc7180.
> 
> v2: Add missing comment listing subtest name
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Hi Rob,

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # Trogdor (sc7180)
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   tests/kms_bw.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index f1d2a1b64577..96b19199d4d6 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -47,6 +47,7 @@
>    * @1920x1080p:       1920x1080 resolution
>    * @2560x1440p:       2560x1440 resolution
>    * @3840x2160p:       3840x2160 resolution
> + * @2160x1440p:       2160x1440 resolution
>    */
>   
>   /* Common test data. */
> @@ -91,6 +92,15 @@ static drmModeModeInfo test_mode[] = {
>   	"3840x2160p\0",
>   	}, /* test_mode_3 */
>   
> +	{ 207800,
> +	2160, 2208, 2240, 2340, 0,
> +	1440, 1443, 1449, 1480, 0,
> +	60,
> +	DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PHSYNC,
> +	0x48,
> +	"2160x1440p\0",
> +	}, /* test_mode_4 */
> +
>   };
>   
>   static void test_init(data_t *data)
> -- 
> 2.43.0
> 
