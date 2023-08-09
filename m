Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB9D10E3FD
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 08:35:53 +0000 (UTC)
Message-ID: <f6a3e133-10e1-509e-46a5-086d5bb646ed@intel.com>
Date: Wed, 9 Aug 2023 14:05:20 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-18-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230629144910.3055377-18-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 17/81] tests/i915/kms_fb_coherency:
 Document each subtest for testplan
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


On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_fb_coherency.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/i915/kms_fb_coherency.c b/tests/i915/kms_fb_coherency.c
> index edb5ba460..8a553613a 100644
> --- a/tests/i915/kms_fb_coherency.c
> +++ b/tests/i915/kms_fb_coherency.c
> @@ -5,6 +5,7 @@
>   
>   /**
>    * TEST: kms_fb_coherency
> + * Category: Display
>    * Description: Exercise coherency of future scanout buffer objects
>    */
>   
> @@ -245,6 +246,9 @@ igt_main
>   	 *		mmapped with different mmap methods and different caching modes.
>   	 * Mega feature: General Display Features
>   	 * Functionality: gtt
> +	 * Driver requirement: any
> +	 * Run type: FULL
> +	 * Test category: functionality test
>   	 */
>   	igt_subtest_with_dynamic("memset-crc") {
>   		if (gem_has_mappable_ggtt(data.drm_fd)) {
