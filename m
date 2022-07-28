Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F66111A60A
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 10:48:19 +0000 (UTC)
Date: Thu, 28 Jul 2022 13:46:56 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <YuJpIM9gb0lgSi+2@platvala-desk.ger.corp.intel.com>
References: <20220726072802.708006-1-petri.latvala@intel.com>
 <917e675f-f6bf-983f-46b5-5713d8d5e175@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <917e675f-f6bf-983f-46b5-5713d8d5e175@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests: Avoid the name "all"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jul 26, 2022 at 10:01:32AM +0100, Tvrtko Ursulin wrote:
> 
> On 26/07/2022 08:28, Petri Latvala wrote:
> > If using a subtest or a dynamic subtest name "all", the piglit format
> > name will contain the string "@all". When filing bugs for test
> > failures, one needs extra care not to accidentally ping every
> > developer on gitlab.
> 
> Three questions:
> 
> 1)
> What if someone adds a subtest called all tomorrow or next year?

You're saying it should be a build-time error? Can be done.

> 
> 2)
> Are there other keywords with unintended side-effects?

Usernames and group names. I hope no one makes a subtest "drm"...

> 
> 3)
> Is there a component sitting between the IGT output and putting it into
> GitLab which would be ideally placed to sanitize and do that reliably and
> with less maintenance effort?

Not really. In this particular instance the @all mention was in the
bug title, which is hand crafted with a human-followed naming
convention.


-- 
Petri Latvala


> 
> Regards,
> 
> Tvrtko
> 
> > Along with having that extra care, try to avoid the possibility of
> > accidents by renaming everything with just "all" in their name to a
> > more descriptive form that explains what the list of "all" contains.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/121
> > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > ---
> >   lib/igt_kmod.c                        | 2 +-
> >   tests/i915/gem_busy.c                 | 2 +-
> >   tests/i915/gem_ctx_engines.c          | 2 +-
> >   tests/i915/gem_exec_gttfill.c         | 2 +-
> >   tests/i915/gem_exec_reloc.c           | 2 +-
> >   tests/i915/gem_sync.c                 | 2 +-
> >   tests/i915/gem_wait.c                 | 2 +-
> >   tests/i915/sysfs_clients.c            | 2 +-
> >   tests/intel-ci/fast-feedback.testlist | 8 ++++----
> >   9 files changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index dfdcfcc5..05484f76 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -1015,7 +1015,7 @@ void igt_kselftests(const char *module_name,
> >   		igt_require(igt_kselftest_begin(&tst) == 0);
> >   	igt_kselftest_get_tests(tst.kmod, filter, &tests);
> > -	igt_subtest_with_dynamic(filter ?: "all") {
> > +	igt_subtest_with_dynamic(filter ?: "all-tests") {
> >   		igt_list_for_each_entry_safe(tl, tn, &tests, link) {
> >   			unsigned long taints;
> > diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
> > index 3f104206..f11fa877 100644
> > --- a/tests/i915/gem_busy.c
> > +++ b/tests/i915/gem_busy.c
> > @@ -449,7 +449,7 @@ igt_main
> >   		igt_describe("Basic test to check busyness of each engine.");
> >   		igt_subtest_with_dynamic("busy") {
> > -			igt_dynamic("all") {
> > +			igt_dynamic("all-engines") {
> >   				gem_quiescent_gpu(fd);
> >   				all(fd, ctx);
> >   			}
> > diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> > index 4b8e5145..53b04358 100644
> > --- a/tests/i915/gem_ctx_engines.c
> > +++ b/tests/i915/gem_ctx_engines.c
> > @@ -631,7 +631,7 @@ igt_main
> >   			igt_dynamic_f("%s", e->name)
> >   				independent(i915, ctx, e);
> >   		}
> > -		igt_dynamic("all")
> > +		igt_dynamic("all-engines")
> >   			independent_all(i915, ctx);
> >   	}
> > diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> > index f9f244d6..c9a7ab50 100644
> > --- a/tests/i915/gem_exec_gttfill.c
> > +++ b/tests/i915/gem_exec_gttfill.c
> > @@ -254,7 +254,7 @@ igt_main
> >   	igt_describe("Stress test check behaviour/correctness of handling"
> >   		     " batches to fill gtt");
> > -	igt_subtest("all")
> > +	igt_subtest("all-engines")
> >   		fillgtt(i915, ctx, ALL_ENGINES, 20);
> >   	igt_fixture {
> > diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> > index 1f5d13e4..7a354a32 100644
> > --- a/tests/i915/gem_exec_reloc.c
> > +++ b/tests/i915/gem_exec_reloc.c
> > @@ -1145,7 +1145,7 @@ igt_main
> >   		from_gpu(fd);
> >   	igt_subtest_with_dynamic("basic-active") {
> > -		igt_dynamic("all")
> > +		igt_dynamic("all-engines")
> >   			active(fd, ctx, ALL_ENGINES);
> >   		for_each_ctx_engine(fd, ctx, e) {
> > diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> > index 8ee33c77..07cabf7a 100644
> > --- a/tests/i915/gem_sync.c
> > +++ b/tests/i915/gem_sync.c
> > @@ -1303,7 +1303,7 @@ igt_main
> >   		store_all(fd, ctx, 1, 2);
> >   	igt_describe("Extended version of existing basic-all test.");
> > -	igt_subtest("all")
> > +	igt_subtest("wait-all")
> >   		sync_all(fd, ctx, 1, 20);
> >   	igt_describe("Extended version of existing basic-store-all test.");
> >   	igt_subtest("store-all")
> > diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
> > index 230304aa..27d084af 100644
> > --- a/tests/i915/gem_wait.c
> > +++ b/tests/i915/gem_wait.c
> > @@ -160,7 +160,7 @@ static void test_all_engines(const char *name, int i915, const intel_ctx_t *ctx,
> >   	const struct intel_execution_engine2 *e;
> >   	igt_subtest_with_dynamic(name) {
> > -		igt_dynamic("all") {
> > +		igt_dynamic("all-engines") {
> >   			gem_quiescent_gpu(i915);
> >   			basic(i915, ctx, ALL_ENGINES, test);
> >   			gem_quiescent_gpu(i915);
> > diff --git a/tests/i915/sysfs_clients.c b/tests/i915/sysfs_clients.c
> > index ab79ff18..b49e6a55 100644
> > --- a/tests/i915/sysfs_clients.c
> > +++ b/tests/i915/sysfs_clients.c
> > @@ -970,7 +970,7 @@ static void test_busy(int i915, int clients)
> >   			}
> >   		}
> > -		igt_dynamic("all") {
> > +		igt_dynamic("all-engines") {
> >   			gem_quiescent_gpu(i915);
> >   			igt_fork(child, 1)
> >   				busy_all(i915, clients, &cfg);
> > diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> > index bd5538a0..541c1882 100644
> > --- a/tests/intel-ci/fast-feedback.testlist
> > +++ b/tests/intel-ci/fast-feedback.testlist
> > @@ -12,7 +12,7 @@ igt@fbdev@write
> >   igt@gem_basic@bad-close
> >   igt@gem_basic@create-close
> >   igt@gem_basic@create-fd-close
> > -igt@gem_busy@busy@all
> > +igt@gem_busy@busy@all-engines
> >   igt@gem_close_race@basic-process
> >   igt@gem_close_race@basic-threads
> >   igt@gem_ctx_create@basic
> > @@ -47,8 +47,8 @@ igt@gem_sync@basic-each
> >   igt@gem_tiled_blits@basic
> >   igt@gem_tiled_fence_blits@basic
> >   igt@gem_tiled_pread_basic
> > -igt@gem_wait@busy@all
> > -igt@gem_wait@wait@all
> > +igt@gem_wait@busy@all-engines
> > +igt@gem_wait@wait@all-engines
> >   igt@i915_getparams_basic@basic-eu-total
> >   igt@i915_getparams_basic@basic-subslice-total
> >   igt@i915_hangman@error-state-basic
> > @@ -166,7 +166,7 @@ igt@i915_pm_rpm@module-reload
> >   # Kernel selftests
> >   igt@i915_selftest@live
> > -igt@dmabuf@all
> > +igt@dmabuf@all-tests
> >   # System wide suspend tests
> >   igt@i915_suspend@basic-s2idle-without-i915
