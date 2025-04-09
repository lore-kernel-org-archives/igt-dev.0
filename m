Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F055AC36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 07:55:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C5E10E7F7;
	Wed,  9 Apr 2025 07:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tjqW4rpL";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961DF10E7F7
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 07:55:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QY74ZUmOQsZ/XiveT76cPUwBoqOClh7cdRGR+VwkES7K3ftvZe9D0FFoe1425Sf/Mm0MmjSflLx0oCE/X/IEIR+z6GGYEdGuQUo4X2jOO5bm9a9C0pey3NdNxzrlei0K0q8/Qib4yAKzZSXI485ZA/vwWieZH5VVfXuPafpJZ02YtTuiHXvMpW0nJJTNOS9pZTdalPGp/u9DbI1ngtR+FOQFkBPd78H1x+se692l9TNHU9gu80d+Hi45AfIQCnvO1einaL/ZhObPampwX3d4Iy8nifls3il49IEAOFH3DvxH3p3PCtLYBiIX42WsbtXtRuNHpYAPo43D0iT7xwIDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IfaBELKIyat9H7s5Uf2GQovRuxbGce93cmDUi2uQWo=;
 b=LUmDXFXHiRFXm4gyt8/F3Dyt10Wh08/LZo1GSdiPu6zrjl/9Rtc7sf9VHc92zRX+m2Ff9oIsFm+3EP/xhY0SHt593TnjiG998g8a59fj8eRNbZ18tPnUSo0ICFJJ5gkaiwumeJ73kL+eMEdytyCpejdg38e0dMhM2bbAsvt7U9ppanqwGRTFnvyGvpzrAbLv4tyxyvlNKqWt8jF0XHKdqAH6fzV5vSdzNxRWJzyYPXZE/EtYQs8Eif9WJkpUGYPwxM6usRIeOleit3HP7mwxBEnnhQSpwnrOcajrZlPb6hanjnP06FN3Ga1tJKJi2cm0pVKxWyjpFINKY10wD5SN3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IfaBELKIyat9H7s5Uf2GQovRuxbGce93cmDUi2uQWo=;
 b=tjqW4rpL6HMYeGOUY2vbLeCzvgxyajvjg9uWpl0C9dhNcbSDj8Zy0q3lKvCuCAB4g/W2+sazuI5Fiaj9nvuWCH5QBeo1erCD/NUtOiqAd4vVQ08YGHSO60vWObBvpA+k8TIWAI3adZYL8ONzts+/Tmjj6V8i+1vvFDIcdOOkKT0=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by IA1PR12MB6628.namprd12.prod.outlook.com (2603:10b6:208:3a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 07:55:37 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%5]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 07:55:36 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Khatri, Sunil" <Sunil.Khatri@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>
Subject: RE: [PATCH i-g-t 1/3] lib/meson.build: Add AMDGPU_USERQ_ENABLED check
 for user queues
Thread-Topic: [PATCH i-g-t 1/3] lib/meson.build: Add AMDGPU_USERQ_ENABLED
 check for user queues
Thread-Index: AQHbqSQVG5UBKzoMkUCr8yPAKXcZiLOa9zoQ
Date: Wed, 9 Apr 2025 07:55:36 +0000
Message-ID: <DM4PR12MB5152C5C9BE2A0C2FE7C67764E3B42@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20250409075030.2501714-1-jesse.zhang@amd.com>
In-Reply-To: <20250409075030.2501714-1-jesse.zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=b5841ab7-1ebc-4cfd-8885-996a33f44541;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-09T07:55:26Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|IA1PR12MB6628:EE_
x-ms-office365-filtering-correlation-id: e0368e5c-ac70-4172-3272-08dd773be9e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rvk73ytLvGemK0kT2Z0eHQavCv4YuAB2m7pZ4xSbyfv/2WLm8g3TCtxIWdwL?=
 =?us-ascii?Q?S9EDaiWytWW8cNxPGAu9IvN29RcH7lazWdSAG/oa1StinHzdKojt72X95u4O?=
 =?us-ascii?Q?8050HdtXfY5XSSudqiCCCKTk83FkcqJmkRi5M7o2zVmIqSX056kcogssYWcT?=
 =?us-ascii?Q?cibKwKN2GBTA3s8CH4I0fXgFIKglnE+PaqLdWuH6SP8zuU9urW/9FKXI28kx?=
 =?us-ascii?Q?uMLaMBG4Uak+bonr7rIQxBtKTrYN3WBh3DjChlhzr5FpxnbDdveIyEecDEzk?=
 =?us-ascii?Q?GR/empLLnVtbD0DO38M1vT/HQeqhoJmBMvDd0w94QUYTxANBTuvOkZ2HqT4k?=
 =?us-ascii?Q?pHmCg0Be4ri65Yh8zCYcIeEFRMLa4PnKo5bQeeoJSS3pfxH2MkExucEmR1Nh?=
 =?us-ascii?Q?MTgoywl9GGV6KPbxgWfWaoFe5PThh30tD8ORhNvNs0NT9gg4+qzz8WRaIz4r?=
 =?us-ascii?Q?Upl+BOP/OeHmeCjSPlfJd5A3gq9RILX4hpLUz/XhmlXYbh0H1k5XNYazq1pa?=
 =?us-ascii?Q?PvzjN1quwIYM32uLOfF8OgUhjpi2HDh5v3llObc1kgrm8sUrtMC0PnYR72wb?=
 =?us-ascii?Q?+E4J4CnQDRMG1c2IITSndpLZsFyr8pSr22n0lId3V1cYTp3l3+8FmGPgF8lM?=
 =?us-ascii?Q?cxF0HP/TyGH1bmeoUJRLZckd/RDZtpk3piv8hG4xVA+KQPt/elzBNPb0IwtX?=
 =?us-ascii?Q?EA9KNR44p5x++VlT0+ZT0/H7MwV0YC8Af90haPofmGoqF5CtDE6gCcKNpQSg?=
 =?us-ascii?Q?Qrut+l7ws7/6RKcKZL6MTO2dQaC4HG/E2vr0xJpuXU2yT9SDtLLg/rfhpRld?=
 =?us-ascii?Q?ilv6i/BYQIFBHcrQL9IhQoj3KqE4md+XFQaoWNM9kC2/iJ0zBFz+P6cA0+EV?=
 =?us-ascii?Q?M96mGhKtTsDyjsUfbXSOcqMVF09sRvyXBum/HH27QNYlH2h2mehtarpLJDKx?=
 =?us-ascii?Q?VIC0ExSV6EU8Jq3rdFCG5bqvH89eQoYwomLWAsw+PbgWmD3VXC6YodVj4mzA?=
 =?us-ascii?Q?7hZEP/57LipIJurCNt34clPt69I2TrS5eJHGop0aLlRN0CSxSYypIzKPclWi?=
 =?us-ascii?Q?zol2ypLAUvCIrWd2VGFfDAlVkoonLHO5BgkRdlpP15g0d/PPa88ncEwe/E6M?=
 =?us-ascii?Q?WUMlQOW/3fswv3DcmwCLcThKUw6sQY427wgExGTLZjEHCz5MLkmF1lIeNN9S?=
 =?us-ascii?Q?aBoTM0XEDE0yxtPjshbdJH5TcIH+JX9clXefqlm5wArBhF7D9wTb8JsskTC8?=
 =?us-ascii?Q?+u80hPYURa0CjmZc/Zeg00NksgnRPR3VUdLvGkMFk+z5sFOQoXIL0MYkwafF?=
 =?us-ascii?Q?tA9FXFV5MZYAD0Mi3aWUanVDc07PGnCk94E1aJC+LW1uqTl8lqZ49Zags8SE?=
 =?us-ascii?Q?PeZefp235XOblmNU4/HZ6gRV+jHlz3y6HyYZkCPSkhEoEsxtdALB5ppGjXXl?=
 =?us-ascii?Q?1o2ykQQuwd9kUR7zpSFGsrCxBK6ReoqN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HOf5FkjJdgrl5IuKHireASIixNBiDdzT8Xh5xKccBfBwRDqot0AB3C3XMVWn?=
 =?us-ascii?Q?mtLoyp/rK0GcFg7Dhf1iXFdDRhEl6lIMjSr3S/D4Hk9GF3eaf+VZ4TMMvig4?=
 =?us-ascii?Q?dfNZqcS8d+EK/Cy48OR+YOU7TL/3jXLKTkoxh+bsHnt44wepYia6JSBh4vGy?=
 =?us-ascii?Q?K4QMVvYApxc6qOJsg1Wzq8NPGgmH1RpKDPNqd636hXcAeWpimghGJqMl3xCE?=
 =?us-ascii?Q?MeLVUN42ivURX831jAq0WEV7E74TDZp1jkBwNzf2azELGhzc+rjajTXCvAgM?=
 =?us-ascii?Q?uSkvdseWfALDrWfyJYsHn+8d/3aFp3k3hTVqnGXTAt1JauxIc6LDC+hNDMIT?=
 =?us-ascii?Q?JX+Kr1LsvHiBvQXGpG8+63RVw1UkwHWdu1pZ0vpouWgpL4KevYipUYhjRWaE?=
 =?us-ascii?Q?sp9fdkEXFf4AyCPgC89wTHSjgRNFy7XjkzuOgKcEl83RKU3rrRsx47z/g9tx?=
 =?us-ascii?Q?xAYrHrqYCJuUFQKAt1kcZ6l02mCuHq2ZwH8zzP4UXC/yxd6K/IeFEFCZE4pL?=
 =?us-ascii?Q?YaLu+IjMmcdgNCSbIVJ0stgr8KH7GEKlW//aah6bRx/Aaf+WX1a8ElsZl2Ug?=
 =?us-ascii?Q?5sQLy/rdTDD23nKNo+htf7s0w3qYwckLD98dXyuyVzFaLc2bTi45m4hlZ1bw?=
 =?us-ascii?Q?KU9IHzyz5RVQf8T+xgOzxKHwkGjGMMKjzgeU8BYt+Qw3r0aJRcvirxICsQxb?=
 =?us-ascii?Q?5DVtDTO8IgVm9sQaCEKGo53hUk5icd8CojuvLKYdOQ3y8xnjBkLETlIDjJ1q?=
 =?us-ascii?Q?gttW1PX/jhCRRzYWgRiqCE93ry+4XmjgNkS6MAhDXlMfpYVxY+xnqMpav+W0?=
 =?us-ascii?Q?tGjM+OpLA1MsZVZavn5b2w6Sor0+NuoSv7mHncBBF1LXmz/AYwi0BGqHWdxw?=
 =?us-ascii?Q?hI52nng3pBIdgaYB1IEjqDhtd6U7OZSdhV0ZKiWeUle0bULdUdZFKQ4Kqd7l?=
 =?us-ascii?Q?6udekAPXdvEsAHuiia2tUvvlSzDJL/uVIWpQthMWcGGeJoV1d61IaVA1AdAc?=
 =?us-ascii?Q?KEWkYoihbgrbqhwcisaA1iDC08s1VtVCO4g2WB4vjG5g4nl5B/YqDxnAErL9?=
 =?us-ascii?Q?RbtwHvkQfXb8oOqI/niMIg5pABiyXiG2C9pe6+0TcbM46asuSNjssTnbwTYT?=
 =?us-ascii?Q?G/DKt7Vs/XA5ut6VwZTUXB0bMr4ZpolHMUQMwRWXtFEhUKAoeguIzVd/TLtw?=
 =?us-ascii?Q?AyzGxWzbnMJpPPXKZC8o1pXqotE/4fJjdc8JsbsEWeMrna1MVCvhvQEnEAbK?=
 =?us-ascii?Q?YUpsTInW13EDjEaH5sO6z79IfzFpmrc0+H4VfmQtUq6+Mg425FyhmaHw7pbt?=
 =?us-ascii?Q?iCDbPqce8xO8iylb2NizLGFVbKMBSkoZRaRIj6SxXrWrYLw3RlMFoKUM1Kc3?=
 =?us-ascii?Q?0woHpKNUmMojpcWg+X+jE4r4wEce755B+WcmCy9bawUprzE0kx+JbKOWWlSt?=
 =?us-ascii?Q?cEMA55FbZxHy34CjZnBMYrDgdnWRkVR9zEKVIesf/p+vbNK+qKgBPfY4zrsN?=
 =?us-ascii?Q?tnPPeMcs9LpnlK3w3l2klfA8a/ZSovJQQ5YFW7H4Ns/6nOcZRDYHLNJXsMYK?=
 =?us-ascii?Q?gZ6dbHts5u29feZ2HQc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0368e5c-ac70-4172-3272-08dd773be9e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 07:55:36.7002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TCovqLIelkhhQW3frhJ+0pXIuVm7sOCGjaU9QQIhIVCNlwukL/ffsPDZtGQc5kwYj999K49qWinfwZzrU4d2vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6628
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

[AMD Official Use Only - AMD Internal Distribution Only]

Please ignore these series,   will update new versions.

-----Original Message-----
From: Jesse.zhang@amd.com <jesse.zhang@amd.com>
Sent: Wednesday, April 9, 2025 3:50 PM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Khatri, Su=
nil <Sunil.Khatri@amd.com>; Liang, Prike <Prike.Liang@amd.com>; Zhang, Jess=
e(Jie) <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/3] lib/meson.build: Add AMDGPU_USERQ_ENABLED check =
for user queues

From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>

Detect whether libdrm provides amdgpu_create_userqueue() and define AMDGPU_=
USERQ_ENABLED if available. This enables user queue support when building a=
gainst newer libdrm while maintaining compatibility with older versions tha=
t lack this function.

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
---
 lib/meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build index d7bb72c57..8517cd540 1=
00644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -172,6 +172,11 @@ if libdrm_amdgpu.found()
                lib_sources +=3D[ 'amdgpu/amd_dispatch.c',]
        else
                warning('libdrm <=3D 2.4.99 found, amdgpu_cs_query_reset_st=
ate2 not applicable')
+       endif
+
+       if cc.has_function('amdgpu_create_userqueue', dependencies: libdrm_=
amdgpu)
+               add_project_arguments('-DAMDGPU_USERQ_ENABLED=3D1', languag=
e: 'c')
+               #conf.set('AMDGPU_USERQ_ENABLED', 1)
        endif
 endif

--
2.25.1

