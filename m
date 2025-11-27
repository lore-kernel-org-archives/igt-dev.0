Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F12D111A8
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 15:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3281810E025;
	Thu, 27 Nov 2025 15:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jmtELcwB";
	dkim-atps=neutral
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E1110E025
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 15:32:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764257549; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QaOlmVNge6pI4njDFL4zt4aj+JdKl4mL441n6Q+dw35aIymYZyEpD5VTmJMixY6TkHI1RGeJUcxpyBuqmt5Tn7fLdYtRgqRk5Ztly9YOuX5to9/6SbINIJTP21OL5sogIRfL+NTtCT0+3AAQ1Sijo0K1QxjyIm5BxXwyzhcP3rE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764257549;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=RxJx9npMS4zNNe9vBVk7238tZPqN95Yo1TT9wASieDk=; 
 b=eEhzPFBJ3BYmTa52sNIgBT8bQJ7x9j5Fbg2p7qGRFDcqg5w9GkQ+pdNDjTewlw4s1z/qAPnvWQrHH7AfGqrIAtW4UrS3BkZDbTcIU5Q2dO/SFiLHLrCnSfDYyquDcaQzl28Hk0ow1gKq/Bm9LTzTyFgtog0fydRCHnyEC+GbhdA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764257549; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=RxJx9npMS4zNNe9vBVk7238tZPqN95Yo1TT9wASieDk=;
 b=jmtELcwBk3ljhiDh342l/IhvXvNt09CjQySew82Je3DHXRL4GDda+tNVenYtflHZ
 dZARxO4U6KTcmVAWocw24XfJV5IT30n/bgT4trm0Yj+FlJJv8pLjNKoJhpgsgS6ARA+
 OSQqpIdAA5t0zmo0MWHDcknNylo6/Z40FiEUv2hA=
Received: by mx.zohomail.com with SMTPS id 1764257548368107.27712132411125;
 Thu, 27 Nov 2025 07:32:28 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH i-g-t v1 v1 2/3] tests/panthor: Add a test to make sure
 the buffer is zeroed at alloc time
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251126105558.3607460-3-boris.brezillon@collabora.com>
Date: Thu, 27 Nov 2025 12:32:14 -0300
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?utf-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <C7CAAA10-DFA0-4549-B98E-9486EE5F57DA@collabora.com>
References: <20251126105558.3607460-1-boris.brezillon@collabora.com>
 <20251126105558.3607460-3-boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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



> On 26 Nov 2025, at 07:55, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
> This covering for this bug [1]. Add an IGT test to make sure we don't
> hit that again.
>=20
> =
[1]https://lore.kernel.org/20251107171214.1186299-1-boris.brezillon@collab=
ora.com
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> tests/panthor/panthor_gem.c | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>=20
> diff --git a/tests/panthor/panthor_gem.c b/tests/panthor/panthor_gem.c
> index 57cd97e809fd..1566c713f876 100644
> --- a/tests/panthor/panthor_gem.c
> +++ b/tests/panthor/panthor_gem.c
> @@ -66,6 +66,17 @@ igt_main {
> igt_panthor_free_bo(fd, &bo);
> }
>=20
> + igt_describe_f("Check zero-ing of buffer at creation time");
> + igt_subtest("bo_zeroed") {
> + struct panthor_bo bo;
> +
> + igt_panthor_bo_create_mapped(fd, &bo, getpagesize(), 0, 0);
> + igt_assert(bo.map);
> + igt_assert_eq(*((uint32_t *)bo.map), 0);
> +
> + igt_panthor_free_bo(fd, &bo);
> + }
> +
> igt_fixture {
> drm_close_driver(fd);
> }
> --=20
> 2.51.1
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
