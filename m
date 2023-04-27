Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E4F10EB30
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 12:05:54 +0000 (UTC)
Message-ID: <2ba8fe54-ed38-eb51-17f7-b601cc5fc15d@intel.com>
Date: Thu, 27 Apr 2023 14:05:50 +0200
MIME-Version: 1.0
Content-Language: en-US
References: <20230427104119.198499-1-mauro.chehab@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <20230427104119.198499-1-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] testplan/meson.build: don't
 generate testlist on cross-compilation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 27.04.2023 12:41, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
> When doing cross-compilation, the binaries won't likely run at
> the builder machine. So, it is not possible to verify if there are
> documentation gaps.
>
> On such cases, skip checking it.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>   docs/testplan/meson.build | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 3347f61876ef..e36713960ccd 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -11,8 +11,13 @@ xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
>   check_testlist = []
>   if build_tests
>   	doc_dependencies = test_executables
> -	# Check if documentation matches the actual tests
> -	check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
> +	# Check if documentation matches the actual tests and tests can run
> +	if not meson.is_cross_build()
> +		build_info += 'Will Check if documentation is in sync with testlist'
> +		check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
> +	else
> +		warning('WARNING: Will not check if documentation is in sync with testlist')
> +	endif

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   else
>   	doc_dependencies = []
>   endif


