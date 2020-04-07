Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C2F6E923
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 22:23:03 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200407220435.217727-1-andi@etezian.org>
References: <20200407220435.217727-1-andi@etezian.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158629817980.15078.16359961228648249395@build.alporthouse.com>
Date: Tue, 07 Apr 2020 23:22:59 +0100
Subject: Re: [igt-dev] [PATCH] tests/i915_pm_sseu: remove broken test
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
To: Andi Shyti <andi@etezian.org>, Intel IGT <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Andi Shyti (2020-04-07 23:04:35)
> From: Andi Shyti <andi.shyti@intel.com>
> 
> the i915_pm_sseu test is disabled by default and anyway basked on
> a broken debugfs interface on its way to be removed.
> 
> Remove it.

The plan was to replace it with a selftest, but that never materialised
and can be offloaded to anyone looking to do dynamic sseu.
 
> Signed-off-by: Andi Shyti <andi.shyti@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Throw in a Closes: so that gitlab can automatically close the associated
bugs.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
