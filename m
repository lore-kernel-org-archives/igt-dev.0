Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A4A6E9DD
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 10:22:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200217145042.829-1-petri.latvala@intel.com>
References: <20200217145042.829-1-petri.latvala@intel.com>
Message-ID: <158202130355.3043.17216954982795045075@skylake-alporthouse-com>
Date: Tue, 18 Feb 2020 10:21:43 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] runner: Refactor timeouting
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-02-17 14:50:41)
> Instead of aiming for inactivity_timeout and splitting that into
> suitable intervals for watchdog pinging, replace the whole logic with
> one-second select() timeouts and checking if we're reaching a timeout
> condition based on current time and the time passed since a particular
> event, be it the last activity or the time of signaling the child
> processes.
> 
> With the refactoring, we gain a couple of new features for free:
> 
> - use-watchdog now makes sense even without
> inactivity-timeout. Previously use-watchdog was silently ignored if
> inactivity-timeout was not set. Now, watchdogs will be used always if
> configured so, effectively ensuring the device gets rebooted if
> userspace dies without other timeout tracking.
> 
> - Killing tests early on kernel taint now happens even
> earlier. Previously on an inactive system we possibly waited for some
> tens of seconds before checking kernel taints.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
