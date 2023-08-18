Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A63E10E4FF
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 11:54:48 +0000 (UTC)
Message-ID: <85990200-c88a-2651-1293-a70313e99a74@linux.intel.com>
Date: Fri, 18 Aug 2023 13:54:43 +0200
MIME-Version: 1.0
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 igt-dev@lists.freedesktop.org
References: <20230818113817.155989-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230818113817.155989-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "testplan/kms: Make
 documentation is mandatory for all kms subtests"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: marcin.bernatowicz@intel.com, kamil.konieczny@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 8/18/2023 1:38 PM, Juha-Pekka Heikkila wrote:
> This change broke igt build when building without chamelium
> 
> This reverts commit 00bc4cf384382018ebe6f333e4d53849c883445b.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   docs/testplan/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 433464dc8..e838f2eb1 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -31,13 +31,13 @@ xe_test_dict = {
>   if build_xe
>   	test_dict = {
>   		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
> -		'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist },
> +		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
>   		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
>   	    }
>   else
>   	test_dict = {
>   	      'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
> -	      'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist }
> +	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
>   	    }
>   endif
>   
LGTM, verified build does not fail on docker with chamelium disabled.

Acked-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
