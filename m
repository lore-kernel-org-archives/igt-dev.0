Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696926EA4C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 08:37:31 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200127083203.29056-1-ramalingam.c@intel.com>
References: <20200127083203.29056-1-ramalingam.c@intel.com>
Message-ID: <158011423510.25356.17259103434058240922@skylake-alporthouse-com>
Date: Mon, 27 Jan 2020 08:37:15 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/dumb_buffer: Remove page
 nonaligned buffer tests
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
To: Ramalingam C <ramalingam.c@intel.com>, igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ramalingam C (2020-01-27 08:32:03)
> Considering that kernel returns the real memory size(page aligned)
> allocated, nonaligned buffer tests are not valid anymore. Hence removing
> them.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Chris Wilson <chris@chris-wilson.co.uk>

Just because they work is not necessary a good reason to scrap them :)
But since these are most definitely based on i915 assumptions,

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
