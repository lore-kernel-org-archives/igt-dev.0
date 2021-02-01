Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20210131031153.3399123-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <577e01ed-a463-301f-8fc8-c553c0b46ba7@linux.intel.com>
Date: Mon, 1 Feb 2021 08:14:45 +0000
MIME-Version: 1.0
In-Reply-To: <20210131031153.3399123-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] intel_gpu_top: Hide unused clients
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 31/01/2021 03:11, Chris Wilson wrote:
> Keep new clients hidden until they utilise the GPU.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> ---
>   tools/intel_gpu_top.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 60ff62d28..66a8effa6 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -828,8 +828,11 @@ static void update_client(struct client *c, unsigned int pid, char *name)
>   		c->last[i] = val[i];
>   	}
>   
> -	c->samples++;
> +	if (!c->total_runtime)
> +		return;
> +
>   	c->status = ALIVE;
> +	c->samples++;
>   }
>   
>   static void
> 

Not sure we need to do it at this level and not instead at presentation 
time. Plus, in default sort mode they would be at the end of the list, 
so behind the more active clients. Or you go into sort by id and they 
annoy you there?

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
