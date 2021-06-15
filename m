Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FBE6E213
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 08:44:34 +0000 (UTC)
Date: Tue, 15 Jun 2021 10:44:28 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210615084428.GK4738@zkempczy-mobl2>
References: <20210614163704.365989-1-jason@jlekstrand.net>
 <20210614163902.366168-5-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210614163902.366168-5-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 54/77] lib/i915: Use
 for_each_physical_ring for submission tests
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
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 14, 2021 at 11:38:39AM -0500, Jason Ekstrand wrote:
> This does make the assumption that ctx0 has the default set of engines
> but, now that we've converted everything to intel_ctx_t, this assumption
> should be ok.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  lib/i915/gem_submission.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
> index bd4bbb3ef..1abc73ec7 100644
> --- a/lib/i915/gem_submission.c
> +++ b/lib/i915/gem_submission.c
> @@ -33,6 +33,7 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "i915/gem_engine_topology.h"
> +#include "i915/gem_ring.h"
>  #include "i915/gem_submission.h"
>  
>  #include "igt_core.h"
> @@ -200,10 +201,8 @@ void gem_test_engine(int i915, unsigned int engine)
>  	gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
>  
>  	if (engine == ALL_ENGINES) {
> -		const struct intel_execution_engine2 *e2;
> -
> -		__for_each_physical_engine(i915, e2) {
> -			execbuf.flags = e2->flags;
> +		for_each_physical_ring(e, i915) {
> +			execbuf.flags = eb_ring(e);
>  			gem_execbuf(i915, &execbuf);

Why not to use for_each_ctx_engine() with intel intel_ctx_0 here? 

--
Zbigniew

>  		}
>  	} else {
> @@ -382,11 +381,9 @@ unsigned int gem_submission_measure(int i915, unsigned int engine)
>  		fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) | O_NONBLOCK);
>  
>  	if (engine == ALL_ENGINES) {
> -		struct intel_execution_engine2 *e;
> -
>  		size = -1;
> -		__for_each_physical_engine(i915, e) {
> -			unsigned int this =  __measure_ringsize(i915, e->flags);
> +		for_each_physical_ring(e, i915) {
> +			unsigned int this =  __measure_ringsize(i915, eb_ring(e));
>  			if (this < size)
>  				size = this;
>  		}
> -- 
> 2.31.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
