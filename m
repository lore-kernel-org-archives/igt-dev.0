Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFF210E562
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jan 2022 18:43:40 +0000 (UTC)
Message-ID: <09d5a866-ee5e-289a-d197-304c4ab40b48@quicinc.com>
Date: Thu, 13 Jan 2022 10:43:39 -0800
MIME-Version: 1.0
From: Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20211210172006.28654-1-quic_jesszhan@quicinc.com>
 <YbyHtDTnWqD9e3QR@intel.com>
Content-Language: en-US
In-Reply-To: <YbyHtDTnWqD9e3QR@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: Remove vblank
 counter check immediately after flip_nonblocking
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: aravindh@codeaurora.org, petri.latvala@intel.com, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, quic_khsieh@quicinc.com
List-ID: <igt-dev@lists.freedesktop.org>



On 12/17/2021 4:51 AM, Ville Syrjälä wrote:
> On Fri, Dec 10, 2021 at 09:20:06AM -0800, Jessica Zhang wrote:
>> Currently, there is a check that the vblank counter shouldn't change after
>> a nonblocking page flip and DRM_IOCTL_MODE_CURSOR call. This assumes
>> that ioctl is performed before the commit from the nonblocking flip is
>> dequeued.
>>
>> The DRM_IOCTL_MODE_CURSOR callstack is as such:
>> 	drm_mode_cursor_ioctl
>> 	drm_mode_cursor_common
>> 	drm_mode_cursor_universal
>> 	__setplane_atomic
>> 	drm_atomic_helper_update_plane
>> 	drm_atomic_commit
>>
>> Becuase the commit work queue is scheduled earlier than
>> DRM_CURSOR_IOCTL, it will finish before the ioctl. Thus, we can't
>> assume that the current vblank count will match vblank_start after the
>> cursor ioctl finishes.
> 
> Your driver is broken. The legacy cursor ioctl is expected to
> not get stuck behind the page flip.
> 

Hi Ville,

How is it guaranteed that the cursor ioctl flip will always be queued 
before a nonblocking flip?

For reference, here are my logs for the subtest flip-vs-cursor-crc-atomic:

[  104.035222] (kms_cursor_legacy.c:1308): VBLANK START: 246
[  104.038913] (kms_cursor_legacy.c:1309): NONBLOCKING FLIP CALLED
[  104.044335] (drm_atomic.c:528): drm_plane lock acquired
[  104.048341] (drm_plane.c:1122): drm_crtc lock acquired
[  104.053191] (kms_cursor_legacy.c:1314): VBLANK COUNT: 248
[  104.053674] (drm_atomic_helper:1685): commit_work called
[  104.056817] (kms_cursor_legacy.c:1316): CURSOR IOCTL CALLED
[  104.056892] (drm_plane.c:1131): cursor_lock acquired
[  104.056911] (drm_atomic.c:528): drm_plane lock acquired
[  104.056986] (drm_plane.c:1080): __setplane_atomic called
[  104.081783] (kms_cursor_legacy.c:1320): VBLANK COUNT: 249


As you can see, commit_work from the nonblocking flip has been called 
before the cursor ioctl. In addition, the msm implementation of the 
nonblocking commit points back to drm_atomic_helper_commit [1], so the 
issue is not necessarily driver specific AFAIK.


Thanks,
Jessica Zhang

[1] 
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/msm_drv.c#L49



>>
>> Tested-on: Chromebook Lazor (Trogdor)
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   tests/kms_cursor_legacy.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
>> index d50155e8..82c01bc8 100644
>> --- a/tests/kms_cursor_legacy.c
>> +++ b/tests/kms_cursor_legacy.c
>> @@ -1307,8 +1307,6 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>>   		flip_nonblocking(display, pipe, atomic, &fb_info, NULL);
>>   		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
>>   
>> -		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
>> -
>>   		igt_set_timeout(1, "Stuck page flip");
>>   		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
>>   		igt_reset_timeout();
>> -- 
>> 2.31.0
> 
> -- 
> Ville Syrjälä
> Intel
