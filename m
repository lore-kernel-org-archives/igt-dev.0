Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB7A10E660
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:53:23 +0000 (UTC)
Message-ID: <852bd666-0890-0e12-7a91-4326962046f5@intel.com>
Date: Tue, 6 Sep 2022 15:53:16 +0300
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
 <20220823183036.5270-5-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220823183036.5270-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 04/23] i915/perf: Limit sseu-config
 tests for gen11
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

On 23/08/2022 21:30, Umesh Nerlige Ramappa wrote:
> From: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
>
> On Gen11, the Media driver will need to limit dispatch to only big
> subslices (usually half the EUs depending on EU fusing). If media,
> render and OA are running in parallel, then OA will lose the NOA config
> because half of the EUs will be turned off by media. To avoid this with
> concurrent use cases, an sseu config to keep all EUs powered on is
> passed to OA in the i915_perf_open_ioctl params. This configuration is
> made part of the render contexts, so that it's applied when 3d contexts
> are running. Since this is an issue on gen11, limit sseu-config tests to
> gen11.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   tests/i915/perf.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 0b8f6ac8..ca3ccc17 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -5112,6 +5112,7 @@ igt_main
>   	igt_subtest_group {
>   		igt_fixture {
>   			igt_require(i915_perf_revision(drm_fd) >= 4);
> +			igt_require(intel_gen(devid) == 11);
>   		}
>   
>   		igt_describe("Verify invalid SSEU opening parameters");

