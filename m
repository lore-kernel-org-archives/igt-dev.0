Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B64C54E5D
	for <igt-dev@archiver.kernel.org>; Sat, 16 Mar 2024 12:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1B510EABD;
	Sat, 16 Mar 2024 12:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="oozDq/Gq";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A6810EABD
 for <igt-dev@lists.freedesktop.org>; Sat, 16 Mar 2024 12:28:56 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4TxgQc0xcYz9vF2;
 Sat, 16 Mar 2024 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1710592136; bh=lguH2hkcpLMzDX7RqUzh4s2L982tsiWLVgHwmkAVQ5w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oozDq/Gqle4/hz3C8MQkskUFu1YeCQFSo7XaE0K45qaL+ArBpUGWvmdMbYISet+mg
 RXPFiyy/cWjd8LKoPxCbwIdmtG93tpHx82m3b7oMHdoDuZiRRwAbRd0KII4wcGXjXY
 V0q51fzYiLOW2Dd3E3ENTlKWHPVDagMc3D0XK/kM=
X-Riseup-User-ID: B7986DEAB5CEDBD71497E9842BEAC02467B9A2D3E53840B04474288F1A35E7D7
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TxgQZ1SRpzFt2Z;
 Sat, 16 Mar 2024 12:28:53 +0000 (UTC)
Message-ID: <f88e8018-e84b-4e95-8e52-82819564aaf5@riseup.net>
Date: Sat, 16 Mar 2024 09:28:51 -0300
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v2 3/4] tests/kms_rotation: Add extensive rotation
 test
Content-Language: en-US
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, miquel.raynal@bootlin.com,
 jeremie.dautheribes@bootlin.com, thomas.petazzoni@bootlin.com
References: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
 <20240313-new_rotation-v2-3-6230fd5cae59@bootlin.com>
 <a1b2926b-677d-4428-b530-7bd022e0ca96@riseup.net>
 <ZfRzMfoxxc477tnh@localhost.localdomain>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <ZfRzMfoxxc477tnh@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 15/03/24 13:11, Louis Chauvet wrote:
> Le 14/03/24 - 14:42, Arthur Grillo a écrit :
>>
>>
>> On 13/03/24 14:09, Louis Chauvet wrote:
>>> +
>>> +/**
>>> + * create_fb() - Create a framebuffer
>>> + *
>>> + * This create a framebuffer and fill it with a pattern. This pattern is not invariant by rotation and reflection.
>>> + *
>>> + * The @width and @height parameters are automaticaly inverted according to @rotation if needed. If the requested plane
>>> + * is 1024*768 with IGT_ROTATION_90, the returned plane will have the size 768*1024.
>>> + *
>>> + * @data: Current test configuration
>>> + * @rotation: Rotation to apply to the pattern
>>> + * @format: Format of the requested plane
>>> + * @modifier: Modifier for the requested plane
>>> + * @width, @height: Size of the plane to use (without rotation)
>>> + * @width: Width of the requested plane
>>> + * @height: Height of the requested plane
>>> + * @fb: Place to store the created framebuffer
>>> + */
>>> +static void create_fb(struct data_t *data, igt_rotation_t rotation, uint32_t format, uint64_t modifier, int width,
>>> +		      int height, igt_fb_t *fb)
>>> +{
>>> +	int step_x, step_y, color_index, current_n, current_m;
>>> +	int offset_x, offset_y;
>>> +	cairo_t *cr;
>>> +
>>> +	switch (rotation & IGT_ROTATION_MASK) {
>>> +		case IGT_ROTATION_90:
>>> +		case IGT_ROTATION_270:
>>> +			igt_swap(width, height);
>>> +			break;
>>> +		case IGT_ROTATION_0:
>>> +		case IGT_ROTATION_180:
>>> +		default:
>>> +			break;
>>> +	}
>>> +
>>> +	igt_create_fb(data->fd, width, height, format, modifier, fb);
>>> +	cr = igt_get_cairo_ctx(data->fd, fb);
>>> +
>>> +	step_x = (width) / ARRAY_SIZE(colors);
>>> +	step_y = (height) / ARRAY_SIZE(colors);
>>> +
>>> +	/*
>>> +	 * This pair of offset is used to ensure that a software rotated plane is the same as a hardware rotated plane.
>>> +	 */
>>> +	switch ((int)rotation) {
>>> +		case IGT_ROTATION_0:
>>> +		case IGT_ROTATION_0 | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_90:
>>> +		case IGT_ROTATION_90 | IGT_REFLECT_X:
>>> +		case IGT_ROTATION_180 | IGT_REFLECT_X | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_180 | IGT_REFLECT_X:
>>> +		case IGT_ROTATION_270 | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_270 | IGT_REFLECT_X | IGT_REFLECT_Y:
>>> +			offset_x = 0;
>>> +			break;
>>> +		case IGT_ROTATION_0 | IGT_REFLECT_X:
>>> +		case IGT_ROTATION_0 | IGT_REFLECT_X | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_90 | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_90 | IGT_REFLECT_X | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_180:
>>> +		case IGT_ROTATION_180 | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_270:
>>> +		case IGT_ROTATION_270 | IGT_REFLECT_X:
>>> +			offset_x = width % step_x;
>>> +			break;
>>> +	}
>>> +	switch ((int)rotation) {
>>> +		case IGT_ROTATION_0:
>>> +		case IGT_ROTATION_0 | IGT_REFLECT_X:
>>> +		case IGT_ROTATION_90 | IGT_REFLECT_X:
>>> +		case IGT_ROTATION_90 | IGT_REFLECT_X | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_180 | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_180 | IGT_REFLECT_X | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_270:
>>> +		case IGT_ROTATION_270 | IGT_REFLECT_Y:
>>> +			offset_y = 0;
>>> +			break;
>>> +		case IGT_ROTATION_0 | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_0 | IGT_REFLECT_X | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_90:
>>> +		case IGT_ROTATION_90 | IGT_REFLECT_Y:
>>> +		case IGT_ROTATION_180:
>>> +		case IGT_ROTATION_180 | IGT_REFLECT_X:
>>> +		case IGT_ROTATION_270 | IGT_REFLECT_X:
>>> +		case IGT_ROTATION_270 | IGT_REFLECT_X | IGT_REFLECT_Y:
>>> +			offset_y = height % step_y;
>>> +			break;
>>> +	}
>>> +
>>> +	/* Iterate over all colors in x and y direction. The pattern is a colored chessboard */
>>> +	for (int n = 0; n < ARRAY_SIZE(colors); n++) {
>>> +		for (int m = 0; m < ARRAY_SIZE(colors); m++) {
>>> +			color_index = (n + m) % ARRAY_SIZE(colors);
>>> +			current_n = n;
>>> +			current_m = m;
>>> +
>>> +			/*
>>> +			 * If a reflexion and a rotation is requested, apply this to the pattern rendering
>>> +			 * If a reflexion is given, it must be applied before the rotation.
>>> +			 */
>>> +			switch (rotation & IGT_REFLECT_MASK) {
>>> +				case IGT_REFLECT_X:
>>> +					current_n = ARRAY_SIZE(colors) - 1 - current_n;
>>> +					break;
>>> +				case IGT_REFLECT_Y:
>>> +					current_m = ARRAY_SIZE(colors) - 1 - current_m;
>>> +					break;
>>> +				case IGT_REFLECT_X | IGT_REFLECT_Y:
>>> +					current_n = ARRAY_SIZE(colors) - 1 - current_n;
>>> +					current_m = ARRAY_SIZE(colors) - 1 - current_m;
>>> +					break;
>>> +			}
>>> +			switch (rotation & IGT_ROTATION_MASK) {
>>> +				case IGT_ROTATION_0:
>>> +					break;
>>> +				case IGT_ROTATION_90:
>>> +					igt_swap(current_n, current_m);
>>> +					current_m = ARRAY_SIZE(colors) - 1 - current_m;
>>> +					break;
>>> +				case IGT_ROTATION_180:
>>> +					current_n = ARRAY_SIZE(colors) - 1 - current_n;
>>> +					current_m = ARRAY_SIZE(colors) - 1 - current_m;
>>> +					break;
>>> +				case IGT_ROTATION_270:
>>> +					igt_swap(current_n, current_m);
>>> +					current_n = ARRAY_SIZE(colors) - 1 - current_n;
>>> +					break;
>>> +			}
>>> +
>>> +			igt_paint_color(cr,
>>> +					offset_x + current_n * step_x,
>>> +					offset_y + current_m * step_y,
>>> +					step_x,
>>> +					step_y,
>>> +					colors[color_index].d[0],
>>> +					colors[color_index].d[1],
>>> +					colors[color_index].d[2]);
>>> +		}
>>> +	}
>>
>>
>> Couldn't all this be done with a igt_create_fb_pattern() and an
>> cairo_rotate()?
> 
> I agree they looked like a good fit for this purpose, but unfortunately I 
> already tried these functions and they were either not working with YUV 
> (see why below) or way too complex for my use case (TBH I did not manage 
> to use cairo_rotate and cairo_scale was overly complex to handle).
> 
> If you don't mind I would prefer to keep all this code with the same 
> "idea" (i.e: use only cairo_* helpers or rotate "by hand", but not mixing 
> them)

Yeah, I can go with that, If changing to cairo_* helpers would make more
the whole thing more complex than the other way around.

> 
> The main issue with YUV formats is subsampling, and for example, NV12, the 
> subsampling is horizontal. A "software rotated" and a "hardware 
> rotated" will not use the same subsampling "direction", so the resulting 
> CRC will not be the same. Using plain colors and choosing the correct size 
> avoids those issues, and igt_fb_create_pattern use gradients, which are 
> not working well.
> 
>>> +
>>> +/**
>>> + * run_test() - Run the subtests for a specific plane
>>> + *
>>> + * @data: Test configuration
>>> + * @output, @pipe, @plane: Plane to use for the test
>>> + * @format, @modifier: Format description to test
>>> + */
>>> +static void run_test(struct data_t *data, igt_output_t *output, enum pipe pipe, igt_plane_t *plane, uint32_t format,
>>> +		     uint64_t modifier)
>>> +{
>>> +	int width, height;
>>> +	const struct format_desc_struct *format_description;
>>> +	igt_crc_t ref_crc[ARRAY_SIZE(tested_rotation)];
>>> +	igt_crc_t crc[ARRAY_SIZE(tested_rotation)];
>>> +
>>> +	igt_display_reset(&data->display);
>>> +	igt_output_set_pipe(output, pipe);
>>> +	/* Check that the rotation is supported */
>>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
>>> +	format_description = lookup_drm_format(format);
>>> +	width = ARRAY_SIZE(colors) * format_description->hsub * format_description->vsub * 6;
>>> +	height = ARRAY_SIZE(colors) * format_description->hsub * format_description->vsub * 6;
>>
>> What's going on here?
> 
> I forgot to put a comment here:
> 
>   To avoid issue with YUV subsampling, the size must be a multiple of the 
>   subsampling, and to avoid color issues, the size must also be a multiple 
>   of the number of colors.
>   The multiplication by 6 as an arbitrary value to use an intermediate size (not too small
>   because some drivers don't support it, not too big to reduce tests duration).

I understand, could you also add a #define for this arbitrary value?

Best Regards,
~Arthur Grillo

