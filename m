Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8E56F890
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 21:49:57 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200129214116.29107-1-vinay.belgaumkar@intel.com>
References: <20200129214116.29107-1-vinay.belgaumkar@intel.com>
Message-ID: <158033457983.13511.6497682933202043684@skylake-alporthouse-com>
Date: Wed, 29 Jan 2020 21:49:39 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_largeobject: Skip when
 aperture is not supported
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
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>, igt-dev@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Vinay Belgaumkar (2020-01-29 21:41:16)
> Rearrange code to allocate buffer after aperture check.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Antonio Argenziano <antonio.argenziano@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  tests/i915/gem_largeobject.c | 5 +++--

git rm

I don't see much value here. We have bigger objects about the place, so
this serves as a simple stick in mud as "here is a large object not
being particularly stressed". Such canaries can be useful, but this
didn't even make the cut for BAT.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
