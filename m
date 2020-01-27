Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92436EB2E
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 11:23:22 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200127110431.30712-1-ramalingam.c@intel.com>
References: <20200127110431.30712-1-ramalingam.c@intel.com>
Message-ID: <158012418532.25356.7697959714402670112@skylake-alporthouse-com>
Date: Mon, 27 Jan 2020 11:23:05 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_create: Modify the page
 nonaligned tests
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

Quoting Ramalingam C (2020-01-27 11:04:31)
> Considering that kernel returns the real memory size(page aligned)
> allocated, "create-invalid-nonaligned" test is not needed anymore.
> Hence removing them.
> 
> At "create-valid-nonaligned" test we are asserting the returned mem size
> from kernel to be minimum page aligned and checking the write into padded
> memory.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
