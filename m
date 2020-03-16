Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 16 Mar 2020 14:46:22 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200316124622.GE9497@platvala-desk.ger.corp.intel.com>
References: <20200316105427.517192-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316105427.517192-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] intel-ci: Tweak blacklist for very
 long running stability tests
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 10:54:26AM +0000, Chris Wilson wrote:
> To exclude yynamic tests just use  their group name?

Yes, the igt_subtest_with_dynamic("somename") macro creates a subtest
entry point just like igt_subtest, for the purposes of testlists and
blacklists.


> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Petri Latvala <petri.latvala@intel.com>
> ---
>  tests/intel-ci/blacklist.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 948b47569..184c23c37 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -60,9 +60,9 @@ igt@gem_sync@(?!.*basic).*
>  igt@gem_tiled_swapping@(?!non-threaded).*
>  igt@gem_userptr_blits@(major|minor|forked|mlocked|swapping).*
>  igt@gem_wait@.*hang.*
> -igt@sysfs_heartbeat_timeout@long.*
> -igt@sysfs_preemption_timeout@off.*
> -igt@sysfs_timeslice_duration@off.*
> +igt@sysfs_heartbeat_timeout@long
> +igt@sysfs_preemption_timeout@off
> +igt@sysfs_timeslice_duration@off

Please fix the test names along with this change. I spent some minutes
trying to figure out what changes, before I realized
sysfs_heartbeat_timeout doesn't exist. It's
sysfs_heartbeat_interval. sysfs_preemption_timeout is
sysfs_preempt_timeout.

Ways to doublecheck:

igt_runner -L -t igt@sysfs_heartbeat_timeout@long build/tests

igt_runner -L -b tests/intel-ci/blacklist.txt build/tests

https://patchwork.freedesktop.org/series/74263/


Acked-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
