Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 20 Apr 2020 12:29:10 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200420092910.GW9497@platvala-desk.ger.corp.intel.com>
References: <20200417211025.109574-1-lyude@redhat.com>
 <20200417211025.109574-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417211025.109574-2-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/5] lib/igt_core: Fix
 igt_assert_fd() documentation
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

On Fri, Apr 17, 2020 at 05:10:21PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> As Petri Latvala pointed out, some of the documentation in this macro is
> mistakenly copied from the other igt_assert*() macros. Let's fix that.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  lib/igt_core.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index b97fa2fa..3f69b072 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -966,8 +966,8 @@ void igt_describe_f(const char *fmt, ...);
>   *
>   * Fails (sub-) test if the given file descriptor is invalid.
>   *
> - * Like igt_assert(), but displays the values being compared on failure instead
> - * of simply printing the stringified expression.
> + * Like igt_assert(), but displays the stringified identifier that was supposed
> + * to contain a valid fd on failure.


For some values of "like" this is like igt_assert, but for some it's
not. I don't have enough coffee to suggest a better wording though.


Reviewed-by: Petri Latvala <petri.latvala@intel.com>


>   */
>  #define igt_assert_fd(fd) \
>  	igt_assert_f(fd >= 0, "file descriptor " #fd " failed\n");
> -- 
> 2.25.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
