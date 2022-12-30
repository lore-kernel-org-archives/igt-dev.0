Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F94710E081
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 19:16:11 +0000 (UTC)
Message-ID: <18b175a2-0c14-3dc2-4c18-3ba03a300370@intel.com>
Date: Sat, 31 Dec 2022 00:46:04 +0530
MIME-Version: 1.0
Content-Language: en-US
To: bhadanednyaneshwar <dnyaneshwar.bhadane@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221230064638.155300-1-dnyaneshwar.bhadane@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20221230064638.155300-1-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_crc: Add Gaurd for MSO eDP
 for Pipe C and D
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chaitanya.kumar.borah@intel.com, suresh.kumar.kurmi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 30-Dec-22 12:16 PM, bhadanednyaneshwar wrote:
> MSO eDP is not supported on pipe C and D. Added a test condition
> to prevent tests from execution on pipe C and D.This condition was
> missed for cursor-size-change,cursor-alpha-opaque and
> cursor-alpha-transparent testcases.
> 
> Inside require_cursor_size() checks first for eligiblity to igt commit
> using test buffer.For MSO eDP, It is fail to commit for pipe C/pipe D
> and require_cursor_size() return non zero value. So it will skip
> the dynamic testcase for pipe C and D.
> 
> Signed-off-by: bhadanednyaneshwar <dnyaneshwar.bhadane@intel.com>
> ---
>   tests/kms_cursor_crc.c | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 17f294d6..d8fb9c0d 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -786,7 +786,12 @@ static void run_tests_on_pipe(data_t *data)
>   	igt_subtest_with_dynamic("cursor-size-change") {
>   		for_each_pipe(&data->display, pipe) {
>   			data->pipe = pipe;
> -
> +			create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
 >> Instead of creating cursor_fb in each function, we can have
igt_fixture {
	create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
}
moved up and only have
if (require_cursor_size()) check in each subtest.

> +			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> +				igt_debug("Cursor size %dx%d not supported by driver\n",
> +					  data->cursor_max_w, data->cursor_max_h);
> +				continue;
> +			}
>   			igt_dynamic_f("pipe-%s-%s",
>   				      kmstest_pipe_name(pipe),
>   				      data->output->name)
> @@ -800,7 +805,12 @@ static void run_tests_on_pipe(data_t *data)
>   	igt_subtest_with_dynamic("cursor-alpha-opaque") {
>   		for_each_pipe(&data->display, pipe) {
>   			data->pipe = pipe;
> -
> +			create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
> +			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> +				igt_debug("Cursor size %dx%d not supported by driver\n",
> +					  data->cursor_max_w, data->cursor_max_h);
> +				continue;
> +			}
>   			igt_dynamic_f("pipe-%s-%s",
>   				      kmstest_pipe_name(pipe),
>   				      data->output->name)
> @@ -814,7 +824,12 @@ static void run_tests_on_pipe(data_t *data)
>   	igt_subtest_with_dynamic("cursor-alpha-transparent") {
>   		for_each_pipe(&data->display, pipe) {
>   			data->pipe = pipe;
> -
> +			create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
> +			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> +				igt_debug("Cursor size %dx%d not supported by driver\n",
> +					  data->cursor_max_w, data->cursor_max_h);
> +				continue;
> +			}
>   			igt_dynamic_f("pipe-%s-%s",
>   				      kmstest_pipe_name(pipe),
>   				      data->output->name)

-- 
~Swati Sharma
