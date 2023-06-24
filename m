Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F8410E02E
 for <igt-dev@lists.freedesktop.org>; Sat, 24 Jun 2023 05:47:19 +0000 (UTC)
Message-ID: <db33231c-e40d-dda7-a09a-6424f3a47318@intel.com>
Date: Sat, 24 Jun 2023 11:16:49 +0530
Content-Language: en-US
References: <20230623102331.40250-1-mauro.chehab@linux.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230623102331.40250-1-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_fb_coherency: add
 mega-feature and functionality
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Modem@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>


On Fri-23-06-2023 03:53 pm, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> This test is currently missing mega-feature and functionality.
> Add them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>   tests/i915/kms_fb_coherency.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/kms_fb_coherency.c b/tests/i915/kms_fb_coherency.c
> index b530bf5dcd70..edb5ba460fbf 100644
> --- a/tests/i915/kms_fb_coherency.c
> +++ b/tests/i915/kms_fb_coherency.c
> @@ -243,6 +243,8 @@ igt_main
>   	 * Description: Use display controller CRC hardware to validate (non)coherency
>   	 *		of memset operations on future scanout buffer objects
>   	 *		mmapped with different mmap methods and different caching modes.
> +	 * Mega feature: General Display Features
> +	 * Functionality: gtt

LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

>   	 */
>   	igt_subtest_with_dynamic("memset-crc") {
>   		if (gem_has_mappable_ggtt(data.drm_fd)) {

