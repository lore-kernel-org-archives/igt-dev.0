Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDDF10E021
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 13:32:51 +0000 (UTC)
Date: Fri, 24 Mar 2023 14:32:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230324133247.knjkfmj4ejh7myl3@kamilkon-desk1>
References: <20230322082826.1770429-1-mauro.chehab@linux.intel.com>
 <20230322082826.1770429-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230322082826.1770429-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 2/8] testplan: build also a PDF file
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

On 2023-03-22 at 09:28:20 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> PDF files are easier to share, and it costs almost nothing to
> produce them with Sphinx, via rst2pdf. Added support for it
> if rst2pdf is installed.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  docs/testplan/meson.build | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 11c08573307e..50063aa2e84f 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -5,6 +5,7 @@ build_sphinx = get_option('sphinx')
>  
>  rst2html = find_program('rst2html-3', 'rst2html', required : build_testplan)
>  sphinx = find_program('sphinx-build', required: build_sphinx)
> +rst2pdf = find_program('rst2pdf', required: false)
>  
>  stylesheet = meson.current_source_dir() + '/testplan.css'
>  
> @@ -52,8 +53,23 @@ if sphinx.found()
>                      output : 'index.html'
>                      )
>      endif
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
> +    endif
>  endif
>  
>  build_info += 'Build ReST test documentation: @0@'.format(igt_doc_script.found())
>  build_info += 'Build simple html testplan documentation: @0@'.format(rst2html.found())
>  build_info += 'Build indexed html testplan documentation: @0@'.format(sphinx.found())
> +build_info += 'Build pdf testplan documentation: @0@'.format(sphinx.found() and rst2pdf.found())
> -- 
> 2.39.2
> 

