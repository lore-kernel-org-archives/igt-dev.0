Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1176510E533
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 13:49:05 +0000 (UTC)
Date: Fri, 24 Mar 2023 14:49:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230324134901.bq2crdglmjzcupom@kamilkon-desk1>
References: <20230322082826.1770429-1-mauro.chehab@linux.intel.com>
 <20230322082826.1770429-7-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230322082826.1770429-7-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 6/8] testplan/meson.build: cleanup
 dependency chain
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

On 2023-03-22 at 09:28:24 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Simplify the checks inside testplan/meson.build and ensure that
> it will only build if option build_testplan is selected, by moving
> such check to docs/meson.build.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  docs/meson.build          |  5 ++++-
>  docs/testplan/meson.build | 42 +++++++++++++++++----------------------
>  meson.build               |  3 +++
>  scripts/meson.build       |  4 ++--
>  4 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/docs/meson.build b/docs/meson.build
> index 01edf64f04a8..d56260564cec 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -1,2 +1,5 @@
>  subdir('reference')
> -subdir('testplan')
> +
> +if igt_doc_script.found()
> +	subdir('testplan')
> +endif
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index d34a8212df76..9e7ae7a04753 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -1,10 +1,7 @@
>  testplan_title = 'IGT test plans'
>  
> -build_testplan = get_option('testplan')
> -build_sphinx = get_option('sphinx')
> -
> -rst2html = find_program('rst2html-3', 'rst2html', required : build_testplan)
>  sphinx = find_program('sphinx-build', required: build_sphinx)
> +rst2html = find_program('rst2html-3', 'rst2html', required : false)
>  rst2pdf = find_program('rst2pdf', required: false)
>  
>  stylesheet = meson.current_source_dir() + '/testplan.css'
> @@ -20,26 +17,24 @@ test_dict = { 'xe_tests': {
>                }
>              }
>  
> -if igt_doc_script.found()
> -    foreach testplan, fields: test_dict
> -        rst = custom_target(testplan + '.rst',
> -                            build_by_default : true,
> -                            command : [ igt_doc_script, '--config', '@INPUT@', '--rest', '@OUTPUT@' ] + fields['extra_args'],
> -                            depends : test_executables,
> -                            input : fields['input'],
> -                            output : testplan + '.rst'
> -                            )
> +foreach testplan, fields: test_dict
> +    rst = custom_target(testplan + '.rst',
> +                        build_by_default : true,
> +                        command : [ igt_doc_script, '--config', '@INPUT@', '--rest', '@OUTPUT@' ] + fields['extra_args'],
> +                        depends : test_executables,
> +                        input : fields['input'],
> +                        output : testplan + '.rst'
> +                        )
>  
> -        if rst2html.found()
> -            custom_target(testplan + '.html',
> -                          build_by_default : true,
> -                          command : [ rst2html, '--stylesheet=' + stylesheet, '--field-name-limit=0', '@INPUT@', '@OUTPUT@' ],
> -                          input : rst,
> -                          output : testplan + '.html'
> -                          )
> -        endif
> -    endforeach
> -endif
> +    if rst2html.found()
> +        custom_target(testplan + '.html',
> +                      build_by_default : true,
> +                      command : [ rst2html, '--stylesheet=' + stylesheet, '--field-name-limit=0', '@INPUT@', '@OUTPUT@' ],
> +                      input : rst,
> +                      output : testplan + '.html'
> +                      )
> +    endif
> +endforeach
>  
>  if sphinx.found()
>      if gen_rst_index.found()
> @@ -75,7 +70,6 @@ if sphinx.found()
>      endif
>  endif
>  
> -build_info += 'Build ReST test documentation: @0@'.format(igt_doc_script.found())
>  build_info += 'Build simple html testplan documentation: @0@'.format(rst2html.found())
>  build_info += 'Build indexed html testplan documentation: @0@'.format(sphinx.found())
>  build_info += 'Build pdf testplan documentation: @0@'.format(sphinx.found() and rst2pdf.found())
> diff --git a/meson.build b/meson.build
> index 12d5113a9042..7360634fe199 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -328,6 +328,9 @@ else
>  endif
>  build_info += 'Build tests: @0@'.format(build_tests)
>  
> +build_testplan = get_option('testplan')
> +build_sphinx = get_option('sphinx')
> +
>  subdir('benchmarks')
>  subdir('tools')
>  subdir('runner')
> diff --git a/scripts/meson.build b/scripts/meson.build
> index ce12aa02e946..98783222b6fc 100644
> --- a/scripts/meson.build
> +++ b/scripts/meson.build
> @@ -12,5 +12,5 @@ if build_tests
>  	endforeach
>  endif
>  
> -igt_doc_script = find_program('igt_doc.py')
> -gen_rst_index = find_program('gen_rst_index')
> +igt_doc_script = find_program('igt_doc.py', required : build_testplan)
> +gen_rst_index = find_program('gen_rst_index', required : build_sphinx)
> -- 
> 2.39.2
> 

