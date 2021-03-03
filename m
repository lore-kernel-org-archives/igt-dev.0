Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863B56E422
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Mar 2021 23:56:57 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210302225334.361966-9-alan.previn.teres.alexis@intel.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
 <20210302225334.361966-9-alan.previn.teres.alexis@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 03 Mar 2021 23:56:53 +0000
Message-ID: <161481581356.25897.10300715465632705470@build.alporthouse.com>
Subject: Re: [igt-dev] [RFC i-g-t 08/11] Add test where both src and dest
 are protected
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>, igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Alan Previn (2021-03-02 22:53:31)
> When both the source and destination surfaces are
> protected, the destination pixel result of the 3d
> copy operation would be the same as the source. By
> appending this test case to the end of the prior
> test (raw-src to protected-dest) and reusing the
> previous' test destination as the current source,
> we can prove the difference in results clearly
> by repeating the same render operation but having
> a src buffer that is protected in this case.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  lib/intel_batchbuffer.c |  12 +++++
>  lib/intel_batchbuffer.h |   2 +
>  tests/i915/i915_pxp.c   | 117 ++++++++++++++++++++++++++++++++++------
>  3 files changed, 116 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 8118dc94..819fd85d 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -2193,6 +2193,18 @@ void intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
>         igt_assert_eq(__intel_bb_exec(ibb, end_offset, flags, sync), 0);
>  }
>  
> +/**
> + * intel_bb_exec_noassert:
> + *
> + * Wrapper around intel_bb_exec but without assertion and
> + * GEM_EXEC ioctl return value is passed back to caller.
> + */
> +int intel_bb_exec_noassert(struct intel_bb *ibb, uint32_t end_offset,
> +                  uint64_t flags, bool sync)
> +{
> +       return __intel_bb_exec(ibb, end_offset, flags, sync);

* blinks

It's called __intel_bb_exec() as is the pattern already established
across igt.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
