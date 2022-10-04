Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0F210E40F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Oct 2022 09:44:03 +0000 (UTC)
Date: Tue, 4 Oct 2022 12:43:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jake Freeland <jake@technologyfriends.net>
Message-ID: <YzwASSZibew5s55I@platvala-desk.ger.corp.intel.com>
References: <20220928193552.523357-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928193552.523357-1-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t] Replaced setpgrp() with setpgid() for
 standardization in BSD systems
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 02:35:52PM -0500, Jake Freeland wrote:
> The BSD and GNU versions of setpgrp() differ in their parameter
> conventions. To avoid this convolution, setpgrp() can be safely
> replaced with setpgid() which is standard in both BSD and GNU
> libc.
> 
> Signed-off-by: Jake Freeland <jfree@freebsd.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt_aux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index d7e2714f..ba2d52e8 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -325,10 +325,10 @@ void igt_fork_signal_helper(void)
>  	 * and we send the signal at exactly the wrong time).
>  	 */
>  	signal(SIGCONT, sig_handler);
> -	setpgrp(); /* define a new process group for the tests */
> +	setpgid(0, 0); /* define a new process group for the tests */
>  
>  	igt_fork_helper(&signal_helper) {
> -		setpgrp(); /* Escape from the test process group */
> +		setpgid(0, 0); /* Escape from the test process group */
>  
>  		/* Pass along the test process group identifier,
>  		 * negative pid => send signal to everyone in the group.
> -- 
> 2.37.3
> 
