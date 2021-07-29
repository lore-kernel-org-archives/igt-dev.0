Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20210728103041.1669985-1-matthew.auld@intel.com>
 <20210728103041.1669985-4-matthew.auld@intel.com>
 <87eebi3ume.wl-ashutosh.dixit@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ba2ce167-59eb-95d5-61be-d9b2828ff13b@intel.com>
Date: Thu, 29 Jul 2021 09:50:45 +0100
MIME-Version: 1.0
In-Reply-To: <87eebi3ume.wl-ashutosh.dixit@intel.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t v2 04/11] lib/i915/gem_mman: add fixed
 mode to gem_mmap__cpu
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 29/07/2021 00:07, Dixit, Ashutosh wrote:
> On Wed, 28 Jul 2021 03:30:34 -0700, Matthew Auld wrote:
>>
>> diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
>> index 337d28fb..6f5e6d72 100644
>> --- a/lib/i915/gem_mman.c
>> +++ b/lib/i915/gem_mman.c
>> @@ -434,7 +434,13 @@ void *gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
>>    */
>>   void *__gem_mmap__cpu(int fd, uint32_t handle, uint64_t offset, uint64_t size, unsigned prot)
>>   {
>> -	return __gem_mmap(fd, handle, offset, size, prot, 0);
>> +	void *ptr;
>> +
>> +	ptr = __gem_mmap(fd, handle, offset, size, prot, 0);
>> +	if (!ptr)
>> +		ptr = __gem_mmap_offset__fixed(fd, handle, offset, size, prot);
>> +
>> +	return ptr;
> 
> What about __gem_mmap__wc? Also shouldn't we just fix the __gem_mmap_offset
> fallback in __gem_mmap and that will take care of both __gem_mmap__cpu and
> __gem_mmap__wc?

For gem_mmap__wc it felt like slightly too much lying, since on discrete 
smem-only buffers are always wb, and so the __wc here is not what the 
user gets with the new FIXED mode. gem_mmap__device_coherent() I think 
matches this new behaviour well, where we don't explicitly state what 
the mapping type is, but instead just guarantee that the returned 
mapping is device coherent. My rough thinking was to convert most users 
of __wc over to __device_coherent(), at least in the tests that we care 
about for discrete?

On the other hand if we are happy with the lie, I don't think anything 
will break, and pretty much all testscases using mmap I think should 
just magically work on discrete, and it does mean a less less work vs 
converting to __device_coherent?

> 
> (I think it will actually also fix __gem_mmap__device_coherent and
> __gem_mmap__cpu_coherent but maybe we can still have those patches in this
> series especially if they save a couple of system calls).
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
