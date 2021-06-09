Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354E56E0BE
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:46:50 +0000 (UTC)
Date: Wed, 9 Jun 2021 07:48:38 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YMBIJhSdGal5c3e5@platvala-desk.ger.corp.intel.com>
References: <20210608151552.15095-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210608151552.15095-1-venkata.sai.patnana@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Remove
 pixel-format-source-clamping@* from the pre-merge blacklist
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
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 08, 2021 at 08:45:52PM +0530, venkata.sai.patnana@intel.com wrote:
> From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> 
> This subtest currently taking less time ~20s. So removing this
> subtest from pre-merge ci blacklist file.
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> ---
>  tests/intel-ci/blacklist-pre-merge.txt | 20 --------------------
>  1 file changed, 20 deletions(-)
> 
> diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
> index 6363a7ac86..115474d987 100644
> --- a/tests/intel-ci/blacklist-pre-merge.txt
> +++ b/tests/intel-ci/blacklist-pre-merge.txt
> @@ -153,26 +153,6 @@ igt@gem_tiled_blits@normal
>  igt@gem_tiled_wc
>  
>  
> -###############################################################################
> -# This is a useful test, but it mostly tests the HW rather than the driver.
> -# Very few regressions should be caught by this test as the driver code should
> -# be relatively left untouched. Hopefully, it will get optimized to be made
> -# useful in pre-merge as well:
> -#
> -# - shard-skl: 1% (~2.5 minutes)
> -# - shard-kbl: 1.5% (~2 minutes)
> -# - shard-apl: 1.4% (~2.5 minutes)
> -# - shard-glk: 2% (~4.5 minutes)
> -# - shard-icl: 2.7% (~5.5 minutes)
> -# - shard-tgl: 2.3% (~4.5 minutes)
> -#
> -# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1287
> -#
> -# Data acquired on 2020-02-20 by Martin Peres
> -###############################################################################
> -igt@kms_plane@pixel-format-pipe-[b-d]-planes(-source-clamping)?
> -
> -


Well now.

The change itself is

Acked-by: Petri Latvala <petri.latvala@intel.com>

But the commit message needs changing to something like

===
After commit d28aee5c5f52 ("tests/kms_plane: Restrict the test
execution to two pipes") these subtests got renamed, and along with
the rename no longer takes entire minutes to execute. Enable their
execution on premerge.
===


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
