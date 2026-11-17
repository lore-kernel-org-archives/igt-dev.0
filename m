Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9C3606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 01:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QazL2i2K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A5810EAD8;
	Tue, 17 Nov 2026 01:07:57 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010026.outbound.protection.outlook.com
 [40.93.198.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB56B10EAD8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 01:06:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0Kkt+OIqyZOdG9YrDIPnEFZIWL2qYAzkChn63USNneHEdX6VBf1ZAKkNRfdMv1MQqI1MA9f14HyV0t5wckMIp/vI6VXnchY5ylP8KjzDA+Wssqx3RwDzOYYJJRI4LXkwYA75edcAIfzzzrhFCUhuY23dbEGgg88CHQyDeHXHOsV1P4XoXtjnHRDCsuvfMMC2J22xNu7R6EoYP94XpPULDXt4qSEVY8ptoFjfEqYFraswaIs4iHa7eTY6zf9xC8XRZlQQxYgjudAQPi9MaMWtgXGvqHbGycxB6XhJNKGPMG/ZOLHmAxxnOkB5r3Ym8doDMdLqikRVqAuw7jGajgV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qimOYO5UqzH6b/32F/DcF7vNqNY16bhwM6Nj/MyCp4I=;
 b=LZ2fEuYg6eELLmPusnzETn3lkxMqkumjjy10eEAvRdmH6vL0QXoEpTXOBFaGflPzClL1NhAgp1XAS7mbVhJ/qDTWMv2+Hsf3Utw2DrMBqjtl/8fLz8MBfiIR7Uw+TYx9B+ZiZyOItPgwIXJyU1ENqy4lpciRhq28dierUX6bmAjvo+NFt0HhksM96fl5l+8iEnh9liyQchw4U9aTERM1xByQv/mBlfP39RoUve1GJG2h/F27cEmaIQk31yuaiJbKc6LWkyH22rvRvjUTCKiDNQKNp3VRtgPFeXAZv9aka1YMTM7VcNX2G9hteFmaFfK68QqR/LPC9EtaO1mkCMF6zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qimOYO5UqzH6b/32F/DcF7vNqNY16bhwM6Nj/MyCp4I=;
 b=QazL2i2KWkNJnBn66PLI+9bZpVJvdPbw5pXhxG1z9wTy5NmS9qlRh09Jg16KtBo7yoFVJpqIzPGwKqC3FjheHCAkCFmzMCBoOZXziVXONuR57lX79Odii0MPY7NJwXrtRMYKbLNqvYLQsUsjqupC2Mlny8grZyHE5fOUsqsCrBw=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by PH7PR12MB5879.namprd12.prod.outlook.com (2603:10b6:510:1d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 17 Nov
 2026 01:06:49 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 01:06:49 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] tests/amdgpu/queue_reset: skip for all LOCKDEP enabled
 builds
Thread-Topic: [PATCH] tests/amdgpu/queue_reset: skip for all LOCKDEP enabled
 builds
Thread-Index: AQHddipoDa20PvltUU+nEHTxoYpvxbcxc1qg
Date: Tue, 17 Nov 2026 01:06:48 +0000
Message-ID: <DM4PR12MB515249376B54665D53F0663DE37B2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20261117002709.51673-1-vitaly.prosyak@amd.com>
In-Reply-To: <20261117002709.51673-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-17T01:06:14.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|PH7PR12MB5879:EE_
x-ms-office365-filtering-correlation-id: b5dc3f41-42ae-4645-e2ca-08df44470ec3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|38070700021|56012099006|261009223027099003|261102123227099003|261021123027099003|261021121427099003|11063799006|10067099003;
x-microsoft-antispam-message-info: MOU5tM5rWBKRd6/RWjm/5EbYvd7gtc9RVsIa1hdiJMuTbxjmbL/dJJHRdocmdNH/LkatxQ90DW0zkbpW8tks6vUKdTmW1qhmnmGpqMWrwcDpLnmTBg92+hw0WCTWuO2voqxPBfvupfi3ChuEsy2MIQ562PiKXMHXO9ICosPPKWAl7lkDVktJABgN+/aWOFTbIP66UMTceI8X0bR3x5B42B9gnrGg8q/oLAyvX8WhK466LnIoXSS1xc6eqgvB+TrTP30aYVEnGmGYwWsLn3jYgemfKnkYeOuly1Wef2ASyHVJ3xRWJpLJf4ZzHnMqO6Wojk+hSfqNe5g1Rsu1yvGYnRQ1moxuZE+Xcg+B8AFRzqp+t8A+rcTgZZZfo8eus0swe1MUvx7dE3eI5l7SGSKUeQ6I9pqnxIvZkKcNwWkzcUhvKRn0xoPzF8yZa/MMyTEIwkeVqnv8Wa6TmcOsunIiKMpKsNA3uVpTIHuMtDK6MfBOn3Y2sZPWSIeW8X6wyqHVs1C+qiV9FruR70verMEWMwzsG2IUhFputqY5sdM6c6NUBHqg5XJXNWI2iMu4j6pnjki3uq4ORxnIG9N1/yYdLE0HsmjCRPi+B3SAdjqGm0d0XsTeXUB+B8MvjBtaVvPncwueqdcDGk3HCSt4IcJip3Dkjg8vOjwazVCsknF1AWwZOOc/yumz7AElLh1vzR2eunGJ12m71Z9zXiQWSgYJ5wObPJAdmaYEWea2YkGgyyc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(38070700021)(56012099006)(261009223027099003)(261102123227099003)(261021123027099003)(261021121427099003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uy9HSks4YW02UDdkSlRxTGtTWk52RVNNU3l2bWxSR3ZwNlI2ZlRDblRjajB0?=
 =?utf-8?B?NitleWl2YUI1RklReGd6Wk43M29HcFQ5M1E3OCtoOEUrY0VPSWdja3lscjRT?=
 =?utf-8?B?YUQrMkRXQWdCSmM0ZERWUzBqYkx4QmlRQmJUUmxpY0NTZTBoOXVNR1pCQk1H?=
 =?utf-8?B?eGdzcVAyK0xZc1BkRDhOaWo5SDJiR0NMeVlRV2pxTm45VGpwSG1aL0hMa3Ev?=
 =?utf-8?B?M0xWeG5jVUNXeFpPRCsxdTdjRmZ3WmFBT2gwZkFML1o3MW5uc25HU0paOEpS?=
 =?utf-8?B?aGRnWEZRZ0VSR3pCL2Rpa211aG5XNU5yNEZWeHRkSk9WSDVlcXZhZXVzMlUw?=
 =?utf-8?B?T1pTaWl6d1V2bm5uMFVjaTVYMHBhUU0yTm8yOVphTTFhVlZuNmRGYzVCNjhn?=
 =?utf-8?B?YjBPbkRhT1JlM2FVMkxHekRKZ2RaUlJqS2R4TExIUjhsYTJpMHRHbzFqeWcr?=
 =?utf-8?B?NDVrZjhPRWlXb0RyY3lzMWlYV1V4bllZeG9BQWVMZHV5ckpheDBIUkFrY2dI?=
 =?utf-8?B?Q0ZzdFh4cDUySHBYUjhzenpwQnZDcVRTbW92RjQ2ZTgyeFprd0ErTGpnQXlJ?=
 =?utf-8?B?SGtqWFEwZS9yR1FSSVVWTWVFK0RrVGhSNVlTaFFjU0JRWktrRU83OWthQUlq?=
 =?utf-8?B?cnpUcHNvRmFWNUJ6ZEYvcEFEMmZtUHNhMTVKUnAxRjNnY2tuMW9sRlkrcm9P?=
 =?utf-8?B?aUVxRUk5WCs1NlJONU1iNzFvNlB6cndNbC9HU3ZXZGMwY0lybGdLZDJaNTJU?=
 =?utf-8?B?Ri9rMzAza1hnYjJMQlI2R05uc3IvMEJrWjhkQXh3Wmo5MFdEWnJrTE84blhW?=
 =?utf-8?B?NWFTZWFTenZFemZyWHI1Qm12Y0JjT2NxTGJsQlFUdU5pbTVCRlh6OVRtN1ZO?=
 =?utf-8?B?ajN4WmdyNlh0OVVwYjAyZFZnNEZCNkNIdnhMMk9HMjA1akpKU0V2UUsrOHJQ?=
 =?utf-8?B?VXBOYkFYMFE1ZHZVamhSNHBkUmFpd043b21EL0YzbzNWUlZCaFFWNWUxb2k2?=
 =?utf-8?B?RzMydUlIaDJVT05zQ1R6eFJYakNOT082THFxak9Ud1IxcG5tZ0Q4bGNwcTFP?=
 =?utf-8?B?Z3hsS3o1U2wzOTdMRGxPT1JwY3hzRU44NHpSVFlmb2gzSmFQa3NMQWpqSzNB?=
 =?utf-8?B?K2F0QVFaTzU1RUQ0bHV6ZkhVOTNvQ0o5L2syQkFCVEJLR3orWURjVzFXSzhI?=
 =?utf-8?B?Mk1UMmJZSG5ZNjVjQkx6YUU1NHczb0p0SW91eWc2cm5zRW42MGs3NWtyL1U0?=
 =?utf-8?B?N2Q5L3huUU56TzZZbEZSbW1qbkQ0RDhUZVByeWxjVnRtSWpkd3U0M21zYVhP?=
 =?utf-8?B?Tlg0YllKWk11a1hjcEFJaE9Pd2MxTXN6SEx0VGpZNTRMYWxRU1kzNWVyZGh6?=
 =?utf-8?B?dFlERjNsUDNqRmx2ZGhRdkJGVjZHU3NhMFlqNFNWVDJUOENrdG8vemN0VjBv?=
 =?utf-8?B?VERXR3pka3BRZ1pKbHk2R0pPdS9kVGw5dXhDM3F5NERuemF1M3prUnN3dHcv?=
 =?utf-8?B?MU5udTl5dlpLRjV4aytuV0JKSTJyWklOc3NxS0FxUjFVMXQyeUszSzdaMWZB?=
 =?utf-8?B?SFhZcU5WbnlQSG4yRng1allwOTNJaGVhS3NGN2ZOOER0N0FvNlZuMFV0MVZ5?=
 =?utf-8?B?L01waytuT0c2MkJCRTV6MnR2aHN5enZkS1d2NWd0NUtsUHBZK3B2eU0yVW45?=
 =?utf-8?B?S1Uva3A2akZENXRRWG50YlE5M201aHg3TWtURitENGZ4bWhVQmhISFVKa3RF?=
 =?utf-8?B?SmdZVVFwT0ljRitLMjcwT1NOVzRtUjUwUkRtdWlNMjM2VTZuQWlNbFVuUFdT?=
 =?utf-8?B?d1dEZW9OWUFkSGFnUkNUU2J6UEtUY3ZZano5WDMvRVJiWXg3NllPa2RQZTE0?=
 =?utf-8?B?RkFUUW9GcnNIK2dvZWZob1paekJvakpwcDVYMmlaYjRYZGh1eXA0cngzdytN?=
 =?utf-8?B?RzQ2VGd2c0pWWGpUVnVwMk9VTTVjcC9LaGd6eUE0S2NMNlY4Y2Nhcnd3NXJu?=
 =?utf-8?B?cVU1MXVZYmNFUFkyYzQ1TDFJSlRJSVE2VEVlbnF6b2tCZ0F4b0wwcXVjaGoy?=
 =?utf-8?B?dC94N0lJRWFXeWsySVlHeit6aW1acExlYmFEWitSa2ZCRXgycmxYcXZUTDY1?=
 =?utf-8?B?MStJQVF0aFJ5aFpWQks4c2prY2xPaEhDNUoyck9Zc0F4VFlHMlVIMEY5NUJU?=
 =?utf-8?B?OXF5R3pJb2hPS2VsTFczRVphS3FrRWpOdVVlcy9Ta1RTcVpoem1wVUZsdHF4?=
 =?utf-8?B?WGdXTUtqbHljelVrcXV5NHdxbnU3SXVBNzljWjE5bEw4Vm1oMmNaN2JSOFov?=
 =?utf-8?Q?eFXHQu3/cp3OmOpa87?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5dc3f41-42ae-4645-e2ca-08df44470ec3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 01:06:49.0766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sF//N44lH4VTwgmzGJJf888kBV5lELKLSmyTZ/7D1GTo2JbVsyN0KaN83NMgN/XHGYJsWO938nH7NpLNasdGrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5879
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QU1EIEdlbmVyYWwNCg0KUmV2aWV3ZWQtYnk6SmVzc2UuWmhhbmdAYW1kLmNvbQ0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHZpdGFseS5wcm9zeWFrQGFtZC5jb20gPHZp
dGFseS5wcm9zeWFrQGFtZC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDE3LCAyMDI2
IDg6MjcgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBQcm9z
eWFrLCBWaXRhbHkgPFZpdGFseS5Qcm9zeWFrQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbg0K
PiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgWmhhbmcsIEplc3NlKEppZSkgPEplc3NlLlpoYW5nQGFt
ZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvYW1kZ3B1L3F1ZXVlX3Jlc2V0OiBza2lw
IGZvciBhbGwgTE9DS0RFUCBlbmFibGVkDQo+IGJ1aWxkcw0KPg0KPiBGcm9tOiBWaXRhbHkgUHJv
c3lhayA8dml0YWx5LnByb3N5YWtAYW1kLmNvbT4NCj4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6IEplc3NlIFpoYW5nIDxqZXNzZS56aGFuZ0BhbWQuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBWaXRhbHkgUHJvc3lhayA8dml0YWx5LnByb3N5YWtAYW1kLmNv
bT4NCj4gLS0tDQo+ICB0ZXN0cy9hbWRncHUvYW1kX3F1ZXVlX3Jlc2V0LmMgfCAxMCArKy0tLS0t
LS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvYW1kZ3B1L2FtZF9xdWV1ZV9yZXNldC5jDQo+IGIvdGVz
dHMvYW1kZ3B1L2FtZF9xdWV1ZV9yZXNldC5jIGluZGV4IDBlMjM0NzY0MC4uZjk4NGMzMzI2IDEw
MDY0NA0KPiAtLS0gYS90ZXN0cy9hbWRncHUvYW1kX3F1ZXVlX3Jlc2V0LmMNCj4gKysrIGIvdGVz
dHMvYW1kZ3B1L2FtZF9xdWV1ZV9yZXNldC5jDQo+IEBAIC00OTksMTggKzQ5OSwxMiBAQCBzdGF0
aWMgYm9vbA0KPiAgaXNfcXVldWVfcmVzZXRfdGVzdHNfZW5hYmxlKGNvbnN0IHN0cnVjdCBhbWRn
cHVfZ3B1X2luZm8gKmdwdV9pbmZvLA0KPiB1aW50MzJfdCB2ZXJzaW9uKSAgew0KPiAgICAgICBi
b29sIGVuYWJsZSA9IHRydWU7DQo+IC0gICAgIGNvbnN0IGNoYXIgKnBsYXRmb3JtX25hbWU7DQo+
DQo+ICAgICAgIGlmICh2ZXJzaW9uIDwgOSkNCj4gICAgICAgICAgICAgICBlbmFibGUgPSBmYWxz
ZTsNCj4NCj4gLSAgICAgaWYgKGVuYWJsZSAmJiBhbWRfaXNfbG9ja2RlcF9lbmFibGVkKCkgJiYN
Cj4gLSAgICAgICAgICAgICBhbWRfcGxhdGZvcm1fZ2V0X29wcygpLT5nZXRfcGxhdGZvcm1fbmFt
ZSkgew0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFtZF9wbGF0Zm9y
bV9nZXRfb3BzKCktDQo+ID5nZXRfcGxhdGZvcm1fbmFtZShncHVfaW5mbyk7DQo+IC0gICAgICAg
ICAgICAgICAgICAgICBpZiAoIXN0cmNtcChwbGF0Zm9ybV9uYW1lLCAibmF2aTEwIikgfHwNCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIXN0cmNtcChwbGF0Zm9ybV9uYW1lLCAidmVn
YTIwIikpDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuYWJsZSA9IGZhbHNlOw0K
PiAtICAgICB9DQo+ICsgICAgIGlmIChlbmFibGUgJiYgYW1kX2lzX2xvY2tkZXBfZW5hYmxlZCgp
KQ0KPiArICAgICAgICAgICAgICAgICAgICAgZW5hYmxlID0gZmFsc2U7DQo+DQo+ICAgICAgIHJl
dHVybiBlbmFibGU7DQo+ICB9DQo+IC0tDQo+IDIuNTUuMA0KDQo=
