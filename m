Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84E689E08
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2020 09:30:56 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200629092107.10664-5-dominik.grzegorzek@intel.com>
References: <20200629092107.10664-1-dominik.grzegorzek@intel.com>
 <20200629092107.10664-5-dominik.grzegorzek@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 29 Jun 2020 10:30:52 +0100
Message-ID: <159342305209.14343.661462065811774229@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] i915/gem_hang: Remove libdrm
 dependency
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dominik Grzegorzek (2020-06-29 10:21:06)
> Libdrm removal from gem_hang using intel_bb.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_hang.c | 35 ++++++++++++++---------------------
>  1 file changed, 14 insertions(+), 21 deletions(-)

Even better, just git rm. It's not correct for more recent gen, and
redundant with the hangcheck checks.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
