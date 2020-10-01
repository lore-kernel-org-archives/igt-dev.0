Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 1 Oct 2020 09:49:26 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201001064926.GA7444@platvala-desk.ger.corp.intel.com>
References: <20200930173150.431995-1-lyude@redhat.com>
 <20200930173150.431995-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930173150.431995-2-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 1/5] lib/igt_core: Fix
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

On Wed, Sep 30, 2020 at 01:31:46PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> As Petri Latvala pointed out, some of the documentation in this macro is
> mistakenly copied from the other igt_assert*() macros. Let's fix that.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/igt_core.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index c5871520..e74ede8b 100644
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
>   */
>  #define igt_assert_fd(fd) \
>  	igt_assert_f(fd >= 0, "file descriptor " #fd " failed\n");
> -- 
> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
