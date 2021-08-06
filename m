Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20210730085348.2326899-1-matthew.auld@intel.com>
 <20210730085348.2326899-3-matthew.auld@intel.com>
 <87pmuw5pg8.wl-ashutosh.dixit@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <56a57564-961f-f7da-a6d2-bf8eb577d852@linux.intel.com>
Date: Fri, 6 Aug 2021 12:10:54 +0200
MIME-Version: 1.0
In-Reply-To: <87pmuw5pg8.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH i-g-t v3 03/11] lib/i915/gem_mman: add fixed
 mode to gem_mmap_offset__cpu
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Ramalingam C <ramalingam.c@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Op 02-08-2021 om 08:29 schreef Dixit, Ashutosh:
> On Fri, 30 Jul 2021 01:53:40 -0700, Matthew Auld wrote:
>> On discrete we only support the new fixed mode.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Ramalingam C <ramalingam.c@intel.com>
>> ---
>>  lib/i915/gem_mman.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
>> index c432bb16..563a7ccf 100644
>> --- a/lib/i915/gem_mman.c
>> +++ b/lib/i915/gem_mman.c
>> @@ -474,8 +474,14 @@ void *gem_mmap__cpu(int fd, uint32_t handle, uint64_t offset, uint64_t size, uns
>>  void *__gem_mmap_offset__cpu(int fd, uint32_t handle, uint64_t offset,
>> 			     uint64_t size, unsigned prot)
>>  {
>> -	return __gem_mmap_offset(fd, handle, offset, size, prot,
>> +	void *ptr;
>> +
>> +	ptr = __gem_mmap_offset(fd, handle, offset, size, prot,
>> 				 I915_MMAP_OFFSET_WB);
>> +	if (!ptr)
>> +		ptr = __gem_mmap_offset__fixed(fd, handle, offset, size, prot);
>> +
>> +	return ptr;
> Imo there's some asymmetry here. If we are adding fixed mode to
> mmap__device_coherent (in the previous patch) then we should also be adding
> it to mmap__cpu_coherent (as before). Or, if we are adding fixed mode to
> __gem_mmap_offset__cpu we should also be adding it to
> __gem_mmap_offset__wc. Thanks.

Why do we need it in __gem_mmap_offset_wc btw?

Rest of series doesn't seem to be blocked by it, so pushed for now.
