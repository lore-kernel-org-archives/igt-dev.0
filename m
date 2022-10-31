Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF3710E27A
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 15:29:04 +0000 (UTC)
Message-ID: <bc69b503-a4f7-31f8-6380-c4de6bd654e1@intel.com>
Date: Mon, 31 Oct 2022 15:28:59 +0000
MIME-Version: 1.0
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221025065941.13397-1-niranjana.vishwanathapura@intel.com>
 <20221025065941.13397-9-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221025065941.13397-9-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v5 08/12] tests/i915/vm_bind: Add basic
 VM_BIND test support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 25/10/2022 07:59, Niranjana Vishwanathapura wrote:
> Add basic tests for VM_BIND functionality. Bind the buffer objects in
> device page table with VM_BIND calls and have GPU copy the data from a
> source buffer object to destination buffer object.
> Test for different buffer sizes, buffer object placement and with
> multiple contexts.
> 
> v2: Add basic test to fast-feedback.testlist
> v3: Run all tests for different memory types,
>      pass VA instead of an array for batch_address
> v4: Iterate for memory region types instead of hardcoding,
>      use i915_vm_bind library functions
> v5: Validate synchronous vm_bind, require blt engine,
>      use mr->gtt_alignment instead of HAS_64K_PAGES,
>      change info to debug messages, remove igt_collection usage,
>      fix dg2 alignment issue
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

With the comment from Petri addressed,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
