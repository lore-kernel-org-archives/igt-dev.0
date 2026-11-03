Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81AA606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 06:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=ZAgp+3kD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C9E10E7A4;
	Tue,  3 Nov 2026 06:44:05 +0000 (UTC)
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE8810E7A4
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 06:43:01 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A36gv9W3394637
 for <igt-dev@lists.freedesktop.org>; Tue, 3 Nov 2026 06:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=G
 pDSB+/litDL1iWp2t1ZcsShufo+bB/DpHhMxJynR84=; b=ZAgp+3kD9A6m0ToFc
 nZ8GvKAfiIPb+m9vdQi2ouDz+HFC0Ycc8anrXdEgjVbEGp0hbQ4JO3QuBNmuRcHr
 XzOOsfI/1UW7vUbiM3VKDqTk74SoRVjVFM91BOUVVMg/uTADCocK9rhLnpr+SpVE
 Xb8WASqyYqMhO7+zNxa+fdGRDFrqIMomDTStXGhDkoGM/1kjm+0x+/cFTtdvvT7X
 4aHN9uIuMmHyQLUPuYgqcTtPJf549EgDdw19I1CSowNrVJgyq3nyumJvl011aHzw
 o/9EX4laa/P8pzmabM5C8HAlmm9+7v0pCtGAMkk1ByxFiN+mpo3cGijuM5WamSSd
 vk5YQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hn7ft219a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Nov 2026 06:43:00 +0000 (GMT)
Received: from np-a-belle.kl.imgtec.org (172.25.6.177) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 06:42:59 +0000
Message-ID: <d264fcdcbb3e3c716587dc95fe914a21d2558179.camel@imgtec.com>
Subject: Re: [PATCH i-g-t v2 0/3] imagination: Update allocation flags for
 buffers in submit job
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Brajesh Gupta <Brajesh.Gupta@imgtec.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <Alessio.Belle@imgtec.com>
Date: Tue, 3 Nov 2026 06:42:54 +0000
In-Reply-To: <1cf559f11650ecdd299b150d77148dbd70b93368.camel@imgtec.com>
References: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
 <b62f13bd6feaf945cd7d0b3ce5c8ff11a40550d5.camel@imgtec.com>
 <1cf559f11650ecdd299b150d77148dbd70b93368.camel@imgtec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: GG-Sd-PbaVAP_6fL-Q6_x09X2tWwMrtm
X-Proofpoint-GUID: GG-Sd-PbaVAP_6fL-Q6_x09X2tWwMrtm
X-Authority-Analysis: v=2.4 cv=HaSB3SE8 c=1 sm=1 tr=0 ts=6ae98274 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=2JH569OHYJkA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=bSmGfd70dixzhNI8h64A:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyNiBTYWx0ZWRfXz8yYdo1nmhIH
 l4YwKCW4DyBng/oCiO2EzdNA6Lj7PgjZ9b8DYCKEx7wM/KRuRqNBpCIsAKj9hLRnLvdtj8FMr7D
 xy31+QsLRC6oM7VT7HtK2n6m7ooKiPs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyNiBTYWx0ZWRfX8pAVSbGpRy/T
 CS14ynfln7IhdBBxPqu0aEZigfjjSyagGmCWeC13CtaM7ReKJOH+gOqK4fo/zBgBzc/78JGkJvL
 yAr+TOXgpI9QLN3M+GFC7bPuItHnwtpYf19dJpvV2Gd3V9hsBi4hKaIhEnv0fc9ezkMFcRSDWRG
 jy+Sv3KHjxp76vAZsPZUiKL3lITOybS287qBsgk2G+Dq54IhkMUD1omWPKHR3FHy5vREVVIXFAL
 KLH/sfe4+EA4AkoqwqD5bwV0cy2mvdQM46N45IpF741dqArQrFrgG4aO3CO9CJq7Qk5Fq8tRyAO
 +j+d3mcZG+y+xEGjxGX5PqXdS1AX8ipqkHFAp/3C3nZSTOJinCZUc4yglt0tGTQJWplyWuC4aH7
 hXX4GtwVk/6MVhrh9WZrYVw4RkJRO5pZQWfzatA+oicDzffLhQ+XIypOlEenTqBC5Q6A0ppszgZ
 CXn3NhnPhEAbqVipQDQ==
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

On Mon, 2026-11-02 at 12:48 +0000, Brajesh Gupta wrote:
> On Thu, 2026-10-29 at 17:07 +0000, Luigi Santivetti wrote:
> Hi Luigi,
> > *** NOTE: This is an internal email from Imagination Technologies ***
> >=20
> >=20
> >=20
> >=20
> > Hi Brajesh,
> >=20
> > On Thu, 2026-10-29 at 18:03 +0530, Brajesh Gupta wrote:
> > > Update BO allocation flags to match expectation:
> >=20
> > Sorry, what would those expectations be with respect to upstream?
> I was referring to generic expectations:
> - If a BO doesn't need access from the host, then don't pass the flag CPU=
_ACCESS
> flag. It gives options to driver to adjust things when required.
> - For DRM_PVR_BO_PM_FW_PROTECT flag, just following guidance to pass this=
 flag
> for any BO which be accessed by either Parameter Manager and/or Firmware.=
 Update
> is to pass the flag for MList in the same way it was passed for Free List
> allocation.
> >=20
> > I take IGT has always been broken, but nothing has really changed recen=
tly with
> > regard to PM/FW protect?!
> Nothing is broken at this point and pvr_submit_test test is passing.
> >=20
> > Perhaps it's worth adding a description of what makes (or doesn't) the =
flag
> > needed in patch [3/3] commit message, especially as we expect to extend=
 the
> > heaps in the future I can see how easy is to generate confusion around =
this
> > area. I'd suggest to describe rather precisely what it is that requires=
 the new
> > flag so we keep good records.
> >=20
> I think it will better to hold on patch[3] change till kernel driver adds
> support for PM_FW_PROTECT flag.
>=20

Okay,
Thanks

> Thanks,
> Brajesh
> > Thank you!
> >=20
> > > - Remove the CPU_ACCESS flag from BOs that are not host-accessed.
> > > - Use DRM_PVR_BO_PM_FW_PROTECT for MList allocations.
> > >=20
> > > Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
> > > ---
> > > Changes in v2:
> > > - Update as per Kamil's feedback.
> > > - Updated description to map commits are specific to Imagination.
> > > - Spilt lib/igt change to two: Interface update and flags update.
> > > - Link to v1: https://patch.msgid.link/20261029-b4-render_update-v1-0=
-4a92ec210d6a@imgtec.com
> > >=20
> > > ---
> > > Brajesh Gupta (3):
> > >       lib/igt_pvr: Update general heap allocation interface to pass f=
lags
> > >       imagination: Skip CPU access flag for a few Render related allo=
cations
> > >       lib/igt_pvr: Pass DRM_PVR_BO_PM_FW_PROTECT flag for PM MList al=
location
> > >=20
> > >  lib/igt_pvr.c                       | 33 +++++++++++++++++++--------=
------
> > >  lib/igt_pvr.h                       |  3 ++-
> > >  tests/imagination/pvr_submit_jobs.c | 13 ++++++++++---
> > >  3 files changed, 31 insertions(+), 18 deletions(-)
> > > ---
> > > base-commit: fc75d6d7ffcb79e8a3316e80c7085460568a7670
> > > change-id: 20261029-b4-render_update-79d0cf70eb0e
> > >=20
> > > Best regards,
> > > --
> > > Brajesh Gupta <brajesh.gupta@imgtec.com>
> > >=20
> >=20
>=20

