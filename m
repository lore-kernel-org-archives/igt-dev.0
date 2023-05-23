Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BD210E3DE
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:44:49 +0000 (UTC)
Date: Tue, 23 May 2023 08:44:43 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230523084443.753e6491@maurocar-mobl2>
In-Reply-To: <20230523063243.669540-83-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
 <20230523063243.669540-83-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V3 82/82] testplan/kms: Make documentation is
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

On Tue, 23 May 2023 12:02:43 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> As testplan documentation is ready for all kms tests, update the
> testplan config to make sure we are not missing the documentation
> all the kms tests.
> 
> V2, V3, V4: - Rebase
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  docs/testplan/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 6cd44be5c..cca05cf8e 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -31,13 +31,13 @@ xe_test_dict = {
>  if build_xe
>  	test_dict = {
>  		'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
> -		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
> +		'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist },
>  		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
>  	    }
>  else
>  	test_dict = {
>  	      'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
> -	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
> +	      'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist }
>  	    }
>  endif
>  
