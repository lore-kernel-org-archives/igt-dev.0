Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BF7C5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 18:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651C610E394;
	Wed, 28 Feb 2024 18:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Zz6J9czX";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE5610E3B0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 18:28:51 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41S3pV89009383; Wed, 28 Feb 2024 18:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=V761vg96/IKXQwHukDvx7OoCziySr/5WPsJnqwnD3+k=; b=Zz
 6J9czXoXLHB20/Sajj9IKPpf7DIPKOnAAJv4bw3r5IuJg0ruyGP24QTQDlZQCpDl
 YQQ4gougVUudG1KEm7WUmr9Zh31icA7i6Z0Omcj/EsavgD7P0jteTZZCYTgZtMzn
 3UR51KCYDngIvph5SyLvw2+nlMhKhBJEK8IMdasZ3d+VjIaF2wkMVVXdKfJltn43
 hxCGsfA0gUizX7mpKq8Y2LGfXWgOyDJpnvrwGaAZbIP76ugW6og23j0rlbTXx1zw
 LnicJt/6E969L3WmslITo/heiJPNzsqA+TwYY/MRMbTQm6mTpgnAg+EMMcFYQ+TF
 E2jkc4FxSg7AErWdyYAw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whv1ft5e6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Feb 2024 18:28:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41SISg96014696
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Feb 2024 18:28:42 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 28 Feb
 2024 10:28:41 -0800
Message-ID: <f739f337-1bc9-4ce9-9b94-2c5f3f81322c@quicinc.com>
Date: Wed, 28 Feb 2024 10:28:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 5/6] tests/kms_atomic: Add solid fill plane
 subtest
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@collabora.com>
CC: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>,
 Simon Ser <contact@emersion.fr>, <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
 <20240123-solid-fill-v2-5-4ecd2cf767fe@quicinc.com>
 <20240124111325.179896e7.pekka.paalanen@collabora.com>
 <700ec113-b897-428c-926a-dc2cfd3525f1@quicinc.com>
 <20240205123523.24bfd139.pekka.paalanen@collabora.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240205123523.24bfd139.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rwOBUJORAr0As3iftmPqf2bY5Vca76uC
X-Proofpoint-ORIG-GUID: rwOBUJORAr0As3iftmPqf2bY5Vca76uC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=937 impostorscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280145
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



On 2/5/2024 2:35 AM, Pekka Paalanen wrote:
> On Fri, 2 Feb 2024 10:14:18 -0800
> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> 
>> On 1/24/2024 1:13 AM, Pekka Paalanen wrote:
>>> On Tue, 23 Jan 2024 15:28:58 -0800
>>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>    
>>>> Add a basic test for solid fill planes.
>>>>
>>>> This test will first commit a single-color framebuffer plane then
>>>> a solid fill plane with the same contents. It then validates the solid
>>>> fill plane by comparing the resulting CRC with the CRC of the reference
>>>> framebuffer commit.
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>    tests/kms_atomic.c | 179 +++++++++++++++++++++++++++++++++++++++++++++++------
>>>>    1 file changed, 161 insertions(+), 18 deletions(-)
> 
> ...
> 
>>>> +static void test_solid_fill_plane(data_t *data, igt_output_t *output, igt_plane_t *plane)
>>>> +{
>>>> +	drmModeModeInfo *mode = igt_output_get_mode(output);
>>>> +	struct drm_mode_rect rect = { 0 };
>>>> +	struct igt_fb ref_fb;
>>>> +	igt_pipe_crc_t *pipe_crc;
>>>> +	igt_crc_t ref_crc, new_crc;
>>>> +	enum pipe pipe = data->pipe->pipe;
>>>> +	int height, width, i;
>>>> +	int ret;
>>>> +
>>>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_SOLID_FILL));
>>>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_PIXEL_SOURCE));
>>>> +
>>>> +	rect.x1 = 0;
>>>> +	rect.x2 = mode->hdisplay;
>>>> +	rect.y1 = 0;
>>>> +	rect.y2 = mode->vdisplay;
>>>> +
>>>> +	width = rect_width(&rect);
>>>> +	height = rect_height(&rect);
>>>> +
>>>> +	igt_plane_set_position(plane, rect.x1, rect.y1);
>>>> +	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
>>>> +			    IGT_PIPE_CRC_SOURCE_AUTO);
>>>> +
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(colors); i++) {
>>>> +		uint32_t r = colors[i].r;
>>>> +		uint32_t g = colors[i].g;
>>>> +		uint32_t b = colors[i].b;
>>>> +
>>>> +		struct drm_mode_create_blob c;
>>>> +		struct drm_mode_destroy_blob d;
>>>> +		struct drm_mode_solid_fill blob_data = {
>>>> +			.r = r,
>>>> +			.g = g,
>>>> +			.b = b,
>>>> +			.pad = 0x0,
>>>> +		};
>>>> +
>>>> +		c.data = (uintptr_t) &blob_data;
>>>> +		c.length = sizeof(blob_data);
>>>> +
>>>> +		igt_debug("Testing color r: 0x%x (%f), g: 0x%x (%f), b: 0x%x (%f)\n",
>>>> +				r, unorm_to_float(r),
>>>> +				g, unorm_to_float(g),
>>>> +				b, unorm_to_float(b));
>>>> +
>>>> +		/* get reference CRC */
>>>> +		igt_create_color_fb(data->drm_fd, width, height,
>>>> +				    DRM_FORMAT_ABGR8888, DRM_FORMAT_MOD_LINEAR,
>>>> +				    unorm_to_float(r),
>>>> +				    unorm_to_float(g),
>>>> +				    unorm_to_float(b),
>>>
>>> I'm slightly wary of trusting a third party library (Cairo? Pixman?)
>>> with the float->u8 conversion. If both Cairo and the kernel do the same
>>> mistake in conversion, the test would pass. Therefore, this is actually
>>> testing that the kernel follows Cairo's conversion, and not the UAPI
>>> definition, should the unthinkable happen that they disagreed.
>>>
>>> Would it at least be possible to verify the FB value against what we
>>> expect here?
>>
>> Hi Pekka,
>>
>> Unfortunately, I don't think there's a way that will let us to do that
>> without writeback.
> 
> I would be surprised if IGT used anything other than Cairo's image
> backend. Can't you simply read bytes back from where Cairo wrote them?
> Checking just one pixel would suffice.

Ack. I do see that we can use cairo_image_surface_get_data(), though it 
returns an ARGB8888 (specifically CAIRO_FORMAT_ARGB32) color.

I can add a to_argb() helper (like what we did for 
_dpu_plane_get_abgr_fill_color() in the MSM driver) to convert the 
RGB323232 color to ARGB8888 (and setting alpha to 0xFF) then comparing 
the resulting value to what we get from *_get_data().

What do you think?

Thanks,

Jessica Zhang

> 
> 
> Thanks,
> pq
