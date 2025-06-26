Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F96C77B7C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 01:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FC710E162;
	Thu, 26 Jun 2025 01:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZIMqLgPM";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F5610E162
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 01:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwKTF4fyx6tsBy7DyfhwD8HfAXhap0meBEM1SIIRA7oocxhRaRhMjAGt91nuvSlQtOWJw3AiH98rRHrbVg82wbVoGnI/gcwZVnX9ZeB+RkzxOyLSlDJYIBUZuNhjDRUfhXDPDV8kN1+jBVynDfVEXuB+3FjPxl9p+ArAPHBCG9IuYqzMz/r7S1vKIPnvydezqOeGbTbETp7t1jPz/Cf0NCyOW4zCXMkJC9UixO1LVHxIJ8u/9Ffg7MnkE2HE48brK24LLNll+XinuuFcMVIef800SlTYaqXV4xE/pgmGoD9OQUJnF+r5kolHLD+vrJQ9SN/BJBRN5gmJyev5K4ZFWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Bz/wK6U81GDQ+SgxRBBKpEBxnRQcT6qowu4gqrYE/Q=;
 b=QvHjKMB1GQrJpuERsK1dy7uKQKIwyADPIsWNiomXWxdJq0cM1MPtIJy3nOBGbMMOHBR6aWBarciVjAA0wk1pL2VaTqaTz8frRWSbJV7WdGXKnMTDE+COIybB7R5zt2sBe6/bkTAS22eh0NEPcmkWwQ4I9LmkXagD/pI1b5J0lR9M2Fsbm4x3DsnCEfdnsasPmBeetbU4bflEuuI3USa8KpsifhAIAAQCgXw38J7xibpMVzu0+z5X8w8/1/FtjCJV35tPy06uTqE//+ItgFvkNWPYhR1PxtTJsmw28MFnkdTyjNMP2itxsSeeQWdxudWckvH/hQk3OF4yyZLzk51z3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Bz/wK6U81GDQ+SgxRBBKpEBxnRQcT6qowu4gqrYE/Q=;
 b=ZIMqLgPM3o+5OC95x2EcCss2TxGFLLxSufkBz078ZMFX0dgsfWqpVG1b8uMvvrUtTN+ooRMQCvSShy6nvh1UJxUJYXE/Ghca5vn+OGSxyiYUwvDmvHpBs+qqoM4LJo8dcZZ7/XxlMhi48GGUvmHvRGcv9EZXfeD7F5snO7fE8bI=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by SJ2PR12MB7822.namprd12.prod.outlook.com (2603:10b6:a03:4ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 01:33:00 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%6]) with mapi id 15.20.8857.019; Thu, 26 Jun 2025
 01:32:59 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] lib/amdgpu: fix valid error codes for deadlock asserts
Thread-Topic: [PATCH 2/2] lib/amdgpu: fix valid error codes for deadlock
 asserts
Thread-Index: AQHb5Yi1q9pI1Z8P1UqHzuIanvnXArQT6bqAgAC/o0A=
Date: Thu, 26 Jun 2025 01:32:59 +0000
Message-ID: <DM4PR12MB5152EC38D27C4EF90975BC3FE37AA@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20250625042133.6609-1-alexander.deucher@amd.com>
 <20250625042133.6609-2-alexander.deucher@amd.com>
 <CADnq5_M7dF03F_E=zGU_7PahTbL+eo6VxbHa8Yod1_BTC4cmsA@mail.gmail.com>
In-Reply-To: <CADnq5_M7dF03F_E=zGU_7PahTbL+eo6VxbHa8Yod1_BTC4cmsA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-26T01:32:44.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|SJ2PR12MB7822:EE_
x-ms-office365-filtering-correlation-id: a74abaad-d5c0-43f2-970c-08ddb45162b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N0NDMTZ3c1JZNVp5aFdsQ0hDdDBYV2ozakdWaXZUMWQ0U2RFbEt1R3oxVUtX?=
 =?utf-8?B?V2FaR1pNemxIeWhnMTJ6S1RsNmdoK05wNVNqTWVWVmZ5RlE2ellueVFsMHIz?=
 =?utf-8?B?a3VVOXkwWTYwWnFHUjZadkpyWk5EZXFHOGxMbVFpQlFsSFNRT25reE1DajRa?=
 =?utf-8?B?VURTSlpVUDFtaU0rdWxFNEpvam83SFRiR3k0MWQwbmhGUWE3QmxwdytFbjdP?=
 =?utf-8?B?Y0FKS21KSWl6UmdoMlU2TEpodW5scXU4NEF6NWh3VG13eU1mZVZNZjNtbnVC?=
 =?utf-8?B?Yk1iTXlWdkQxL3ZxczdxdUFWRmpsdzBnbzcyT3RTQmZCYzBjWU1JRWdFV001?=
 =?utf-8?B?L1hsdzRqVlFISXRkd25wWVJLZ1hXdTdZVVpvbGc0dVBDVEFSUmM5SWg0QUZZ?=
 =?utf-8?B?dGdMbXduRkhGbzIxQjBNMTgwYTlyM1JFaHhDVkxOWDRKLzZVNUpYY1BKM1Rm?=
 =?utf-8?B?bjNURmRDKzlsaVhGeC96QlZGRUxZbWFSelkwL3phdzdxYzhzQkliNHBmQTZh?=
 =?utf-8?B?S2Zham9FSkkreFozRHRpQUl2NHBtcUcyTkRNUi9LRmFQUUtWTzlGajRLaEZM?=
 =?utf-8?B?aWtMb0RLMmI5dHJzZFJzaDFtd2FLV3p1RnpJYTNPMlo2aGNRVWlobFBJaTNC?=
 =?utf-8?B?bzlid2lWc3J5T3Q4Q0NEMmYzak10UnEvanVCYzQyRDZSSW04VnM3bWZucE52?=
 =?utf-8?B?SGtGcURxanNJTm1NNXBFeUM0VzJEUVplUmh1bUFRaDk1ZWFoRHRxbkpMTHdk?=
 =?utf-8?B?Vk1FMHdKQWpCWDg0VXlvTXFuM2xlZXRjajJXQmxaOWJ0ckNsbnduczF3WnFv?=
 =?utf-8?B?TUQxNjAvOEQzNytoQmdUekhUK0ZzMGVPWi9XRndvZnpDV2VFNVdqZ0pRYm1i?=
 =?utf-8?B?a3VpeFM2bnlUa004Z2dFZlBnM3VxdENCa3RPWmNyQmp5OUlEUmh4RENGZU81?=
 =?utf-8?B?WVl5eXZySGk1Mm5Rd2lvN1JCMDZ0WjNNYm1HR1NGZUkrdWRxZ0MwdzJXdmVy?=
 =?utf-8?B?REpERm5CeUJuQ1pEamFvTSs2NTZmaG5Ha1h3L2xUL1U0ZXVsM2I1aUUrSlNq?=
 =?utf-8?B?cW5KdDczeXhzSDdlUkptVFBkWU9NVmVLbjYrM2xCSEF2RUNBeHQ4NFZUZ0Fr?=
 =?utf-8?B?Nkt1cnQ3Yk50MFpxdjhYY2JRT2dtYlZpQVFMMDhYeFkxTTEyOGRjSXZ1Z3hP?=
 =?utf-8?B?aDUxdUQrMzBHM3pnQW9rTGFrOWEvOW9GZWhDTkdncGZadUdCLyt2N24ydUMr?=
 =?utf-8?B?YjhvSVRMa3RobTMrME02SzF6KzNCbzNHMHpxTFNCdmo4ZDVvM2ovVEl4M1E0?=
 =?utf-8?B?ZzJ1NHdlcGFsa0t2VEV4QkRGNytZdDZLenBTd1hHNW9kVVZiemNGa3JHUnpF?=
 =?utf-8?B?M3N2bUVNYzdqRU5oL290aHI5VzlDR0VsRUJobnJXNDFYd0VxUFBnREdreWFx?=
 =?utf-8?B?UFVoTmpieGVqTHVWWjUrYTkvSjUvb2RQRThsakd6TVc3Um1TeUtTV2xKRXFp?=
 =?utf-8?B?MUkyZXl3cE9ndUwzSjVmYjhJeGRGNlpLaDFJYnh0WGFycGJBZm9IM2tjQ293?=
 =?utf-8?B?UVNpamtxamtFYW9iUEJ1WktKTWl2WG1ibTBwdnplSEYvSFFWNE5KTkpDcUpu?=
 =?utf-8?B?WVZHaFMwUXFBdFNwK3RLR0UrVXp2Yi9GVWZDT3BGdGFybUlURkhRZFgxYUs1?=
 =?utf-8?B?QWtUUmlBMnpNRmVmMU4veTdSdEh6aC93TFNEd1Q1NG9Day9OejhBM1dvWXJH?=
 =?utf-8?B?VmVJTWhob0dJaGhvUnJPM2RBVUtaVjFIWVBRcTlTQXc4S0ovQ0lEOHJOTHIv?=
 =?utf-8?B?SVFvdTRGMHhIREZjSmFTL0RvSmtKcVQwZGFpbnpoNE5tUlFNc3c2L3RWbGtT?=
 =?utf-8?B?TDFJS3RBV0pZc1J5bklrL0dNWmlzY1g0RUtncjRXMC9nbUc5aWpxc0dnWWhj?=
 =?utf-8?B?UVBzMDdkNnNlZi8wYXQycVFkRXViczJLMnhZVnhQWEZDclZIZndGNG5KczlS?=
 =?utf-8?B?MDNpamYySXFnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzdvcC91MWNmOFlJN0k4RGMyMEdwR1RCQ0J1cGIwY2tlTVE4OFhJbHYwc3FG?=
 =?utf-8?B?UjRtRjdrbW4vUjJGaUduODVOZFIrZ1Y4TzVrV0RIYmRPeENRTy8zK1dJaE10?=
 =?utf-8?B?WkdEZHlXaEs5WmRCMFB4cTdkeE5vMDZvSys1OXk2eGIvK1g5Z0dyZ296K2Vv?=
 =?utf-8?B?eWttWFBBYU1KUkYzeU1OTGJEVkRma21taEtybVJVYTZCNk40OS9LczdCRXVz?=
 =?utf-8?B?a1Zxc1NWd05DN0NKcUdwZGUzbnpwTG5pdkRYVkpLaXpKU2t4ODZpTW1nakZh?=
 =?utf-8?B?OFNPNnVuMFN2amkxbmprME1pMGIxbkRaUFNvdjlZZXhFendGek9KUUVtYjNo?=
 =?utf-8?B?enRDTUJwdWI3d0V2SG1ZcU4zb2FhdmFSSGRYdlNXRnc4ZGRGdUU1UnhVZnQx?=
 =?utf-8?B?RWVRalptSHZ5NDlUaHo3MEMyUHRlMWJiL0paQktIZ29Wd1lzdW9SZWVaRjRU?=
 =?utf-8?B?cUZwS1ZPNHIwdWpXbkRBNldGNDF3S3hiTStQanh6bkhWdnpIY2RPWm5lZzkw?=
 =?utf-8?B?TFRyZW4zNGtuSTR4QUhpWG1wa3VENWYzU2tHQ2Q0RlR4Y3kzWW5Hc1JyU0ZX?=
 =?utf-8?B?OHJVRWhlSVUxVCtsenFrVDJIUWJOc3liejhHc0lBOHd3VGhsMk1rcng0bzVK?=
 =?utf-8?B?MmUrRy8wQzVJaFBERldSWkUrV1VDTGljcXUzTmhSQVc2MzFsZWtnb25RRmhB?=
 =?utf-8?B?b0NGS2hySmszV1V1MldpTGpVRlpub080NCtXQkplNnhLZ1RXdUVtNDRISmt1?=
 =?utf-8?B?TEdjTDNpOFBDMnhOd3NMNERqRkowWCsydm5Pdnc1dXI1OVlLU1ZxWjhOZmJ6?=
 =?utf-8?B?bnVPdzdmZHI4SkNBbGFhNVdhdHFWWjlFVXlScDQ1Mm15cmY3Z2ZNZXR6ZS9a?=
 =?utf-8?B?TFJBY1NETTZBSDZQRlltdFlJSDVxekxNS0ZXM1pLdVMzSXB4QkhYNEl4Um9H?=
 =?utf-8?B?VDFPZVowYWxUQkF3WkppN0tVWEtzUFVkMWN4NHZ5N1dIUmNoSVJBNVZMUmZv?=
 =?utf-8?B?TEFXeVc5YlpadG9Za0FxSU1EcURETTY5OFFuVkNMekk0K3ptclZ1U1pWN3dh?=
 =?utf-8?B?S3VwWHI1WDlQVWp0Yk9YY2krSVpCdUN2OVFJUUQ2bWZOQkNxb0k1amEvZnpJ?=
 =?utf-8?B?WFplSjFWdlBCVlJ1Uk9VekRuSTRvVFRRRGFlQzBHeDNXblFZOFpvUTY2UXk0?=
 =?utf-8?B?cUtwVE9aeURycExBOXk0Z1N6L0hxbmVGTWUyaDBOM2VGSTBpSVYwVWNvVDVT?=
 =?utf-8?B?ZFBQUUN6dDlCVk5ScXo0QTN1YWRvRmxGT1dOdklMRUdlUGZ0SUhFK3pKUXh5?=
 =?utf-8?B?ekg1dDAyaHJXNDNCcjgxTEtoSlhGVUttcm8rL1EzM2xnR3BHRGtrODJ0NjdC?=
 =?utf-8?B?dGpPWnRRMnM5MjBJZURINjNNV1RuMXhHMEhueGJwd01Ma0F0d1cwbnlVaFVZ?=
 =?utf-8?B?WnIxNnF0ZGxuaDhuUnMvaGNRdXY0L2xoQXdQY1ZFM2VTZENvV2Y1bFozWUJB?=
 =?utf-8?B?QUhHcHRmalh4UElramZUQW1KeHVPazlRaXh0RkYyWmJLakh1T0pST1kvQStu?=
 =?utf-8?B?c0hsTFdRVGNYajh3WDByMmFaeVJKaGR4M1BiR1NQdzBodXIwTG1yazQ0NEQ5?=
 =?utf-8?B?YTcvVXRzWHAzQXNkN0J4cUgxZlNmWWxVYlpxaDVrODRhSExzeFNGN2hRZGxT?=
 =?utf-8?B?SVQ3alh1ZzZNL09zUy9PclMvTElNc2tCUWl1ZjNZU1RoRHRaa2drVmRSS3BR?=
 =?utf-8?B?bWFqRHozczI2RUszZFZidDJhUW9hc1RFWElQTlZqbXptOW1MU0RydUtobnR0?=
 =?utf-8?B?Z1hyT0p1enVLa3lpRndmWWM3ZnRiWEhLcDc1WDBCaWVnN3RrZnBjalZLdGx3?=
 =?utf-8?B?eHRJZlNhTThONVBTRXRwYnh5MUZVZEdrdjc4ZFduZXQydU1sUjJHZWNIaGxY?=
 =?utf-8?B?Rm14K3diemZFcXJXdGJ2SW0zM0ZlTGw5Y1hPZkZRVWlEK3BqL2pQelBWZkZu?=
 =?utf-8?B?N2tUenB4TGFLZWdBWXhHS1cwcVZ3dlQ5SDc3SnFKQU96dS96UmZidmh5OUQy?=
 =?utf-8?B?UjBkNHRzb29ndmNPby9Hb3ljSVhZWEMwY3F3a3ZhcFJtRlhuNnB1Q1BoMEF3?=
 =?utf-8?Q?4dOw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a74abaad-d5c0-43f2-970c-08ddb45162b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 01:32:59.7514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4v6NEf1XvPOXmJm6pnKRYvOCG3Afia9Sx4ZtuECsflyutWEvb88GUGnj8h8bNLGDHENGqhHYL8U9hY/s+h6gDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7822
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KdGhpcyBzZXJpYWxzIGlzIFJldmlld2VkLWJ5OiBKZXNzZSBaaGFuZyA8SmVzc2UuWmhhbmdA
YW1kLmNvbT4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXggRGV1Y2hl
ciA8YWxleGRldWNoZXJAZ21haWwuY29tPg0KU2VudDogV2VkbmVzZGF5LCBKdW5lIDI1LCAyMDI1
IDEwOjA3IFBNDQpUbzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQu
Y29tPjsgWmhhbmcsIEplc3NlKEppZSkgPEplc3NlLlpoYW5nQGFtZC5jb20+OyBQcm9zeWFrLCBW
aXRhbHkgPFZpdGFseS5Qcm9zeWFrQGFtZC5jb20+DQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBsaWIvYW1kZ3B1OiBmaXggdmFsaWQg
ZXJyb3IgY29kZXMgZm9yIGRlYWRsb2NrIGFzc2VydHMNCg0KKyBKZXNzZSwgVml0YWx5DQoNCk9u
IFdlZCwgSnVuIDI1LCAyMDI1IGF0IDEyOjIy4oCvQU0gQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPiB3cm90ZToNCj4NCj4gSWYgdGhlIGpvYiB3YXMgZ3VpbHR5IGl0IHdp
bGwgcmV0dXJuIC1FVElNRSBmb3IgdGhlIGZlbmNlLCBzbyBhZGQNCj4gdGhhdC4gIFRoaXMgZml4
ZXMgdGhlIGRlYWRsb2NrIHRlc3RzIGZvciBwZXIgam9iIHJlc2V0cy4NCj4NCj4gU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4g
IGxpYi9hbWRncHUvYW1kX2RlYWRsb2NrX2hlbHBlcnMuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbGli
L2FtZGdwdS9hbWRfZGVhZGxvY2tfaGVscGVycy5jDQo+IGIvbGliL2FtZGdwdS9hbWRfZGVhZGxv
Y2tfaGVscGVycy5jDQo+IGluZGV4IDBjZDgzZjA2MS4uZjc4NDVlZGIwIDEwMDY0NA0KPiAtLS0g
YS9saWIvYW1kZ3B1L2FtZF9kZWFkbG9ja19oZWxwZXJzLmMNCj4gKysrIGIvbGliL2FtZGdwdS9h
bWRfZGVhZGxvY2tfaGVscGVycy5jDQo+IEBAIC0xNjQsNyArMTY0LDcgQEAgYW1kZ3B1X3dhaXRf
bWVtb3J5KGFtZGdwdV9kZXZpY2VfaGFuZGxlDQo+IGRldmljZV9oYW5kbGUsIHVuc2lnbmVkIGlu
dCBpcF90eXBlLCB1aW4NCj4NCj4gICAgICAgICByID0gYW1kZ3B1X2NzX3F1ZXJ5X2ZlbmNlX3N0
YXR1cygmZmVuY2Vfc3RhdHVzLCBBTURHUFVfVElNRU9VVF9JTkZJTklURSwgMCwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgJmV4cGlyZWQpOw0KPiAtICAgICAgIGlmIChyICE9IDAgJiYgciAh
PSAtRUNBTkNFTEVEICYmIHIgIT0gLUVOT0RBVEEpDQo+ICsgICAgICAgaWYgKHIgIT0gMCAmJiBy
ICE9IC1FQ0FOQ0VMRUQgJiYgciAhPSAtRU5PREFUQSAmJiByICE9IC1FVElNRSkNCj4gICAgICAg
ICAgICAgICAgIGlndF9hc3NlcnQoMCk7DQo+DQo+ICAgICAgICAgLyogc2VuZCBzaWduYWwgdG8g
bW9kaWZ5IHRoZSBtZW1vcnkgd2Ugd2FpdCBmb3IgKi8NCj4gLS0NCj4gMi40OS4wDQo+DQo=
