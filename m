Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D017910E34B
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 13:17:27 +0000 (UTC)
Message-ID: <03d5feef-b247-40a0-db40-e956b55255b3@intel.com>
Date: Tue, 16 May 2023 18:47:02 +0530
References: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
 <20230504045726.2954788-2-bhanuprakash.modem@intel.com>
 <20230509103058.3jajdqpxvvlqfzi4@kamilkon-desk1>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230509103058.3jajdqpxvvlqfzi4@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 1/6] lib: Interface to close the drm fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, ankit.k.nautiyal@intel.com, mchehab@kernel.org, zbigniew.kempczynski@intel.com, karthik.b.s@intel.com, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

On Tue-09-05-2023 04:00 pm, Kamil Konieczny wrote:
> Hi Bhanuprakash,
> 
> On 2023-05-04 at 10:27:21 +0530, Bhanuprakash Modem wrote:
>> Add new helper drm_close_driver() to close the drm fd. So that
> -------------------------------------------------------- ^^^^^^^
> s/So that/Now/
> 
>> every user could call drm_close_driver() instead of close().
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   lib/drmtest.c | 17 +++++++++++++++++
>>   lib/drmtest.h |  1 +
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/lib/drmtest.c b/lib/drmtest.c
>> index c91a91425..03b5239b2 100644
>> --- a/lib/drmtest.c
>> +++ b/lib/drmtest.c
>> @@ -604,6 +604,23 @@ int drm_open_driver(int chipset)
>>   	return fd;
>>   }
>>   
>> +/**
>> + * drm_close_driver:
>> + * @fd: a drm file descriptor
>> + *
>> + * Close the drm file descriptor @fd.
>> + *
>> + * Returns: 0 on success or -1 on error.
>> + */
>> +int drm_close_driver(int fd)
>> +{
>> +	/* Avoid closing standard file descriptors (0, 1, and 2). */
>> +	if (fd < 3)
> 
> -1 is ok here, if you are concerned about 0...2 imho print debug
> message here for these.

Sure, will fix this in next rev.

> 
>> +		return -1;
>> +
>> +	return close(fd);
>> +}
>> +
>>   /**
>>    * drm_open_driver_master:
>>    * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
>> diff --git a/lib/drmtest.h b/lib/drmtest.h
>> index 3c88b85c6..2b7ffc765 100644
>> --- a/lib/drmtest.h
>> +++ b/lib/drmtest.h
>> @@ -105,6 +105,7 @@ int drm_open_driver_render(int chipset);
>>   int __drm_open_driver_another(int idx, int chipset);
>>   int __drm_open_driver(int chipset);
>>   int __drm_open_driver_render(int chipset);
>> +int drm_close_driver(int fd);
> 
> imho this may be __drm_close_driver(int fd) and drm_close_driver
> could be macro with setting fd to -1 after succesfull close ?

Not understood, why do we need to set fd = -1 ?

- Bhanu

> 
> Regards,
> Kamil
> 
>>   
>>   void igt_require_amdgpu(int fd);
>>   void igt_require_intel(int fd);
>> -- 
>> 2.40.0
>>

