Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541E86E9DD
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 10:24:20 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200217145042.829-2-petri.latvala@intel.com>
References: <20200217145042.829-1-petri.latvala@intel.com>
 <20200217145042.829-2-petri.latvala@intel.com>
Message-ID: <158202145203.3043.6283843409560708384@skylake-alporthouse-com>
Date: Tue, 18 Feb 2020 10:24:12 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] runner: Introduce per-test timeouts
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

Quoting Petri Latvala (2020-02-17 14:50:42)
> A new config option, --per-test-timeout, sets a time a single test
> cannot exceed without getting itself killed. The time resets when
> starting a subtest or a dynamic subtest, so an execution with
> --per-test-timeout=20 can indeed go over 20 seconds a long as it
> launches a dynamic subtest within that time.
> 
> As a bonus, verbose log level from runner now also prints dynamic
> subtest begin/result.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>

I wish igt had a pipe back to the runner so there was a clear protocol
for this rather than trying to re-interpret the user output. (What's
that you could pass commands from individual tests back to the runner,
such as changing the dmesg filters, timeouts etc, etc)

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
