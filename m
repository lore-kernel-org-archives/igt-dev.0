Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1425A10E40A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 08:08:59 +0000 (UTC)
Date: Thu, 17 Aug 2023 10:08:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230817080854.3xocvqtt6gfi4y6h@kamilkon-desk1>
References: <20230817054916.525796-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230817054916.525796-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t] meson_options: Disable testplan by default
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

Hi Bhanuprakash,

On 2023-08-17 at 11:19:16 +0530, Bhanuprakash Modem wrote:
> Disable testplan until we fully enabled it.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  meson_options.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meson_options.txt b/meson_options.txt
> index 12b5bb3c3..63f30b123 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -22,6 +22,7 @@ option('man',
>  
>  option('testplan',
>         type : 'feature',
> +       value : 'disabled',
>         description : 'Build testplan documentation pages in ReST and html')
>  
>  option('sphinx',
> -- 
> 2.40.0
> 

