Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B2F10EC05
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 14:08:07 +0000 (UTC)
Date: Wed, 22 Jun 2022 16:08:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YrMiRGbttx8pYN4x@kamilkon-desk1>
References: <20220616035821.880966-1-sinjan.kumar@intel.com>
 <20220616035821.880966-2-sinjan.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220616035821.880966-2-sinjan.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] tests/i915/gem_busy : Added subtests
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sinjan,

On 2022-06-16 at 09:28:20 +0530, sinjan.kumar@intel.com wrote:
> From: Sinjan Kumar <sinjan.kumar@intel.com>
> 
> added subtest description to gem_busy tests
- ^

Start from capital letter, s/added/Added/ and add dot at the end
of sentence.

> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Sinjan Kumar <sinjan.kumar@intel.com>
> ---
>  tests/i915/gem_busy.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
> index 603691f2..7a4c5c50 100644
> --- a/tests/i915/gem_busy.c
> +++ b/tests/i915/gem_busy.c
> @@ -447,6 +447,8 @@ igt_main
>  			igt_fork_hang_detector(fd);
>  		}
>  
> +		igt_describe("Basic test to check busyness of each engine "

This part is ok.

> +			     "context in parallel");

Drop this part, all tests use the same context.
Put also dot at the end of description (and also do this below).

>  		igt_subtest_with_dynamic("busy") {
>  			igt_dynamic("all") {
>  				gem_quiescent_gpu(fd);
> @@ -461,6 +463,8 @@ igt_main
>  			}
>  		}
>  
> +		igt_describe("Test to check race condition by randomly closing "
> +			     "the handle using gem_close");
>  		igt_subtest("close-race")
>  			close_race(fd, ctx);
>  
> @@ -482,12 +486,17 @@ igt_main
>  				gem_require_mmap_device_coherent(fd);
>  			}
>  
> +			igt_describe("Extended test to check busyness of engine "
> +				     "classes [Read/Write]");


Hmm, this [Read/Write] looks strange, maybe something like:

s/engine classes [Read/Write]/busyness of dwstore-capable engines./

Do this also below (where you are using this).

>  			test_each_engine_store("extended", fd, ctx, e) {
>  				gem_quiescent_gpu(fd);
>  				one(fd, ctx, e, 0);
>  				gem_quiescent_gpu(fd);
>  			}
>  
> +			igt_describe("Extended test to check busyness of engine "
> +				     "classes [Read/Write] while doing parallel "

Same r/w here.

> +				     "execution");
>  			test_each_engine_store("parallel", fd, ctx, e) {
>  				gem_quiescent_gpu(fd);
>  				one(fd, ctx, e, PARALLEL);
> @@ -501,6 +510,9 @@ igt_main
>  				igt_require(has_semaphores(fd));
>  			}
>  
> +		igt_describe("Test to check wait signal mechanism by submitting "
> +			     "a new batch when engine is busy in executing "
> +			     "previous batch");

Please try to improve this, we test busy-ioctl here.

>  			test_each_engine("semaphore", fd, ctx, e) {
>  				gem_quiescent_gpu(fd);
>  				semaphore(fd, ctx, e);
> @@ -520,6 +532,9 @@ igt_main
>  			hang = igt_allow_hang(fd, ctx->id, 0);
>  		}
>  
> +		igt_describe("Basic test to check hang state beahaviour of "
> +			     "engine by checking task completion with "
> +			     "increased timeout");

Drop words starting with "by checking ...".
Please read comments for igt_describe in lib/igt_core.h for
general help how to describe sub/tests.

>  		test_each_engine("hang", fd, ctx, e) {
>  			gem_quiescent_gpu(fd);
>  			basic(fd, ctx, e, HANG);
> @@ -532,6 +547,10 @@ igt_main
>  				gem_require_mmap_device_coherent(fd);
>  			}
>  
> +			igt_describe("Extended test to check hang state "
> +				     "behaviour of engine class [Read/Write] "

Same r/w here.

> +				     "by checking task completion with "

Same here - drop this.

Regards,
Kamil

> +				     "increased timeout");
>  			test_each_engine_store("hang-extended", fd, ctx, e) {
>  				gem_quiescent_gpu(fd);
>  				one(fd, ctx, e, HANG);
> -- 
> 2.25.1
> 
