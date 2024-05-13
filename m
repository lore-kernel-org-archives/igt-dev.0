Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384D4C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 21:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C1610E9A2;
	Mon, 13 May 2024 21:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nddm5023";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B922210E9A2
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 21:48:49 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8VLe032227;
 Mon, 13 May 2024 21:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=56lGQBoaLtpwGRIyeQH9+ommeHUgt6VnyBX9xuTBseM=; b=nd
 dm5023200VkRKAMLcUDYrYymvsS6Wy9LIECUONHOK7N+NAy41GjRZK7ZaahEH+JA
 Futl0TRakrVbYXFqQMM6G+scuV6iWBC0sCl0Rb6okiK7A/JKyRHWm7lMma4N25f0
 aLCGJfDA7orvY0G9u1S/MLwH7Ev3yGjaxdqlIGlnjFPmGqU6/SziotOKpfO1siDT
 Uh217W7q0huYP/KscAm3uckmyzd5BhaLAJ3ymi5tjpYSHc4l3Nhk7roh5pL0iTVT
 Ix5Ls9XZttUgTQnlMZPlR/1bUwwa/7ZkLyiSV1iYLAmR3i/6pcBKmq0tob7VyfSc
 jKXAmy9XYZYMMThhfUdg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1y9kvpjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 21:48:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DLmkr5004421
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 21:48:46 GMT
Received: from [10.110.76.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 14:48:45 -0700
Message-ID: <3b525e79-8387-9cbf-7e96-8092ffc757a8@quicinc.com>
Date: Mon, 13 May 2024 14:48:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] tests/kms_writeback: refresh to expose writeback output
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>,
 <harry.wentland@amd.com>, <hersenxs.wu@amd.com>
References: <20240513213041.583437-1-alex.hung@amd.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240513213041.583437-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hniOR26FL9M8YhejJTUnh_5QyMefe0AY
X-Proofpoint-GUID: hniOR26FL9M8YhejJTUnh_5QyMefe0AY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_16,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1011 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130150
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



On 5/13/2024 2:30 PM, Alex Hung wrote:
> With dc2d7fb4f978, all kms_writeback subtests are skipped.
> 
> Refresh the outputs to grab all supported connectors,
> the writeback output that is just enabled.
> 

Can you please help to explain how the tests are getting skipped due to 
setting the client_cap?

And also why calling igt_display_reset_outputs() is fixing this issue?

> Fixes: dc2d7fb4f978 ("lib/igt_kms: move setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback")
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/kms_writeback.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index f89b2d62f..4c54f3b89 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -572,9 +572,11 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>   		igt_require(display.is_atomic);
>   
>   		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> -

Is this part needed for this patch?

>   		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>   
> +		/* Refresh the outputs to grab all supported connectors.*/
> +		igt_display_reset_outputs(&display);
> +
>   		output = kms_writeback_get_output(&display);
>   		igt_require(output);
>   
