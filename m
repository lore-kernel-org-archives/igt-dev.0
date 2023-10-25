Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA1610E61D
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 09:56:42 +0000 (UTC)
Date: Wed, 25 Oct 2023 11:56:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231025095622.q6mmkda4h4km54fp@kamilkon-desk.igk.intel.com>
References: <20231024141855.160633-1-mauro.chehab@linux.intel.com>
 <20231024141855.160633-8-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231024141855.160633-8-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] runner/runner_tests: change a regex
 to match case-insensitive
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,
On 2023-10-24 at 16:11:10 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> As regular expressions are now case-insensitive, change an
> unit test to verify that case-insensitive logic is working
> as expected.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  runner/runner_tests.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> index 11ff05bc0e7e..c35668bc8f0e 100644
> --- a/runner/runner_tests.c
> +++ b/runner/runner_tests.c
> @@ -1812,7 +1812,7 @@ igt_main
>  
>  	igt_subtest_group {
>  		const char testlisttext[] = "igt@successtest";
> -		const char blocktext[] = "igt@successtest@first";
> +		const char blocktext[] = "igt@successTEST@first";

Please make a separate test for this, also add Petri on Cc.
You can also consider upper-case test names (or subtests).

Regards,
Kamil

>  		struct job_list *list = malloc(sizeof(*list));
>  		volatile int dirfd = -1;
>  		char dirname[] = "tmpdirXXXXXX";
> -- 
> 2.41.0
> 

