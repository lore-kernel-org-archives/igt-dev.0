Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20210203102601.895197-1-tvrtko.ursulin@linux.intel.com>
References: <20210203102601.895197-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 03 Feb 2021 11:03:24 +0000
Message-ID: <161235020467.6538.5402506407450939609@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel_gpu_top: Always sort the clients
 array after update
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2021-02-03 10:26:01)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Walking the client "list" makes assumptions about the order of active and
> free slots which means we need to sort the array after every update.
> 
> Patch is mostly just code movement with the only functional difference of
> eliminating two subsequent scans with no sort in between This closes a
> very short window there list iteration could get confused if sysfs clients
> would change rapidly and unfavourably during tool startup.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
