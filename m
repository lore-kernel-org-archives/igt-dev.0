Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200122152349.12154-1-tvrtko.ursulin@linux.intel.com>
References: <20200122152349.12154-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <157971619217.15024.9061564515732750310@skylake-alporthouse-com>
Date: Wed, 22 Jan 2020 18:03:12 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_engine_topology: Generate
 engine names based on class
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
Cc: Intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-01-22 15:23:48)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> With the introduction of dynamic subtests we got one step closer towards
> eliminating the duality of static and dynamic engine enumeration.
> 
> This patch makes one more step in that direction by removing the
> dependency on the static list when generating probed engine names.
> 
> v2:
>  * Fix __for_each_static_engine iterator.
>  * Prefix unknown engines with 'unknown'.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
