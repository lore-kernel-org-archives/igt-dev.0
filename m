Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACDD6E0FB
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2020 15:20:29 +0000 (UTC)
Date: Tue, 17 Nov 2020 17:18:24 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201117151824.GY7444@platvala-desk.ger.corp.intel.com>
References: <20201117150518.1872289-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117150518.1872289-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Broaden core_hotunplug
 blacklist
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 03:05:18PM +0000, Chris Wilson wrote:
> We're close, but iommu fails upon rebinding leading to dead GPUs and
> random failures in later tests. Random failures are a major nuisance.
> 
> We will have to see if we can find the fix and try again in the future.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2644
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Petri Latvala <petri.latvala@intel.com>
> ---
>  tests/intel-ci/blacklist.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 25b567038..37a049335 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -119,8 +119,9 @@ igt@.*@.*pipe-f($|-.*)
>  igt@perf_pmu@cpu-hotplug
>  
>  # Currently fails and leaves the machine in a very bad state, and
> -# causes coverage loss for other tests.
> -igt@core_hotunplug@.*plug.*
> +# causes coverage loss for other tests. IOMMU related.
> +# https://gitlab.freedesktop.org/drm/intel/-/issues/2644
> +igt@core_hotunplug@.*(hot|plug).*

The only subtest left unblocked will be unbind-rebind. That correct?

Acked-by: Petri Latvala <petri.latvala@intel.com>



>  
>  # hangs several gens of hosts, and has no immediate fix
> -igt@device_reset@reset-bound
> \ No newline at end of file
> +igt@device_reset@reset-bound
> -- 
> 2.29.2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
