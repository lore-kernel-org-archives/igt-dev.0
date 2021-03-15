Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C90F89E1D
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Mar 2021 11:35:54 +0000 (UTC)
Date: Mon, 15 Mar 2021 12:35:49 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210315113549.GA9529@zkempczy-mobl2>
References: <20210315110218.89399-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210315110218.89399-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [igt-dev] [i-g-t] test/i915/gem_exec_reloc: Drop reloc support
 for gen12+
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
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org, hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 15, 2021 at 04:32:18PM +0530, Tejas Upadhyay wrote:
> i915 kernel driver is dropping reloc support gen12+. This change
> will drop reloc support in gem_exec_reloc in IGT.
> 
> Ref : https://patchwork.kernel.org/project/dri-devel/patch/20210311162606.1045592-1-jason@jlekstrand.net/
> 
> Cc: Maarten Lankhorst<maarten.lankhorst@intel.com>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  tests/i915/gem_exec_reloc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> index 8d52960b..4c24f178 100644
> --- a/tests/i915/gem_exec_reloc.c
> +++ b/tests/i915/gem_exec_reloc.c
> @@ -1478,6 +1478,8 @@ igt_main
>  	igt_fixture {
>  		fd = drm_open_driver_master(DRIVER_INTEL);
>  		igt_require_gem(fd);
> +		/* Don't use relocations on gen12+ */
> +		igt_require(intel_gen(intel_get_drm_devid(fd)) < 12);
>  	}
>  
>  	for (f = flags; f->name; f++) {
> -- 
> 2.30.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

We got patch which does relocation check, it is part of allocator
series but it is going to be merged standalone:

https://patchwork.freedesktop.org/patch/423361/?series=82954&rev=25

Please watch out current master branch.

--
Zbigniew
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
