Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEBB6E911
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2020 11:15:51 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200401103606.138917-1-lionel.g.landwerlin@intel.com>
References: <20200401103606.138917-1-lionel.g.landwerlin@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158573974814.5852.4343487493123615703@build.alporthouse.com>
Date: Wed, 01 Apr 2020 12:15:48 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] tools/i915-perf-recorder: fix topology
 alignment issue
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-04-01 11:36:06)
> The additional alignment added when writing into the output was not
> accounted in the header. This is preventing reading the recorded data.
> 
> Instead of adding the alignment when writing, just account for it when
> querying the topology.
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Fixes: f08865e58cd3 ("tools: add i915 perf recorder tool")
> ---
>  tools/i915-perf/i915_perf_recorder.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
> index 4d729b0e..104a425b 100644
> --- a/tools/i915-perf/i915_perf_recorder.c
> +++ b/tools/i915-perf/i915_perf_recorder.c
> @@ -485,8 +485,8 @@ get_topology(int drm_fd, uint32_t *topology_size)
>                 return NULL;
>  
>         assert(item.length > 0);
> -       *topology_size = item.length;
> -       topo_info = malloc(item.length);
> +       *topology_size = ALIGN(item.length, 8);
> +       topo_info = malloc(*topology_size);
>         item.data_ptr = (uintptr_t) topo_info;

As I understand the problem statement, when we used the length the
kernel told us to use, the kernel rejected the query?

Could you clarify as that sounds like a kernel bug.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
