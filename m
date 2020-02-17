Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF9B6E92A
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 11:13:13 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200217055019.32591-2-krishnaiah.bommu@intel.com>
References: <20200217055019.32591-1-krishnaiah.bommu@intel.com>
 <20200217055019.32591-2-krishnaiah.bommu@intel.com>
Message-ID: <158193796931.19707.5726854812995458156@skylake-alporthouse-com>
Date: Mon, 17 Feb 2020 11:12:49 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/i915/gem_ring : set the engine
 to default context
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
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Bommu Krishnaiah (2020-02-17 05:50:19)
> Copy the existing engine map from default context to
> newly created  default context
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  lib/i915/gem_ring.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915/gem_ring.c b/lib/i915/gem_ring.c
> index 99f4741c..c2eae836 100644
> --- a/lib/i915/gem_ring.c
> +++ b/lib/i915/gem_ring.c
> @@ -143,11 +143,13 @@ __gem_measure_ring_inflight(int fd, unsigned int engine, enum measure_ring_flags
>   * Number of batches that fit in the ring
>   */
>  unsigned int
> -gem_measure_ring_inflight(int fd, unsigned int engine, enum measure_ring_flags flags)
> +gem_measure_ring_inflight(int sfd, unsigned int engine, enum measure_ring_flags flags)
>  {
>         unsigned int min = ~0u;
> +       uint32_t fd;
>  
> -       fd = gem_reopen_driver(fd);
> +       fd = gem_reopen_driver(sfd);
> +       gem_context_copy_engines(sfd, 0, fd, 0);

Hah, what happens if engine was ring as intended?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
