Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E6DC87FC9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Jul 2025 21:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870C610E6EE;
	Wed, 30 Jul 2025 21:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CyKvHKul";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E3310E6EE
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jul 2025 21:50:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdPLN5cA4RVpagEg1xqads5NNRWPf/fCL6Sejsl1nl/vNfEY4oDZ7pr6J8qvzILGWHAPeU0fJ1DWG0GQoQfPBO/eOiEFOmbkjTivtfhjYvtGtMCXOn1+okgW0ddBQRO2xLl4qz9EcBnuJPiMr7xgwDcJZ+tCHiebrqGv8dvYLwRDd5SRZgk6sz893EV7kdnvU2Fdk6AyrnKDxqtGzb67kIwOvvorrQoF+e+lAS0yZZgDmklQbfRPnzs/77w0NhnbFvFGtOpYaITgyFvOXej95yTa3ni94QCeBVlFhlzfyzxMR0c69UB/Eubz9BwQL1qYMeFRyyq4qupEUkYCV57lpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BgiJOFjVHJJG4Cuac/9/dwvQSstxgA6mgG0wx2twYE=;
 b=RTdmmqNRmIPlTDfw2DGwlhtuIUcN7QOGshFWfvneJTE5B8em56ZjnBfnXhZpTQSIjYPrlvFQssX+G8jHRnUbYnF5wEcqWijMkPKKFDKL9aMD/iaS305s6IzUSGfHhf7hkL7AR60CFPm4KhWg62K2fvNyXQaiWn9CHxzE3Voy8pCyZpfeLG0x4yJeZg4WG9TLVLIuH04sowoGibjiIsisMdb/wh0qinBFAI0Orq/DhWHU+qz7kTrtA6nX9APTCg6JBpIBzySq3CD41/PhoYiATDlI1fbs7AVRTWfX6b/4ht6oLX1XZQo2ecqbxf81upfhqpoPQu0PEIgBItsiExcg7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BgiJOFjVHJJG4Cuac/9/dwvQSstxgA6mgG0wx2twYE=;
 b=CyKvHKulJIX4V2zIBGIu93+wCk7p1yLjhnmW+FNDp2Lu4Vlw9u5fXRxEFxWy7WgN9LYHmasyxh/lf4LTJmvcCzeZOHw9IT3vfoWw7Yq5efP40cXs7EOoTcoryn4rS1VBHW0oB/rEHdvCxDMUvoPYBbfqFukPoy1spf6JORqCnNo=
Received: from BN9PR12MB5146.namprd12.prod.outlook.com (2603:10b6:408:137::16)
 by CY3PR12MB9608.namprd12.prod.outlook.com (2603:10b6:930:102::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 21:50:03 +0000
Received: from BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::b111:2482:eb49:3186]) by BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::b111:2482:eb49:3186%7]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 21:50:03 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, "Kasiviswanathan, Harish"
 <Harish.Kasiviswanathan@amd.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Simona
 Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>, Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: RE: [RFC i-g-t v3 0/1] A tool to demonstrate use of netlink sockets
 to read RAS error counters
Thread-Topic: [RFC i-g-t v3 0/1] A tool to demonstrate use of netlink sockets
 to read RAS error counters
Thread-Index: AQHcARlJ+sVYNkA3wk2l3TBAg+IW8rRLGISAgAAKBgA=
Date: Wed, 30 Jul 2025 21:50:03 +0000
Message-ID: <BN9PR12MB5146349A6BD4F3771CA11F6DF724A@BN9PR12MB5146.namprd12.prod.outlook.com>
References: <20250730061342.1380217-1-aravind.iddamsetty@linux.intel.com>
 <aIp7I5OjRMx6MPmh@intel.com>
In-Reply-To: <aIp7I5OjRMx6MPmh@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-30T20:42:06.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5146:EE_|CY3PR12MB9608:EE_
x-ms-office365-filtering-correlation-id: a3701d0d-51d3-475e-eacd-08ddcfb30a34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?FFgySyI1rG5pXRO9pqUr3RWdtyQDDsTIqLw88nZaF/wU4Vtt6VZDYHridQ9i?=
 =?us-ascii?Q?iVyEQC3MQOZmoUuLO6X8Aru+QVbLke5f6CY1FAY4EpuDmACl6ZERSRI3ak8h?=
 =?us-ascii?Q?BQEa72dlk//hAQULoOg5vGFiAmV7tSkW6K8bH8qLr+s41zLpRw5Pkurs3eb2?=
 =?us-ascii?Q?kkOKqJvh05gQfb8w8nKwsdtdhI0PpV9mvGL4IFzt2Hcb6fiwwCoyQCV6OC6n?=
 =?us-ascii?Q?dhndOoCLU2VPCgzG6e7k/0Ykc5BK8rrWUyOSSiHQyiJjtkS3cb7t5DSqVqY5?=
 =?us-ascii?Q?P7vGU0CYOR2y2oU9RB/vX5YYlpxJwNIlqOq3mA6tLaAgiFZ0gsIw8M/TR2wM?=
 =?us-ascii?Q?fa3Db86YRsSLxPaDnKDLt5HVDrHqaRQsYp7XtMHap//xRNM+LwyMwlfpiyVw?=
 =?us-ascii?Q?z8t7KGvWHaDH6ZKGddGydXTkMIYc5o3DrlsPOWk4qYru5jhz8coIoHuwVU73?=
 =?us-ascii?Q?3NBVGf+xIbuxb1Vtdjx+lAPZBC8PNAO7LPuEoUGGaNmd44CDh4TAClljXAnf?=
 =?us-ascii?Q?c79IUM1lISpMdwMh6XL6yJ4MV/6Y7xYCMQ5ibb3HFb/QCqN3bss+0NuK8/ov?=
 =?us-ascii?Q?4PZbkxgHXrGlaVpIG2JCNqJ3/Nv1UAY/fE8rLGw7/ugbt0N/bmHkWe7/mscU?=
 =?us-ascii?Q?YIdHX24/hRDbSwvbqUZxVQSSmVksr2/P22nhujhDwyxe2lRTDRxYnCL8xR8l?=
 =?us-ascii?Q?SntVbUvE0LFW8ZrhTm7KfHmaO0TrcZQ5e9JoiBfi15+ncgzzVBp/T4B14JCu?=
 =?us-ascii?Q?/PjUkz3s5EVu7im2mBVwuFryIhkvS4Y9iN2pT8/MpQx7DM0zSllu5HgnhcDA?=
 =?us-ascii?Q?mPPfOjxOLtq0AfV+iHm3frKXpBZiHC6p92lfUbDD8sD3vspFhUAMdik0zJrP?=
 =?us-ascii?Q?xCi6d2V3/nw1YbAbuE6I0b2e64edIld6TWlZtCLsnuURxGIGOCZvs2OXB8sd?=
 =?us-ascii?Q?nVzFZabifuG1TMvlTId0Ch6Y7p1JNAaEzBN8rqA+K6oB1gJPULvO5xDDIBBQ?=
 =?us-ascii?Q?MMpYBbyb276dwQ6kS4UYG4BGilvYOGBdHsFLKi0lWsQ1ALkrUpjBgI1ZkUim?=
 =?us-ascii?Q?RWj1kch5VwrmZweWgM/IV7EvXkmwZsWp8HYdcJueQ+9l03y5alDlNSpr687W?=
 =?us-ascii?Q?Ju6iWp5UVCecabmmeeBQ7dhh3NolJb0d6S9THgwq0WJvCf8ZHOwjOedl9t5W?=
 =?us-ascii?Q?0Otg135tFAkaN48hau/S31cmOz298GhA5Gnp/ibj5XIlnanMDU2K9GKFOiKj?=
 =?us-ascii?Q?fn/GZqY63msc/7CGTlKWL2XSlePzGH+X97IjEKPdPBwKrJFKfY/pDv6M6k2U?=
 =?us-ascii?Q?m6R+IrRFMj3cNzjtu/+3FlwryOhSwSphdOGCBQg2Q1yfXM/IW0DupX25GaZg?=
 =?us-ascii?Q?0TwizEVcIr7FHXilh/MeuP6dFjmJgs1UyMcNI0ylbTPq2tZzxK91cQHx6aIY?=
 =?us-ascii?Q?ljVluHsfgRDL5SES+OL4BbInLPACjhS5uwDLJkEf7yu+HTkAkGC2DK7KUFGf?=
 =?us-ascii?Q?BllA6ktdYgvPFNc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jrsdhuOja1mgLoVxbJ7CpIgYV0QJWNEzaWswWBdQpcslnneSlsWZsaRkrlLV?=
 =?us-ascii?Q?DM+gnIY9zSZdSwZ/+t/t++wjdVx9Ze5n5N6vNTBrwR/0HTQqMmqqbGiKK5PA?=
 =?us-ascii?Q?bzSLF7ye3VlSt6aCgkv2sboP9UAlO4+2acA88a6f7Cs9mMgxg8CAt1wXQ6mN?=
 =?us-ascii?Q?40Q2rfYbvHFtF8lmgzTajc7y//0DemQmZhF8HXUITHvYNgKNEDBRgvKjRD3Z?=
 =?us-ascii?Q?o+x3iYvXiSwWNJv9sa605ftmcurKXcmSJ2EPnnRof6ORfyEA1lgtkoXDNfdO?=
 =?us-ascii?Q?M+pYTagz/WCz6gqD0wiOoKAB5ipObvUJpu/c187qQWiqbbl+SATdfNnoSlkE?=
 =?us-ascii?Q?ahsA3pdfak+U5WPGuaVAdN2nKkBi74VnK4iA+VjJF2S8MyNJ09OMmUOxectB?=
 =?us-ascii?Q?CF9HMfv0a/GnLHh12yEb7V+0gDM//hBZm246TVcMDM9Bo7DTRl1MMTEsVoNn?=
 =?us-ascii?Q?ritG8YVhG4obBFOrKJF/xSvPmwXP+ydskKEedo6b21/e26R0jpuM+VG7mCuy?=
 =?us-ascii?Q?jsQmvPAfffGeaOEQHDvm3bJ4SAq9QsaJhnLRbfhDtQwnyGjJ4tllKY0J/Mja?=
 =?us-ascii?Q?7QIYgl6LKyUKCMMnfYoy/iMi3jM6jOjcFKgWMG31Y2iVtAFQ5VHjsQQuQXzi?=
 =?us-ascii?Q?ae+rQloEqN/2b+tz1TmlQtM44fft3c+O6hVhGKN5G28j4Ybz9aVDxUARsiU1?=
 =?us-ascii?Q?BdPQ0D/uSv/4fXFzoiUHtDmnSIxI/nz/kLPMx+BWUDTn6qa5n31SfrGtxUV5?=
 =?us-ascii?Q?5wkeH11F3c/ukC250rs+aBuSHNBox+s+L5aopuqfxrYAMzU8WjoyYy+XVnAb?=
 =?us-ascii?Q?crfpEd9HpMgMNHHbVue2O4RvUVBbjibDWba6+hGCxDGOUOyw5ttcwQro3ew6?=
 =?us-ascii?Q?k8D5yyDDpFe9vg7g9IncvBiy6liEurZXQbYzqKv4CtDFnaDv+4cQUei3pqH+?=
 =?us-ascii?Q?qxF9fB90vmuTJErxfkoXEw+HIEsfTZ3XpIebpHpeKs06DDRkormxJmumFpv8?=
 =?us-ascii?Q?Je30Lfqw+ne0T6rVSCxp6oBfsmrD10/ffFRnR0kEPfFK4OU7iuVLmf3G8Hh3?=
 =?us-ascii?Q?d7sE1ZkmfZOLInwfEyVEoJebuL9c5SI4Y7yg6Ffv57+RSM2qLFWCbjWiOrm+?=
 =?us-ascii?Q?RzbmQDTN4wD7vocD37PIV9VCo1+UFWCrEgyX+LritoF551bYt8INOs7O1EzN?=
 =?us-ascii?Q?D4CA/mYAo5rQfxthsTVZTzDBwcN9pfwmOfb0lbsDPxly+6Of3CM5aH3cjiad?=
 =?us-ascii?Q?ZjdDUyNAcHFcsC4/GXlxn7/sD4sC1JV5XaxYuicIe30SMADckOWFQOUjQEv5?=
 =?us-ascii?Q?FdVIMV44lsqaKFnAs3+0ICAA/evymS05SX1jNaiGhK41Q8TdsOekv837mcr7?=
 =?us-ascii?Q?thiYpGhAIDYIRio8aehagW32jOxRjoXn4xabN0vgIz040YRAlaGAU15Pt4Yo?=
 =?us-ascii?Q?DrkLvUnb4nRCAOsHMjj6wA5L3sv0IyqnQRXZjLju0htzWDfekpysPs4J6wkT?=
 =?us-ascii?Q?K8X88opXV6mjFGhMRCLrTWux4IDRRJPvdkuh+SeF9sk+UpAuErcdcU5rbJzv?=
 =?us-ascii?Q?ZTfQcFv6ebzP6upQEaw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3701d0d-51d3-475e-eacd-08ddcfb30a34
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 21:50:03.3696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKtMFFEDPjGMw7nlzO54s04WcdcubbKThISrqnSH4Eu5CX1TzLHgGkyC19CDXrrN5UWzZe9ocGIuktWv3ICfaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9608
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

[Public]

> -----Original Message-----
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Sent: Wednesday, July 30, 2025 4:06 PM
> To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>; Deucher, Ale=
xander
> <Alexander.Deucher@amd.com>
> Cc: igt-dev@lists.freedesktop.org; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Simona Vetter <simona@ffwll.ch>; David Airli=
e
> <airlied@gmail.com>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Z=
hang,
> Hawking <Hawking.Zhang@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>; Riana
> Tauro <riana.tauro@intel.com>; Anshuman Gupta <anshuman.gupta@intel.com>
> Subject: Re: [RFC i-g-t v3 0/1] A tool to demonstrate use of netlink sock=
ets to read
> RAS error counters
>
> On Wed, Jul 30, 2025 at 11:43:41AM +0530, Aravind Iddamsetty wrote:
> > This tool is to demonstrate the use of netlink sockets to read RAS
> > error counters, which is being proposed via series
>
> Alex, what tools are in use for RAS on AMD side?
> I noticed something in the mesa repo recently. But perhaps you have other=
 high
> level tools as well?
>
> I'm wondering if we should we try consolidate in this tool here in IGT as=
 some
> official one to drive the RAS netlink APIs in a unified way? Besides conv=
erting any
> other tool to this API of course.

+ Harish

Hawking, Harish, and Lijo can probably provide better feedback since they a=
re closer to the RAS stuff more recently.  That said, we have amdsmi and rd=
c which are used to handle RAS stuff among other things:
https://github.com/ROCm/amdsmi
https://github.com/ROCm/rdc

We have some documentation on our kernel interface as well:
https://docs.kernel.org/gpu/amdgpu/ras.html


Alex

>
> > "[RFC v5 0/5] Proposal to use netlink for RAS and Telemetry across drm
> subsystem".
> >
> > v2: update uapi header.
> > v3: Add DRM_RAS_CMD_READ_BLOCK command to read errors from an IP
> Block.
> >
> > The tool supports the following commands:
> > READ_ONE, READ_BLOCK, READ_ALL, WAIT_ON_EVENT, LIST_ERRORS
> >
> > read single error counter:
> >
> > $ ./drm_ras READ_ONE --device=3Ddrm:/dev/dri/card1
> > --error_id=3D0x0000000000000005 counter value 0
> >
> > read all error counters:
> >
> > $ ./drm_ras READ_ALL --device=3Ddrm:/dev/dri/card1
> > name                                                    config-id      =
         counter
> >
> > error-gt0-correctable-guc                               0x0000000000000=
001      0
> > error-gt0-correctable-slm                               0x0000000000000=
003      0
> > error-gt0-correctable-eu-ic                             0x0000000000000=
004      0
> > error-gt0-correctable-eu-grf                            0x0000000000000=
005      0
> > error-gt0-fatal-guc                                     0x0000000000000=
009      0
> > error-gt0-fatal-slm                                     0x0000000000000=
00d      0
> > error-gt0-fatal-eu-grf                                  0x0000000000000=
00f      0
> > error-gt0-fatal-fpu                                     0x0000000000000=
010      0
> > error-gt0-fatal-tlb                                     0x0000000000000=
011      0
> > error-gt0-fatal-l3-fabric                               0x0000000000000=
012      0
> > error-gt0-correctable-subslice                          0x0000000000000=
013      0
> > error-gt0-correctable-l3bank                            0x0000000000000=
014      0
> > error-gt0-fatal-subslice                                0x0000000000000=
015      0
> > error-gt0-fatal-l3bank                                  0x0000000000000=
016      0
> > error-gt0-sgunit-correctable                            0x0000000000000=
017      0
> > error-gt0-sgunit-nonfatal                               0x0000000000000=
018      0
> > error-gt0-sgunit-fatal                                  0x0000000000000=
019      0
> > error-gt0-soc-fatal-psf-csc-0                           0x0000000000000=
01a      0
> > error-gt0-soc-fatal-psf-csc-1                           0x0000000000000=
01b      0
> > error-gt0-soc-fatal-psf-csc-2                           0x0000000000000=
01c      0
> > error-gt0-soc-fatal-punit                               0x0000000000000=
01d      0
> > error-gt0-soc-fatal-psf-0                               0x0000000000000=
01e      0
> > error-gt0-soc-fatal-psf-1                               0x0000000000000=
01f      0
> > error-gt0-soc-fatal-psf-2                               0x0000000000000=
020      0
> > error-gt0-soc-fatal-cd0                                 0x0000000000000=
021      0
> > error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000=
022      0
> > error-gt0-soc-fatal-mdfi-east                           0x0000000000000=
023      0
> > error-gt0-soc-fatal-mdfi-south                          0x0000000000000=
024      0
> > error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000=
025      0
> > error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000=
026      0
> > error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000=
027      0
> > error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000=
028      0
> > error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000=
029      0
> > error-gt0-soc-fatal-hbm-ss0-5                           0x0000000000000=
02a      0
> > error-gt0-soc-fatal-hbm-ss0-6                           0x0000000000000=
02b      0
> > error-gt0-soc-fatal-hbm-ss0-7                           0x0000000000000=
02c      0
> > error-gt0-soc-fatal-hbm-ss1-0                           0x0000000000000=
02d      0
> > error-gt0-soc-fatal-hbm-ss1-1                           0x0000000000000=
02e      0
> > error-gt0-soc-fatal-hbm-ss1-2                           0x0000000000000=
02f      0
> > error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000=
030      0
> > error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000=
031      0
> > error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000=
032      0
> > error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000=
033      0
> > error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000=
034      0
> > error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000=
035      0
> > error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000=
036      0
> > error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000=
037      0
> > error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000=
038      0
> > error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000=
039      0
> > error-gt0-soc-fatal-hbm-ss2-5                           0x0000000000000=
03a      0
> > error-gt0-soc-fatal-hbm-ss2-6                           0x0000000000000=
03b      0
> > error-gt0-soc-fatal-hbm-ss2-7                           0x0000000000000=
03c      0
> > error-gt0-soc-fatal-hbm-ss3-0                           0x0000000000000=
03d      0
> > error-gt0-soc-fatal-hbm-ss3-1                           0x0000000000000=
03e      0
> > error-gt0-soc-fatal-hbm-ss3-2                           0x0000000000000=
03f      0
> > error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000=
040      0
> > error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000=
041      0
> > error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000=
042      0
> > error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000=
043      0
> > error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000=
044      0
> > error-gt0-gsc-correctable-sram-ecc                      0x0000000000000=
045      0
> > error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000=
046      0
> > error-gt0-gsc-nonfatal-mia-int                          0x0000000000000=
047      0
> > error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000=
048      0
> > error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000=
049      0
> > error-gt0-gsc-nonfatal-rom-parity                       0x0000000000000=
04a      0
> > error-gt0-gsc-nonfatal-ucode-parity                     0x0000000000000=
04b      0
> > error-gt0-gsc-nonfatal-glitch-det                       0x0000000000000=
04c      0
> > error-gt0-gsc-nonfatal-fuse-pull                        0x0000000000000=
04d      0
> > error-gt0-gsc-nonfatal-fuse-crc-check                   0x0000000000000=
04e      0
> > error-gt0-gsc-nonfatal-selfmbist                        0x0000000000000=
04f      0
> > error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000=
050      0
> > error-gt1-correctable-guc                               0x1000000000000=
001      0
> > error-gt1-correctable-slm                               0x1000000000000=
003      0
> > error-gt1-correctable-eu-ic                             0x1000000000000=
004      0
> > error-gt1-correctable-eu-grf                            0x1000000000000=
005      0
> > error-gt1-fatal-guc                                     0x1000000000000=
009      0
> > error-gt1-fatal-slm                                     0x1000000000000=
00d      0
> > error-gt1-fatal-eu-grf                                  0x1000000000000=
00f      0
> > error-gt1-fatal-fpu                                     0x1000000000000=
010      0
> > error-gt1-fatal-tlb                                     0x1000000000000=
011      0
> > error-gt1-fatal-l3-fabric                               0x1000000000000=
012      0
> > error-gt1-correctable-subslice                          0x1000000000000=
013      0
> > error-gt1-correctable-l3bank                            0x1000000000000=
014      0
> > error-gt1-fatal-subslice                                0x1000000000000=
015      0
> > error-gt1-fatal-l3bank                                  0x1000000000000=
016      0
> > error-gt1-sgunit-correctable                            0x1000000000000=
017      0
> > error-gt1-sgunit-nonfatal                               0x1000000000000=
018      0
> > error-gt1-sgunit-fatal                                  0x1000000000000=
019      0
> > error-gt1-soc-fatal-psf-csc-0                           0x1000000000000=
01a      0
> > error-gt1-soc-fatal-psf-csc-1                           0x1000000000000=
01b      0
> > error-gt1-soc-fatal-psf-csc-2                           0x1000000000000=
01c      0
> > error-gt1-soc-fatal-punit                               0x1000000000000=
01d      0
> > error-gt1-soc-fatal-psf-0                               0x1000000000000=
01e      0
> > error-gt1-soc-fatal-psf-1                               0x1000000000000=
01f      0
> > error-gt1-soc-fatal-psf-2                               0x1000000000000=
020      0
> > error-gt1-soc-fatal-cd0                                 0x1000000000000=
021      0
> > error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000=
022      0
> > error-gt1-soc-fatal-mdfi-east                           0x1000000000000=
023      0
> > error-gt1-soc-fatal-mdfi-south                          0x1000000000000=
024      0
> > error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000=
025      0
> > error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000=
026      0
> > error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000=
027      0
> > error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000=
028      0
> > error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000=
029      0
> > error-gt1-soc-fatal-hbm-ss0-5                           0x1000000000000=
02a      0
> > error-gt1-soc-fatal-hbm-ss0-6                           0x1000000000000=
02b      0
> > error-gt1-soc-fatal-hbm-ss0-7                           0x1000000000000=
02c      0
> > error-gt1-soc-fatal-hbm-ss1-0                           0x1000000000000=
02d      0
> > error-gt1-soc-fatal-hbm-ss1-1                           0x1000000000000=
02e      0
> > error-gt1-soc-fatal-hbm-ss1-2                           0x1000000000000=
02f      0
> > error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000=
030      0
> > error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000=
031      0
> > error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000=
032      0
> > error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000=
033      0
> > error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000=
034      0
> > error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000=
035      0
> > error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000=
036      0
> > error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000=
037      0
> > error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000=
038      0
> > error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000=
039      0
> > error-gt1-soc-fatal-hbm-ss2-5                           0x1000000000000=
03a      0
> > error-gt1-soc-fatal-hbm-ss2-6                           0x1000000000000=
03b      0
> > error-gt1-soc-fatal-hbm-ss2-7                           0x1000000000000=
03c      0
> > error-gt1-soc-fatal-hbm-ss3-0                           0x1000000000000=
03d      0
> > error-gt1-soc-fatal-hbm-ss3-1                           0x1000000000000=
03e      0
> > error-gt1-soc-fatal-hbm-ss3-2                           0x1000000000000=
03f      0
> > error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000=
040      0
> > error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000=
041      0
> > error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000=
042      0
> > error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000=
043      0
> > error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000=
044      0
> >
> > wait on a error event:
> >
> > $ ./drm_ras WAIT_ON_EVENT --device=3Ddrm:/dev/dri/card1 waiting for
> > error event error event received counter value 0
> >
> > list all errors:
> >
> > $ ./drm_ras LIST_ERRORS --device=3Ddrm:/dev/dri/card1
> > name                                                    config-id
> >
> > error-gt0-correctable-guc                               0x0000000000000=
001
> > error-gt0-correctable-slm                               0x0000000000000=
003
> > error-gt0-correctable-eu-ic                             0x0000000000000=
004
> > error-gt0-correctable-eu-grf                            0x0000000000000=
005
> > error-gt0-fatal-guc                                     0x0000000000000=
009
> > error-gt0-fatal-slm                                     0x0000000000000=
00d
> > error-gt0-fatal-eu-grf                                  0x0000000000000=
00f
> > error-gt0-fatal-fpu                                     0x0000000000000=
010
> > error-gt0-fatal-tlb                                     0x0000000000000=
011
> > error-gt0-fatal-l3-fabric                               0x0000000000000=
012
> > error-gt0-correctable-subslice                          0x0000000000000=
013
> > error-gt0-correctable-l3bank                            0x0000000000000=
014
> > error-gt0-fatal-subslice                                0x0000000000000=
015
> > error-gt0-fatal-l3bank                                  0x0000000000000=
016
> > error-gt0-sgunit-correctable                            0x0000000000000=
017
> > error-gt0-sgunit-nonfatal                               0x0000000000000=
018
> > error-gt0-sgunit-fatal                                  0x0000000000000=
019
> > error-gt0-soc-fatal-psf-csc-0                           0x0000000000000=
01a
> > error-gt0-soc-fatal-psf-csc-1                           0x0000000000000=
01b
> > error-gt0-soc-fatal-psf-csc-2                           0x0000000000000=
01c
> > error-gt0-soc-fatal-punit                               0x0000000000000=
01d
> > error-gt0-soc-fatal-psf-0                               0x0000000000000=
01e
> > error-gt0-soc-fatal-psf-1                               0x0000000000000=
01f
> > error-gt0-soc-fatal-psf-2                               0x0000000000000=
020
> > error-gt0-soc-fatal-cd0                                 0x0000000000000=
021
> > error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000=
022
> > error-gt0-soc-fatal-mdfi-east                           0x0000000000000=
023
> > error-gt0-soc-fatal-mdfi-south                          0x0000000000000=
024
> > error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000=
025
> > error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000=
026
> > error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000=
027
> > error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000=
028
> > error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000=
029
> > error-gt0-soc-fatal-hbm-ss0-5                           0x0000000000000=
02a
> > error-gt0-soc-fatal-hbm-ss0-6                           0x0000000000000=
02b
> > error-gt0-soc-fatal-hbm-ss0-7                           0x0000000000000=
02c
> > error-gt0-soc-fatal-hbm-ss1-0                           0x0000000000000=
02d
> > error-gt0-soc-fatal-hbm-ss1-1                           0x0000000000000=
02e
> > error-gt0-soc-fatal-hbm-ss1-2                           0x0000000000000=
02f
> > error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000=
030
> > error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000=
031
> > error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000=
032
> > error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000=
033
> > error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000=
034
> > error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000=
035
> > error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000=
036
> > error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000=
037
> > error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000=
038
> > error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000=
039
> > error-gt0-soc-fatal-hbm-ss2-5                           0x0000000000000=
03a
> > error-gt0-soc-fatal-hbm-ss2-6                           0x0000000000000=
03b
> > error-gt0-soc-fatal-hbm-ss2-7                           0x0000000000000=
03c
> > error-gt0-soc-fatal-hbm-ss3-0                           0x0000000000000=
03d
> > error-gt0-soc-fatal-hbm-ss3-1                           0x0000000000000=
03e
> > error-gt0-soc-fatal-hbm-ss3-2                           0x0000000000000=
03f
> > error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000=
040
> > error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000=
041
> > error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000=
042
> > error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000=
043
> > error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000=
044
> > error-gt0-gsc-correctable-sram-ecc                      0x0000000000000=
045
> > error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000=
046
> > error-gt0-gsc-nonfatal-mia-int                          0x0000000000000=
047
> > error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000=
048
> > error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000=
049
> > error-gt0-gsc-nonfatal-rom-parity                       0x0000000000000=
04a
> > error-gt0-gsc-nonfatal-ucode-parity                     0x0000000000000=
04b
> > error-gt0-gsc-nonfatal-glitch-det                       0x0000000000000=
04c
> > error-gt0-gsc-nonfatal-fuse-pull                        0x0000000000000=
04d
> > error-gt0-gsc-nonfatal-fuse-crc-check                   0x0000000000000=
04e
> > error-gt0-gsc-nonfatal-selfmbist                        0x0000000000000=
04f
> > error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000=
050
> > error-gt1-correctable-guc                               0x1000000000000=
001
> > error-gt1-correctable-slm                               0x1000000000000=
003
> > error-gt1-correctable-eu-ic                             0x1000000000000=
004
> > error-gt1-correctable-eu-grf                            0x1000000000000=
005
> > error-gt1-fatal-guc                                     0x1000000000000=
009
> > error-gt1-fatal-slm                                     0x1000000000000=
00d
> > error-gt1-fatal-eu-grf                                  0x1000000000000=
00f
> > error-gt1-fatal-fpu                                     0x1000000000000=
010
> > error-gt1-fatal-tlb                                     0x1000000000000=
011
> > error-gt1-fatal-l3-fabric                               0x1000000000000=
012
> > error-gt1-correctable-subslice                          0x1000000000000=
013
> > error-gt1-correctable-l3bank                            0x1000000000000=
014
> > error-gt1-fatal-subslice                                0x1000000000000=
015
> > error-gt1-fatal-l3bank                                  0x1000000000000=
016
> > error-gt1-sgunit-correctable                            0x1000000000000=
017
> > error-gt1-sgunit-nonfatal                               0x1000000000000=
018
> > error-gt1-sgunit-fatal                                  0x1000000000000=
019
> > error-gt1-soc-fatal-psf-csc-0                           0x1000000000000=
01a
> > error-gt1-soc-fatal-psf-csc-1                           0x1000000000000=
01b
> > error-gt1-soc-fatal-psf-csc-2                           0x1000000000000=
01c
> > error-gt1-soc-fatal-punit                               0x1000000000000=
01d
> > error-gt1-soc-fatal-psf-0                               0x1000000000000=
01e
> > error-gt1-soc-fatal-psf-1                               0x1000000000000=
01f
> > error-gt1-soc-fatal-psf-2                               0x1000000000000=
020
> > error-gt1-soc-fatal-cd0                                 0x1000000000000=
021
> > error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000=
022
> > error-gt1-soc-fatal-mdfi-east                           0x1000000000000=
023
> > error-gt1-soc-fatal-mdfi-south                          0x1000000000000=
024
> > error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000=
025
> > error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000=
026
> > error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000=
027
> > error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000=
028
> > error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000=
029
> > error-gt1-soc-fatal-hbm-ss0-5                           0x1000000000000=
02a
> > error-gt1-soc-fatal-hbm-ss0-6                           0x1000000000000=
02b
> > error-gt1-soc-fatal-hbm-ss0-7                           0x1000000000000=
02c
> > error-gt1-soc-fatal-hbm-ss1-0                           0x1000000000000=
02d
> > error-gt1-soc-fatal-hbm-ss1-1                           0x1000000000000=
02e
> > error-gt1-soc-fatal-hbm-ss1-2                           0x1000000000000=
02f
> > error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000=
030
> > error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000=
031
> > error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000=
032
> > error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000=
033
> > error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000=
034
> > error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000=
035
> > error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000=
036
> > error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000=
037
> > error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000=
038
> > error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000=
039
> > error-gt1-soc-fatal-hbm-ss2-5                           0x1000000000000=
03a
> > error-gt1-soc-fatal-hbm-ss2-6                           0x1000000000000=
03b
> > error-gt1-soc-fatal-hbm-ss2-7                           0x1000000000000=
03c
> > error-gt1-soc-fatal-hbm-ss3-0                           0x1000000000000=
03d
> > error-gt1-soc-fatal-hbm-ss3-1                           0x1000000000000=
03e
> > error-gt1-soc-fatal-hbm-ss3-2                           0x1000000000000=
03f
> > error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000=
040
> > error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000=
041
> > error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000=
042
> > error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000=
043
> > error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000=
044
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> > Cc: Lijo Lazar <lijo.lazar@amd.com>
> > Cc: Riana Tauro <riana.tauro@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> >
> >
> > Aravind Iddamsetty (1):
> >   tools/RAS: A tool to read error counters
> >
> >  include/drm-uapi/drm_netlink.h | 105 ++++++++
> >  meson.build                    |   4 +
> >  tools/drm_ras.c                | 428 +++++++++++++++++++++++++++++++++
> >  tools/meson.build              |   5 +
> >  4 files changed, 542 insertions(+)
> >  create mode 100644 include/drm-uapi/drm_netlink.h  create mode 100644
> > tools/drm_ras.c
> >
> > --
> > 2.25.1
> >
