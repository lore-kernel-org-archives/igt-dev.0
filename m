Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Feb 2023 08:53:12 +0100
Message-ID: <38094681.10thIPus4b@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <20230209115039.34441-1-janusz.krzysztofik@linux.intel.com>
References: <20230209115039.34441-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/1] tests/i915/perf: Add stress /
 race exercises
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On Thursday, 9 February 2023 12:50:38 CET Janusz Krzysztofik wrote:
> Users reported oopses on list corruptions when using i915 perf with a
> number of concurrently running graphics applications.  That indicates we
> are currently missing some important tests for such scenarios.  Cover
> that gap.
> 
> v2: drop open-race subtest for now, not capable of triggering the user
>     reported bug, but triggering other bugs which I can't see any fixes
>     for queued yet,
>   - move the other new subtest out of tests/i915/perf.c (Ashutosh).
> 
> Janusz Krzysztofik (1):
>   tests/gem_ctx_exec: Exercise barrier race

While still waiting for CI results (BAT results don't cover the new subtest) 
I've collected results from a forced execution of the subtest in BAT scope on 
trybot: https://patchwork.freedesktop.org/series/113608/#rev2

While working as expected on most platforms, the test failed on some ancient 
ones instead of skipping.  I've fixed this issue and tested the fix 
successfully on trybot: https://patchwork.freedesktop.org/series/113608/#rev3

I'm still waiting for your comments, if any, before I submit the fixed 
version.

Thanks,
Janusz

> 
>  tests/i915/gem_ctx_exec.c | 123 ++++++++++++++++++++++++++++++++++++++
>  tests/meson.build         |   9 ++-
>  2 files changed, 131 insertions(+), 1 deletion(-)
> 
> 



