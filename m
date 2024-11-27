Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4656CD690E5
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 08:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F5F10EB9C;
	Thu, 28 Nov 2024 08:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dragonic.eu header.i=@dragonic.eu header.b="Js9cCsMa";
	dkim-atps=neutral
Received: from k11.unixstorm.org (k11.unixstorm.org [91.227.122.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBC710EB38
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 15:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dragonic.eu
 ; s=x;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KzOYA25BsrIyd1dnJPYwbXKdeVjTb3OS+1MfhRwY/jQ=; b=Js9cCsMa+ZaOPBtq57SqkB1J0m
 oWdsuNtS/Jq8LsANfjk6w7GHB4TunU4BKAumIs+e/0GKed6vFwBNrtUww/oV82LetjWSOnhxhCJf3
 DZ/5bZu3JPtSWGJ7X0IE3UzDneCqvGOlo1mIdiyXGOcaXTQ3pOpaXsMswIt1C3urQGou4LchgXg1o
 C0Vg9gs6ooqGwdPv2ElAHfH0teCMFsU9Fd42a2OSdCKajk5eNhU5l61OLlZajP9XntvnR9BwKhobX
 GKCqfugdrtMmkKCmzS8YtOOcF3acVYDYn6nVafu2iAsjDnNY5Kc3APSCS56w476KOy1xBggkYJQkd
 M/c3O3+A==;
Received: from 037008241088.gdansk.vectranet.pl ([37.8.241.88]
 helo=folkvangr.lan)
 by k11.unixstorm.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2-12-g29d01ae2a) (envelope-from <rk@dragonic.eu>)
 id 1tGJiH-00036u-2e; Wed, 27 Nov 2024 16:12:21 +0100
Message-ID: <3c1808f58179c740c953aa8d19b7dc4275b5e9dd.camel@dragonic.eu>
Subject: Re: [i-g-t,v2,2/4] runner/executor: Limit reading dmesg to chunks
From: Ryszard Knop <rk@dragonic.eu>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Karol Krol
 <karol.krol@intel.com>,  Ewelina Musial <ewelina.musial@intel.com>
Date: Wed, 27 Nov 2024 16:12:13 +0100
In-Reply-To: <20241120183208.146299-3-kamil.konieczny@linux.intel.com>
References: <20241120183208.146299-3-kamil.konieczny@linux.intel.com>
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

LGTM, with one question below.

Reviewed-by: Ryszard Knop <rk@dragonic.eu>

On Wed, 2024-11-20 at 19:32 +0100, Kamil Konieczny wrote:
> There was no disk limit checks in reading kernel dmesg and that
> could lead to writing really huge dumps longer than 400MB,
> greatly exceeding disk limits used by CI and hardly useful for
> developers. Make a dmesg dumping in chunks, size depending on
> number of CPUs present, with a minimum of 64KB.
> This could also allow to kick in disk limits checks if a driver
> starts spilling messages into dmesg.
>=20
> v2: correct size at last dump, also inform user about exceeding
> =C2=A0 limits (Kamil)
>=20
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/129
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Karol Krol <karol.krol@intel.com>
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
> =C2=A0runner/executor.c | 64 ++++++++++++++++++++++++++++++++++++++++----=
---
> =C2=A01 file changed, 55 insertions(+), 9 deletions(-)
>=20
> diff --git a/runner/executor.c b/runner/executor.c
> index e4d1fc323..a5b5c0eab 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -585,13 +585,14 @@ void close_outputs(int *fds)
> =C2=A0}
> =C2=A0
> =C2=A0/* Returns the number of bytes written to disk, or a negative numbe=
r on error */
> -static long dump_dmesg(int kmsgfd, int outfd)
> +static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
> =C2=A0{
> =C2=A0	/*
> =C2=A0	 * Write kernel messages to the log file until we reach
> -	 * 'now'. Unfortunately, /dev/kmsg doesn't support seeking to
> -	 * -1 from SEEK_END so we need to use a second fd to read a
> -	 * message to match against, or stop when we reach EAGAIN.
> +	 * 'now' or we read at least size bytes. Unfortunately,
> +	 * /dev/kmsg doesn't support seeking to -1 from SEEK_END
> +	 * so we need to use a second fd to read a message to
> +	 *=C2=A0 match against, or stop when we reach EAGAIN.
> =C2=A0	 */
> =C2=A0
> =C2=A0	int comparefd;
> @@ -606,6 +607,9 @@ static long dump_dmesg(int kmsgfd, int outfd)
> =C2=A0	if (kmsgfd < 0)
> =C2=A0		return 0;
> =C2=A0
> +	if (size < 0)
> +		return 0;
> +
> =C2=A0	comparefd =3D open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
> =C2=A0	if (comparefd < 0) {
> =C2=A0		errf("Error opening another fd for /dev/kmsg\n");
> @@ -690,6 +694,13 @@ static long dump_dmesg(int kmsgfd, int outfd)
> =C2=A0			if (seq >=3D cmpseq)
> =C2=A0				return written;
> =C2=A0		}
> +
> +		if (size && written >=3D size) {
> +			if (comparefd >=3D 0)
> +				close(comparefd);
> +
> +			return written;
> +		}
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -883,6 +894,25 @@ static void write_packet_with_canary(int fd, struct =
runnerpacket *packet,
> bool s
> =C2=A0/* TODO: Refactor this macro from here and from various tests to li=
b */
> =C2=A0#define KB(x) ((x) * 1024)
> =C2=A0
> +#if !defined(SIZE_MAX)
> +#define SIZE_MAX (((size_t)-1) ^ (1 << (8 * sizeof(size_t) - 1)))
> +#endif
> +
> +/* Calculates disk limit to use when dumping dmesg, returns:
> + * number > 0	: size of limit to use
> + * number < 0	: negative number when limit exceeded, no more dumping
> + **/
> +static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
> +{
> +	size_t dt =3D limit - disk_usage;
> +
> +	assert(SIZE_MAX > 0);
> +	if (!limit)
> +		return SIZE_MAX; /* no limit */
> +
> +	return dt !=3D 0 ? dt : -1;
> +}
> +
> =C2=A0/*
> =C2=A0 * Returns:
> =C2=A0 *=C2=A0 =3D0 - Success
> @@ -915,6 +945,8 @@ static int monitor_output(pid_t child,
> =C2=A0	unsigned long taints =3D 0;
> =C2=A0	bool aborting =3D false;
> =C2=A0	size_t disk_usage =3D 0;
> +	size_t dmsg_chunk_size =3D 4096 * max_t(size_t, sysconf(_SC_NPROCESSORS=
_ONLN), 16);

Any reason for 4096 here? If it's supposed to be the page size, maybe getpa=
gesize() here?

> +	long dmesgwritten;
> =C2=A0	bool socket_comms_used =3D false; /* whether the test actually use=
s comms */
> =C2=A0	bool results_received =3D false; /* whether we already have test r=
esults that might need
> overriding if we detect an abort condition */
> =C2=A0
> @@ -1240,11 +1272,9 @@ static int monitor_output(pid_t child,
> =C2=A0	socket_end:
> =C2=A0
> =C2=A0		if (kmsgfd >=3D 0 && FD_ISSET(kmsgfd, &set)) {
> -			long dmesgwritten;
> -
> =C2=A0			time_last_activity =3D time_now;
> =C2=A0
> -			dmesgwritten =3D dump_dmesg(kmsgfd, outputs[_F_DMESG]);
> +			dmesgwritten =3D dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_siz=
e);
> =C2=A0			if (settings->sync)
> =C2=A0				fdatasync(outputs[_F_DMESG]);
> =C2=A0
> @@ -1482,7 +1512,8 @@ static int monitor_output(pid_t child,
> =C2=A0					asprintf(abortreason, "Child refuses to die, tainted
> 0x%lx.", taints);
> =C2=A0				}
> =C2=A0
> -				dump_dmesg(kmsgfd, outputs[_F_DMESG]);
> +				dmsg_chunk_size =3D calc_last_dmesg_chunk(settings-
> >disk_usage_limit, disk_usage);
> +				dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
> =C2=A0				if (settings->sync)
> =C2=A0					fdatasync(outputs[_F_DMESG]);
> =C2=A0
> @@ -1508,9 +1539,24 @@ static int monitor_output(pid_t child,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	dump_dmesg(kmsgfd, outputs[_F_DMESG]);
> +	dmsg_chunk_size =3D calc_last_dmesg_chunk(settings->disk_usage_limit, d=
isk_usage);
> +	dmesgwritten =3D dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size)=
;
> =C2=A0	if (settings->sync)
> =C2=A0		fdatasync(outputs[_F_DMESG]);
> +	if (dmesgwritten > 0) {
> +		disk_usage +=3D dmesgwritten;
> +		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_li=
mit) {
> +			char disk[1024];
> +
> +			snprintf(disk, sizeof(disk), "igt_runner: disk limit exceeded at dmes=
g
> dump, %ld > %ld\n", disk_usage, settings->disk_usage_limit);
> +			if (settings->log_level >=3D LOG_LEVEL_NORMAL) {
> +				outf("%s", disk);
> +				fflush(stdout);
> +			} else if (killed) {
> +				errf("%s", disk);
> +			}
> +		}
> +	}
> =C2=A0
> =C2=A0	free(buf);
> =C2=A0	free(outbuf);

