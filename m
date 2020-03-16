Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577D16E550
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 23:12:03 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200316161132.29833-3-lyude@redhat.com>
References: <20200316161132.29833-1-lyude@redhat.com>
 <20200316161132.29833-3-lyude@redhat.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158440031930.29860.2490189767858111427@build.alporthouse.com>
Date: Mon, 16 Mar 2020 23:11:59 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/rendercopy_gen*: Make
 cc/viewport static
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
To: Lyude <lyude@redhat.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lyude (2020-03-16 16:11:30)
> From: Lyude Paul <lyude@redhat.com>
> 
> Since both rendercopy_gen8.c and rendercopy_gen9.c declare cc/viewport
> variables without marking them as static, -fcommon also causes these to
> make our builds fail:
> 
> /usr/bin/ld:
> lib/libigt-rendercopy_gen9_c.a(rendercopy_gen9.c.o):lib/rendercopy_gen9.c:46:
> multiple definition of `cc';
> lib/libigt-rendercopy_gen8_c.a(rendercopy_gen8.c.o):lib/rendercopy_gen8.c:45:
> first defined here
> /usr/bin/ld:
> lib/libigt-rendercopy_gen9_c.a(rendercopy_gen9.c.o):lib/rendercopy_gen9.c:51:
> multiple definition of `viewport';
> lib/libigt-rendercopy_gen8_c.a(rendercopy_gen8.c.o):lib/rendercopy_gen8.c:50:
> first defined here
> 
> So, fix this by marking them as static.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
