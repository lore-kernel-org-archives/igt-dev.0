Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20210126130505.2938391-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <331b98b3-8ff8-5f58-6994-4561cb0ca244@linux.intel.com>
Date: Tue, 26 Jan 2021 16:33:31 +0000
MIME-Version: 1.0
In-Reply-To: <20210126130505.2938391-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 1/2] i915/sysfs_client:
 Ignore clients being closed as we read their sysfs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 26/01/2021 13:05, Chris Wilson wrote:
> An earlier client from an old test may still be lingering and disappear
> as we scan the sysfs. Be graceful and let it go without tripping over it.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   tests/i915/sysfs_clients.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/i915/sysfs_clients.c b/tests/i915/sysfs_clients.c
> index 6be52c04f..a3a1f81e1 100644
> --- a/tests/i915/sysfs_clients.c
> +++ b/tests/i915/sysfs_clients.c
> @@ -62,11 +62,13 @@
>   
>   static void strterm(char *s, int len)
>   {
> -	igt_assert(len > 0);
> -
> -	s[len] = '\0';
> -	if (s[len - 1] == '\n')
> -		s[len - 1] = '\0';
> +	if (len < 0) {
> +		*s = '\0';
> +	} else {
> +		s[len] = '\0';
> +		if (s[len - 1] == '\n')
> +			s[len - 1] = '\0';
> +	}
>   }
>   
>   static void pidname(int i915, int clients)
> @@ -78,7 +80,6 @@ static void pidname(int i915, int clients)
>   	long count;
>   	pid_t pid;
>   	DIR *dir;
> -	int len;
>   
>   	dir = fdopendir(dup(clients));
>   	igt_assert(dir);
> @@ -90,13 +91,11 @@ static void pidname(int i915, int clients)
>   			continue;
>   
>   		snprintf(buf, sizeof(buf), "%s/name", de->d_name);
> -		len = igt_sysfs_read(clients, buf, buf, sizeof(buf) - 1);
> -		igt_assert_f(len > 0, "failed to open '%s/name'\n", de->d_name);
> -		strterm(buf, len);
> +		strterm(buf, igt_sysfs_read(clients, buf, buf, sizeof(buf) - 1));
>   		igt_debug("%s: %s\n", de->d_name, buf);
>   
>   		/* Ignore closed clients created by drm_driver_open() */
> -		if (*buf == '<')
> +		if (*buf == '\0' || *buf == '<')
>   			continue;
>   
>   		close(me);
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
