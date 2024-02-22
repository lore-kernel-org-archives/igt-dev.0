Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02578C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 01:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F89110E76F;
	Thu, 22 Feb 2024 01:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mtNh40Vz";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5C210E76F
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 01:14:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41M0HQOx026200; Thu, 22 Feb 2024 01:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=KVlgXk+bQhmfH/8gvqs8DXrnx1HZ7SZCjS/t9P2HkjY=; b=mt
 Nh40VzUuqoYEOzHdCN9MKDGj9X8w57TYB6BaxW3s+BSbhUQ3RcH1lOuR4CTunSwj
 8MmjLJ9xoKRlxR36TKfroHaXqvcez/k4HpK04NV92wsixeUQSpUEhugcBgzfnp6e
 TYHCN8LtDUOX25MTaQieHT11F/sJm0AdBDsE+/sReyi445/1BiGI5xIXIFAFqYVy
 wOsh5PvibtrVySoWVV9IfOWpTWdd6BtU8VSxMOrYFzaY4g0iX4KbQ4pgOMZxY9JM
 PH/pJZZEZ+1bf9P4ykl4RMfZGB01RMpkzWC551X0NcvHSrdpBpyiBEhmF9qEONmG
 OYbMLzKAjaaSHHogqq5w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdckva9eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 01:14:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41M1ESFg032427
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 01:14:28 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 17:14:28 -0800
Message-ID: <5486767d-9a2d-40f6-89fe-804e12446b33@quicinc.com>
Date: Wed, 21 Feb 2024 17:14:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_cursor: Skip unneeded overlay
 requirement
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
CC: Rob Clark <robdclark@chromium.org>
References: <20240215221957.327322-1-robdclark@gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240215221957.327322-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: e_H5fVHNwlk5q-foEvxXXFZsT9iD0sCW
X-Proofpoint-ORIG-GUID: e_H5fVHNwlk5q-foEvxXXFZsT9iD0sCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_09,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220007
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
> Tests that aren't using an overlay plan should not require one.
> 
> Some qcom devices only have primary and cursor planes (but those planes
> are not restricted to a single CRTC).  Requiring an overlay plane even
> for subtests that didn't need one, was causing all the tests to SKIP.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Hi Rob,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   tests/kms_plane_cursor.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index dd33d8129626..5b3cdc06901b 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -91,7 +91,8 @@ typedef struct data {
>   } data_t;
>   
>   /* Common test setup. */
> -static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
> +static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
> +		      unsigned int flags)
>   {
>   	data->pipe_id = pipe_id;
>   	data->pipe = &data->display.pipes[data->pipe_id];
> @@ -100,7 +101,8 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
>   	data->mode = igt_output_get_mode(data->output);
>   
>   	data->primary = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> -	data->overlay = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
> +	if (flags & TEST_OVERLAY)
> +		data->overlay = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
>   	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
>   
>   	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> @@ -123,7 +125,8 @@ static void test_fini(data_t *data)
>   	igt_pipe_crc_free(data->pipe_crc);
>   	igt_display_reset(&data->display);
>   	igt_plane_set_fb(data->primary, NULL);
> -	igt_plane_set_fb(data->overlay, NULL);
> +	if (data->overlay)
> +		igt_plane_set_fb(data->overlay, NULL);
>   	igt_plane_set_fb(data->cursor, NULL);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   }
> @@ -167,7 +170,8 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
>   	igt_paint_color(cr, x, y, cw, ch, 1.0, 0.0, 1.0);
>   	igt_put_cairo_ctx(cr);
>   
> -	igt_plane_set_fb(data->overlay, NULL);
> +	if (flags & TEST_OVERLAY)
> +		igt_plane_set_fb(data->overlay, NULL);
>   	igt_plane_set_fb(data->cursor, NULL);
>   	igt_display_commit_atomic(&data->display, 0, NULL);
>   
> @@ -333,7 +337,7 @@ igt_main
>   				if (!intel_pipe_output_combo_valid(display))
>   					continue;
>   
> -				test_init(&data, pipe, output);
> +				test_init(&data, pipe, output, tests[i].flags);
>   
>   				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
>   					int size = cursor_sizes[j];
> -- 
> 2.43.0
> 
