Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20210122115524.768221-1-tvrtko.ursulin@linux.intel.com>
References: <20210121181005.762333-1-tvrtko.ursulin@linux.intel.com>
 <20210122115524.768221-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 22 Jan 2021 12:15:34 +0000
Message-ID: <161131773470.3166.13248329911713611140@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6] intel-gpu-top: Support for client
 stats
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2021-01-22 11:55:24)
> +static int client_cmp(const void *_a, const void *_b)
> +{
> +       const struct client *a = _a;
> +       const struct client *b = _b;
> +       long tot_a, tot_b;
> +
> +       /*
> +        * Sort clients in descending order of runtime in the previous sampling
> +        * period for active ones, followed by inactive. Tie-breaker is client
> +        * id.
> +        */
> +
> +       tot_a = a->status == ALIVE ? a->total : -1;
> +       tot_b = b->status == ALIVE ? b->total : -1;
> +
> +       tot_b -= tot_a;
> +       if (!tot_b)
> +               return (int)b->id - a->id;
> +
> +       if (tot_b > 0)
> +               return 1;
> +       if (tot_b < 0)
> +               return -1;
> +       return 0;

Nit, this is clearly now

	if (tot_b > 0)
               return 1;
	if (tot_b < 0)
               return -1;

	return (int)b->id - a->id;

And the decision flow now neatly matches the comment.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
