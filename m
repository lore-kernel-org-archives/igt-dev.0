Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1559310E30F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 16:48:18 +0000 (UTC)
Date: Tue, 27 Jun 2023 16:47:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZJsSmbU/W+HhMT/h@DUT025-TGLU.fm.intel.com>
References: <20230627161407.344961-1-zbigniew.kempczynski@intel.com>
 <20230627161407.344961-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230627161407.344961-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/xe_query: Add milliseconds to
 nanoseconds macro
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 27, 2023 at 06:14:06PM +0200, Zbigniew Kempczyński wrote:
> We're going to change xe uapi to use nanoseconds so all tests which
> currently are passing jiffies have to be altered.
> 
> Add MS_TO_NS() macro to make this work easier.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  lib/xe/xe_query.h       | 2 ++
>  tests/xe/xe_waitfence.c | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 943ca558a5..cca2c9aae5 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -99,4 +99,6 @@ bool xe_has_engine_class(int fd, uint16_t engine_class);
>  struct xe_device *xe_device_get(int fd);
>  void xe_device_put(int fd);
>  
> +#define MS_TO_NS(ms) (((int64_t)ms) * 1000000)
> +
>  #endif	/* XE_QUERY_H */
> diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
> index c6b2db125c..7763a556c7 100644
> --- a/tests/xe/xe_waitfence.c
> +++ b/tests/xe/xe_waitfence.c
> @@ -38,7 +38,6 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>  	xe_vm_bind(fd, vm, bo, offset, addr, size, sync, 1);
>  }
>  
> -#define MS_TO_NS(ms) (((int64_t)ms) * 1000000)
>  enum waittype {
>  	RELTIME,
>  	ABSTIME,
> -- 
> 2.34.1
> 
