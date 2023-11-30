Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C9010E32F
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 14:35:01 +0000 (UTC)
Message-ID: <584c8af1-c4c8-4aa6-87ae-dcac3b7c634c@intel.com>
Date: Thu, 30 Nov 2023 14:34:56 +0000
MIME-Version: 1.0
Content-Language: en-GB
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Pallavi Mishra <pallavi.mishra@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20231130111735.435263-1-matthew.auld@intel.com>
 <20231130135406.upn52625xf5alg24@kamilkon-desk.igk.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20231130135406.upn52625xf5alg24@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/intel/xe_create: sanity check
 all MBZ fields
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

On 30/11/2023 13:54, Kamil Konieczny wrote:
> Hi Matthew,
> On 2023-11-30 at 11:17:34 +0000, Matthew Auld wrote:
>> Explicitly check that all MBZ fields are rejected by the KMD.
> 
> Please add also info about testing extension, which is now unused.
> Write also what MBZ means, for example:
> 
> Explicitly check that all MBZ (Must Be Zero) fields are rejected.
> 
> Btw no need to mension Xe driver.
> 
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> ---
>>   tests/intel/xe_create.c | 59 +++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 54 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
>> index bb55a15e1..b0051f5d5 100644
>> --- a/tests/intel/xe_create.c
>> +++ b/tests/intel/xe_create.c
>> @@ -18,6 +18,18 @@
>>   
>>   #define PAGE_SIZE 0x1000
>>   
>> +static int ___create_bo(int fd, struct drm_xe_gem_create *create)
> 
> Could you avoid adding yet enother underscore? I would suggest
> something simple:
> 
> static int __ioctl_create(int fd, struct drm_xe_gem_create *create)
> 
> or just __create:
> 
> static int __create(int fd, struct drm_xe_gem_create *create)
> 
>> +{
>> +	int ret = 0;
>> +
>> +	if (igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, create)) {
>> +		ret = -errno;
>> +		errno = 0;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
>>   		       uint32_t *handlep)
>>   {
>> @@ -27,14 +39,11 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
>>   		.flags = flags,
>>   		.cpu_caching = __xe_default_cpu_caching_from_flags(fd, flags),
>>   	};
>> -	int ret = 0;
>> +	int ret;
>>   
>>   	igt_assert(handlep);
>>   
>> -	if (igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create)) {
>> -		ret = -errno;
>> -		errno = 0;
>> -	}
>> +	ret = ___create_bo(fd, &create);
> 
> Please avoid mixing optimizations, here it is simple and may be
> accepted but with longer patches would be cumbersome.

Thanks for reviewing. So should I split this change or can I leave it?

> 
> Regards,
> Kamil
> 
>>   	*handlep = create.handle;
>>   
>>   	return ret;
>> @@ -88,6 +97,43 @@ static void create_invalid_size(int fd)
>>   	xe_vm_destroy(fd, vm);
>>   }
>>   
>> +/**
>> + * SUBTEST: create-invalid-mbz
>> + * Functionality: ioctl
>> + * Test category: negative test
>> + * Description: Verifies xe bo create returns expected error code on all MBZ fields.
>> + */
>> +static void create_invalid_mbz(int fd)
>> +{
>> +	struct drm_xe_gem_create create = {
>> +		.size = PAGE_SIZE,
>> +		.flags = system_memory(fd),
>> +		.cpu_caching = DRM_XE_GEM_CPU_CACHING_WB,
>> +	};
>> +	int i;
>> +
>> +	/* Make sure the baseline passes */
>> +	igt_assert_eq(___create_bo(fd, &create), 0);
>> +	gem_close(fd, create.handle);
>> +	create.handle = 0;
>> +
>> +	/* No supported extensions yet */
>> +	create.extensions = -1;
>> +	igt_assert_eq(___create_bo(fd, &create), -EINVAL);
>> +	create.extensions = 0;
>> +
>> +	/* Make sure KMD rejects non-zero padding/reserved fields */
>> +	create.pad = -1;
>> +	igt_assert_eq(___create_bo(fd, &create), -EINVAL);
>> +	create.pad = 0;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(create.reserved); i++) {
>> +		create.reserved[i] = -1;
>> +		igt_assert_eq(___create_bo(fd, &create), -EINVAL);
>> +		create.reserved[i] = 0;
>> +	}
>> +}
>> +
>>   enum exec_queue_destroy {
>>   	NOLEAK,
>>   	LEAK
>> @@ -222,6 +268,9 @@ igt_main
>>   	igt_fixture
>>   		xe = drm_open_driver(DRIVER_XE);
>>   
>> +	igt_subtest("create-invalid-mbz")
>> +		create_invalid_mbz(xe);
>> +
>>   	igt_subtest("create-invalid-size") {
>>   		create_invalid_size(xe);
>>   	}
>> -- 
>> 2.43.0
>>
