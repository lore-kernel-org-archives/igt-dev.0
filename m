Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BAA10E0B6
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 15:53:35 +0000 (UTC)
Date: Thu, 31 Aug 2023 17:53:29 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230831175329.0ca5e409@maurocar-mobl2>
In-Reply-To: <20230831152200.1192557-2-bhanuprakash.modem@intel.com>
References: <20230831152200.1192557-1-bhanuprakash.modem@intel.com>
 <20230831152200.1192557-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t 1/2] scripts/test_list: Ignore uncompiled tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 31 Aug 2023 20:51:59 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> As we are using wildcards in test_config json file, script
> assumes each file in the list is compiled & <file_name>.testlist
> is generated. But it is not always true.
> 
> Example:
>  - kms_test_config.json includes all files inside chamelium dir
>  - And if we compile without chamelium tests, will endup with
>    build failures.
> 
> $ meson -Dchamelium=disabled build && ninja -C build
> FileNotFoundError: [Errno 2] No such file or directory: 'igt/build/tests/kms_chamelium_frames.testlist'
> [1551/1555] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
> ninja: build stopped: subcommand failed.
> make: *** [Makefile:10: all] Error 1
> 
> So, update the scripts to just ignore if <file_name>.testlist isn't find.
> 
> $ meson -Dchamelium=disabled build && ninja -C build
> [5/7] Generating kms_tests.rst with a custom command
> kms_chamelium_hpd.testlist: Testlist file not found.
> kms_chamelium_frames.testlist: Testlist file not found.
> kms_chamelium_audio.testlist: Testlist file not found.
> kms_chamelium_edid.testlist: Testlist file not found.
> kms_chamelium_color.testlist: Testlist file not found.
> [7/7] Generating kms_tests.html with a custom command
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  scripts/test_list.py | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index c23d6d735..0bcc96869 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -914,8 +914,12 @@ class TestList:
>          """ Return a list of tests as reported by --list-subtests """
>          tests = []
>          for name in self.filenames:
> -            fname = re.sub(r"\.c$", ".testlist", name.split('/')[-1])
> -            fname = os.path.join(self.igt_build_path, "tests", fname)
> +            testlist = re.sub(r"\.c$", ".testlist", name.split('/')[-1])
> +            fname = os.path.join(self.igt_build_path, "tests", testlist)
> +
> +            if not os.path.isfile(fname):
> +                print(f"{testlist}: Testlist file not found.")
> +                continue
>  
>              with open(fname, 'r', encoding='utf8') as handle:
>                  for line in handle:
