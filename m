Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0923D10E148
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 08:44:52 +0000 (UTC)
Date: Wed, 5 Oct 2022 10:44:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yz1EAMbUPPLmxGKX@kamilkon-desk1>
References: <20221005074546.55955-1-mauro.chehab@linux.intel.com>
 <20221005074546.55955-68-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005074546.55955-68-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 67/77] kms_dither: Close device
 before exit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-10-05 at 09:45:36 +0200, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Close the device fd before we check for leaks during the atexit
> handlers.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_dither.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index 43a25e203ef4..95be6e136c61 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -247,5 +247,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> +		close(data.drm_fd);
>  	}
>  }
> -- 
> 2.37.3
> 
