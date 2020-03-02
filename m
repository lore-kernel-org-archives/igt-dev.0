Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE246E24D
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2020 11:22:43 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200302101603.3195-1-satyavathi.k@intel.com>
In-Reply-To: <20200302101603.3195-1-satyavathi.k@intel.com>
Message-ID: <158314813838.2592.9164466907595086458@skylake-alporthouse-com>
Date: Mon, 02 Mar 2020 11:22:18 +0000
Subject: Re: [igt-dev] [PATCH V5] [PATCH i-g-t][V5]
 tests/i915/gem_ringfill:Added __for_each_physical_engine to utilize all
 available engines.
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
To: igt-dev@lists.freedesktop.org, satyavathi.k@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting satyavat (2020-03-02 10:16:03)
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 1b00485e..4463b2cb 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -39,7 +39,7 @@ igt@gem_mmap@basic
>  igt@gem_mmap_gtt@basic
>  igt@gem_render_linear_blits@basic
>  igt@gem_render_tiled_blits@basic
> -igt@gem_ringfill@basic-default-forked
> +igt@gem_ringfill@basic

These are not the same workloads.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
