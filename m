Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2802D10E052
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 16:03:53 +0000 (UTC)
Date: Wed, 19 Apr 2023 18:03:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230419160346.y2du7xnivd7y273o@zkempczy-mobl2>
References: <20230418191847.62457-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230418191847.62457-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] gem_exec_capture: Don't dump the whole
 error state
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 09:18:47PM +0200, Kamil Konieczny wrote:
> From: Petri Latvala <petri.latvala@intel.com>
> 
> The error state, when it includes full guc log, leads to a total
> of ~80MB of stderr dumped when the test fails on particular
> platforms. Stop dumping the full error state, keep only first 4k.
> 
> v2: Dump the first 4k of the error state still (Chris)
>     [small edit of commit message Kamil]
> 
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_exec_capture.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index d0499a831..9c391192d 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -131,6 +131,7 @@ ascii85_decode(char *in, uint32_t **out, bool inflate, char **end)
>  static int check_error_state(int dir, struct offset *obj_offsets, int obj_count,
>  			     uint64_t obj_size, bool incremental)
>  {
> +	int error_dump_limit = 4096;
>  	char *error, *str;
>  	int blobs = 0;
>  
> @@ -139,7 +140,7 @@ static int check_error_state(int dir, struct offset *obj_offsets, int obj_count,
>  	igt_sysfs_set(dir, "error", "Begone!");
>  	igt_assert(error);
>  	igt_assert(errno != ENOMEM);
> -	igt_debug("%s\n", error);
> +	igt_debug("%.*s\n", error_dump_limit, error);
>  
>  	/* render ring --- user = 0x00000000 ffffd000 */
>  	for (str = error; (str = strstr(str, "--- user = ")); ) {
> -- 
> 2.37.2
>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

