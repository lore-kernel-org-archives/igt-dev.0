Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236C8D690E2
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 08:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D8210E30D;
	Thu, 28 Nov 2024 08:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dragonic.eu header.i=@dragonic.eu header.b="UVtCigp0";
	dkim-atps=neutral
Received: from k11.unixstorm.org (k11.unixstorm.org [91.227.122.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A7410E0F5
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 15:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dragonic.eu
 ; s=x;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VZeg8A3GrLGZqePYwXP1S4aRmt5KXjrIbCiWP0ZYlyw=; b=UVtCigp0+jjYGBy65DgMHySUax
 FZpMVDryn0GBF2PqQlE8AYF903DcUYx4TwBnYNwgBRfbOQ5Uvh67++tWzfyfB+Cq8aubevBRq8FuT
 AQK8stqBWvyMy40YzGgO1zVRzQ0U7GoE/nfNsxXtXbR8E+oEATswQVGaFwEjSvQxR0mZ591A5IJXO
 wwWWj4EA1UV7G/5P1sj1cakgW5PJfLUQ6rsksFxnn2ReOKjQR/eL1DRn95MWg2Vh/X81QX7LEFrau
 Ml1jUR1Mtu5j/vcBlD7t1O2NmhbLlfX1BJbw/b7p2kHyjn4ce7L8LrG1lJGjs7Len8qsBlRDUSkZD
 ZWPIMxQg==;
Received: from 037008241088.gdansk.vectranet.pl ([37.8.241.88]
 helo=folkvangr.lan)
 by k11.unixstorm.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2-12-g29d01ae2a) (envelope-from <rk@dragonic.eu>)
 id 1tGJbT-00077f-2k; Wed, 27 Nov 2024 16:05:19 +0100
Message-ID: <8383c51498ad6b3586afbc48523727a1db3b0e15.camel@dragonic.eu>
Subject: Re: [i-g-t,v2,1/4] runner/executor: Check for error at writing
 dmesg dump
From: Ryszard Knop <rk@dragonic.eu>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Date: Wed, 27 Nov 2024 16:05:11 +0100
In-Reply-To: <20241120183208.146299-2-kamil.konieczny@linux.intel.com>
References: <20241120183208.146299-2-kamil.konieczny@linux.intel.com>
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

On Wed, 2024-11-20 at 19:32 +0100, Kamil Konieczny wrote:
> In processing kernel dmesg there are checks for error at reading
> so add also one for writing.
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> =C2=A0runner/executor.c | 29 ++++++++++++++++++++++++++---
> =C2=A01 file changed, 26 insertions(+), 3 deletions(-)
>=20
> diff --git a/runner/executor.c b/runner/executor.c
> index ac73e1dde..e4d1fc323 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -600,7 +600,7 @@ static long dump_dmesg(int kmsgfd, int outfd)
> =C2=A0	bool underflow_once =3D false;
> =C2=A0	char cont;
> =C2=A0	char buf[2048];
> -	ssize_t r;
> +	ssize_t r, w;
> =C2=A0	long written =3D 0;
> =C2=A0
> =C2=A0	if (kmsgfd < 0)
> @@ -654,9 +654,32 @@ static long dump_dmesg(int kmsgfd, int outfd)
> =C2=A0			return written;
> =C2=A0		}
> =C2=A0
> -		write(outfd, buf, r);
> -		written +=3D r;
> +		w =3D write(outfd, buf, r);
> +		if (w < r) {

You could rewrite this entire block to have a single write call, or to hand=
le multiple
interrupts/better error messages:

int encountered_errors =3D 0;
while (written < r) {
  int w =3D write(outfd, buf + written, r - written);
  if (w > 0) {
    written +=3D w;
    continue;
  }

  encountered_errors +=3D 1;
  if (encountered_errors >=3D 100) {
    errf("Too many errors while writing out dmesg, aborting\n");
    break;
=C2=A0 }

  // Recoverable errors:
  if ((errno =3D=3D EINTR) || (errno =3D=3D EAGAIN)) continue;

  // Non-recoverable:
  errf("Error writing out dmesg (written %ld < %ld bytes): %s\n", written, =
r, strerror(errno));
  break;
}

> +			if (w =3D=3D -1 && errno =3D=3D EINTR)
> +				w =3D write(outfd, buf, r);
> +
> +			if (w < r && w >=3D 0)
> +				w +=3D write(outfd, buf + w, r - w);
> +
> +			if (w < r) {
> +				long err =3D -errno;
> +
> +				if (err) {
> +					errf("Write error while processing dmesg, errno=3D%d %ld <
> %ld\n", errno, w, r);
> +				} else {
> +					errf("Cannot write dmesg chunk: %ld < %ld\n", w, r);
> +					err =3D -1;
> +				}
> =C2=A0
> +				if (comparefd >=3D 0)
> +					close(comparefd);
> +
> +				return err;
> +			}
> +		}
> +
> +		written +=3D r;
> =C2=A0		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
> =C2=A0					=C2=A0=C2=A0=C2=A0 &flags, &seq, &usec, &cont) =3D=3D 4) {
> =C2=A0			/*

