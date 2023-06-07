Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC27810E3E7
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 06:27:57 +0000 (UTC)
Date: Wed, 7 Jun 2023 08:27:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230607062752.3qu6ru5u5iq5d55g@zkempczy-mobl2>
References: <20230605180745.40121-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230605180745.40121-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Dump GPU state on timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 05, 2023 at 08:07:45PM +0200, Kamil Konieczny wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> As well as the task and cpu state we show, include the GPU state now
> availavle via sysrq upon a runner abort (typically a timeout for an

  ^ - typo

With this fixed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


> unresponsive driver).
> 
> Cc: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/executor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 597cd7f58..d3e6296dd 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -748,6 +748,7 @@ static void kmsg_log(int severity, const char *msg)
>  static const char *show_kernel_task_state(const char *msg)
>  {
>  	kmsg_log(KMSG_WARN, msg);
> +	sysrq('G'); /* GPU state */
>  	sysrq('t'); /* task state, stack traces and cpu run lists */
>  	sysrq('m'); /* task memory usage */
>  
> -- 
> 2.39.2
> 
