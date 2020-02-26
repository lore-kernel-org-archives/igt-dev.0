Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403256E291
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2020 12:48:10 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200226054634.6611-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20200226054634.6611-1-bhanuprakash.modem@intel.com>
Message-ID: <158272128487.2462.16646110850325580560@skylake-alporthouse-com>
Date: Wed, 26 Feb 2020 12:48:04 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_lut_handle: Minor fixes
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
To: bhanuprakash.modem@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting bhanuprakash.modem@intel.com (2020-02-26 05:46:34)
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> Remove redundent logics.
> After exec, destroy BO properly.
> Remove unnecessary & unused macros.
> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/i915/gem_lut_handle.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/i915/gem_lut_handle.c b/tests/i915/gem_lut_handle.c
> index fec65dd8..367d8bdf 100644
> --- a/tests/i915/gem_lut_handle.c
> +++ b/tests/i915/gem_lut_handle.c
> @@ -41,10 +41,6 @@
>  IGT_TEST_DESCRIPTION("Exercises the basic execbuffer using the handle LUT"
>                      " interface.");
>  
> -#define BATCH_SIZE             (1024*1024)
> -
> -#define LOCAL_I915_EXEC_HANDLE_LUT (1<<12)
> -
>  #define NORMAL 0
>  #define USE_LUT 0x1
>  #define BROKEN 0x2
> @@ -80,7 +76,7 @@ static int exec(int fd, uint32_t handle, unsigned int flags)
>         execbuf.num_cliprects = 0;
>         execbuf.DR1 = 0;
>         execbuf.DR4 = 0;
> -       execbuf.flags = flags & USE_LUT ? LOCAL_I915_EXEC_HANDLE_LUT : 0;
> +       execbuf.flags = flags & USE_LUT ? I915_EXEC_HANDLE_LUT : 0;
>         i915_execbuffer2_set_context_id(execbuf, 0);
>         execbuf.rsvd2 = 0;
>  
> @@ -147,7 +143,7 @@ static int many_exec(int fd, uint32_t batch, int num_exec, int num_reloc, unsign
>         execbuf.num_cliprects = 0;
>         execbuf.DR1 = 0;
>         execbuf.DR4 = 0;
> -       execbuf.flags = flags & USE_LUT ? LOCAL_I915_EXEC_HANDLE_LUT : 0;
> +       execbuf.flags = flags & USE_LUT ? I915_EXEC_HANDLE_LUT : 0;
>         i915_execbuffer2_set_context_id(execbuf, 0);
>         execbuf.rsvd2 = 0;
>  
> @@ -180,8 +176,6 @@ igt_simple_main
>         fail(exec(fd, handle, BROKEN));
>  
>         igt_skip_on(exec(fd, handle, USE_LUT));
> -
> -       do_or_die(exec(fd, handle, USE_LUT));

You never know, might be significant. And no harm so I'd leave and just
do a simple patch that removes the LOCAL define.

>         fail(exec(fd, handle, USE_LUT | BROKEN));
>  
>         for (i = 2; i <= SLOW_QUICK(65536, 8); i *= 2) {
> @@ -228,4 +222,6 @@ igt_simple_main
>                 fail(many_exec(fd, handle, i+1, i, USE_LUT | BROKEN));
>                 fail(many_exec(fd, handle, i+1, i+1, USE_LUT | BROKEN));
>         }
> +
> +       gem_close(fd, handle);

But we don't close the fd either. The point of the exercise was to leave
it all for process termination.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
