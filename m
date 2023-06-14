Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005E210E0F6
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 11:24:44 +0000 (UTC)
Date: Wed, 14 Jun 2023 13:24:40 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230614112440.y766svlwt4bejjmv@zkempczy-mobl2>
References: <20230612165302.28718-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230612165302.28718-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Add kmsg for igt_abort
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

On Mon, Jun 12, 2023 at 06:53:02PM +0200, Kamil Konieczny wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> Include a dmesg telltale for when the test run aborts.
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
> index cd9c2002d..4aaaeddbc 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -2202,6 +2202,9 @@ void __igt_abort(const char *domain, const char *file, const int line,
>  
>  	igt_is_aborting = true;
>  
> +	igt_kmsg(KMSG_ERR "%s[%d]: Abort in function %s, file %s:%i, %s\n",
> +		 command_str, getpid(), func, file, line, expression);
> +
>  	igt_log(domain, IGT_LOG_CRITICAL,
>  		"Test abort in function %s, file %s:%i:\n", func, file,
>  		line);
> -- 
> 2.39.2
> 
