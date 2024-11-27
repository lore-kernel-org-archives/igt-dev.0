Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB385D690E6
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 08:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DA010EC3C;
	Thu, 28 Nov 2024 08:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dragonic.eu header.i=@dragonic.eu header.b="CjXwD2LR";
	dkim-atps=neutral
Received: from k11.unixstorm.org (k11.unixstorm.org [91.227.122.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3DF892AA
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 15:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dragonic.eu
 ; s=x;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cH6jxsUpuTJ4a+5AZsNwIbEOjpMi9br5td2pNAuJ24E=; b=CjXwD2LR0PBr0L/jg3He0qbxzR
 hYjhXbp6QM35h0Gw56g9pUVrXJty2k5Ajx+/ZPRcblx7yl3kHWR8ySQS141ZUvPEi7jx9ePRAGlU+
 6Tq0x4949fopECJ68uS9gJ5MLt15YwwgaFzmvKJ4zBwXYqfYhmR+6Vxx0iH2Ct5QCOZO8CFFFmmnf
 aAnIoxzUvjKK06D8oGUCuA0QGhYx1f1P3x3QnBGsyYSIjeCkBGvNYWGvQZsuV2LQNVn3eiJQ+EsJz
 bs17B5EEt9tK3i7Foj/EkiZOeFwPQTPItKF/PCftuDt7wVV9/+0sBSoky1BpsxnO3e6m3tTt0m3qB
 5DN/Ihww==;
Received: from 037008241088.gdansk.vectranet.pl ([37.8.241.88]
 helo=folkvangr.lan)
 by k11.unixstorm.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2-12-g29d01ae2a) (envelope-from <rk@dragonic.eu>)
 id 1tGJ5m-00044Q-0e; Wed, 27 Nov 2024 15:32:34 +0100
Message-ID: <eeaabf2942b2b9aae33f97dfce0cd0423eedd7f8.camel@dragonic.eu>
Subject: Re: [i-g-t,v2,4/4] runner/executor: Inform about terminating
From: Ryszard Knop <rk@dragonic.eu>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Date: Wed, 27 Nov 2024 15:32:25 +0100
In-Reply-To: <20241120183208.146299-5-kamil.konieczny@linux.intel.com>
References: <20241120183208.146299-5-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-Authenticated-Id: dragoon
X-Mailman-Approved-At: Thu, 28 Nov 2024 08:07:41 +0000
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

LGTM

Reviewed-by: Ryszard Knop <rk@dragonic.eu>

On Wed, 2024-11-20 at 19:32 +0100, Kamil Konieczny wrote:
> Create a message before terminating a running test and
> inform user what is a cause.
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
> =C2=A0runner/executor.c | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/runner/executor.c b/runner/executor.c
> index 5a4c2e1b2..316b81575 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1359,8 +1359,12 @@ static int monitor_output(pid_t child,
> =C2=A0
> =C2=A0				aborting =3D true;
> =C2=A0				killed =3D SIGQUIT;
> -				if (!kill_child(killed, child))
> +				if (!kill_child(killed, child)) {
> +					errf("Error terminating child with %s, errno=3D%d\n",
> +					=C2=A0=C2=A0=C2=A0=C2=A0 killed =3D=3D SIGQUIT ? "SIGQUIT" : "SIGKI=
LL", errno);
> +
> =C2=A0					return -1;
> +				}
> =C2=A0				time_killed =3D time_now;
> =C2=A0
> =C2=A0				continue;
