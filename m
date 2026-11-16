Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20D8606A335
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 17:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=GmSw2rwZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5990D10F31C;
	Mon, 16 Nov 2026 17:14:50 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970B210F31C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 17:13:46 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AGBM5K83974846; Mon, 16 Nov 2026 17:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=h
 apnhrxmG8hk4NcTPjmhNz0YPGEg0yh4ko+B8/S2s0g=; b=GmSw2rwZhuFTGslHZ
 6NZIloP557c2KHZKEE3YkO3nrWAsp9rUvgLBxlH6qgul5jQn9n4jxCh1NFkzDVId
 Gs52yjeO4EL/EZhl+x36Oq/YGdaYaLCOoUY2AP6N1j5+z/zPeGWWgA5mkv5XE3RH
 FRxlVQ6d4MC1Qk679y0dHnHfRgQVwKVG4X765cgxllEARHPXjekZdBsXKXLCBA47
 wH9+OGI8jYlnAuXhZrnX9ZiYe/1O/DgvL822rHz/0qKUxMHyy8yB2ldO0ZHOTLjq
 KYv87ZipgvURSAC25W7suOCBtVw7hH/67a5ndAbAGSLM3PuAsTUqy1JNUg9i7TVA
 WkjAA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4j00w1g8c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1); Mon, 16 Nov 2026 17:13:40 +0000 (GMT)
Received: from np-a-belle.kl.imgtec.org (172.25.6.177) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 17:13:39 +0000
Message-ID: <f665c6b38198de5b9fcd82e1f20bc6a124f3c7b1.camel@imgtec.com>
Subject: Re: [PATCH i-g-t] tests/imagination: add more heap info and static
 areas query tests
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <alessio.belle@imgtec.com>,
 <brajesh.gupta@imgtec.com>
Date: Mon, 16 Nov 2026 17:13:39 +0000
In-Reply-To: <h6d6q4b7dn7spx2txawcqhw4kyryongkpwr6rlj7nmrvci6dl5@bsghmrdtlldo>
References: <20261105-b4-heap-static-area-info-get-v1-1-8d5aa15a5e30@imgtec.com>
 <h6d6q4b7dn7spx2txawcqhw4kyryongkpwr6rlj7nmrvci6dl5@bsghmrdtlldo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfXwexZyBcp8gJO
 6EZkf99Rhpya1uAfgqorraqhpSj+t0bA5RbBxAH2IhXP4FV5YUyaEac4r4jForMDqET0dBzTSr2
 qVdsZIlSM45fPwYtjllo4oTJ4wqiPlM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfXyi3QtOlyrivO
 WVBq88pgjv1YOQRgCNV7VTMLL5IPHGnxzl1DVrjNSAFcD3EyytaCqQSsCmgBglktj29aC6xB8kK
 Kc1e30889MhzUDDadZWeZE7tIkt4seIzscFhQk3W7UFFuFFYZGts2/QcLwG/+PwmibDU7a65L9B
 qkgjVEzNiJiZ/6UGwUbi1luPs5RDgJyg3bLvJYf/8lxdmu27uk5DaNxf6tb0N4glwVHw5+NlYEq
 zDl1xfAzPSidHh/3Ag4W3n4rycaUYtD85qBOnv4FPbKr1lbFDkfdzRj+zFiHL8qBgPpF/0ET5Bl
 v1RA2IixlBL19CSrj/eO2oDrknB8NoLC6UcbpLj1pJXEYSm+mYkkPhSdmuz10BBKrc0gJAMn6AL
 J97VoYLB/bdGN3nDYE/qM2bmkTdG72bwGZ7bguY6OUm1shevHFE3PdBwDEm1UOmc73HeWKUefmG
 5OlYH4x3N6JGyPat4rg==
X-Authority-Analysis: v=2.4 cv=Yoqa1IYX c=1 sm=1 tr=0 ts=6afb39c4 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=2JH569OHYJkA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=ZfLQ6QihG8_Nyt8DG7wA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 9nUa2z5hA7ACCZ-VTInR23w5L5JbxTqD
X-Proofpoint-GUID: 9nUa2z5hA7ACCZ-VTInR23w5L5JbxTqD
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

Hi Kamil,

On Mon, 2026-11-09 at 12:50 +0100, Kamil Konieczny wrote:
> Hi Luigi,
> On 2026-11-05 at 15:41:22 +0000, Luigi Santivetti wrote:
> > Test the following combination of properties:
> >=20
> >   P01. Make 1 ioctl call to query either heaps or static data
> >   P02. Make 2 ioctl calls to query either heaps or static data
> >   P03. UMD(stride) > KMD(stride)
> >   P04. UMD(count) > KMD(count)
> >   P05. UMD(count) < KMD(count)
> >   P06. count is zero
> >   P07. stride is too small
> >   P08. retrieve the legacy value of KMD(stride)
> >   P09. retrieve the legacy value of KMD(count)
> >   P10. retrieve the value of KMD(stride)
> >   P11. retrieve the value of KMD(count), where count is:
> >        - for heaps, defined in the UAPI as DRM_PVR_HEAP_COUNT
> >        - for static data areas, only known to the kernel
> >   P12. count is UMD(DRM_PVR_HEAP_COUNT)
> >=20
> > DRM_PVR_DEV_QUERY_HEAP_INFO_GET:
> >=20
> >        |P01|P02|P03|P04|P05|P06|P07|P08|P09|P10|P11|P12|
> >    T1  |  X|   |   |   |   |  X|   |   |   |   |   |   |
> >    T2  |  X|   |   |   |   |   |  X|   |   |   |   |   |
> >    T3  |  X|   |   |   |   |   |   |   |   |   |   |  X|
> >    T4  |  X|   |   |   |   |   |   |  X|  X|   |   |   |
> >    T5  |   |  X|   |   |   |   |   |   |   |  X|  X|   |
> >    T6  |   |  X|   |   |   |   |   |  X|  X|   |   |   |
> >    T7  |   |  X|   |   |  X|   |   |   |   |   |   |   |
> >    T8  |   |  X|   |  X|   |   |   |   |   |   |   |   |
> >    T9  |   |  X|  X|   |   |   |   |   |   |   |   |   |
> >=20
> > DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET:
> >=20
> >        |P01|P02|P03|P04|P05|P06|P07|P08|P09|P10|P11|P12|
> >    T1  |  X|   |   |   |   |  X|   |   |   |   |   |   |
> >    T2  |  X|   |   |   |   |   |  X|   |   |   |   |   |
> >    T3  | -------------------- N/A -------------------- |
> >    T4  |  X|   |   |   |   |   |   |  X|  X|   |   |   |
> >    T5  |   |  X|   |   |   |   |   |   |   |  X|  X|   |
> >    T6  |   |  X|   |   |   |   |   |  X|  X|   |   |   |
> >    T7  |   |  X|   |   |  X|   |   |   |   |   |   |   |
> >    T8  |   |  X|   |  X|   |   |   |   |   |   |   |   |
> >    T9  |   |  X|  X|   |   |   |   |   |   |   |   |   |
> >=20
> > Signed-off-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
> > ---
> > This patch depends on one kernel series that is not yet merged:
> >=20
> >   https://lore.kernel.org/all/20261104-ioctl-query-count-stride-fixes-v=
1-0-2bf86dd7cf29@imgtec.com/
>=20
> LGTM
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>=20
> Regards,
> Kamil
>=20
> PS. ping me when you will want this merged, here on on irc.

I sent out a v3 with your Acked-by. This can go in now, for reference=C2=A0=
in=20
drm-misc-next we now have:

17a180572ca5 drm/imagination: clamp count of heaps and static areas ...
2751fa2bc364 drm/imagination: clamp stride of heaps and static areas ...

Thank you!

PS. for my education, do I need to send a new version for tagging reviewers=
?

>=20
> > ---
> >  tests/imagination/pvr_heap_info.c | 585 ++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 585 insertions(+)
> >=20
> [cut]

