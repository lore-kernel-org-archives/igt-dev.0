Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8A610E126
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 13:43:35 +0000 (UTC)
Date: Fri, 24 Mar 2023 14:43:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230324134331.i2msihaynoxiqod6@kamilkon-desk1>
References: <20230322082826.1770429-1-mauro.chehab@linux.intel.com>
 <20230322082826.1770429-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230322082826.1770429-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/8] meson.build: place gtk-doc
 dependencies check at the right place
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

On 2023-03-22 at 09:28:21 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The requirement for having gtk-doc is specific to
> docs/reference/igt-gpu-tools.
> 
> So, move the code to be there. This lets build testplan docs
- ^^^^^^^^
imho better start with: Moved
Moved the code to be there. This lets build testplan docs

> without needing gtk-doc (nor having the IGT executables).
> 
> It should be noticed that testplan indirectly depends on
> build_tests, for one reason only: the tests subdir is only
> included if build_tests is true. Without it, the xe_test_config
> variable will be undefined, as it is declared inside a tests
> subdir.
> 
> So, we need to add an extra test for the testplan subdir,
- ^^^
> to ensure that the variable is declared.

Same here, maybe reorder it like:

To ensure that the variable is declared we need to add an extra
test for the testplan subdir.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  docs/meson.build           |  5 ++++-
>  docs/reference/meson.build |  9 ++++++++-
>  meson.build                | 11 +++--------
>  3 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/docs/meson.build b/docs/meson.build
> index 01edf64f04a8..9bfec8fee80b 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -1,2 +1,5 @@
>  subdir('reference')
> -subdir('testplan')
> +
> +if xe_test_config != ''
> +	subdir('testplan')
> +endif
> diff --git a/docs/reference/meson.build b/docs/reference/meson.build
> index 85a8aa47f920..12ccbd911af7 100644
> --- a/docs/reference/meson.build
> +++ b/docs/reference/meson.build
> @@ -1 +1,8 @@
> -subdir('igt-gpu-tools')
> +gtk_doc = dependency('gtk-doc', required : build_docs)
> +if build_tests and gtk_doc.found()
> +	subdir('igt-gpu-tools')
> +elif build_docs.enabled()
> +	error('Documentation requires building tests')
> +endif
> +
> +build_info += 'Build reference documentation: @0@'.format(build_docs.enabled())
> diff --git a/meson.build b/meson.build
> index cbb7ead7d9cd..b896283e3244 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -320,6 +320,8 @@ endif
>  subdir('lib')
>  if build_tests
>  	subdir('tests')
> +else
> +	xe_test_config = ''
>  endif
>  build_info += 'Build tests: @0@'.format(build_tests)
>  
> @@ -332,14 +334,7 @@ endif
>  subdir('overlay')
>  subdir('man')
>  subdir('scripts')
> -
> -gtk_doc = dependency('gtk-doc', required : build_docs)
> -if build_tests and gtk_doc.found()
> -	subdir('docs')
> -elif build_docs.enabled()
> -	error('Documentation requires building tests')
> -endif
> -build_info += 'Build documentation: @0@'.format(build_tests and gtk_doc.found())
> +subdir('docs')
>  
>  message('Build options')
>  message('=============')
> -- 
> 2.39.2
> 

