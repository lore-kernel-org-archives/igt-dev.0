Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5047BEA3F0C
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 06:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CDD10E1C5;
	Tue, 10 Feb 2026 06:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NsucvCnu";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EA110E1C5
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 06:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TX/ocBSXi1ThkLVmnzU9GycQ1qHnS1eptyGtSEz5nI6T7A2ixoPterwnq+JdUtb8nGA7DAfBwNOsOkPUGJSaAt34X3nOGUK9af2usXB6+MUgd3iU8L+J1i+PIoCzeQ1bCPqXbfAXkzX8L6hgsQK73vFaWjbktWTSg9SpAPe5BsM7bsfgJtuv2L+lPskVwB+6bCh1Sn6Y6JW7iKFrnOR/gb6zrEHXnUOQHtiol+S6PnJViwvx2pLS8mk2yN2BwUEZbJAcKs5ZDmKemlg5+lqm1LKfDvTOOuLTupO7bBIwvpH2j+k6Y93+98Zr3MjCQlYTkuQZhK6XEtywQ0RjeEw4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnKwHqppnYNIHhg7dGIfbZ9UoAO6IKW4rxujG44Reo4=;
 b=xFxayH3qEfl3hxj0g7kDrk3iHEOH2BesCWTG+PknVyEjzwtJPJTQZz0SDG3sxNbpL0dtC8pw7Q/U6gNxdp3v50SzTg2Wf9TPkcKsSfs+6WOSXpDYS5Sh5Ndd4GTEIqzCe7U7mZhCHhtcxgtV0s/oaKwMWFUyYgYQblFmUiOzE4mUdqiRqVwfQmZw+7f+ZZD1BD0YCy9VXh9QeGPmpP1GKUhMCGNAjDTppo2MARmIz+m/0XtwvNx1bLhVle9iPHFEo31VowgVKz+v9EDDFk1Wvxqx65a71MzVtlxti2RFA1PqyAOc58ogvJxiNSHaD/U+fTzR+SpjieeWCNDaT0kvSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnKwHqppnYNIHhg7dGIfbZ9UoAO6IKW4rxujG44Reo4=;
 b=NsucvCnu5N3wGQxGZ4ZurpCCmzxMXCkG2wvhyh6xrc3jbtbb1sxAkFFWaA/6pf1mAr5zN1ttx/0IMJ5Rd9q0b2H+7+32Y6ff7tZdgn916/SEh4gtn5DYXRS9IVDx3NyP9IvE+q2WHfeLUiZn2nVYMFcAfob0uTWcpi0tT2slFVc=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 06:25:13 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 06:25:12 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 2/2] tests/amdgpu: print total runtime in min:sec for
 whole test binary
Thread-Topic: [PATCH 2/2] tests/amdgpu: print total runtime in min:sec for
 whole test binary
Thread-Index: AQHcmkl92IUmN3IM7kiv8kT8KWTdfrV7dxXw
Date: Tue, 10 Feb 2026 06:25:12 +0000
Message-ID: <DM4PR12MB5152C669D0099BFD12594F3BE362A@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260210045517.120355-1-vitaly.prosyak@amd.com>
 <20260210045517.120355-2-vitaly.prosyak@amd.com>
In-Reply-To: <20260210045517.120355-2-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-02-10T06:23:54.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|LV3PR12MB9265:EE_
x-ms-office365-filtering-correlation-id: 9f707808-5584-4a34-c7d9-08de686d2595
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?VnBFZGxlWk5PMzVJN2ErNC92aGdscytxTWY2djlucmF0Y1d2bmdYVmhZZm12?=
 =?utf-8?B?UWF4bVQ0VWoxTGMrbUdSWjRJcWV5TExURjg3US9hMkkzQmJPSXRWSGRsbjlX?=
 =?utf-8?B?MEZueVlvMnpDdFN0R3Bpcy9SazhTcFYwV3NmN3lmaUFnNnlTMjYrSnM5bGU0?=
 =?utf-8?B?NGE4aTVpdFlMR3YwTTJ6WVdacVoybW5Cb1l3OTZIak5PUXQwNVdNK1drSTIr?=
 =?utf-8?B?TGFkd2psUWFNQk1ORzRBdU1LTk9JMCtTS2FyRlNXc0p0N1NUN284L1d4VzdK?=
 =?utf-8?B?N0J2MDBqZTNGYTI1Q29rdEczaElFbGRienYwYTVNQlN2SW05bzlXSHRzMVdS?=
 =?utf-8?B?WEFzenVKRTNKVWJ0S1NuZUhWejRncUJ3YXBlbndqdWc4dWp2bkkxVFNlZkRm?=
 =?utf-8?B?aXRiSUlYUW5OK282RHE3YWtlc3M4ZDNESWxQWnNOcjg5YjlmeHZuZVpVVzZ3?=
 =?utf-8?B?U1NGUGhNcTFpWmhqdXpFc2huczZUM0o3bDFacFFyT0ZJUVQ4QWJmZ0N5M243?=
 =?utf-8?B?dUQ1elg3ZitSd0ROc0orcW1IR2RpVytoNWt1dm1UaGlUSEsyQy9OR3dLM1gy?=
 =?utf-8?B?M0VpRzZCQk91TjZxZDBFMVNVV2U5S04ydktUd2kwcDZZOEZqRWxlaGIvekp4?=
 =?utf-8?B?MU5VR2U5Wlh6MFV3QnlnQVZnTVJSSUd6MlJnQ2RYQ1IzYWk2cE1Vam9GRlRR?=
 =?utf-8?B?K2wzTXErMEloU2Y5dGJsRFNxUUdZSWJSYjBJTzZiRlEvVWl0VzFvYmNnRnlG?=
 =?utf-8?B?dVFuN2FJU1V4VXBiSXNMMlVSUFovc3pOMDhpSXBBbnhYYXdDdUVDMURIUjlO?=
 =?utf-8?B?RFRMTVR3SjhPb05CSkVIallpLzRhV1BkREg3TW94WVcyWFRTQlNIOWw5MjJp?=
 =?utf-8?B?NDZOTEYva0djM3FzVzZkVmNoSmhlajE2R0VnZEdmOGQ4NUZCczNheUNkTFdl?=
 =?utf-8?B?U1h3WWRHRXJWYWlMZ2tqK3ZOT3orYVRON2NHYTVrZ3U4aVlseVp5SW92MEVu?=
 =?utf-8?B?b0xoMjhIOEtjWmFSZWpkbGxCakdNK1VJaXNHTTJuNkVxaTIxLzBMVDlpaXdt?=
 =?utf-8?B?N05LMUZCaUh4SVdKbXRMK0g4Vis2Q1BKNzhNU2FQVk8xMmxBTXdnQ3BHOW5J?=
 =?utf-8?B?RVVXODFTeDgrVlhibXB1Mm9USVdDc3VVQkp6SHdmTElUd2F0bDhBSGR5RHVI?=
 =?utf-8?B?TlFFWWpieE9BeDZvc1dXNWprb1YxOFZsZ2pXZ1hNSEdXa2lpR1ErekorRlpP?=
 =?utf-8?B?WGdLRUlRUlRFRGs2RlQvdEM2bGJUVnNaK1RzRVdYZGxSenMvNVVNSlpXcmNT?=
 =?utf-8?B?alZpdVNFb2RlbFl0bEhEbkUyVDE5NVJmWWZSQVMyMVUzbDFXZlZmWWFZQjFi?=
 =?utf-8?B?QjB6c1JLeURCQS9VeWppcEplcWZDbHFxa2NVSEhMWWo4dCsyaTl4ZUk3bzZF?=
 =?utf-8?B?dXR1Vjh1MmpSREp3NXorNnFzdE90UTdrRDB2cjFaN0JsLzIzeTVmVXVmZVU1?=
 =?utf-8?B?ZGN3bVBIT3pQYXVDMWxDQjNVVUJOUkNrNEt6T1hQWmFFZjRrbGFWSlhKV0VQ?=
 =?utf-8?B?cnZqMWxPQklOU1BSeEI4bC85am82azBWY0c4ZFpTRU1TK25HN3ZCVktmeURv?=
 =?utf-8?B?YUlNbVV5TWhOb0JWVjdna0x0eitJVng3bTlKd2cxS0lHVzRaWmF0Y0RWbjdL?=
 =?utf-8?B?ajJvM3lFL2k1dUw2TUNHR0tMQUxHT2wycmc0S1dMcnVFb1dLaGpodVRPZEdx?=
 =?utf-8?B?NytIZ1ZTUXFGdEVXdXMvOUdyNEtGUjkxeDZ4dUp3WUg1cE11MVZBUFduK2lF?=
 =?utf-8?B?eGhyQXBzRk9EOElucTkrVXZya1FYTmNybWRTaE02UFlXdjJkRExKUFg0S25k?=
 =?utf-8?B?d24vNXd3WWU4cTJEbllVeUMzUXFRejRsUVJOWFQ4UjB1T25BSVBYeGlySmgw?=
 =?utf-8?B?amd3MHFxYUM2TXQwN2trNDlJOStld3VPcE5MZ2lBUzJhNHpTYTllNE9qbTdP?=
 =?utf-8?B?SkI3OWpVWVhUVTU2ektOdGJkVzJaN0ZRdGpIcDRNdm1yek1MZ1BITStFcTdL?=
 =?utf-8?B?T01lUEE1S2Z1b25hOUhvZ0dhc2pIR2xvRHJjeXV3YjRrcVNhcFo0ejh0NHpR?=
 =?utf-8?B?emRmdng0N2IxODNmQy9jc3Z3TElGWjQwcWFiQlBiN0d2M3A1MVBmV0tzWDVp?=
 =?utf-8?Q?fTPEmjPoMGZN8bG+SDQz7EY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlY1M0R3N2pWbnYwY2V2OHVWNUh0ZGtqbmc4L0M0dE5uWHdqcEFIM1JRTHJQ?=
 =?utf-8?B?dlVaSmJvSERWODUxdDF1UlcxWldmK1QrR1pFZXgwemp6N0ExYkFOdXVOY0hY?=
 =?utf-8?B?a0l0eW41OTRyQ3RoWWtYZWJqL2EyMEtrK2dTRkxsZDF1Q3NxTk5KRjgzQUkv?=
 =?utf-8?B?ckhHNXlmdFZpUkdiY0xMVTFHRU8vWmtBQTMrRjh5RFRkT3V4dlMwWVJid3pT?=
 =?utf-8?B?Q0dLc2laTTBCSHBob0xYY0NWS0svZXQzWlcxTy8yMFZkZmZGY3RhS1F1WGRO?=
 =?utf-8?B?MVhrZ25XRlFhcldTeDNnNUFGTDFxajNtcytmcDBhb1Q1YlREWGZ1VERKb0Mw?=
 =?utf-8?B?bmtzcERlSXd3VXFIZ1pIWTlzVXNxV3o1TXJaU0ZLVzNUWVJ5NisrN1hiRFpy?=
 =?utf-8?B?YWJCRWR3eVJNM3lWcW1lTE5LTDd3U3pzNEhKYVhQUW1Dei9BY0FRNTFtOEpr?=
 =?utf-8?B?VEV1ZzRTU1E4Y015MUt2T3NMaFMvY1phOXJHSmNtZ3d1N0JUdWZKZS9oZ29h?=
 =?utf-8?B?MFRDbHVacU1USDV5ZGtlemVzTTg1RTlIS2JEbHQ4aGNOR0NMcnMwQ1VuSmJO?=
 =?utf-8?B?bzZYVzAzUEs0TUt4Uk56enNNSHppM3dhMUFaWlpaZDBYSms2c2llMXJzOFdt?=
 =?utf-8?B?cmxIQ0N1MWZNWno5Rlp4UWNYdlFrZllVZm9FVzFFZnNrdzVUb0ZBa2JKeEZP?=
 =?utf-8?B?cHFMMUFuVWE2Umo0RHUvRFpvR1B3RThTVGFVZ3VGUm83YXluU25iU2ZoaGFn?=
 =?utf-8?B?OVVhTDFtRlJZcW15MTB0a3d4NlNYOGFmd3lUWG50M2Jyc3ZhVUJYR2h6cnJZ?=
 =?utf-8?B?OXdKSThXeWhUbERDbmVWUzVQcmpjLzhtUWhhczBuZFhFQWEvT1VMRnFhQW5q?=
 =?utf-8?B?VHA2WDhhRkVoVzREYlFxWTJrN21kUkhDbGg5NkNQSEpQdVBRNzdOM2IxclRz?=
 =?utf-8?B?RXF4Q0cvV0dQMGFJT3pJYThEcFMzY2pDcmVpVkxmdmgwaEtpbEFxMW5hdlFJ?=
 =?utf-8?B?czRWTFR0TkludlNjRlk4UUdDYUVyOHNzREdQUkZUbnp3Tm11RkY1UU5LOStW?=
 =?utf-8?B?Qkl4LzdkR2laZ1lpZkRGQWZkTnJBWVBFSkxLVHV4cllLSElXTHhvQ2ZaVGFY?=
 =?utf-8?B?TU5MSkU0WWQwTGZTaTg3aFBqVEpJRFpUU1d6NjZFQW5wMTRxYnVJbzlOWCty?=
 =?utf-8?B?ZzhUdTIzTzdoTjlUVm0xM2l4MU1MY3JvLzlPT3VqaUNEVU85aWRFblQ1ODF4?=
 =?utf-8?B?K3d4TUJ6bjdkN2RDTGJLK1dQbjdSQXMwclAxdmZXd1ZocG9OU1daN1ZDQ1Fo?=
 =?utf-8?B?K2l3cGZIK1QyaXZ4U1RwQmFZVDZ1dWx0eTFMaCtRZ2pENDFuYXBJZlpZZ24x?=
 =?utf-8?B?RThIUXg4ODRNZmVXVkhwOE9VOHBwYkRBOFRKYzN1VmdXQkFLcExBN0pUSldo?=
 =?utf-8?B?d3FETXJkc04vc1hCZ0FPTnpZU3hzZEdQdkRsTUJ1U0luUHlzQ080R2E4dERn?=
 =?utf-8?B?K29aWWJkTUdsN0sySllUSCtacFlVZU9zNGZFbUFNajJlelllWTdCckdpQUh2?=
 =?utf-8?B?bWpDQ2FjZ0RxSzBFUnljUFpsUS9BeGt3NFBBL21zQWNTenMvUjNkMnpNZkcz?=
 =?utf-8?B?T1VvbDBybEhKVjlTMlV5M3A5dUt1UUtzRGphT1JjM2VJazBRQnRzTWcvWTFm?=
 =?utf-8?B?SkNwblJqVUVUSnkvbmE4MGlMeWRtUG9NOEErek9PdWloMFVCSmZBNmpyc2tH?=
 =?utf-8?B?bnR5cU0vL0hxNnBsUTZ3Q0V6alhLQWNCN2xhWW1QQXhLV3FtWXUwZHlITVhG?=
 =?utf-8?B?UzhaT2RHYWhWdnY4RzlSYk1XT2w1d1BrcmxRWU5FQ1dCWkRlcnJkSkdkam1B?=
 =?utf-8?B?RHRxeXNXeDYrbVBMUVk4aEthRXB4Y0YzbG9KTGg2am40bnFxTXJNMWFKL0w3?=
 =?utf-8?B?YVJESW1QcWJwcTlFYmlQcS9hQWlUbXZucWlDbDdCamVxYUM1ZUNDSnVTQkRa?=
 =?utf-8?B?by9oUC9ZaThFYTRBb2dvSzRzbFRQcmVWWTBZcGd5UmZxcFBtOHNWZ1hBRXpk?=
 =?utf-8?B?Ym8veGpUOWFnUGdJVjI2K280QlJibndpaFdCMnR4aWtjaFkwK3JNb01MSW0x?=
 =?utf-8?B?MnVlSjJ0b0N2ZksrOHFTZzZERDNDM05VSGczM215MFRybHhWbVU0VEdFYngx?=
 =?utf-8?B?YzYxbmIrNEZ0ckgrSWN2K25RZHlXcmEyU24wTnJNOGNTT1l4RUs0aGtGeGsw?=
 =?utf-8?B?T280c0hYajJmRmZrUWRRTkNiQzhFOGkxRnJoQzJMSmp1MXdMZitmTW5icE5W?=
 =?utf-8?Q?D9eMv5N6EZyBISl6LJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f707808-5584-4a34-c7d9-08de686d2595
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 06:25:12.3436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NyXqKdpFW/f/6o3+9Jzu9+TF3gklwFb+lUh27V+7xsWbofVjDAzqAMaZS0AzCRs5r3/gvKcS9D5+1LhpqOwc7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265
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
Cg0KU2VyaWVzIGlzIFJldmlld2VkLWJ5OiBKZXNzZSBaaGFuZyA8amVzc2UuemhhbmdAYW1kLmNv
bT4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogdml0YWx5LnByb3N5YWtA
YW1kLmNvbSA8dml0YWx5LnByb3N5YWtAYW1kLmNvbT4NCj4gU2VudDogVHVlc2RheSwgRmVicnVh
cnkgMTAsIDIwMjYgMTI6NTQgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBQcm9zeWFrLCBWaXRhbHkgPFZpdGFseS5Qcm9zeWFrQGFtZC5jb20+OyBLb2VuaWcs
IENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFu
ZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgWmhhbmcsIEplc3NlKEppZSkgPEpl
c3NlLlpoYW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAyLzJdIHRlc3RzL2FtZGdwdTog
cHJpbnQgdG90YWwgcnVudGltZSBpbiBtaW46c2VjIGZvciB3aG9sZSB0ZXN0DQo+IGJpbmFyeQ0K
Pg0KPiBGcm9tOiBWaXRhbHkgUHJvc3lhayA8dml0YWx5LnByb3N5YWtAYW1kLmNvbT4NCj4NCj4g
U29tZSBhbWRncHUgdGVzdHMgKGUuZy4gZGlzcGF0Y2gvcXVldWVfcmVzZXQvZGVhZGxvY2spIGNh
biB0YWtlIHNldmVyYWwgbWludXRlcw0KPiBvbiBjZXJ0YWluIHN5c3RlbXMvQ0kgY29uZmlndXJh
dGlvbnMuIFdoZW4gYSBqb2IgdGltZXMgb3V0LCBpdCBpcyBoYXJkIHRvIHRlbGwgd2hldGhlcg0K
PiB0aGUgYmluYXJ5IGlzIG1ha2luZyBwcm9ncmVzcyBvciBzaW1wbHkgcnVubmluZyBsb25nLg0K
Pg0KPiBBZGQgYSBzbWFsbCBoZWxwZXIgY2FsbCBhdCB0aGUgYmVnaW5uaW5nIGFuZCBlbmQgb2Yg
dGhlIG1haW4gZml4dHVyZSB0byBwcmludCB0aGUgdG90YWwNCj4gZWxhcHNlZCB0aW1lIGZvciB0
aGUgZW50aXJlIHRlc3QgYmluYXJ5IGluIG1pbnV0ZXMgYW5kIHNlY29uZHMuDQo+DQo+IFRoaXMg
bWFrZXMgaXQgZWFzaWVyIHRvIGNvbXBhcmUgcnVudGltZSBhY3Jvc3MgbWFjaGluZXMvQ0kgcnVu
cyBhbmQgdG8gc3BvdA0KPiByZWdyZXNzaW9ucyB3aXRob3V0IGNoYW5naW5nIHN1YnRlc3QtbGV2
ZWwgb3V0cHV0Lg0KPg0KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPg0KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0K
PiBDYzogSmVzc2UgWmhhbmcgPGplc3NlLnpoYW5nQGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IFZpdGFseSBQcm9zeWFrIDx2aXRhbHkucHJvc3lha0BhbWQuY29tPg0KPiAtLS0NCj4gIHRlc3Rz
L2FtZGdwdS9hbWRfZGVhZGxvY2suYyAgICB8IDMgKysrDQo+ICB0ZXN0cy9hbWRncHUvYW1kX2Rp
c3BhdGNoLmMgICAgfCA0ICsrKy0NCj4gIHRlc3RzL2FtZGdwdS9hbWRfcXVldWVfcmVzZXQuYyB8
IDQgKysrLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+DQo+IGRpZmYgLS1naXQgYS90ZXN0cy9hbWRncHUvYW1kX2RlYWRsb2NrLmMgYi90ZXN0
cy9hbWRncHUvYW1kX2RlYWRsb2NrLmMgaW5kZXgNCj4gNWQ2MTU3OTlkLi41MzI1YzBhZGUgMTAw
NjQ0DQo+IC0tLSBhL3Rlc3RzL2FtZGdwdS9hbWRfZGVhZGxvY2suYw0KPiArKysgYi90ZXN0cy9h
bWRncHUvYW1kX2RlYWRsb2NrLmMNCj4gQEAgLTksNiArOSw3IEBADQo+ICAjaW5jbHVkZSAibGli
L2FtZGdwdS9hbWRfY29tbWFuZF9zdWJtaXNzaW9uLmgiDQo+ICAjaW5jbHVkZSAibGliL2FtZGdw
dS9hbWRfZGVhZGxvY2tfaGVscGVycy5oIg0KPiAgI2luY2x1ZGUgImxpYi9hbWRncHUvYW1kZ3B1
X2FzaWNfYWRkci5oIg0KPiArI2luY2x1ZGUgImxpYi9hbWRncHUvYW1kX3V0aWxzLmgiDQo+DQo+
ICAjZGVmaW5lIEFNREdQVV9GQU1JTFlfU0kgICAgICAgICAgICAgICAgICAgICAgICAxMTAgLyog
SGFpbmFuLCBPbGFuZCwgVmVyZGUsIFBpdGNhaXJuLA0KPiBUYWhpdGkgKi8NCj4gICNkZWZpbmUg
QU1ER1BVX0ZBTUlMWV9DSSAgICAgICAgICAgICAgICAgICAgICAgIDEyMCAvKiBCb25haXJlLCBI
YXdhaWkgKi8NCj4gQEAgLTU0LDYgKzU1LDcgQEAgaW50IGlndF9tYWluKCkNCj4gICAgICAgICAg
ICAgICB1aW50MzJfdCBtYWpvciwgbWlub3I7DQo+ICAgICAgICAgICAgICAgaW50IGVycjsNCj4N
Cj4gKyAgICAgICAgICAgICBsb2dfdG90YWxfdGltZSh0cnVlLCBpZ3RfdGVzdF9uYW1lKCkpOw0K
PiAgICAgICAgICAgICAgIGZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9BTURHUFUpOw0KPg0K
PiAgICAgICAgICAgICAgIGVyciA9IGFtZGdwdV9kZXZpY2VfaW5pdGlhbGl6ZShmZCwgJm1ham9y
LCAmbWlub3IsICZkZXZpY2UpOyBAQCAtDQo+IDI0OSw1ICsyNTEsNiBAQCBpbnQgaWd0X21haW4o
KQ0KPiAgICAgICBpZ3RfZml4dHVyZSgpIHsNCj4gICAgICAgICAgICAgICBhbWRncHVfZGV2aWNl
X2RlaW5pdGlhbGl6ZShkZXZpY2UpOw0KPiAgICAgICAgICAgICAgIGRybV9jbG9zZV9kcml2ZXIo
ZmQpOw0KPiArICAgICAgICAgICAgIGxvZ190b3RhbF90aW1lKGZhbHNlLCBpZ3RfdGVzdF9uYW1l
KCkpOw0KPiAgICAgICB9DQo+ICB9DQo+IGRpZmYgLS1naXQgYS90ZXN0cy9hbWRncHUvYW1kX2Rp
c3BhdGNoLmMgYi90ZXN0cy9hbWRncHUvYW1kX2Rpc3BhdGNoLmMgaW5kZXgNCj4gMmVmZTM3NDA0
Li40NGFhMmQxMjggMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2FtZGdwdS9hbWRfZGlzcGF0Y2guYw0K
PiArKysgYi90ZXN0cy9hbWRncHUvYW1kX2Rpc3BhdGNoLmMNCj4gQEAgLTEyLDYgKzEyLDcgQEAN
Cj4gICNpbmNsdWRlICJsaWIvYW1kZ3B1L2FtZF9jb21tYW5kX3N1Ym1pc3Npb24uaCINCj4gICNp
bmNsdWRlICJsaWIvYW1kZ3B1L2NvbXB1dGVfdXRpbHMvYW1kX2Rpc3BhdGNoX2hlbHBlcnMuaCIN
Cj4gICNpbmNsdWRlICJsaWIvYW1kZ3B1L2NvbXB1dGVfdXRpbHMvYW1kX2Rpc3BhdGNoLmgiDQo+
ICsjaW5jbHVkZSAibGliL2FtZGdwdS9hbWRfdXRpbHMuaCINCj4NCj4gIHN0YXRpYyB2b2lkDQo+
ICBhbWRncHVfZGlzcGF0Y2hfaGFuZ19zbG93X2dmeChhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXZp
Y2VfaGFuZGxlLCBAQCAtDQo+IDk1LDcgKzk2LDcgQEAgaW50IGlndF9tYWluKCkNCj4gICAgICAg
aWd0X2ZpeHR1cmUoKSB7DQo+ICAgICAgICAgICAgICAgdWludDMyX3QgbWFqb3IsIG1pbm9yOw0K
PiAgICAgICAgICAgICAgIGludCBlcnI7DQo+IC0NCj4gKyAgICAgICAgICAgICBsb2dfdG90YWxf
dGltZSh0cnVlLCBpZ3RfdGVzdF9uYW1lKCkpOw0KPiAgICAgICAgICAgICAgIGZkID0gZHJtX29w
ZW5fZHJpdmVyKERSSVZFUl9BTURHUFUpOw0KPg0KPiAgICAgICAgICAgICAgIGVyciA9IGFtZGdw
dV9kZXZpY2VfaW5pdGlhbGl6ZShmZCwgJm1ham9yLCAmbWlub3IsICZkZXZpY2UpOyBAQCAtDQo+
IDIxOCw1ICsyMTksNiBAQCBpbnQgaWd0X21haW4oKQ0KPiAgICAgICBpZ3RfZml4dHVyZSgpIHsN
Cj4gICAgICAgICAgICAgICBhbWRncHVfZGV2aWNlX2RlaW5pdGlhbGl6ZShkZXZpY2UpOw0KPiAg
ICAgICAgICAgICAgIGRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPiArICAgICAgICAgICAgIGxvZ190
b3RhbF90aW1lKGZhbHNlLCAgaWd0X3Rlc3RfbmFtZSgpKTsNCj4gICAgICAgfQ0KPiAgfQ0KPiBk
aWZmIC0tZ2l0IGEvdGVzdHMvYW1kZ3B1L2FtZF9xdWV1ZV9yZXNldC5jIGIvdGVzdHMvYW1kZ3B1
L2FtZF9xdWV1ZV9yZXNldC5jDQo+IGluZGV4IDcxYTdiNWUwOS4uZWRjMzM0YmQ3IDEwMDY0NA0K
PiAtLS0gYS90ZXN0cy9hbWRncHUvYW1kX3F1ZXVlX3Jlc2V0LmMNCj4gKysrIGIvdGVzdHMvYW1k
Z3B1L2FtZF9xdWV1ZV9yZXNldC5jDQo+IEBAIC0yNiw3ICsyNiw3IEBADQo+ICAjaW5jbHVkZSAi
bGliL2FtZGdwdS9hbWRfZGVhZGxvY2tfaGVscGVycy5oIg0KPiAgI2luY2x1ZGUgImxpYi9hbWRn
cHUvY29tcHV0ZV91dGlscy9hbWRfZGlzcGF0Y2guaCINCj4gICNpbmNsdWRlICJsaWIvYW1kZ3B1
L2FtZGdwdV9hc2ljX2FkZHIuaCINCj4gLQ0KPiArI2luY2x1ZGUgImxpYi9hbWRncHUvYW1kX3V0
aWxzLmgiDQo+DQo+ICAjZGVmaW5lIE5VTV9DSElMRF9QUk9DRVNTRVMgNA0KPg0KPiBAQCAtMTE2
Niw2ICsxMTY2LDcgQEAgaW50IGlndF9tYWluKCkNCj4gICAgICAgICAgICAgICB1aW50MzJfdCBt
YWpvciwgbWlub3I7DQo+ICAgICAgICAgICAgICAgaW50IGVycjsNCj4NCj4gKyAgICAgICAgICAg
ICBsb2dfdG90YWxfdGltZSh0cnVlLCBpZ3RfdGVzdF9uYW1lKCkpOw0KPiAgICAgICAgICAgICAg
IHBvc2l4X3NwYXduX2ZpbGVfYWN0aW9uc19pbml0KCZhY3Rpb24pOw0KPg0KPiAgICAgICAgICAg
ICAgIGlmICghZ2V0X2NvbW1hbmRfbGluZShjbWRsaW5lLCAmYXJnYywgJmFyZ3YsICZwYXRoKSkg
QEAgLTEyNjUsNQ0KPiArMTI2Niw2IEBAIGludCBpZ3RfbWFpbigpDQo+ICAgICAgICAgICAgICAg
cG9zaXhfc3Bhd25fZmlsZV9hY3Rpb25zX2Rlc3Ryb3koJmFjdGlvbik7DQo+DQo+ICAgICAgICAg
ICAgICAgZnJlZV9jb21tYW5kX2xpbmUoYXJnYywgYXJndiwgcGF0aCk7DQo+ICsgICAgICAgICAg
ICAgbG9nX3RvdGFsX3RpbWUoZmFsc2UsIGlndF90ZXN0X25hbWUoKSk7DQo+ICAgICAgIH0NCj4g
IH0NCj4gLS0NCj4gMi41Mi4wDQoNCg==
