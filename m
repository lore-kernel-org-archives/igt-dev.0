Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAC4C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 18:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C053C10E578;
	Fri,  2 Feb 2024 18:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bpTS4vcL";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB7F10E578
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 18:14:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412C3LJ5031447; Fri, 2 Feb 2024 18:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=68SfvChf7rt9q21cOJQsaSfKtWpSnRl7YROxfMkrIkA=; b=bp
 TS4vcLBAnguF9kOPUHBubcG/d3lb4o+qRrAl8C6WVGljGG0s6I5fLIvof6MnhDdE
 8TcMyqJOdVI3UNWGqerC14X+DGGc0gygM4VhLh+9aizHb5kpem75Ufg6+HrL8Sa8
 2rsgrRqkIFwqRzM5E9jgjh0BBYGxfbtyj1D6ma5R4JleQxEvMHUyyAJ4x/x703hy
 OCfmUQDfRCCOezAOtMxrf6j8RwNpiN7K9zww/U+wiF2Z7Q7ADMRdKp9b6xcZ+c8U
 sAfXDrxOOD+6pvYndNotqoMacZGzL8WzWiZGBSsr8P6HO9R7d725M4oPhK3h/go7
 y2qsJqJsvnl6sr1TTRIw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0pwm23f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Feb 2024 18:14:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 412IEJo6013543
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Feb 2024 18:14:19 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 10:14:18 -0800
Message-ID: <700ec113-b897-428c-926a-dc2cfd3525f1@quicinc.com>
Date: Fri, 2 Feb 2024 10:14:18 -0800
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
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240124111325.179896e7.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: P8JOcbrpHxSChU2abySVPxWz9BIyZPDo
X-Proofpoint-ORIG-GUID: P8JOcbrpHxSChU2abySVPxWz9BIyZPDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_11,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=683
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402020129
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



On 1/24/2024 1:13 AM, Pekka Paalanen wrote:
> On Tue, 23 Jan 2024 15:28:58 -0800
> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> 
>> Add a basic test for solid fill planes.
>>
>> This test will first commit a single-color framebuffer plane then
>> a solid fill plane with the same contents. It then validates the solid
>> fill plane by comparing the resulting CRC with the CRC of the reference
>> framebuffer commit.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   tests/kms_atomic.c | 179 +++++++++++++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 161 insertions(+), 18 deletions(-)
>>
>> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
>> old mode 100644
>> new mode 100755
>> index 2b6e9a8f0383..35ac5f198524
>> --- a/tests/kms_atomic.c
>> +++ b/tests/kms_atomic.c
>> @@ -43,6 +43,7 @@
>>   #include <stdint.h>
>>   #include <string.h>
>>   #include <errno.h>
>> +#include <math.h>
>>   #include <xf86drmMode.h>
>>   #include <cairo.h>
>>   #include "drm.h"
>> @@ -101,6 +102,15 @@
>>    * @params-fence:     fence parameters
>>    */
>>   
>> +/**
>> + * SUBTEST: plane-%s-solid-fill
>> + * Description: Test atomic modesetting on %arg[1] using solid fill property.
>> + *
>> + * arg[1]:
>> + *
>> + * @primary:        Primary plane
>> + */
>> +
>>   #ifndef DRM_CAP_CURSOR_WIDTH
>>   #define DRM_CAP_CURSOR_WIDTH 0x8
>>   #endif
>> @@ -122,18 +132,45 @@ typedef struct {
>>   	igt_fb_t fb;
>>   } data_t;
>>   
>> +static struct {
>> +	uint32_t r, g, b;
>> +} colors[8] = {
>> +	/* Basic Colors */
>> +	{ .r = 0x00000000, .g = 0x00000000, .b = 0x00000000 },
>> +	{ .r = 0xffffffff, .g = 0x00000000, .b = 0x00000000 },
>> +	{ .r = 0x00000000, .g = 0xffffffff, .b = 0x00000000 },
>> +	{ .r = 0x00000000, .g = 0x00000000, .b = 0xffffffff },
>> +	{ .r = 0xffffffff, .g = 0xffffffff, .b = 0xffffffff },
>> +
>> +	/* Mid-grays */
>> +	{ .r = 0x40000000, .g = 0x40000000, .b = 0x40000000 },
>> +	{ .r = 0x80000000, .g = 0x80000000, .b = 0x80000000 },
>> +	{ .r = 0xcccccccc, .g = 0xcccccccc, .b = 0xcccccccc },
>> +};
> 
> Hi,
> 
> the above looks good to me. More below.
> 
>> +
>>   enum kms_atomic_check_relax {
>>   	ATOMIC_RELAX_NONE = 0,
>>   	CRTC_RELAX_MODE = (1 << 0),
>>   	PLANE_RELAX_FB = (1 << 1)
>>   };
>>   
>> -static inline int damage_rect_width(struct drm_mode_rect *r)
>> +/*
>> + * Fixed point uint to floating point conversion based on
>> + * Vulkan's UNORM conversion:
>> + *
>> + * https://registry.khronos.org/vulkan/specs/1.3/html/chap3.html#fundamentals-fixedconv
>> + */
>> +static inline double unorm_to_float(uint32_t x)
>> +{
>> +	return x / (pow(2, 32) - 1);
>> +}
>> +
>> +static inline int rect_width(struct drm_mode_rect *r)
>>   {
>>   	return r->x2 - r->x1;
>>   }
>>   
>> -static inline int damage_rect_height(struct drm_mode_rect *r)
>> +static inline int rect_height(struct drm_mode_rect *r)
>>   {
>>   	return r->y2 - r->y1;
>>   }
>> @@ -1156,8 +1193,8 @@ static void atomic_plane_damage(data_t *data)
>>   
>>   	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
>>   	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
>> -			damage_rect_width(&damage[0]),
>> -			damage_rect_height(&damage[0]), 1.0, 0, 0);
>> +			rect_width(&damage[0]),
>> +			rect_height(&damage[0]), 1.0, 0, 0);
>>   	igt_put_cairo_ctx(cr_1);
>>   
>>   	igt_plane_set_fb(data->primary, &fb_1);
>> @@ -1183,8 +1220,8 @@ static void atomic_plane_damage(data_t *data)
>>   	cairo_set_source_surface(cr_2, fb_1.cairo_surface, 0, 0);
>>   	cairo_paint(cr_2);
>>   	igt_paint_color(cr_2, damage[0].x1, damage[0].y1,
>> -			damage_rect_width(&damage[0]),
>> -			damage_rect_height(&damage[0]), 0, 1.0, 0);
>> +			rect_width(&damage[0]),
>> +			rect_height(&damage[0]), 0, 1.0, 0);
>>   	igt_put_cairo_ctx(cr_1);
>>   	igt_put_cairo_ctx(cr_2);
>>   	igt_plane_set_fb(data->primary, &fb_2);
>> @@ -1213,8 +1250,8 @@ static void atomic_plane_damage(data_t *data)
>>   	cairo_set_source_surface(cr_1, fb_2.cairo_surface, 0, 0);
>>   	cairo_paint(cr_1);
>>   	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
>> -			damage_rect_width(&damage[0]),
>> -			damage_rect_height(&damage[0]), 0, 1.0, 0);
>> +			rect_width(&damage[0]),
>> +			rect_height(&damage[0]), 0, 1.0, 0);
>>   	igt_put_cairo_ctx(cr_2);
>>   	igt_put_cairo_ctx(cr_1);
>>   	igt_plane_set_fb(data->primary, &fb_1);
>> @@ -1238,8 +1275,8 @@ static void atomic_plane_damage(data_t *data)
>>   
>>   	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
>>   	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
>> -			damage_rect_width(&damage[0]),
>> -			damage_rect_height(&damage[0]), 1.0, 1.0, 0);
>> +			rect_width(&damage[0]),
>> +			rect_height(&damage[0]), 1.0, 1.0, 0);
>>   	igt_put_cairo_ctx(cr_1);
>>   	igt_plane_set_fb(data->primary, &fb_1);
>>   	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
>> @@ -1266,11 +1303,11 @@ static void atomic_plane_damage(data_t *data)
>>   
>>   	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
>>   	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
>> -			damage_rect_width(&damage[0]),
>> -			damage_rect_height(&damage[0]), 0, 1.0, 1.0);
>> +			rect_width(&damage[0]),
>> +			rect_height(&damage[0]), 0, 1.0, 1.0);
>>   	igt_paint_color(cr_1, damage[1].x1, damage[1].y1,
>> -			damage_rect_width(&damage[1]),
>> -			damage_rect_height(&damage[1]), 0, 1.0, 0);
>> +			rect_width(&damage[1]),
>> +			rect_height(&damage[1]), 0, 1.0, 0);
>>   	igt_put_cairo_ctx(cr_1);
>>   	igt_plane_set_fb(data->primary, &fb_1);
>>   	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
>> @@ -1299,11 +1336,11 @@ static void atomic_plane_damage(data_t *data)
>>   
>>   	cr_1 = igt_get_cairo_ctx(data->drm_fd, &fb_1);
>>   	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
>> -			damage_rect_width(&damage[0]),
>> -			damage_rect_height(&damage[0]), 1.0, 0, 0);
>> +			rect_width(&damage[0]),
>> +			rect_height(&damage[0]), 1.0, 0, 0);
>>   	igt_paint_color(cr_1, damage[1].x1, damage[1].y1,
>> -			damage_rect_width(&damage[1]),
>> -			damage_rect_height(&damage[1]), 1.0, 1.0, 1.0);
>> +			rect_width(&damage[1]),
>> +			rect_height(&damage[1]), 1.0, 1.0, 1.0);
>>   	igt_put_cairo_ctx(cr_1);
>>   	igt_plane_set_fb(data->primary, &fb_1);
>>   	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
>> @@ -1322,6 +1359,98 @@ static void atomic_plane_damage(data_t *data)
>>   	igt_remove_fb(data->drm_fd, &fb_2);
>>   }
>>   
>> +static void test_solid_fill_plane(data_t *data, igt_output_t *output, igt_plane_t *plane)
>> +{
>> +	drmModeModeInfo *mode = igt_output_get_mode(output);
>> +	struct drm_mode_rect rect = { 0 };
>> +	struct igt_fb ref_fb;
>> +	igt_pipe_crc_t *pipe_crc;
>> +	igt_crc_t ref_crc, new_crc;
>> +	enum pipe pipe = data->pipe->pipe;
>> +	int height, width, i;
>> +	int ret;
>> +
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_SOLID_FILL));
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_PIXEL_SOURCE));
>> +
>> +	rect.x1 = 0;
>> +	rect.x2 = mode->hdisplay;
>> +	rect.y1 = 0;
>> +	rect.y2 = mode->vdisplay;
>> +
>> +	width = rect_width(&rect);
>> +	height = rect_height(&rect);
>> +
>> +	igt_plane_set_position(plane, rect.x1, rect.y1);
>> +	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
>> +			    IGT_PIPE_CRC_SOURCE_AUTO);
>> +
>> +
>> +	for (i = 0; i < ARRAY_SIZE(colors); i++) {
>> +		uint32_t r = colors[i].r;
>> +		uint32_t g = colors[i].g;
>> +		uint32_t b = colors[i].b;
>> +
>> +		struct drm_mode_create_blob c;
>> +		struct drm_mode_destroy_blob d;
>> +		struct drm_mode_solid_fill blob_data = {
>> +			.r = r,
>> +			.g = g,
>> +			.b = b,
>> +			.pad = 0x0,
>> +		};
>> +
>> +		c.data = (uintptr_t) &blob_data;
>> +		c.length = sizeof(blob_data);
>> +
>> +		igt_debug("Testing color r: 0x%x (%f), g: 0x%x (%f), b: 0x%x (%f)\n",
>> +				r, unorm_to_float(r),
>> +				g, unorm_to_float(g),
>> +				b, unorm_to_float(b));
>> +
>> +		/* get reference CRC */
>> +		igt_create_color_fb(data->drm_fd, width, height,
>> +				    DRM_FORMAT_ABGR8888, DRM_FORMAT_MOD_LINEAR,
>> +				    unorm_to_float(r),
>> +				    unorm_to_float(g),
>> +				    unorm_to_float(b),
> 
> I'm slightly wary of trusting a third party library (Cairo? Pixman?)
> with the float->u8 conversion. If both Cairo and the kernel do the same
> mistake in conversion, the test would pass. Therefore, this is actually
> testing that the kernel follows Cairo's conversion, and not the UAPI
> definition, should the unthinkable happen that they disagreed.
> 
> Would it at least be possible to verify the FB value against what we
> expect here?

Hi Pekka,

Unfortunately, I don't think there's a way that will let us to do that 
without writeback.

> 
>> +				    &ref_fb);
>> +		igt_plane_set_fb(plane, &ref_fb);
>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +
>> +		igt_pipe_crc_start(pipe_crc);
>> +		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
>> +
>> +		ret = drmIoctl(data->display.drm_fd, DRM_IOCTL_MODE_CREATEPROPBLOB, &c);
>> +		igt_assert(ret == 0);
>> +
>> +		/* test solid fill plane */
>> +		igt_plane_set_solid_fill(plane, &rect, c.blob_id);
>> +		igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "SOLID_FILL");
>> +
>> +		igt_display_commit_atomic(&data->display,
>> +					  DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +					  NULL);
>> +
>> +		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &new_crc);
>> +
>> +		igt_assert_crc_equal(&ref_crc, &new_crc);
> 
> Looking good.
> 
>> +
>> +		/* Switch back to FB pixel source */
>> +		igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, 0);
>> +		igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "FB");
>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> 
> Just wondering, why set this at the end and not when you are actually
> setting up the FB? Doesn't IGT sanitize KMS state before tests that
> don't explicitly test boot-up state?

Mostly for efficiency -- I can move the set(PIXEL_SOURCE, "FB") to when 
the reference FB is created, but PIXEL_SOURCE still needs to be set back 
to "FB" before the rmfb is called at the very end.

I can keep the set(PIXEL_SOURCE, "FB") here and move the set(SOLID_FILL, 
0) and commit to outside the loop before the remove_fb(). That way, we 
don't have unnecessary commits between test cases.

Thanks,

Jessica Zhang

> 
> 
> Thanks,
> pq
> 
>> +
>> +		d.blob_id = c.blob_id;
>> +		ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_DESTROYPROPBLOB, &d);
>> +		igt_assert(ret == 0);
>> +	}
>> +
>> +	igt_pipe_crc_stop(pipe_crc);
>> +	igt_pipe_crc_free(pipe_crc);
>> +	igt_remove_fb(data->drm_fd, &ref_fb);
>> +}
>> +
>>   static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *output)
>>   {
>>   	drmModeModeInfo *mode;
>> @@ -1634,6 +1763,20 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>>   		}
>>   	}
>>   
>> +	igt_describe("Test case for solid fill primary planes");
>> +	igt_subtest_with_dynamic("plane-primary-solid-fill") {
>> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
>> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
>> +				continue;
>> +
>> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>> +				atomic_setup(&data, pipe, output);
>> +				test_solid_fill_plane(&data, output, data.primary);
>> +				atomic_clear(&data, pipe, output);
>> +			}
>> +		}
>> +	}
>> +
>>   	igt_fixture {
>>   		igt_display_fini(&data.display);
>>   		drm_close_driver(data.drm_fd);
>>
> 
