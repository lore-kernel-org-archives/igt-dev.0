Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84EE6E362
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2020 11:35:32 +0000 (UTC)
Date: Tue, 11 Aug 2020 12:46:15 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200811094615.GJ7444@platvala-desk.ger.corp.intel.com>
References: <20200811093241.19910-1-guillaume.tucker@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811093241.19910-1-guillaume.tucker@collabora.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Dockerfile.build-debian-mips: use
 buster with libunwind fix
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
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 11, 2020 at 10:32:41AM +0100, Guillaume Tucker wrote:
> We can now use libunwind 1.2.1-10~deb10u1 from Debian Buster as per
> this bug report which has now been resolved:
> 
>   https://bugs.debian.org/932725
> 
> Drop stretch-backports for MIPS and use Buster like the other
> architectures.
> 
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>

Happy birthday, bug 932725!

Reviewed-by: Petri Latvala <petri.latvala@intel.com>




> ---
>  Dockerfile.build-debian-mips | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/Dockerfile.build-debian-mips b/Dockerfile.build-debian-mips
> index 7e4bacdf8ded..9b7c0a5b4703 100644
> --- a/Dockerfile.build-debian-mips
> +++ b/Dockerfile.build-debian-mips
> @@ -1,6 +1,4 @@
> -# we are stuck on stretch for mips:
> -# https://bugs.debian.org/932725
> -FROM debian:stretch-backports
> +FROM debian:buster
>  
>  RUN apt-get update
>  RUN apt-get install -y \
> @@ -32,9 +30,7 @@ RUN apt-get install -y \
>  			libjson-c-dev:mips \
>  			libcurl4-openssl-dev:mips \
>  			libxrandr-dev:mips \
> -			libxv-dev:mips
> -
> -RUN apt-get install -t stretch-backports -y \
> +			libxv-dev:mips \
>  			meson \
>  			libdrm-dev:mips \
>  			qemu-user \
> -- 
> 2.20.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
