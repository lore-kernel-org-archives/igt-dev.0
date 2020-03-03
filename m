Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AEE6EA44
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2020 09:08:57 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200303090225.7192-1-satyavathi.k@intel.com>
In-Reply-To: <20200303090225.7192-1-satyavathi.k@intel.com>
Message-ID: <158322650507.2376.3205111215090327327@skylake-alporthouse-com>
Date: Tue, 03 Mar 2020 09:08:25 +0000
Subject: Re: [igt-dev] [PATCH V6] [PATCH i-g-t][V6]
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

Quoting satyavat (2020-03-03 09:02:25)
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 1b00485e..d5a72db3 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -39,7 +39,7 @@ igt@gem_mmap@basic
>  igt@gem_mmap_gtt@basic
>  igt@gem_render_linear_blits@basic
>  igt@gem_render_tiled_blits@basic
> -igt@gem_ringfill@basic-default-forked
> +igt@gem_ringfill@basic-forked

This is still many-fold more work than we used to do. I don't need to
test every engine to verify handling of the ring being full. And before
you suggest, rcs0 is not the default.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
