Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D12710E87F
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 17:24:35 +0000 (UTC)
Message-ID: <a189c94c-aa12-61a4-f612-6a9350df591e@intel.com>
Date: Fri, 28 Oct 2022 18:24:13 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221025065941.13397-1-niranjana.vishwanathapura@intel.com>
 <20221025065941.13397-12-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221025065941.13397-12-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v5 11/12] tests/i915/vm_bind: Add
 gem_exec3_balancer test
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
> To test parallel submissions support in execbuf3, port the subtest
> gem_exec_balancer@parallel-ordering to a new gem_exec3_balancer test
> and switch to execbuf3 ioctl.
> 
> v2: use i915_vm_bind library functions
> v3: Remove unwanted gem_set_domain()
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
