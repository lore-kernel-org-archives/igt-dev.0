Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A94D10E5D0
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 03:50:18 +0000 (UTC)
Message-ID: <1927f15a-be62-ce28-99f5-cd553a647c30@intel.com>
Date: Fri, 23 Jun 2023 09:19:49 +0530
Content-Language: en-US
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230622111651.9040-1-jeevan.b@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230622111651.9040-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_setmode: Fix dynamic subtests
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

Hi Jeevan,

On Thu-22-06-2023 04:46 pm, Jeevan B wrote:
> basic-clone-single-crtc and invalid-clone-exclusive-crtc were not
> part of dynamic subtest so tests were getting skipped. fixed the
> test to execute skipping tests as expected.

What does it mean these tests are not part of dynamic subtests?

AFAIK, all basic-* tests are positive test cases & there are 
corresponding negative test cases (invalid-*)

If any positive test executed, the corresponding negative test is 
supposed to skip & vice versa.

Example:
https://intel-gfx-ci.01.org/tree/drm-tip/shards-all.html?testfilter=kms_setmode&hosts=shard-glk 


- basic-close-single-crtc: SKIP
- invalid-clone-single-crtc: PASS

- clone-executive-crtc: PASS
- invalid-clone-executive-crtc: SKIP

> 
> v2: add missing call.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_setmode.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index a611d938..96fb0b4b 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -647,20 +647,19 @@ static void test_one_combination(const struct test_config *tconf,
>   	struct crtc_config crtcs[MAX_CRTCS];
>   	int crtc_count;
>   	bool config_valid;
> +	int i, pos = 0;
> +	char test_name[256];
>   
>   	setup_crtcs(tconf, cconfs, connector_count, crtcs,
>   		    &crtc_count, &config_valid);
>   
> -	if (config_valid == !(tconf->flags & TEST_INVALID)) {
> -		int i, pos = 0;
> -		char test_name[256];
> -
> -		for (i = 0; i < crtc_count; i++) {
> -			if (i > 0)
> -				pos += snprintf(&test_name[pos], ARRAY_SIZE(test_name) - pos, "-");
> -			pos += get_test_name_str(&crtcs[i], &test_name[pos], ARRAY_SIZE(test_name) - pos);
> -		}
> +	for (i = 0; i < crtc_count; i++) {
> +		if (i > 0)
> +			pos += snprintf(&test_name[pos], ARRAY_SIZE(test_name) - pos, "-");
> +		pos += get_test_name_str(&crtcs[i], &test_name[pos], ARRAY_SIZE(test_name) - pos);
> +	}
>   
> +	if (config_valid == !(tconf->flags & TEST_INVALID)) {
>   		for (i = 0; i < crtc_count; i++) {
>   			struct crtc_config *crtc = &crtcs[i];
>   
> @@ -679,16 +678,17 @@ static void test_one_combination(const struct test_config *tconf,
>   			    ((i > 0) && (crtc[i - 1].mode.hdisplay > MAX_HDISPLAY_PER_CRTC) &&
>   			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
>   				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
> -				goto out;
> +				cleanup_crtcs(crtcs, crtc_count);
> +				return;
>   			}
>   		}
>   
>   		igt_dynamic_f("%s", test_name)
>   			test_crtc_config(tconf, crtcs, crtc_count);
> +	} else {
> +		igt_dynamic_f("%s", test_name)
> +			cleanup_crtcs(crtcs, crtc_count);

We are supposed to execute the test, not a cleanup. This will always 
throw the test result as PASS (which is bogus) without even testing 
anything.

- Bhanu

>   	}
> -
> -out:
> -	cleanup_crtcs(crtcs, crtc_count);
>   }
>   
>   static int assign_crtc_to_connectors(const struct test_config *tconf,
