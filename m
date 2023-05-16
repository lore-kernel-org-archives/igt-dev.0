Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AD410E25D
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 16:19:05 +0000 (UTC)
Date: Tue, 16 May 2023 18:18:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230516161857.6lhx2lxo7bj2ptwr@kamilkon-desk1>
References: <20230509090738.1157939-1-mauro.chehab@linux.intel.com>
 <20230509090738.1157939-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509090738.1157939-5-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/6] testplan/meson.build: add i915
 support for a testplan document
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

On 2023-05-09 at 11:07:36 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Prepare to support documenting the i915 tests via in-code macros, in a
> similar way to how Xe tests are documented.
> 
> For now, don't enable checking i915 documentation here, as this
> may consume a lot of build time on desktops.
> 
> Please notice that we had to exclude documentation for
> gem_concurrent_all.c, as there are too many subtests there:
> 
> 	${build}/tests/gem_concurrent_all --list|wc -l
> 	428400
> 
> Adding documentation for all of them (even with wildcards) would
> produce a very big document, seriously affecting build time.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  docs/testplan/conf.py            |  2 +-
>  docs/testplan/meson.build        |  6 ++-

This do not apply, should it be done after kms doc patchseries ?
Please also keep in mind compatibility with old meson 0.47.2
until we move on newer version.

With that:

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  tests/i915/i915_test_config.json | 88 ++++++++++++++++++++++++++++++++
>  3 files changed, 93 insertions(+), 3 deletions(-)
>  create mode 100644 tests/i915/i915_test_config.json
> 
> diff --git a/docs/testplan/conf.py b/docs/testplan/conf.py
> index a73ad99b09b6..a7db5c3a230d 100644
> --- a/docs/testplan/conf.py
> +++ b/docs/testplan/conf.py
> @@ -68,5 +68,5 @@ htmlhelp_basename = 'IGT'
>  
>  # rst2pdf
>  pdf_documents = [
> -    ('index', u'xe_tests', u'IGT Xe Tests', u'IGT authors'),
> +    ('index', u'tests', u'IGT Xe Tests', u'IGT authors'),
>  ]
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index b65ee964ddd2..ca70864c1e95 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -8,6 +8,7 @@ stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
>  
>  xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
>  kms_test_config = join_paths(source_root, 'tests', 'kms_test_config.json')
> +i915_test_config = join_paths(source_root, 'tests', 'i915', 'i915_test_config.json')
>  
>  check_testlist = []
>  if build_tests
> @@ -25,6 +26,7 @@ endif
>  
>  test_dict = {
>  	      'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist },
> +	      'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
>  	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
>  	    }
>  
> @@ -70,14 +72,14 @@ if sphinx.found()
>  	if rst2pdf.found()
>  		sphinx_out_pdf = meson.current_build_dir() + '/pdf'
>  
> -		custom_target('xe_tests.pdf',
> +		custom_target('tests.pdf',
>  			      build_by_default : true,
>  			      command : [ 'sphinx-build', '-c', meson.current_source_dir(),
>  					  '-b', 'pdf',
>  					  '-D', 'version=' + meson.project_version(),
>  					  meson.current_build_dir(), sphinx_out_pdf],
>  			      input : index_rst,
> -			      output : 'xe_tests.pdf'
> +			      output : 'tests.pdf'
>  			     )
>  	endif
>  endif
> diff --git a/tests/i915/i915_test_config.json b/tests/i915/i915_test_config.json
> new file mode 100644
> index 000000000000..812cb73b9f52
> --- /dev/null
> +++ b/tests/i915/i915_test_config.json
> @@ -0,0 +1,88 @@
> +{
> +    "description": "JSON file to be used to parse i915 documentation",
> +    "files": [ "*.c", "../core_auth.c", "../core_getclient.c",
> +               "../core_getstats.c", "../core_getversion.c",
> +               "../core_hotunplug.c", "../core_setmaster.c",
> +               "../core_setmaster_vs_auth.c", "../debugfs_test.c",
> +               "../device_reset.c", "../dmabuf.c",
> +               "../drm_import_export.c", "../drm_mm.c",
> +               "../dumb_buffer.c", "../prime_busy.c", "../prime_mmap.c",
> +               "../prime_mmap_coherency.c", "../prime_self_import.c",
> +               "../prime_vgem.c", "../sw_sync.c", "../syncobj_basic.c",
> +               "../syncobj_timeline.c", "../syncobj_wait.c",
> +               "../vgem_basic.c", "../vgem_slow.c" ],
> +    "exclude_files": [ "kms_*", "gem_concurrent_all.c" ],
> +    "fields": {
> +	"Mega feature": {
> +                "_properties_": {
> +                    "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
> +                },
> +                "Category": {
> +                "_properties_": {
> +                    "description": "Contains the major group for the tested functionality"
> +                },
> +
> +                "Sub-category": {
> +                    "_properties_": {
> +                        "description": "Contains the minor group of the functionality"
> +                    },
> +                    "Functionality": {
> +                        "_properties_": {
> +                            "description": "Describes the functionality to be tested"
> +                        },
> +                        "Feature": {
> +                            "_properties_": {
> +                                "description": "Describes the lowest level feature bucket"
> +                            },
> +                            "Run type": {
> +                                "_properties_": {
> +                                    "description": "Defines what category of testlist it belongs"
> +                                }
> +                            }
> +                        }
> +                    }
> +                }
> +            }
> +        },
> +        "Test category": {
> +            "_properties_": {
> +                "description": "Defines the test category. Usually used at subtest level."
> +            }
> +        },
> +        "Test requirement": {
> +            "_properties_": {
> +                "description": "Defines Kernel parameters required for the test to run"
> +            }
> +        },
> +        "Issue": {
> +            "_properties_": {
> +                "description": "If the test is used to solve an issue, point to the URL containing the issue."
> +            }
> +        },
> +        "GPU excluded platform": {
> +            "_properties_": {
> +                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole)."
> +            }
> +        },
> +        "GPU requirement": {
> +            "_properties_": {
> +                "description": "Describes any GPU-specific requrirement, like requiring multi-tiles."
> +            }
> +        },
> +        "Depends on" : {
> +            "_properties_": {
> +                "description": "List other subtests that are required to not be skipped before calling this one."
> +            }
> +        },
> +        "TODO": {
> +            "_properties_": {
> +                "description": "Point to known missing features at the test or subtest."
> +            }
> +        },
> +        "Description" : {
> +            "_properties_": {
> +                "description": "Provides a description for the test/subtest."
> +            }
> +        }
> +    }
> +}
> -- 
> 2.40.1
> 

