Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F1710F4BE
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Apr 2022 06:14:39 +0000 (UTC)
Date: Fri, 1 Apr 2022 08:14:35 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <YkaYS6qmjalb3zxp@zkempczy-mobl2>
References: <20220331163430.73167-1-kamil.konieczny@linux.intel.com>
 <20220331163430.73167-4-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220331163430.73167-4-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] i915/gem_concurrent_all: fix swap
 subtest group
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 06:34:30PM +0200, Kamil Konieczny wrote:
> In error path in fixture add unlocking memory. In run_modes
> there is already another subtest group which will guard against
> igt_asserts or igt_requires, so do unpinning unconditionally
> without fixture.
> 
> There are still some problems with the code, while we run swap
> subtest we will race between other programs using memory so we
> may still experience oom-kill during test. Second problem will be
> on test machines configured with no swap turned on or with swap
> size much smaller than RAM size.
> 
> The problem was discovered by Zbigniew with running
> ./gem_concurrent_blit --run '16M*' on machine with no swap.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_concurrent_all.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
> index 22c5d6ef..2b1788e1 100644
> --- a/tests/i915/gem_concurrent_all.c
> +++ b/tests/i915/gem_concurrent_all.c
> @@ -1995,6 +1995,7 @@ igt_main
>  						if (posix_memalign(&pinned, 4096, pin_sz) ||
>  						    mlock(pinned, pin_sz) ||
>  						    madvise(pinned, pin_sz, MADV_DONTFORK)) {
> +							munlock(pinned, pin_sz);
>  							free(pinned);
>  							pinned = NULL;
>  						}
> @@ -2006,12 +2007,10 @@ igt_main
>  				}
>  				run_modes(name, c, modes, s, count);
>  
> -				igt_fixture {
> -					if (pinned) {
> -						munlock(pinned, pin_sz);
> -						free(pinned);
> -						pinned = NULL;

Eh, that gave us a couple of hours of debugging :/ Using igt_fixture
is a little bit tricky. 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


> -					}
> +				if (pinned) {
> +					munlock(pinned, pin_sz);
> +					free(pinned);
> +					pinned = NULL;
>  				}
>  			}
>  		}
> -- 
> 2.32.0
> 
