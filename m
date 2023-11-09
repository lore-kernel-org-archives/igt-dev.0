Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD36810E1BD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 06:59:05 +0000 (UTC)
Message-ID: <436c9459-d34c-c1ea-c11d-afd6c21686b0@intel.com>
Date: Thu, 9 Nov 2023 07:58:56 +0100
Content-Language: pl
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231106195947.14640-1-lukasz.laguna@intel.com>
 <20231106195947.14640-5-lukasz.laguna@intel.com>
 <36149e36-d8c0-4ce8-a33d-1602884a8df3@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <36149e36-d8c0-4ce8-a33d-1602884a8df3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/8] lib/igt_sriov_device: add helpers
 for operations in different VFs scenarios
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


On 11/6/2023 23:13, Michal Wajdeczko wrote:
>
> On 06.11.2023 20:59, Lukasz Laguna wrote:
>> Added helpers:
>> - for_each_vf and for_each_num_vfs
>> - for_random_vf and for_random_num_vfs
>> - for_last_vf and for_max_num_vfs
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   lib/igt_sriov_device.h | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
>> index be4e56cf3..78cb0e73b 100644
>> --- a/lib/igt_sriov_device.h
>> +++ b/lib/igt_sriov_device.h
>> @@ -19,4 +19,22 @@ bool igt_sriov_disable_driver_autoprobe(int pf);
>>   int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
>>   bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
>>   
> please document macros and their params
Done
>
>> +#define for_each_vf(__pf_fd, __vf_num) \
>> +	for (unsigned int __vf_num = 1, __total_vfs = igt_sriov_get_total_vfs(__pf_fd); \
>> +	     __vf_num <= __total_vfs; \
>> +	     ++__vf_num)
>> +#define for_each_num_vfs for_each_vf
> why do you need this alias ?
If test operates on ranges of VFs, not on specific VFs then code it's 
more readable and clear with this alias.
>
>> +
>> +#define for_random_vf(__pf_fd, __vf_num) \
>> +	for (unsigned int __vf_num = 1 + random() % igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
>> +	     __tmp < 1; \
>> +	     ++__tmp)
>> +#define for_random_num_vfs for_random_vf
>> +
>> +#define for_last_vf(__pf_fd, __vf_num) \
>> +	for (unsigned int __vf_num = igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
>> +	     __tmp < 1; \
>> +	     ++__tmp)
>> +#define for_max_num_vfs for_last_vf
>> +
>>   #endif /* __IGT_SRIOV_DEVICE_H__ */
