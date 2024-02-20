Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3C5C48BC3
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 18:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C58B10E214;
	Tue, 20 Feb 2024 18:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wcDYFtNb";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB29E10E214
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 18:37:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oc9s8mJQy9OyMlYP03sA5VEkUFeOhJUkXVxhNK1ci8UkcvXSKGXeicxrl2t3ful6EHDnDJpmmUeaTqwVin+mr1eOLn2sBbILSU86o8VyP63IFt96CQCAk1RzVL2DmBX232ofiWZ+/8yxPdsvbggCP3FWQ57BJURgmtOp7PLfquQ9zND8rPGkIGph4KF0dVwMtQxH2rDy9YJaT0Ygv+3OwRUdbockQ4nsj8WBxInu4c3IlJ3dtgw5cC8aXTLfqa+IivxfMPMj5PSsCBzGsZ8XlaxKJ2vF1x59/PsKY3P5PWazKUkmPty5CLxrWUPT1WKZgQ+ql3hxmeDn6tGtUQ5MNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1+GA4+cbnpF1ey+rpVGXzZ4AobpkuS7wxS4iannfH4=;
 b=dQfxkWmCJWGVO8TjmNqyc30drdwF8L6Bfkd3QJGijmCUVHp1PnvofijyjEkmKR6djxWCV7Z0YKjmtoobN5MgyD/696tqvbOyhaWdv5hxMrYLyQhNcGWGk1hLRIjlcTq3HyhMY3v7s43Y6xp12z8uOoxaA6xGFZEP/A4bo66LBfbx7wvCF7SUZ4Qq5WLza3tZB78b0rmgnxHD4OYOx6utH/CiXjo6iVqdSSiUKrRoUJEPxSTBOIP86p8oOdt4KExMzhl37apW2KjVHmM9dsF9CiofFsiMmoBGqb40KoOQFVAl8XUuK1mhz1449XCkvJEUwcg2mlmQREScyVuZqZh7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1+GA4+cbnpF1ey+rpVGXzZ4AobpkuS7wxS4iannfH4=;
 b=wcDYFtNbtFBMMpO4eM5i0rewIlBsTmKVjtmEy1vNADzb9BJ4iJIqmKp+LqsPbk8fiLeMxMHuiqRZdRC/9Z6uGLy2XSxi/g50nHf5ZuDNy/xqBqUaWjVjDXWaaSkVt5p6pJNl1qw2c7/E1xmaQZtTs2FrClV93HTG3SJjU87L/Wc=
Received: from PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18)
 by BL1PR12MB5078.namprd12.prod.outlook.com (2603:10b6:208:313::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Tue, 20 Feb
 2024 18:37:13 +0000
Received: from PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::a587:bdb5:e5df:84d4]) by PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::a587:bdb5:e5df:84d4%3]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 18:37:13 +0000
From: "Wu, Hersen" <hersenxs.wu@amd.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Hung, Alex" <Alex.Hung@amd.com>, "Pillai, Aurabindo"
 <Aurabindo.Pillai@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
Subject: tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout IGT CI test
 failure need hep
Thread-Topic: tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout IGT CI test
 failure need hep
Thread-Index: AQHaZCvSkpLmpuJ2nkKf0wcIfYSIPg==
Date: Tue, 20 Feb 2024 18:37:13 +0000
Message-ID: <PH8PR12MB69628159E1CE801CA868386DFD502@PH8PR12MB6962.namprd12.prod.outlook.com>
References: <PH8PR12MB696282278F678780346276A0FD502@PH8PR12MB6962.namprd12.prod.outlook.com>
In-Reply-To: <PH8PR12MB696282278F678780346276A0FD502@PH8PR12MB6962.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=c797dc45-8772-4298-adbd-43b39d8466c0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-02-20T14:58:36Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB6962:EE_|BL1PR12MB5078:EE_
x-ms-office365-filtering-correlation-id: 23f6483e-a5b3-4e7e-8269-08dc3242f4f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e4ksbVLSWgTzij9unpFyOVCNnTn+5Ot9goyB4ldXTQ44KClGiy7jbB36an7ofm32tgxbxmwJenYjxHtYcVHnn43ARV4gNr2QMyh/6ebLDc82h1bR9AUcLxBcp+2sM9DPdvouQC2iTwW6W/V0VCMz+X4v/sf2D/BsuM3c+DM+7kMnoO5xGNQpVZgR3yflY0S/3U3kkQY60aBjYvr/zfcakRNvYMxigP2nCWu4r34tO4e4yaYHLGiu/rEHa0jU+Mzy6n5D52tFAnXLP/4Mjt+utPvl3qiPi420ndTKwve8Yk3/MdD+CV12w4hi41vf1LoDaQn8/F/q7690OHp3Wh5BZ9Lw2QbdBOTzHlt3esZp+CV4mzzUT9epNl9B7/zQh6BQ7laMXmdtw//TURhmV4o30jTxfMq8nWIaU95oQ4pzsOitdJF2Ga6UzDRwso0elXFwQlYyR6a1A6okBgk2oAVmdELvn69HVBH0Yfb++ifxptwFk/IT8ZfHi85RoBQfaB7Jga7xzEAWvqmjdxDuns2zVfYJZHudR8X0NYGfWaUax00H/9aFeS5X453Z45CWYx8SXcJjEM/6587hrIbk2DQE/e639SyYANkj4Gkcjx8uLHE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:ja; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB6962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?OHFwTW03ODNFNFUxZGRmcnpEQ3lidFBxNFgrc1hvZFZDTFA1R2JkczhG?=
 =?iso-2022-jp?B?ZlNERG45VXhkMDAxRmV1bkVkUVN4L3dWandZUE5qNlRZTkRqVEJRVk53?=
 =?iso-2022-jp?B?N05pL29PbzVJekVORFVkYndONlVKTkhySk8xdVRRZ0FpZFJCS1NVYzAr?=
 =?iso-2022-jp?B?Ukw3ZXFUZDEwSy9IWEFONVF3VkVNeHBmT241ZlArR1NxUkxULzZlUUcv?=
 =?iso-2022-jp?B?cmZ3d2h2amJVK1BNRUdLSVkxM2s5WGc3UnkrMjZSbWcrSjdHMWF0TGQz?=
 =?iso-2022-jp?B?a2FQUlRLNTdYQVNBeHVZd1RzNks5N3IwSzd2dkI0N2RjbFBya2g5aDZn?=
 =?iso-2022-jp?B?SnRLbHJuRC9uWkVvMkpxQldDRC95QW40dlVadkZQQXFTMVpBM21zRE8v?=
 =?iso-2022-jp?B?dEVuaUxkelNaSlpjK3I0MStWeFF0OHpJQlF5cXptY1JidU9PZGZrOHRp?=
 =?iso-2022-jp?B?Qlc0aFBoRzhTUHFnSFQxSG1Cc29iNDU1dk5GczdMQmdvNnhJcEltc25o?=
 =?iso-2022-jp?B?a3ltN1FZYmdhcVNuQks3MVJja2VsaHc4QTQxUkorS0JuNGxMTTdZcVd3?=
 =?iso-2022-jp?B?OEZOdkRJR05xVUdReGZnWmh5MmY2ZHNaVkkyWFpjeWo3THNnTlFzUDBy?=
 =?iso-2022-jp?B?dzJvZ0JRdFB0N0RxQmE4Rkc2ZVNyOUlJY2YyM1BWb0NERTNlUGhsVVVy?=
 =?iso-2022-jp?B?Lzl1S0lZKzlLSVZDOGozRDBWV0ovN25JcWNONWVvaTYvbzg2Wk5nbmJp?=
 =?iso-2022-jp?B?ZFZ1dHZFcjUvV0ZacEVIbXZSa1liRlRMSEIwazhYOWcvL01wM3lwTUV0?=
 =?iso-2022-jp?B?bHB3NWQ5ZEIwM0ZCUlI5MXpRQ1ZsN2N1L0NxYWVFNzBPM3UybmFFa25W?=
 =?iso-2022-jp?B?NW5WNzB2NjR6Y1Rtb203V3RkelR2aUNBcHNNUXZHMFFrSHRjb0hRbjk1?=
 =?iso-2022-jp?B?Ukw0NXlxalpRaWRGSjVrTGlzWnJjYWFZcGl5S1M4ejB4UUd1NFZGSDRL?=
 =?iso-2022-jp?B?Wi9DcXdhcWM0d0FkVnltUFBoVlNvMVlmbzdsRDBjNHJQZzdaQkVqNkVB?=
 =?iso-2022-jp?B?cERTQUNCVE9lZmJUeDlmaHEzcnpPVFUwOXpjTW1Cc0prQXNvYjhvV1hu?=
 =?iso-2022-jp?B?aDd0Y296eERTNDhPTGd1dFJhMUhRSGZ0VTVXNWVtazdNYjdoRmR3WVFH?=
 =?iso-2022-jp?B?UnpwMzYvSU5zM2lBL3ZFOU81SjNYSlg1eFdzQ05KR1BDRnlzNHo1Zncv?=
 =?iso-2022-jp?B?V3FVNWxxSnA1aFhueVBIUVFXckhFV3BSWXVXaW81NnlWZWh6bUJ0UmpF?=
 =?iso-2022-jp?B?L0ZhVmlPc2ZSUHJDRGYwMzArUjZpY0MrZWRuWWNqdmFhbGdlSGhiWUF3?=
 =?iso-2022-jp?B?cEx2SnFoWTlYTFRTeGdVU253QUlPb0E2eWN3dnNmTGpzekxqZnR4cG0x?=
 =?iso-2022-jp?B?R3BsMFZJZHlueWJVMXpCdUxGTnAyTUJZK3JCQXorV3FmY3NDYjR6YXQv?=
 =?iso-2022-jp?B?dEZOa2dhamcvVzF5RDVldGlXSVo4U1NSdGlKWjZ4bmljQ2JIVHJOSFN6?=
 =?iso-2022-jp?B?UjBEUEhhc29NQmdoQjAxdldVbFUwem9xWm9Qd2NqNno0RWJzOThWOWE1?=
 =?iso-2022-jp?B?MzZhdVBXVlJzNGZTSXpTWnZOZC8wVFlUV2tLZ3JnQmxvVVVyWDVDZEVn?=
 =?iso-2022-jp?B?dHByUUNzOTE3WEVuV05sZVJxaDJCb3A5QkphNVFKM2pQcXV5TFF1YWRT?=
 =?iso-2022-jp?B?cnl4aU5hTTBhQ1J1RUV5NjFLNlJtelJnakhEQVFxelUyczJMM01JL2hr?=
 =?iso-2022-jp?B?dlI4NE5NS1daQy9oYnh6VDFTaXNvMkd5R1ZMcmhFajFhV0FUbkM3cVly?=
 =?iso-2022-jp?B?VlpKMFc0VnczSzhjamJtZG5zZkd4ZkVyS01pcXJVbEVlRUJCZDl5UUZC?=
 =?iso-2022-jp?B?bk5DS3ZySXN2bUVRRktBM251QUJLYmdhbEVqMHVHSTYvOENtMG5OcEIr?=
 =?iso-2022-jp?B?MkRwd2JrMmZZeXA3K3VzRnRuN1M0ZFF1TnMzcmNZWGg5MnVpVUxJUWlo?=
 =?iso-2022-jp?B?b3pHekZuMTlBTFhnYWF5dmtlYjB2WWVOYVd6eWc3bHM4MEVCY00zbjdl?=
 =?iso-2022-jp?B?NEhqaUhheXhpVTN6ay9sd2pkN29hTHNzUjZqaFJKR1I3NVQ0K1AzSVZU?=
 =?iso-2022-jp?B?U0JNaHZEd3BzOGpXSXI3dlVZUUNOcnFwRmZHWHdiNXozaEJtc05GS0h5?=
 =?iso-2022-jp?B?WGYyQ2Jla1ROdmJ3RVE1WXFteFFKTkI3TT0=?=
Content-Type: multipart/alternative;
 boundary="_000_PH8PR12MB69628159E1CE801CA868386DFD502PH8PR12MB6962namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f6483e-a5b3-4e7e-8269-08dc3242f4f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 18:37:13.8058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0BwXtkr9tpQmMNwCN2Ceq+f/Gugi6jRU2Tes8fNFoSFKwozO9IBafywEXXwDTaFx52dn08bxK5aZduHNjbYKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5078
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

--_000_PH8PR12MB69628159E1CE801CA868386DFD502PH8PR12MB6962namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Hi Kamil,

Amd_ilr test (https://patchwork.freedesktop.org/series/129382/) is for AMD =
GPU only.
There are test failures or warnings on Intel GPU. Such as,
=1B$B"'=1B(B Fi.CI.IGT failure (See full logs)<https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_10687/index.html>

I check log of test and confirm failures are not related to amd_ilr.
I=1B$B!G=1B(Bd like to know if I should do for this IGT CI test failure.

Thanks!
Hesen







--_000_PH8PR12MB69628159E1CE801CA868386DFD502PH8PR12MB6962namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@MS PGothic";}
@font-face
	{font-family:"Helvetica Neue";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:JA;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.show-triangle
	{mso-style-name:show-triangle;}
span.label
	{mso-style-name:label;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Kamil,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Amd_ilr test (<a href=3D"https://patchwork.freedeskt=
op.org/series/129382/">https://patchwork.freedesktop.org/series/129382/</a>=
) is for AMD GPU only.<o:p></o:p></p>
<p class=3D"MsoNormal">There are test failures or warnings on Intel GPU. Su=
ch as,<o:p></o:p></p>
<p class=3D"MsoNormal"><span class=3D"show-triangle"><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Helvetica Neue&quot;;color:#333333">=1B$B"'=1B(=
B</span></span><span style=3D"font-size:10.5pt;font-family:&quot;Helvetica =
Neue&quot;;color:#333333;background:whitesmoke">&nbsp;</span><span style=3D=
"font-size:10.5pt;font-family:&quot;Helvetica Neue&quot;;color:#333333">Fi.=
CI.IGT<span style=3D"background:whitesmoke">&nbsp;</span></span><span class=
=3D"label"><b><span style=3D"font-size:8.0pt;font-family:&quot;Helvetica Ne=
ue&quot;;color:white;background:#D9534F">failure&nbsp;</span></b></span><sp=
an style=3D"font-size:10.5pt;font-family:&quot;Helvetica Neue&quot;;color:#=
333333"><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/ind=
ex.html"><span style=3D"color:#2A6496">(See
 full logs)</span></a></span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I check log of test and confirm failures are not rel=
ated to amd_ilr.<o:p></o:p></p>
<p class=3D"MsoNormal">I=1B$B!G=1B(Bd like to know if I should do for this =
IGT CI test failure.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks!<o:p></o:p></p>
<p class=3D"MsoNormal">Hesen<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_PH8PR12MB69628159E1CE801CA868386DFD502PH8PR12MB6962namp_--
