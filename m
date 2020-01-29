Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCD66E44A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 21:13:58 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200129192914.26341-2-antonio.argenziano@intel.com>
References: <20200129192914.26341-1-antonio.argenziano@intel.com>
 <20200129192914.26341-2-antonio.argenziano@intel.com>
Message-ID: <158033242599.13511.1580557648084111271@skylake-alporthouse-com>
Date: Wed, 29 Jan 2020 21:13:46 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_exec_flush: Require
 mapapble aperture when needed
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Antonio Argenziano (2020-01-29 19:29:14)
> The test goes through multiple mapping so require mappable aperture when
> going through GTT. Also use any coherent mapping not just GTT.
> 
> Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  tests/i915/gem_exec_flush.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
> index 28708460..778bc18c 100644
> --- a/tests/i915/gem_exec_flush.c
> +++ b/tests/i915/gem_exec_flush.c
> @@ -152,9 +152,10 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
>                                I915_GEM_DOMAIN_WC,
>                                I915_GEM_DOMAIN_WC);
>  
> -               /* Prepara a mappable binding to prevent pread mighrating */
> +               /* Prepare a mappable binding to prevent pread migrating */
>                 if (!snoop) {
> -                       ptr = gem_mmap__gtt(fd, obj[0].handle, 4096, PROT_READ);
> +                       ptr = gem_mmap__device_coherent(fd, obj[0].handle, 0,
> +                                                       4096, PROT_READ);
>                         igt_assert_eq_u32(ptr[0], 0xabcdabcd);
>                         munmap(ptr, 4096);
>                 }

Yeah, this is outdated and doesn't do much for the kernel anymore.

Still no harm. And who knows the weirdness may trip a bug.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
