Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Thu, 1 Apr 2021 15:03:49 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YGW2pTimwjHEDf3M@platvala-desk.ger.corp.intel.com>
References: <20210401114316.2597715-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401114316.2597715-1-tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t] gem_watchdog: Fix autotools build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 01, 2021 at 12:43:16PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Correcting a brain malfunction while typing in Makefile.sources.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/Makefile.sources | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index e992285fedc5..194df8e27dd0 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -464,7 +464,7 @@ TESTS_progs += gem_wait
>  gem_wait_SOURCES = i915/gem_wait.c
>  
>  TESTS_progs += gem_watchdog
> -gem_exec_watchdog_SOURCES = i915/gem_watchdog.c
> +gem_watchdog_SOURCES = i915/gem_watchdog.c
>  
>  TESTS_progs += gem_workarounds
>  gem_workarounds_SOURCES = i915/gem_workarounds.c
> -- 
> 2.27.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
