Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E46606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 17:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=k41baNvp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA8D10E301;
	Thu, 29 Oct 2026 17:09:04 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B47E10E301
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 17:08:03 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TGCQnd3024551
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 17:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=y
 6zHmPi+0ZzCLGs8jn/3/XfQzHQ2pk4TCu5W6oH3lHs=; b=k41baNvpx/SbY1PtJ
 kR+/CRGxxVzQcKKVicWEZ7CVo1Zjzri16xpUkX14B9RRhUvv57E2ortphqWpou6p
 owNahSQ8FHosr4K7zauA9u6yJM9SUOHuDQgHPeX54wER6cE9FJ5f0w3/lQH70xtD
 DDZ2e3fJCDTMqONUAHWHjDObCPLRwyy+Iohn3f090NQAX2Ruv2bMHwCIuBzBLDah
 4GB9zOyjg8z5IIMlqc4xKvV5G84NBMjruXjXHizZIykutF9senElthS6RwexQ84f
 2M/sIXxjcuex85KsUAYTd2ufauIXLQ0VYymVKA/iF2Fw1c7qHgFEDsHYbdUCAOsP
 wuGMA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hkvbj8pbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 17:08:01 +0000 (GMT)
Received: from np-a-belle.kl.imgtec.org (172.25.6.177) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 17:08:00 +0000
Message-ID: <b62f13bd6feaf945cd7d0b3ce5c8ff11a40550d5.camel@imgtec.com>
Subject: Re: [PATCH i-g-t v2 0/3] imagination: Update allocation flags for
 buffers in submit job
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Brajesh Gupta <brajesh.gupta@imgtec.com>, "Development mailing list for
 IGT GPU Tools" <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>
Date: Thu, 29 Oct 2026 17:07:32 +0000
In-Reply-To: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
References: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: tSzL6ysW2cfcPeTmrvdQ6K7qCZfO8lq8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NyBTYWx0ZWRfX4ReMtcTr/R0E
 d7RdfkrX1UBonYHsybB3rxrc+AeVwVnF9tMSZbl4kNfwmzaYT3EiTznichwMv5oSQfIr5gyqGs7
 zcz5thK/7wJeRsSRJ1lfDnvZdcJaDBDm3yR3VnAJlbsEWtkq+K1+blavPVvj4o6tpOYQiolRpuy
 c5z1livR4nP0jFKeEra3bkDY7E7oOwb7hEfnUTls995sWLUR39b2buXTXuUlY6bXo4nZrERifyz
 6gqF7/A4nGaTQnH7HOwK2Pmr39Y9IDQJjW8SmuIKlIX1n3aFIwBoJk42RgTCBV9A1WRTQXGaVPU
 pJPHA/XTNjamXMtTdzneDfphdYyqJHpvgW49Rn0Zmq+Kcz29SsERrYqVvI+w1k49na1T2gXliVe
 XVXqKReoX3vWaSq82LuAKIYGNVv2/U3u2/Oen2mJpxD1FKfqRN+tknNZixlOESVtslsMjSN7ix1
 B9TmsFqTS2vJmOXXy3A==
X-Proofpoint-GUID: tSzL6ysW2cfcPeTmrvdQ6K7qCZfO8lq8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NyBTYWx0ZWRfX2deRIsXBx8ps
 f4eZvDc5adt2VU2j0PKVMPQ32Y/nOT/5i6QAUfRLah0ZuceNFxzW2svIr+nn/PGmcHcmGu9L5wI
 3Y4nY7CTvVDNGDgNNLVuIaBQbSL4eVY=
X-Authority-Analysis: v=2.4 cv=NvdE4MdJ c=1 sm=1 tr=0 ts=6ae37d71 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=2JH569OHYJkA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=N93Xhe3uVhPD9u9-aIEA:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Brajesh,

On Thu, 2026-10-29 at 18:03 +0530, Brajesh Gupta wrote:
> Update BO allocation flags to match expectation:

Sorry, what would those expectations be with respect to upstream?=C2=A0

I take IGT has always been broken, but nothing has really changed recently =
with
regard to PM/FW protect?!

Perhaps it's worth adding a description of what makes (or doesn't) the flag
needed in patch [3/3] commit message, especially as we expect to extend the
heaps in the future I can see how easy is to generate confusion around this
area. I'd suggest to describe rather precisely what it is that requires the=
 new
flag so we keep good records.

Thank you!

> - Remove the CPU_ACCESS flag from BOs that are not host-accessed.
> - Use DRM_PVR_BO_PM_FW_PROTECT for MList allocations.
>=20
> Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
> ---
> Changes in v2:
> - Update as per Kamil's feedback.
> - Updated description to map commits are specific to Imagination.
> - Spilt lib/igt change to two: Interface update and flags update.
> - Link to v1: https://patch.msgid.link/20261029-b4-render_update-v1-0-4a9=
2ec210d6a@imgtec.com
>=20
> ---
> Brajesh Gupta (3):
>       lib/igt_pvr: Update general heap allocation interface to pass flags
>       imagination: Skip CPU access flag for a few Render related allocati=
ons
>       lib/igt_pvr: Pass DRM_PVR_BO_PM_FW_PROTECT flag for PM MList alloca=
tion
>=20
>  lib/igt_pvr.c                       | 33 +++++++++++++++++++------------=
--
>  lib/igt_pvr.h                       |  3 ++-
>  tests/imagination/pvr_submit_jobs.c | 13 ++++++++++---
>  3 files changed, 31 insertions(+), 18 deletions(-)
> ---
> base-commit: fc75d6d7ffcb79e8a3316e80c7085460568a7670
> change-id: 20261029-b4-render_update-79d0cf70eb0e
>=20
> Best regards,
> -- =20
> Brajesh Gupta <brajesh.gupta@imgtec.com>
>=20

