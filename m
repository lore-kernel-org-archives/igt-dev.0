Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB506E1D7
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 06:46:46 +0000 (UTC)
References: <20210508162303.8235-1-bhanuprakash.modem@intel.com>
 <20210508162303.8235-3-bhanuprakash.modem@intel.com>
 <f8092e5d-7b4f-222c-0d08-49fb222f9206@intel.com>
 <SN6PR11MB3327671DA4B721C5E3C3A7DF8D529@SN6PR11MB3327.namprd11.prod.outlook.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <502d3ad4-1229-b5ce-69b0-58f9ab3f7cc6@intel.com>
Date: Wed, 12 May 2021 12:16:41 +0530
MIME-Version: 1.0
In-Reply-To: <SN6PR11MB3327671DA4B721C5E3C3A7DF8D529@SN6PR11MB3327.namprd11.prod.outlook.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v5 i-g-t 02/14] tests/kms_frontbuffer_tracking: Fix
 mode selection for 2x tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 5/12/2021 12:07 PM, Modem, Bhanuprakash wrote:
>> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Sent: Tuesday, May 11, 2021 9:57 AM
>> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Cc: Deak, Imre <imre.deak@intel.com>; Daniel Vetter <daniel.vetter@ffwll.ch>
>> Subject: Re: [v5 i-g-t 02/14] tests/kms_frontbuffer_tracking: Fix mode
>> selection for 2x tests
>>
>>
>> On 5/8/2021 9:52 PM, Bhanuprakash Modem wrote:
>>> When two monitors connected through MST, the second monitor also
>>> tries to use the same mode. So two such modes may not fit into the
>>> link bandwidth.
>>>
>>> This patch will find a combination of modes that fit into the BW.
>>>
>>> V2:
>>> * Remove MST specific logic (Daniel)
>>> V3:
>>> * Add support for legacy commit (Ankit)
>>>
>>> Cc: Imre Deak <imre.deak@intel.com>
>>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> ---
>>>    tests/kms_frontbuffer_tracking.c | 40 ++++++++++++++++++++++++++++++++
>>>    1 file changed, 40 insertions(+)
>>>
>>> diff --git a/tests/kms_frontbuffer_tracking.c
>> b/tests/kms_frontbuffer_tracking.c
>>> index 2e74bec6f..65c2ddb5c 100644
>>> --- a/tests/kms_frontbuffer_tracking.c
>>> +++ b/tests/kms_frontbuffer_tracking.c
>>> @@ -1683,14 +1683,54 @@ static void enable_prim_screen_and_wait(const struct
>> test_mode *t)
>>>      do_assertions(ASSERT_NO_ACTION_CHANGE);
>>>    }
>>>
>>> +static void update_modeset_cached_params(void)
>>> +{
>>> +   bool found = false;
>>> +
>>> +   igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
>>> +   igt_output_set_pipe(scnd_mode_params.output, scnd_mode_params.pipe);
>>> +
>>> +   found = igt_override_all_active_output_modes_to_fit_bw(&drm.display);
>>> +   igt_require_f(found, "No valid mode combo found.\n");
>>> +
>>> +   prim_mode_params.mode_copy =
>> *igt_output_get_mode(prim_mode_params.output);
>>> +   prim_mode_params.mode = &prim_mode_params.mode_copy;
>>> +   prim_mode_params.primary.w = prim_mode_params.mode->hdisplay;
>>> +   prim_mode_params.primary.h = prim_mode_params.mode->vdisplay;
>>> +
>>> +   scnd_mode_params.mode_copy =
>> *igt_output_get_mode(scnd_mode_params.output);
>>> +   scnd_mode_params.mode = &scnd_mode_params.mode_copy;
>>> +   scnd_mode_params.primary.w = scnd_mode_params.mode->hdisplay;
>>> +   scnd_mode_params.primary.h = scnd_mode_params.mode->vdisplay;
>>> +
>>> +   fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
>>> +   fill_fb_region(&scnd_mode_params.primary, COLOR_SCND_BG);
>>> +
>>> +   __set_mode_for_params(&prim_mode_params);
>>> +   __set_mode_for_params(&scnd_mode_params);
>>> +}
>>> +
>>>    static void enable_both_screens_and_wait(const struct test_mode *t)
>>>    {
>>> +   int ret;
>>> +
>>>      fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
>>>      fill_fb_region(&scnd_mode_params.primary, COLOR_SCND_BG);
>>>
>>>      __set_mode_for_params(&prim_mode_params);
>>>      __set_mode_for_params(&scnd_mode_params);
>>>
>>> +   if (drm.display.is_atomic)
>>> +           ret = igt_display_try_commit_atomic(&drm.display,
>>> +                           DRM_MODE_ATOMIC_TEST_ONLY |
>>> +                           DRM_MODE_ATOMIC_ALLOW_MODESET,
>>> +                           NULL);
>>> +   else
>>> +           ret = igt_display_try_commit2(&drm.display, COMMIT_LEGACY);
>>> +
>>> +   if (ret)
>>> +           update_modeset_cached_params();
>>> +
>>>      igt_display_commit2(&drm.display, drm.display.is_atomic ? COMMIT_ATOMIC
>> : COMMIT_LEGACY);
>>
>> I think this statement should now be the part of the above if-block.
> I think still we need this commit, since try_commit_atomic with the flag
> DRM_MODE_ATOMIC_TEST_ONLY will do atomic check only and it really won't commit.
> Also, we'll miss some display prop clean-up display_commit_changed() with both legacy
> and atomic try commit.
>
> This comment is applicable for all patches in this series.

Oh right, this is a miss from my end. Indeed we need a commit after the 
try commit. Sorry for the confusion.

You can discard this comment for other patches as well and keep the rb.

Regards,

Ankit


>> In case either of the try commit passes without need to call
>> update_modeset_chached_params(), igt_display_commit again will be redundant.
>>
>> With that changed:
>>
>> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>
>>>      wanted_crc = &blue_crcs[t->format].crc;
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
