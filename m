Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A07B6E903
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2020 10:50:44 +0000 (UTC)
Date: Thu, 10 Sep 2020 13:41:57 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200910104157.GD7444@platvala-desk.ger.corp.intel.com>
References: <20200910101532.167045-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910101532.167045-1-lionel.g.landwerlin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/perf: rework perf counters
 equations
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 01:15:32PM +0300, Lionel Landwerlin wrote:
> Working with an offset means we can have the PERFCNT snapshots stored
> at an offset in the existing accumulator rather than having a specific
> accumulator just for them.
> 
> This isn't really useful for IGT because it only looks at the OA
> buffer where those registers aren't stored, but it is useful for perf
> queries in Mesa.
> 
> This bumps the version of the i915_perf library to reflect the API
> change (see perf.h).

For older versions of Mesa that cannot use this version, what's the
method of getting a compatible i915-perf? Is it "checkout this older
git commit"?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
