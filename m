Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E4610EB53
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 10:07:50 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=maurocar-mobl2)
 by linux.intel.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <mauro.chehab@linux.intel.com>)
 id 1nYmCo-0007dy-5a
 for igt-dev@lists.freedesktop.org; Mon, 28 Mar 2022 12:02:34 +0200
Date: Mon, 28 Mar 2022 12:02:33 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Message-ID: <20220328120233.12e172eb@maurocar-mobl2>
In-Reply-To: <20220328091329.16009-1-petri.latvala@intel.com>
References: <20220328091329.16009-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Fix handling of per-test-timeout
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

On Mon, 28 Mar 2022 12:13:29 +0300
Petri Latvala <petri.latvala@intel.com> wrote:

> Instead of stopping execution on resume-init success, stop on
> resume-init failure like intended.
> 
> Fixes: 4b88a9253443 ("runner: check if it has root permissions")
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  runner/executor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index b4efc4fd..6e6ca9cc 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -2043,7 +2043,7 @@ bool execute(struct execute_state *state,
>  			}
>  			close(sigfd);
>  			close(testdirfd);
> -			if (initialize_execute_state_from_resume(resdirfd, state, settings, job_list))
> +			if (!initialize_execute_state_from_resume(resdirfd, state, settings, job_list))
>  				return false;
>  			state->time_left = time_left;
>  			return execute(state, settings, job_list);
