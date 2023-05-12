Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8968610E63D
 for <igt-dev@lists.freedesktop.org>; Fri, 12 May 2023 08:57:29 +0000 (UTC)
Date: Fri, 12 May 2023 10:57:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230512085725.gmlmwiskg6bye7pz@kamilkon-desk1>
References: <20230509104203.1163545-1-mauro.chehab@linux.intel.com>
 <20230509104203.1163545-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509104203.1163545-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] meson_options.txt: disable Xe
 driver tests by default
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
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-05-09 at 12:42:03 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Change the build default for Xe driver tests to disabled,
> in order to prevent distros to ship them by accident.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  meson_options.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meson_options.txt b/meson_options.txt
> index 7b5a818cb72f..12b5bb3c32d9 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -44,6 +44,7 @@ option('tests',
>  # drivers get upstreamed.
>  option('xe_driver',
>         type : 'feature',
> +       value : 'disabled',
>         description : 'Build tests for Xe driver (experimental)')
>  
>  option('libdrm_drivers',
> -- 
> 2.40.1
> 

