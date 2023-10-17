Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C16610E2CA
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 11:08:59 +0000 (UTC)
Message-ID: <67b3af34-e7d1-095e-7d5a-961542c3f84e@intel.com>
Date: Tue, 17 Oct 2023 12:08:49 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20231016141450.55936-1-matthew.auld@intel.com>
 <20231016141450.55936-11-matthew.auld@intel.com>
 <ZS29S3jpxlzSTCN1@nvishwa1-DESK>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZS29S3jpxlzSTCN1@nvishwa1-DESK>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 10/12] lib/xe_ioctl: update vm_bind
 to account for pat_index
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 16/10/2023 23:46, Niranjana Vishwanathapura wrote:
> On Mon, Oct 16, 2023 at 03:14:48PM +0100, Matthew Auld wrote:
>> Keep things minimal and select the 1way+ by default on all platforms.
>> Other users can use intel_buf, get_offset_pat_index etc or use
>> __xe_vm_bind() directly.  Display tests don't directly use this
>> interface.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>> ---
>> lib/xe/xe_ioctl.c   | 8 ++++++--
>> lib/xe/xe_ioctl.h   | 2 +-
>> tests/intel/xe_vm.c | 4 +++-
>> 3 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
>> index 80696aa59..ebaed1e96 100644
>> --- a/lib/xe/xe_ioctl.c
>> +++ b/lib/xe/xe_ioctl.c
>> @@ -41,6 +41,7 @@
>> #include "config.h"
>> #include "drmtest.h"
>> #include "igt_syncobj.h"
>> +#include "intel_pat.h"
>> #include "ioctl_wrappers.h"
>> #include "xe_ioctl.h"
>> #include "xe_query.h"
>> @@ -92,7 +93,7 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t 
>> exec_queue,
>> int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>>           uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
>>           struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
>> -          uint64_t ext)
>> +          uint8_t pat_index, uint64_t ext)
>> {
>>     struct drm_xe_vm_bind bind = {
>>         .extensions = ext,
>> @@ -107,6 +108,8 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t 
>> exec_queue, uint32_t bo,
>>         .num_syncs = num_syncs,
>>         .syncs = (uintptr_t)sync,
>>         .exec_queue_id = exec_queue,
>> +        .bind.pat_index = (pat_index == DEFAULT_PAT_INDEX) ?
>> +            intel_get_pat_idx_wb(fd) : pat_index,
> 
> Ok, so KMD has no idea of default PAT, UMD always has to specify it. Ok.
> 
> NIT...keep all bind.* setting together?
> 
> Also, there seems to be vm_bind_array() all invocations of which also needs
> update to include bind.pat_index=DEFAULT_PAT_INDEX?

Ah, I think I missed the one in tests/intel/xe_vm.c. vm_bind_array() 
should rather use the real pat_index. Or at least some higher level 
things needs to do it.

> 
> Niranjana
> 
>>     };
>>
>>     if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
>> @@ -121,7 +124,8 @@ void  __xe_vm_bind_assert(int fd, uint32_t vm, 
>> uint32_t exec_queue, uint32_t bo,
>>               uint32_t num_syncs, uint32_t region, uint64_t ext)
>> {
>>     igt_assert_eq(__xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, 
>> size,
>> -                   op, sync, num_syncs, region, ext), 0);
>> +                   op, sync, num_syncs, region, DEFAULT_PAT_INDEX,
>> +                   ext), 0);
>> }
>>
>> void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
>> index c18fc878c..cafbb011a 100644
>> --- a/lib/xe/xe_ioctl.h
>> +++ b/lib/xe/xe_ioctl.h
>> @@ -20,7 +20,7 @@ uint32_t xe_vm_create(int fd, uint32_t flags, 
>> uint64_t ext);
>> int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>>           uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
>>           struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
>> -          uint64_t ext);
>> +          uint8_t pat_index, uint64_t ext);
>> void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, 
>> uint32_t bo,
>>               uint64_t offset, uint64_t addr, uint64_t size,
>>               uint32_t op, struct drm_xe_sync *sync,
>> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
>> index 4952ea786..ffb70973b 100644
>> --- a/tests/intel/xe_vm.c
>> +++ b/tests/intel/xe_vm.c
>> @@ -10,6 +10,7 @@
>>  */
>>
>> #include "igt.h"
>> +#include "intel_pat.h"
>> #include "lib/igt_syncobj.h"
>> #include "lib/intel_reg.h"
>> #include "xe_drm.h"
>> @@ -316,7 +317,8 @@ static void userptr_invalid(int fd)
>>     vm = xe_vm_create(fd, 0, 0);
>>     munmap(data, size);
>>     ret = __xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
>> -               size, XE_VM_BIND_OP_MAP_USERPTR, NULL, 0, 0, 0);
>> +               size, XE_VM_BIND_OP_MAP_USERPTR, NULL, 0, 0,
>> +               DEFAULT_PAT_INDEX, 0);
>>     igt_assert(ret == -EFAULT);
>>
>>     xe_vm_destroy(fd, vm);
>> -- 
>> 2.41.0
>>
