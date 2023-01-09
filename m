Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367C610E0A1
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 15:19:45 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id m21so13014944edc.3
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Jan 2023 07:19:45 -0800 (PST)
Message-ID: <2ea75407-5207-1489-1bca-ef371d1c6f71@gmail.com>
Date: Mon, 9 Jan 2023 17:19:36 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221230064638.155300-1-dnyaneshwar.bhadane@intel.com>
 <20230109064905.280139-1-dnyaneshwar.bhadane@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230109064905.280139-1-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t v2] tests/kms_cursor_crc: Skip for invalid
 pipe connector connection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: juha-pekka.heikkila@intel.com, chaitanya.kumar.borah@intel.com,
 suresh.kumar.kurmi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 9.1.2023 8.49, Dnyaneshwar Bhadane wrote:
> Added a skip condition that checks for the valid pipe connection. This is a
> generic skip on pipe which checks for valid connector connection mask bit.
> This condition helps to skip tests for MSO panels on non supported pipes
> (C and D).This condition was missed for cursor-size-change,
> cursor-alpha-opaque and cursor-alpha-transparent testcases.
> 
> --v2
> - Change commit messege  from "Add Gaurd for MSO eDP for Pipe C and D"
> to "Skip condition for non valid pipe connector connection" [Kamil]
> - skip condition using igt_pipe_connector_valid() [Juha-Pekka]
> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> 
> ---
>   tests/kms_cursor_crc.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 17f294d6..87497b9e 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -786,6 +786,13 @@ static void run_tests_on_pipe(data_t *data)
>   	igt_subtest_with_dynamic("cursor-size-change") {
>   		for_each_pipe(&data->display, pipe) {
>   			data->pipe = pipe;
> +			
^^
in beginning of these blocks you have extra tab characters which will 
produce notifications about white space errors, leave just new line here 
but no tabs.

With those fixed
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

> +			if(!igt_pipe_connector_valid(pipe, data->output)) {
> +				igt_debug("Invalid connector on pipe-%s-%s",
> +				      kmstest_pipe_name(pipe),
> +				      data->output->name);
> +				continue;
> +			}
>   
>   			igt_dynamic_f("pipe-%s-%s",
>   				      kmstest_pipe_name(pipe),
> @@ -800,6 +807,13 @@ static void run_tests_on_pipe(data_t *data)
>   	igt_subtest_with_dynamic("cursor-alpha-opaque") {
>   		for_each_pipe(&data->display, pipe) {
>   			data->pipe = pipe;
> +			
> +			if(!igt_pipe_connector_valid(pipe, data->output)) {
> +				igt_debug("Invalid connector on pipe-%s-%s",
> +				      kmstest_pipe_name(pipe),
> +				      data->output->name);
> +				continue;
> +			}
>   
>   			igt_dynamic_f("pipe-%s-%s",
>   				      kmstest_pipe_name(pipe),
> @@ -814,6 +828,13 @@ static void run_tests_on_pipe(data_t *data)
>   	igt_subtest_with_dynamic("cursor-alpha-transparent") {
>   		for_each_pipe(&data->display, pipe) {
>   			data->pipe = pipe;
> +			
> +			if(!igt_pipe_connector_valid(pipe, data->output)) {
> +				igt_debug("Invalid connector on pipe-%s-%s",
> +				      kmstest_pipe_name(pipe),
> +				      data->output->name);
> +				continue;
> +			}
>   
>   			igt_dynamic_f("pipe-%s-%s",
>   				      kmstest_pipe_name(pipe),
