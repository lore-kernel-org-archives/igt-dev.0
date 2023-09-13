Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Wed, 13 Sep 2023 16:04:10 +0200
Message-ID: <1838195.atdPhlSkOF@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20230911110142.04abc143@maurocar-mobl2>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
 <20230908123233.137134-26-janusz.krzysztofik@linux.intel.com>
 <20230911110142.04abc143@maurocar-mobl2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 07/17] lib/ktap: Don't
 ignore interrupt signals
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>, intel-xe@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Monday, 11 September 2023 11:01:42 CEST Mauro Carvalho Chehab wrote:
> On Fri,  8 Sep 2023 14:32:41 +0200
> Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> 
> > While reading KTAP data from /dev/kmsg we now ignore interrupt signals
> > that may occur during read() and we continue reading the data.  No
> > explanation has been provided on what that could be needed for.
> 
> The reason is that kunit module load takes seconds, as it only finishes
> loading after all tests are executed.
> 
> So, interrupting IGT won't interrupt the tests, and kmsg will still
> be filled by test results.
> 
> IMO, the right thing to do here is to ignore interrupts, as otherwise
> the logs for the next test will be polluted by the KTAP messages and
> the Kernel will be kept on an unstable state, as running tests while
> kUnit tests are running is not supported.

Well, not really.  Please have a look at the following two log excerpts.  The 
first one is from a complete, not interrupted execution of drm_mm test:

Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com sudo[15594]: jkrzyszt : TTY=pts/14 ; PWD=/home/jkrzyszt/build/igt ; USER=root ; COMMAND=./tests/drm_mm
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com sudo[15594]: pam_unix(sudo:session): session opened for user root(uid=0) by jkrzyszt(uid=1000)
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com kernel: Console: switching to colour dummy device 80x25
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: executing
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting subtest drm_mm_test
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com kernel:     # drm_mm: Testing DRM range manager, with random_seed=0x5b01fc53 max_iterations=8192 max_prime=128
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com kernel:     KTAP version 1
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com kernel:     # Subtest: drm_mm
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com kernel:     1..19
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 1 drm_test_mm_init
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 2 drm_test_mm_debug
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_init
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_init, SUCCESS
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_debug
Sep 13 15:14:39 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_debug, SUCCESS
Sep 13 15:14:46 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 3 drm_test_mm_reserve
Sep 13 15:14:46 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 4 drm_test_mm_insert
Sep 13 15:14:46 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_reserve
Sep 13 15:14:46 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_reserve, SUCCESS
Sep 13 15:14:46 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_insert
Sep 13 15:14:46 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_insert, SUCCESS
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 5 drm_test_mm_replace
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 6 drm_test_mm_insert_range
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_replace
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_replace, SUCCESS
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_insert_range
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_insert_range, SUCCESS
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     # drm_test_mm_frag: bottom-up fragmented insert of 10000 and 20000 insertions took 6009658 and 13648333 nsecs
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     # drm_test_mm_frag: top-down fragmented insert of 10000 and 20000 insertions took 6518544 and 13824246 nsecs
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 7 drm_test_mm_frag
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 8 drm_test_mm_align
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 9 drm_test_mm_align32
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 10 drm_test_mm_align64
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_frag
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_frag, SUCCESS
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_align
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_align, SUCCESS
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_align32
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_align32, SUCCESS
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_align64
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_align64, SUCCESS
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 11 drm_test_mm_evict
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 12 drm_test_mm_evict_range
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_evict
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_evict, SUCCESS
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_evict_range
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_evict_range, SUCCESS
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 13 drm_test_mm_topdown
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 14 drm_test_mm_bottomup
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 15 drm_test_mm_lowest
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 16 drm_test_mm_highest
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_topdown
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_topdown, SUCCESS
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_bottomup
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_bottomup, SUCCESS
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_lowest
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_lowest, SUCCESS
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_highest
Sep 13 15:14:55 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_highest, SUCCESS
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 17 drm_test_mm_color
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 18 drm_test_mm_color_evict
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_color
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_color, SUCCESS
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_color_evict
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_color_evict, SUCCESS
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 19 drm_test_mm_color_evict_range
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com kernel: # drm_mm: pass:19 fail:0 skip:0 total:19
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com kernel: # Totals: pass:19 fail:0 skip:0 total:19
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com kernel: ok 1 drm_mm
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_color_evict_range
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_color_evict_range, SUCCESS
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm_test, SUCCESS
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com sudo[15594]: pam_unix(sudo:session): session closed for user root
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: exiting, ret=0
Sep 13 15:14:56 jkrzyszt-mobl2.ger.corp.intel.com kernel: Console: switching to colour frame buffer device 240x75

You can see it took 17 seconds for the test to complete.  Now the same test 
but interrupted after 2 seconds:

Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com sudo[15668]: pam_unix(sudo:session): session opened for user root(uid=0) by jkrzyszt(uid=1000)
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com kernel: Console: switching to colour dummy device 80x25
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: executing
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting subtest drm_mm_test
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com kernel:     # drm_mm: Testing DRM range manager, with random_seed=0xadd9af85 max_iterations=8192 max_prime=128
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com kernel:     KTAP version 1
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com kernel:     # Subtest: drm_mm
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com kernel:     1..19
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 1 drm_test_mm_init
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 2 drm_test_mm_debug
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_init
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_init, SUCCESS
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: starting dynamic subtest drm_mm-drm_test_mm_debug
Sep 13 15:15:15 jkrzyszt-mobl2.ger.corp.intel.com unknown: [IGT] drm_mm: finished subtest drm_mm-drm_test_mm_debug, SUCCESS
Sep 13 15:15:17 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 3 drm_test_mm_reserve
Sep 13 15:15:17 jkrzyszt-mobl2.ger.corp.intel.com kernel: Console: switching to colour frame buffer device 240x75
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 4 drm_test_mm_insert
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 5 drm_test_mm_replace
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 6 drm_test_mm_insert_range
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 7 drm_test_mm_frag
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 8 drm_test_mm_align
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 9 drm_test_mm_align32
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 10 drm_test_mm_align64
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 11 drm_test_mm_evict
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 12 drm_test_mm_evict_range
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 13 drm_test_mm_topdown
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 14 drm_test_mm_bottomup
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 15 drm_test_mm_lowest
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 16 drm_test_mm_highest
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 17 drm_test_mm_color
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 18 drm_test_mm_color_evict
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel:     ok 19 drm_test_mm_color_evict_range
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel: # drm_mm: pass:19 fail:0 skip:0 total:19
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel: # Totals: pass:19 fail:0 skip:0 total:19
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com kernel: ok 1 drm_mm
Sep 13 15:15:22 jkrzyszt-mobl2.ger.corp.intel.com sudo[15668]: pam_unix(sudo:session): session closed for user root

When you compare timestamps, you can see that kunit layer reported an OK 
result from test case 3 drm_test_mm_reserve two seconds after a result from 
test case 2 drm_test_mm_debug, presumably as soon as user interrupt occurred, 
while it took ca. 7 seconds before.  We can also see that the process tried to 
exit, but a still running despite interrupted modprobe thread prevented it 
from exiting before modprobe completion.  Moreover, we can see an OK result 
from test case 4 drm_test_mm_insert now appeared after 7 seconds, presumably 
after test case 3 actually completed, and OK results from remaining test cases 
appeared immediately thereafter, and module loading completed within those ca. 
7 seconds.  All those OK results that appeared after the test was interrupted 
were then wrong, however, they were not converted to any IGT results, which is 
fine.

Other than that, while fixing the issue of infinite first blocking read() on 
modprobe failure, introduced by patch 15/17, "Parse KTAP report from the main 
process thread", I've understood that the code that tried to handle EINTR this 
way or another was anyway a dead code.  For it to function as expected, we 
would have to disable default signal handler for SIGINT so we actually get 
that return code from read() instead of the process being killed, while we 
don't do that.  Then, unless we capture SIGINT, only dropping that code 
completely instead of modifying it makes sense, I believe, and commit 
description must be updated.

Thanks,
Janusz

> 
> > 
> > Always return with an error code to the caller when read() fails with
> > errno == EINTR, so igt_runner has no problems with killing us promptly
> > on timeout.
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  lib/igt_ktap.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
> > index 84fb13218f..3cfb55ec97 100644
> > --- a/lib/igt_ktap.c
> > +++ b/lib/igt_ktap.c
> > @@ -67,7 +67,7 @@ static int log_to_end(enum igt_log_level level, int fd,
> >  			}
> >  
> >  			if (errno == EINTR)
> > -				continue;
> > +				return -2;
> >  
> >  			if (errno == EPIPE) {
> >  				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
> > @@ -189,7 +189,7 @@ static int find_next_tap_subtest(int fd, char *record, char *test_name, bool is_
> >  			}
> >  
> >  			if (errno == EINTR)
> > -				continue;
> > +				return -2;
> >  
> >  			if (errno == EPIPE) {
> >  				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
> > @@ -233,7 +233,7 @@ static int find_next_tap_subtest(int fd, char *record, char *test_name, bool is_
> >  			}
> >  
> >  			if (errno == EINTR)
> > -				continue;
> > +				return -2;
> >  
> >  			if (errno == EPIPE) {
> >  				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
> > @@ -388,7 +388,7 @@ static int parse_tap_level(int fd, char *base_test_name, int test_count, bool *f
> >  			}
> >  
> >  			if (errno == EINTR)
> > -				continue;
> > +				return -1;
> >  
> >  			if (errno == EAGAIN)
> >  				/* No records available */
> > @@ -541,7 +541,7 @@ igt_ktap_parser_start:
> >  			continue;
> >  
> >  		if (errno == EINTR)
> > -			continue;
> > +			goto igt_ktap_parser_end;
> >  
> >  		if (errno == EPIPE) {
> >  			igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
> 





