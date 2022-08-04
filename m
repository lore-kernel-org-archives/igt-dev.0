Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F668A366F
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Aug 2022 18:09:38 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4LzGw245qMzDqQF
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Aug 2022 18:09:38 +0000 (UTC)
Message-ID: <0e8c1548-b5cc-4984-f690-812fb8d24e10@riseup.net>
Date: Thu, 4 Aug 2022 15:09:32 -0300
MIME-Version: 1.0
Content-Language: en-US
To: Tales Aparecida <tales.aparecida@gmail.com>,
 igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
References: <20220803052654.98827-1-tales.aparecida@gmail.com>
 <20220803052654.98827-4-tales.aparecida@gmail.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220803052654.98827-4-tales.aparecida@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/kselftests: return non-zero on
 open(kmsg) failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: siqueirajordao@riseup.net, magalilemes00@gmail.com,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Tales,

On 8/3/22 02:26, Tales Aparecida wrote:
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

Wouldn't be better to return the open() error? As open() returns an
errno, it would make it easier to identify what went wrong while opening
kmsg.

Best Regards,
- Maíra Canal

>  
>  	return 0;
>  }
