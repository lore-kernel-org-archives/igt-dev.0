Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B766E218
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Jan 2020 08:45:03 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <037121df1ee6fcf1fa92ea4a7fb6ba31b39e80ac.1578720512.git.ashutosh.dixit@intel.com>
 <fd2da281033416f29cba6e1ab616164b1cfc6928.1578720512.git.ashutosh.dixit@intel.com>
In-Reply-To: <fd2da281033416f29cba6e1ab616164b1cfc6928.1578720512.git.ashutosh.dixit@intel.com>
Message-ID: <157873229910.10140.6691170131873194678@skylake-alporthouse-com>
Date: Sat, 11 Jan 2020 08:44:59 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915/treewide: Replace
 gem_mmap__gtt() by gem_mmap__device_coherent()
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ashutosh Dixit (2020-01-11 05:36:53)
> diff --git a/benchmarks/gem_busy.c b/benchmarks/gem_busy.c
> index 2fb1edf98..55db17a7d 100644
> --- a/benchmarks/gem_busy.c
> +++ b/benchmarks/gem_busy.c
> @@ -188,7 +188,7 @@ static int loop(unsigned ring, int reps, int ncpus, unsigned flags)
>         if (gem_mmap__has_wc(fd))
>                 batch = gem_mmap__wc(fd, obj[1].handle, 0, 4096, PROT_WRITE);
>         else
> -               batch = gem_mmap__gtt(fd, obj[1].handle, 4096, PROT_WRITE);
> +               batch = gem_mmap__device_coherent(fd, obj[1].handle, 0, 4096, PROT_WRITE);

Chunks like this want the redundant branches eliminated.

>         gem_set_domain(fd, obj[1].handle,
>                         I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>         batch[0] = MI_BATCH_BUFFER_END;
> diff --git a/benchmarks/gem_mmap.c b/benchmarks/gem_mmap.c
> index d3d4ad310..518f9fd9b 100644
> --- a/benchmarks/gem_mmap.c
> +++ b/benchmarks/gem_mmap.c
> @@ -122,7 +122,7 @@ int main(int argc, char **argv)
>                 gem_set_domain(fd, handle, I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
>                 break;
>         case GTT:
> -               ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_WRITE);
> +               ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
>                 gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);

But if it says it is testing GTT, I want GTT, and only GTT!

Here, we want OFFSET_WC etc added. So leave this style for a later patch,
and focus on just converting the ones where we want any old mapping to
device_coherent(). Another patch can focus on converting any __cpu maps
that are only used for writes to device_coherent.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
