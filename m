Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BA96E0A2
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2020 13:37:35 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200325131943.27797-1-petri.latvala@intel.com>
References: <20200325131943.27797-1-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158514345033.13191.10959159331522360908@build.alporthouse.com>
Date: Wed, 25 Mar 2020 13:37:30 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Remember to sync journal.txt
 for all writes
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-03-25 13:19:43)
> One missing fdatasync() for starting a subtest.
> 
> Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/81
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  runner/executor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index c4b99115..d2ced797 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -868,6 +868,9 @@ static int monitor_output(pid_t child,
>                                     !memcmp(outbuf, STARTING_SUBTEST, strlen(STARTING_SUBTEST))) {
>                                         write(outputs[_F_JOURNAL], outbuf + strlen(STARTING_SUBTEST),
>                                               linelen - strlen(STARTING_SUBTEST));
> +                                       if (settings->sync) {
> +                                               fdatasync(outputs[_F_JOURNAL]);
> +                                       }

Hmm, I wonder if O_SYNC would work and then we wouldn't have to worry
about forgetting.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
