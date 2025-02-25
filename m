Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FFDC021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 15:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E9C10E144;
	Tue, 25 Feb 2025 15:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Fvnhs1rZ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0220710E144
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 15:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bKRJJ7+mSuyzGxiVwRECIfdD1N1NkAQXWUT8BZ9ASM4=; b=Fvnhs1rZxBniTOCM8p0mvu1XEv
 sCazbDTyl4crSpnIpf3NoqNeRSh0hmAiOwNRr9cyYXtVhEB3edms5Ts1ewUI30fOxuRn/fRV5+Kdx
 WtrB7sXdbB7sKc22S3z02s0eWhKm2iXHRpGa/q7UzINM3HrVgpyVt/pM2gO4LByBvq67f8LfV2oUq
 /2AzAZ06hoRpeoqb78VlPlhU7cHJLTXW7ACrIQ+TRxJJ2rZzyeZNIXpTuEddLQJk4IeC/lGmMgiWI
 39Ew/aHk4K+1daG1FVvPuyolFe+AQIdqvEcV47C9O6/WkhxbkQ8afEXPn+QP9Mcov+goU4F45Gdqd
 ktWDuJZw==;
Received: from [191.204.194.148] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tmx4j-000SD3-Fc; Tue, 25 Feb 2025 16:42:31 +0100
Message-ID: <78c0bb06-fb95-443c-a16c-9478daa11562@igalia.com>
Date: Tue, 25 Feb 2025 12:42:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/kms_async_flips: Create subtest for overlay
 planes
To: vitaly prosyak <vprosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jeevan B <jeevan.b@intel.com>, kernel-dev@igalia.com,
 "Hung, Alex" <Alex.Hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
References: <20241216202427.76168-1-andrealmeid@igalia.com>
 <20250219103703.2hbadorsyh5ezd3e@kamilkon-desk.igk.intel.com>
 <5b88ea25-c9a6-4025-8f9b-34e1b213e258@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <5b88ea25-c9a6-4025-8f9b-34e1b213e258@amd.com>
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

Hey Vitaly,

Em 19/02/2025 15:06, vitaly prosyak escreveu:
> Added Harry and Alex
> 
> Hi Kamll
> 
> Thanks for the letting us know.
> 
> On 2025-02-19 05:37, Kamil Konieczny wrote:
>> Hi André,
>> On 2024-12-16 at 17:24:27 -0300, André Almeida wrote:
>>> amdgpu can perform async flips in overlay planes as well, so create a
>>> test for that.
>>>
>> Vitaly could you find someone from AMD who could help with
>> review and testing? Thanks!
> 
> Alex,
> 
> Can you help with DAL CI to run this patch ?
> Thanks in advance
> 

Did you managed to get this running in the CI?

Thanks!

> Vitaly
> 
>>
>> Please add to Cc Vitaly from AMD:
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> Also add Jeevan here:
>> Cc: Jeevan B <jeevan.b@intel.com>
>>
>> Regards,
>> Kamil
>>
>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>> ---
>>> v2: Add test description for GitLab compilation
>>> ---
>>>   tests/kms_async_flips.c | 45 +++++++++++++++++++++++++++++++++++++----
>>>   1 file changed, 41 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>>> index 4a72be7b5..dd0907d50 100644
>>> --- a/tests/kms_async_flips.c
>>> +++ b/tests/kms_async_flips.c
>>> @@ -89,6 +89,9 @@
>>>    *
>>>    * SUBTEST: async-flip-suspend-resume
>>>    * Description: Verify the async flip functionality with suspend and resume cycle
>>> + *
>>> + * SUBTEST: overlay-atomic
>>> + * Description: Verify overlay planes with async flips in atomic API
>>>    */
>>>   
>>>   #define CURSOR_POS 128
>>> @@ -109,12 +112,14 @@ typedef struct {
>>>   	uint32_t crtc_id;
>>>   	uint32_t refresh_rate;
>>>   	struct igt_fb bufs[NUM_FBS];
>>> +	struct igt_fb bufs_overlay[NUM_FBS];
>>>   	igt_display_t display;
>>>   	igt_output_t *output;
>>>   	unsigned long flip_timestamp_us;
>>>   	double flip_interval;
>>>   	uint64_t modifier;
>>>   	igt_plane_t *plane;
>>> +	igt_plane_t *overlay_plane;
>>>   	igt_pipe_crc_t *pipe_crc;
>>>   	igt_crc_t ref_crc;
>>>   	int flip_count;
>>> @@ -126,6 +131,7 @@ typedef struct {
>>>   	bool allow_fail;
>>>   	struct buf_ops *bops;
>>>   	bool atomic_path;
>>> +	bool overlay_path;
>>>   } data_t;
>>>   
>>>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>>> @@ -226,6 +232,8 @@ static void test_init(data_t *data)
>>>   	igt_output_set_pipe(data->output, data->pipe);
>>>   
>>>   	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>>> +	if (data->overlay_path)
>>> +		data->overlay_plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
>>>   }
>>>   
>>>   static void test_init_fbs(data_t *data)
>>> @@ -246,16 +254,27 @@ static void test_init_fbs(data_t *data)
>>>   		prev_modifier = data->modifier;
>>>   
>>>   		if (data->bufs[0].fb_id) {
>>> -			for (i = 0; i < NUM_FBS; i++)
>>> +			for (i = 0; i < NUM_FBS; i++) {
>>>   				igt_remove_fb(data->drm_fd, &data->bufs[i]);
>>> +				if (data->overlay_path)
>>> +					igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
>>> +			}
>>>   		}
>>>   
>>> -		for (i = 0; i < NUM_FBS; i++)
>>> +		for (i = 0; i < NUM_FBS; i++) {
>>>   			make_fb(data, &data->bufs[i], width, height, i);
>>> +			if (data->overlay_path)
>>> +				make_fb(data, &data->bufs_overlay[i], width, height, i);
>>> +		}
>>>   	}
>>>   
>>>   	igt_plane_set_fb(data->plane, &data->bufs[0]);
>>>   	igt_plane_set_size(data->plane, width, height);
>>> +
>>> +	if (data->overlay_path) {
>>> +		igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>>> +		igt_plane_set_size(data->overlay_plane, width, height);
>>> +	}
>>>   }
>>>   
>>>   static bool async_flip_needs_extra_frame(data_t *data)
>>> @@ -283,12 +302,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
>>>   static int perform_flip(data_t *data, int frame, int flags)
>>>   {
>>>   	int ret;
>>> +	igt_plane_t *plane;
>>> +	struct igt_fb *bufs;
>>> +
>>> +	plane = data->overlay_path ? data->overlay_plane : data->plane;
>>> +	bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
>>>   
>>>   	if (!data->atomic_path) {
>>>   		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>>> -				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
>>> +				     bufs[frame % NUM_FBS].fb_id, flags, data);
>>>   	} else {
>>> -		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
>>> +		igt_plane_set_fb(plane, &data->bufs[frame % NUM_FBS]);
>>>   		ret = igt_display_try_commit_atomic(&data->display, flags, data);
>>>   	}
>>>   
>>> @@ -772,6 +796,7 @@ igt_main
>>>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>>>   			data.alternate_sync_async = false;
>>>   			data.atomic_path = false;
>>> +			data.overlay_path = false;
>>>   			if (is_intel_device(data.drm_fd))
>>>   				run_test_with_modifiers(&data, test_async_flip);
>>>   			else
>>> @@ -783,6 +808,7 @@ igt_main
>>>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
>>>   			data.alternate_sync_async = false;
>>>   			data.atomic_path = true;
>>> +			data.overlay_path = false;
>>>   			if (is_intel_device(data.drm_fd))
>>>   				run_test_with_modifiers(&data, test_async_flip);
>>>   			else
>>> @@ -793,6 +819,7 @@ igt_main
>>>   		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>>>   			data.alternate_sync_async = true;
>>>   			data.atomic_path = false;
>>> +			data.overlay_path = false;
>>>   			run_test(&data, test_async_flip);
>>>   		}
>>>   
>>> @@ -800,7 +827,17 @@ igt_main
>>>   		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
>>>   			data.alternate_sync_async = true;
>>>   			data.atomic_path = true;
>>> +			data.overlay_path = false;
>>> +			run_test(&data, test_async_flip);
>>> +		}
>>> +
>>> +		igt_describe("Verify overlay planes with async flips in atomic API");
>>> +		igt_subtest_with_dynamic("overlay-atomic") {
>>> +			igt_require(is_amdgpu_device(data.drm_fd));
>>> +			data.atomic_path = true;
>>> +			data.overlay_path = true;
>>>   			run_test(&data, test_async_flip);
>>> +			data.overlay_path = false;
>>>   		}
>>>   
>>>   		igt_describe("Verify that the async flip timestamp does not "
>>> -- 
>>> 2.47.1
>>>
> 

