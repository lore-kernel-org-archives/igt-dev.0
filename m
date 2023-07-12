Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8AE10E59D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 17:22:33 +0000 (UTC)
Date: Wed, 12 Jul 2023 19:22:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230712172222.hl4y2lki656yahrb@kamilkon-desk1>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
 <20230712135854.957128-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230712135854.957128-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 01/13] tests/intel-ci/meson.build:
 Generate and store an intel-ci.testlist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-07-12 at 15:58:42 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Store a sorted testlist with tests that could be used to test the
> DRM core and the Intel drivers in a format that it would be
> expected by igt_runner.
> 
> This is a preparation to simplify test_list.py checks to make it
> more generic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
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

This looks ok, you can add my r-b, but please fix compilation error
(from local run, GitLab report is strange):

[305/310] Generating docs/testplan/xe_tests.rst with a custom command
FAILED: docs/testplan/xe_tests.rst 
/home/kamil/ramdisk/tmp-build/scripts/igt_doc.py --config /home/kamil/ramdisk/tmp-build/tests/xe/xe_test_config.json --rest docs/testplan/xe_tests.rst --check-testlist --built-testlist /home/kamil/ramdisk/tmp-build/build/tests/intel-ci/intel-ci.testlist
Traceback (most recent call last):
  File "/home/kamil/ramdisk/tmp-build/scripts/igt_doc.py", line 67, in <module>
    tests.check_tests()
  File "/home/kamil/ramdisk/tmp-build/scripts/test_list.py", line 970, in check_tests
    with open(self.built_testlist, 'r', encoding='utf8') as handle:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/kamil/ramdisk/tmp-build/build/tests/intel-ci/intel-ci.testlist'

Regards,
Kamil

> -- 
> 2.40.1
> 

