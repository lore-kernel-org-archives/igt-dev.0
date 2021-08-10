Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1655989E32
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 03:34:45 +0000 (UTC)
Date: Tue, 10 Aug 2021 05:34:38 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210810033438.GE3738@zkempczy-mobl2>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
 <20210809130533.27759-22-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210809130533.27759-22-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 21/65] tests/gem_exec_lut_handle:
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

On Mon, Aug 09, 2021 at 03:04:49PM +0200, Zbigniew Kempczyński wrote:
> From: Andrzej Turko <andrzej.turko@linux.intel.com>
> 
> This test exercises LUT which is a part of the relocation
> interface. Running this test makes no sense on platforms
> without relocation support -- thus the new requirement.
> 
> Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_exec_lut_handle.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/gem_exec_lut_handle.c b/tests/i915/gem_exec_lut_handle.c
> index 3c5c81f1a..064308666 100644
> --- a/tests/i915/gem_exec_lut_handle.c
> +++ b/tests/i915/gem_exec_lut_handle.c
> @@ -99,6 +99,7 @@ igt_simple_main
>  
>  	fd = drm_open_driver(DRIVER_INTEL);
>  	igt_require_gem(fd);
> +	igt_require(gem_has_relocations(fd));
>  
>  	memset(gem_exec, 0, sizeof(gem_exec));
>  	for (n = 0; n < MAX_NUM_EXEC; n++)
> -- 
> 2.26.0
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
