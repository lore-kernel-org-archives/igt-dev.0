Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D6C899D6
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Mar 2021 07:47:36 +0000 (UTC)
Date: Mon, 15 Mar 2021 09:48:05 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YE8RNZiKnKDJb539@platvala-desk.ger.corp.intel.com>
References: <20210313200549.16973-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210313200549.16973-1-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "tests/kms_plane_scaling: Add
 plane scaling test descriptions for subtests"
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Mar 13, 2021 at 12:05:49PM -0800, Ashutosh Dixit wrote:
> This reverts commit b0c056b3513e58332887dc50847f359da3e74e53.
> 
> Tests are failing with the following signature due to this commit:
> 
> Starting subtest: plane-scaling
> documenting dynamic subsubtests is impossible, document the subtest instead.please refer to lib/igt_core documentation
> kms_plane_scaling: ../lib/igt_core.c:359: internal_assert: Assertion `0' failed.
> Received signal SIGABRT.
> Stack trace:
>  #0 [fatal_sig_handler+0xd6]
>  #1 [killpg+0x40]
>  #2 [gsignal+0xc7]
>  #3 [abort+0x141]
>  #4 [uselocale+0x33a]
>  #5 [__assert_fail+0x42]
>  #6 [internal_assert+0x101]
>  #7 [igt_describe_f+0x95]
>  #8 [__real_main704+0xa45]
>  #9 [main+0x3f]
>  #10 [__libc_start_main+0xe7]
>  #11 [_start+0x2a]
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Reported-by: Jani Saarinen <jani.saarinen@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---

For the record, merged.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
