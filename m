Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286596E4DD
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2020 12:00:24 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200729113425.29486-1-petri.latvala@intel.com>
References: <20200729113425.29486-1-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 29 Jul 2020 13:00:21 +0100
Message-ID: <159602402103.8877.14463651350795263196@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] runner/resultgen: Remember to close
 fd to aborted.txt
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

Quoting Petri Latvala (2020-07-29 12:34:24)
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Cc: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>
> ---
>  runner/resultgen.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index e2e162b0..3fe83b43 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -1637,6 +1637,7 @@ struct json_object *generate_results_json(int dirfd)
>                 add_to_totals("runner", &abortsub, &results);
>  
>                 free_subtests(&abortsub);
> +               close(fd);
>         }
>  
>         free_settings(&settings);

For completeness, I noticed that generate_results_path() has an open
within a matching close.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
