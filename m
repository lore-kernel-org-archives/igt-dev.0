Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C739810E2E2
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 19:20:34 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50337b43ee6so1597346e87.3
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Oct 2023 12:20:34 -0700 (PDT)
Message-ID: <15e795ac-5df1-7757-bf1b-3b7079e4d847@gmail.com>
Date: Tue, 3 Oct 2023 22:20:31 +0300
MIME-Version: 1.0
To: "Wu, Hersen" <hersenxs.wu@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
References: <20231002142023.713415-1-hersenxs.wu@amd.com>
 <ab37761a-f846-8185-1a9b-ce4a32f90bdf@gmail.com>
 <PH8PR12MB6962EECDA611344070E397B9FDC4A@PH8PR12MB6962.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <PH8PR12MB6962EECDA611344070E397B9FDC4A@PH8PR12MB6962.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/kms_cursor_crc: Fix test
 intermittent failures on AMD gpu
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Wu, Hersen kirjoitti 3.10.2023 klo 16.32:
> [AMD Official Use Only - General]
> 
> Hi Juhapekka,
> 
> My understanding is as below.
> Set drm.debug = 0x256, cursor atomic checks are showed within kernel dmesg.
> HW cursor, user mode component pass cursor image to kernel. Kernel will composite cursor with primary surface.
> SW cursor, user mode components have already composited cursor with primary surface. Kernel will render primary surface.
> 
> For IGT kms_cursor_crc subtests, like onscreen_test, the test read crc from hw_test and sw_test, then compare them.
> For sw_test, even kernel renders primary surface (cursor already composited with primary surface), by AMD SW kernel driver and HW implementation, it still needs to wait for 2 vblanks to get crtc or pipe CRC stable.  -- This should be applied to all CRC reading locations for AMD GPU. I will run more tests for other IGT test and then do changes one test cases by one check.
> 
> This is reason to add wait vblank within sw_test.

Ah. Understood. Problem is not really with cursor or flip but with the 
pipe crc settling. I don't have access to AMD hw so I take your word for 
this. With this in mind your last patch look ok and it is coming back to 
me there was some (long) time ago someone doing similar fix for 
kms_rotation_crc.

Just a thought, maybe you could take a look if instead of doing these 
changes in test(s) individually you could try if it is possible to make 
generic change in libigt for crc reading with AMD cpu.

Anyway this version of the patch
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

> 
> 
> 
> Dmesg captured with drm.debug= 0x256
> 
> HW cursor:
> 
> [ 3178.487799] amdgpu 0000:03:00.0: [drm:drm_atomic_set_fb_for_plane [drm]] Set [FB:143] for [PLANE:88:plane-8] state 00000000b6cd65df
> [ 3178.487862] amdgpu 0000:03:00.0: [drm:drm_atomic_print_new_state [drm]] checking 0000000021852135
> [ 3178.487926] amdgpu 0000:03:00.0: [drm] plane[88]: plane-8
> [ 3178.487930] amdgpu 0000:03:00.0: [drm]       crtc=crtc-0
> [ 3178.487933] amdgpu 0000:03:00.0: [drm]       fb=143
> [ 3178.487936] amdgpu 0000:03:00.0: [drm]               allocated by = kms_cursor_crc
> [ 3178.487941] amdgpu 0000:03:00.0: [drm]               refcount=2
> [ 3178.487945] amdgpu 0000:03:00.0: [drm]               format=AR24 little-endian (0x34325241)
> [ 3178.487950] amdgpu 0000:03:00.0: [drm]               modifier=0x0
> [ 3178.487954] amdgpu 0000:03:00.0: [drm]               size=128x128
> [ 3178.487957] amdgpu 0000:03:00.0: [drm]               layers:
> [ 3178.487960] amdgpu 0000:03:00.0: [drm]                       size[0]=128x128
> [ 3178.487964] amdgpu 0000:03:00.0: [drm]                       pitch[0]=512
> [ 3178.487967] amdgpu 0000:03:00.0: [drm]                       offset[0]=0
> [ 3178.487971] amdgpu 0000:03:00.0: [drm]                       obj[0]:
> [ 3178.487974] amdgpu 0000:03:00.0: [drm]                               name=0
> [ 3178.487977] amdgpu 0000:03:00.0: [drm]                               refcount=3
> [ 3178.487980] amdgpu 0000:03:00.0: [drm]                               start=00101fa4
> [ 3178.487984] amdgpu 0000:03:00.0: [drm]                               size=65536
> [ 3178.487987] amdgpu 0000:03:00.0: [drm]                               imported=no
> [ 3178.487990] amdgpu 0000:03:00.0: [drm]       crtc-pos=128x128+0+0
> [ 3178.487995] amdgpu 0000:03:00.0: [drm]       src-pos=128.000000x128.000000+0.000000+0.000000
> [ 3178.488000] amdgpu 0000:03:00.0: [drm]       rotation=1
> [ 3178.488003] amdgpu 0000:03:00.0: [drm]       normalized-zpos=ff
> [ 3178.488007] amdgpu 0000:03:00.0: [drm]       color-encoding=ITU-R BT.601 YCbCr
> [ 3178.488010] amdgpu 0000:03:00.0: [drm]       color-range=YCbCr limited range
> 
> 
> SW cursor:
> 
> [ 4397.475822] amdgpu 0000:03:00.0: [drm:drm_atomic_print_new_state [drm]] checking 000000008bd035aa
> [ 4397.475897] amdgpu 0000:03:00.0: [drm] plane[70]: plane-5
> [ 4397.475901] amdgpu 0000:03:00.0: [drm]       crtc=crtc-0
> [ 4397.475904] amdgpu 0000:03:00.0: [drm]       fb=147
> [ 4397.475908] amdgpu 0000:03:00.0: [drm]               allocated by = kms_cursor_crc
> [ 4397.475912] amdgpu 0000:03:00.0: [drm]               refcount=4
> [ 4397.475916] amdgpu 0000:03:00.0: [drm]               format=XR24 little-endian (0x34325258)
> [ 4397.475921] amdgpu 0000:03:00.0: [drm]               modifier=0x0
> [ 4397.475925] amdgpu 0000:03:00.0: [drm]               size=3840x2160
> [ 4397.475929] amdgpu 0000:03:00.0: [drm]               layers:
> [ 4397.475932] amdgpu 0000:03:00.0: [drm]                       size[0]=3840x2160
> [ 4397.475937] amdgpu 0000:03:00.0: [drm]                       pitch[0]=15360
> [ 4397.475940] amdgpu 0000:03:00.0: [drm]                       offset[0]=0
> [ 4397.475944] amdgpu 0000:03:00.0: [drm]                       obj[0]:
> [ 4397.475948] amdgpu 0000:03:00.0: [drm]                               name=0
> [ 4397.475952] amdgpu 0000:03:00.0: [drm]                               refcount=2
> [ 4397.475955] amdgpu 0000:03:00.0: [drm]                               start=00103f58
> [ 4397.475959] amdgpu 0000:03:00.0: [drm]                               size=33177600
> [ 4397.475963] amdgpu 0000:03:00.0: [drm]                               imported=no
> [ 4397.475966] amdgpu 0000:03:00.0: [drm]       crtc-pos=3840x2160+0+0
> [ 4397.475971] amdgpu 0000:03:00.0: [drm]       src-pos=3840.000000x2160.000000+0.000000+0.000000
> [ 4397.475977] amdgpu 0000:03:00.0: [drm]       rotation=1
> [ 4397.475981] amdgpu 0000:03:00.0: [drm]       normalized-zpos=0
> [ 4397.475984] amdgpu 0000:03:00.0: [drm]       color-encoding=ITU-R BT.709 YCbCr
> [ 4397.475988] amdgpu 0000:03:00.0: [drm]       color-range=YCbCr limited range
> 
> 
> Thanks!
> Hersen
> 
> 
> -----Original Message-----
> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Sent: Tuesday, October 3, 2023 3:38 AM
> To: Wu, Hersen <hersenxs.wu@amd.com>; igt-dev@lists.freedesktop.org; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Hung, Alex <Alex.Hung@amd.com>; Mahfooz, Hamza <Hamza.Mahfooz@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>
> Cc: markyacoub@google.com
> Subject: Re: [PATCH] [i-g-t] tests/kms_cursor_crc: Fix test intermittent failures on AMD gpu
> 
> Hi Hersen,
> 
> On 2.10.2023 17.20, Hersen Wu wrote:
>> Wait for two more vblanks before reading crc on AMD gpu.
>>
>> Without waiting for two vblanks, AMD cursor updates may not
>> synchronized to the same frame of pipe, crc generated may not be
>> reliable.
>>
>> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
>> ---
>>    tests/kms_cursor_crc.c | 15 ++++++++++++++-
>>    1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c index
>> ba29ff65d..e3259e147 100644
>> --- a/tests/kms_cursor_crc.c
>> +++ b/tests/kms_cursor_crc.c
>> @@ -276,6 +276,15 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>>                restore_image(data, swbufidx, &((cursorarea){x, y, data->curw, data->curh}));
>>                igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
>>                igt_display_commit(display);
>> +
>> +             /* Wait for two more vblanks since cursor updates may not
>> +              * synchronized to the same frame on AMD HW
>> +              */
>> +             if (is_amdgpu_device(data->drm_fd))
>> +                     igt_wait_for_vblank_count(data->drm_fd,
>> +                             display->pipes[data->pipe].crtc_offset,
>> +                             data->vblank_wait_count);
>> +
> 
> I did mention earlier this has nothing to do with cursor. Here cursor plane is not in use, here is just being generated reference crcs and the below igt_assert_crc_equal check against earlier hw cursor generated crcs. Ie. you are here adding extra wait for normal flip where there is no cursor changes, if this is problem then other flip tests should also fail.
> 
>>                igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
>>                igt_assert_crc_equal(&crc, hwcrc);
>>        }
>> @@ -1079,7 +1088,11 @@ igt_main_args("e", NULL, help_str, opt_handler,
>> NULL)
>>
>>                igt_require_pipe_crc(data.drm_fd);
>>
>> -             data.vblank_wait_count = is_msm_device(data.drm_fd) ? 2 : 1;
>> +             /* Wait for two more vblanks since cursor updates may not
>> +              * synchronized to the same frame on AMD HW
>> +              */
>> +             data.vblank_wait_count =
>> +                     (is_msm_device(data.drm_fd) || is_amdgpu_device(data.drm_fd)) ? 2
>> +: 1;
>>        }
>>
>>        data.cursor_max_w = cursor_width;
> 
