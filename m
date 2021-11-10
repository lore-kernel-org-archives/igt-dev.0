Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170E36E484
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Nov 2021 13:49:23 +0000 (UTC)
Date: Wed, 10 Nov 2021 15:48:11 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YYvNm2SgdfjEetQv@platvala-desk.ger.corp.intel.com>
References: <20211110131729.54135-1-zbigniew.kempczynski@intel.com>
 <20211110131729.54135-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211110131729.54135-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/intel-ci/fast-feedback: Add
 gem_lmem_swapping@basic to BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 02:17:29PM +0100, Zbigniew Kempczyński wrote:
> Add "basic" subtest to BAT to verify early lmem swapping is working
> on discrete.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/intel-ci/fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index fa5006d2e..eac6d1b38 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -34,6 +34,7 @@ igt@gem_flink_basic@double-flink
>  igt@gem_flink_basic@flink-lifetime
>  igt@gem_huc_copy@huc-copy
>  igt@gem_linear_blits@basic
> +igt@gem_lmem_swapping@basic
>  igt@gem_mmap@basic
>  igt@gem_mmap_gtt@basic
>  igt@gem_render_linear_blits@basic
> -- 
> 2.26.0
> 
