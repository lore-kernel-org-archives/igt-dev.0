Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63941D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 15:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBC910E3F0;
	Mon,  1 Dec 2025 15:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="VRs4JBbe";
	dkim-atps=neutral
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5EA10E3F0
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 15:22:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764602529; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NzDJDLsMvheU6aEfeDCK4lL55P8rXsyZs/id5fwXloMqmaYJtuz4xld1H0BITVgD/vYP6xnuE/mhoqgk7+EsNd+3bi3Dq0qWqaRDAuoms4+osP5kK8xufl7GDd0hzM4Z42qoOsS6eM4m6PEmGrQw2nC6xHV1plX9Lb/fkU1tyPk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764602529;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HfC/eIoEbJeHeOx568+ZS0XQD6t3T3g5HKZU+GcZtBQ=; 
 b=KNgb+d8lGu3HptnVLysqhuoPbbpHFo6Ef0LyYn2cx8RPJU4X/ZwJVZKfUg1ZR41nHYgOgU1L0ORF0n/3ElbUCmqTyhE64s53Cg8OlCR/UAiLnp3Hrxzs9ZBRIDYs6px2iATjhFeFC6gA5vK4DPtQ60Z65Y0JjLx0qpCl295W3u8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764602529; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=HfC/eIoEbJeHeOx568+ZS0XQD6t3T3g5HKZU+GcZtBQ=;
 b=VRs4JBbeNoQMFALVNy6o84//1tAMU11O3knlzCY5WiSJHruM3QraQ4ZOz8AgZzDA
 e5pvl4NbsiuyzGGpgDCg4Wa0LU+OZ0DN1Wd//gKWC69RAoEJ5c+7a0+vfuhbwe/fZ7D
 5okSexwAM18+v2q6AXdJDeE8RBaTRP1bnjv1wVHw=
Received: by mx.zohomail.com with SMTPS id 1764602503234433.9420925830008;
 Mon, 1 Dec 2025 07:21:43 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH i-g-t v2 2/3] tests/panthor: Add a test to make sure the
 buffer is zeroed at alloc time
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251201151933.rmvjwifpfacd6lgu@kamilkon-DESK.igk.intel.com>
Date: Mon, 1 Dec 2025 12:21:28 -0300
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?utf-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <74097CDC-4EA1-464E-B9AC-F0AC2A062E92@collabora.com>
References: <20251128093858.3844420-1-boris.brezillon@collabora.com>
 <20251128093858.3844420-3-boris.brezillon@collabora.com>
 <20251201111409.ylxykp74vpewq5p6@kamilkon-DESK.igk.intel.com>
 <B8DE2124-771E-4C2B-8752-0B32EF740250@collabora.com>
 <20251201151933.rmvjwifpfacd6lgu@kamilkon-DESK.igk.intel.com>
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



> On 1 Dec 2025, at 12:19, Kamil Konieczny =
<kamil.konieczny@linux.intel.com> wrote:
>=20
> Hi Daniel,
> On 2025-12-01 at 10:25:06 -0300, Daniel Almeida wrote:
>> Hi Kamil,
>>=20
>>> On 1 Dec 2025, at 08:14, Kamil Konieczny =
<kamil.konieczny@linux.intel.com> wrote:
>>>=20
>>> Hi Boris,
>>> On 2025-11-28 at 10:38:57 +0100, Boris Brezillon wrote:
>>>> This covering for this bug [1]. Add an IGT test to make sure we =
don't
>>>> hit that again.
>>>>=20
>>>> =
[1]https://lore.kernel.org/20251107171214.1186299-1-boris.brezillon@collab=
ora.com
>>>>=20
>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>>>=20
>>> I merged 1/3 and this one,
>>>=20
>>> Regards,
>>> Kamil
>>>=20
>>=20
>> I=E2=80=99ll have a look on 2/3 today.
>=20
> I merged 1/3 and 2/3, did you mean last one 3/3?
>=20
> Regards,
> Kamil
>=20
>>=20
>> =E2=80=94 Daniel

Yes, the last one, sorry.

=E2=80=94 Daniel=
