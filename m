Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8285C02183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 16:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7061F10E9C2;
	Thu, 16 Jan 2025 16:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vJkMPxMh";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7BE10E9C2
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 16:28:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fs1fmlX0CEDqFyeHt624bogwkoqh13cf79zPwqepG3q7FUyl1pom2TbTR742Tookn0vXfWaJkLI9tMTytoIhLHHGGydUDvr+2gYcyiFlIHeFC7+Ii6JISCSfw1eiG84Z8OsIIvCN5nu4PM05aIdGSSQvyeijCxOFLgR2NBD2DX4OEpwD9YJi49zrZ1GX1C6FBXNybwcU9V+IXnjRAe4s83VrXtVcMZN6SSOsqbxDaAVLRLpzvS0L8ENZdvKblu0HONVYNqS2xZ5a0U8jiKalfyotYFzB45JSnB4lHwUPm2Zrf8Vlqoi4gZP92GqXLqEpgY5EM5drst1QauMCUEd0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO4dOfuUrIEWczT6rTsX+LSuYERHnWAdcWAPPmcf9c0=;
 b=qN9T2Wrp5yPEl6lKDfN4fjdDOCGilZpUuYYN1xvwBuQLUH0/1QXubx1CRfnBT2EdrxMcIECbHFr/sWf++Fj/LjUxpnv9ce+LNMO1co34VKmWorxNes+DL6qhIaT/2rs7O9qSSD14Z3sGOFaH62m2AN7v83Ruu90ulargYaEMxyVQry1CsqhNKnMUpHTBbMWG/VJFQKdcd7ssGoQ+sGAhQyiFRMPSDoPmgCpZZayy+uS/LAO0K0jcDNT3J6d+mm29vop2FLcVj8N6hUwKck3RaDWJgmWSfbEBw73mEdy7RQKlf2MZDHEHnUjT1ceddonV12k66Cm0uug/wOEfF3w7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PO4dOfuUrIEWczT6rTsX+LSuYERHnWAdcWAPPmcf9c0=;
 b=vJkMPxMhCctaIBKsNjiTp3LYi3HFB0m+FB+V72FSSAxdqvdGNEPkwwhOLrWIWPp3on9ZuAfBu9DqsuHyDEPIX1FTGqApoaY5zRFfkA5dN38tp7BcFiyxzoxpNeUbo4HTc1o5Nyd5tQ8jvGq4xc8pnHzUxGOfum4yOoPkwNST3gk=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by IA1PR12MB8222.namprd12.prod.outlook.com (2603:10b6:208:3f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 16:28:49 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%6]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 16:28:49 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>, "Strawbridge, Michael"
 <Michael.Strawbridge@amd.com>
Subject: RE: [PATCH 3/8] lib/amdgpu: Add user mode queue support in ring
 context
Thread-Topic: [PATCH 3/8] lib/amdgpu: Add user mode queue support in ring
 context
Thread-Index: AQHbZ+N88dRYaOl9F0WKf6Zw/6urarMZSkcAgABAo4CAAAypAA==
Date: Thu, 16 Jan 2025 16:28:49 +0000
Message-ID: <BL1PR12MB5753AC7960D66FE9ED19E049931A2@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250116065211.1882469-1-sunil.khatri@amd.com>
 <20250116065211.1882469-4-sunil.khatri@amd.com>
 <20250116115150.ma35lvddby7647it@kamilkon-desk.igk.intel.com>
 <23b97017-9074-44f3-9248-5341aedb7f2f@amd.com>
In-Reply-To: <23b97017-9074-44f3-9248-5341aedb7f2f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=ca16b0b9-6043-49d0-8c8e-711d5ff90413;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-16T16:28:29Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|IA1PR12MB8222:EE_
x-ms-office365-filtering-correlation-id: 8b067f0b-b3fe-4fb4-fc03-08dd364adba6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?cXIyV1dld0ZCUWkxMUNIa0Jub0hPcWU3ZVZybFdpSzJDaEpnUjRmTXZGTzRW?=
 =?utf-8?B?YlZTRytzdWtkbHRhQWRXdEkxelRZNm96UzdGMTZEbTJTandSWERoQ3puNGpm?=
 =?utf-8?B?SXp4N0xPa1NCRGNTRmh0UkFnUy9Wck9KSFVwaU1YWGFUN2JBMEltRTMrZ0h4?=
 =?utf-8?B?cU1Udm9PSkFpK1I4eFFiMEpVWEtZQlZLM1dOZk1zeUtMS0tnYlhpTmRsaDE0?=
 =?utf-8?B?emVLR3NhSHRBTW9TSDlSZHZsQTFXeExJTlFIdVdvbWhZeUszbEExeVI3eVVM?=
 =?utf-8?B?MmxUK3lhTi9HMFRlWjJ6YkpPb05qUzVSTndTUGFCeGd2NUlHWnp6VFNHTmdT?=
 =?utf-8?B?WVBUS2VmS1ozWWJEVll0aitSQjhCbjBmdTgyWkw4ZE44b0J0RzZjWDdLSFdE?=
 =?utf-8?B?OVJyV1VvY1hWN3l1L1pyWmZVOTUrUXd0dFJpUkdIMGJxanljSkozTGpNbWxH?=
 =?utf-8?B?M2JITzhDOCtsRkdZREhOMWd0amZ5RUx3R0gvQ2Q5d0MvVkxDVENyVXAvV0VX?=
 =?utf-8?B?MkVDQVd3MXgrTWZpQVAyNmZNcnhJbVRncG8zQjd5VnFHRzRFcmpPRjNYRW5z?=
 =?utf-8?B?MFVhTkVnWTFaQXdRWW5rSzdzb3lNQnl6VXA5UkpESWJnWlVoSWVmbzkzSDEz?=
 =?utf-8?B?KzIrL2tQVE1ocUx6am1WME5kSzlnL28ycGV2cWVTbWFseElGK3FEdFVoNi9C?=
 =?utf-8?B?Vm0yQ0xVbytSSTJpbmsvY0M0akhYVWtlWFVrTjN5TmoxaVpVSXlBQzVrNXZq?=
 =?utf-8?B?TVA3SS9GajNSUmhTdi9yUU12V2F2OVNWS1daMGhnTWxqeENVWG82UlQyYytr?=
 =?utf-8?B?VmZkV2xKK2dtNHpITml0dkZpVXJ3eVM5eXdicUszWUFuNVF6R3RKWWlXVlFJ?=
 =?utf-8?B?eVQ1NDFZTWVVc1NLWmE0RU1DTGFHZ1pIblZLVU05UE5FNHJ1RnBkVU5IaVVR?=
 =?utf-8?B?Uis3c3U1Nlc0dmlsNHllSVhnTWNKbzRjekxJVjFBdHRwUWFjRStoeTNiM1pn?=
 =?utf-8?B?c3VUT0YxR0gycEJBbkNhbVYzTWlVYW1NaWRxUWgzVkdEUjFuU0J6RkVxdDNJ?=
 =?utf-8?B?VjlRaklTL2Zuc2JNeUpoV0hDRERLQUNaekZpYVFhSXFjYjAwWFNtTitXVE9U?=
 =?utf-8?B?ZEVoOUhSQTRwYlVNZStaRVo4Vy9IZktsS3JEdHc2Ym5CU3l1WW9PMnBEQ2JG?=
 =?utf-8?B?MDlPZHBnOUxOOG0zdjVKem5aeUJsL1JsV2J2WmpZV1Z6YlN1OE00Mm9rUldl?=
 =?utf-8?B?SEFOSnRaS04wK3EvMFh2V1VNQnhkb0J4YUxSUnlVM0ZwWlRQWk9CTE52cUsx?=
 =?utf-8?B?WFZqVlpETnhCa1MxVkk3ODhFTU9rRTJ3NzFaYUc0c3B1TURYTGlBeHVnaVFL?=
 =?utf-8?B?MzhXVXA2cElvVkN5eHVEVlNTWDVHaVJtaCtxVm9NRElidjZZWkV3S2FIOE9G?=
 =?utf-8?B?enN0YTN0UFQyUXEvcDZ2b0E0NnNuRjY0czl6WWRlU1QrQktHK01BeTlYZFp6?=
 =?utf-8?B?b0F2dGh5Nk9BMFMyR3RkLzBJMTZtTENIS3VocEhPYTM1Rmx0cjZXU1hldHR1?=
 =?utf-8?B?Q0NtRVZYOUZndDNCZ284MnhWSjc3K3JyOEozQllyakN2R3FoT2I4bG1ISVFt?=
 =?utf-8?B?TnRPd2ZnSzUydjhiNk5DWElKbC95SDFNeWYvb2pVdGtwVWNHRHpScGRjVWs0?=
 =?utf-8?B?T0RwMG8zSjNUcWFrZ2JjS2ErcHllSnAyUDVVV2JRUWFXSlFraXBGeUtHeGp6?=
 =?utf-8?B?ZG1OUk15Zms2VldMVVduUU9FZGZwMzRFb2VBRjhZMVNYb3JXcjczRnhYUU5r?=
 =?utf-8?B?VERWdGNFeVR0UmNJODRQamFzbXgzQzJ0R0c1dU1BV2F0YTZlQ2lOWnMwUTNx?=
 =?utf-8?B?TkFWbk04RTFMTXlUbm1VNlUrWTdKVEpZZFhYZSt1VGNpZkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(921020); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1d4SC9sVWt5Rms5aFkveEY5R3ZMSW9nM1dHY3NGTlVSYUVxRVZ3YUF3Q0t5?=
 =?utf-8?B?bERtckJXNTM5ZEJsd21ORzkyNmxYSWNXSjYvNTlhSkFhMVRGalFqOU83N3Vo?=
 =?utf-8?B?RTNFanRKUG15Mnc2SmV4dERUMERYdDhZV1h4MDNBNG5GUkJQRlBoeGpiT1A2?=
 =?utf-8?B?aUtGazVLTEovUW1iRzFKZDgxb0hGMFRWbHg4KzZ3V3dkemZaTElPMmpiSngw?=
 =?utf-8?B?MW0wZGs4REJKZjNqYnVsNjFBR1ovUVBUQjY1dzIrUUpTR3hmOS9PNTh4OWxj?=
 =?utf-8?B?cGtyUUwwdkEvbWt1MTIwOVpadWZIRTM2d1BzMUw0N0lIV2IyT0lTbDJOZlZh?=
 =?utf-8?B?R09LcjhOY0VqS3JaSm9aMmVwRnYrOVRSS21YbCt5UXlNSzRjclBEUVA2eHMz?=
 =?utf-8?B?Z0wzdXU3WE96eHpuUXhLdS8vVkVYenBQcE1YQ0lGd3hHdWVKNjFUUmpUMW5t?=
 =?utf-8?B?aS9kdWNlQkRyQ3NBaEJNUTMxZXowczNnYUlwNUxlVUxFT0drSDlPVkRtYitn?=
 =?utf-8?B?SVZocFBlemNLazNXOWlmeFpPYlp3S1cva0lyMEgxNlpEMDRUVGx6eDFPVXAr?=
 =?utf-8?B?d1R6U0RaQVRveEpiTUkxcmdhK2VDRlhhSW5hb0R0VzhIR0NyMS9qWHN5cmRi?=
 =?utf-8?B?anZXbjZoOUQvblVySGlBVHRSb3lzdEpvZjlrT3lRVFhCaE1Db3Y2ZHVNY1Zm?=
 =?utf-8?B?VWxkVG9ZQk1HdzQzTG52RGV0MEFmZWtKU3dzblJEZDF2eHFDbVp3RWZhUWFw?=
 =?utf-8?B?Q0FDMVZyQUZXTDI4QmtrQThpSUdHQTI5YTdsNktDZFpoRGFkWFovRFlCekJQ?=
 =?utf-8?B?TWpIcXhXMjhxbHpPMjlpWVlzb2FiRXYxYnNjcEo3UWVJbjlTVnFOa0FZS1M2?=
 =?utf-8?B?c0NWbWtnWWRsY3FCanZIazA1YXI2YVNQaDBuR2tVUWRYNVVzWjhwZE1YeEV3?=
 =?utf-8?B?L09MY01MYmY4VFdJLzFic2owRHk2MjdGNnF6TE9iYnJrb1ZvcklsYnJoZDVu?=
 =?utf-8?B?aVpKV0xXMi9XWGpUaXA2TXF1U2EyWkhJdkRDOFdBMkwxZGVyVU1odU1tM3k5?=
 =?utf-8?B?bk9QQTJZSTdlS3FlZlY4ZVR2VHRqdlF3QzlmV2JYNjA3WHdGbkdiVjZnM0Ri?=
 =?utf-8?B?T21kTU1YRXJwRWk5QjU5dmRMaUFEcjQ4UXZxbDZRaGdYVGdqYWxlNnBncmVK?=
 =?utf-8?B?M3hkWkxKMmt5UWw0dDBQMHk0R0QwWHVLTFV6MzJoeDdDRVhtWS9veXdpQlV4?=
 =?utf-8?B?d2Z4aTNqOHBsOTNWMnpxQ1VGaEtUdUFwM2c1UVN1Nnh0M0Z0R1JnWG9BQytU?=
 =?utf-8?B?OXBWMGlrMGFEVzFhRkFnZjB0cWZWVStHZW8yd3lhYUtORllZVTZkNmhhQU91?=
 =?utf-8?B?cmdVRzkremttZk4zakpEcVhvZ3lnL0R1T0x6VmkzNEU0dEN2bktoZjFUdEtX?=
 =?utf-8?B?V1ZUbWtvb1JwYTR0SmZzdmhkZ1BFR2J1ZDFRdllsZStQQnZtOENQUU5FWFlM?=
 =?utf-8?B?WVYzbU1lSVIxU1h2UUpuTkh0OWdMQjEweWtLb1VMSmdzVFBHTlA4SlBzYzZx?=
 =?utf-8?B?bCtXUld6NDBvNnpTOGRsY2R1QzZqL0M3R0ZBUTY4MUg4SWEyTC9NQlRhL1hB?=
 =?utf-8?B?MmY3cDA2Y0JtVit2SVllSXRyWEJLdjc0YTAvQ0RDTWFaKytXTUUvbHZlRzlS?=
 =?utf-8?B?dXlKdG05ZlNmZlhJbHpUVS8zYWxab2YrN21LclVKMHB1eDZkZWxKL28wWk5Z?=
 =?utf-8?B?bFBJMjVrRDF6Z0xiMk9YUVlIU3JoOHNqQnh6Q3FmUmVKeVY1OEFtdU13ZVh4?=
 =?utf-8?B?bmJjYTBsZ3Y5SFJnN3RLNU5zQTRjTXh0YmZPa2tTWVFibXg0b1d4K2g2YjFR?=
 =?utf-8?B?OTVOejJ3MGsrVTB3WnUvOStFa2RQSkc4S3hHb1NpeUR4ZlpxOUtzM24ybHNz?=
 =?utf-8?B?UFhvcTlhZ29Pdndxa3BMN2N3ZDVJdjNwZFJrem5sMlJzQUYwSDZua1RTT1dM?=
 =?utf-8?B?S2Q2NXMveWJ0RzlueUFxQVV4aGlyNU1GSkwvbzZhWEhPT3F5WWhtbUQ5MTZ4?=
 =?utf-8?B?MldjSWZTWmZDc2JBc2FhRVJnbDRLYnE4ekN4cktoVmRoeXdWU3MrQ1NiRlQ4?=
 =?utf-8?Q?HbhE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b067f0b-b3fe-4fb4-fc03-08dd364adba6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 16:28:49.7033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpOlexHU8pIegumzmFTtn67GQJ9UvKgr4PTdvMQVxMJsDx6JflJotXDjS1+02eCaUApBupLAgk7FLs4kWUZSjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8222
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
Cg0KVGhhbmtzIFZpdGFseSBmb3IgcmVzcG9uZGluZyAgICB0byBpdC4NCg0KQEthbWlsIEtvbmll
Y3pueQ0KTGliZHJtIGNoYW5nZXMgaGF2ZSBub3QgYmVlbiB1cHN0cmVhbWVkIHlldCBhbmQgSSBt
aXNzZWQgdGhhdCBwYXJ0IGFuZCB0aGF04oCZcyB0aGUgcmVhc29uIHRob3NlIHVuZGVmaW5lZCBm
dW5jdGlvbiBmYWlsdXJlcyBhcmUgc2Vlbi4NCk9uY2Ugd2UgaGF2ZSB0aGUgbmVlZGVkIGxpYmRy
bSBjaGFuZ2VzIG1lcmdlZCBJIHdpbGwgc3VibWl0IGl0IGFnYWluIGFuZCBob3BlZnVsbHkgaXQg
d2lsbCBwYXNzLg0KDQpSZWdhcmRzDQpTdW5pbCBraGF0cmkNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IFByb3N5YWssIFZpdGFseSA8Vml0YWx5LlByb3N5YWtAYW1kLmNvbT4N
ClNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDE2LCAyMDI1IDk6MTMgUE0NClRvOiBLYW1pbCBLb25p
ZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+OyBLaGF0cmksIFN1bmlsIDxT
dW5pbC5LaGF0cmlAYW1kLmNvbT47IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEZXVj
aGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlz
dGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgUHJvc3lhaywgVml0YWx5IDxWaXRhbHku
UHJvc3lha0BhbWQuY29tPjsgU2hhcm1hLCBTaGFzaGFuayA8U2hhc2hhbmsuU2hhcm1hQGFtZC5j
b20+OyBTdHJhd2JyaWRnZUBydGctc3VuaWwtbmF2aTMzLmFtZC5jb207IFN0cmF3YnJpZGdlLCBN
aWNoYWVsIDxNaWNoYWVsLlN0cmF3YnJpZGdlQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENI
IDMvOF0gbGliL2FtZGdwdTogQWRkIHVzZXIgbW9kZSBxdWV1ZSBzdXBwb3J0IGluIHJpbmcgY29u
dGV4dA0KDQpIaSBLYW1pbCwNCg0KSSBoYXZlIHNlbnQgdGhlIHJldmlldyB0byBTdW5pbCwgYnV0
IHdlIHdlcmUgdXNpbmcgdGhlIGludGVybmFsIHJldmlldyBwcm9jZXNzLiBJIGJlbGlldmUgU3Vu
aWwgaXMgYXdhcmUgb2YgdGhlIGJ1aWxkIGZhaWx1cmUsIGFuZCB3ZSBkaXNjdXNzZWQgaG93IHRv
IGFkZHJlc3MgaXQuIFVudGlsIHRoZSBidWlsZCBmYWlsdXJlIGlzIHJlc29sdmVkIGFuZCB0aGUg
aGVhZGVyIGlzIHVwZGF0ZWQgb3IgdGhlIG5ldyBjb2RlIGlzIGd1YXJkZWQsIHdlIHdpbGwgbm90
IHByb2NlZWQgd2l0aCB0aGUgbWVyZ2UuDQoNClRoYW5rcyBmb3IgeW91ciBoZWxwIQ0KDQpWaXRh
bHkNCg0KT24gMjAyNS0wMS0xNiAwNjo1MSwgS2FtaWwgS29uaWVjem55IHdyb3RlOg0KPiBIaSBT
dW5pbCwNCj4gT24gMjAyNS0wMS0xNiBhdCAxMjoyMjowNiArMDUzMCwgU3VuaWwgS2hhdHJpIHdy
b3RlOg0KPj4gQWRkIHRoZSBtZXRhIGRhdGEgdG8gc3VwcG9ydCB0aGUgdXNlciBtb2RlIGNvbW1h
bmQgc3VibWlzc2lvbiBpbiB0aGUNCj4+IHJpbmdfY29udGV4dC4NCj4+DQo+PiBVc2VyIG1vZGUg
Y29tbWFuZCBzdWJtaXNzaW9uIG1ldGhvZHMgbmVlZHMgdGhlc2UgcmVzb3VyY2VzIHRvIGJlDQo+
PiBpbml0aWFsaXplZCBhbmQgdG8gY3JlYXRlL2Rlc3Ryb3kgcXVldWVzLg0KPj4NCj4+IEFsc28g
b25jZSB3ZSBoYXZlIHRoZSBxdWV1ZSBjcmVhdGVkIHRoZSBxdWV1ZSBpZCBpcyB1c2VkIHRvIHN1
Ym1pdA0KPj4gdGhlIHdvcmsgbG9hZCB0byB0aGUgaC93Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IFN1bmlsIEtoYXRyaSA8c3VuaWwua2hhdHJpQGFtZC5jb20+DQo+PiBSZXZpZXdlZC1ieTogVml0
YWx5IFByb3N5YWsgdml0YWx5LnByb3N5YWtAYW1kLmNvbT4NCj4gV2h5IGRvIHlvdSBzZW5kIGl0
IGhlcmUgd2l0aCByLWIgYWxyZWFkeSBhZGRlZD8NCj4gV2FzIGlzIHNlbnQgaW4gc29tZSBwcmV2
aW91cyBzZXJpZXMgYW5kIGdvdCByLWIgb24gbWFpbGluZ2xpc3Q/DQo+IEkgZG8gbm90IHNlZSBh
bnkgaW5mbyBhYm91dCB0aGlzIGluIGNvdmVyIGxldHRlci4NCj4NCj4gQmVmb3JlIG1lcmdpbmcg
cGxlYXNlIGFkZHJlc3MgYnVpbGQgZmFpbHVyZXM6DQo+DQo+IHNlZSBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZ2Z4LWNpL2lndC1jaS10YWdzLy0vcGlwZWxpbmVzLzEzNDY2MTEgZm9y
IHRoZSBvdmVydmlldy4NCj4NCj4gYnVpbGQ6dGVzdHMtZGViaWFuLW1lc29uIGhhcyBmYWlsZWQg
KGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvaWd0LWNpLXRhZ3MvLS9qb2Jz
LzY5NDM3Nzc2KToNCj4gICAuLi9saWIvYW1kZ3B1L2FtZF91c2VyX3F1ZXVlLmM6IEluIGZ1bmN0
aW9uIOKAmGFtZGdwdV91c2VyX3F1ZXVlX2Rlc3Ryb3nigJk6DQo+ICAgLi4vbGliL2FtZGdwdS9h
bWRfdXNlcl9xdWV1ZS5jOjE4Mzo2OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24g4oCYYW1kZ3B1X2ZyZWVfdXNlcnF1ZXVl4oCZOyBkaWQgeW91IG1lYW4g4oCYYW1kZ3B1
X29wZW5fZGV2aWNlc+KAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25d
DQo+ICAgciA9IGFtZGdwdV9mcmVlX3VzZXJxdWV1ZShkZXZpY2VfaGFuZGxlLCBjdHh0LT5xdWV1
ZV9pZCk7DQo+ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiAgICAgICAgIGFtZGdwdV9v
cGVuX2RldmljZXMNCj4gICAuLi9saWIvYW1kZ3B1L2FtZF91c2VyX3F1ZXVlLmM6MTgzOjY6IHdh
cm5pbmc6IG5lc3RlZCBleHRlcm4gZGVjbGFyYXRpb24gb2Yg4oCYYW1kZ3B1X2ZyZWVfdXNlcnF1
ZXVl4oCZIFstV25lc3RlZC1leHRlcm5zXQ0KPiAgIC4uL2xpYi9hbWRncHUvYW1kX3VzZXJfcXVl
dWUuYzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X3VzZXJfcXVldWVfY3JlYXRl4oCZOg0KPiAgIC4u
L2xpYi9hbWRncHUvYW1kX3VzZXJfcXVldWUuYzozODc6NzogZXJyb3I6IGltcGxpY2l0IGRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGFtZGdwdV9jcmVhdGVfdXNlcnF1ZXVl4oCZOyBkaWQgeW91
IG1lYW4g4oCYYW1kZ3B1X2NzX2NyZWF0ZV9zZW1hcGhvcmXigJk/IFstV2Vycm9yPWltcGxpY2l0
LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPiAgIHIgPSBhbWRncHVfY3JlYXRlX3VzZXJxdWV1ZShk
ZXZpY2VfaGFuZGxlLCBBTURHUFVfSFdfSVBfR0ZYLA0KPiAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fg0KPiAgICAgICAgICAgICAgYW1kZ3B1X2NzX2NyZWF0ZV9zZW1hcGhvcmUNCj4gICAg
IC4uL2xpYi9hbWRncHUvYW1kX3VzZXJfcXVldWUuYzozODc6Nzogd2FybmluZzogbmVzdGVkIGV4
dGVybiBkZWNsYXJhdGlvbiBvZiDigJhhbWRncHVfY3JlYXRlX3VzZXJxdWV1ZeKAmSBbLVduZXN0
ZWQtZXh0ZXJuc10NCj4gICAgICAgY2MxOiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMg
ZXJyb3JzDQo+ICAgIG5pbmphOiBidWlsZCBzdG9wcGVkOiBzdWJjb21tYW5kIGZhaWxlZC4NCj4g
ICAgIHNlY3Rpb25fZW5kOjE3MzcwMTIzOTM6c3RlcF9zY3JpcHQNCj4gICAgIHNlY3Rpb25fc3Rh
cnQ6MTczNzAxMjM5MzpjbGVhbnVwX2ZpbGVfdmFyaWFibGVzDQo+ICAgICBDbGVhbmluZyB1cCBw
cm9qZWN0IGRpcmVjdG9yeSBhbmQgZmlsZSBiYXNlZCB2YXJpYWJsZXMNCj4gICAgc2VjdGlvbl9l
bmQ6MTczNzAxMjM5NDpjbGVhbnVwX2ZpbGVfdmFyaWFibGVzDQo+ICAgICAgRVJST1I6IEpvYiBm
YWlsZWQ6IGV4aXQgY29kZSAxDQo+DQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+DQo+PiAtLS0NCj4+
ICBsaWIvYW1kZ3B1L2FtZF9pcF9ibG9ja3MuaCB8IDMxICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9saWIvYW1kZ3B1L2FtZF9pcF9ibG9ja3MuaCBiL2xpYi9hbWRncHUvYW1kX2lw
X2Jsb2Nrcy5oDQo+PiBpbmRleCBkYzRkODcxNTEuLjlkMTEwZDQwMiAxMDA2NDQNCj4+IC0tLSBh
L2xpYi9hbWRncHUvYW1kX2lwX2Jsb2Nrcy5oDQo+PiArKysgYi9saWIvYW1kZ3B1L2FtZF9pcF9i
bG9ja3MuaA0KPj4gQEAgLTg2LDYgKzg2LDE0IEBAIHN0cnVjdCBkeW5hbWljX3Rlc3R7DQo+PiAg
ICAgIGJvb2wgc3VwcG9ydF9zZG1hOw0KPj4gIH07DQo+Pg0KPj4gK3N0cnVjdCBhbWRncHVfdXNl
cnFfYm8gew0KPj4gKyAgICBhbWRncHVfYm9faGFuZGxlIGhhbmRsZTsNCj4+ICsgICAgYW1kZ3B1
X3ZhX2hhbmRsZSB2YV9oYW5kbGU7DQo+PiArICAgIHVpbnQ2NF90IG1jX2FkZHI7DQo+PiArICAg
IHVpbnQ2NF90IHNpemU7DQo+PiArICAgIHZvaWQgKnB0cjsNCj4+ICt9Ow0KPj4gKw0KPj4gICNk
ZWZpbmUgZm9yX2VhY2hfdGVzdCh0LCBUKSBmb3IodHlwZW9mKCpUKSAqdCA9IFQ7IHQtPm5hbWU7
IHQrKykNCj4+DQo+PiAgLyogc2V0IGR1cmluZyBleGVjdXRpb24gKi8NCj4+IEBAIC0xNDEsNiAr
MTQ5LDI5IEBAIHN0cnVjdCBhbWRncHVfcmluZ19jb250ZXh0IHsNCj4+ICAgICAgc3RydWN0IGFt
ZGdwdV9jc19pYl9pbmZvIGliX2luZm87ICAgICAvKiBhbWRncHVfYm9fbGlzdF9jcmVhdGUgKi8N
Cj4+ICAgICAgc3RydWN0IGFtZGdwdV9jc19yZXF1ZXN0IGlic19yZXF1ZXN0OyAvKiBhbWRncHVf
Y3NfcXVlcnlfZmVuY2Vfc3RhdHVzICovDQo+PiAgICAgIHN0cnVjdCBhbWRncHVfY3NfZXJyX2Nv
ZGVzIGVycl9jb2RlczsNCj4+ICsNCj4+ICsgICAgLyogVXNlciBxdWV1ZSByZXNvdXJjZXMgKi8N
Cj4+ICsgICAgc3RydWN0ICBhbWRncHVfdXNlcnFfYm8gcXVldWU7DQo+PiArICAgIHN0cnVjdCAg
YW1kZ3B1X3VzZXJxX2JvIHNoYWRvdzsNCj4+ICsgICAgc3RydWN0ICBhbWRncHVfdXNlcnFfYm8g
ZG9vcmJlbGw7DQo+PiArICAgIHN0cnVjdCAgYW1kZ3B1X3VzZXJxX2JvIHJwdHI7DQo+PiArICAg
IHN0cnVjdCAgYW1kZ3B1X3VzZXJxX2JvIHdwdHI7DQo+PiArICAgIHN0cnVjdCAgYW1kZ3B1X3Vz
ZXJxX2JvIGNzYTsNCj4+ICsgICAgc3RydWN0ICBhbWRncHVfdXNlcnFfYm8gZW9wOw0KPj4gKw0K
Pj4gKyAgICB1aW50MzJfdCAqcXVldWVfY3B1Ow0KPj4gKyAgICB1aW50NjRfdCAqd3B0cl9jcHU7
DQo+PiArICAgIHVpbnQ2NF90ICpkb29yYmVsbF9jcHU7DQo+PiArDQo+PiArICAgIHVpbnQzMl90
IGRiX2hhbmRsZTsNCj4+ICsgICAgdWludDMyX3QgcXVldWVfaWQ7DQo+PiArICAgIHVpbnQzMl90
IG5wa3Q7DQo+PiArDQo+PiArICAgIHVpbnQzMl90IHRpbWVsaW5lX3N5bmNvYmpfaGFuZGxlOw0K
Pj4gKyAgICB1aW50NjRfdCBwb2ludDsNCj4+ICsgICAgYm9vbCB1c2VyX3F1ZXVlOw0KPj4gKw0K
Pj4gKyAgICBzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZvX2RldmljZSBkZXZfaW5mbzsNCj4+ICB9Ow0K
Pj4NCj4+DQo+PiAtLQ0KPj4gMi4zNC4xDQo+Pg0K
