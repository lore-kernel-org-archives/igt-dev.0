Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A1710E185
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 18:23:39 +0000 (UTC)
Date: Mon, 10 Jul 2023 20:23:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230710182336.j6aaesmir65kvg5m@kamilkon-desk1>
References: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
 <20230710115354.699245-6-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230710115354.699245-6-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 5/7] scripts/test_list.py: speedup
 testlist check logic
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

On 2023-07-10 at 13:53:52 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Now that the build system will generate the testlist for us,
> just read them when checking for missing symbols.
> 
> This should speed up a log the check logic.
s/a log//

> 
> After the change, touching on a single file and rebuilding the
> testplan with check enabled is a lot faster:
-------------------------------- ^^^^^
Please write a factor here which you measured, like: "4 times"

> 
> 	$ touch tests/xe/xe_compute.c
> 	$ time make
> 	ninja -C build
> 	ninja: Entering directory `build'
> 	[10/10] Generating docs/testplan/i915_tests.html with a custom command
> 
> 	real	0m4.510s
> 	user	0m5.944s
> 	sys	0m0.217s
> 
> This can be improved even further if we split the test_executables
> dependencies per driver.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/test_list.py | 30 ++++++------------------------
>  1 file changed, 6 insertions(+), 24 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index a55d2977c7c3..2c1a6f230fb5 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -909,35 +909,17 @@ class TestList:
>  
>          return subtests
>  
> -    def __get_testlist(self, name):
> -        match = re.match(r"(.*/)?(.*)\.c$", name)
> -        if not match:
> -            return []
> -
> -        basename = "igt@" + match.group(2)
> -
> -        fname = os.path.join(self.igt_build_path, "tests", match.group(2))
> -        if not os.path.isfile(fname):
> -            print(f"Error: file {fname} doesn't exist.")
> -            sys.exit(1)

We miss this basic check now?

Regards,
Kamil

> -        try:
> -            result = subprocess.run([ fname, "--list-subtests" ],
> -                                    check = True,
> -                                    stdout = subprocess.PIPE,
> -                                    universal_newlines=True)
> -            subtests = result.stdout.splitlines()
> -
> -            return [basename  + "@" + i for i in subtests]
> -        except subprocess.CalledProcessError:
> -            # Handle it as a test using igt_simple_main
> -            return [basename]
> -
>      def get_testlist(self):
>  
>          """ Return a list of tests as reported by --list-subtests """
>          tests = []
>          for name in self.filenames:
> -            tests += self.__get_testlist(name)
> +            fname = re.sub(r"\.c$", ".testlist", name.split('/')[-1])
> +            fname = os.path.join(self.igt_build_path, "tests", fname)
> +
> +            with open(fname, 'r', encoding='utf8') as handle:
> +                for line in handle:
> +                    tests.append(line)
>  
>          return sorted(tests)
>  
> -- 
> 2.40.1
> 

