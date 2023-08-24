Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075B010E58F
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 17:37:02 +0000 (UTC)
Date: Thu, 24 Aug 2023 19:36:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230824173642.thqew6hmn3sak3zs@kamilkon-desk.igk.intel.com>
References: <20230824142935.1172271-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230824142935.1172271-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci: add files to meson.build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Swati,

On 2023-08-24 at 19:59:35 +0530, Swati Sharma wrote:
> Testlists and blacklists are added to meson.build so that these
> can be used by CI.
> Also, sorted files alphabetically.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel-ci/meson.build | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 9f6ed501d..22f2e4650 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -1,14 +1,18 @@
> +# Keep alphabetically sorted by default
>  
>  intelci_files = [
> -  'fast-feedback.testlist',
> -  'meta.testlist',
>    'README',
> -  'blacklist.txt',
>    'blacklist-pre-merge.txt',
> -  'xe-fast-feedback.testlist',
> -  'xe.blocklist.txt',
> +  'blacklist.txt',
> +  'chamelium-only.testlist',
----------------^
This should be after chamelium.blacklist

>    'chamelium.blacklist',
> +  'fast-feedback-chamelium-only.testlist',
> +  'fast-feedback.testlist',
> +  'meta.testlist',
>    'psr.blacklist',
> +  'xe-fast-feedback-chamelium-only.testlist',
> +  'xe-fast-feedback.testlist',
> +  'xe.blocklist.txt',
-------- ^
This one should go before xe-fast

Regards,
Kamil

>  ]
>  
>  install_data(sources : intelci_files, install_dir : datadir)
> -- 
> 2.25.1
> 
