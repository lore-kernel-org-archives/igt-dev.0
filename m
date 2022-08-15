Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ABAA22B9
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 09:41:48 +0000 (UTC)
Date: Mon, 15 Aug 2022 12:40:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Tales Aparecida <tales.aparecida@gmail.com>
Message-ID: <YvoUlRyN0UhU9y/T@platvala-desk.ger.corp.intel.com>
References: <20220812161826.4074-1-tales.aparecida@gmail.com>
 <20220812161826.4074-4-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812161826.4074-4-tales.aparecida@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] lib/kselftests: Skip kselftest
 when opening kmsg fails
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: siqueirajordao@riseup.net, magalilemes00@gmail.com,
 Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Aug 12, 2022 at 01:18:25PM -0300, Tales Aparecida wrote:
> Check for errors in igt_kselftest_begin() during open("/dev/kmsg")
> and fail appropriately, removing the always-zero return of the function.
> 
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---
> 
> Notes:
>     v1 -> v2: Removed return from igt_kselftest_begin and added assertion instead
> 
>  lib/igt_kmod.c | 7 +++----
>  lib/igt_kmod.h | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index bde0461a..6356a3e9 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -922,7 +922,7 @@ int igt_kselftest_init(struct igt_kselftest *tst,
>  	return 0;
>  }
>  
> -int igt_kselftest_begin(struct igt_kselftest *tst)
> +void igt_kselftest_begin(struct igt_kselftest *tst)
>  {
>  	int err;
>  
> @@ -933,8 +933,7 @@ int igt_kselftest_begin(struct igt_kselftest *tst)
>  	igt_require(err == 0 || err == -ENOENT);
>  
>  	tst->kmsg = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
> -
> -	return 0;
> +	igt_assert_fd(tst->kmsg);

Asserting on the open failure leaves the test result as 'FAIL',
indicating a kernel bug. Opening failure rather means there's an
incorrect setup and the test cannot be executed, meaning the correct
result would be 'SKIP'.

In other words, make this an igt_require_fd instead.


-- 
Petri Latvala



>  }
>  
>  int igt_kselftest_execute(struct igt_kselftest *tst,
> @@ -1012,7 +1011,7 @@ void igt_kselftests(const char *module_name,
>  		return;
>  
>  	igt_fixture
> -		igt_require(igt_kselftest_begin(&tst) == 0);
> +		igt_kselftest_begin(&tst);
>  
>  	igt_kselftest_get_tests(tst.kmod, filter, &tests);
>  	igt_subtest_with_dynamic(filter ?: "all") {
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index f98dd29f..0d80451b 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -65,7 +65,7 @@ struct igt_kselftest_list {
>  
>  int igt_kselftest_init(struct igt_kselftest *tst,
>  		       const char *module_name);
> -int igt_kselftest_begin(struct igt_kselftest *tst);
> +void igt_kselftest_begin(struct igt_kselftest *tst);
>  
>  void igt_kselftest_get_tests(struct kmod_module *kmod,
>  			     const char *filter,
> -- 
> 2.37.1
> 
