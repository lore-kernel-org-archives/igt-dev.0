Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247FB6E837
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 14:24:30 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200331114746.81898-1-lionel.g.landwerlin@intel.com>
References: <20200331114746.81898-1-lionel.g.landwerlin@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158566466722.5852.13316064706500516988@build.alporthouse.com>
Date: Tue, 31 Mar 2020 15:24:27 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: add tests for triggered OA
 reports
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-03-31 12:47:46)
> By whitelisting a couple of registers we can allow an application

By whitelisting, through the i915_perf interface, a couple of...

I was looking for how you found a way to set RING_NONPRIV. :)

> batch to trigger OA reports in the OA buffer by switching back & forth
> an inverter on the condition logic.

Test looks reasonable, but the specific mechanics of OA I can't comment
on.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
