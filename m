Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2111D10E02D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 19:14:08 +0000 (UTC)
Date: Wed, 22 Mar 2023 20:14:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230322191403.6udxbphp3ut6mnpr@kamilkon-desk1>
References: <20230322082826.1770429-1-mauro.chehab@linux.intel.com>
 <20230322082826.1770429-8-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230322082826.1770429-8-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 7/8] testplan/meson.build: use
 join_paths()
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

On 2023-03-22 at 09:28:25 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Use the more portable join_paths() macro.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  docs/testplan/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 9e7ae7a04753..10ea4be9a3f5 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -4,9 +4,9 @@ sphinx = find_program('sphinx-build', required: build_sphinx)
>  rst2html = find_program('rst2html-3', 'rst2html', required : false)
>  rst2pdf = find_program('rst2pdf', required: false)
>  
> -stylesheet = meson.current_source_dir() + '/testplan.css'
> +stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
>  
> -xe_test_config = source_root + '/tests/xe/xe_test_config.json'
> +xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
>  
>  if not build_tests
>      test_executables = []
> -- 
> 2.39.2
> 

