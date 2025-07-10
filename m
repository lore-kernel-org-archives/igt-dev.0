Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF92EC83F1B
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 19:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386B210E942;
	Thu, 10 Jul 2025 19:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODpwz5EV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368BB10E942
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 19:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752174379; x=1783710379;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=flFEyEYAhn6brA7nnEznBnB5JkjRxMOPs88NJxuNYuE=;
 b=ODpwz5EVtTCoPMOAuoGxpQLHb0wBvRPKXCptJWPIl0z6GKm2DHvERDFc
 wLgt0owSyY38EFdMPzgiam9lk3hiNdkGPUjVpmpq6YB8dRPWMSZqvh3cV
 BIa+qlHvwZP6xeYEfRRtDdBXrP/UZiihBy3I/IJXeDsQmX+2Gw4h6ZYHV
 spollujYxQU+YPESgnhKau7Ohb1x4hNmc6BlEQS/LduWGLJKhp5NLwMoj
 C5lpSLQ+cxNlyWx7UB4amsGcyitTsuSgz0lSEN3Mk/3EfLSh84S80HV0W
 3eZZl5TXq5Ny1b7HhRoMuT1/E7EQARrx3FADhtpGKFp0oTJG3hn8FdWDI A==;
X-CSE-ConnectionGUID: JzOfIePrTYWRSYFTAOSyMA==
X-CSE-MsgGUID: Orid3qMNS5WQMLVbUgBFhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53686865"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="53686865"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:06:19 -0700
X-CSE-ConnectionGUID: WbR8UCFTSlyLE5v8IqT05g==
X-CSE-MsgGUID: YS/PjUveRbK0pjVJl1AQ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="161737672"
Received: from vmorozov-mobl.ger.corp.intel.com (HELO [10.245.80.27])
 ([10.245.80.27])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:06:16 -0700
Message-ID: <afe3c7b1-f326-4b76-9e79-165bd5da3da3@linux.intel.com>
Date: Thu, 10 Jul 2025 21:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5,resend i-g-t 3/6] tests: Add kms_debugfs
To: Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
 <20250708144039.53482-4-peter.senna@linux.intel.com>
 <20250710101339.mobt7uyicfm7webf@kamilkon-DESK.igk.intel.com>
 <71154125-b7e0-43a4-8732-607ff2ac82f5@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <71154125-b7e0-43a4-8732-607ff2ac82f5@intel.com>
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

Hi Karthik,

Thank you for your reply.

On 7/10/2025 6:09 PM, Karthik B S wrote:
> Hi Peter,
> 
> On 7/10/2025 3:43 PM, Kamil Konieczny wrote:
>> Hi Peter,
>> On 2025-07-08 at 16:40:35 +0200, Peter Senna Tschudin wrote:
>>> Introduce kms_debugfs that is expected to work with any GPU, not limited
>>> to i915 and Xe. The test powers off all available displays before
>>> reading debugfs files, and then powers on all displays before reading
>>> the files again.
>>>
>>> Cc:lucas.demarchi@intel.com
>>> Cc:rodrigo.vivi@intel.com
>>> Cc:kamil.konieczny@linux.intel.com
>>> Cc:katarzyna.piecielska@intel.com
>>> Cc:zbigniew.kempczynski@intel.com
>>> Cc:michal.wajdeczko@intel.com
>>> Cc:karthik.b.s@intel.com
>>> Signed-off-by: Peter Senna Tschudin<peter.senna@linux.intel.com>
>> +Cc: Vitaly Prosyak<vitaly.prosyak@amd.com>
>>
>> Vitaly, could you help us and forward this to your CI testing
>> team and ask them to test this on amdgpu + display connected?
>> This should pass as it is a simple debugfs reading.
>>
>>> ---
>>> v5:
>>>   - use igt_dir_process_files_simple()
>>>
>>> v4:
>>>   - change test name to kms_debugfs
>>>   - use the wrapper function igt_fit_modes_in_bw()
>>>   - use igt_display_require_output() to ensure there is at least one
>>> display
>>>
>>> v3:
>>>   - renamed the test
>>>   - Removed reference to sysfs from comments  (thanks Kamil)
>>>   - Updated description to match the display part (thanks Kamil)
>>>   - Moved from "display" to "heads". Our CI uses "headless" to refer
>>>     to a DUT without display and it is shorter
>>>   - renamed subtests for shorter names (thanks Kamil)
>>>   - fixed comments style (thanks Kamil)
>>>   - updated CC list
>>>   - changed the order to test first with all heads off then with all
>>> heads on
>>>     to prevent the need from powering on the heads at the end of the
>>> test
>>>     (thanks Kamil)
>>>   - removed snprintf from test names (thanks Kamil)
>>>   - removed subtest group (thanks Kamil)
>>>   - deleted kms_tests() and moved the code to igt_main (thanks Kamil)
>>>
>>> v2:
>>>   - changed style of comparison to NULL
>>>   - moved to a separate patch
>>>
>>>   tests/kms_debugfs.c | 151 ++++++++++++++++++++++++++++++++++++++++++++
>>>   tests/meson.build   |   1 +
>>>   2 files changed, 152 insertions(+)
>>>   create mode 100644 tests/kms_debugfs.c
>>>
>>> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
>>> new file mode 100644
>>> index 000000000..7e10c4bca
>>> --- /dev/null
>>> +++ b/tests/kms_debugfs.c
>>> @@ -0,0 +1,151 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +#include "igt.h"
>>> +#include "igt_debugfs.h"
>>> +#include "igt_dir.h"
>>> +
>>> +/**
>>> + * TEST: kms debugfs test
>>> + * Description: Read entries from debugfs with all displays on and with
>>> + *        all displays off.
>>> + *
>>> + * Category: Core
>>> + * Mega feature: General Core features
>>> + * Sub-category: uapi
>>> + * Functionality: debugfs
>>> + * Feature: core
>>> + * Test category: uapi
>>> + *
>>> + * SUBTEST: display-off-read-all
>>> + * Description: Read all debugfs entries with display off.
>>> + *
>>> + * SUBTEST: display-on-read-all
>>> + * Description: Read all debugfs entries with display on.
>>> + */
>>> +
>>> +/**
>>> + * igt_display_all_on: Try to turn on all displays
>>> + * @display: pointer to the igt_display structure
>>> + *
>>> + * Returns: void
>>> + */
>>> +static void igt_display_all_on(igt_display_t *display)
>>> +{
>>> +    struct igt_fb fb[IGT_MAX_PIPES];
>>> +    enum pipe pipe;
>>> +    int ret;
>>> +
>>> +    /* try to light all pipes */
>>> +retry:
>>> +    for_each_pipe(display, pipe) {
>>> +        igt_output_t *output;
>>> +
>>> +        for_each_valid_output_on_pipe(display, pipe, output) {
>>> +            igt_plane_t *primary;
>>> +            drmModeModeInfo *mode;
>>> +
>>> +            if (output->pending_pipe != PIPE_NONE)
>>> +                continue;
>>> +
>>> +            igt_output_set_pipe(output, pipe);
>>> +            primary = igt_output_get_plane_type(output,
>>> DRM_PLANE_TYPE_PRIMARY);
>>> +            mode = igt_output_get_mode(output);
>>> +            igt_create_pattern_fb(display->drm_fd,
>>> +                        mode->hdisplay, mode->vdisplay,
>> Align here.
>>
>>> +                        DRM_FORMAT_XRGB8888,
>> Same.
>>
>>> +                        DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
>> Same.
>>
>>> +
>>> +            /* Set a valid fb as some debugfs like to
>>> +             * inspect it on a active pipe
>>> +             */
>>> +            igt_plane_set_fb(primary, &fb[pipe]);
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    if (display->is_atomic) {
>>> +        bool found = igt_fit_modes_in_bw(display);
>>> +
>>> +        ret = found ? 0 : -1;
>>> +        igt_require_f(found, "No valid mode combo found.\n");
>>> +    } else
>>> +        ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>> Add braces for 'else' here:
>>     } else {
>>         ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>>     }
>>
>> You could see it yourself with checkpatch.pl with options from
>> CONTRIBUTING.md:
>>
>> 0003-tests-Add-kms_debugfs.patch:99: CHECK:BRACES: braces {} should be
>> used on all arms of this statement
>> #99: FILE: tests/kms_debugfs.c:69:
>> +       if (display->is_atomic) {
>>     [...]
>>     +       } else
>>     [...]
>>
>> 0003-tests-Add-kms_debugfs.patch:104: CHECK:BRACES: Unbalanced braces
>> around else statement
>> #104: FILE: tests/kms_debugfs.c:74:
>>     +       } else
>>
>>> +
>>> +    if (ret) {
>>> +        igt_output_t *output;
>>> +
>>> +        for_each_connected_output(display, output)
>>> +            igt_output_set_pipe(output, PIPE_NONE);
>>> +
>> Please add some counter and abort on reaching max_retry
>> to prevent infinite loop here. Something like:
>>
>>         ++cnt_retry;
>>         igt_assert_f(cnt_retry < MAX_IGT_PIPES, "Too much retries
>> %d\n", cnt_retry);
>>
>> Karthik or Swati: I am not sure if this is needed, could you comment
>> on this here?
> 
> |I think we don't need a retry at all here. If there is a fail with the
> first commit just try if we're able to go ahead after using
> 'igt_fit_modes_in_bw' and if it doesn't allow just skip the test here.
> That was my motivation to suggest to use the wrapper on the previous
> revision of the patch.|
> 
> |The only issue currently I see(that I just observed) is in
> 'igt_fit_modes_in_bw' the try_commit we're doing is using atomic commit
> by default, although there is no reason to have this restriction. So
> ideally we would want to fix that in lib and then just have something
> like below in this test.|

This is getting a bit out of hand for me because I don't know much about
displays. First you asked me to use a wrapper, now you want me to fix
the wrapper. I will pass fixing the wrapper as this may lead to yet more
unrelated work.

Should I revert back to not using igt_fit_modes_in_bw()?

> 
> |if (atomic)|
> 
> |    ret = igt_display_try_atomic_commit|
> 
> |else|
> 
> |    ret = igt_display_try_commit2(legacy)|
> 
> |if (ret)|
> 
> |    igt_require(||igt_fit_modes_in_bw(display))|
> 
> |igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC :
> COMMIT_LEGACY);|

I am not sure I follow what you are suggesting here.

Thank you,

Peter

> 
> |Regards,|
> |Karthik.B.S|
>>
>> Overall code looks good.
>>
>> Regards,
>> Kamil
>>
>>> +        goto retry;
>>> +    }
>>> +
>>> +    igt_display_commit2(display, display->is_atomic ?
>>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>> +}
>>> +
>>> +/**
>>> + * igt_display_all_off: Try to turn off all displays
>>> + * @display: pointer to the igt_display structure
>>> + *
>>> + * Returns: void
>>> + */
>>> +static void igt_display_all_off(igt_display_t *display)
>>> +{
>>> +    enum pipe pipe;
>>> +    igt_output_t *output;
>>> +    igt_plane_t *plane;
>>> +
>>> +    for_each_connected_output(display, output)
>>> +        igt_output_set_pipe(output, PIPE_NONE);
>>> +
>>> +    for_each_pipe(display, pipe)
>>> +        for_each_plane_on_pipe(display, pipe, plane)
>>> +            igt_plane_set_fb(plane, NULL);
>>> +
>>> +    igt_display_commit2(display, display->is_atomic ?
>>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>> +}
>>> +
>>> +IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
>>> +
>>> +igt_main
>>> +{
>>> +    int debugfs = -1;
>>> +    igt_display_t *display;
>>> +    int fd = -1;
>>> +
>>> +    igt_fixture {
>>> +        fd = drm_open_driver_master(DRIVER_ANY);
>>> +        debugfs = igt_debugfs_dir(fd);
>>> +        igt_require(debugfs >= 0);
>>> +
>>> +        kmstest_set_vt_graphics_mode();
>>> +
>>> +        display = calloc(1, sizeof(*display));
>>> +        igt_display_require(display, fd);
>>> +
>>> +        /* Make sure we have at least one output connected */
>>> +        igt_display_require_output(display);
>>> +    }
>>> +
>>> +    igt_subtest("display-off-read-all") {
>>> +        igt_display_all_off(display);
>>> +
>>> +        igt_dir_process_files_simple(debugfs);
>>> +    }
>>> +
>>> +    igt_subtest("display-on-read-all") {
>>> +        /* try to light all pipes */
>>> +        igt_display_all_on(display);
>>> +
>>> +        igt_dir_process_files_simple(debugfs);
>>> +    }
>>> +
>>> +    igt_fixture {
>>> +        igt_display_fini(display);
>>> +        close(debugfs);
>>> +        drm_close_driver(fd);
>>> +    }
>>> +}
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index 99d7d95be..1009bef2e 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -29,6 +29,7 @@ test_progs = [
>>>       'kms_cursor_crc',
>>>       'kms_cursor_edge_walk',
>>>       'kms_cursor_legacy',
>>> +    'kms_debugfs',
>>>       'kms_dither',
>>>       'kms_display_modes',
>>>       'kms_dp_aux_dev',
>>> -- 
>>> 2.43.0
>>>

