Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FED6E075
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2020 10:58:39 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200327050435.8531-1-arjun.melkaveri@intel.com>
References: <20200327050435.8531-1-arjun.melkaveri@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158556591426.3228.18345820748109656581@build.alporthouse.com>
Date: Mon, 30 Mar 2020 11:58:34 +0100
Subject: Re: [igt-dev] [PATCH] [PATCH
 i-g-t][V2]tests/i915/gem_exec_nop:-Fixed Crash issue seen on few platform
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Arjun Melkaveri (2020-03-27 05:04:35)
> Crash issue was seen w.r.t engines on different platforms.
> Fixed this by initializing engine and engine name with
> maximum supported engines value.
> 
> V2:
> 
> Made changes for other tests using engine array.
> 
> Reviewed-by: Antonio Argenziano <antonio.argenziano@intel.com>
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_exec_nop.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> index 6da6234f..823788f8 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -55,6 +55,7 @@
>  
>  #define MAX_PRIO LOCAL_I915_CONTEXT_MAX_USER_PRIORITY
>  #define MIN_PRIO LOCAL_I915_CONTEXT_MIN_USER_PRIORITY
> +#define GEM_MAX_ENGINES I915_EXEC_RING_MASK + 1

I'm not that keen on GEM_ since it makes it seem like it's a fundamental
limit, but in reality it's just the execbuf2 ABI.

Rather than squeeze in EB_ABI_MAX_ENGINES, I'd just use MAX_ENGINES for
the local define.

#define I915_EXEC_MAX_ENGINES (I915_EXEC_RING_MASK + 1)

although we will argue with ourselves for using I915_EXEC in our own
gem_engine_topology, so maybe EXECBUF_MAX_ENGINES is good enough.

As for iterating multiple times, I was hoping that having derived the
list of engines in gem_engine_topology, we would be able to reuse it!
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
