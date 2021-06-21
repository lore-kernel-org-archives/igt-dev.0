Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCCD6E118
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 13:38:02 +0000 (UTC)
Date: Mon, 21 Jun 2021 09:37:51 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
Message-ID: <YNCWL8ECWanyB0eu@maud>
References: <20210621125724.1592104-1-boris.brezillon@collabora.com>
 <20210621125724.1592104-8-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621125724.1592104-8-boris.brezillon@collabora.com>
Subject: Re: [igt-dev] [PATCH 7/7] tests/panfrost: Test FD-close while jobs
 are still in-flight
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
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>, igt-dev@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Robin Murphy <robin.murphy@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

r-b

On Mon, Jun 21, 2021 at 02:57:24PM +0200, Boris Brezillon wrote:
> We had use-after-free faults in the past because the MMU context
> while released while jobs were still in flight, and the job cleanup
> path assumed the context was still present. Add a test to make sure this
> won't happen again.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  tests/panfrost_submit.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/panfrost_submit.c b/tests/panfrost_submit.c
> index aa2c277bbdb6..ef2437d60ab7 100644
> --- a/tests/panfrost_submit.c
> +++ b/tests/panfrost_submit.c
> @@ -159,6 +159,17 @@ igt_main
>                  close(tmpfd);
>          }
>  
> +        igt_subtest("pan-submit-and-close") {
> +                /* We need our own FD because we close it right after the job submission */
> +                int tmpfd = drm_open_driver(DRIVER_PANFROST);
> +                struct panfrost_submit *submit;
> +
> +                submit = igt_panfrost_job_loop(tmpfd);
> +                do_ioctl(tmpfd, DRM_IOCTL_PANFROST_SUBMIT, submit->args);
> +                igt_panfrost_free_job(tmpfd, submit);
> +                close(tmpfd);
> +        }
> +
>          igt_fixture {
>                  close(fd);
>          }
> -- 
> 2.31.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
