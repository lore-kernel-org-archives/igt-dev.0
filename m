Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20210210105343.63133-1-tvrtko.ursulin@linux.intel.com>
References: <20210210093756.61424-2-tvrtko.ursulin@linux.intel.com>
 <20210210105343.63133-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 10 Feb 2021 11:06:55 +0000
Message-ID: <161295521564.6673.1761778214996402333@build.alporthouse.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/3] intel_gpu_top:
 Aggregate clients by PID by default
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
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2021-02-10 10:53:43)
> +static struct clients *display_clients(struct clients *clients)
> +{
> +       struct client *ac, *c, *cp = NULL;
> +       struct clients *aggregated;
> +       int tmp, num = 0;
> +
> +       if (!aggregate_pids)
> +               return sort_clients(clients, client_cmp);

Still two calls to return sort_clients(foo, client_cmp) in this function
:) [a clients = aggregated; after processing would merge the two paths].

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
