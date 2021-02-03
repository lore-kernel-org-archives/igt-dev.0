Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20210203114456.895974-2-tvrtko.ursulin@linux.intel.com>
References: <20210203114456.895974-1-tvrtko.ursulin@linux.intel.com>
 <20210203114456.895974-2-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 03 Feb 2021 11:50:28 +0000
Message-ID: <161235302859.6538.4103964959763076071@build.alporthouse.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/2] intel_gpu_top: Add
 option to sort by PID
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

Quoting Tvrtko Ursulin (2021-02-03 11:44:56)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Useful to mimick top view.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  man/intel_gpu_top.rst |  2 +-
>  tools/intel_gpu_top.c | 46 +++++++++++++++++++++++++++++++------------
>  2 files changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
> index 118d8b953a70..b145d85c0440 100644
> --- a/man/intel_gpu_top.rst
> +++ b/man/intel_gpu_top.rst
> @@ -56,7 +56,7 @@ Supported keys:
>      'q'    Exit from the tool.
>      '1'    Toggle between aggregated engine class and physical engine mode.
>      'n'    Toggle display of numeric client busyness overlay.
> -    's'    Toggle between sort modes (runtime, total runtime, client id).
> +    's'    Toggle between sort modes (runtime, total runtime, pid, client id).
>      'i'    Toggle display of clients which used no GPU time.
>  
>  DEVICE SELECTION
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index b409106f3718..24a87d2f4f3f 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -959,6 +959,24 @@ static int client_id_cmp(const void *_a, const void *_b)
>         return (int)b->id - a->id;
>  }
>  
> +static int client_pid_cmp(const void *_a, const void *_b)
> +{
> +       const struct client *a = _a;
> +       const struct client *b = _b;
> +       int pid_a, pid_b;
> +
> +       pid_a = a->status == ALIVE ? a->pid : INT_MAX;
> +       pid_b = b->status == ALIVE ? b->pid : INT_MAX;
> +
> +       pid_b -= pid_a;
> +       if (pid_b > 0)
> +               return -1;
> +       if (pid_b < 0)
> +               return 1;
> +
> +       return (int)a->id - b->id;
> +}
> +
>  static int (*client_cmp)(const void *, const void *) = client_last_cmp;
>  
>  static void sort_clients(struct clients *clients)
> @@ -2149,21 +2167,23 @@ static void interactive_stdin(void)
>  
>  static void select_client_sort(void)
>  {
> +       struct {
> +               int (*cmp)(const void *, const void *);
> +               const char *msg;
> +       } cmp[] = {
> +               { client_last_cmp, "Sorting clients by current GPU usage." },
> +               { client_total_cmp, "Sorting clients by accummulated GPU usage." },
> +               { client_pid_cmp, "Sorting clients by pid." },
> +               { client_id_cmp, "Sorting clients by sysfs id." },
> +       };
>         static unsigned int client_sort;
>  
> -       switch (++client_sort % 3) {
> -       case 0:
> -               client_cmp = client_last_cmp;
> -               header_msg = "Sorting clients by current GPU usage.";
> -               break;
> -       case 1:
> -               client_cmp = client_total_cmp;
> -               header_msg = "Sorting clients by accummulated GPU usage.";
> -               break;
> -       case 2:
> -               client_cmp = client_id_cmp;
> -               header_msg = "Sorting clients by sysfs id.";
> -       }
> +       ++client_sort;
> +       if (client_sort >= ARRAY_SIZE(cmp))
> +               client_sort = 0;
> +
> +       client_cmp = cmp[client_sort].cmp;
> +       header_msg = cmp[client_sort].msg;
>  }

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
