Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C143CC46CD2
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 01:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C6510F57D;
	Thu, 25 Jan 2024 01:29:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AAC10F57D
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 01:29:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40P1PZY2029719; Thu, 25 Jan 2024 01:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=/2WRoA4OUb2HbAdadwyZ893UYvDGFvyi6ajP0m/R1zI=; b=UK
 MM1cAEm6B1hrZincfpkV/nXPozVd+SWWSLm+c4VHIkrm+TTCtFpWvVnZSD9+0MLR
 XIdKilr5Hvlymcr4LUjVeHBPeq3fWdHtVoXK8FXWU7X3cGuFN+KOiw6PBprBIwT+
 37clTW/38Lc/B9gYYWLwc+SMaNShGJsPXDZ8eizvvfmacneB66WvGB/7bp7FJ8FN
 eNkChnMBO28UzBmrNet/S00cWZduNbqxP8JZAFbeEK44kOE/bLtQFByHfnZOYv3Q
 Ws/+21FhCabfLXGP8gWAgsc4NAIb1J73KjaXdSx9J5NiNu/MwSw1qg+3PbAiU3gy
 QrZZmTTPSggqsrs8j6qw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtmh0uamv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 01:29:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40P1TGZH007489
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 01:29:16 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 17:29:15 -0800
Message-ID: <56ac3f53-c6f5-40fd-8d54-29540b6a2aa8@quicinc.com>
Date: Wed, 24 Jan 2024 17:29:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/6] lib: Add support for solid_fill and
 pixel_source plane properties
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
References: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
 <20240123-solid-fill-v2-4-4ecd2cf767fe@quicinc.com>
 <bba9ee2f-4731-4908-8ab7-679c37785766@intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <bba9ee2f-4731-4908-8ab7-679c37785766@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Pf_ht0BlWGWQI9K26w2jSR2iS9reknl0
X-Proofpoint-ORIG-GUID: Pf_ht0BlWGWQI9K26w2jSR2iS9reknl0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_12,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=980 adultscore=0
 mlxscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250009
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
Cc: Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Simon Ser <contact@emersion.fr>,
 Rob Clark <robdclark@gmail.com>, Pekka Paalanen <pekka.paalanen@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 1/24/2024 1:03 AM, Modem, Bhanuprakash wrote:
> 
> 
> On 24-01-2024 04:58 am, Jessica Zhang wrote:
>> Add corresponding IGT macros for solid_fill and pixel_source DRM
>> properties, and change IGT commit behavior to allow for NULL FB commits.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   lib/igt_kms.c | 46 +++++++++++++++++++++++++++++++++++++++++++---
>>   lib/igt_kms.h |  4 ++++
>>   2 files changed, 47 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 1b4d0d7612a2..238b0a834adf 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -669,6 +669,8 @@ const char * const 
>> igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
>>       [IGT_PLANE_HOTSPOT_X] = "HOTSPOT_X",
>>       [IGT_PLANE_HOTSPOT_Y] = "HOTSPOT_Y",
>>       [IGT_PLANE_FB_ID] = "FB_ID",
>> +    [IGT_PLANE_SOLID_FILL] = "solid_fill",
>> +    [IGT_PLANE_PIXEL_SOURCE] = "pixel_source",
>>       [IGT_PLANE_CRTC_ID] = "CRTC_ID",
>>       [IGT_PLANE_IN_FENCE_FD] = "IN_FENCE_FD",
>>       [IGT_PLANE_TYPE] = "type",
>> @@ -3417,6 +3419,11 @@ static igt_output_t 
>> *igt_pipe_get_output(igt_pipe_t *pipe)
>>       return NULL;
>>   }
>> +static uint32_t igt_plane_get_solid_fill_id(igt_plane_t *plane)
>> +{
>> +    return plane->values[IGT_PLANE_SOLID_FILL];
>> +}
>> +
>>   static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
>>   {
>>       return plane->values[IGT_PLANE_FB_ID];
>> @@ -3648,7 +3655,7 @@ static int 
>> igt_primary_plane_commit_legacy(igt_plane_t *primary,
>>       struct igt_display *display = primary->pipe->display;
>>       igt_output_t *output = igt_pipe_get_output(pipe);
>>       drmModeModeInfo *mode;
>> -    uint32_t fb_id, crtc_id;
>> +    uint32_t fb_id, solid_fill_id, crtc_id;
>>       int ret;
>>       /* Primary planes can't be windowed when using a legacy commit */
>> @@ -3665,12 +3672,14 @@ static int 
>> igt_primary_plane_commit_legacy(igt_plane_t *primary,
>>       crtc_id = pipe->crtc_id;
>>       fb_id = output ? igt_plane_get_fb_id(primary) : 0;
>> -    if (fb_id)
>> +    solid_fill_id = output ? igt_plane_get_solid_fill_id(primary) : 0;
>> +
>> +    if (fb_id || solid_fill_id)
>>           mode = igt_output_get_mode(output);
>>       else
>>           mode = NULL;
>> -    if (fb_id) {
>> +    if (fb_id || solid_fill_id) {
>>           uint32_t src_x = primary->values[IGT_PLANE_SRC_X] >> 16;
>>           uint32_t src_y = primary->values[IGT_PLANE_SRC_Y] >> 16;
>> @@ -4935,6 +4944,37 @@ igt_plane_t 
>> *igt_output_get_plane_type_index(igt_output_t *output,
>>       return igt_pipe_get_plane_type_index(pipe, plane_type, index);
>>   }
>> +/**
>> + * igt_plane_set_solid_fill:
>> + * @plane: Plane
>> + * @rect: Rect for size and position of @plane
>> + * @solid_fill_id: Solid fill property blob ID
>> + *
>> + * Pairs the solid_fill blob (identified by @solid_fill_id) to a @plane
>> + *
>> + * The size and position of the solid fill plane will be specified by 
>> @rect
>> + */
>> +void igt_plane_set_solid_fill(igt_plane_t *plane, struct 
>> drm_mode_rect *rect,
>> +        int solid_fill_id)
>> +{
>> +    igt_pipe_t *pipe = plane->pipe;
>> +    igt_display_t *display = pipe->display;
>> +    int width = rect->x2 - rect->x1;
>> +    int height = rect->y2 - rect->y1;
>> +
>> +    igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID,
>> +            solid_fill_id ? pipe->crtc_id : 0);
>> +    igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, 
>> solid_fill_id);
> 
> We should reset this property to default in igt_display_reset().

Hi Bhanu,

Got it -- will add that in v2.

Thanks,

Jessica Zhang

> 
> - Bhanu
> 
>> +
>> +    plane->gem_handle = 0;
>> +
>> +    LOG(display, "%s.%d: plane_set_solid_fill(%d)\n", 
>> kmstest_pipe_name(pipe->pipe),
>> +        plane->index, solid_fill_id);
>> +
>> +    igt_plane_set_position(plane, rect->x1, rect->y1);
>> +    igt_plane_set_size(plane, width, height);
>> +}
>> +
>>   /**
>>    * igt_plane_set_fb:
>>    * @plane: Plane
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index b3882808b42f..9c05272abe1e 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -330,6 +330,8 @@ enum igt_atomic_plane_properties {
>>   #define IGT_PLANE_COORD_CHANGED_MASK 0xff
>>          IGT_PLANE_FB_ID,
>> +       IGT_PLANE_SOLID_FILL,
>> +       IGT_PLANE_PIXEL_SOURCE,
>>          IGT_PLANE_CRTC_ID,
>>          IGT_PLANE_IN_FENCE_FD,
>>          IGT_PLANE_TYPE,
>> @@ -537,6 +539,8 @@ igt_output_t 
>> *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe p
>>   void igt_pipe_request_out_fence(igt_pipe_t *pipe);
>> +void igt_plane_set_solid_fill(igt_plane_t *plane, struct 
>> drm_mode_rect *rect,
>> +        int solid_fill_id);
>>   void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb);
>>   void igt_plane_set_fence_fd(igt_plane_t *plane, int fence_fd);
>>   void igt_plane_set_pipe(igt_plane_t *plane, igt_pipe_t *pipe);
>>
