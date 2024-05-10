Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5748C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 18:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636D910E483;
	Fri, 10 May 2024 18:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Qm2kLrRp";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAFD10E483
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 18:09:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44ADnVxe000751;
 Fri, 10 May 2024 18:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=eBQR8zuMtXTahTZWfV5NIvG3hE0/uLgUq6qkJGUBhmA=; b=Qm
 2kLrRpmz1OM9OmPzMW4Sk/DCRm+LxjcUQuMU+z4sJO05NSp2KX/4Bg9/iZn6hjhH
 XpUpigSK4cPljvHilrDqamqRpH+v6smB0hFHU70o2i7uFFiT7czAWF9fzE/iZ07r
 OCC4cVG0x/WmPMkRW1yZZU8GItO6gCIeav64oaEs+BXQnTZqvCKLtF9ZBYsp3WgQ
 lfCHA8193XLdsHKb3ps3OV4Qeg91UpbTQAFKtreQqvDrSecbo3RAo7TMislUkPpa
 k6iILXLu4/B1f+JRe8kyxoN7X0EplzHZhxh9G2zIJ88O6cLC/Y8kt+78XrKb2cLy
 mUGjAQIfi99NoI8J08+g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w0t7n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 18:09:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AI9HmE018547
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 18:09:17 GMT
Received: from [10.110.113.192] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 11:09:16 -0700
Message-ID: <d1b51f6d-573e-66d9-a107-7eb8c096791c@quicinc.com>
Date: Fri, 10 May 2024 11:09:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH i-g-t] lib/igt_kms: move setting
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <adrinael@adrinael.net>
References: <20240509-wb_igt_fix-v1-1-41fc4b139390@quicinc.com>
 <20240510142959.67fw4vjorlvbptwb@kamilkon-DESK.igk.intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240510142959.67fw4vjorlvbptwb@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: W531zCfgzsZA5nFEpGHwZLZvbTB9mht9
X-Proofpoint-ORIG-GUID: W531zCfgzsZA5nFEpGHwZLZvbTB9mht9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_13,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100130
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

Hi Kamil

Thanks for the feedback.

On 5/10/2024 7:29 AM, Kamil Konieczny wrote:
> Hi Abhinav,
> On 2024-05-09 at 13:39:11 -0700, Abhinav Kumar wrote:
>> Currently DRM_CLIENT_CAP_WRITEBACK_CONNECTORS is set in the igt_display_require()
>> which is invoked for all IGT tests irrespective of whether the rest of the
>> writeback connector properties such as the FB_ID are set.
>>
>> For the writeback connectors to function properly, additional setup steps are required
>> (like setting up the output buffers and submitting the job). These steps are not a part
>> of the default IGT setup, so there is no guarantee that the pipeline will
>> be executed at all.
>>
>> It is unclear whether this is intentional to be able to run all IGT tests even
>> with writeback connector or it is only kms_writeback which is supposed to
>> be the one.
>>
>> Lets try with the latter approach by setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
>> only within kms_writeback.
>>
>> changes since RFC:
>> 	- minor fixes to commit message
>>
>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   lib/igt_kms.c         | 2 --
>>   tests/kms_writeback.c | 5 +++++
>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 98d3fb79cd22..f82102144ea1 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -2878,8 +2878,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>>   	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
>>   		display->is_atomic = 1;
>>   
>> -	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>> -
>>   	resources = drmModeGetResources(display->drm_fd);
>>   	if (!resources)
>>   		goto out;
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>> index 6cd685b37af2..3448dc06f891 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -558,6 +558,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>>   	igt_fb_t input_fb, input_fb_10bit;
>>   	drmModeModeInfo mode;
>>   	unsigned int fb_id;
>> +	int ret;
>>   
>>   	memset(&display, 0, sizeof(display));
>>   
>> @@ -570,6 +571,10 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>>   
>>   		igt_require(display.is_atomic);
>>   
>> +		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>> +
>> +		igt_require(!ret);
> ---------------------^
> Use igt_require_f() or change 'ret' into has_writeback_connectors
> 

Yes, I will use igt_require_f() and add the relevant message.

> With that it is
> 
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> (plus ack from Petri on irc)
> 

Thanks, I have picked up both your acks.

> Regards,
> Kamil
> 
>> +
>>   		output = kms_writeback_get_output(&display);
>>   		igt_require(output);
>>   
>>
>> ---
>> base-commit: 4a5fd4e7cb2798636f6464e2bd61399f3242b322
>> change-id: 20240509-wb_igt_fix-87169651e0da
>>
>> Best regards,
>> -- 
>> Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
