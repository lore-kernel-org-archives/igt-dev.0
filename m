Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <5a032c6e-cd4a-1c17-5629-80803d8477b2@linux.intel.com>
References: <20201207161150.1841453-1-chris@chris-wilson.co.uk>
 <20201207161150.1841453-2-chris@chris-wilson.co.uk>
 <20201208110405.GO7444@platvala-desk.ger.corp.intel.com>
 <5a032c6e-cd4a-1c17-5629-80803d8477b2@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 08 Dec 2020 11:31:15 +0000
Message-ID: <160742707541.25187.5864506770070262093@build.alporthouse.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/2] i915/query: Directly
 check query results against GETPARAM
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
To: Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-12-08 11:18:56)
> 
> On 08/12/2020 11:04, Petri Latvala wrote:
> > On Mon, Dec 07, 2020 at 04:11:50PM +0000, Chris Wilson wrote:
> >> Simplify the cross-check by asserting that the existence of an engine in
> >> the list matches the existence of the engine as reported by GETPARAM.
> >> By using the comparison, we check both directions at once.
> >>
> >> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> >> Cc: Petri Latvala <petri.latvala@intel.com>
> > 
> > 
> > For the series,
> > Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
> Yeah it's a yes from me as well. Either test was merged with or before 
> the engine map feature so it had to be a bit more backward compatible.

As a sanity check,

drm/i915: Allow a context to define its set of engines
CommitDate: Wed May 22 08:40:31 2019 +0100

drm/i915: Engine discovery query
CommitDate: Wed May 22 14:17:55 2019 +0100

So they are paired. If the kernel supports the engine query, it will
support the engine map.

> I wonder at which point we re-implement gem_has_xcs family to use the 
> query and move the get_param based tests to a single legacy test.

gem_has_xcs() is a quirk of igt, and we are very very close to
completely removing it. The only place where it remains relevant is
verifying that we do not break the existing GETPARAM (so this test and
gem_exec_param).

That seems like an afternoon task to move the GETPARAM into a dungeon
and throw away the key.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
