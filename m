Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C5610E1F7
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 14:50:20 +0000 (UTC)
Date: Tue, 3 Jan 2023 15:50:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y7RAqN8nGYF8IOKr@kamilkon-desk1>
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
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Suresh Kumar Kurmi <suresh.kumar.kurmi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2022-12-30 at 12:16:38 +0530, bhadanednyaneshwar wrote:
> MSO eDP is not supported on pipe C and D. Added a test condition
------------------------------------------- ^
> to prevent tests from execution on pipe C and D.This condition was
> missed for cursor-size-change,cursor-alpha-opaque and
> cursor-alpha-transparent testcases.

Please improve a little commit message, you just added skips for
not supported cursors in those subtests.

> 
> Inside require_cursor_size() checks first for eligiblity to igt commit
> using test buffer.For MSO eDP, It is fail to commit for pipe C/pipe D
> and require_cursor_size() return non zero value. So it will skip
> the dynamic testcase for pipe C and D.

The above paragraph is spelling what you done. Will it only skip
for pipe C and D ? Or any pipe on which it cannot create cursor ?

You can add cc here:

Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Suresh Kumar Kurmi <suresh.kumar.kurmi@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
> 
> Signed-off-by: bhadanednyaneshwar <dnyaneshwar.bhadane@intel.com>
---------------- ^
Please put here your name (look for example for Swati), I guess
it should be

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

but if I guess wrong please put correct one (it is best to put this
in global git config).

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
----------------------- ^
Do you really need this here ? It is used elsewhere within fixup
(there is assert in this function), in other tests below
require_cursor_size is called without create_cursor_fb

> +			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> +				igt_debug("Cursor size %dx%d not supported by driver\n",
> +					  data->cursor_max_w, data->cursor_max_h);
> +				continue;
> +			}

Put newline here.

>  			igt_dynamic_f("pipe-%s-%s",
>  				      kmstest_pipe_name(pipe),
>  				      data->output->name)
> @@ -800,7 +805,12 @@ static void run_tests_on_pipe(data_t *data)
>  	igt_subtest_with_dynamic("cursor-alpha-opaque") {
>  		for_each_pipe(&data->display, pipe) {
>  			data->pipe = pipe;
> -
> +			create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
----------------------- ^
> +			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> +				igt_debug("Cursor size %dx%d not supported by driver\n",
> +					  data->cursor_max_w, data->cursor_max_h);
> +				continue;
> +			}

Put newline here.

>  			igt_dynamic_f("pipe-%s-%s",
>  				      kmstest_pipe_name(pipe),
>  				      data->output->name)
> @@ -814,7 +824,12 @@ static void run_tests_on_pipe(data_t *data)
>  	igt_subtest_with_dynamic("cursor-alpha-transparent") {
>  		for_each_pipe(&data->display, pipe) {
>  			data->pipe = pipe;
> -
> +			create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
----------------------- ^
> +			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
> +				igt_debug("Cursor size %dx%d not supported by driver\n",
> +					  data->cursor_max_w, data->cursor_max_h);
> +				continue;
> +			}

Put newline here.

Regards,
Kamil

>  			igt_dynamic_f("pipe-%s-%s",
>  				      kmstest_pipe_name(pipe),
>  				      data->output->name)
> -- 
> 2.35.1
> 
