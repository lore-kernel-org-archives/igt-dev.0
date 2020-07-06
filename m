Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCACD89BAF
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2020 08:53:18 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200630232337.20135-1-ranjeet1.kumar@intel.com>
References: <20200630232337.20135-1-ranjeet1.kumar@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 06 Jul 2020 09:53:08 +0100
Message-ID: <159402558827.7245.8917311048243066923@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t]
 i915/gem_pipe_control_store_loop: added description for test case
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
To: igt-dev@lists.freedesktop.org, ranjeet1.kumar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting ranjeet1.kumar@intel.com (2020-07-01 00:23:37)
> From: Ranjeet kumar <ranjeet1.kumar@intel.com>
> 
> Added test description for subtest.
> 
> Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
> Signed-off-by: Ranjeet kumar <ranjeet1.kumar@intel.com>
> ---
>  tests/i915/gem_pipe_control_store_loop.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
> index e44e9fb53..a9ff66895 100644
> --- a/tests/i915/gem_pipe_control_store_loop.c
> +++ b/tests/i915/gem_pipe_control_store_loop.c
> @@ -181,9 +181,12 @@ igt_main
>                 igt_assert(batch);
>         }
>  
> +       igt_describe("Creates new buffer each time, emit commands and send it to ring"
> +                    " for execution.")

i++; /* post increments i by one, returns the old value */

>         igt_subtest("fresh-buffer")
>                 store_pipe_control_loop(false, 2);

That is less valuable than a link to the code.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
