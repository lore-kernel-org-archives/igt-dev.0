Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1610E0E6
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 18:41:53 +0000 (UTC)
Date: Thu, 25 May 2023 20:41:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230525184132.3bbf2jedgb347mrh@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525090535.2791739-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 01/11] gem_exec_fence: fix a typo
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-05-25 at 11:05:25 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> additinal -> additional
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/i915/gem_exec_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index 5a67a93e8eed..76a86e8f4197 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -3284,7 +3284,7 @@ igt_main
>  				}
>  			}
>  
> -			igt_describe("Basic check for explicit fence with additinal wait time on"
> +			igt_describe("Basic check for explicit fence with additional wait time on"

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  				     " each busy engine.");
>  			igt_subtest_with_dynamic("basic-wait") {
>  				for_each_ctx_engine(i915, ctx, e) {
> -- 
> 2.40.1
> 

