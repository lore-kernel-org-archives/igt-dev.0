Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A556F10F8EF
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 14:04:26 +0000 (UTC)
Message-ID: <0db5a71f-5726-c734-983c-75f2e426d625@intel.com>
Date: Tue, 28 Jun 2022 19:34:14 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220628100219.246526-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220628100219.246526-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] tests/kms_pipe_crc_basic: Avoid skips in
 dynamic subtets
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

This patch LGTM.
With clean CI results.
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>

On 28-Jun-22 3:32 PM, Bhanuprakash Modem wrote:
> Instead of Skipping the dynamic subtest, just don't trigger the test.
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_pipe_crc_basic.c | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 0f34f807..2ff40f72 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -276,6 +276,7 @@ data_t data = {0, };
>   igt_main
>   {
>   	enum pipe pipe;
> +	igt_output_t *output;
>   	struct {
>   		const char *name;
>   		unsigned flags;
> @@ -317,10 +318,7 @@ igt_main
>   	for (i = 0; i < ARRAY_SIZE(tests); i++) {
>   		igt_describe(tests[i].desc);
>   		igt_subtest_with_dynamic(tests[i].name) {
> -			for_each_pipe(&data.display, pipe) {
> -				igt_output_t *output = igt_get_single_output_for_pipe(&data.display, pipe);
> -
> -				igt_require(output);
> +			for_each_pipe_with_single_output(&data.display, pipe, output) {
>   				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>   					if (tests[i].flags & TEST_SUSPEND) {
>   						test_read_crc(&data, pipe, output, 0);
> @@ -348,10 +346,7 @@ igt_main
>   	igt_describe("Check that disabling CRCs on a CRTC after having disabled the CRTC "
>   		     "does not cause issues.");
>   	igt_subtest_with_dynamic("disable-crc-after-crtc") {
> -		for_each_pipe(&data.display, pipe) {
> -			igt_output_t *output = igt_get_single_output_for_pipe(&data.display, pipe);
> -
> -			igt_require(output);
> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
>   				test_disable_crc_after_crtc(&data, pipe, output);
>   		}
> @@ -359,10 +354,7 @@ igt_main
>   
>   	igt_describe("Basic sanity check for CRC mismatches");
>   	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
> -		for_each_pipe(&data.display, pipe) {
> -			igt_output_t *output = igt_get_single_output_for_pipe(&data.display, pipe);
> -
> -			igt_require(output);
> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
>   				test_compare_crc(&data, pipe, output);
>   		}

-- 
~Swati Sharma
