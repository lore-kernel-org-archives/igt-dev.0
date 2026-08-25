Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305DCC61DB6
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 08:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E6F10E16B;
	Tue, 25 Aug 2026 08:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cIiAlgWj";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A50C10E16B
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 08:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgTh4SCBJfRH41c+kB/TdoNl9cippX0I4bBCsBid79+J+g9bvzm8gHDkZF10+uMY3qf5ju8dKj4N1DL5AZMczcUvMk4LegqCs71f2fPf6rxUv0D/QnzzNkM9DkVCDKwuZa7b+lS9HFMpUF/RBhL9SNb9WNRz8j3mum04qxBnb8/k9wcAbIQia5K6uwHbrONrReuM7pGfuD22N4P9ZNYu2lNEuk9h62PCqx3gKolW8e1pzSGD/r4YtH9goUBcT0VpUnbraz/Aoj/wvsvK2tCn2AKxZqseNIGlanOPtNXSMybmv+mMVcP34AlPjWRRUHlmS0hPXHxOTlN+uSJSvVQuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ix2I/I7eVTlznVHaH/4adSAnZxPD32Kb0v7/2sOPrJM=;
 b=Gs6kEgXq7d/DVbYJLjEFjsQ3aJ2Tj7ZJkZe1ASaJmoccx+hTe99RZNO1TmAnP4IMjx9mtc9I8iTLRDFAxgMXGG3ln1nXlr7EKcKTc1WNmcLR2QmYa0yCKkms0rTwr4TwpAGgcXTAVi8bffotW1KlbmEFibjNBAATCHI+lcAZI+M4M1PD528fhCFs1g+XWNSS3kbSlkucAk6rKAYGBjpDPFgHbQErHTONwwZsZ9rT5WKa8EJmskUvKYvaA6lbE9MNEmrQol2oCvYVKV1hPVJkVpT1Khsfaga1utSoLMBsRhiBrLLs+7sef2pAzrJfM087i4lnrK92wYz0WQbASsoVzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ix2I/I7eVTlznVHaH/4adSAnZxPD32Kb0v7/2sOPrJM=;
 b=cIiAlgWjXb+aqe+xV5kFKRc2DKq+jKvSpKufdciKZIZPNpp+hMkZLHirWarS4FyGNz1ZFm16+cKH2kUTUEv+hmoZUJL1yAeIslT7R5jvrsp2n7/TWquxWaVkUJWqlAN02XyB7gj7UocwmT4eEnzL7wyS3XXR02lswD9FlhITfQI=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 08:53:12 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 08:53:12 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Shen, Junhua" <Junhua.Shen@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Huang, Ray"
 <Ray.Huang@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>, "Chen, Xiaogang"
 <Xiaogang.Chen@amd.com>, "Liu, Jenny (Jing)" <Jenny-Jing.Liu@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhu, Lingshan"
 <Lingshan.Zhu@amd.com>, "Ma, Yiru" <Yiru.Ma@amd.com>, "Shen, Junhua"
 <Junhua.Shen@amd.com>
Subject: RE: [PATCH i-g-t v2 1/3] include/drm-uapi: sync amdgpu_drm.h for
 GEM_SVM uAPI
Thread-Topic: [PATCH i-g-t v2 1/3] include/drm-uapi: sync amdgpu_drm.h for
 GEM_SVM uAPI
Thread-Index: AQHdNGLxbS0mBTk2t0yB84XvxGvJAraudN6w
Date: Tue, 25 Aug 2026 08:53:11 +0000
Message-ID: <DM4PR12MB5152BB162D7C7E93219DC70BE3AF2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260825072300.16348-1-Junhua.Shen@amd.com>
 <20260825072300.16348-2-Junhua.Shen@amd.com>
In-Reply-To: <20260825072300.16348-2-Junhua.Shen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-25T08:50:47.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|CH3PR12MB8909:EE_
x-ms-office365-filtering-correlation-id: 6a939ed6-abc9-4f61-1be8-08df02864b5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|56012099006|11063799006|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: bBDf3YYduJw3QTa65jhcf4lPpPE38Hibyrte1EHRNiOou56rIF4+kzd4gM96Ga6oUz6OmF3mJuSaHjwfYNVBWohe0FW2dGnpgfsd83HozDMTl0FeT1b1SYicf1xge3BUsxKmJaFc40vgfIIWFAWBvBJ/OGfL+F/h9lZYxr8qhvEtFw+mpTHVH/GvbAm13r7R0FbV3o2tHDVJYrVmpmi3snLEuVPoYPmbHRD2J60sBfI62q/QaJRgtKjY5dAydrn4LQvK40HLcyH2OY9AGxtRDroikrqcgjRcNG6xwW045YrcE54QgzDIwZfX3OMGJvqtomnjtnMM9LniOBSLXMxm1QNONZMQL1F+Shg+bQi9C0HBVYihnxrFg1z6TXwjhR8bbj12FKgt2+JrIZBHwDwuoEnf9h3PViSlaK8XWGggwpPAZdmNy96YDLoZ+w4SUh6qAC/2OYLUBdQNByWVowRrHUEva6qApVdciiTvhxdkVaVoZv4ElOm2YdZGF57Q8xGZgAqnFmh1+trUQLnzkZNQCUcfTn82YaUEJk56P/fHbb12e6N5e1YdmuQXms0NUb0iZazpQLJbb0pNUtPTHsUS9TvEXYgJACcBwFS77rphLxQTQznMXUrlJCUmyY97fmQZtpQGop/WCkPtsmypUpS20Ut4vSLr/WHDkAqS5+PvyGaa1OYJTcAdnZZ1UXPRL9/Q0R8RA6QpGk6zxvEMNoGPqX1l+1NomqaLxBOfvVFEb7o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GxbJNMDPM9iBgumuq1sMmwKFubZb9hWJ1iklRWgsnGbzCaqHI2aKEh3Hfq4k?=
 =?us-ascii?Q?8xepg8N3ZNxXRcLgUVoDKhsA99Val7/CCqRqmlxNLNlD1/Vb85hTE35JAray?=
 =?us-ascii?Q?XHU3bX3liFRInTOKWzzfMCM7ffaCQIRNrvDOEyvOjdcz44pj7ZKcNtJjbqc1?=
 =?us-ascii?Q?/5u0i9qDRAQHUwmi4tiT2zrDbzpgV3KGYwctbHFZ0e1gHbNvRdHkREDVQLEU?=
 =?us-ascii?Q?knLr4/G9ktQdOOMTMFocnY2fdERVJ4jdIFHdrALd6WLB4oTv6Bb6vCl6axuk?=
 =?us-ascii?Q?VtSMAIAJgqLJB/7aU9E8KoYOwVeyihMQGD3Eddvf9rvJBG5AOj/pH/X66jEz?=
 =?us-ascii?Q?pYnQsOSwkaCo3hnc6xM/gJEdoeWF5r0nZoM8S48LyK0tOZXP7no36MM0M3Bg?=
 =?us-ascii?Q?oYFfM2SYFzHXruHOrcvYqWlmDJfn/bT58ehl8Gg3SeAhyP+K/B+YOVARYJVN?=
 =?us-ascii?Q?PLMg58QVGpvtsKwJtxgrQOaSrOdUJPsVS2IZ7KcHbBhXVdr2jUwTCyZlgSX/?=
 =?us-ascii?Q?AkyDGb7QxMvO0V41fJaIMW1WMKOWGJpB2gQkRGhiNpVokcLcj2PE726HypuB?=
 =?us-ascii?Q?HxQeGpSJRTkpBfB0xPGnjsof923KHreU/laLMs7Oj7QIx0nzGAGcvW98Y7vJ?=
 =?us-ascii?Q?nknWnoiIRByKh0pR+obFhlzhFs0w1W16C+WlBNmKMIocDkRiKLvoGHBGWoE6?=
 =?us-ascii?Q?C7pJ5g1tqhrb7LlWm6Vrcdp6cg511n4rBsmuhNPtyB/hfpGUNv/3rFnf39LP?=
 =?us-ascii?Q?ZzjavyO68a+vReH52f6l5Q4bY2gWy01ax3NHeuCEIJhl4JvbeGFzVf1lXQbF?=
 =?us-ascii?Q?BHN+vBP1Sf1YjuzabcDbBe+QRuJl6tRl3C1H8o/V7ERToPE8ID2srcPnobwx?=
 =?us-ascii?Q?AyzfJxA/zU0QdhStQ8VI/0ot9DtqbOVhYkXnjmxG+IJ4V/W989wdvkvXdrkr?=
 =?us-ascii?Q?4puNEeFYRZptB63cckBzKxvOXZBBCNrhrO52g29IT/ejuqmxBh8dNBv0tY83?=
 =?us-ascii?Q?NI/GRLe7ebKNCmYZvztWljdH6TtAWhfAKKucqmWxj+J0mqAjE/DBhpgNnE8J?=
 =?us-ascii?Q?CUWWKDtF0C3oHZ03j+9mmXtM7GoooiuAChjMAWKojd1ca+aXWYRCcBTn9eWZ?=
 =?us-ascii?Q?G6Ie19oiO32w9nxxnZxsjKS1/ZJEeCuSxOZx0iOzpl8zwvwb2LgFL0Qd4R13?=
 =?us-ascii?Q?l4saaVlK9kEhVDYVLjhBFiP+IGl7MXG+y72zz5bZlUfGvskmHJ3jzOjEkcQ7?=
 =?us-ascii?Q?5BNjLGJgNCYr3M9YokEona37WBv1dOSykbe/z6Kb4D/HxAsTJ8ysymbOc8XS?=
 =?us-ascii?Q?O52CfOD1qQbaDIdatP7ug7RTL49q1WU4qCea6yDwubJYLpHgeOK61FxRd6md?=
 =?us-ascii?Q?gqkqUF7rp7mOAMEtXpyS1yJnNAz+/pQiWHIm2s6VUsC7NPhdwkEK2ZAlzBmU?=
 =?us-ascii?Q?9QtqgnS1HGRp2BHakPjtApM7rSOJlQinPESNXu0al+uOhLgct3cDx8h/Vhst?=
 =?us-ascii?Q?bmHFbkybrDN9zD6Vr3PdRpJJWKBblWgUZC306K6GG6gqh+k9xPCm02Y+8Hh9?=
 =?us-ascii?Q?FodFmINdyg5IAK327ICxEGr40VgH52qIjGUKENHcu6/7wSluGnnaT0m9+5iV?=
 =?us-ascii?Q?dftojXSk3CwVksqZrfg4IPknixQ/qLGWCLAio+H2RacffI5qLD69QSRR/6J3?=
 =?us-ascii?Q?CRydCkAPMOgca3a4zNdvyfL3Pr9+d0d4e++0YBU2MDpK5KkI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a939ed6-abc9-4f61-1be8-08df02864b5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 08:53:12.1785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UnMhve1ArI3SAySzDH4oj7L7R8Qc07G0LCGMXy8hmdrFsHY9EUW0X3oYrtPdE3K/z2bgreZzMOdrbbLaLK20YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8909
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

AMD General

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Junhua=
 Shen
> Sent: Tuesday, August 25, 2026 3:23 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Huang, Ray <Ray.Huang@amd.com>; Zeng,
> Oak <Oak.Zeng@amd.com>; Chen, Xiaogang <Xiaogang.Chen@amd.com>; Liu,
> Jenny (Jing) <Jenny-Jing.Liu@amd.com>; Huang, Honglei1
> <Honglei1.Huang@amd.com>; Zhu, Lingshan <Lingshan.Zhu@amd.com>; Ma, Yiru
> <Yiru.Ma@amd.com>; Shen, Junhua <Junhua.Shen@amd.com>
> Subject: [PATCH i-g-t v2 1/3] include/drm-uapi: sync amdgpu_drm.h for GEM=
_SVM
> uAPI
>
> Sync the amdgpu_drm.h uapi definitions for the amdgpu-drm-svm feature:
> the DRM_IOCTL_AMDGPU_GEM_SVM ioctl number, the SVM attribute enum and
> the drm_amdgpu_svm_attribute struct.
>
> Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
> ---
>  include/drm-uapi/amdgpu_drm.h | 106
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
>
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.=
h index
> ca24519c7..1e7bb8c06 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -57,6 +57,7 @@ extern "C" {
>  #define DRM_AMDGPU_USERQ             0x16
>  #define DRM_AMDGPU_USERQ_SIGNAL              0x17
>  #define DRM_AMDGPU_USERQ_WAIT                0x18
> +#define DRM_AMDGPU_GEM_SVM           0x1B
>
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE
>       DRM_IOWR(DRM_COMMAND_BASE +
> DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP
>       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP,
> union drm_amdgpu_gem_mmap)
> @@ -77,6 +78,7 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_USERQ
>       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union
> drm_amdgpu_userq)
>  #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL
>       DRM_IOWR(DRM_COMMAND_BASE +
> DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
>  #define DRM_IOCTL_AMDGPU_USERQ_WAIT
>       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT,
> struct drm_amdgpu_userq_wait)
> +#define DRM_IOCTL_AMDGPU_GEM_SVM
>       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_SVM,
> struct drm_amdgpu_gem_svm)
>
>  /**
>   * DOC: memory domains
> @@ -1590,6 +1592,110 @@ struct drm_amdgpu_info_uq_metadata {
>  #define AMDGPU_FAMILY_GC_11_5_0                      150 /* GC 11.5.0 */
>  #define AMDGPU_FAMILY_GC_12_0_0                      152 /* GC 12.0.0 */
>
> +/**
> + * enum amdgpu_ioctl_svm_op - operation selector for
> DRM_IOCTL_AMDGPU_GEM_SVM.
> + * @AMDGPU_SVM_OP_SET_ATTR: apply the attributes in @attrs_ptr to the VA
> range.
> + * @AMDGPU_SVM_OP_GET_ATTR: read back the current value of each
> attribute
> + *                          listed in @attrs_ptr for the given VA range.
> + * @AMDGPU_SVM_OP_RESET_ATTR: reset all attributes for the VA range to
> their
> + *                            default values. @attrs_ptr and @nattr are =
ignored.
> + */
> +enum amdgpu_ioctl_svm_op {
> +     AMDGPU_SVM_OP_SET_ATTR =3D 0,
> +     AMDGPU_SVM_OP_GET_ATTR =3D 1,
> +     AMDGPU_SVM_OP_RESET_ATTR =3D 2,
> +};
Please ensure that the relevant kernel patch and libdrm patch have been ups=
tream before merging.


Regards
Jesse
> +
> +/**
> + * enum amdgpu_ioctl_svm_access - values for
> AMDGPU_SVM_ATTR_ACCESS.
> + * @AMDGPU_SVM_ACCESS_INACCESSIBLE: GPU must not access the
> range; any access
> + *                                  is a fault.
> + * @AMDGPU_SVM_ACCESS_IN_PLACE:     GPU may access the range only
> at its
> + *                                  current backing store; the driver wi=
ll
> + *                                  never migrate pages to local VRAM.
> + * @AMDGPU_SVM_ACCESS_ALLOW_MIGRATE: GPU may access the range
> and the driver
> + *                                  is allowed (but not required) to mig=
rate
> + *                                  pages between system memory and loca=
l
> + *                                  VRAM to satisfy the preferred/prefet=
ch
> + *                                  location.
> + */
> +enum amdgpu_ioctl_svm_access {
> +     AMDGPU_SVM_ACCESS_INACCESSIBLE          =3D 0,
> +     AMDGPU_SVM_ACCESS_IN_PLACE                      =3D 1,
> +     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE         =3D 2,
> +};
> +
> +/**
> + * enum amdgpu_svm_location - values for
> AMDGPU_SVM_ATTR_PREFERRED_LOC /
> + *                            AMDGPU_SVM_ATTR_PREFETCH_LOC.
> + * @AMDGPU_SVM_LOCATION_SYSMEM:    back the range with system
> memory.
> + * @AMDGPU_SVM_LOCATION_UNDEFINED: no preference; the driver
> chooses.
> + */
> +enum amdgpu_ioctl_svm_location {
> +     AMDGPU_SVM_LOCATION_SYSMEM      =3D 0,
> +     AMDGPU_SVM_LOCATION_UNDEFINED   =3D 0xffffffffU,
> +};
> +
> +/**
> + * enum amdgpu_ioctl_svm_attr_type - attribute selector for
> + *                                   &drm_amdgpu_svm_attribute.type.
> + *
> + * @AMDGPU_SVM_ATTR_PREFERRED_LOC: Preferred backing location for
> the range.
> + *   Value is one of &enum amdgpu_ioctl_svm_location.
> + * @AMDGPU_SVM_ATTR_PREFETCH_LOC: Prefetch target for the range.
> Value is
> + *   one of &enum amdgpu_ioctl_svm_location.
> + * @AMDGPU_SVM_ATTR_ACCESS: GPU access policy for the range. Value is
> one
> + *   of &enum amdgpu_ioctl_svm_access.
> + * @AMDGPU_SVM_ATTR_GRANULARITY: log2 of the migration granularity in
> pages.
> + * @AMDGPU_SVM_ATTR_HOST_ACCESS: Guarantee host access to
> memory.
> + * @AMDGPU_SVM_ATTR_COHERENT: Fine-grained coherency between all
> devices
> + *   with access.
> + * @AMDGPU_SVM_ATTR_EXT_COHERENT: Fine-grained coherency between
> all devices
> + *   using device-scope atomics.
> + * @AMDGPU_SVM_ATTR_HIVE_LOCAL: Use any GPU in the same XGMI hive
> as the
> + *   preferred device.
> + * @AMDGPU_SVM_ATTR_GPU_RO: GPUs only read the range, allowing
> replication.
> + * @AMDGPU_SVM_ATTR_GPU_EXEC: Allow execution on GPU.
> + * @AMDGPU_SVM_ATTR_GPU_READ_MOSTLY: GPUs mostly read the
> range; may allow
> + *   optimizations similar to GPU_RO, but writes still fault.
> + */
> +enum amdgpu_ioctl_svm_attr_type {
> +     AMDGPU_SVM_ATTR_PREFERRED_LOC           =3D 0,
> +     AMDGPU_SVM_ATTR_PREFETCH_LOC            =3D 1,
> +     AMDGPU_SVM_ATTR_ACCESS                          =3D 2,
> +     AMDGPU_SVM_ATTR_GRANULARITY                     =3D 3,
> +     /* Boolean attributes below: value must be 0 or 1. */
> +     AMDGPU_SVM_ATTR_HOST_ACCESS                     =3D 4,
> +     AMDGPU_SVM_ATTR_COHERENT                        =3D 5,
> +     AMDGPU_SVM_ATTR_EXT_COHERENT            =3D 6,
> +     AMDGPU_SVM_ATTR_HIVE_LOCAL                      =3D 7,
> +     AMDGPU_SVM_ATTR_GPU_RO                          =3D 8,
> +     AMDGPU_SVM_ATTR_GPU_EXEC                        =3D 9,
> +     AMDGPU_SVM_ATTR_GPU_READ_MOSTLY         =3D 10,
> +};
> +
> +/* One (type, value) pair carried by DRM_IOCTL_AMDGPU_GEM_SVM. */
> +struct drm_amdgpu_svm_attribute {
> +     /** AMDGPU_SVM_ATTR_* */
> +     __u32 type;
> +     /** Attribute value; interpretation depends on @type */
> +     __u32 value;
> +};
> +
> +/* Argument for DRM_IOCTL_AMDGPU_GEM_SVM. */ struct
> drm_amdgpu_gem_svm
> +{
> +     /** Start of the virtual address range */
> +     __u64 start_addr;
> +     /** Size of the range in bytes */
> +     __u64 size;
> +     /** AMDGPU_SVM_OP_* */
> +     __u32 operation;
> +     /** Number of struct drm_amdgpu_svm_attribute entries in @attrs_ptr=
 */
> +     __u32 nattr;
> +     /** User pointer to an array of @nattr struct drm_amdgpu_svm_attrib=
ute */
> +     __u64 attrs_ptr;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.34.1

