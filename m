Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E7F10E59F
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 05:15:41 +0000 (UTC)
Message-ID: <91378f11-8b41-1b8d-c962-aa0c099ccc5f@intel.com>
Date: Fri, 13 Oct 2023 10:45:16 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231011092132.66219-1-swati2.sharma@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231011092132.66219-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_sequence: use pipe_name
 followed by output_name
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


On 10/11/2023 2:51 PM, Swati Sharma wrote:
> Use pipe_name followed by output_name.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_sequence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index c6d6dea00..6716d3860 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -320,7 +320,7 @@ igt_main
>   					if (!i915_pipe_output_combo_valid(&data.display))
>   						continue;
>   
> -					igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(p)) {
> +					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), igt_output_name(output)) {
>   						data.pipe = p;
>   						data.output = output;
>   						data.flags = m->flags;
