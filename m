Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D22710E185
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 18:26:46 +0000 (UTC)
Date: Mon, 10 Jul 2023 20:26:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230710182643.cggqw5gp7cuv76hp@kamilkon-desk1>
References: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
 <20230710115354.699245-7-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230710115354.699245-7-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 6/7] tests/build: Generate and store
 an intel-ci.testlist
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

Hi Mauro,

On 2023-07-10 at 13:53:53 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Store a sorted testlist with tests that could be used to test the
> DRM core and the Intel drivers in a format that it would be
> expected by igt_runner.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Looks good, I will add also Ewelina on Cc as it creates
intel-ci.testlist

Regards,
Kamil

> ---
>  tests/intel-ci/meson.build | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index d5a6e4f47203..a1ec517f8da1 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -9,4 +9,12 @@ intelci_files = [
>    'xe.blocklist.txt',
>  ]
>  
> +custom_target('intel-ci.testlist',
> +              build_by_default : true,
> +              command : ['sort', testlist_files],
> +              install : true,
> +              install_dir : datadir,
> +              capture : true,
> +              output : 'intel-ci.testlist')
> +
>  install_data(sources : intelci_files, install_dir : datadir)
> -- 
> 2.40.1
> 

