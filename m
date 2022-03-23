Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8573710E163
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 13:51:57 +0000 (UTC)
Date: Wed, 23 Mar 2022 14:51:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yjsl+UZ3DFgTaLz+@kamilkon-DESK1>
References: <20220321131205.267500-1-priyanka.dandamudi@intel.com>
 <20220321131205.267500-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321131205.267500-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] prime_self_import: Add description
 for test
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

Hi Priyanka,

Dnia 2022-03-21 at 18:42:04 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add description for test.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  tests/prime_self_import.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/prime_self_import.c b/tests/prime_self_import.c
> index 38a55439..a56ec313 100644
> --- a/tests/prime_self_import.c
> +++ b/tests/prime_self_import.c
> @@ -442,6 +442,8 @@ igt_main
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +		igt_describe_f("Verify PRIME_HANDLE_TO_FD functionality in"
> +				" different scenarios:%s", tests[i].name);

Imho this doesn't add much explanation to test, so either keep
it short, like "Verify prime import/export with %s", or add
description to tests[] and print tests[i].idescription

>  		igt_subtest(tests[i].name)
>  			tests[i].fn();
>  	}
> -- 
> 2.25.1
> 
Regards,
Kamil
