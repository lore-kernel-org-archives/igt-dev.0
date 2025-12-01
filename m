Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39B1D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 13:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9831989F5F;
	Mon,  1 Dec 2025 13:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="erJoaxaE";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF9F89F5F
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 13:25:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764595524; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FOKsmKg76PEWteJRZps5zbV+NB3lc8WB78op8nTHpz7ZzmA4RuT2vpPpFpjROCNNq+5lFkejrGtbRQEVhRp9AMSBhF4UmtLOiW9DahAvAZ0KIn5odQ3Ri1wGNmocP3Dz+K/pj4zpGbzMPsy+sN/VHx8JtGfw6emW8a6oaCwibcU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764595524;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Owk0ZWhKFtG9+4xISITEWdAfcxfK5c4Cgy3CWAoR8Yc=; 
 b=RmGP48GHCVfsXprqhjjwh/dTFeknF7ALzpNew7MEkHu+FQXOvbAIQnQZ1c5Lk7iRGF7WQYzM85NhuuTn3MFSpG1nl8LY010S3jV4MdTR9OudoxmoykKZYEgeKABokkcRo4z9G5EPnvYOSav6et5n09CBci2vrDcqV93ip/IeFI0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764595524; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=Owk0ZWhKFtG9+4xISITEWdAfcxfK5c4Cgy3CWAoR8Yc=;
 b=erJoaxaE3Gnu9u9GCRruRmMUPKBzdajqffuUz+7wNaRxd8Xh6PnBKBY786l99kd4
 OGelAqpKivIeei4hVj0avlqpO9elKf+nO4m+FUFclRSdbrDsKn8CzIH5tQHBXf8NB33
 jR6CjC7gPblNGOMZY2rV1ACJ8oyN7zkRgQMFC1Y8=
Received: by mx.zohomail.com with SMTPS id 1764595520861736.85887959044;
 Mon, 1 Dec 2025 05:25:20 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH i-g-t v2 2/3] tests/panthor: Add a test to make sure the
 buffer is zeroed at alloc time
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251201111409.ylxykp74vpewq5p6@kamilkon-DESK.igk.intel.com>
Date: Mon, 1 Dec 2025 10:25:06 -0300
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?utf-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B8DE2124-771E-4C2B-8752-0B32EF740250@collabora.com>
References: <20251128093858.3844420-1-boris.brezillon@collabora.com>
 <20251128093858.3844420-3-boris.brezillon@collabora.com>
 <20251201111409.ylxykp74vpewq5p6@kamilkon-DESK.igk.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

Hi Kamil,

> On 1 Dec 2025, at 08:14, Kamil Konieczny =
<kamil.konieczny@linux.intel.com> wrote:
>=20
> Hi Boris,
> On 2025-11-28 at 10:38:57 +0100, Boris Brezillon wrote:
>> This covering for this bug [1]. Add an IGT test to make sure we don't
>> hit that again.
>>=20
>> =
[1]https://lore.kernel.org/20251107171214.1186299-1-boris.brezillon@collab=
ora.com
>>=20
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>=20
> I merged 1/3 and this one,
>=20
> Regards,
> Kamil
>=20

I=E2=80=99ll have a look on 2/3 today.

=E2=80=94 Daniel

