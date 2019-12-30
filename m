Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C3C89D5F
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2019 16:01:36 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20191230110650.3749883-1-chris@chris-wilson.co.uk>
References: <20191230110650.3749883-1-chris@chris-wilson.co.uk>
Date: Mon, 30 Dec 2019 18:01:12 +0200
Message-ID: <87k16dreev.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Drop gem_workarounds/basic
 from fast-feedback
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> The gem_workarounds basic subtest has been entirely subsumed by the
> kernels own sanity checks on applying the mmio, and we have further
> coverage that the values remain set from our live_workarounds selftest
> coverage.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Petri Latvala <petri.latvala@intel.com>

Acked-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  tests/intel-ci/fast-feedback.testlist | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 3d9166b65..71dc99a68 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -73,7 +73,6 @@ igt@gem_tiled_pread_basic
>  igt@gem_wait@basic-busy-all
>  igt@gem_wait@basic-wait-all
>  igt@gem_wait@basic-await-all
> -igt@gem_workarounds@basic-read
>  igt@i915_getparams_basic@basic-eu-total
>  igt@i915_getparams_basic@basic-subslice-total
>  igt@i915_hangman@error-state-basic
> -- 
> 2.25.0.rc0
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
