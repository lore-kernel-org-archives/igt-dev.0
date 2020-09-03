Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91996E9EB
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2020 12:55:14 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200902152423.630343-1-apoorva1.singh@intel.com>
References: <20200902152423.630343-1-apoorva1.singh@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 03 Sep 2020 13:55:06 +0100
Message-ID: <159913770615.16735.12982493459559546080@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_mmap: Modified offset in
 subtest "bad-size"
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
To: apoorva1.singh@intel.com, arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting apoorva1.singh@intel.com (2020-09-02 16:24:23)
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Subtest "bad-size" should keep valid/good offset
> corresponding to buffer object being mapped.
> Currently, subtest will pass for any value of size
> provided as the offset value itself will not allow
> to map any size of memory which defies the purpose
> of this subtest.
> 
> The subtest should not pass due to bad offset value
> while it should pass only due to bad size provided.
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_mmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
> index f8cf052e..73ffac91 100644
> --- a/tests/i915/gem_mmap.c
> +++ b/tests/i915/gem_mmap.c
> @@ -218,7 +218,7 @@ igt_main
>                 for (int i = 0; i < ARRAY_SIZE(bad_size); i++) {
>                         struct drm_i915_gem_mmap arg = {
>                                 .handle = gem_create(fd, 4096),
> -                               .offset = 4096,
> +                               .offset = 0,

Ah, I see what we had in mind; we wanted to check for overflow handling.

When in doubt do both.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
