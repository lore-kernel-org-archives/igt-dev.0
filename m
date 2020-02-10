Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1778A6E9F5
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 21:04:12 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200210210016.2886-1-antonio.argenziano@intel.com>
References: <20200210210016.2886-1-antonio.argenziano@intel.com>
Message-ID: <158136863893.5235.12203029453108287065@skylake-alporthouse-com>
Date: Mon, 10 Feb 2020 21:03:58 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_exec_balancer: Skip
 the test if no perf engines are available
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Antonio Argenziano (2020-02-10 21:00:16)
> Require that the test can access perf engines files. This patch also fixes
> the error check for perf_i915_open().
> 
> v2:
>         - Skip based on valid perf type ID. (Chris)
> 
> Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
