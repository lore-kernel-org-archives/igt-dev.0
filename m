Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DEFC30653
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 13:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BE910E0FC;
	Wed, 26 Jun 2024 13:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BFLZvjat";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351C710E06B
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 13:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frnL24uswpflzH+2tRscS6Amiz6S9BlFDUwWFuk4uztcULkpdYgrzo2mnDTsWM1yUo0BBOOciC+aNTrJpBtpgG81AET0FVinpmM7L7nx7yKvsc2YpP6q1JJL3cEWZq9XE7/FLIMGLhrv6rSiYXXy+AOi4RmzceUXsOegYcNYLhrlzSW8ZxivlD89SZkjHyGjFICApV8hoyvHS1kEp/etnztJ3EWrOUMsVKe6tBV+t9zA68a+C8VZfe32dOuhiqfK4+TZSTz5FzWR+Bw+NL7dcDvOkfmj4RS82KeYKe2ue6dtod+UZR7XxrBCAlRwvvIXbnimsyyxhCa90ouyPPR3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbZJUN7802KqOEyYPPIXI+k0OG2UOdUpvX7pUl3Mkfk=;
 b=LvhlpZGGn65prhWliLZW8xPgEPpYZv9PVKsj23bF6niVy5fhRw8YVS0Qzph0XO71WHpbfNxSm8DXIXXMDEr3sP92/4TBfSlDvmaRV9KJ96OrlBofe/C4BwqOTc+Ib3ruj65dlp9LZUpYi2+MAavtfJrhkxWuV8T5bnG/ni6JKJJeGafGcT8tnDEMYyJsEeqyZw4mGtUu4wuwHiOAXMJtdWIuhlp5OVKHTz7qaHtGwCvabkOnWy3BTvp+Pm9PGng7ERqwWgpCCg0LMYlp6cHFNmp6hfUrbzPNFx31Jbu+PqQQU2vB/4QsvMJ1qC0vCC6OkLNYvWCM2SaIo5B/la1tYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbZJUN7802KqOEyYPPIXI+k0OG2UOdUpvX7pUl3Mkfk=;
 b=BFLZvjat+4KT2XzmYq2S05dhMuDD1QzfHlszKb9gG9UMOmNGpdWku+JkxgGLHJ12bL0Evd8Ayzsf5KzYeEISuPoNOVT3tjdjX/IgyV9KJncSsqdoM10cbRAcL9ZGyJl1CCSp2JrPM/20r6/3oNMDFEUky2EeQ7pJQKD5f3oCgrI=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by MN2PR12MB4376.namprd12.prod.outlook.com (2603:10b6:208:26c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Wed, 26 Jun
 2024 13:21:19 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%5]) with mapi id 15.20.7698.032; Wed, 26 Jun 2024
 13:21:19 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t,1/2] tests/kms_bw: add subtest for only connected outputs
Thread-Topic: [i-g-t, 1/2] tests/kms_bw: add subtest for only connected outputs
Thread-Index: AQHax4YFdfZW6MCcYEWakVZGHPwc2LHaCEdL
Date: Wed, 26 Jun 2024 13:21:18 +0000
Message-ID: <CH0PR12MB5284275908C11FCA165D52548BD62@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20240619080408.1161329-2-kunal1.joshi@intel.com>
 <aabb925a-b578-407b-bbdd-05d6c019b539@intel.com>
In-Reply-To: <aabb925a-b578-407b-bbdd-05d6c019b539@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-06-26T13:21:19.116Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|MN2PR12MB4376:EE_
x-ms-office365-filtering-correlation-id: 29cad59b-279b-4640-3ea2-08dc95e2dd59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230038|366014|1800799022|376012|38070700016;
x-microsoft-antispam-message-info: =?us-ascii?Q?S3jsWoTzRVftyqojZ1oKcQI0upOeXA5f8irmos+kdI/GMTVOn1Na37G09qrx?=
 =?us-ascii?Q?Z+KZuMfKS1hGl5XVHCmeTVE4x2rO824bGlby5o2na4nBgWcRkgJpL6Xd8cqd?=
 =?us-ascii?Q?AaxQ3OQSlb2osnVzInOyQq6kb+9Glve/+QU1S47o89uyRdvd27rtNW43Z9Dp?=
 =?us-ascii?Q?zuerJHUqyb1DBlRYnLOJfXrhvJA7dVqj2E+ERv7z6oDpDrW25IBte1v+xIOm?=
 =?us-ascii?Q?ORL8vJ7YO9mck9Ta/G0KaQar3Zli91Qi6jGPuZhbuTnWRZU8aTJwXRgVlm7/?=
 =?us-ascii?Q?Hfh0OlY+Ib0BiybcySpa/WDPNT/QBmOi66ahafSrspOH5g4lunzHw5i5cF9L?=
 =?us-ascii?Q?LITY4Is91YqiqC91U4psjkHbA4pTeqYCBCevBdOMRRhBCHR322dCAxCb6fKs?=
 =?us-ascii?Q?IGYz1rjDP9B9uVWHk3fgBlRyWVnGtVNDoJKhjWNuKEuThxlwoPIVzuFF8NNa?=
 =?us-ascii?Q?8Irls4EZJ3pF8f9g3wZAHNgtqIexF0EzsID3sJ/HF3/Ga+KIBN6IhQYSW8N4?=
 =?us-ascii?Q?sme+Ep0LWUqJwz6wuBiwVeIDUnI/oHJEuUOIll7DamrXpx7B77Vp0vgzqT2l?=
 =?us-ascii?Q?lpjr+PMHvneNb7BiHC2BYtStumhoAyQFWJOtPqTT9ocmSaOaMteb0wvvoHv8?=
 =?us-ascii?Q?1H4mDy+Rhv6I4OJlc9Z1eF+rEBGWhltDLc8IJdMiDT8n5uQqZBa8Y7uidoYk?=
 =?us-ascii?Q?04j8k+C4B2DrBADJ/4spm/bi+yr+UYXmesRKlqcTNxSLKSgh/LutKAJCCO/p?=
 =?us-ascii?Q?YJCmyulqsQx8PeB+uqG9JiZjEBC+HC36R8U6CWmEAmwv/oLj5DdW4ak0+DqP?=
 =?us-ascii?Q?+yOZVP7jXh+DSIg/8WU4XZYBH8DPGqZtC/2iot3ov156UHZz1Dj+zH60BkIQ?=
 =?us-ascii?Q?fER10jlOL8J1hCNMck2rsP2ja6vfytAn7pxyjjC8dM/C37WlJil9VRMI8Ryu?=
 =?us-ascii?Q?VhrX9lBBOSsrqOtf4wSyyg5chGA5CUE3cHpFqvmHXT60z9biwIuLVgJITBKL?=
 =?us-ascii?Q?WRFbWdj0tktPrnjTCGusLOYpRlmqHeta4G4g+kPOTI7wruU1EJTGo6xljxfJ?=
 =?us-ascii?Q?9+gk7sb4DHGpMs4APm5ISyfsGHGYU7IUtFuZRq8ZMKEMBcxep1JNNA/3tfI4?=
 =?us-ascii?Q?JMMm3fQCYY3e6uUfWhSVCHqQjHKSUjZ+eoUmDXj5+BsQUKU2vEcMFN7gMnrE?=
 =?us-ascii?Q?XPLDThE0CAzM3Ny55f4ag1WVn0pMnBx12RAS3ZbaP4oZn43WvGVJfvZNRN9l?=
 =?us-ascii?Q?IklPhXq42t1lVaNXloafKH+UvI/c4VpGEsWL9tjzm0plweZVjFSxebXyOfIa?=
 =?us-ascii?Q?86jAmOdJLvQrEhNifC0GJ9hlgzlNCB1NetVfoY4uTenCdNDiGlAV/KRI5T9d?=
 =?us-ascii?Q?DFyYVJOtEzrS+bI06RTTpuxnxVQLhkSP70GVHk4YffkGiqtY2g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(1800799022)(376012)(38070700016); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dcEMdc9ApkubboO9H0+86dQlnUKNqAJuiyhF5CF49VvulcH9hVcgJ2JYIrxM?=
 =?us-ascii?Q?yG8IKlTaQs5Bpm07fvd9Vk9lOFu/ILtpE4DHyUzY3S2Py+e1kfOWYrfBtZGW?=
 =?us-ascii?Q?mvFVrsKO9ob0RvS3pJLPbK/rhYPcxphybVvS0hY5nN1zY7d9uBkBikTILNr/?=
 =?us-ascii?Q?B1BlG2WpV0D1k0kEMGbCoJZllZ0q75s8VoYGrOekGdJjWt0YdyzEyzL9L/2b?=
 =?us-ascii?Q?uNH/p8tdzjSDAnUKBJHEEDbcQrVHGrvaVdi/9VUYPNgjW29Z1SjvMt3sdhCT?=
 =?us-ascii?Q?1dutWqQfwLfOrp2BwTPLOx+gnyZXa/qM1iypWkhAPUn5GKZY4HJOnAL/gVA4?=
 =?us-ascii?Q?Ol4Id0SzOU5+DL6NWoQh0XllnZCALyyNAnhqQTLM1SBM/MuhPDHBuv4ADUrR?=
 =?us-ascii?Q?bcHlC9gNrEE47nFY0IzMHxYCOMHAyN2kgaeyF+U8TsfiL2TVy6KZcwZy9+jk?=
 =?us-ascii?Q?Hdb+CwUpi2u/hc13YuYn3HtnE91UVuA+m0IBrH4NGfM63Bxnz3kBt1WX+w4q?=
 =?us-ascii?Q?4EQIEL5sfE6KYg2L/8dzIx3nYuLyPawjQTNWeUWvAwqC+yaw1WBDQLTgl15E?=
 =?us-ascii?Q?WakEGhcWKoJzGE//C1w0f9Ha66MIvNnErIkIJtmZNRhKZ0cXVdkda15GB28U?=
 =?us-ascii?Q?4QFrFP4xBzO6MFJlTbWpvl0J97Uq9I2UdL86qOCxknczBM8Mx6uetesiLEvS?=
 =?us-ascii?Q?0MTsVy0W+9aPuuUPETTmJkjdxPVlFZnpgdGGhTHT2ncSo5rdQ8ffC7aM53nF?=
 =?us-ascii?Q?9ShrV0m8yaKpqXT10fWqXowlcEhkH3SkNGUK7jyhV32pDrrIz4rvsbJ7ZRkN?=
 =?us-ascii?Q?CrpoZtxnuOQy1rA2Q4fLVKDpgrdre2yKRNAhweG6KeL6QVWpJhjbB/H9VV29?=
 =?us-ascii?Q?Rs00Ha1jfauq7y8CkOZcuBm3eFboPjEDCowl3n5vDztBI3Ob07NjXw1L+ppM?=
 =?us-ascii?Q?AgHWFhEPh2nMYqB4J6/5Q9IEKVovLJGwl1WMBQoBuCtJvIYyR9ONW5B80+Xu?=
 =?us-ascii?Q?UlQMAZ2dczpl3FfUn9BvKjJTp5fq3L44KF42KyYU+LgoceWzqpI58mKvTFHH?=
 =?us-ascii?Q?g5DJvwQ6Hx2iJ59OBfPavurlrnL+nwnAcLMAKoI57td4V6dGVrn6NALfQgCL?=
 =?us-ascii?Q?F13aMdFepiOz0Env/+o/UM+xUCrqKUufhSaGS6Z7/Vdu6Oryw4+PMLmslNu/?=
 =?us-ascii?Q?p++wbcN7X/yVEAU9IOP7+kJQkGP9XAnPr/4UIh813JGiGILsaPtxfhXW5Arm?=
 =?us-ascii?Q?0m+ETqS7DioUVnK022RDl714iXTd9u1bKsoNw0Iz5B4Ztz5xZXay4cAVyF/3?=
 =?us-ascii?Q?GhbuNdaV9zGfdeuo8PVZfwenR3c/NWCPK4fWD6wBTyTfsqdTwD3ZdT4gpFxn?=
 =?us-ascii?Q?OWw+l131nqbxJbNcl0k82tDiwGxKBwLVGDuv3ySyJsMMPQc739hpRBD9tMCs?=
 =?us-ascii?Q?H4dNx5UD0YbeKEYH29vAo+Yiz/vd8hCPQ4v2DLrHjTIypbopRoLBA/C8p4/9?=
 =?us-ascii?Q?R0m0sCI8yqt/ZyVZq/YlGj2PZC61zz6YqZ/cy0n6L+HJOjfSz0fXpuvcuSHt?=
 =?us-ascii?Q?7XGUoaFJC3nSwm4xLa4=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB5284275908C11FCA165D52548BD62CH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29cad59b-279b-4640-3ea2-08dc95e2dd59
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 13:21:18.8463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lCax26xbo2FOSe8vcXrAxQ+uJUidp+wIOWjHFldwyBmGzIvvwFS35Odi0B8eNzAmWBrHqfxfmipcxDQEBUxc+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4376
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

--_000_CH0PR12MB5284275908C11FCA165D52548BD62CH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Kunal,

Feel free to keep by R-b and merge them. Sorry I missed your earlier email.

--

Regards,
Jay
________________________________
From: Joshi, Kunal1 <kunal1.joshi@intel.com>
Sent: Wednesday, June 26, 2024 1:01 AM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>
Subject: Re: [i-g-t,1/2] tests/kms_bw: add subtest for only connected outpu=
ts



On 6/19/2024 1:34 PM, Kunal Joshi wrote:

forcing DP connector doesn't work well and tests are skipping
with unsupported mode, add new test which runs test on connected
outputs only.

v2: added debug print for better clarity of skips on unsupported mode

v3: added new line in info
    moved skip after test_init
    updated test_init logic based on physical flag

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com><mailto:aurabindo.pillai@amd=
.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com><mailto:kunal1.joshi@int=
el.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com><mailto:aurabindo.p=
illai@amd.com>


Hello Aurabindo,

Since the changes are minor i am keeping your rb, planning to merge this by=
 EOD.
Please let me know if you see any concerns.


Thanks and Regards
Kunal Joshi

--_000_CH0PR12MB5284275908C11FCA165D52548BD62CH0PR12MB5284namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Kunal,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Feel free to keep by R-b and merge them. Sorry I missed your earlier&nbsp;e=
mail.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" style=3D"color: inherit;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jay<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Joshi, Kunal1 &lt;kun=
al1.joshi@intel.com&gt;<br>
<b>Sent:</b> Wednesday, June 26, 2024 1:01 AM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;<br>
<b>Subject:</b> Re: [i-g-t,1/2] tests/kms_bw: add subtest for only connecte=
d outputs</font>
<div>&nbsp;</div>
</div>
<div>
<p><br>
</p>
<div class=3D"x_moz-cite-prefix">On 6/19/2024 1:34 PM, Kunal Joshi wrote:<b=
r>
</div>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">forcing DP connector doesn't work well and t=
ests are skipping
with unsupported mode, add new test which runs test on connected
outputs only.

v2: added debug print for better clarity of skips on unsupported mode

v3: added new line in info
    moved skip after test_init
    updated test_init logic based on physical flag

Cc: Aurabindo Pillai <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:au=
rabindo.pillai@amd.com">&lt;aurabindo.pillai@amd.com&gt;</a>
Signed-off-by: Kunal Joshi <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mai=
lto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
Reviewed-by: Aurabindo Pillai <a class=3D"x_moz-txt-link-rfc2396E" href=3D"=
mailto:aurabindo.pillai@amd.com">&lt;aurabindo.pillai@amd.com&gt;</a>
</pre>
</blockquote>
<p>Hello <span style=3D"white-space:pre-wrap">Aurabindo</span>,</p>
<p>Since the changes are minor i am keeping your rb, planning to merge this=
 by EOD.<br>
Please let me know if you see any concerns.</p>
<p><br>
</p>
<p>Thanks and Regards<br>
Kunal Joshi<br>
</p>
</div>
</div>
</body>
</html>

--_000_CH0PR12MB5284275908C11FCA165D52548BD62CH0PR12MB5284namp_--
