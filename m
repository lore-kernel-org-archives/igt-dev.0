Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBD410E0BB
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 15:54:08 +0000 (UTC)
Date: Thu, 31 Aug 2023 17:54:03 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230831175403.1cd39cab@maurocar-mobl2>
In-Reply-To: <20230831152200.1192557-3-bhanuprakash.modem@intel.com>
References: <20230831152200.1192557-1-bhanuprakash.modem@intel.com>
 <20230831152200.1192557-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t 2/2] testplan/kms: Make documentation is
 mandatory for all kms subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 31 Aug 2023 20:52:00 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> As testplan documentation is ready for all kms tests, update the
> testplan config to make sure we are not missing the documentation
> all the kms tests.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  docs/testplan/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index e838f2eb1..433464dc8 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -31,13 +31,13 @@ xe_test_dict = {
>  if build_xe
>  	test_dict = {
>  		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
> -		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
> +		'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist },
>  		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
>  	    }
>  else
>  	test_dict = {
>  	      'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
> -	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
> +	      'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist }
>  	    }
>  endif
>  
