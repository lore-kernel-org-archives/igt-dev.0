Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 11 May 2020 12:31:49 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200511093149.GD9497@platvala-desk.ger.corp.intel.com>
References: <20200511082141.65494-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511082141.65494-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ringfill: Do a basic pass over
 all engines simultaneously
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 11, 2020 at 09:21:41AM +0100, Chris Wilson wrote:
> Change the basic pre-mergetest to do a single pass over all engines
> simultaneously. This should take no longer than checking a single
> engine, while providing just the right amount of stress regardless of
> machine size.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_ringfill.c             | 10 ++++++++++
>  tests/intel-ci/fast-feedback.testlist |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> index a2157bd6f..a90758e08 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -292,6 +292,16 @@ igt_main
>  		}
>  	}
>  
> +	igt_subtest("basic-all") {
> +		const struct intel_execution_engine2 *e;
> +
> +		__for_each_physical_engine(fd, e)
> +			igt_fork(child, 1)
> +				run_test(fd, e->flags, 0, 1);

Will it happen simultaneously though without synchronization?

(Obvious quip about executing too fast)

run_test() calls igt_require in a few places, and skips in child
processes are problematic.


-- 
Petri Latvala


> +
> +		igt_waitchildren();
> +	}
> +
>  	igt_fixture
>  		close(fd);
>  }
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 2ccad4386..e2ed0a1d6 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -35,7 +35,7 @@ igt@gem_mmap@basic
>  igt@gem_mmap_gtt@basic
>  igt@gem_render_linear_blits@basic
>  igt@gem_render_tiled_blits@basic
> -igt@gem_ringfill@basic-default-forked
> +igt@gem_ringfill@basic-all
>  igt@gem_sync@basic-all
>  igt@gem_sync@basic-each
>  igt@gem_tiled_blits@basic
> -- 
> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
