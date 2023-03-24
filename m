Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7160B10E021
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 13:51:00 +0000 (UTC)
Date: Fri, 24 Mar 2023 14:50:56 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230324135056.drhcjjmsabr62bjz@kamilkon-desk1>
References: <20230322082826.1770429-1-mauro.chehab@linux.intel.com>
 <20230322082826.1770429-9-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230322082826.1770429-9-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 8/8] testplan/meson.build: re-indent
 file
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

On 2023-03-22 at 09:28:26 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> As other meson.build files are using tabs to align, replace
> spaces with tabs here too.
> 
> Just cosmetic changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  docs/testplan/meson.build | 94 +++++++++++++++++++--------------------
>  1 file changed, 47 insertions(+), 47 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 10ea4be9a3f5..fee568868167 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -9,65 +9,65 @@ stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
>  xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
>  
>  if not build_tests
> -    test_executables = []
> +	test_executables = []
>  endif
>  
> -test_dict = { 'xe_tests': {
> -                 'input': xe_test_config, 'extra_args': []
> -              }
> -            }
> +test_dict = { 'xe_tests':
> +		{ 'input': xe_test_config, 'extra_args': [] }
> +	    }
>  
>  foreach testplan, fields: test_dict
> -    rst = custom_target(testplan + '.rst',
> -                        build_by_default : true,
> -                        command : [ igt_doc_script, '--config', '@INPUT@', '--rest', '@OUTPUT@' ] + fields['extra_args'],
> -                        depends : test_executables,
> -                        input : fields['input'],
> -                        output : testplan + '.rst'
> -                        )
> +	rst = custom_target(testplan + '.rst',
> +			    build_by_default : true,
> +			    command : [ igt_doc_script, '--config', '@INPUT@', '--rest', '@OUTPUT@' ] + fields['extra_args'],
> +			    depends : test_executables,
> +			    input : fields['input'],
> +			    output : testplan + '.rst'
> +			   )
>  
> -    if rst2html.found()
> -        custom_target(testplan + '.html',
> -                      build_by_default : true,
> -                      command : [ rst2html, '--stylesheet=' + stylesheet, '--field-name-limit=0', '@INPUT@', '@OUTPUT@' ],
> -                      input : rst,
> -                      output : testplan + '.html'
> -                      )
> -    endif
> +	if rst2html.found()
> +		custom_target(testplan + '.html',
> +			      build_by_default : true,
> +			      command : [ rst2html, '--stylesheet=' + stylesheet, '--field-name-limit=0', '@INPUT@', '@OUTPUT@' ],
> +			      input : rst,
> +			      output : testplan + '.html'
> +			     )
> +	endif
>  endforeach
>  
>  if sphinx.found()
> -    if gen_rst_index.found()
> -        sphinx_out_dir = meson.current_build_dir()+ '/indexed_html'
> +	if gen_rst_index.found()
> +		sphinx_out_dir = meson.current_build_dir()+ '/indexed_html'
>  
> -        index_rst = custom_target('index.rst',
> -                                build_by_default : true,
> -                                command : [ gen_rst_index, testplan_title, test_dict.keys(), meson.current_build_dir()],
> -                                input : rst,
> -                                output : 'index.rst'
> -                                )
> +		index_rst = custom_target('index.rst',
> +					  build_by_default : true,
> +					  command : [ gen_rst_index, testplan_title, test_dict.keys(), meson.current_build_dir()],
> +					  input : rst,
> +					  output : 'index.rst'
> +					 )
>  
> -        custom_target('index.html',
> -                    build_by_default : true,
> -                    command : [ 'sphinx-build', '-c', meson.current_source_dir(), meson.current_build_dir(), sphinx_out_dir],
> -                    input : index_rst,
> -                    output : 'index.html'
> -                    )
> -    endif
> +		custom_target('index.html',
> +			      build_by_default : true,
> +			      command : [ 'sphinx-build', '-c', meson.current_source_dir(),
> +					  meson.current_build_dir(), sphinx_out_dir],
> +			      input : index_rst,
> +			      output : 'index.html'
> +			     )
> +	endif
>  
> -    if rst2pdf.found()
> -        sphinx_out_pdf = meson.current_build_dir() + '/pdf'
> +	if rst2pdf.found()
> +		sphinx_out_pdf = meson.current_build_dir() + '/pdf'
>  
> -        custom_target('xe_tests.pdf',
> -                      build_by_default : true,
> -                      command : [ 'sphinx-build', '-c', meson.current_source_dir(),
> -                      '-b', 'pdf',
> -                      '-D', 'version=' + meson.project_version(),
> -                      meson.current_build_dir(), sphinx_out_pdf],
> -                      input : index_rst,
> -                      output : 'xe_tests.pdf'
> -                      )
> -    endif
> +		custom_target('xe_tests.pdf',
> +			      build_by_default : true,
> +			      command : [ 'sphinx-build', '-c', meson.current_source_dir(),
> +					  '-b', 'pdf',
> +					  '-D', 'version=' + meson.project_version(),
> +					  meson.current_build_dir(), sphinx_out_pdf],
> +			      input : index_rst,
> +			      output : 'xe_tests.pdf'
> +			     )
> +	endif
>  endif
>  
>  build_info += 'Build simple html testplan documentation: @0@'.format(rst2html.found())
> -- 
> 2.39.2
> 

