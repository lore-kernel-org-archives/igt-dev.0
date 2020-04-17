Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940D36EB8F
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 11:02:49 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200417105839.12084-1-arjun.melkaveri@intel.com>
References: <20200417105839.12084-1-arjun.melkaveri@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158712136549.5570.10867694637215979183@build.alporthouse.com>
Date: Fri, 17 Apr 2020 12:02:45 +0100
Subject: Re: [igt-dev] [PATCH] [PATCH
 i-g-t]tests/i915/gem_exec_balancer:Resolving unpredictable tasklet delays
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

Quoting Arjun Melkaveri (2020-04-17 11:58:39)
> Increased the Sampling window to help with sporadic test failures
> due to unpredicted tasklet delays.

Then make them predictable. And be sure to add a test to fail if the
execution is delayed.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
