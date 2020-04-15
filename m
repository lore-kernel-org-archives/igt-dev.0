Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCB26E970
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2020 11:19:07 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200415110625.24509-1-petri.latvala@intel.com>
References: <20200415110625.24509-1-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158694953408.24667.3961411603603969905@build.alporthouse.com>
Date: Wed, 15 Apr 2020 12:18:54 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] gem_wait/gem_busy: Make the "all"
 variant a normal subtest
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-04-15 12:06:25)
> While dynamic subtests are kind of testlistable, the support for them
> is dark and full of terrors. Cornercases like resuming or
> multiple-mode are not quite fully specified and can lead to surprises
> later.
> 
> The subtests in question don't carry any context so conversion to
> normal subtests is straightforward.

I liked it! :(
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
