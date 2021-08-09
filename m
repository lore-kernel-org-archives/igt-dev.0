Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BF389890
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 12:38:08 +0000 (UTC)
Date: Mon, 9 Aug 2021 14:38:02 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210809123802.GC18660@zkempczy-mobl2>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
 <20210806134145.24634-23-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210806134145.24634-23-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 22/56] tests/gem_exec_gttfill:
 Require relocation support
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
Cc: Andrzej Turko <andrzej.turko@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Aug 06, 2021 at 03:41:11PM +0200, Zbigniew Kempczyński wrote:
> From: Andrzej Turko <andrzej.turko@linux.intel.com>
> 
> Since this test uses relocations, which are now disabled on newer
> generations, we need to skip the test if they are not supported.
> In order to maintain coverage a slightly modified version of this test
> using softpinning instead of relocations is added to gem_softpin.
> 
> Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_exec_gttfill.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> index b8283eb8f..f16428714 100644
> --- a/tests/i915/gem_exec_gttfill.c
> +++ b/tests/i915/gem_exec_gttfill.c
> @@ -216,6 +216,7 @@ igt_main
>  	igt_fixture {
>  		i915 = drm_open_driver(DRIVER_INTEL);
>  		igt_require_gem(i915);
> +		igt_require(gem_has_relocations(i915));
>  		ctx = intel_ctx_create_all_physical(i915);
>  		igt_fork_hang_detector(i915);
>  	}
> -- 
> 2.26.0
> 

Regardless status of adding softpin version of this test this patch
looks ok:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew
