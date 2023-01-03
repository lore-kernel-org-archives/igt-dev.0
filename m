Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE0210E3EB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 17:41:43 +0000 (UTC)
Date: Tue, 3 Jan 2023 18:41:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y7Ro0+SvP+Umahg8@kamilkon-desk1>
References: <20221230064638.155300-1-dnyaneshwar.bhadane@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221230064638.155300-1-dnyaneshwar.bhadane@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_crc: Add Gaurd for MSO eDP
 for Pipe C and D
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: dnyaneshwar.bhadane@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

one quick nit for you subject (commit description):

tests/kms_cursor_crc: Add Gaurd for MSO eDP for Pipe C and D
--------------------- ^ --^ ------------------- ^
s/Add/add/
s/Gaurd/guard/

but imho better say explicitly that you skip, so better:

tests/kms_cursor_crc: skip subtests for MSO eDP on pipe C and D

Regards,
Kamil

On 2022-12-30 at 12:16:38 +0530, bhadanednyaneshwar wrote:
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
>  tests/kms_cursor_crc.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 17f294d6..d8fb9c0d 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -786,7 +786,12 @@ static void run_tests_on_pipe(data_t *data)
>  	igt_subtest_with_dynamic("cursor-size-change") {
>  		for_each_pipe(&data->display, pipe) {
>  			data->pipe = pipe;
> -
> +			create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
> +			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> +				igt_debug("Cursor size %dx%d not supported by driver\n",
> +					  data->cursor_max_w, data->cursor_max_h);
> +				continue;
> +			}
>  			igt_dynamic_f("pipe-%s-%s",
>  				      kmstest_pipe_name(pipe),
>  				      data->output->name)
> @@ -800,7 +805,12 @@ static void run_tests_on_pipe(data_t *data)
>  	igt_subtest_with_dynamic("cursor-alpha-opaque") {
>  		for_each_pipe(&data->display, pipe) {
>  			data->pipe = pipe;
> -
> +			create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
> +			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> +				igt_debug("Cursor size %dx%d not supported by driver\n",
> +					  data->cursor_max_w, data->cursor_max_h);
> +				continue;
> +			}
>  			igt_dynamic_f("pipe-%s-%s",
>  				      kmstest_pipe_name(pipe),
>  				      data->output->name)
> @@ -814,7 +824,12 @@ static void run_tests_on_pipe(data_t *data)
>  	igt_subtest_with_dynamic("cursor-alpha-transparent") {
>  		for_each_pipe(&data->display, pipe) {
>  			data->pipe = pipe;
> -
> +			create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
> +			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> +				igt_debug("Cursor size %dx%d not supported by driver\n",
> +					  data->cursor_max_w, data->cursor_max_h);
> +				continue;
> +			}
>  			igt_dynamic_f("pipe-%s-%s",
>  				      kmstest_pipe_name(pipe),
>  				      data->output->name)
> -- 
> 2.35.1
> 
