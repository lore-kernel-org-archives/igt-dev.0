Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF6DC88E50
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 07:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76E810E131;
	Mon, 14 Sep 2026 07:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="wiLIr9Bi";
	dkim-atps=neutral
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E804910E131
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2026 07:50:00 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hjy3n2mcxz8spJ;
 Mon, 14 Sep 2026 09:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1789372197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVff+eiG3qLeW8bv7W8onGf7CsHjpCvLaMGKOhN8DVM=;
 b=wiLIr9BibX5Re3Nhc+zjMhGSfG5ooErlXc76cTksbLuvO3OnkDuVz8pYdjCJloq0fvnOWk
 aB646cOYonQSEckcI1cb68zeW5oduHenJAECBp0+6Uxhf/CQ8qLr7a/pHpldbVHopQdq57
 UYJyE8cqYf1Jan7VcjKe7fzhYoC8seflJDyMaYAIv5MZgumtBbLUCDbG8zPav9qE//rMet
 sHxv1iR6OEWRTwUz3dNc7p4JElbx8/N+jXYymMZ+XaXeoqiYtF7haSDWUDg63jbGtpIKAW
 WYaXMD1l3Z/YXichHmyz6wOowtmWjoNcWQigDfrax1JKTXoh1xPz2O7mzSHF1g==
Message-ID: <6ce6284e51aa556b326c4d26d1e82cbe79603b6c.camel@mailbox.org>
Subject: Re: [PATCH i-g-t,v3 3/9] lib/dsc: Add
 igt_get_dsc_sink_compressed_bpp()
From: Manuel Ebner <manuelebner@mailbox.org>
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com
Date: Mon, 14 Sep 2026 09:49:53 +0200
In-Reply-To: <20260911210709.943683-4-swati2.sharma@intel.com>
References: <20260911210709.943683-1-swati2.sharma@intel.com>
 <20260911210709.943683-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: bdx6k3prk7iupj77h5g58mxexpf7uxzj
X-MBO-RS-ID: dd53f620f1bbc666399
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

Hi

On Sat, 2026-09-12 at 02:37 +0530, Swati Sharma wrote:
> Add a helper to read the active pipe's compressed BPP from
> `i915_display_info` debugfs.
>=20
> v2: Rebase
>=20
> Assisted-by: GitHub Copilot
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
> =C2=A0lib/igt_dsc.c | 38 ++++++++++++++++++++++++++++++++++++++
> =C2=A0lib/igt_dsc.h |=C2=A0 1 +
> =C2=A02 files changed, 39 insertions(+)
>=20
> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
> index a1d98500a..0f938284e 100644
> --- a/lib/igt_dsc.c
> +++ b/lib/igt_dsc.c
> @@ -378,3 +378,41 @@ int igt_get_dsc_sink_max_slice_count(int drmfd, char=
 *connector_name)
> =C2=A0
> =C2=A0	return max_slice_count;
> =C2=A0}
> +
> +/**
> + * igt_get_dsc_sink_compressed_bpp:
> + * @drmfd: A drm file descriptor
> + * @pipe: display pipe
> + *
> + * Returns: The dsc sink compressed bpp.

Most kerneldocs have 'Returns '
 * Returns the dsc sink compressed bpp.
but that's a nitpick.

> + */
> +float igt_get_dsc_sink_compressed_bpp(int drmfd, enum pipe pipe)
> +{
> +	char buf[8192];
> +	char dest[20];

Could you replace 8192 and 20 with sizeof() or a #define value?

> [...]

Thanks
 Manuel
