Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76505D690E4
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 08:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7FE10EC34;
	Thu, 28 Nov 2024 08:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dragonic.eu header.i=@dragonic.eu header.b="NX4Mec0C";
	dkim-atps=neutral
Received: from k11.unixstorm.org (k11.unixstorm.org [91.227.122.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FED110EB32
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 15:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dragonic.eu
 ; s=x;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DdOSQu0XMZMD4mpwvMDYVlmxFLAJ/nAEsY+CQSnscWQ=; b=NX4Mec0C193QvqSQdUrlutU3xw
 I1iT/QLeP64TYzrsz2xNLyoov28kK87gDNgSpYKpPCaBWGRb8TNc0Ugf1f4lx95UW1jDQf5Hn4Zkk
 PdvaTG2OEHwmM3oKMDsHROP/+BJLng8467++T24xBaqmnZynnVzrT8AXQb0L3z7MKGPjl7O44/vuk
 EGhSLm/a0ocilCZbe52M1uE4O6XhvmalVoUu30G5Dz8TRwpXpEZ35raGEQA9n0wLYN8CO9GovUQcm
 bzMdReNszo0ZmNRTZMfLEbWm0KY/4BjmnfZvu60XYaLJ+LtD8ofBs+0QgQxwfu45ok8WPXz5yaRFY
 cqLgY0aQ==;
Received: from 037008241088.gdansk.vectranet.pl ([37.8.241.88]
 helo=folkvangr.lan)
 by k11.unixstorm.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2-12-g29d01ae2a) (envelope-from <rk@dragonic.eu>)
 id 1tGJ63-000498-0k; Wed, 27 Nov 2024 15:32:51 +0100
Message-ID: <7f89369d20ff0f9dc891f66a460bf73ef2c65eff.camel@dragonic.eu>
Subject: Re: [i-g-t,v2,3/4] runner/executor: Fix error handling at
 terminating test
From: Ryszard Knop <rk@dragonic.eu>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Date: Wed, 27 Nov 2024 15:32:49 +0100
In-Reply-To: <20241120183208.146299-4-kamil.konieczny@linux.intel.com>
References: <20241120183208.146299-4-kamil.konieczny@linux.intel.com>
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
> Instead of just returning and leaking memory and file descriptors
> inform user about an error which occurred and terminate
> gracefully.
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
> =C2=A0runner/executor.c | 8 ++++++--
> =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/runner/executor.c b/runner/executor.c
> index a5b5c0eab..5a4c2e1b2 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1533,8 +1533,12 @@ static int monitor_output(pid_t child,
> =C2=A0			}
> =C2=A0
> =C2=A0			killed =3D next_kill_signal(killed);
> -			if (!kill_child(killed, child))
> -				return -1;
> +			if (!kill_child(killed, child)) {
> +				errf("Error at terminating test with %s, errno=3D%d\n",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 killed =3D=3D SIGQUIT ? "SIGQUIT" : "SIGKIL=
L", errno);
> +				killed =3D -1;
> +				break; /* while */
> +			}
> =C2=A0			time_killed =3D time_now;
> =C2=A0		}
> =C2=A0	}

