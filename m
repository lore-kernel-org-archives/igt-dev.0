Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BBE10E2F4
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 06:42:46 +0000 (UTC)
Date: Tue, 16 May 2023 08:42:41 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230516084241.45226c0e@maurocar-mobl2>
In-Reply-To: <20230515163908.50961-1-kamil.konieczny@linux.intel.com>
References: <20230515163908.50961-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] meson: fix testplan building for old
 meson
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

Hi Kamil,

On Mon, 15 May 2023 18:39:08 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Old meson 0.47.2 do not support dictionary adding so fix
> testplan building.
> 
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  docs/testplan/meson.build | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 2014f91b5..6454f2933 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -27,12 +27,15 @@ xe_test_dict = {
>  		 'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
>  	       }
>  
> -test_dict = {
> +if build_xe
> +	test_dict = {
> +		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
> +		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
> +	    }
> +else
> +	test_dict = {
>  	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
>  	    }

This would mean that, for every new driver with documentation we'll
need two changes. It would be even harder if we ever need to add options
to control other driver builds.

Btw, I double-checked that, with meson, we can't update the directory
with something like:

	xe_tests = { 'input': xe_test_config, 'extra_args': check_testlist }
	test_dict['xe_tests'] = xe_tests

As this would generate this error:

	../docs/testplan/meson.build:33:1: ERROR: Assignment target must be an id.
		test_dict['xe_tests'] = xe_tests
	 ^

According to [1]:

	"All objects are immutable, you can not change the contents 
	 of them. You can only create new ones. 
	 (which is what += does behind the scenes)."

[1] https://github.com/mesonbuild/meson/issues/3931#issuecomment-407180830

On other words, with version < 0.48, we're stuck with data or code
duplication.

So, IMO, we should:

	1. Change the gitlab's "build:tests-fedora-oldest-meson" pipeline
	   to honor the minimal version from meson.build file, e. g.:

		$ MESON_MIN_VERSION=$(perl -ne "print \$1 if (m/meson_version\s*:\s*'([^']+)/)" meson.build)
		$ echo $MESON_MIN_VERSION
		>=0.47.2

	2. Update the minimal version to at least 0.48.

Yet, if there are strong reasons why keeping support for such old version,
feel free to add my ack:

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org> # if we can't update meson_version to at least >= 0.48

Regards,
Mauro
