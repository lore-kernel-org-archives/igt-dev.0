Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 18 Mar 2021 11:32:54 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YFMeRtiiVQsN8pBC@platvala-desk.ger.corp.intel.com>
References: <20210317224949.448284-1-lyude@redhat.com>
 <20210317224949.448284-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317224949.448284-2-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/7] lib/drmtest: Use igt_assert_eq()
 for do_or_die()
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 06:49:43PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Noticed this while working on some nouveau tests, if we use igt_assert_eq()
> here we'll output both the expected and returned value instead of just the
> expected value.

igt_assert_eq stuffs x into an int so there's one difference.

Hmm, but generally do_or_die is used with ioctl() or something that
wraps it and it will be an int.


> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> ---
>  lib/drmtest.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index d393dbf1..789452ea 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -113,7 +113,7 @@ bool is_vc4_device(int fd);
>   * that in any failure case the return value is non-zero and a precise error is
>   * logged into errno. Uses igt_assert() internally.

A minor cosmetic change to this comment (igt_assert usage) is welcome.



Reviewed-by: Petri Latvala <petri.latvala@intel.com>


>   */
> -#define do_or_die(x) igt_assert((x) == 0)
> +#define do_or_die(x) igt_assert_eq((x), 0)
>  
>  /**
>   * do_ioctl:
> -- 
> 2.29.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
