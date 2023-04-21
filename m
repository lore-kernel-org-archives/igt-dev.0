Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A67910E09C
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 09:09:39 +0000 (UTC)
Date: Fri, 21 Apr 2023 11:09:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230421090934.m7sqmx5js2vtyory@kamilkon-desk1>
References: <8254ed384aa30dbe615f7efbe760addf38b0d27c.1682059913.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8254ed384aa30dbe615f7efbe760addf38b0d27c.1682059913.git.mchehab@kernel.org>
Subject: Re: [igt-dev] [PATCH] i915/i915_hangman: use igt_describe_f()
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

On 2023-04-21 at 08:51:53 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Instead of re-implementing the wheel with a temporary buffer,
> to use dynamic arguments to igt_describe(), just call igt_describe_f()
> variant.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/i915_hangman.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index 8acce8f1a493..dd396c4e9709 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -463,8 +463,7 @@ static void do_tests(const char *name, const char *prefix,
>  	const struct intel_execution_engine2 *e;
>  	char buff[256];
>  
> -	snprintf(buff, sizeof(buff), "Per engine error capture (%s reset)", name);
> -	igt_describe(buff);
> +	igt_describe_f("Per engine error capture (%s reset)", name);
>  	snprintf(buff, sizeof(buff), "%s-error-state-capture", prefix);
>  	igt_subtest_with_dynamic(buff) {
>  		for_each_ctx_engine(device, ctx, e) {
> @@ -473,8 +472,7 @@ static void do_tests(const char *name, const char *prefix,
>  		}
>  	}
>  
> -	snprintf(buff, sizeof(buff), "Per engine hang recovery (spin, %s reset)", name);
> -	igt_describe(buff);
> +	igt_describe_f("Per engine hang recovery (spin, %s reset)", name);
>  	snprintf(buff, sizeof(buff), "%s-engine-hang", prefix);
>  	igt_subtest_with_dynamic(buff) {
>                  int has_gpu_reset = 0;
> @@ -494,8 +492,7 @@ static void do_tests(const char *name, const char *prefix,
>  		}
>  	}
>  
> -	snprintf(buff, sizeof(buff), "Per engine hang recovery (invalid CS, %s reset)", name);
> -	igt_describe(buff);
> +	igt_describe_f("Per engine hang recovery (invalid CS, %s reset)", name);
>  	snprintf(buff, sizeof(buff), "%s-engine-error", prefix);
>  	igt_subtest_with_dynamic(buff) {
>  		int has_gpu_reset = 0;
> -- 
> 2.39.2
> 

