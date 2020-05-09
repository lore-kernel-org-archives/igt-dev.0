Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8CE6E15D
 for <igt-dev@lists.freedesktop.org>; Sat,  9 May 2020 08:21:20 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200509002124.3174-1-ashutosh.dixit@intel.com>
References: <20200509002124.3174-1-ashutosh.dixit@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158901247629.20071.16282521785385031553@build.alporthouse.com>
Date: Sat, 09 May 2020 09:21:16 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_spin_batch: Use
 __for_each_physical_engine
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ashutosh Dixit (2020-05-09 01:21:24)
> Instead of the legacy for_each_physical_engine use
> __for_each_physical_engine to utilize all engines.
> 
> Fixes: 57efd81037 ("i915/gem_spin_batch: Add test to execute in parallel on all engines")

Bzzt. Try again.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
