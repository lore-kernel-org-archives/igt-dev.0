Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4103AC25B78
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 23:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF93510E336;
	Mon, 13 May 2024 23:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="P1fDzfZT";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE4810E336
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 23:09:44 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8VFU032118;
 Mon, 13 May 2024 23:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=kQAfcInk0Bfa958RG2Cf9AeXMKiCfPeJYyRIzE2cJ74=; b=P1
 fDzfZTr283X3DcEC9JR5Li0D47a9sckTt/qmFRH0cw/MDpRT8hR946v78jenPM9p
 6AjgXMxxoG/iGQimoNAxKbJOTOHr++xK8XtxhMMiSoJkOGZp7+RcjyFUuMW+mTa6
 YIgTI8LlHHwvZZx9YBK2ysKCYwWXYOX9ZyLurFW+PI+LjlY+SLKBV40kVDDObZKb
 H/Ep7zUoz6G39HS6zc+KgLWoeH/oWJcq6zg+pma29fDRCHtj0HnuaklbiU9QM1Qp
 qewrb8iqfci+tvL8EWXnQfK3c1A6WyJgEt9X9V2+x1jjWXeqccLXcMVhQhmbWQb8
 P7as14064V894M21OYXA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1y9kvtcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 23:09:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DN9ejV017355
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 23:09:40 GMT
Received: from [10.110.76.247] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 16:09:39 -0700
Message-ID: <c64db5fb-3e3a-e3d2-3c40-18df8e84020d@quicinc.com>
Date: Mon, 13 May 2024 16:09:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] tests/kms_writeback: Set atomic and writeback_connector
 early
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>,
 <harry.wentland@amd.com>, <hersenxs.wu@amd.com>
References: <20240513230356.695515-1-alex.hung@amd.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240513230356.695515-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: sbLg0CnkdzCSmcO1q1KZVH2JHLafzoZ-
X-Proofpoint-GUID: sbLg0CnkdzCSmcO1q1KZVH2JHLafzoZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_17,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130159
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



On 5/13/2024 4:03 PM, Alex Hung wrote:
> With dc2d7fb4f978, all kms_writeback subtests are skipped.
> 
> DRM_CLIENT_CAP_ATOMIC and DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
> need to be set before igt_require which initializes a list
> of outputs including writeback.
> 
> Fixes: dc2d7fb4f978 ("lib/igt_kms: move setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback")
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/kms_writeback.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 

LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index f89b2d62f..65d4db26b 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -567,14 +567,17 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&display, display.drm_fd);
> -
> -		igt_require(display.is_atomic);
> +		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
> +			display.is_atomic = 1;
>   
>   		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>   
>   		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>   
> +		igt_display_require(&display, display.drm_fd);
> +
> +		igt_require(display.is_atomic);
> +
>   		output = kms_writeback_get_output(&display);
>   		igt_require(output);
>   
