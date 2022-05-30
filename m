Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1958810E1E3
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 08:52:17 +0000 (UTC)
Date: Mon, 30 May 2022 11:50:03 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <YpSFO8qCfh4AzuaB@platvala-desk.ger.corp.intel.com>
References: <20220530074036.3840581-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220530074036.3840581-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [PATCH] lib/igt_kms: Fix mixed declarations warning
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

On Mon, May 30, 2022 at 01:10:36PM +0530, Bhanuprakash Modem wrote:
> Fix mixed declarations warning introduced by (58a5a2d5)
> 
> [214/1052] Compiling C object lib/libigt-igt_kms_c.a.p/igt_kms.c.o
> ../lib/igt_kms.c: In function ‘igt_display_require’:
> ../lib/igt_kms.c:2468:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>  2468 |   igt_output_t *output = igt_get_single_output_for_pipe(display, i);
>       |   ^~~~~~~~~~~~
> 
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/igt_kms.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 457462ec..a8a4fc7c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2498,11 +2498,12 @@ out:
>  
>  	for_each_pipe(display, i) {
>  		igt_pipe_t *pipe = &display->pipes[i];
> +		igt_output_t *output;
>  
>  		if (!igt_pipe_has_valid_output(display, i))
>  			continue;
>  
> -		igt_output_t *output = igt_get_single_output_for_pipe(display, i);
> +		output = igt_get_single_output_for_pipe(display, i);
>  
>  		if (pipe->num_primary_planes > 1) {
>  			igt_plane_t *primary = &pipe->planes[pipe->plane_primary];
> -- 
> 2.35.1
> 
