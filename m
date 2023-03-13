Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CB510E309
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 06:55:58 +0000 (UTC)
Date: Mon, 13 Mar 2023 07:55:55 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230313065555.6hmiuqzbxx3p7imn@zkempczy-mobl2>
References: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
 <20230310194125.14781-7-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230310194125.14781-7-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 06/19] scripts/igt_doc.py: add error
 handler for subprocess
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 08:41:12PM +0100, Zbigniew Kempczyński wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Handle exceptions when trying to excecute IGT runner.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/igt_doc.py | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 712e22c9d3..c06c6e4eae 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -754,14 +754,15 @@ class TestList:
>              doc_subtests[i] = re.sub(r'\<[^\>]+\>', r'\\d+', doc_subtests[i])
>  
>          # Get a list of tests from
> -        result = subprocess.run([ f"{IGT_BUILD_PATH}/{IGT_RUNNER}",  # pylint: disable=W1510
> -                                "-L", "-t",  self.min_test_prefix,
> -                                f"{IGT_BUILD_PATH}/tests"],
> -                                capture_output = True, text = True)
> -        if result.returncode:
> -            print( result.stdout)
> -            print("Error:", result.stderr)
> -            sys.exit(result.returncode)
> +        try:
> +            result = subprocess.run([ f"{IGT_BUILD_PATH}/{IGT_RUNNER}",
> +                                    "-L", "-t",  self.min_test_prefix,
> +                                    f"{IGT_BUILD_PATH}/tests"], check = True,
> +                                    capture_output = True, text = True)
> +        except subprocess.CalledProcessError as sub_err:
> +            print(sub_err.stderr)
> +            print("Error:", sub_err)
> +            sys.exit(1)
>  
>          run_subtests = sorted(result.stdout.splitlines())
>  
> -- 
> 2.34.1
>

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew
