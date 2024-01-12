Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E23210E103
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 10:28:58 +0000 (UTC)
Date: Fri, 12 Jan 2024 11:28:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] build: Build xe tests by default
Message-ID: <20240112102853.lo4rsi4lyajmxqh2@kamilkon-desk.igk.intel.com>
References: <20240111213358.1656641-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240111213358.1656641-1-lucas.demarchi@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lucas,
On 2024-01-11 at 13:33:57 -0800, Lucas De Marchi wrote:
> Swap the default value so xe tests are built by default. Once CI and
> others are adapted, then the option can be removed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  meson_options.txt | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/meson_options.txt b/meson_options.txt
> index 12b5bb3c3..6a9493ea6 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -37,15 +37,10 @@ option('tests',
>         type : 'feature',
>         description : 'Build tests')
>  
> -# Currently, Xe uAPI is not stable: it may still change while the driver is
> -# not merged upstream.
> -# So, add an option to enable it, as distros shall not be shipping
> -# binaries with Xe tests on it, as they will most certainly fail once
> -# drivers get upstreamed.
>  option('xe_driver',
>         type : 'feature',
> -       value : 'disabled',
> -       description : 'Build tests for Xe driver (experimental)')
> +       value : 'enabled',
> +       description : 'Build tests for Xe driver')
>  
>  option('libdrm_drivers',
>         type : 'array',
> -- 
> 2.40.1
> 
