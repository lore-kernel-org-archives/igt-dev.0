Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA94C52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 07:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B2B89D39;
	Tue, 27 Aug 2024 07:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rJ+8WO9r";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0504689D39
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 07:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DP6D+9lwnS9qgQuaMUy9gvsgqyPu5foDBBR3LQDq5qy4uTMShMX6HnCzArZ4NUl2U2D6AEFFkb+rLlNTb6BatDc9B9XRI5L884tdUPEPHBMepOa7HGppLyxjAdxy+d4Fl4jJVF0bwo/o03YGEuKBap1sxJNzmQNl4Z2psEysXP4b4uKw6ElWH/EXOn2cyfyqPvEv0THy4fBC5xCtLClVm7IF9zhGJ73iXkg3P9e0ksUYY7pPgTfOMrnDEN9cqgM6SEihZHbHTWd21P44XPNhbOlMNvCGViYuju9OIUu6/Lmy8MCOh6Q2tjHMdTArCjyOT7W3sgOn/lbCq6XXpBauxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjQ6VwZQZHs2aaEnyJwxI6NA6U/GFdC0Q3QVqIHpfng=;
 b=Hhz7d90jC0+/pwpXmDcgDOtd9V9QGbIQk/nSKKsdu1n6SPZRWxMyI0mkvItY9/rpl56uxVdLtodrGWcpy3kZGu0urINu2q+UkmWfmlNk/b1ygRFE3YHwuWVU1Ym7wdAtoUHGtVxW+V8SUMw5eiUZUtD4TvYI/O/VfRgfCHYfVQz8FL5lkifdFieN9kHxNAITzxiudhGFctBbFKpajQewTJVT6VmSoiH9zxVTGDDXj9KYRFh2qDMDrydLxJunmkGssQZXeiosSZ8xmRP4tc/b5xtEg8XhdeU+OsRJLUVn6JfYlVtElNQ8HymzV8RoJPMVqbaMPPGNSQJ4m96Q/8KyKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjQ6VwZQZHs2aaEnyJwxI6NA6U/GFdC0Q3QVqIHpfng=;
 b=rJ+8WO9rjCMfe2pu3NCx13/mNdrroM4jkW6r2ALNFtKaJDaya5OF9KcQZa1LlO0N5/IcJJRohhPiHsrl8R0f3GL5n811+Y09C91X42mJ0LhR4EFiHNff+XXovKuPbvMtqqNPgGOxnLRBzogjLkukim/CMDa0C4QgPf6LVUNE3wE=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 07:54:16 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%6]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 07:54:16 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH i-g-t] test/amdgpu: fix unknow test issue for amdgpu queue
 test
Thread-Topic: [PATCH i-g-t] test/amdgpu: fix unknow test issue for amdgpu
 queue test
Thread-Index: AQHa+EC2l7DtmZXa8UKNcazP2RdGeLI6s7KAgAAGtoA=
Date: Tue, 27 Aug 2024 07:54:16 +0000
Message-ID: <DM4PR12MB5152CD509AA9B6B9A0B1E7FAE3942@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240827051932.74382-1-jesse.zhang@amd.com>
 <20240827072407.hqiwzgxsmhipdgyd@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240827072407.hqiwzgxsmhipdgyd@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=d4316a8a-b832-479b-a764-d49be82adf55;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-27T07:48:07Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|IA0PR12MB8349:EE_
x-ms-office365-filtering-correlation-id: 0e3f1a14-7c7b-4214-ae72-08dcc66d7333
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y3FpZUdtcnNrVHBYWmtWeFZNUzhDTmVXRncreDArVlRkMG9tKzZnKzNnSWVP?=
 =?utf-8?B?VEVsd0xLM2F4Sk1tT25ndXBYWE1LWWtySUhHeGdLNkp2WEpVVTdzU3Zwb2xn?=
 =?utf-8?B?azZvd2grb1VRamVObEMxTno3d0xJbURrTFIvaVNhZXpHR1R0enVXcUU3VE1y?=
 =?utf-8?B?SHdKSi92MkRlTi9YTHRkc0h4RGcxY1RmVHI4eGJvZHNUUE50eXEzZDRXSzM5?=
 =?utf-8?B?MEZiYTVSM0ZxbE16VmxBNHpqdzBjTi9CcWl2TDRuQVFQTEx4SHd1RlI3dHF4?=
 =?utf-8?B?MTl3Q2dOTHdtOHhxNkk3NVZTclUwb1ZRREk2YnFPRGdkUnlkSUw1Nk9TRkw1?=
 =?utf-8?B?N3dYazRKN2IrNnRFRnNsN0U3Y2Nlb3IyZVFVckZySW4rVURmUk5nNVd6aWUw?=
 =?utf-8?B?VGhxem1qVThpWUhDeGRuWVN2dzRSRmJjR3dDa1UrRCtjOFZjYXpOeXV4L0p3?=
 =?utf-8?B?RmRVTGEzcFpDV0l2aW5TN1d3TXBhZ2RsQUFFUEwzaUUxVmRVWmEzZ3pDVVRE?=
 =?utf-8?B?WUpMNlVwUnd4WGtKbElyN3NkYjFPU1NwcjdNLzh6L2lSdElTNjJ6YkV4RlFv?=
 =?utf-8?B?N28xcFhYZkhtZnhKaWx2V3p5M2IzeUV3ZURBZTBucDh5NjJVcE1sWFZjak5W?=
 =?utf-8?B?T3lFcE5paFlUMTNMdlcyOWpPeU9aNm9qa2NVUEFMQlJVU2Z6L2xQMzhNWjJ0?=
 =?utf-8?B?TmY1bU16Ni80RmlwVFpuaGNwVmVGZExwR3hKaW05RUEvTVcyVGVkQXNWL2J2?=
 =?utf-8?B?b2FYUHUyTzVDMHV1U2hva05jaS83UVdCYURXS3hmVy9JdmxYZVlONU9DWVZK?=
 =?utf-8?B?NURqYzg5Q1hHc0U0cldzSk92YnA0UTBRTkNVcVRFUEF1dFljcjNFUnkxcWsz?=
 =?utf-8?B?TzZJS1dOK1pTN2hDR1h3cnVpWWI1bk0xY1ZGbno4OFZJelNDVnBWbVhVY25T?=
 =?utf-8?B?UkVmU0M1S0ptTkh0QXpiNENlcmdBenRJMTZIVXRGNTlRclpMVFhpSTBscURP?=
 =?utf-8?B?S3FHSmZPUVd3YXpzNG5xN0VYTWk4Y0wrTXhIaE9vVytET05lUHd2c3ZYM21n?=
 =?utf-8?B?NVpmVllkL00wTHNzMUxKZDJSVFFjWUNzRlU3S3hMMEtMNk1oSlYyaWhESVRS?=
 =?utf-8?B?VnNuSU1sTi9jb2hrRkhiakdMVTE0UmttVGVWbTB4MGlLVytaZysyd0NtT3VC?=
 =?utf-8?B?UHBGQmtzbytxNkp3RTQ1bkhMOXpVMVBuVXpZbVlCVHpvdWhPbXN6VHZyc3Ra?=
 =?utf-8?B?NWFNZUFpaUdldHRuT245Y2JtUlZjWGg3b20wV0dTaVFPK2NycWp6QmFHZkRZ?=
 =?utf-8?B?dHRPOGtJNEwzTEVQNVFZUXdWVmYyVHpuQTRGZFAxekxwNElweEc3aUJwcUxN?=
 =?utf-8?B?SVMvbVFtOEJjRUdGME15a2JsSUFNYllQZFI5R2h4MkRyZm5mdlB3WTFQSUhN?=
 =?utf-8?B?YVNPVkdSQk52WU9wRElacjN6K3YyZ1VnTWlQOWk1UXdsdktaaE1wWFgvdmRL?=
 =?utf-8?B?VzZGd3diSnVJSkFCY0kxS3Z2MGFvTGFVbTlEdTNOTk9jSXNtRGJUNncyU05V?=
 =?utf-8?B?TXVTdTVlTzJiNEljUm5KSWNqSXJMaVFvR3hMUkR0dXk5RjFZWXd6ais0bjVZ?=
 =?utf-8?B?VWZScCtuVm13d2dLcE9Tb2RzemRqUHRNRUZnTkJjZG5GM2FkRXJRcGZ2aWhT?=
 =?utf-8?B?bGpmM3IwcWIyVjVpYWVGdHRKZVVlQWFNbGk2MGJPcGJkc2E2S005Q25vNzV4?=
 =?utf-8?B?bHRRV01FeE4zV2JtdHR1enpuSzRMckRHNUZxZytLWnowMzFKUjY3cTVIMXBT?=
 =?utf-8?B?TVJBb3lGenkxckRjUUE1VDh2OTM3THJ5bkJUanJ3bktNZWk2ekxpQmM4NjFl?=
 =?utf-8?B?VVZYcG1Db21ZYW9tUkM2M1g3WlBRQkRGRzV2bGNKRkFJc3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bW5UMXhhVThjQ21obFZuMEtDaXoyVHdER3Z4V0ZpdUZ3bXc2OU4vdXVPeHlU?=
 =?utf-8?B?TWxVK2lZcnFVWWZlYUFzc0xFWVJ2WDBtUWVDUSt0Vm42RVhKZjdlTzNCYVJR?=
 =?utf-8?B?YU9OYlVOaDJ4M09xM2p4TWVudDVnYkNDaVpmKy9YaGU1QUMyRXZQMXBWVWhC?=
 =?utf-8?B?T2s2ZUNxQUsrcUcrMHJuSm9DS2Y3aFREZHRrRGVyTGI0OUFseC8xTG1nTVNP?=
 =?utf-8?B?bHVNQkpTOGR6OE9kQ0oxSlFLd3hrdGFxaktFWjkvMFlLa2RIUkRVUkwxL2F2?=
 =?utf-8?B?SWxSUTV1aUdwd0ZTNXU0Y1oralo3VldGdVAxdVMrUUxYRnl0d0UwckhhVWR2?=
 =?utf-8?B?U2laQXg0MVFSMnozTFVxNkpsVThKN29kbWtRU1gwOCtKU0tBTVdHUE03VGt1?=
 =?utf-8?B?TElCcDN5bTJuRGw5dFIzWW9CeHRmS1N1aXRUc2ZHbmlqS2ZNaFMyakJmS2Vp?=
 =?utf-8?B?NnRSZHlmYnVlUjdmRlA4bHVwRHdZVzBYMmd3OFZ2Wk5UamJGbTE2UkM0Nkg0?=
 =?utf-8?B?OHlJWTl4OGJvTnNBcm5JMXFrSUZOaE5qMU0relJzUUdDRVMyc3prWjhKcVlj?=
 =?utf-8?B?SkYwL0VxcFFLRzVLd0d6cGhQS3MrTlQyc3VXL0lmQzZ6ckpETk9kNm9iTmdS?=
 =?utf-8?B?UGtrZkplTmkyTGx3emxNZkx3MFFKZWZxOXIvQlVqbDh4Zm10RXBzd1p4WGxL?=
 =?utf-8?B?UmgrclBUb0wvL2FRMHloQ1EvdTB1SGEzMGQzTUxnWTJiYUcrUmFoaTJzb04v?=
 =?utf-8?B?QWFXalh6MU9VQkg3ZXFrY3FXdFpkNmhtcWVldnZ2eWNvZ3kxbG14SFp1aHp0?=
 =?utf-8?B?VzdadE9EZ0o1WC9ZQ0NtazhJLzhHV1VVTUR0dE9YK2RBT0FXN1l1TkZOd2RB?=
 =?utf-8?B?a1lJWVpXRnM0RExpYzVBQjZ6R0s0STlzL2ovRm1xQzhIekFyTWVqRGwyUVcz?=
 =?utf-8?B?cmQ3TGNnYVp2V2dkWmxndnAreDVXNFY0YXpMUmtvdVIzRUZCbzk0Smo3bHhv?=
 =?utf-8?B?QnYwbWFqWUNtTEkrQVNsVzRZVkdjRTBIdUI2bFpmSllZU09FZlVNekUyRWJa?=
 =?utf-8?B?cVFlcFVHRGxYNnpvWnFmemFWMlYxKzk3RVdRT1Fqc09mNlhZTVBlTFVJYXI2?=
 =?utf-8?B?dWpEU0NXQTVWSFg1OE03NlVpdlV1b0RKTUtVUG0vYk9ORmp3VWNXTmhQMVY3?=
 =?utf-8?B?aVRrbEoyNkRIV0dlNVQzY1ZwcldFZzlqRk4zbThhcHFUUEhka2Q5ZlNJRzlJ?=
 =?utf-8?B?anU3SnRnSkhQWHgrY3YxVHVXbnBDeGtaVS9XVjVFZ3RnTFp6NWZ2cUd4SlRC?=
 =?utf-8?B?Y1M1ZE5FZmxkaE5wb1JyTlN4TzRESG5NUm9xQXlwZ09IVm8rNENFd2N1T1NB?=
 =?utf-8?B?cU1xZjNoWHJZN0U4K3Bub1JLTmJxUERtMlA4My94QlJickdGSmhUODdxa3Ra?=
 =?utf-8?B?a09USzl3cUZiU1FWSWFzRUtYd2Y1Q1pia2Yxamd5emVhUThqNGhtYWEwdks5?=
 =?utf-8?B?ZGZhZ0w4dTZmYksyZ1RYYzhSK0FyQ2tCbjA5ZWNtYk1ocEhWcnVtVkdKQWEr?=
 =?utf-8?B?eDd2SGNORWlQcGl0djRSNzZoMXREZlc5d283eFlPa1BPQTd2R3NKM2JVWXBR?=
 =?utf-8?B?NlF2Q3pyTHJtTG0zVzA0VGRtM2hlWHlnZWhsRmJ2S1ZBNHlqLzFYNElOVyth?=
 =?utf-8?B?WHVQUExNQWlwUDVVRTh1TDh5emdzVDYrUW9INTdTb3VWSzFvYnZQYVR2TlRj?=
 =?utf-8?B?dExjbS80VWZKWUg0MlUzQ1ovVWlRUURsSjdPVG5BdGtQUEYrbXBuZWxsQk5u?=
 =?utf-8?B?c1lvb25GQzR1MHArU3FxWW5EZWpoZ2xWTjJ0NjRSVHBmMlZwbTQwZnJuL2sx?=
 =?utf-8?B?ZmJaSktyc2dlUmRCUmozaGcvTzFpK29TVEE3SHQ0NDJjRzhObExSY0tmSU5i?=
 =?utf-8?B?eVBBc0t2UjhnQ0Y1VXVJVVJKTUtqVmdMMWsvQnBGWFBEUXd5WVhUUW82SUtw?=
 =?utf-8?B?M2thN1VTNFMxMUNPRVZ0b3NoVnJIK1FxVVBkUThwaTJLdlJoaXUwdHdwOWph?=
 =?utf-8?B?OHUxR0dTeHY2N1l3ZkVsNGdZRWNvZi9oWjBWSVcxZUtTZmRwdFpjUWxUbXVr?=
 =?utf-8?Q?UDQs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3f1a14-7c7b-4214-ae72-08dcc66d7333
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 07:54:16.6235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3/XiSnsxlkr0nv/AJ3GQon/46/unHCbd2aOlCWZf03RUvm6ypBFvKQcRD+CwFI+uq+zcXExqCPXq/vgfRxFDKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349
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
Cg0KSGkgS2FtaWwNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtv
bmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NClNlbnQ6IFR1ZXNkYXks
IEF1Z3VzdCAyNywgMjAyNCAzOjI0IFBNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCkNjOiBaaGFuZywgSmVzc2UoSmllKSA8SmVzc2UuWmhhbmdAYW1kLmNvbT47IFByb3N5YWss
IFZpdGFseSA8Vml0YWx5LlByb3N5YWtAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxl
eGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29l
bmlnQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGktZy10XSB0ZXN0L2FtZGdwdTogZml4
IHVua25vdyB0ZXN0IGlzc3VlIGZvciBhbWRncHUgcXVldWUgdGVzdA0KDQpIaSBKZXNzZS56aGFu
ZywNCk9uIDIwMjQtMDgtMjcgYXQgMTM6MTk6MzIgKzA4MDAsIEplc3NlLnpoYW5nQGFtZC5jb20g
d3JvdGU6DQo+IFF1ZXVlIHJlc2V0IGRvZXMgbm90IGV4aXQgcHJvcGVybHkgd2hlbiBleGVjdXRp
bmcgdW5rbm93biBzdWJ0ZXN0cy4NCj4gQmVjYXVzZSBvdGhlciBwcm9jZXNzZXMgYXJlIHN0aWxs
IGZ1bmN0aW9uaW5nLg0KPg0KPiBJdCBzaG91bGQgZXhpdCB0aGUgb3RoZXIgdGhyZWUgcHJvY2Vz
c2VzICh0ZXN0LCBiYWNrZ3JvdW5kLCBhbmQNCj4gbW9uaXRvcikgZm9yIHRoaXMgY2FzZS4NCj4N
Cj4gQ2M6IFZpdGFseSBQcm9zeWFrIDx2aXRhbHkucHJvc3lha0BhbWQuY29tPg0KPiBDYzogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBDYzogQ2hyaXN0aWFuIEtv
ZW5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKZXNz
ZSBaaGFuZyA8amVzc2UuemhhbmdAYW1kLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9hbWRncHUvYW1k
X3F1ZXVlX3Jlc2V0LmMgfCAxMCArKysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvYW1kZ3B1
L2FtZF9xdWV1ZV9yZXNldC5jDQo+IGIvdGVzdHMvYW1kZ3B1L2FtZF9xdWV1ZV9yZXNldC5jIGlu
ZGV4IDYwMjA4ZTA4NS4uODU0MDhlM2ZmIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9hbWRncHUvYW1k
X3F1ZXVlX3Jlc2V0LmMNCj4gKysrIGIvdGVzdHMvYW1kZ3B1L2FtZF9xdWV1ZV9yZXNldC5jDQo+
IEBAIC03MCw2ICs3MCw3IEBAIHN0cnVjdCBzaG1idWYgew0KPiAgICAgICBpbnQgY291bnQ7DQo+
ICAgICAgIGJvb2wgc3ViX3Rlc3RfY29tcGxldGVkOw0KPiAgICAgICBib29sIHN1Yl90ZXN0X2lz
X3NraXBwZWQ7DQo+ICsgICAgIGJvb2wgc3ViX3Rlc3RfaXNfZXhpc3RlZDsNCj4gICAgICAgdW5z
aWduZWQgaW50IHRlc3RfZmxhZ3M7DQo+ICAgICAgIGludCB0ZXN0X2Vycm9yX2NvZGU7DQo+ICAg
ICAgIGJvb2wgcmVzZXRfY29tcGxldGVkOw0KPiBAQCAtMTQ4LDYgKzE0OSw3IEBAIHNraXBfc3Vi
X3Rlc3Qoc3RydWN0IHNobWJ1ZiAqc2hfbWVtKSAgew0KPiAgICAgICBzZW1fd2FpdCgmc2hfbWVt
LT5zZW1fc3RhdGVfbXV0ZXgpOw0KPiAgICAgICBzaF9tZW0tPnN1Yl90ZXN0X2lzX3NraXBwZWQg
PSB0cnVlOw0KPiArICAgICBzaF9tZW0tPnN1Yl90ZXN0X2lzX2V4aXN0ZWQgPSB0cnVlOw0KPiAg
ICAgICBzZW1fcG9zdCgmc2hfbWVtLT5zZW1fc3RhdGVfbXV0ZXgpOw0KPiAgfQ0KDQpEbyB5b3Ug
cmUtaW1wbGVtZW50IGlndCBpbmZyYT8NCg0KSGkgS2FtaWwNCg0KTm8sIGluIHRoZSBxdWV1ZSBy
ZXNldCB0ZXN0LCB3ZSBzdGFydCB0aHJlZSBwcm9jZXNzZXMgKHRlc3QgcHJvY2VzcywgYmFja2dy
b3VuZCBwcm9jZXNzLCBhbmQgbW9uaXRvcmluZyBwcm9jZXNzKQ0Kd2hlbiBydW5uaW5nIGFueSB0
ZXN0IChpbmNsdWRpbmcgdW5rbm93biB0ZXN0cywgc3VjaCBhcyBzdWNoIGFzOiAgc3VkbyBhbWRf
cXVldWVfcmVzZXQgLS1ydW4tc3VidGVzdCBhbWRncHVfdGVzdHh4eCkuDQoNClRoZSBrbm93biBw
cm9jZXNzIGNhbiBleGl0IHdpdGggdGhlIG90aGVyIHRocmVlIHByb2Nlc3Nlcy4NCg0KVGhlIHVu
a25vd24gcHJvY2VzcyBjYW4gZXhpdCwgYnV0IHRoZSBvdGhlciBwcm9jZXNzZXMgd2lsbCBub3Qg
ZXhpdC4NCg0KVGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWUgb2Ygb3RoZXIgcHJvY2Vzc2VzIGV4
aXRpbmcgaW4gdGhlIHVua25vd24gY2FzZS4NCg0KUmVnYXJkcw0KSmVzc2UNCg0KUmVnYXJkcywN
CkthbWlsDQoNCj4NCj4gQEAgLTMyNyw2ICszMjksNyBAQCBzdGF0aWMgdm9pZCBzZXRfbmV4dF90
ZXN0X3RvX3J1bihzdHJ1Y3Qgc2htYnVmICpzaF9tZW0sIHVuc2lnbmVkIGludCBlcnJvciwNCj4g
ICAgICAgc2hfbWVtLT5nb29kX2pvYi5pcCA9IGlwX2dvb2Q7DQo+ICAgICAgIHNoX21lbS0+Z29v
ZF9qb2IucmluZ19pZCA9IHJpbmdfaWRfZ29vZDsNCj4gICAgICAgc2hfbWVtLT5zdWJfdGVzdF9p
c19za2lwcGVkID0gZmFsc2U7DQo+ICsgICAgIHNoX21lbS0+c3ViX3Rlc3RfaXNfZXhpc3RlZCA9
IHRydWU7DQo+ICAgICAgIHNlbV9wb3N0KCZzaF9tZW0tPnNlbV9zdGF0ZV9tdXRleCk7DQo+DQo+
ICAgICAgIC8vc3luYyBhbmQgd2FpdCBmb3IgY29tcGxldGUNCj4gQEAgLTQwNSw2ICs0MDgsNyBA
QCBzaGFyZWRfbWVtX2NyZWF0ZShzdHJ1Y3Qgc2htYnVmICoqcHBidWYpDQo+ICAgICAgIHNobXAt
PnN1Yl90ZXN0X2NvbXBsZXRlZCA9IGZhbHNlOw0KPiAgICAgICBzaG1wLT5yZXNldF9jb21wbGV0
ZWQgPSBmYWxzZTsNCj4gICAgICAgc2htcC0+c3ViX3Rlc3RfaXNfc2tpcHBlZCA9IGZhbHNlOw0K
PiArICAgICBzaG1wLT5zdWJfdGVzdF9pc19leGlzdGVkID0gZmFsc2U7DQo+DQo+ICAgICAgICpw
cGJ1ZiA9IHNobXA7DQo+ICAgICAgIHJldHVybiBzaG1fZmQ7DQo+IEBAIC0xMTI4LDcgKzExMzIs
NiBAQCBpZ3RfbWFpbg0KPiAgICAgICAgICAgICAgICAgICAgICAgY3JlYXRlX2NvbnRleHRzKGRl
dmljZSwgJmFycl9jb250ZXh0X2hhbmRsZSwgY29uc3RfbnVtX29mX3Rlc3RzKTsNCj4gICAgICAg
ICAgICAgICBlbHNlIGlmIChwcm9jZXNzID09IFBST0NFU1NfQkFDS0dST1VORCkNCj4gICAgICAg
ICAgICAgICAgICAgICAgIGZkX3NobSA9IHNoYXJlZF9tZW1fb3Blbigmc2hfbWVtKTsNCj4gLQ0K
PiAgICAgICAgICAgICAgIGlndF9yZXF1aXJlKGZkX3NobSAhPSAtMSk7DQo+ICAgICAgICAgICAg
ICAgaWd0X3JlcXVpcmUoc2hfbWVtICE9IE5VTEwpOw0KPg0KPiBAQCAtMTEzNiw3ICsxMTM5LDYg
QEAgaWd0X21haW4NCj4gICAgICAgICAgICAgICAgICAgICAgIHByb2Nlc3MsIHNoX21lbSwgY29u
c3RfbnVtX29mX3Rlc3RzLCBpbmZvWzBdLmh3X2lwX3ZlcnNpb25fbWFqb3IsDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAmbW9uaXRvcl9jaGlsZCwgJnRlc3RfY2hpbGQpOw0KPiAgICAgICB9DQo+
IC0NCj4gICAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGlwX3Rlc3RzKTsgaSsr
KSB7DQo+ICAgICAgICAgICAgICAgcmVzZXRfcmluZ3NfbnVtYmVycygmcmluZ19pZF9nb29kLCAm
cmluZ19pZF9iYWQsICZyaW5nX2lkX2pvYl9nb29kLCAmcmluZ19pZF9qb2JfYmFkKTsNCj4gICAg
ICAgICAgICAgICBmb3IgKHN0cnVjdCBkeW5hbWljX3Rlc3QgKml0ID0gJmFycl9lcnJbMF07IGl0
LT5uYW1lOyBpdCsrKSB7IEBADQo+IC0xMTU0LDYgKzExNTYsMTAgQEAgaWd0X21haW4NCj4gICAg
ICAgICAgICAgICAgICAgICAgIH0NCj4gICAgICAgICAgICAgICB9DQo+ICAgICAgIH0NCj4gKw0K
PiArICAgICBpZiAoc2hfbWVtICYmKCAhc2hfbWVtLT5zdWJfdGVzdF9pc19leGlzdGVkKSkNCj4g
KyAgICAgICAgICAgICBzZXRfbmV4dF90ZXN0X3RvX3NraXAoc2hfbWVtKTsNCj4gKw0KPiAgICAg
ICBpZ3RfZml4dHVyZSB7DQo+ICAgICAgICAgICAgICAgaWYgKHByb2Nlc3MgPT0gUFJPQ0VTU19U
RVNUKSB7DQo+ICAgICAgICAgICAgICAgICAgICAgICB3YWl0cGlkKG1vbml0b3JfY2hpbGQsICZt
b25pdG9yRXhpdE1ldGhvZCwgMCk7DQo+IC0tDQo+IDIuMjUuMQ0KPg0K
