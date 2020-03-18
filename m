Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 18 Mar 2020 10:12:18 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200318081218.GI9497@platvala-desk.ger.corp.intel.com>
References: <20200318010047.237024-1-lyude@redhat.com>
 <20200318010047.237024-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318010047.237024-2-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/igt_core: Add igt_require_fd()
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
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 09:00:44PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Like igt_assert_fd(), but using igt_require() instead
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  lib/igt_core.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index fae5f59e..b66336cf 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1008,6 +1008,18 @@ void igt_describe_f(const char *fmt, ...);
>  	else igt_debug("Test requirement passed: %s\n", #expr); \
>  } while (0)
>  
> +/**
> + * igt_require_fd:
> + * @fd: file descriptor
> + *
> + * Skips (sub-) test if the given file descriptor is invalid.
> + *
> + * Like igt_require(), but displays the values being compared on failure instead
> + * of simply printing the stringified expression..

igt_assert_fd has this documentation comment, but that's mistakenly
copypasted from igt_assert_eq and pals. Let's not propagate the
copypaste error further.


-- 
Petri Latvala


> + */
> +#define igt_require_fd(fd) \
> +	igt_require_f(fd >= 0, "file descriptor " #fd " failed\n");
> +
>  /**
>   * igt_skip_on_f:
>   * @expr: condition to test
> -- 
> 2.24.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
