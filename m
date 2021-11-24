Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3B96E03C
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 11:56:29 +0000 (UTC)
Date: Wed, 24 Nov 2021 13:55:31 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YZ4oM1Q/SGm8AX9w@platvala-desk.ger.corp.intel.com>
References: <20211124113232.904784-1-mastanx.katragadda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124113232.904784-1-mastanx.katragadda@intel.com>
Subject: Re: [igt-dev] [i-g-t] intel-ci: balcklist
 gem_exec_alignment@pi-shared
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mastan Katragadda <mastanx.katragadda@intel.com>
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 24, 2021 at 05:02:32PM +0530, Mastan Katragadda wrote:
> black list the test until locking contentions got fixed in kernel
> 
> Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
> ---
>  tests/intel-ci/blacklist.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index ca361fde..8e9767b1 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -61,6 +61,7 @@ igt@sysfs_timeslice_duration@off
>  ###############################################
>  # GEM: Not worth fixing
>  ###############################################
> +igt@gem_exec_alignment@pi-shared
>  igt@gen7_exec_parse@.*lri.*

"Not worth fixing" and "until fixed" are different messages.

This needs a bug report link, and some asssessment in the commit
message that gives rationale for not running this test while there's a
lock contention bug. A quick look at one result for that test just
says it fails, it doesn't even taint the kernel. Why does it need
blacklisting?


-- 
Petri Latvala
