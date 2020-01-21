Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748196ECC0
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 12:40:41 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200121123120.27148-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200121123120.27148-1-arjun.melkaveri@intel.com>
Message-ID: <157961043554.3096.4464531165987455648@skylake-alporthouse-com>
Date: Tue, 21 Jan 2020 12:40:35 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_nop:Adjusted test to
 utilize all available engines
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

Quoting Arjun Melkaveri (2020-01-21 12:31:20)
> Added __for_each_physical_engine to utilize all available engines.
> Moved single, signal, preempt, poll and headless test cases
> from static to dynamic group.

But doesn't this prevent us from exercising the legacy ABI?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
