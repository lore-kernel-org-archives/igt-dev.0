Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20210122115524.768221-1-tvrtko.ursulin@linux.intel.com>
References: <20210121181005.762333-1-tvrtko.ursulin@linux.intel.com>
 <20210122115524.768221-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 22 Jan 2021 12:21:48 +0000
Message-ID: <161131810827.3166.459822587758052982@build.alporthouse.com>
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
> +static void update_client(struct client *c, unsigned int pid, char *name)
> +{
> +       uint64_t val[c->clients->num_classes];
> +       unsigned int i;
> +
> +       if (c->pid != pid)
> +               c->pid = pid;
> +
> +       if (strcmp(c->name, name)) {
> +               char *p;
> +
> +               strncpy(c->name, name, sizeof(c->name) - 1);
> +               strncpy(c->print_name, name, sizeof(c->print_name) - 1);
> +
> +               p = c->print_name;
> +               while (*p) {
> +                       if (!isprint(*p))
> +                               *p = '*';
> +                       p++;
> +               };

Stray ';'

Probably worth adding a TODO for utf8 validation. But for now this stops
the terminal from being screwed with.

Nothing else jumped out at me so,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
