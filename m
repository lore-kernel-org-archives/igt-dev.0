Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EB7C36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 21:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6A210E672;
	Tue,  1 Apr 2025 21:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Z05eiGJn";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD5B10E673
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 21:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ptRdjCT9LYvuJiEdm8af8hjHUUdgZ9A5Mw6xzC9h5v0=; b=Z05eiGJnfBy26H8oyLgVWGg41x
 AzkUMPxIZCRwlXL0aQ8YjGhfto51fUd3wIij1ZN8zbVmPBhBSMNj3elcT6o+E7eEwPuFiWL9Gnlj+
 BwyzylZiPOfx+yP0FPwfyy85AM7hikI5IfNo4DY3ZLsSjnIgDZu5Kqh5ECuVBXKYnNzFJOepF88jz
 Hw2FQTTQeJgQMqYLFR176EtKXBkABa1oI5RBNqMz1RvhWBSa4tOsGGPvBHTwKUdKgfRLcmrRY7NZU
 SM2Pfrub04/YdiocuV0iyTBT0kB+i21T9tGfxSM/ZrKO/W+kG/uIYNrdM1MyWShDL15kllgUBH02C
 Zxzh7FHg==;
Received: from [187.57.129.172] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tzjAR-00A1cM-4t; Tue, 01 Apr 2025 23:29:07 +0200
Message-ID: <97184c27-dfb7-4a98-b10f-0eda33adb740@igalia.com>
Date: Tue, 1 Apr 2025 18:29:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 3/3] tests/kms_async_flips: Create subtest for overlay
 planes
To: Melissa Wen <mwen@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
References: <20250327221601.19086-1-andrealmeid@igalia.com>
 <20250327221601.19086-4-andrealmeid@igalia.com>
 <7puzvifpwz34pzcy5irnurgu3n562tekdrilxx4zx7bcfd3fxt@uemtwqmtru6t>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <7puzvifpwz34pzcy5irnurgu3n562tekdrilxx4zx7bcfd3fxt@uemtwqmtru6t>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Melissa,

Thanks for the review!

Em 29/03/2025 16:25, Melissa Wen escreveu:
> On 03/27, André Almeida wrote:
>> amdgpu can perform async flips in overlay planes as well, so create a
>> test for that.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   tests/kms_async_flips.c | 56 ++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 52 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index 5c7e1ae13..cc149dea2 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -85,6 +85,9 @@
>>    *
>>    * SUBTEST: async-flip-suspend-resume
>>    * Description: Verify the async flip functionality with suspend and resume cycle
>> + *
>> + * SUBTEST: overlay-atomic
>> + * Description: Verify overlay planes with async flips in atomic API
>>    */
>>   
>>   #define CURSOR_POS 128
>> @@ -105,12 +108,14 @@ typedef struct {
>>   	uint32_t crtc_id;
>>   	uint32_t refresh_rate;
>>   	struct igt_fb bufs[NUM_FBS];
>> +	struct igt_fb bufs_overlay[NUM_FBS];
>>   	igt_display_t display;
>>   	igt_output_t *output;
>>   	unsigned long flip_timestamp_us;
>>   	double flip_interval;
>>   	uint64_t modifier;
>>   	igt_plane_t *plane;
>> +	igt_plane_t *plane_overlay;
>>   	igt_pipe_crc_t *pipe_crc;
>>   	igt_crc_t ref_crc;
>>   	int flip_count;
>> @@ -122,6 +127,7 @@ typedef struct {
>>   	bool allow_fail;
>>   	struct buf_ops *bops;
>>   	bool atomic_path;
>> +	bool overlay_path;
>>   } data_t;
>>   
>>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>> @@ -213,6 +219,18 @@ static void require_atomic_async_cap(data_t *data)
>>   		      "Skipping, atomic flip async flip not supported");
>>   }
>>   
>> +static void require_overlay_flip_support(data_t *data)
>> +{
>> +	struct igt_fb *bufs = data->bufs_overlay;
>> +	igt_plane_t *plane = data->plane_overlay;
>> +	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
>> +
>> +	igt_plane_set_fb(plane, &bufs[0]);
> 
> Running `overlay-atomic` alone, the subtest passes, but running
> `kmas_async_flip` subtests in a row the `overlay-atomic` fails here in a
> kernel with overlay async support.
> 

The issue was happening because on test_init_fbs(), there's a `if 
(prev_output_id != output_id...)` that prevents fbs to be recreated if 
they are suitable for the next test. That was preventing the creation of 
the overlay fb in some cases, but I've fixed for the v5.

> I suspect something from previous execution needs a sync flip for
> setting modes before checking for overlay async support, or there is any
> other leak from the previous subtest.
> 
>> +
>> +	igt_require_f(!igt_display_try_commit_atomic(&data->display, flags, data),
>> +		      "Async flip for overlay planes not supported\n");
>> +}
>> +
>>   static void test_init(data_t *data)
>>   {
>>   	drmModeModeInfo *mode;
>> @@ -228,12 +246,15 @@ static void test_init(data_t *data)
>>   	igt_output_set_pipe(data->output, data->pipe);
>>   
>>   	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>> +	if (data->overlay_path)
>> +		data->plane_overlay = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
>>   }
>>   
>>   static void test_finish(data_t *data)
>>   {
>>   	data->alternate_sync_async = false;
>>   	data->atomic_path = false;
>> +	data->overlay_path = false;
>>   }
>>   
>>   static void test_init_fbs(data_t *data)
>> @@ -254,16 +275,27 @@ static void test_init_fbs(data_t *data)
>>   		prev_modifier = data->modifier;
>>   
>>   		if (data->bufs[0].fb_id) {
>> -			for (i = 0; i < NUM_FBS; i++)
>> +			for (i = 0; i < NUM_FBS; i++) {
>>   				igt_remove_fb(data->drm_fd, &data->bufs[i]);
>> +				if (data->overlay_path)
>> +					igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
>> +			}
>>   		}
>>   
>> -		for (i = 0; i < NUM_FBS; i++)
>> +		for (i = 0; i < NUM_FBS; i++) {
>>   			make_fb(data, &data->bufs[i], width, height, i);
>> +			if (data->overlay_path)
>> +				make_fb(data, &data->bufs_overlay[i], width, height, i);
> These bufs_overlay fbs should be removed when the test finished,
> together with bufs fbs in the last igt_fixture of the test.

Done

>> +		}
>>   	}
>>   
>>   	igt_plane_set_fb(data->plane, &data->bufs[0]);
>>   	igt_plane_set_size(data->plane, width, height);
>> +
>> +	if (data->overlay_path) {
>> +		igt_plane_set_fb(data->plane_overlay, &data->bufs[0]);
> I didn't get why both primary and overlay planes are set to the same
> bufs[0] fb here, should it be data->bufs_overlay[0] ?

Ops, that was a typo!

>> +		igt_plane_set_size(data->plane_overlay, width, height);
>> +	}
>>   }
>>   
>>   static bool async_flip_needs_extra_frame(data_t *data)
>> @@ -291,12 +323,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
>>   static int perform_flip(data_t *data, int frame, int flags)
>>   {
>>   	int ret;
>> +	igt_plane_t *plane;
>> +	struct igt_fb *bufs;
>> +
>> +	plane = data->overlay_path ? data->plane_overlay : data->plane;
>> +	bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
>>   
>>   	if (!data->atomic_path) {
>>   		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> -				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
>> +				     bufs[frame % NUM_FBS].fb_id, flags, data);
>>   	} else {
>> -		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
>> +		igt_plane_set_fb(plane, &bufs[frame % NUM_FBS]);
>>   		ret = igt_display_try_commit_atomic(&data->display, flags, data);
>>   	}
>>   
>> @@ -312,6 +349,9 @@ static void test_async_flip(data_t *data)
>>   
>>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>   
>> +	if (data->overlay_path)
> I wonder if the bufs_overlay fbs should be initialize and set here, after
> igt_display_commit2, instead of together with bufs fbs in the
> test_init_fbs()

test_init_fbs() is called once for all the tests in a subtest group, 
require_overlay_flip_support() is called every time a test run. I think 
it makes more sense to init those buffers just one time per run, like 
it's done with the other buffers. Let me know what do you think.

>> +		require_overlay_flip_support(data);
>> +
