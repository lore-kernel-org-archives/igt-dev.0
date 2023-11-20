Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B39410E0C2
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 14:30:04 +0000 (UTC)
Message-ID: <a3885830-d6b7-bd35-ac08-5128ccc721c2@intel.com>
Date: Mon, 20 Nov 2023 15:29:55 +0100
Content-Language: pl
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231106195947.14640-1-lukasz.laguna@intel.com>
 <20231106195947.14640-6-lukasz.laguna@intel.com>
 <0a0e6099-9fab-4906-ba18-81c615867ce1@intel.com>
 <c1dfe50d-c46c-97cb-600e-33f095d93089@intel.com>
 <0e07ddc8-a5f0-4b82-a2e3-aefffa3f4040@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <0e07ddc8-a5f0-4b82-a2e3-aefffa3f4040@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 5/8] tests/sriov_basic: add basic tests
 for enabling SR-IOV VFs
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

On 11/10/2023 20:37, Michal Wajdeczko wrote:
>
> On 09.11.2023 08:04, Laguna, Lukasz wrote:
>> On 11/6/2023 23:46, Michal Wajdeczko wrote:
>>> On 06.11.2023 20:59, Lukasz Laguna wrote:
>>>> From: Katarzyna Dec <katarzyna.dec@intel.com>
>>>>
>>>> Add subtests that validate SR-IOV VFs enabling in two variants: with
>>>> autoprobe disabled and enabled.
>>>>
>>>> Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
>>>> Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>>> Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>>> ---
>>>>    tests/meson.build   |   1 +
>>>>    tests/sriov_basic.c | 126 ++++++++++++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 127 insertions(+)
>>>>    create mode 100644 tests/sriov_basic.c
>>>>
>>>> diff --git a/tests/meson.build b/tests/meson.build
>>>> index 62721157d..7413d978c 100644
>>>> --- a/tests/meson.build
>>>> +++ b/tests/meson.build
>>>> @@ -71,6 +71,7 @@ test_progs = [
>>>>        'panfrost_submit',
>>>>        'prime_udl',
>>>>        'prime_vgem',
>>>> +    'sriov_basic',
>>>>        'syncobj_basic',
>>>>        'syncobj_eventfd',
>>>>        'syncobj_wait',
>>>> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
>>>> new file mode 100644
>>>> index 000000000..fc0914962
>>>> --- /dev/null
>>>> +++ b/tests/sriov_basic.c
>>>> @@ -0,0 +1,126 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright(c) 2023 Intel Corporation. All rights reserved.
>>>> + */
>>>> +
>>>> +#include "drmtest.h"
>>>> +#include "igt_core.h"
>>>> +#include "igt_sriov_device.h"
>>>> +
>>>> +IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual
>>>> Functions");
>>>> +
>>>> +/**
>>>> + * TEST: sriov_basic
>>>> + * Category: Software building block
>>>> + * Mega feature: SR-IOV
>>>> + * Sub-category: VFs enabling
>>>> + * Run type: BAT
>>>> + * Description: Validate SR-IOV VFs enabling
>>>> + */
>>>> +
>>>> +/**
>>>> + * SUBTEST: enable-vfs-autoprobe-off
>>>> + * Description:
>>>> + *   Verify VFs enabling without probing VF driver
>>>> + */
>>>> +static void enable_disable_vfs(int pf_fd, unsigned int num_vfs)
>>>      "enable-vfs-autoprobe-off"
>>> and
>>>      "enable_disable_vfs"
>>> are different
>>> shouldn't they match somehow ?
>> Done
>>>> +{
>>>> +    igt_debug("Using num_vfs=%u\n", num_vfs);
>>>> +
>>>> +    igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>>> this seems to duplicate first fixture, do we really need to repeat that
>>> over and over ?
>> It's not the same. First fixtureis not executed between dynamic subtests.
> hmm, I'm not an igt expert, but this seems to be little broken
>
>>>> +    igt_assert(igt_sriov_disable_driver_autoprobe(pf_fd));
>>>> +    igt_assert(!igt_sriov_is_driver_autoprobe_enabled(pf_fd));
>>> this seems crazy and unrelated to test scope - we are not checking here
>>> the behavior of the "driver_autoprobe" attribute, we should just trust
>>> that 'disable' above worked since it returned true and we already
>>> asserted that
>> Done
>>>> +    igt_assert(igt_sriov_enable_vfs(pf_fd, num_vfs));
>>>> +    igt_assert_eq(num_vfs, igt_sriov_get_enabled_vfs(pf_fd));
>>> this should be "expect" type of check, as we still want to disable VFs
>> VFs will be disabled in exit fixture. VFs disabling in subtest is needed
>> between dynamic subtests.
>>>> +    igt_assert(igt_sriov_disable_vfs(pf_fd));
>>> maybe assert here that enabled_vfs == num_vfs ?
>> Some time ago we've got a sugesstion that we should have seperate test
>> for VFs disabling. We can check
>>      igt_assert_eq(0, igt_sriov_get_enabled_vfs(pf_fd));
>> there,  when implemented.
>>>> +}
>>>> +
>>>> +/**
>>>> + * SUBTEST: enable-vfs-autoprobe-on
>>>> + * Description:
>>>> + *   Verify VFs enabling and auto-probing VF driver
>>>> + */
>>>> +static void probe_disable_vfs(int pf_fd, unsigned int num_vfs)
>>> here is even more different
>>>
>>>      "enable-vfs-autoprobe-on"
>>> vs
>>>      "probe_disable_vfs"
>>>
>>> also "probe" here may clash with future test that will "probe" just
>>> selected VF
>> Done
>>>> +{
>>>> +    bool err = false;
>>>> +
>>>> +    igt_debug("Using num_vfs=%u\n", num_vfs);
>>>> +
>>>> +    igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>>> ditto
>>>
>>>> +    igt_assert(igt_sriov_enable_driver_autoprobe(pf_fd));
>>>> +    igt_assert(igt_sriov_is_driver_autoprobe_enabled(pf_fd));
>>> ditto
>>>
>>>> +    igt_assert(igt_sriov_enable_vfs(pf_fd, num_vfs));
>>>> +    igt_assert_eq(num_vfs, igt_sriov_get_enabled_vfs(pf_fd));
>>> ditto
>>>
>>>> +    for (int vf_num = 1; vf_num <= num_vfs; ++vf_num) {
>>>> +        if (!igt_sriov_is_vf_drm_driver_probed(pf_fd, vf_num)) {
>>>> +            igt_debug("VF%u probe failed\n", vf_num);
>>>> +            err = true;
>>>> +        }
>>>> +    }
>>>> +    igt_assert(igt_sriov_disable_vfs(pf_fd));
>>> disabling VFs immediately after enabling could be treated as a "stress"
>>> test - shouldn't we have some grace period for a "basic" class test ?
>> I can add some sleep before VFs disabling. Do you have some specific
>> value we should use in mind? 2s?
> dunno
>
> but I still doubt that enabling all VFs in autoprobe mode is a good test
> for "basic" scenario (the only argument for being 'basic' is that is is
> 1-liner from test point-of-view, but definitely it is not 'basic' from
> the system and driver POV)
>
> in basic tests we should just try enable 1 VF at the time, unload it,
> then try with next one
>
> "autoprobe all" shouldn't be "Run type: BAT"

Done

>
>>> stress loop with probe/unload could be different test case
>> Yeah, it's in another patch from this series
>>>> +    igt_assert(!err);
>>>> +}
>>>> +
>>>> +igt_main
>>>> +{
>>>> +    int pf_fd;
>>>> +    bool autoprobe;
>>>> +
>>>> +    igt_fixture {
>>>> +        pf_fd = drm_open_driver(DRIVER_ANY);
>>>> +        igt_require(igt_sriov_is_pf(pf_fd));
>>>> +        igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>>>> +        autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>>>> +
>>>> +        igt_srandom();
>>> shouldn't this be part of the main() or something ?
>> Probably it could be, but no one has implemented it yet. There are many
>> other tests that initializes seed in fixture.
> but why follow bad design/pattern ?
Ok, I removed seed initialization from the test code. Will move 
igt_srandom to main in seperate series.
>
>>>> +    }
>>>> +
>>>> +    igt_describe("Verify VFs enabling without probing VF driver");
>>>> +    igt_subtest_with_dynamic("enable-vfs-autoprobe-off") {
>>>> +        for_each_num_vfs(pf_fd, num_vfs) {
>>>> +            igt_dynamic_f("numvfs-%u", num_vfs) {
>>>> +                enable_disable_vfs(pf_fd, num_vfs);
>>>> +            }
>>>> +        }
>>>> +        for_random_num_vfs(pf_fd, num_vfs) {
>>>> +            igt_dynamic_f("numvfs-random") {
>>>> +                enable_disable_vfs(pf_fd, num_vfs);
>>>> +            }
>>>> +        }
>>>> +        for_max_num_vfs(pf_fd, num_vfs) {
>>>> +            igt_dynamic_f("numvfs-all") {
>>>> +                enable_disable_vfs(pf_fd, num_vfs);
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    igt_describe("Verify VFs enabling and auto-probing VF driver");
>>>> +    igt_subtest_with_dynamic("enable-vfs-autoprobe-on") {
>>>> +        for_each_num_vfs(pf_fd, num_vfs) {
>>>> +            igt_dynamic_f("numvfs-%u", num_vfs) {
>>>> +                probe_disable_vfs(pf_fd, num_vfs);
>>>> +            }
>>>> +        }
>>>> +        for_random_num_vfs(pf_fd, num_vfs) {
>>>> +            igt_dynamic_f("numvfs-random") {
>>>> +                probe_disable_vfs(pf_fd, num_vfs);
>>>> +            }
>>>> +        }
>>>> +        for_max_num_vfs(pf_fd, num_vfs) {
>>>> +            igt_dynamic_f("numvfs-all") {
>>>> +                probe_disable_vfs(pf_fd, num_vfs);
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    igt_fixture {
>>>> +        igt_sriov_disable_vfs(pf_fd);
>>>> +        /* abort to avoid execution of next tests with enabled VFs */
>>>> +        igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed
>>>> to disable VF(s)");
>>> can't this be just:
>>>
>>>      igt_abort_on_f(!igt_sriov_disable_vfs(pf_fd), "");
>>>      igt_abort_on_f(!igt_sriov_set_driver_autoprobe(autoprobe), "");
>> It's for case when helper e.g. igt_sriov_disable_vfsdoesn't return
>> error, but VFs are still enabled.
> but do we care here ?
>
> I'm not sure that we should add test code to test other test code, as
> then you will just write code and miss what was the original goal of the
> test.
Test shouldn't leave the environment in the bad shape, so here we want 
to clean it up.
>
>>>> +        autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
>>>> +                igt_sriov_disable_driver_autoprobe(pf_fd);
>>>> +        igt_abort_on_f(autoprobe !=
>>>> igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>>>> +                   "Failed to restore sriov_drivers_autoprobe
>>>> value\n");
>>>> +        close(pf_fd);
>>>> +    }
>>>> +}
