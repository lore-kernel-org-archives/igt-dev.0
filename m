Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1257C10E315
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 10:09:24 +0000 (UTC)
Date: Tue, 6 Dec 2022 11:09:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y48Uz+Jy4cDCDFRs@kamilkon-desk1>
References: <20221206004856.145806-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221206004856.145806-1-alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1 1/1] tests/gem_pxp: Pre-MTL prep: PXP
 is now global.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Vivi@freedesktop.org, Alan Previn <alan.previn.teres.alexis@intel.com>,
 Rodrigo <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Alan,

don't put dot at end of commit message, e.g:
tests/gem_pxp: Pre-MTL prep: PXP is now global.
--------------------------------------------- ^

On 2022-12-05 at 16:48:56 -0800, Alan Previn wrote:
> From the PXP IGT, we assume PXP is a GT subsystem when we
> access then PXP debugfs to force a teardown for testiability.
> As part of kernel side PXP preparation work, the recent
> Intel GFX patchwork's series titled "drm/i915/pxp: Promote
> pxp subsystem to top-level of i915" has moved PXP to be a
> top level i915 subsystem. See kernel side rev9 URL at
> https://patchwork.freedesktop.org/patch/514043/?series=111650&rev=1).
-------------------------------------------------------------------- ^^
Please don't put any chars at end of http link.

> 
> To align with that, we need to change the debugfs path for pxp to
> ensure several of the substests (that rely on debugfs to simulate
> events that cannot be simulated by user-space) continue to work as
> expected.
> 
> NOTE: this patch should only be merged after the kernel side
> has merged.

You can remove this note, see below.

> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  tests/i915/gem_pxp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> index ffad9b5a..6cf254ca 100644
> --- a/tests/i915/gem_pxp.c
> +++ b/tests/i915/gem_pxp.c
> @@ -847,7 +847,7 @@ static void trigger_pxp_debugfs_forced_teardown(int i915)
>  	int fd, ret;
>  	char str[32];
>  
> -	fd = igt_debugfs_open(i915, "gt/pxp/terminate_state", O_RDWR);
> +	fd = igt_debugfs_open(i915, "pxp/terminate_state", O_RDWR);

You can make it work for both old and new with

	fd = igt_debugfs_open(i915, "pxp/terminate_state", O_RDWR); /* global pxp */
	if (fd == -1)
		fd = igt_debugfs_open(i915, "gt/pxp/terminate_state", O_RDWR);

and delete old one after some time.

Regards,
Kamil

>  	igt_assert_f(fd >= 0, "Can't open pxp termination debugfs\n");
>  	ret = snprintf(str, sizeof(str), "0x1");
>  	igt_assert(ret > 2 && ret < sizeof(str));
> 
> base-commit: c001793d5f22deb01918b6ba52af829794582df1
> -- 
> 2.34.1
> 
