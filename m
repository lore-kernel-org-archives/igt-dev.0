Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C9A10E082
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 15:09:38 +0000 (UTC)
Date: Thu, 14 Dec 2023 16:09:34 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] meson.sh: add setup option for meson
Message-ID: <20231214160934.4c79719d@maurocar-mobl2>
In-Reply-To: <20231214145530.78479-1-kamil.konieczny@linux.intel.com>
References: <20231214145530.78479-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 14 Dec 2023 15:55:30 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> New meson version issue warning when running ./meson.sh script:
> 
> WARNING: Running the setup command as `meson [options]` instead of `meson setup [options]` is ambiguous and deprecated.
> 
> Add setup option as a first one for a new build.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  meson.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.sh b/meson.sh
> index f83b6d6d4..e54cf4d44 100755
> --- a/meson.sh
> +++ b/meson.sh
> @@ -37,7 +37,7 @@ default: all
>  
>  build/build.ninja:
>  	\$(Q)mkdir -p build
> -	\$(Q)meson build \$(quiet_build)
> +	\$(Q)meson setup build \$(quiet_build)
>  
>  all: build/build.ninja
>  	\$(Q)ninja -C build \$(quiet_build)
