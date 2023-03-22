Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D03310E16C
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 19:12:08 +0000 (UTC)
Date: Wed, 22 Mar 2023 20:11:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230322191132.n6ghypqffm2ssygl@kamilkon-desk1>
References: <20230322082826.1770429-1-mauro.chehab@linux.intel.com>
 <20230322082826.1770429-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230322082826.1770429-5-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 4/8] meson: get rid of a
 future-deprecated warning
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

On 2023-03-22 at 09:28:22 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> A warning is generated with newer meson versions:
> 
> 	NOTICE: Future-deprecated features used:
> 	 * 0.56.0: {'meson.source_root'}
> 
> While there is a new macro to get it, that would rise the
> dependency chain to meson 0.56. So, instead, just store it
> on a variable.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Thank you for that cleanup,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> ---
>  lib/meson.build | 2 +-
>  meson.build     | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 768ce90b54df..ad9e2abef4c3 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -178,7 +178,7 @@ endif
>  if get_option('srcdir') != ''
>      srcdir = join_paths(get_option('srcdir'), 'tests')
>  else
> -    srcdir = join_paths(meson.source_root(), 'tests')
> +    srcdir = join_paths(source_root, 'tests')
>  endif
>  
>  if get_option('version_hash') != ''
> diff --git a/meson.build b/meson.build
> index b896283e3244..12d5113a9042 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -13,6 +13,9 @@ if get_option('b_ndebug') != 'false'
>  	error('Building without -Db_ndebug=false is not supported')
>  endif
>  
> +# meson.source_root is marked as a future-deprecated feature
> +source_root = meson.current_source_dir()
> +
>  cc = meson.get_compiler('c')
>  
>  # Also make sure that the user doesn't have -DNDEBUG defined in their config
> -- 
> 2.39.2
> 

