Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7A56EC0C
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 19:58:38 +0000 (UTC)
References: <20200715195324.492926-1-chris@chris-wilson.co.uk>
From: "Argenziano, Antonio" <antonio.argenziano@intel.com>
Message-ID: <0428c2df-2cde-5cca-e6f7-4525ef8cd00f@intel.com>
Date: Wed, 15 Jul 2020 12:58:35 -0700
MIME-Version: 1.0
In-Reply-To: <20200715195324.492926-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: s/huc_copy/huc-copy/
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 7/15/2020 12:53 PM, Chris Wilson wrote:
> Fix the testlist to match the test name.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2186
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Antonio Argenziano <antonio.argenziano@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 5b0005103..b796b2642 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -28,7 +28,7 @@ igt@gem_flink_basic@bad-open
>   igt@gem_flink_basic@basic
>   igt@gem_flink_basic@double-flink
>   igt@gem_flink_basic@flink-lifetime
> -igt@gem_huc_copy@huc_copy
> +igt@gem_huc_copy@huc-copy


Sorry I missed it,

Reviewed-by: Antonio Argenziano <antonio.argenziano@intel.com>


>   igt@gem_linear_blits@basic
>   igt@gem_mmap@basic
>   igt@gem_mmap_gtt@basic
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
