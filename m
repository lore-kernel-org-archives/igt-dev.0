Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8893D10F1DA
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Mar 2022 12:57:45 +0000 (UTC)
Message-ID: <c277dc46-3db6-dff3-93fa-bd3258d9fe03@intel.com>
Date: Thu, 31 Mar 2022 18:27:12 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
References: <20220331124836.6186-1-petri.latvala@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220331124836.6186-1-petri.latvala@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Override results for subtests
 even when there's dynamic subtests
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

LGTM.

Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>

On 31-Mar-22 6:18 PM, Petri Latvala wrote:
> igt_runner converts passing test results to warn if a test outputs
> stuff to stderr. It also converts results if kernel logs contain
> warnings to dmesg-warn or dmesg-fail, depending on the test's own
> result.
> 
> Perform this same conversion to subtests even if they contain dynamic
> subtests, now that we have the capability of keeping those around.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> ---
>   runner/resultgen.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 76f9fb7d..6ecf325b 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -1385,10 +1385,8 @@ static void override_results(char *binary,
>   
>   	for (i = 0; i < subtests->size; i++) {
>   		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
> -		if (subtests->subs[i].dynamic_size == 0) {
> -			obj = get_or_create_json_object(tests, piglit_name);
> -			override_result_single(obj);
> -		}
> +		obj = get_or_create_json_object(tests, piglit_name);
> +		override_result_single(obj);
>   
>   		for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
>   			generate_piglit_name_for_dynamic(piglit_name, subtests->subs[i].dynamic_names[k],

-- 
~Swati Sharma
