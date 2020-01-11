Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9826E218
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Jan 2020 08:40:36 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <037121df1ee6fcf1fa92ea4a7fb6ba31b39e80ac.1578720512.git.ashutosh.dixit@intel.com>
In-Reply-To: <037121df1ee6fcf1fa92ea4a7fb6ba31b39e80ac.1578720512.git.ashutosh.dixit@intel.com>
Message-ID: <157873203237.10140.3028418209581696626@skylake-alporthouse-com>
Date: Sat, 11 Jan 2020 08:40:32 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915/gem_mman: Prioritize GTT
 mappings over WC
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

Quoting Ashutosh Dixit (2020-01-11 05:36:52)
> In order to preserve legacy behavior for devices with a mappable
> aperture try a GTT mapping first. Use a WC mapping only for devices
> without a mappable aperture.

No...? It's just historical legacy from before we even had WC available.
Since we've had WC for basic mmappings, we prefer WC since it is not as
scarce and as precious a resource. (Not that it matters for most tests
since GTT thrashing in basic igt is unheard of!)
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
