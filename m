Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 17 Aug 2022 14:53:48 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20220817145348.562fcaa2@maurocar-mobl2>
In-Reply-To: <20220812095346.45379-1-janusz.krzysztofik@linux.intel.com>
References: <20220812095346.45379-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/3] tests/gem_exec_fence:
 Fix wrong engine checked for store_dword capability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.carvalho.chehab@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janusz,

On Fri, 12 Aug 2022 11:53:44 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

It seems that there is a numeration issue on this series, as the patches
on it are:

   [PATCH i-g-t 1/3] tests/gem_exec_fence: Fix wrong engine checked for store_dword capability
   [PATCH i-g-t v2 2/3] tests/gem_exec_fence: Exclude 0  from use in store batches
   [PATCH i-g-t v3 3/3] tests/gem_exec_fence: Restore  pre-hang checks in *await-hang scenarios

Maybe some broken script? It is also missing a cover letter.

> Commit ed7c8cfb67e3 ("tests/i915/gem_exec_fence: Add
> __for_each_physical_engine to utilize all engines."), while replacing
> depraciated for_each_physical_engine(e, fd) loop with
> __for_each_physical_engine(fd, e2) and gem_can_store_dword() inside that
> loop with gem_class_can_store_dword(), didn't switch to e2 consequently --
> eb_ring(e) argument of gem_can_store_dword() was replaced with e->class
> passed to gem_class_can_store_dword() instead of e2->class.  As a result,
> a batch that stores dword is now submitted to all engines, also those that
> don't support that operation.  Fix it.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/i915/gem_exec_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index 7ff7614dad..048870053a 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -331,7 +331,7 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
>  
>  	i = 0;
>  	for_each_ctx_engine(fd, ctx, e2) {
> -		if (!gem_class_can_store_dword(fd, e->class))
> +		if (!gem_class_can_store_dword(fd, e2->class))
>  			continue;
>  
>  		if (flags & NONBLOCK) {
