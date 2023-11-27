Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E75810E25C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Nov 2023 12:28:48 +0000 (UTC)
Date: Mon, 27 Nov 2023 13:28:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231127122838.w6pnb77bjxzw35qz@kamilkon-desk.igk.intel.com>
References: <20231124140403.1503568-1-daniel.t.mrzyglod@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231124140403.1503568-1-daniel.t.mrzyglod@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback: Add
 xe_waitfence subtest for Xe run
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Daniel,
On 2023-11-24 at 15:04:03 +0100, Daniel Mrzyglod wrote:
> There is subtest which should be run in bat.
> Test is simple check of waitfence with provided
> engine class instance.

Please improve description and just name new subtest you added,
like:

Add xe_waitfence@engine to xe-fast-feedback.

Also improve subject, xe-fast-feedback is for Xe, no need to repeat,
so something like:

[PATCH i-g-t] intel-ci/xe-fast-feedback: Add xe_waitfence@engine

or

[PATCH i-g-t] intel-ci: Add xe_waitfence@engine to Xe BAT

+Cc Swati (discussion about what to write for CI subject)

> 
> Signed-off-by: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 2a95bd037..ddf5bd208 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -149,6 +149,7 @@ igt@xe_vm@munmap-style-unbind-userptr-inval-end
>  igt@xe_vm@munmap-style-unbind-userptr-inval-front
>  igt@xe_waitfence@abstime
>  igt@xe_waitfence@reltime
> +igt@xe_waitfence@engine

This should be before @reltime as we keep list in alphabetical order.

You may also stop CI testing to save CI time and resources as
this was already tested with your v1.

With above corrections:

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  igt@kms_addfb_basic@addfb25-4-tiled
>  igt@kms_addfb_basic@addfb25-bad-modifier
>  igt@kms_addfb_basic@addfb25-modifier-no-flag
> -- 
> 2.42.0
> 
