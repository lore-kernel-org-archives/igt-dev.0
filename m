Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25926E9D0
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2020 20:57:41 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200423165520.26115-1-arjun.melkaveri@intel.com>
References: <20200423165520.26115-1-arjun.melkaveri@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158767545771.27391.11693660291846992437@build.alporthouse.com>
Date: Thu, 23 Apr 2020 21:57:37 +0100
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t][V8]tests/i915/gem_sync.c :Added
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Arjun Melkaveri (2020-04-23 17:55:20)
> +               Iengines = intel_init_engine_list(fd, 0);
> +               for (unsigned int n = 0; n < Iengines.nengines; n++) {
> +                       if (!gem_class_can_store_dword(fd, Iengines.engines->class))

This bug was repeated a few times. Hopefully I fixed it all up and
pushed.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
