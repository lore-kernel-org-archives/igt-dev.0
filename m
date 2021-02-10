Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20210210093756.61424-2-tvrtko.ursulin@linux.intel.com>
References: <20210210093756.61424-1-tvrtko.ursulin@linux.intel.com>
 <20210210093756.61424-2-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 10 Feb 2021 10:35:59 +0000
Message-ID: <161295335978.6673.9313077497176923458@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] intel_gpu_top: Aggregate clients by
 PID by default
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

Quoting Tvrtko Ursulin (2021-02-10 09:37:55)
> +static struct clients *aggregated_clients(struct clients *clients)
> +{
> +       struct client *ac, *c, *cp = NULL;
> +       struct clients *aggregated;
> +       int tmp, num = 0;
> +
> +       /* Sort by pid first to make it easy to aggregate while walking. */
> +       sort_clients(clients, client_pid_cmp);

You could eliminate this tiny bit of duplication by always calling
aggregated_clients() and returning here for !aggregate_pids.

> +       aggregated = calloc(1, sizeof(*clients));
> +       assert(aggregated);
> +
> +       ac = calloc(clients->num_clients, sizeof(*c));
> +       assert(ac);
> +
> +       aggregated->num_classes = clients->num_classes;
> +       aggregated->class = clients->class;
> +       aggregated->client = ac;
> +
> +       for_each_client(clients, c, tmp) {
> +               unsigned int i;
> +
> +               if (c->status == FREE)
> +                       break;
> +
> +               assert(c->status == ALIVE);
> +
> +               if ((cp && c->pid != cp->pid) || !cp) {
> +                       ac = &aggregated->client[num];
> +
> +                       /* New pid. */
> +                       ac->clients = aggregated;
> +                       ac->status = ALIVE;
> +                       ac->id = ++num;
> +                       ac->pid = c->pid;
> +                       strcpy(ac->name, c->name);
> +                       strcpy(ac->print_name, c->print_name);
> +                       ac->engines = c->engines;
> +                       ac->val = calloc(clients->num_classes,
> +                                        sizeof(ac->val[0]));
> +                       assert(ac->val);
> +                       ac->samples = 1;
> +               }
> +
> +               cp = c;
> +
> +               if (c->samples < 2)
> +                       continue;
> +
> +               ac->samples = 2; /* All what matters for display. */
> +               ac->total_runtime += c->total_runtime;
> +               ac->last_runtime += c->last_runtime;
> +
> +               for (i = 0; i < clients->num_classes; i++)
> +                       ac->val[i] += c->val[i];
> +       }
> +
> +       aggregated->num_clients = num;
> +       aggregated->active_clients = num;
> +
> +       return sort_clients(aggregated, client_cmp);
>  }

Ok, that works very well. Hmm. The sort order does seem a little jumpy
though. May I suggest ac->id = -c->pid; instead of num;
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
