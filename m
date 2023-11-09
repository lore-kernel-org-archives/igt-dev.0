Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3DD10E1BE
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 07:07:04 +0000 (UTC)
Message-ID: <cfd5dfb7-25bd-b6d1-069b-cf53c9c021d9@intel.com>
Date: Thu, 9 Nov 2023 08:06:41 +0100
Content-Language: pl
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231106195947.14640-1-lukasz.laguna@intel.com>
 <20231106195947.14640-8-lukasz.laguna@intel.com>
 <ede911d8-3053-4446-b69e-427c473e7a20@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <ede911d8-3053-4446-b69e-427c473e7a20@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 7/8] tests/sriov_basic: validate driver
 binding to VFs
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


On 11/6/2023 23:59, Michal Wajdeczko wrote:
>
> On 06.11.2023 20:59, Lukasz Laguna wrote:
>> From: Katarzyna Dec <katarzyna.dec@intel.com>
>>
>> Test enables VFs in range <1..totalvfs>, bind driver to all of them and
>> then unbind driver from all of them.
> commit message seems outdated
What do you mean? I don't see anything wrong
>
>> Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
>> Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   tests/sriov_basic.c | 51 +++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
>> index fc0914962..179731daf 100644
>> --- a/tests/sriov_basic.c
>> +++ b/tests/sriov_basic.c
>> @@ -61,6 +61,38 @@ static void probe_disable_vfs(int pf_fd, unsigned int num_vfs)
>>   	igt_assert(!err);
>>   }
>>   
>> +/**
>> + * SUBTEST: enable-vfs-bind-all-unbind-all
>> + * Description:
>> + *   Verify VFs enabling, binding the driver and then unbinding it from all of them
>> + */
>> +static void enable_vfs_bind_all_unbind_all(int pf_fd, unsigned int num_vfs)
>> +{
>> +	igt_debug("Using num_vfs=%u\n", num_vfs);
> nit: "Testing %u VFs" ?
Done
>
>> +
>> +	igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> duplicates main fixture
As already answered in different patch - first fixtureis not executed 
between dynamic subtests.
>
>> +	igt_warn_on(!igt_sriov_disable_driver_autoprobe(pf_fd));
>> +	igt_skip_on(igt_sriov_is_driver_autoprobe_enabled(pf_fd));
> why do we need warn/skip here ?
> can't we just assert that 'disable' worked ?
Done
>
>> +
>> +	igt_warn_on(!igt_sriov_enable_vfs(pf_fd, num_vfs));
> can't we just assert ?
Done
>
>> +	igt_assert_eq(num_vfs, igt_sriov_get_enabled_vfs(pf_fd));
> why we care here ? if not all are enabled then we fail just later
> and this is not a test for "enable VFs" that enabled==requested
Done
>
>> +	igt_warn_on(!igt_sriov_enable_driver_autoprobe(pf_fd));
>> +	igt_assert(igt_sriov_is_driver_autoprobe_enabled(pf_fd));
> can't we just warn ?
> if that we fail to enable then probe below will fail anyway
Done
>
>> +
>> +	for (int i = 1; i <= num_vfs; i++) {
>> +		igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, i));
>> +		igt_assert(igt_sriov_bind_vf_drm_driver(pf_fd, i));
>> +		igt_assert(igt_sriov_is_vf_drm_driver_probed(pf_fd, i));
> shouldn't we just "expect" to make sure to call "disable VFs" ?
VFs will be disabled in exit fixture. VFs disabling in subtest is needed 
between dynamic subtests.
>
>> +	}
>> +
>> +	for (int i = 1; i <= num_vfs; i++) {
>> +		igt_assert(igt_sriov_unbind_vf_drm_driver(pf_fd, i));
>> +		igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, i));
> do we need to have all VFs loaded ?
> maybe for BAT test we can just bind/unload one VF at the time ?
We have such test as well:
[PATCH i-g-t 8/8] tests/sriov_basic: add more tests for VF driver binding
     SUBTEST: enable-vfs-bind-unbind-each
     SUBTEST: bind-unbind-vf
>
> otherwise it will be almost the same level of stress as in
> "enable-vfs-autoprobe-on" but with 'manual probe' loop of all VFs
>
>> +	}
>> +
>> +	igt_assert(igt_sriov_disable_vfs(pf_fd));
>> +}
>> +
>>   igt_main
>>   {
>>   	int pf_fd;
>> @@ -113,6 +145,25 @@ igt_main
>>   		}
>>   	}
>>   
>> +	igt_describe("Verify VFs enabling, binding the driver and then unbinding it from all of them");
>> +	igt_subtest_with_dynamic("enable-vfs-bind-all-unbind-all") {
>> +		for_each_num_vfs(pf_fd, num_vfs) {
>> +			igt_dynamic_f("numvfs-%u", num_vfs) {
>> +				enable_vfs_bind_all_unbind_all(pf_fd, num_vfs);
>> +			}
>> +		}
>> +		for_random_num_vfs(pf_fd, num_vfs) {
>> +			igt_dynamic_f("numvfs-random") {
>> +				enable_vfs_bind_all_unbind_all(pf_fd, num_vfs);
>> +			}
>> +		}
>> +		for_max_num_vfs(pf_fd, num_vfs) {
>> +			igt_dynamic_f("numvfs-all") {
>> +				enable_vfs_bind_all_unbind_all(pf_fd, num_vfs);
>> +			}
>> +		}
>> +	}
>> +
>>   	igt_fixture {
>>   		igt_sriov_disable_vfs(pf_fd);
>>   		/* abort to avoid execution of next tests with enabled VFs */
