Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D263018AB02
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 17:11:03 +0000 (UTC)
Date: Wed, 3 Aug 2022 19:11:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YuqsJLSLSde0H3Qg@kamilkon-desk1>
References: <20220803052654.98827-1-tales.aparecida@gmail.com>
 <20220803052654.98827-4-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220803052654.98827-4-tales.aparecida@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/kselftests: return non-zero on
 open(kmsg) failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tales Aparecida <tales.aparecida@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Tales,

On 2022-08-03 at 02:26:53 -0300, Tales Aparecida wrote:
> Previously igt_kselftest_begin() always returned 0.
> Return non-zero if failed to open kmsg, instead.
> 
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---
>  lib/igt_kmod.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index bde0461a..63636243 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -933,6 +933,8 @@ int igt_kselftest_begin(struct igt_kselftest *tst)
>  	igt_require(err == 0 || err == -ENOENT);
>  
>  	tst->kmsg = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
> +	if (tst->kmsg < 0)
> +		return 1;


This is used everywhere in dumping error messages, for example
in igt_kselftest_execute() there is:
	if (err)
		kmsg_dump(tst->kmsg);

so leaving this as is may be dangerous. So either fdup on stderr
or use
	igt_reguire(test->kmsg >= 0);

Regards,
Kamil

>  
>  	return 0;
>  }
> -- 
> 2.37.0
> 
