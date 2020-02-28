Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0BA6E158
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2020 11:06:29 +0000 (UTC)
References: <20200218001710.16537-1-sreedhar.telukuntla@intel.com>
 <20200218001710.16537-2-sreedhar.telukuntla@intel.com>
 <158195696525.19707.9349580960052193744@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <3f8e375c-dc04-f5d6-5364-a025f8167720@linux.intel.com>
Date: Fri, 28 Feb 2020 11:06:24 +0000
MIME-Version: 1.0
In-Reply-To: <158195696525.19707.9349580960052193744@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915/gem_mman: Add coherent
 mmap api support with set domain
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 17/02/2020 16:29, Chris Wilson wrote:
> Quoting Sreedhar Telukuntla (2020-02-18 00:17:09)
>> gem_mmap__device_coherent_domain api maps buffer object and returns
>> the memory domain to be used by the caller for subsequent set_domain
>> call for cpu access.
>>
>> gem_mmap__device_coherent_sync api maps buffer object and also does
>> set_domain to make the memory ready for cpu access.
>>
>> Signed-off-by: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   lib/i915/gem_mman.c | 76 ++++++++++++++++++++++++++++++++++++++++++---
>>   lib/i915/gem_mman.h |  6 +++-
>>   2 files changed, 77 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
>> index 08ae6769..b8d20c07 100644
>> --- a/lib/i915/gem_mman.c
>> +++ b/lib/i915/gem_mman.c
>> @@ -345,21 +345,25 @@ void *gem_mmap_offset__wc(int fd, uint32_t handle, uint64_t offset,
>>    * @offset: offset in the gem buffer of the mmap arena
>>    * @size: size of the mmap arena
>>    * @prot: memory protection bits as used by mmap()
>> + * @domain: cache  domain used for mmap
>>    *
>>    * Returns: A pointer to a block of linear device memory mapped into the
>>    * process with WC semantics. When no WC is available try to mmap using GGTT.
>>    */
>>   void *__gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
>> -                                 uint64_t size, unsigned prot)
>> +                                 uint64_t size, unsigned prot, uint32_t *domain)
>>   {
>>          void *ptr = __gem_mmap_offset(fd, handle, offset, size, prot,
>>                                        I915_MMAP_OFFSET_WC);
>>          if (!ptr)
>>                  ptr = __gem_mmap__wc(fd, handle, offset, size, prot);
>>   
>> -       if (!ptr)
>> -               ptr = __gem_mmap__gtt(fd, handle, size, prot);
>> +       *domain = I915_GEM_DOMAIN_WC;
>>   
>> +       if (!ptr) {
>> +               ptr = __gem_mmap__gtt(fd, handle, size, prot);
>> +               *domain = I915_GEM_DOMAIN_GTT;
>> +       }
>>          return ptr;
>>   }
>>   
>> @@ -382,15 +386,79 @@ void *gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
>>                                  uint64_t size, unsigned prot)
>>   {
>>          void *ptr;
>> +       uint32_t domain;
>>   
>>          igt_assert(offset == 0);
>>   
>> -       ptr = __gem_mmap__device_coherent(fd, handle, offset, size, prot);
>> +       ptr = __gem_mmap__device_coherent(fd, handle, offset, size, prot, &domain);
>>          igt_assert(ptr);
>>   
>>          return ptr;
>>   }
>>   
>> +/**
>> + * gem_mmap__device_coherent_domain:
>> + * @fd: open i915 drm file descriptor
>> + * @handle: gem buffer object handle
>> + * @offset: offset in the gem buffer of the mmap arena
>> + * @size: size of the mmap arena
>> + * @prot: memory protection bits as used by mmap()
>> + * @domain: memory domain to be used by the caller for set_domain after mmap
>> + *
>> + * Call __gem_mmap__device__coherent_domain(), asserts on fail.
>> + * Offset argument passed in function call must be 0. In the future
>> + * when driver will allow slice mapping of buffer object this restriction
>> + * will be removed.
>> + *
>> + * Returns: A pointer to the created memory mapping.
>> + */
>> +void *gem_mmap__device_coherent_domain(int fd, uint32_t handle, uint64_t offset,
>> +                               uint64_t size, unsigned prot, uint32_t *domain)
>> +{
>> +       void *ptr;
>> +
>> +       igt_assert(offset == 0);
>> +
>> +       ptr = __gem_mmap__device_coherent(fd, handle, offset, size, prot, domain);
>> +       igt_assert(ptr);
>> +
>> +       return ptr;
>> +}
>> +
>> +/**
>> + * gem_mmap__device_coherent_sync:
>> + * @fd: open i915 drm file descriptor
>> + * @handle: gem buffer object handle
>> + * @offset: offset in the gem buffer of the mmap arena
>> + * @size: size of the mmap arena
>> + * @prot: memory protection bits as used by mmap()
>> + *
>> + * Call __gem_mmap__device__coherent_sync(), asserts on fail.
>> + * Offset argument passed in function call must be 0. In the future
>> + * when driver will allow slice mapping of buffer object this restriction
>> + * will be removed.
>> + *
>> + * This function sets appropriate memory domain as well once the mapping is
>> + * complete and makes the memory ready for cpu access
>> + *
>> + * Returns: A pointer to the created memory mapping.
>> + */
>> +void *gem_mmap__device_coherent_sync(int fd, uint32_t handle, uint64_t offset,
>> +                               uint64_t size, unsigned prot)
>> +{
>> +       void *ptr;
>> +       uint32_t domain;
>> +
>> +       igt_assert(offset == 0);
>> +
>> +       ptr = gem_mmap__device_coherent_domain(fd, handle, offset, size, prot, &domain);
>> +       igt_assert(ptr);
>> +
>> +       gem_set_domain(fd, handle, domain, domain);
> 
> No. Read/write is important, especially when there are comments
> indicating that the api is being subverted and abused.

Are you suggesting looking at prot & PROT_READ / PROT_WRITE to decide on 
read/write domains?

Regards,

Tvrtko

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
