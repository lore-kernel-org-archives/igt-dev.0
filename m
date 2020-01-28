Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042856EE1A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 12:24:34 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200128120849.24015-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200128120849.24015-1-arjun.melkaveri@intel.com>
Message-ID: <158021427043.2129.1023440030917732997@skylake-alporthouse-com>
Date: Tue, 28 Jan 2020 12:24:30 +0000
Subject: Re: [igt-dev] [PATCH V5] i915/gem_exec_nop:Adjusted test to utilize
 all available engines
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Arjun Melkaveri (2020-01-28 12:08:49)
> @@ -621,10 +626,7 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
>         igt_require(__gem_execbuf(fd, &execbuf) == 0);
>  
>         if (flags & CONTEXT) {
> -               uint32_t id;
> -
> -               igt_require(__gem_context_create(fd, &id) == 0);
> -               execbuf.rsvd1 = id;
> +               execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);

So where's the skip for machines without context support?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
