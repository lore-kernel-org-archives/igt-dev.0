Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAB710E0F6
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 11:24:06 +0000 (UTC)
Date: Wed, 14 Jun 2023 13:24:01 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230614112401.3xofmqnazzr7babo@zkempczy-mobl2>
References: <20230612164835.28444-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230612164835.28444-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] igt_core: Show the end of each subtest
 in dmesg
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 06:48:35PM +0200, Kamil Konieczny wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> We have an igt_kmsg for the start of each test, and so we know
> the end by looking for the next start message or the end of the
> whole test. However, logs are split into each subtest and it is
> not clear in the kernel message where or even _if_ the test
> finished executing.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/igt_core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index cd9c2002d..03a0ad693 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -1594,6 +1594,9 @@ __noreturn static void exit_subtest(const char *result)
>  				*subtest_name,
>  				result,
>  				igt_time_elapsed(thentime, &now));
> +	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
> +		 command_str, *subtest_name, result);
> +
>  	igt_terminate_spins();
>  
>  	/* If the subtest aborted, it may have left children behind */
> -- 
> 2.39.2
> 
