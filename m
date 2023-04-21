Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DC510EDD6
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 09:33:34 +0000 (UTC)
Message-ID: <9da95b20-6108-f4d0-9cea-e0a804f6145c@intel.com>
Date: Fri, 21 Apr 2023 15:03:13 +0530
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
 <ZD7MIIwPHu+eM8ZR@intel.com> <20230419070151.ezivqrifp2qk6q7o@zkempczy-mobl2>
 <bd850ded-b4b7-dd17-ea3a-8433557c3b54@intel.com>
 <3d505bfb-5845-0196-67da-dd21c502fc18@intel.com>
 <fc38c33f-8f13-c886-6787-4b7f6aafe7ad@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <fc38c33f-8f13-c886-6787-4b7f6aafe7ad@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 00/45] Add IGT display support for XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 4/21/2023 1:03 PM, Modem, Bhanuprakash wrote:
>
> On Fri-21-04-2023 12:17 pm, Nautiyal, Ankit K wrote:
>>
>> On 4/19/2023 5:27 PM, Modem, Bhanuprakash wrote:
>>> Hi,
>>>
>>> On Wed-19-04-2023 12:31 pm, Zbigniew Kempczyński wrote:
>>>> On Tue, Apr 18, 2023 at 07:58:08PM +0300, Ville Syrjälä wrote:
>>>>> On Tue, Apr 18, 2023 at 10:14:16PM +0530, Bhanuprakash Modem wrote:
>>>>>> Add IGT support to work kms tests on XE driver.
>>>>>>
>>>>>> TODO: Spin, BUSY & HANG related tests.
>>>>>>
>>>>>> Bhanuprakash Modem (35):
>>>>>>    lib: Use i915 namespace for XE debugfs
>>>>>>    lib/igt_fb: Add copy engine support for XE
>>>>>>    lib/igt_draw: Add gpu draw routine support for XE
>>>>>>    tests/i915/kms_big_fb: Add XE support
>>>>>>    tests/i915/kms_big_joiner: Add XE support
>>>>>>    tests/i915/kms_cdclk: Add XE support
>>>>>>    tests/i915/kms_draw_crc: Add XE support
>>>>>>    tests/i915/kms_dsc: Add XE support
>>>>>>    tests/i915/kms_flip_scaled_crc: Add XE support
>>>>>>    tests/i915/kms_flip_tiling: Add XE support
>>>>>>    tests/i915/kms_mmap_write_crc: Add XE support
>>>>>>    tests/i915/kms_psr*: Add XE support
>>>>>>    tests/kms_3d: Add XE support
>>>>>>    tests/kms_async_flips: No XE support
>>>>>>    tests/kms_atomic_transition: Add XE support
>>>>>>    tests/color: Add XE support
>>>>>>    tests/kms_concurrent: Add XE support
>>>>>>    tests/kms_content_protection: Add XE support
>>>>>>    tests/kms_cursor_crc: Add XE support
>>>>>>    tests/kms_cursor_legacy: Add XE support
>>>>>>    tests/kms_flip: Add XE support
>>>>>>    tests/kms_flip_event_leak: Add XE support
>>>>>>    tests/kms_getfb: Add XE support
>>>>>>    tests/kms_hdmi_inject: Add XE support
>>>>>>    tests/kms_hdr: Add XE support
>>>>>>    tests/kms_panel_fitting: Add XE support
>>>>>>    tests/kms_plane: Add XE support
>>>>>>    tests/kms_plane_lowers: Add XE support
>>>>>>    tests/kms_plane_scaling: Add XE support
>>>>>>    tests/kms_prime: Add XE support
>>>>>>    tests/kms_rotation_crc: Add XE support
>>>>>>    tests/kms_setmode: Add XE support
>>>>>>    tests/kms_universal_plane: Add XE support
>>>>>>    tests/kms: Move intel specific kms tests to new dir
>>>>>
>>>>> Feels like the whole xe lib/ stuff is basically
>>>>> a failure if we need to touch that many things
>>>>
>>>> Why you think so? Changes:
>>>>
>>>> -               if (is_i915_device(data->drm_fd))
>>>> +               if (is_intel_device(data->drm_fd))
>>>
>>> Yes most of the changes are to update *i915* to *intel* and few 
>>> unavoidable changes like:
>>> -    data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
>>> +    data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>>>
>>>
>>> Also, there are few xe_device specific changes like:
>>> +        if (is_xe_device(drm_fd))
>>> +            xe_device_get(drm_fd);
>>>
>>> +        if (is_xe_device(drm_fd))
>>> +            xe_device_put(drm_fd);
>>>
>>>
>>> @Zbigniew, How about moving xe_device_get() to drm_open_driver()?
>>> So that, no need to call xe_device_get() in test level.
>>
>>
>> I agree, with this approach.
>>
>> Currently a new test that is meant to run on any drm driver will need 
>> to add this explicitly, so that it runs on XE driver.
>>
>> As mentioned by Bhanu, will need to have a wrapper around 
>> close(drm_fd), where we can do xe_device_put().
>
> For most of the kms tests, igt_display_require() & igt_display_fini() 
> will takecare of xe_device.
>
> Few kms tests those are not using igt_display_require() must takecare 
> of xe_device explictly.
>
> - Bhanu


Apart from that in function gem_set_domain() is it possible to just 
return, in case of xe device.

Similarly in gem_buffer_create_fb_obj  have a check for xe_device and 
call xe_bo_create_flags.

This will help to avoid changes in the test files.

Regards,

Ankit



>
>>
>> Regards,
>>
>> Ankit
>>
>>> --- a/lib/drmtest.c
>>> +++ b/lib/drmtest.c
>>> @@ -601,6 +601,9 @@ int drm_open_driver(int chipset)
>>>                 }
>>>         }
>>>
>>> +       if (is_xe_device(fd))
>>> +               xe_device_get(fd);
>>> +
>>>         return fd;
>>>  }
>>>
>>> Ofcourse we need some efforts to handle xe_device_put():
>>> 1- Create a new helper maybe drm_close(fd)
>>>     drm_close(int fd) {
>>>         if (is_xe_device(fd))
>>>             xe_device_put(fd);
>>>
>>>         close(fd);
>>>     }
>>> 2- Update both kms & gem tests to use s/close(fd)/drm_close(fd)/
>>>
>>> - Bhanu
>>>
>>>>
>>>> which checks intel (i915 or xe) looks good for me. I mean
>>>> I wouldn't like to handle xe in is_i915_device() check.
>>>>
>>>> -- 
>>>> Zbigniew
>>>>
>>>>
>>>>>
>>>>>>    xe-fast-feedback: Add kms tests to XE BAT
>>>>>>
>>>>>> Zbigniew Kempczyński (10):
>>>>>>    lib/xe_ioctl: Add missing header for direct resolving
>>>>>>    lib/xe_query: Add region helpers and missing doc
>>>>>>    lib/xe_query: Remove commented out function prototype
>>>>>>    lib/intel_allocator: Add allocator support for Xe
>>>>>>    lib/intel_bufops: Add Xe support in bufops
>>>>>>    lib/intel_batchbuffer: Add Xe support in intel-bb
>>>>>>    tests/xe_intel_bb: Check if intel-bb Xe support correctness
>>>>>>    tests/xe-fast-feedback: Add xe_intel_bb test to BAT
>>>>>>    lib/gpgpu_fill: Use RENDER engine flag to work on Xe
>>>>>>    tests/xe_gpgpu_fill: Exercise gpgpu fill on Xe
>>>>>>
>>>>>>   lib/gpgpu_fill.c                            |    4 +-
>>>>>>   lib/gpu_cmds.c                              |    2 +-
>>>>>>   lib/igt_draw.c                              |   82 +-
>>>>>>   lib/igt_draw.h                              |    2 +
>>>>>>   lib/igt_fb.c                                |   30 +-
>>>>>>   lib/igt_fb.h                                |    2 +
>>>>>>   lib/igt_kms.c                               |    4 +-
>>>>>>   lib/igt_psr.c                               |    4 +-
>>>>>>   lib/intel_allocator.c                       |   49 +-
>>>>>>   lib/intel_aux_pgtable.c                     |    2 +-
>>>>>>   lib/intel_batchbuffer.c                     |  430 +++++--
>>>>>>   lib/intel_batchbuffer.h                     |   28 +-
>>>>>>   lib/intel_bufops.c                          |   73 +-
>>>>>>   lib/intel_bufops.h                          |   13 +-
>>>>>>   lib/xe/xe_ioctl.h                           |    1 +
>>>>>>   lib/xe/xe_query.c                           |   45 +
>>>>>>   lib/xe/xe_query.h                           |    3 +-
>>>>>>   tests/chamelium/kms_chamelium_color.c       |    2 +-
>>>>>>   tests/i915/gem_caching.c                    |    4 +-
>>>>>>   tests/i915/gem_pxp.c                        |    2 +-
>>>>>>   tests/intel-ci/xe-fast-feedback.testlist    |   50 +
>>>>>>   tests/{i915 => intel}/kms_big_fb.c          |   75 +-
>>>>>>   tests/{i915 => intel}/kms_big_joiner.c      |    2 +-
>>>>>>   tests/{i915 => intel}/kms_cdclk.c           |    5 +-
>>>>>>   tests/{i915 => intel}/kms_draw_crc.c        |   24 +-
>>>>>>   tests/{i915 => intel}/kms_dsc.c             |    2 +-
>>>>>>   tests/{i915 => intel}/kms_dsc_helper.c      |    0
>>>>>>   tests/{i915 => intel}/kms_dsc_helper.h      |    0
>>>>>>   tests/{i915 => intel}/kms_flip_scaled_crc.c |    8 +-
>>>>>>   tests/{i915 => intel}/kms_flip_tiling.c     |    8 +-
>>>>>>   tests/{i915 => intel}/kms_mmap_write_crc.c  |    4 +-
>>>>>>   tests/{i915 => intel}/kms_psr.c             |   40 +-
>>>>>>   tests/{i915 => intel}/kms_psr2_sf.c         |    2 +-
>>>>>>   tests/{i915 => intel}/kms_psr2_su.c         |    2 +-
>>>>>>   tests/{i915 => intel}/kms_psr_stress_test.c |    2 +-
>>>>>>   tests/kms_3d.c                              |    8 +
>>>>>>   tests/kms_async_flips.c                     |    8 +-
>>>>>>   tests/kms_atomic_transition.c               |    8 +-
>>>>>>   tests/kms_color.c                           |   10 +-
>>>>>>   tests/kms_color_helper.c                    |    2 +-
>>>>>>   tests/kms_concurrent.c                      |    4 +-
>>>>>>   tests/kms_content_protection.c              |   12 +-
>>>>>>   tests/kms_cursor_crc.c                      |    4 +-
>>>>>>   tests/kms_cursor_legacy.c                   |    4 +-
>>>>>>   tests/kms_flip.c                            |   32 +-
>>>>>>   tests/kms_flip_event_leak.c                 |    5 +
>>>>>>   tests/kms_getfb.c                           |   22 +-
>>>>>>   tests/kms_hdmi_inject.c                     |   10 +-
>>>>>>   tests/kms_hdr.c                             |    8 +-
>>>>>>   tests/kms_panel_fitting.c                   |   12 +-
>>>>>>   tests/kms_plane.c                           |   19 +-
>>>>>>   tests/kms_plane_lowres.c                    |    9 +-
>>>>>>   tests/kms_plane_scaling.c                   |   41 +-
>>>>>>   tests/kms_prime.c                           |  241 +++-
>>>>>>   tests/kms_rotation_crc.c                    |   25 +-
>>>>>>   tests/kms_setmode.c                         |    7 +
>>>>>>   tests/kms_universal_plane.c                 |   15 +-
>>>>>>   tests/meson.build                           |   39 +-
>>>>>>   tests/xe/xe_gpgpu_fill.c                    |  133 +++
>>>>>>   tests/xe/xe_intel_bb.c                      | 1181 
>>>>>> +++++++++++++++++++
>>>>>>   60 files changed, 2513 insertions(+), 352 deletions(-)
>>>>>>   rename tests/{i915 => intel}/kms_big_fb.c (92%)
>>>>>>   rename tests/{i915 => intel}/kms_big_joiner.c (99%)
>>>>>>   rename tests/{i915 => intel}/kms_cdclk.c (98%)
>>>>>>   rename tests/{i915 => intel}/kms_draw_crc.c (92%)
>>>>>>   rename tests/{i915 => intel}/kms_dsc.c (99%)
>>>>>>   rename tests/{i915 => intel}/kms_dsc_helper.c (100%)
>>>>>>   rename tests/{i915 => intel}/kms_dsc_helper.h (100%)
>>>>>>   rename tests/{i915 => intel}/kms_flip_scaled_crc.c (98%)
>>>>>>   rename tests/{i915 => intel}/kms_flip_tiling.c (96%)
>>>>>>   rename tests/{i915 => intel}/kms_mmap_write_crc.c (98%)
>>>>>>   rename tests/{i915 => intel}/kms_psr.c (93%)
>>>>>>   rename tests/{i915 => intel}/kms_psr2_sf.c (99%)
>>>>>>   rename tests/{i915 => intel}/kms_psr2_su.c (99%)
>>>>>>   rename tests/{i915 => intel}/kms_psr_stress_test.c (99%)
>>>>>>   create mode 100644 tests/xe/xe_gpgpu_fill.c
>>>>>>   create mode 100644 tests/xe/xe_intel_bb.c
>>>>>>
>>>>>> -- 
>>>>>> 2.40.0
>>>>>
>>>>> -- 
>>>>> Ville Syrjälä
>>>>> Intel
