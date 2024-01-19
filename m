Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5FBC47DD3
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 17:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E623C10EA3B;
	Fri, 19 Jan 2024 17:41:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C85710EA3B
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 17:41:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40JFukuf020018; Fri, 19 Jan 2024 17:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=ZMPPaFxFKMpaoa5erxm75JuggcQwjsVkKPnUU2gjcUE=; b=eC
 8W9ghudmsyeAzMlPjClZMF31Ek1IyVuShR+8tWmAY6ZHec0senF2n4Fq6ifz1EuB
 IKeZMrK1tAlQrNLuUiEjj7184RSkTiaMFLxsV9TQOH9aKKp1K/2pNGZGWFonYoTF
 gP0jRjXnE4/k2ZBNPVGwjj9AAsddDwORZ6nOwXFNEF+dRqFZ3JKDVmwAGGVefk/v
 WlQWqr2YT3fz08mz42hu60ecCraC9foHTw+4IrcDyzyFIUPPQd1LFG/epWvnfzJi
 Ig6jVpwBBVx8TII+iHlf5mJ4PIJQA7BSf89q88oUpKt5mjXfudb3D4S45kJhYTEG
 dUswrtxoIvLPdiEkRaeQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vqhpb9gu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jan 2024 17:40:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40JHespj012566
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jan 2024 17:40:54 GMT
Received: from [10.110.103.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 19 Jan
 2024 09:40:53 -0800
Message-ID: <65b91019-2aed-a06d-5a98-e146dd866e6a@quicinc.com>
Date: Fri, 19 Jan 2024 09:40:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH i-g-t 3/4] tests/kms_atomic: Add solid fill plane subtest
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@collabora.com>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
References: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
 <20231215-solid-fill-v1-3-12932f9f452d@quicinc.com>
 <20231218121247.454bc00a.pekka.paalanen@collabora.com>
 <6c910eb7-5f4b-4b03-ae3c-ca0498f0c667@quicinc.com>
 <20240111112028.36736525.pekka.paalanen@collabora.com>
 <f9054b1a-d020-4e1f-a010-fcff8bd651e2@quicinc.com>
 <20240119110042.3114f54c.pekka.paalanen@collabora.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240119110042.3114f54c.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LGi3nzDJH4hdjDD_FAnBdes8SFSEVvaO
X-Proofpoint-GUID: LGi3nzDJH4hdjDD_FAnBdes8SFSEVvaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_10,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=731 suspectscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190103
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
Cc: igt-dev@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 1/19/2024 1:00 AM, Pekka Paalanen wrote:
> On Thu, 18 Jan 2024 15:35:10 -0800
> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> 
>> On 1/11/2024 1:20 AM, Pekka Paalanen wrote:
>>> On Thu, 21 Dec 2023 15:57:51 -0800
>>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>    
>>>> On 12/18/2023 2:12 AM, Pekka Paalanen wrote:
>>>>> On Fri, 15 Dec 2023 16:40:23 -0800
>>>>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>>>       
>>>>>> Add a basic test for solid fill planes.
>>>>>>
>>>>>> This test will first commit a single-color framebuffer plane then
>>>>>> a solid fill plane with the same contents. It then validates the solid
>>>>>> fill plane by comparing the resulting CRC with the CRC of the reference
>>>>>> framebuffer commit.
>>>>>>
>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>> ---
>>>>>>     tests/kms_atomic.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 94 insertions(+)
>>>>>>
>>>>>> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
>>>>>> old mode 100644
>>>>>> new mode 100755
>>>>>> index 2b6e9a8f0383..8f81e65ad84f
>>>>>> --- a/tests/kms_atomic.c
>>>>>> +++ b/tests/kms_atomic.c
>>>>>> @@ -128,6 +128,13 @@ enum kms_atomic_check_relax {
>>>>>>     	PLANE_RELAX_FB = (1 << 1)
>>>>>>     };
>>>>>>     
>>>>>> +struct solid_fill_blob {
>>>>>> +	uint32_t r;
>>>>>> +	uint32_t g;
>>>>>> +	uint32_t b;
>>>>>> +	uint32_t pad;
>>>>>> +};
>>>>>> +
>>>>>>     static inline int damage_rect_width(struct drm_mode_rect *r)
>>>>>>     {
>>>>>>     	return r->x2 - r->x1;
>>>>>> @@ -1322,6 +1329,79 @@ static void atomic_plane_damage(data_t *data)
>>>>>>     	igt_remove_fb(data->drm_fd, &fb_2);
>>>>>>     }
>>>>>>     
>>>>>> +static void test_solid_fill_plane(data_t *data, igt_output_t *output,  igt_plane_t *plane)
>>>>>> +{
>>>>>> +	struct drm_mode_create_blob c;
>>>>>> +	struct drm_mode_destroy_blob d;
>>>>>> +	drmModeModeInfo *mode = igt_output_get_mode(output);
>>>>>> +	struct drm_mode_rect rect = { 0 };
>>>>>> +	struct igt_fb ref_fb;
>>>>>> +	igt_pipe_crc_t *pipe_crc;
>>>>>> +	igt_crc_t ref_crc, new_crc;
>>>>>> +	enum pipe pipe = data->pipe->pipe;
>>>>>> +	int height, width;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	struct solid_fill_blob blob_data = {
>>>>>> +		.r = 0x00000000,
>>>>>> +		.g = 0x00000000,
>>>>>> +		.b = 0xff000000,
>>>>>> +		.pad = 0x0,
>>>>>> +	};
>>>>>
>>>>> Hi Jessica!
>>>>>
>>>>> This is the blob sent to KMS as the solid fill color...
>>>>>
>>>>> ...
>>>>>       
>>>>>> +	igt_create_color_fb(data->drm_fd, width, height,
>>>>>> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>>>>> +			    0.0, 0.0, 1.0, &ref_fb);
>>>>>
>>>>> ..and this (0.0, 0.0, 1.0) is the corresponding color in normalized
>>>>> values, I presume.
>>>>>
>>>>> So you say that 0xff000000 = 1.0.
>>>>>
>>>>> However, the patch for the kernel UAPI header says this:
>>>>>
>>>>> +/**
>>>>> + * struct drm_mode_solid_fill - User info for solid fill planes
>>>>> + *
>>>>> + * This is the userspace API solid fill information structure.
>>>>> + *
>>>>> + * Userspace can enable solid fill planes by assigning the plane "solid_fill"
>>>>> + * property to a blob containing a single drm_mode_solid_fill struct populated with an RGB323232
>>>>> + * color and setting the pixel source to "SOLID_FILL".
>>>>> + *
>>>>> + * For information on the plane property, see drm_plane_create_solid_fill_property()
>>>>> + *
>>>>> + * @r: Red color value of single pixel
>>>>> + * @g: Green color value of single pixel
>>>>> + * @b: Blue color value of single pixel
>>>>> + * @pad: padding, must be zero
>>>>> + */
>>>>> +struct drm_mode_solid_fill {
>>>>> +	__u32 r;
>>>>> +	__u32 g;
>>>>> +	__u32 b;
>>>>> +	__u32 pad;
>>>>> +};
>>>>>
>>>>> I assume that RGB323232 means unsigned 32-bit UNORM (Vulkan term)
>>>>> format. That means 1.0 is 0xffffffff, not 0xff000000. This looks like a
>>>>> bug in the test.
>>>>
>>>> Hey Pekka,
>>>>
>>>> Ah, thanks for catching this -- I'll change the blob value to 0xffffffff
>>>> so it matches the 1.0.
>>>>
>>>> While we're talking about the UAPI struct, I'll also add the actual
>>>> drm_mode_solid_fill struct to the IGT drm-uapi instead of the current
>>>> workaround.
>>>>   
>>>>>
>>>>> It would be good to test more than one color:
>>>>> - 0.0, 0.0, 0.0
>>>>> - 1.0, 0.0, 0.0
>>>>> - 0.0, 1.0, 0.0
>>>>> - 0.0, 0.0, 1.0
>>>>> - 1.0, 1.0, 1.0
>>>>
>>>> Sounds good, will change the test to validate these combinations.
>>>>   
>>>>>
>>>>> for example. That would get at least the so often used black explicitly
>>>>> tested, and verify each channel gets mapped correctly rather than only
>>>>> blue.
>>>>>
>>>>> It would also be really good to test dim and mid grays, but I assume it
>>>>> might be difficult to get CRC to match over various hardware. You'd
>>>>> need to use writeback with an error tolerance. (For watching photos for
>>>>> example, the background is not usually black but dim gray I believe.)
>>>>
>>>> Got it, we can add this to the list of colors to test.
>>>>
>>>> FWIW, I think as long as we keep the test structure as grabbing a
>>>> reference CRC from an FB commit then comparing that to a CRC from a
>>>> solid fill commit, I'm not expecting a difference in CRC values.
>>>
>>> The worry I had here, is that different hardware may have different
>>> precision for the solid fill. Maybe that can be worked around by
>>> computing the solid fill blob values from the raw FB pixel values? Then
>>> even if something gets rounded/truncated somewhere in the hardware, the
>>> end result should be the same between FB and solid fill, right?
>>
>> Hi Pekka,
>>
>> Got it -- I see what you mean.
>>
>> In that case, can we stick to just testing the basic RGB + black/white
>> colors? I want to avoid adding writeback as a dependency for the solid
>> fill test since it's not a dependency for the solid fill feature itself.
> 
> Up to you. My worries here are hypothetical, I don't know about
> hardware. It's also possible to adjust tests later if people find false
> positives or false negatives.
> 
> Personally, I'd start with optimistically strict tests. False negatives
> will be found by driver developers easily, while false negatives would
> need an actual user reporting a bug.
> 
> 
> Thanks,
> pq
> 

I agree with Jessica here. We can start with the basic RGB + black/white.

We dont want to put an extra writeback dependency on this test as there 
is no hardware dependency of solid fill planes with writeback connector.

If others would like to extend this later on based on the writeback 
client cap to add another sub-test that would be a separate effort.

>>>
>>> Unless, the hardware precision on solid fill values is less than FB
>>> pixel precision, and the CRC input precision is high enough to show
>>> that difference.
>>>
>>>
>>> Thanks,
>>> pq
> 
