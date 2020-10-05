Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38C489686
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2020 13:42:04 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200909083125.2057105-1-apoorva1.singh@intel.com>
References: <20200909083125.2057105-1-apoorva1.singh@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 05 Oct 2020 14:42:00 +0100
Message-ID: <160190532058.1293.12044143043111796844@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_mmap_wc: Align subtests with
 correct function calls
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
To: apoorva1.singh@intel.com, arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting apoorva1.singh@intel.com (2020-09-09 09:31:25)
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> - Fix the name of subtest "write-gtt-read-gtt"
> - Fix subtests "write-wc-read-gtt" and "write-gtt-read-gtt"
> to call correct fucntions
> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> ---
>  tests/i915/gem_mmap_wc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
> index f44b406d..c940376a 100644
> --- a/tests/i915/gem_mmap_wc.c
> +++ b/tests/i915/gem_mmap_wc.c
> @@ -329,7 +329,7 @@ test_write_cpu_read_wc(int fd, int force_domain)
>  }
>  
>  static void
> -test_write_gtt_read_wc(int fd)
> +test_write_wc_read_gtt(int fd)
>  {
>         uint32_t handle;
>         uint32_t *src, *dst;
> @@ -350,7 +350,7 @@ test_write_gtt_read_wc(int fd)
>  }
>  
>  static void
> -test_write_wc_read_gtt(int fd)
> +test_write_gtt_read_wc(int fd)

Bleugh; probably better to also not call them src/dst.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
