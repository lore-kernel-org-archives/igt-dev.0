Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF0610E18B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 12:02:24 +0000 (UTC)
Message-ID: <54f4e126-389c-b637-2d8b-146dd55d3f8d@intel.com>
Date: Tue, 4 Apr 2023 14:02:34 +0200
To: Vikas Srivastava <vikas.srivastava@intel.com>
References: <20230404065429.3381075-1-vikas.srivastava@intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230404065429.3381075-1-vikas.srivastava@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/4] tests/i915: Enable XY_FAST_COPY_BLT
 for gen12+
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

On 4.04.2023 08:54, Vikas Srivastava wrote:
> Test case uses legacy command XY_SRC_COPY_BLT_CMD which
> is not supported on newer platforms. Modify test
> to use XY_FAST_COPY_BLT.
> 

I'm surprised to see that there are no r-b's on the patches I already 
reviewed. Once you have good results from the FULL run, please add the 
tag to each of the patches:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

Thanks,
Karolina

> Arjun Melkaveri (1):
>    tests/i915/gem_linear_blits: Enable XY_FAST_COPY_BLT copy instruction
> 
> Vikas Srivastava (3):
>    tests/i915/gem_caching: Enable XY_FAST_COPY_BLT for MTL
>    lib/intel_batchbuffer: Enable XY_FAST_COPY_BLT support for
>      api_intel_bb
>    tests/i915/gem_userptr_blits: Enable XY_FAST_COPY_BLT command for
>      gen12+
> 
>   lib/intel_batchbuffer.c        |  57 +++++++++++-------
>   tests/i915/gem_caching.c       |  25 +++++---
>   tests/i915/gem_linear_blits.c  |  68 ++++++++++++++--------
>   tests/i915/gem_userptr_blits.c | 102 ++++++++++++++++++++-------------
>   4 files changed, 162 insertions(+), 90 deletions(-)
> 
