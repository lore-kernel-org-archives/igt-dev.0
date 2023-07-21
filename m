Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5E110E653
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jul 2023 10:52:59 +0000 (UTC)
Date: Fri, 21 Jul 2023 12:52:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230721105254.6o36ubdr2fnklkhv@zkempczy-mobl2>
References: <20230612172310.30117-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230612172310.30117-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Make igt_while_interruptible()
 thread-safe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 07:23:10PM +0200, Kamil Konieczny wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> We have the ability to replace the ioctl() call by a wrapper that
> performs signal injection (triggering the ioctl to return -EINTR). This
> uses a global for handling the signal, which is broken if the test tries
> to mixing SIGINT injection and threads. Switch to a thread-local
> sigaction.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I had to experiment with this code to understand what's on the hood.
And yes, for threads sharing __igt_sigiter + igt_ioctl is problematic.
So for change to tls:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/igt_aux.c        | 2 +-
>  lib/ioctl_wrappers.c | 2 +-
>  lib/ioctl_wrappers.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 386e25783..adff1a11d 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -93,7 +93,7 @@
>   * fit into any other topic.
>   */
>  
> -static struct __igt_sigiter_global {
> +static __thread struct __igt_sigiter_global {
>  	pid_t tid;
>  	timer_t timer;
>  	struct timespec offset;
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index ebd8a2f36..146973f0d 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -89,7 +89,7 @@
>   * distinguish them.
>   */
>  
> -int (*igt_ioctl)(int fd, unsigned long request, void *arg) = drmIoctl;
> +__thread int (*igt_ioctl)(int fd, unsigned long request, void *arg) = drmIoctl;
>  
>  
>  static int
> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> index 4c232078d..b7d7c2ad9 100644
> --- a/lib/ioctl_wrappers.h
> +++ b/lib/ioctl_wrappers.h
> @@ -48,7 +48,7 @@
>   * This is a wrapper around drmIoctl(), which can be augmented with special code
>   * blocks like #igt_while_interruptible.
>   */
> -extern int (*igt_ioctl)(int fd, unsigned long request, void *arg);
> +extern __thread int (*igt_ioctl)(int fd, unsigned long request, void *arg);
>  
>  /* ioctl_wrappers.c:
>   *
> -- 
> 2.39.2
> 
