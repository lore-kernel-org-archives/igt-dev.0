Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6E36E4F4
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2020 16:49:17 +0000 (UTC)
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Date: Tue, 14 Apr 2020 16:49:11 +0000
Message-ID: <CA3CE573A55781488FA37084931071AB14DF1134@BGSMSX105.gar.corp.intel.com>
References: <20200414164016.13205-1-arjun.melkaveri@intel.com>
 <158688278323.24667.1646908913212992977@build.alporthouse.com>
In-Reply-To: <158688278323.24667.1646908913212992977@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t][V6]tests/i915/gem_sync.c :Added
 __for_each_physical_engine to utilize all available
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



Thanks 
Arjun M

-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: Tuesday, April 14, 2020 10:16 PM
To: Melkaveri, Arjun <arjun.melkaveri@intel.com>; igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t][V6]tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available

Quoting Arjun Melkaveri (2020-04-14 17:40:16)
>  static void
>  sync_ring(int fd, unsigned ring, int num_children, int timeout)  {
> +       const struct intel_execution_engine2 *e2;
>         unsigned engines[16];
>         const char *names[16];
>         int num_engines = 0;
>  
>         if (ring == ALL_ENGINES) {
> -               for_each_physical_engine(e, fd) {
> -                       names[num_engines] = e->name;
> -                       engines[num_engines++] = eb_ring(e);
> +               __for_each_physical_engine(fd, e2) {
> +                       names[num_engines] = e2->name;

This doesn't work. e2->name is on the stack and so goes out of scope after the loop.

Will re verify this .

> +                       engines[num_engines++] = e2->flags;
>                         if (num_engines == ARRAY_SIZE(engines))
>                                 break;
>                 }
>  
>                 num_children *= num_engines;
>         } else {
> -               gem_require_ring(fd, ring);
> +               igt_require(gem_can_store_dword(fd, ring));

I was correcting this one . apologies 

Pardon????
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
