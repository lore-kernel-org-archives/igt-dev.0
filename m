Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1DD10E2D0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 17:43:22 +0000 (UTC)
Date: Mon, 20 Mar 2023 18:43:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230320174318.i6fhwud5dgjcrp2i@kamilkon-desk1>
References: <20230320084500.1434535-1-mauro.chehab@linux.intel.com>
 <20230320084500.1434535-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230320084500.1434535-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] testplan: build also a PDF file
 with the testplan
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

On 2023-03-20 at 09:45:00 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> PDF files are easier to share, and it costs almost nothing to
> produce them with Sphinx using rst2pdf. So, add support for it,

s/So, add/Added/
s/it,/it/

> if rst2pdf is installed.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  docs/testplan/meson.build | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 11c08573307e..65bb6c31cd65 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -4,6 +4,7 @@ build_testplan = get_option('testplan')
>  build_sphinx = get_option('sphinx')
>  
>  rst2html = find_program('rst2html-3', 'rst2html', required : build_testplan)
> +rst2pdf = find_program('rst2pdf')
>  sphinx = find_program('sphinx-build', required: build_sphinx)
>  
>  stylesheet = meson.current_source_dir() + '/testplan.css'
> @@ -46,14 +47,30 @@ if sphinx.found()
>                                  )
>  
>          custom_target('index.html',
> -                    build_by_default : true,
> -                    command : [ 'sphinx-build', '-c', meson.current_source_dir(), meson.current_build_dir(), sphinx_out_dir],
> -                    input : index_rst,
> -                    output : 'index.html'
> -                    )
> +                      build_by_default : true,
> +                      command : [ 'sphinx-build', '-c', meson.current_source_dir(),
> +                      meson.current_build_dir(), sphinx_out_dir],
> +                      input : index_rst,
> +                      output : 'index.html'
> +                      )
> +    endif

Please do not touch unrelated lines.

> +
> +    if rst2pdf.found()
> +        sphinx_out_pdf = meson.current_build_dir() + '/pdf'
> +
> +        custom_target('xe_tests.pdf',
> +                      build_by_default : true,
> +                      command : [ 'sphinx-build', '-c', meson.current_source_dir(),
> +                      '-b', 'pdf',
> +                      '-D', 'version=' + meson.project_version(),
> +                      meson.current_build_dir(), sphinx_out_pdf],
> +                      input : index_rst,
> +                      output : 'xe_tests.pdf'
> +                      )

It seemd build fails when no rst2pdf is present:

Program rst2pdf found: NO

docs/testplan/meson.build:7:0: ERROR: Program 'rst2pdf' not found or not executable

Regards,
Kamil

>      endif
>  endif
>  
>  build_info += 'Build ReST test documentation: @0@'.format(igt_doc_script.found())
>  build_info += 'Build simple html testplan documentation: @0@'.format(rst2html.found())
>  build_info += 'Build indexed html testplan documentation: @0@'.format(sphinx.found())
> +build_info += 'Build pdf testplan documentation: @0@'.format(sphinx.found() and rst2pdf.found())
> -- 
> 2.39.2
> 

