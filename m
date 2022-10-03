Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5335210E406
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Oct 2022 20:49:06 +0000 (UTC)
Date: Mon, 3 Oct 2022 13:48:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, daniel.vetter@intel.com,
 lionel.g.landwerlin@intel.com, matthew.auld@intel.com,
 matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 petri.latvala@intel.com, thomas.hellstrom@intel.com,
 tvrtko.ursulin@intel.com
Message-ID: <20221003204842.GS22224@nvishwa1-DESK>
References: <20221003061320.12782-1-niranjana.vishwanathapura@intel.com>
 <YzrrcuZ51otbhVB7@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YzrrcuZ51otbhVB7@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/8] vm_bind: Add VM_BIND validation
 support
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

On Mon, Oct 03, 2022 at 04:02:26PM +0200, Kamil Konieczny wrote:
>Hi Niranjana,
>
>On 2022-10-02 at 23:13:12 -0700, Niranjana Vishwanathapura wrote:
>> DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM
>> buffer objects (BOs) or sections of a BOs at specified GPU virtual
>> addresses on a specified address space (VM). Multiple mappings can map
>> to the same physical pages of an object (aliasing). These mappings (also
>> referred to as persistent mappings) will be persistent across multiple
>> GPU submissions (execbuf calls) issued by the UMD, without user having
>> to provide a list of all required mappings during each submission (as
>> required by older execbuf mode).
>>
>> The new execbuf3 ioctl (I915_GEM_EXECBUFFER3) will only work in vm_bind
>> mode. The vm_bind mode only works with this new execbuf3 ioctl.
>
>Please put above two paragraphs into your 1/8 patch so it would
>stay in git history.
>

Thanks Kamil,
Sure, will do.

>>
>> Add sanity tests to validate the VM_BIND, VM_UNBIND and execbuf3 ioctls.
>>
>> Add basic test to create and VM_BIND the objects and issue execbuf3 for
>> GPU to copy the data from a source to destination buffer.
>>
>> TODOs:
>> * More validation support.
>> * Port some relevant gem_exec_* tests for execbuf3.
>>
>> NOTEs:
>> * It is based on below VM_BIND design+uapi rfc.
>>   Documentation/gpu/rfc/i915_vm_bind.rst
>>
>> * The i915 VM_BIND support is posted as,
>>   [PATCH v2 00/17] drm/i915/vm_bind: Add VM_BIND functionality
>>
>> v2: Address various review comments
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>
>> Niranjana Vishwanathapura (4):
>>   lib/vm_bind: Add vm_bind/unbind and execbuf3 ioctls
>>   tests/i915/vm_bind: Add vm_bind sanity test
>>   tests/i915/vm_bind: Add basic VM_BIND test support
>>   tests/i915/vm_bind: Add userptr subtest
>>
>> Vishwanathapura, Niranjana (4):
>- ^ -------------- ^
>You should switch this, please correct "From:"
>in below patches:

Oops, will fix.

Regards,
Niranjana

>
>>   lib/vm_bind: import uapi definitions
>>   lib/vm_bind: Add vm_bind mode support for VM
>>   lib/vm_bind: Add support for VM private objects
>>   lib/vm_bind: Add prime_handle_to_fd_no_assert()
>
>Regards,
>Kamil
>
>>
>>  lib/i915/gem_context.c                |  24 ++
>>  lib/i915/gem_context.h                |   3 +
>>  lib/i915/gem_vm.c                     |  31 +-
>>  lib/i915/gem_vm.h                     |   3 +-
>>  lib/i915/i915_drm_local.h             | 287 +++++++++++++
>>  lib/i915/intel_memory_region.c        |  48 ++-
>>  lib/i915/intel_memory_region.h        |  25 ++
>>  lib/intel_chipset.h                   |   2 +
>>  lib/ioctl_wrappers.c                  | 117 ++++-
>>  lib/ioctl_wrappers.h                  |   7 +
>>  tests/i915/i915_vm_bind_basic.c       | 593 ++++++++++++++++++++++++++
>>  tests/i915/i915_vm_bind_sanity.c      | 275 ++++++++++++
>>  tests/intel-ci/fast-feedback.testlist |   2 +
>>  tests/meson.build                     |   2 +
>>  tests/prime_mmap.c                    |  26 +-
>>  15 files changed, 1406 insertions(+), 39 deletions(-)
>>  create mode 100644 tests/i915/i915_vm_bind_basic.c
>>  create mode 100644 tests/i915/i915_vm_bind_sanity.c
>>
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
