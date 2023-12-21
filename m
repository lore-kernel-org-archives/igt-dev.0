Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7781110E388
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 18:40:33 +0000 (UTC)
Date: Thu, 21 Dec 2023 19:40:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] intel-ci/xe.blocklist: fix regex
Message-ID: <20231221184015.hvybzrnviu4spvch@kamilkon-desk.igk.intel.com>
References: <20231221145501.354456-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231221145501.354456-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2023-12-21 at 20:25:01 +0530, Swati Sharma wrote:
> Fix regex, since its block-listing
> "igt@kms_frontbuffer_tracking@pipe-fbc-rte" which is not
> meant to be.
> 
> Fixes: 6be4fb999 ("intel-ci: Blacklist tests on pipe I to pipe P")
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe.blocklist.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 7c28c3471..cd8960c64 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -47,7 +47,7 @@ igt@tools_test
>  # KMS: Pipe E to Pipe P are not available on Intel hardware,
>  # hence can't use more than 4 displays.
>  ##################################################################
> -igt@.*@.*pipe-[e-pE-P].*
> +igt@.*@.*pipe-[e-pE-P]($|-.*)
>  igt@kms_bw@.*-([5-9]|1[0-6])-displays-.*
>  ##################################################################
>  # KMS: Tests specific to i915 driver
> -- 
> 2.25.1
> 
