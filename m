Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AD56E11D
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2020 05:01:11 +0000 (UTC)
Date: Fri, 12 Jun 2020 08:01:08 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200612050108.GO9497@platvala-desk.ger.corp.intel.com>
References: <20200611180406.629107-1-stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611180406.629107-1-stefan@agner.ch>
Subject: Re: [igt-dev] [PATCH i-g-t] scripts/run-tests.sh: also search path
 for runner binaries
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Stefan Agner <stefan@agner.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 08:04:06PM +0200, Stefan Agner wrote:
> To make the script also useful when igt_runner/igt_resume binarires are
> installed, also search PATH for the binaries.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>


Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  scripts/run-tests.sh | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
> index b7e2faa3..8399b6d1 100755
> --- a/scripts/run-tests.sh
> +++ b/scripts/run-tests.sh
> @@ -67,10 +67,21 @@ fi
>  
>  IGT_TEST_ROOT="`readlink -f ${IGT_TEST_ROOT}`"
>  
> -function find_runner_binaries
> +function find_runner_binary # basename
>  {
> -	IGT_RUNNER=$(find_file igt_runner "$ROOT/build/runner" "$ROOT/runner")
> -	IGT_RESUME=$(find_file igt_resume "$ROOT/build/runner" "$ROOT/runner")
> +	base=$1
> +	shift
> +
> +	binary=$(find_file "$base" "$ROOT/build/runner" "$ROOT/runner")
> +	if [ -x "$binary" ]; then
> +		echo "$binary"
> +		return 0
> +	elif binary=$(which "$base"); then
> +		echo "$binary"
> +		return 0
> +	fi
> +
> +	return 1
>  }
>  
>  function download_piglit {
> @@ -177,8 +188,8 @@ if [ "$USE_PIGLIT" -eq "1" ]; then
>  	RESUME_ARGS="resume $NORETRY"
>  	LIST_ARGS="print-cmd igt --format {name}"
>  else
> -	find_runner_binaries
> -	if [ ! -x "$IGT_RUNNER" -o ! -x "$IGT_RESUME" ]; then
> +	if ! IGT_RUNNER=$(find_runner_binary igt_runner) ||
> +	   ! IGT_RESUME=$(find_runner_binary igt_resume); then
>  		echo "Could not find igt_runner binaries."
>  		echo "Please build the runner, or use Piglit with the -p flag."
>  		exit 1
> -- 
> 2.27.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
