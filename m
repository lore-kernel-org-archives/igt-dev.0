Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B96A10E3F0
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 18:31:32 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id tz12so76113509ejc.9
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Jan 2023 10:31:32 -0800 (PST)
Message-ID: <7883e380-4454-11c8-154d-0a0c6b5baf14@gmail.com>
Date: Tue, 3 Jan 2023 20:31:24 +0200
MIME-Version: 1.0
Content-Language: en-US
To: bhadanednyaneshwar <dnyaneshwar.bhadane@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221230064638.155300-1-dnyaneshwar.bhadane@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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
Reply-To: juhapekka.heikkila@gmail.com
Cc: chaitanya.kumar.borah@intel.com, suresh.kumar.kurmi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Dnyaneshwar,

On 30.12.2022 8.46, bhadanednyaneshwar wrote:
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
> +			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> +				igt_debug("Cursor size %dx%d not supported by driver\n",
> +					  data->cursor_max_w, data->cursor_max_h);
> +				continue;
> +			}

Would it work if instead of above checking you would use 
igt_pipe_connector_valid(..)? igt_pipe_connector_valid is using bits 
coming from encoder so I think it might work for this case and it would 
be much faster to check.

/Juha-Pekka

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
