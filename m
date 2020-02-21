Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377116EF2A
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 10:20:35 +0000 (UTC)
Date: Fri, 21 Feb 2020 12:20:33 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200221102033.GC25209@platvala-desk.ger.corp.intel.com>
References: <20200220153209.210767-1-martin.peres@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220153209.210767-1-martin.peres@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: add a pre-merge blacklist to
 reduce the testing queue
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
To: Martin Peres <martin.peres@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 05:32:09PM +0200, Martin Peres wrote:
> When arriving at the office on Monday morning, the reported queue
> size was ~100 hours. This defeats the point of pre-merge testing and
> vastly exceeds our target of ~6 hours.
> 
> We have a lot of work needed to reduce testing time, but this patches
> reduces the reported run time by 15-30% depending on the platforms:
> 
>  - shard-skl: 23.9 -> 18.2 minutes (18.5%)
>  - shard-kbl: 21.2 -> 16.2 minutes (20%)
>  - shard-apl: 25.9 -> 18.5 minutes (24.3%)
>  - shard-glk: 24.7 -> 17.6 minutes (24.8%)
>  - shard-icl: 25.1 -> 16.7 minutes (28.7%)
>  - shard-tgl: 28.2 -> 19.6 minutes (26.4%)
> 
> The reason why the reported runtime is so low compared to the
> actual time is due to:
> 
>  - Unaccounted time spent outside of the IGT subtests (exec(), fixtures)
>  - Unaccounted time spent in suspend (monotonic clock, 20s / suspend)
>  - Boot time / extra reboots between shards to workaround kernel failures
>  - Intel GFX CI shard scheduling overhead
>  - More?
> 
> Tomi and Petri are working on reducing these overheads by detecting the
> bad conditions and rebooting the machine only at this point rather than
> between every single shard, and increasing the size of the shard test
> lists to reduce the per-shard CI overhead.
> 
> Because of this, the actual savings are way smaller in percentage
> but still compound over the tens of executions we do per week:
> 
>  - shard-skl: ~58 -> ~52 minutes
>  - shard-kbl: ~50 -> ~45 minutes
>  - shard-apl: ~53 -> ~46 minutes
>  - shard-glk: ~38 -> ~31 minutes
>  - shard-icl: ~47 -> ~39 minutes
>  - shard-tgl: ~60 -> ~51 minutes
> 
> More work needed, but we'll get there :)
> 
> Signed-off-by: Martin Peres <martin.peres@linux.intel.com>
> ---
>  tests/intel-ci/README                  |   7 +
>  tests/intel-ci/blacklist-pre-merge.txt | 221 +++++++++++++++++++++++++


With a drive-by addition of a forgotten blacklist.txt, squash this in:

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index b3abb848..62811e92 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -3,6 +3,8 @@ intelci_files = [
   'fast-feedback.testlist',
   'meta.testlist',
   'README',
+  'blacklist.txt',
+  'blacklist-pre-merge.txt',
 ]
 
 install_data(sources : intelci_files, install_dir : datadir)
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
