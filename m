Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0F210E085
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 19:51:01 +0000 (UTC)
Message-ID: <f20017fc-2e91-4210-a446-06652347153e@amd.com>
Date: Fri, 15 Sep 2023 15:50:52 -0400
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20230908150315.75977-1-harry.wentland@amd.com>
 <20230908150315.75977-6-harry.wentland@amd.com>
 <20230915175258.0181c016.pekka.paalanen@collabora.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230915175258.0181c016.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC PATCH 5/7] igt/color: Add SW color transform
 functionality
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Simon Ser <contact@emersion.fr>,
 Alexander Goins <agoins@nvidia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Daniel Vetter <daniel@ffwll.ch>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2023-09-15 10:52, Pekka Paalanen wrote:
> On Fri, 8 Sep 2023 11:03:13 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> In order to test color we want to compare a HW (KMS) transform
>> with a SW transform. This introduces color transform for an
>> sRGB EOTF but this can be extended to other transforms. Code is
>> borrowed from Skia.
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> ---
>>  lib/igt_color.c | 330 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  lib/igt_color.h | 105 +++++++++++++++
>>  lib/igt_fb.c    |   6 +-
>>  lib/igt_fb.h    |   2 +
>>  lib/meson.build |   1 +
>>  5 files changed, 441 insertions(+), 3 deletions(-)
>>  create mode 100644 lib/igt_color.c
>>  create mode 100644 lib/igt_color.h
>>
>> diff --git a/lib/igt_color.c b/lib/igt_color.c
>> new file mode 100644
>> index 000000000000..12ff9ad1f324
>> --- /dev/null
>> +++ b/lib/igt_color.c
>> @@ -0,0 +1,330 @@
>> +/*
>> + * Copyright 2023 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#include <errno.h>
>> +#include <math.h>
>> +
>> +#include "igt_color.h"
>> +#include "igt_core.h"
>> +#include "igt_x86.h"
>> +
>> +
>> +static float clamp(float val, float min, float max)
>> +{
>> +	return ((val < min) ? min : ((val > max) ? max : val));
>> +}
>> +
>> +/*
>> + * Below code is taken from Skia and adapted for style and needs of
>> + * IGT.
>> + *
>> + * https://chromium.googlesource.com/chromium/src/+/3e1a26c44c024d97dc9a4c09bbc6a2365398ca2c/ui/gfx/skia_color_space_util.cc#15
>> + *
>> + * To comply with the original code's license we'll include it, as well
>> + * as the original copyright here:
>> + *
>> + * // Copyright 2015 The Chromium Authors
>> + * //
>> + * // Redistribution and use in source and binary forms, with or without
>> + * // modification, are permitted provided that the following conditions are
>> + * // met:
>> + * //
>> + * //    * Redistributions of source code must retain the above copyright
>> + * // notice, this list of conditions and the following disclaimer.
>> + * //    * Redistributions in binary form must reproduce the above
>> + * // copyright notice, this list of conditions and the following disclaimer
>> + * // in the documentation and/or other materials provided with the
>> + * // distribution.
>> + * //    * Neither the name of Google LLC nor the names of its
>> + * // contributors may be used to endorse or promote products derived from
>> + * // this software without specific prior written permission.
>> + * //
>> + * // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
>> + * // "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>> + * // LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
>> + * // A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
>> + * // OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
>> + * // SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
>> + * // LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
>> + * // DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
>> + * // THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>> + * // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
>> + * // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>> + */
>> +
>> +static float igt_color_tf_eval_unclamped(const struct igt_color_tf *fn, float x)
>> +{
>> +	if (x < fn->d)
>> +		return fn->c * x + fn->f;
>> +	return pow(fn->a * x + fn->b, fn->g) + fn->e;
>> +}
>> +
>> +static float igt_color_tf_eval(const struct igt_color_tf *fn, float x)
>> +{
>> +	float fn_at_x_unclamped = igt_color_tf_eval_unclamped(fn, x);
>> +	return clamp(fn_at_x_unclamped, 0.0f, 1.0f);
>> +}
> 
> ...
> 
>> +#if 0
>> +#define PRINT_PIXEL_CMP
>> +#endif
>> +
>> +bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t down)
>> +{
>> +	int16_t diff = comp2 - comp1;
>> +
>> +	if ((diff < -down) || (diff > up)) {
>> +		printf("comp1 %x comp2 %x diff %d down %d, up %d\n", comp1, comp2, diff, -down, up);
>> +		return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down)
>> +{
>> +	uint32_t *ptr1, *ptr2;
>> +	uint32_t pixel1, pixel2, i, j;
>> +	bool matched = true;
>> +
>> +#ifdef PRINT_PIXEL_CMP
>> +	printf("hwhw: %s %d\n", __func__, __LINE__);
>> +#endif
>> +
>> +	ptr1 = igt_fb_map_buffer(fb1->fd, fb1);
>> +	ptr2 = igt_fb_map_buffer(fb2->fd, fb2);
>> +
>> +	igt_assert(fb1->drm_format == fb2->drm_format);
>> +	igt_assert(fb1->size == fb2->size);
>> +
>> +	for (i = 0; i < fb1->size / sizeof(uint32_t); i++) {
>> +		uint16_t mask = 0xff;
>> +		uint16_t shift = 8;
>> +
>> +		if (fb1->drm_format == DRM_FORMAT_XRGB2101010) {
>> +			/* ignore alpha */
>> +			pixel1 = ptr1[i] & ~0xc0000000;
>> +			pixel2 = ptr2[i] & ~0xc0000000;
>> +
>> +			mask = 0x3ff;
>> +			shift = 10;
>> +
>> +
>> +		} else if (fb1->drm_format == DRM_FORMAT_XRGB8888) {
>> +			/* ignore alpha */
>> +			pixel1 = ptr1[i] & ~0xff000000;
>> +			pixel2 = ptr2[i] & ~0xff000000;
>> +
>> +			mask = 0xff;
>> +			shift = 8;
>> +
>> +		} else {
>> +			pixel1 = ptr1[i];
>> +			pixel2 = ptr2[i];
>> +		}
>> +
>> +#ifdef PRINT_PIXEL_CMP
>> +		/* print first 5 pixels */
>> +		if (i < 5) {
>> +			printf("hwhw: %s %u\n", __func__, i);
>> +			printf("\t\traw_in\t%u\n", ptr1[i]);
>> +			printf("\t\traw_out\t%u\n", ptr2[i]);
>> +			printf("\t\tin\t%u\n", pixel1);
>> +			printf("\t\tout\t%u\n", pixel2);
>> +		}
>> +#endif
>> +
>> +		for (j = 0; j < 3; j++) {
>> +			uint16_t comp1 = (pixel1 >> (shift*j)) & mask;
>> +			uint16_t comp2 = (pixel2 >> (shift*j)) & mask;
>> +
>> +			if (!igt_cmp_fb_component(comp1, comp2, up, down)) {
>> +				/* TODO use proper log*/
>> +				printf("i %d j %d shift %d mask %x comp1 %x comp2 %x, pixel1 %x pixel2 %x\n",
>> +				       i, j, shift, mask, comp1, comp2, pixel1, pixel2);
>> +				return false;
>> +			}
>> +		}
>> +	}
>> +
>> +	igt_fb_unmap_buffer(fb1, ptr1);
>> +	igt_fb_unmap_buffer(fb2, ptr2);
>> +
>> +	return matched;
>> +}
> 
> Maybe you'd like to borrow some facilities from Weston for comparing
> images?
> 
> Statistics collecting:
> https://gitlab.freedesktop.org/wayland/weston/-/blob/71616edc4dfce1cf9deafee36009dd9c37a9ba8d/tests/color_util.c#L504-530
> https://gitlab.freedesktop.org/wayland/weston/-/blob/71616edc4dfce1cf9deafee36009dd9c37a9ba8d/tests/color_util.h#L159-178
> 
> Example usage of the above:
> https://gitlab.freedesktop.org/wayland/weston/-/blob/71616edc4dfce1cf9deafee36009dd9c37a9ba8d/tests/color-icc-output-test.c#L726-764
> 

Interesting. Thanks for sharing. That looks quite useful.

> 
> 
>> +
>> +
>> +void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
>> +		 const char *path_name, const char *file_name)
>> +{
>> +	char filepath_out[PATH_MAX];
>> +	cairo_surface_t *fb_surface_out;
>> +	cairo_status_t status;
>> +
>> +	snprintf(filepath_out, PATH_MAX, "%s/%s.png", path_name, file_name);
>> +	fb_surface_out = igt_get_cairo_surface(display->drm_fd, fb);
>> +	status = cairo_surface_write_to_png(fb_surface_out, filepath_out);
>> +	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
>> +	cairo_surface_destroy(fb_surface_out);
>> +}
>> \ No newline at end of file
>> diff --git a/lib/igt_color.h b/lib/igt_color.h
>> new file mode 100644
>> index 000000000000..fc136eecfd17
>> --- /dev/null
>> +++ b/lib/igt_color.h
>> @@ -0,0 +1,105 @@
>> +/*
>> + * Copyright 2023 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +
>> +#ifndef __IGT_COLOR_H__
>> +#define __IGT_COLOR_H__
>> +
>> +#include <limits.h>
>> +
>> +#include "igt_fb.h"
>> +#include "igt_kms.h"
>> +
>> +/*
>> + * Below code is taken from Skia and adapted for style and needs of
>> + * IGT.
>> + *
>> + * https://chromium.googlesource.com/chromium/src/+/3e1a26c44c024d97dc9a4c09bbc6a2365398ca2c/ui/gfx/skia_color_space_util.cc#15
>> + *
>> + * To comply with the original code's license we'll include it, as well
>> + * as the original copyright here:
>> + *
>> + * // Copyright 2015 The Chromium Authors
>> + * //
>> + * // Redistribution and use in source and binary forms, with or without
>> + * // modification, are permitted provided that the following conditions are
>> + * // met:
>> + * //
>> + * //    * Redistributions of source code must retain the above copyright
>> + * // notice, this list of conditions and the following disclaimer.
>> + * //    * Redistributions in binary form must reproduce the above
>> + * // copyright notice, this list of conditions and the following disclaimer
>> + * // in the documentation and/or other materials provided with the
>> + * // distribution.
>> + * //    * Neither the name of Google LLC nor the names of its
>> + * // contributors may be used to endorse or promote products derived from
>> + * // this software without specific prior written permission.
>> + * //
>> + * // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
>> + * // "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
>> + * // LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
>> + * // A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
>> + * // OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
>> + * // SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
>> + * // LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
>> + * // DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
>> + * // THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
>> + * // (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
>> + * // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>> + */
>> +/*
>> + * A transfer function mapping encoded values to linear values,
>> + * represented by this 7-parameter piecewise function:
>> + *
>> + *   linear = sign(encoded) *  (c*|encoded| + f)       , 0 <= |encoded| < d
>> + *          = sign(encoded) * ((a*|encoded| + b)^g + e), d <= |encoded|
> 
> The code you have does not actually do the extended form (use of sign
> and absolute value), but clamps the result to [0.0, 1.0].
> 

Yes, the intention (and I didn't write this but copied it) is to be able to use
this to describe most (all?) standard transfer functions. See
https://github.com/google/skia/blob/main/include/core/SkColorSpace.h

Harry

> 
>> + *
>> + * (A simple gamma transfer function sets g to gamma and a to 1.)
>> + */
>> +struct igt_color_tf {
>> +    float g, a,b,c,d,e,f;
>> +};
>> +
>> +const struct igt_color_tf srgb_tf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
>> +
>> +/* end of Skia-based code */
>> +
>> +typedef struct igt_pixel {
>> +	float r;
>> +	float g;
>> +	float b;
>> +} igt_pixel_t;
> 
> Thanks,
> pq
