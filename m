Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECDCC25B78
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 22:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C3010E21C;
	Mon, 13 May 2024 22:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VOUFG2Bm";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52C310E21C
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 22:37:58 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ9TAB018893;
 Mon, 13 May 2024 22:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=K+ax6lW/Ys+q7iBVaDnqChm6mc4RkdbWCMyXvWd167I=; b=VO
 UFG2BmjsErFRVzeF4hxNqZDuno7sEYR2GhjI/BQhlGYxBqmQkkIhGQXBtE7AGZeI
 lngZMExBM2iSk5tHp+MQ/e+1D1bertNSlpokyaRXiqtyvAFGjSldYVw3qVqH0EDU
 cELxvq74wgidgFsRAGyL5sBkmrwFbVmzZZnIFOqGAQlVhPTWDcY9wC9W6cQT6e11
 qIluEgeB5PQxeT/V3Mw0YqNU+RXfi7P4Vaq2YGEBtozUqsXgWB6ymXwYB7YQ8ll+
 LX7doo7MYzOfJrjx0txyVHaXZIqGkfMGsf6oOi2PvgXR2wLnqgz3YXwc1bPvyA/m
 rgrLtTGyLXlgwDw73ZOg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y20w1vns5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 22:37:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DMbss5022422
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 22:37:54 GMT
Received: from [10.110.76.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 15:37:54 -0700
Message-ID: <5d2427cc-5ded-ea1f-abd4-f746576cee8d@quicinc.com>
Date: Mon, 13 May 2024 15:37:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] tests/kms_writeback: refresh to expose writeback output
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>,
 <harry.wentland@amd.com>, <hersenxs.wu@amd.com>
References: <20240513213041.583437-1-alex.hung@amd.com>
 <3b525e79-8387-9cbf-7e96-8092ffc757a8@quicinc.com>
 <07e5ac71-1be0-4ad9-bab1-e403db1eb59d@amd.com>
 <d35e42e6-74c6-58cb-dc10-b4be37d2bbcd@quicinc.com>
 <31bef15f-b58f-4442-aca6-eb8ff5e924c1@amd.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <31bef15f-b58f-4442-aca6-eb8ff5e924c1@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: XebVLUQgN8t3uNtQj_W2TqRFGaaOS8r2
X-Proofpoint-GUID: XebVLUQgN8t3uNtQj_W2TqRFGaaOS8r2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_17,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405130154
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



On 5/13/2024 3:32 PM, Alex Hung wrote:
> 
> 
> On 2024-05-13 16:20, Abhinav Kumar wrote:
>>
>>
>> On 5/13/2024 3:06 PM, Alex Hung wrote:
>>>
>>>
>>> On 2024-05-13 15:48, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 5/13/2024 2:30 PM, Alex Hung wrote:
>>>>> With dc2d7fb4f978, all kms_writeback subtests are skipped.
>>>>>
>>>>> Refresh the outputs to grab all supported connectors,
>>>>> the writeback output that is just enabled.
>>>>>
>>>>
>>>> Can you please help to explain how the tests are getting skipped due 
>>>> to setting the client_cap?
>>>>
>>>> And also why calling igt_display_reset_outputs() is fixing this issue?
>>>
>>> Without the igt_display_reset_outputs(), the result is
>>>
>>> IGT-Version: 1.28-gbe9b99928 (x86_64) (Linux: 6.7.0-rc5-99-custom 
>>> x86_64)
>>> Using IGT_SRANDOM=1715637543 for randomisation
>>> Opened device: /dev/dri/card0
>>> Test requirement not met in function __igt_unique____real_main553, 
>>> file ../tests/kms_writeback.c:579:
>>> Test requirement: output
>>> Last errno: 95, Operation not supported
>>> Subtest writeback-pixel-formats: SKIP (0.000s)
>>> Subtest writeback-invalid-parameters: SKIP (0.000s)
>>> Subtest writeback-fb-id: SKIP (0.000s)
>>> Subtest writeback-fb-id-XRGB2101010: SKIP (0.000s)
>>> Subtest writeback-check-output: SKIP (0.000s)
>>> Subtest writeback-check-output-XRGB2101010: SKIP (0.000s)
>>>
>>>
>>> It looks like the below "output = kms_writeback_get_output(&display)" 
>>> will return null as it cannot find any connector type with 
>>> DRM_MODE_CONNECTOR_WRITEBACK.
>>>
>>> The igt_display_reset_outputs() is able to re-initialize the output 
>>> and therefore includes the writeback output.
>>>
>>
>> Thanks for the details, I understand the issue now.
>>
>> But rather than calling igt_display_reset_outputs(), I think better 
>> way will be to set the cap before calling igt_display_require()
>>
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>> index f89b2d62fcc9..6ecab46e440b 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -567,14 +567,13 @@ igt_main_args("b:c:f:dl", long_options, 
>> help_str, opt_handler, NULL)
>>
>>                  kmstest_set_vt_graphics_mode();
>>
>> +               ret = drmSetClientCap(display.drm_fd, 
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>> +               igt_require_f(!ret, "error setting 
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>> +
>>                  igt_display_require(&display, display.drm_fd);
>>
>> Let me know if that works for you.
>>
> 
> This works if DRM_CLIENT_CAP_ATOMIC is also set as below:
> 
> Is this preferred?
> 
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -567,14 +567,18 @@ igt_main_args("b:c:f:dl", long_options, help_str, 
> opt_handler, NULL)
> 
>                  kmstest_set_vt_graphics_mode();
> 
> -               igt_display_require(&display, display.drm_fd);
> -
> -               igt_require(display.is_atomic);
> +               if (drmSetClientCap(display.drm_fd, 
> DRM_CLIENT_CAP_ATOMIC, 1) == 0)
> +                       display.is_atomic = 1;
> 
>                  ret = drmSetClientCap(display.drm_fd, 
> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> 
>                  igt_require_f(!ret, "error setting 
> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
> 
> +               igt_display_require(&display, display.drm_fd);
> +
> +               igt_require(display.is_atomic);
> +
> +
> 

Yes, looks correct to me because drm driver expects both to be set.

357 	case DRM_CLIENT_CAP_WRITEBACK_CONNECTORS:
358 		if (!file_priv->atomic)
359 			return -EINVAL;
360 		if (req->value > 1)
361 			return -EINVAL;
362 		file_priv->writeback_connectors = req->value;
363 		break;
> 
> 
> 
>>>>
>>>>> Fixes: dc2d7fb4f978 ("lib/igt_kms: move setting 
>>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback")
>>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>>> ---
>>>>>   tests/kms_writeback.c | 4 +++-
>>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>>>>> index f89b2d62f..4c54f3b89 100644
>>>>> --- a/tests/kms_writeback.c
>>>>> +++ b/tests/kms_writeback.c
>>>>> @@ -572,9 +572,11 @@ igt_main_args("b:c:f:dl", long_options, 
>>>>> help_str, opt_handler, NULL)
>>>>>           igt_require(display.is_atomic);
>>>>>           ret = drmSetClientCap(display.drm_fd, 
>>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>>>>> -
>>>>
>>>> Is this part needed for this patch?
>>>
>>> No, but I think they are related and thus grouping them together is 
>>> easier to read.
>>>
>>>>
>>>>>           igt_require_f(!ret, "error setting 
>>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>>>> +        /* Refresh the outputs to grab all supported connectors.*/
>>>>> +        igt_display_reset_outputs(&display);
>>>>> +
>>>>>           output = kms_writeback_get_output(&display);
>>>>>           igt_require(output);
