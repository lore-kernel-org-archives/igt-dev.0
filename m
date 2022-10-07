Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FBA10E02A
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 10:53:14 +0000 (UTC)
Date: Fri, 7 Oct 2022 12:53:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0AFFiqdmtKAldjq@kamilkon-desk1>
References: <20221007040717.2924978-1-jfree@freebsd.org>
 <20221007040717.2924978-4-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221007040717.2924978-4-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t 04/10] Include <sys/syscall.h> for
 FreeBSD systems
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>,
 Jake Freeland <jake@technologyfriends.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jake,

On 2022-10-06 at 23:07:12 -0500, Jake Freeland wrote:

please put commit message here.

With that fixed you can add my r-b,

Regards,
Kamil

> Signed-off-by: Jake Freeland <jfree@freebsd.org>
> ---
>  lib/igt_aux.h  | 2 +-
>  lib/igt_core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index c8d487b6..c98cf28f 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -34,7 +34,7 @@
>  #include <sys/time.h>
>  #include <sys/types.h>
>  #include <unistd.h>
> -#ifdef __linux__
> +#if defined(__linux__) || defined(__FreeBSD__)
>  # include <sys/syscall.h>
>  #endif
>  
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 2aee0d08..aad7b6d8 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -43,7 +43,7 @@
>  #include <unistd.h>
>  #include <sys/wait.h>
>  #include <sys/types.h>
> -#ifdef __linux__
> +#if defined(__linux__) || defined(__FreeBSD__)
>  #include <sys/syscall.h>
>  #endif
>  #include <pthread.h>
> -- 
> 2.37.3
> 
