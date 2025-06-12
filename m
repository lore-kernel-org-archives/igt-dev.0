Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8642EC71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 05:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173D810E09D;
	Thu, 12 Jun 2025 05:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ranfhsJv";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C1610E188
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 05:08:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rhpv5OUwkh9UTH83eFHJnPbPj5rSvJyBF30ByS2TdgOSyWuWbeLkIvxkfkqbI34cdoWFj2m0ajd0XripQWfoKczwB840Auy6E7HRhfA0E8KnWfYAdCXax/hCjhHayUU7cMkL+jvFtRxoM+mD9+HMlbCG0IW3x6XRRtBYSfjy+pw9aGAei+4dTfgnuVTweuJX85HzUYMLW56oS9a9EtaKI5usmjPmUkRp7f96T6JlJlwVcF/SOL7AyuHX8Canv0cS1ngoHryeRp7swlH3/KxVQ9YhmuiuBkLjO+esKNYNyVeYBfWfTATUE96QpT88CJ9YA8KWxKIVSbXsuuVxzWFMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pO53+f7tu1DWLM0JT6M2W8tlfdTVbgJu1NSp7ZEENpE=;
 b=WWZEKAe7xWIH1UY446iDC6Dq7rFlrDKOa/l56wl8t6ecIk9VZS12gje/KFTYSQtqy/3lLHKXncxNh7XAXGKqbimy2YQ5AmkHmWq+/5JpRwvrMREVUi4v3Liilnk0OcTFCzLN4RgYdZwu3ApaLreVAwuIdhwbxuQKlJYD2sWBhmO4gRnTmKZdJEuqBMCQmsA4mFxrF+AQrTItYanzomyuPy4oRUyxlgvnhR/CvavOwCpJFlf9drAFVWypOQUc7VeGh3y7pkDfn0+VS4j+6F7/+H3UV/S1CnPpbLqsFsgzViitb1R+QBRhRXLF00zuwInAn6EOpDDlQzbfrWkdmf35zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO53+f7tu1DWLM0JT6M2W8tlfdTVbgJu1NSp7ZEENpE=;
 b=ranfhsJvbLagmVA1XZgPj2ZjfRWyrJGwHWtj4z8ir10UATgVj5SQaJhSr4ZFDOhjS78RQt1jgicWVjRXVWNOTTI8613ZwMVwGO5ZN4LYhApcGs+3t8bGXmfxrxD2zC7myfgiAVRjtRNyEr9/qxhq8M475tVGlmjcTpR5n6oMRQI=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SJ1PR12MB6315.namprd12.prod.outlook.com (2603:10b6:a03:456::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 12 Jun
 2025 05:08:15 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 05:08:14 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v3] tests/amdgpu: Fix compilation warnings for USERQ
Thread-Topic: [PATCH i-g-t v3] tests/amdgpu: Fix compilation warnings for USERQ
Thread-Index: AQHb2xdQ88e4b8J32EqxiyjqDlQXYbP+k6CAgABl/bA=
Date: Thu, 12 Jun 2025 05:08:14 +0000
Message-ID: <BL1PR12MB57533782450275A0F38C58659374A@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250611212500.1940399-1-kamil.konieczny@linux.intel.com>
 <e62158f8-c6ae-4fdc-94d4-b6ee760a63bf@amd.com>
In-Reply-To: <e62158f8-c6ae-4fdc-94d4-b6ee760a63bf@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-12T05:07:30.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|SJ1PR12MB6315:EE_
x-ms-office365-filtering-correlation-id: a96697c8-3971-43ac-e58b-08dda96f22d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TFArNkEwQ1Z1aGF4YUY0QTBhMlRoQ0ZndnZ6b3MvUDQ0SzBZOFpUenN3dHZu?=
 =?utf-8?B?dHNET3B3NEpDQ3p2anJXemxTdUcrMndJbkM0WVZ5a3l1VTkwcTVDYlptaTNQ?=
 =?utf-8?B?YUpTM3l4L3NET1lDb1BNSHd4Y3U5VGNLczV4alZzOE1ZUWsyVWJZOEloYzhx?=
 =?utf-8?B?cTIwK24ySC8ycmM5NUpEdXNOWkE1Tmt2ZVBweDZKWFZNL0pnaDNYMHgxbUJ0?=
 =?utf-8?B?NFVhWmE4aFpRVjQrdGxWc2VEZ29uVTV1RU01ZGxoSVJiTWExdkhhZE4rU01s?=
 =?utf-8?B?NGgxNUZMNDhZNUF1MzBmbEUwRk5iTEduSG1ORWdmOHorWXRWY0RuVjU3Q1lZ?=
 =?utf-8?B?dE1XMzZINGlMc1YvbXdhQ2d4VFVVbXNqd2cyb0tYUmJuY05uNVlUbzNnaWtp?=
 =?utf-8?B?dkRYRkFkZVVCYXFKR0hYVjRVaXduU1F5M3UwdkdBS25mbmdDRXlJazdxTjkx?=
 =?utf-8?B?a1BwSUx5TGt2SEVvUjdPRFBjMFFTaVM0SHUrNm8wUy9Od1NERWZ0bWoyZjA1?=
 =?utf-8?B?bXNUWkVDSnYzK2E4NFBEeTNhajdHM2syUjBjSW5nMkM5MmlyZW0rd2xQdUFT?=
 =?utf-8?B?R3QzQnBFYmZ5NFZoRm5VTFE3bnZhSGo4T2tUb2ZJWEVVRzhuSHJjTHBDTkV2?=
 =?utf-8?B?aXZtYzRJTncvWnFwRUdFT3hiT3pHYzhPWDMvdVh3ejAwTExZek1lRVVVam9D?=
 =?utf-8?B?YjcwbjNiaU9YS21OVGREMWtZbDkydkxyaGVTUUFzZWdzcWUyRVZ1ZkxxS2p1?=
 =?utf-8?B?eGJ4RzVGY2VsV1AwM2Mwai96KzFTd25VR1FGS3F6WWxiVHRRbzQvWjFFNlhP?=
 =?utf-8?B?WXU3NDkyMWdzdkhDUHRlaUFNV3pKbXh4bnN2K2ZwQ0g5c0M2U0FJKzREemRR?=
 =?utf-8?B?WmFQWHBtTmlsZEtrVG95cHYzUU0xK0dQN245RE5tWmdSOUlDbWNORFUzZFRK?=
 =?utf-8?B?dnNiYS9xVFVOenl6QXFTTFBCWHFoS2V0S2prNXpRZEZyelZhZFB6UkpmYjhR?=
 =?utf-8?B?RzM4K2o3a0pHeUxYYk1uWmUzRGlqeExPU042cldJUGRBRU9uZk5tRVgvd3F0?=
 =?utf-8?B?c0x2cVpHVy9YdGJQMFc5aXY3Tmcyb1F3QjFMa2NUWnNPZmorT2EvZFIvZTkr?=
 =?utf-8?B?ZXE5RmJZL29tT2VkUHdaRytFUDBpYytVUWREYlZVbVc2RnA4dmxRQmpOQW5P?=
 =?utf-8?B?Um9wVW5mRXpwNnBOeUY3di9YN0pBbHVZN0RlR0d6MU9IbmdOd1FDek1FLyta?=
 =?utf-8?B?TC9CVVJITGkzL3FEbkVlWXNvcnc1ekZjSzlQeWs2L2oyQnU2TGpwOVVuaytj?=
 =?utf-8?B?VHp3UlBiNmVpU3haVUM4SUFEM2RKdktMQTJKMFdmZHRuSXRzVG15WHB4K0dF?=
 =?utf-8?B?TXlhNEF0YXFOSkZwakU3dGxaOE1lVUZSUG9Xdzluc09uajRMWWF6RWVIQWVm?=
 =?utf-8?B?T01PMDIwamRVUDA0R1grelZxVlRGdHFIZEZGWnJhVkk0cUw3TTVmY0tuMStX?=
 =?utf-8?B?TE5mOWdZUTJpQ2hvUUhUQmpsT3lKT25iVG10WlYxWVBmNlZTYlY2REVCM25D?=
 =?utf-8?B?Q0tDQjNpWnJGaEVGMllvY3JzMnphSGZ3bzY4N01GeXZveXlCMitHR3lFa2xB?=
 =?utf-8?B?V3ZyRXFoTG1tbGJKaUkyNGZBNTZDRUpXeVZONXhvTExNMjdha1hZL0crdmhC?=
 =?utf-8?B?c24xdWJPSEhMbFpzK3cwalJzOE00cUpndlp3VUlxNGxxMEE1RHVoVlJldG42?=
 =?utf-8?B?VEVWblVXdnVidHFGY3F6clFHdkorcEErOUJvek83YVFhTkx6a1hzQnhPU1A4?=
 =?utf-8?B?WlRBbnBMUlVHNVc4UkJjSlNnZmp0ZVROdnA3UC9NVi8yNGdwS3NVQ0YxMGRk?=
 =?utf-8?B?Kys2VXdsbC94TjNsR2NGTkgvbUdMQWJDQm80Z3NVREpKMHVEOU9JbldSZVpy?=
 =?utf-8?B?MTZvY3UvMXZRRm8vTkdxZlh0VU9iU1BUNlZ0MmhtWVJTRjZiWVp1WWFmOW5q?=
 =?utf-8?B?VGt0L3MxcnNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVhhTHNvS0I2ZDNxbjhWSXBTVmRiZGZiMnpXSnZrckphM0NONGJsQk14alBs?=
 =?utf-8?B?Y2FxUDdDWG42bUptcWI3NUNCQTJ4ZmlaQ2ptUmx5V0JlRzc2OG9LelYraHI0?=
 =?utf-8?B?eHdQMXpsSzRKZG9FNzRHSEN5L1h3RVZlaDRlVDRxZ0dXQjJHU3cvS2FZVjN2?=
 =?utf-8?B?U3lOeHV2VjlhRHZjZ2JRK0dCSmVhZVBlWHhveDRXY2R6WktXNm9teVVNM0NY?=
 =?utf-8?B?ckFTRkRWcmc4N2duTGZyVHFRR09OYmtpbmpZZjcyUGFZRHlOVm1PK0FlL0hv?=
 =?utf-8?B?T2p6Q29lRC9HNnJ6Tjg1OFV2MFNtMnNDNXFWU1c5RWZqRFhoOWZidjhzU25r?=
 =?utf-8?B?YUdiZzl0UFZsN1VwOW8vQnkvek5Jc0NiK1U5LzFtcmVMSkgxdFo2VXlxQ3Fo?=
 =?utf-8?B?K3loSUY1U3dlSTFkM3dyT2NDaVBna1FIMWR1YlhXNi9WeGJkQ2VRRkZza25H?=
 =?utf-8?B?NzZudFpHbFFLazh3NlkxUHhnWHhBQkNXTXRpbFVROEJXZnN5Z2h6MDJmTjk0?=
 =?utf-8?B?MytaWU9OWjQ1Wkg0c1o0c2xuNnBsK1dQQjJSd25heGc1d0phWlFZbCt3T2kw?=
 =?utf-8?B?UXlaZFV6VXFIaFV2a1FRL1gxWGJjV1E4dHIraDJWS1lSd1VOTTI0dkhhdGJE?=
 =?utf-8?B?dU9UbENlNUc4M3hSSFZjUHhaZXpwN213MmRsd2hUR0k2Qytxa3ZvaStUVk5k?=
 =?utf-8?B?NUY5aVNkeDVBaXNKMnc2aEpiUUNEdDhCUXBnSCtMVEFVMmh0VU9BOFBCY2FZ?=
 =?utf-8?B?cjVZUzVnZFBXSVlxcGFCN1pSb0tHTUtLVW1vVUU4a0dROWpyNGRpM3UrU21E?=
 =?utf-8?B?L0FNR3BhMkYraVh6NlpWWXFYclVZaUdpTHFJNjFvaUUvcEExQ0NCM0hPUm04?=
 =?utf-8?B?cG9PRFFhUkxNRG1qcUh3c05heUd4RnkwSWtNbWZkajR3NW1ITFBRUWg1RmE1?=
 =?utf-8?B?RzBDOGREdDVGTk5tMGd3ZmF2Q2E3STZVN0FEczZFbjZvWGQyNTMvNmVhNk1T?=
 =?utf-8?B?Tkc3WmN5dGF0TGFsbUZZYStSVU1ranllNnhOaEhVVzU2bmFodVVudFhkL0R1?=
 =?utf-8?B?OFI3M3pWUXl6K0V4Z1E3VHpZbEE5K2djZjJwRTBnRWUyUC9JcEdEcG9qb25Z?=
 =?utf-8?B?Kzl0QmZsY21PU0VqTWVER0FXWFNLTlpKQzhjT3hIMTVydjNVTGZKTThIZUNQ?=
 =?utf-8?B?YVhaYUFLcTJmaE93WGFaY3VubkxIU2h4K0hjYU9leC9wb2J3TGtnRG8vUWtI?=
 =?utf-8?B?bUQ3d2JsbncwSWZUczh0TndOSHlBYWVpZWRXVEIyRFhsR0dQNElWbEJvdEho?=
 =?utf-8?B?QnNsQ0E0QzR1RlpEUWFseGFLcnFjcnhxUUZVZUhGeFArK3YyM3FVdWdwQXJV?=
 =?utf-8?B?OTcvRlRPVTdCY3NmSlBuSCtOVTZJc1c4ZHRlT09oRHdFdHBJRmFac29Cdy9M?=
 =?utf-8?B?a21IUThzRmMwQ2E3R3UzN0VqTVZEKzNUR01sbGRJZzZ3ZkVrVWIwdDh5OWNV?=
 =?utf-8?B?aGlXYkJBSTVQZ3RhU3hPS0liOWRLcUhWeHE3aG5sUVd3SmhkVmNKVU1PUVJY?=
 =?utf-8?B?WEhraDdOR0d0azZCZjRpYXY5RmlGSFJrNURFRG1nSm13YVZOQUw5UkxCSThR?=
 =?utf-8?B?U0U1eUtBNzZmVmk1eVp0UE1EUjdaK3ZnVkhoaEVVN2tXRGdtTlEvcW5NNVJn?=
 =?utf-8?B?SGtqSi9ZS2ZPajRMMXdBK0xYWWJGWlZhY0phTytkdy9aTmZhK0dmaHNsUzV4?=
 =?utf-8?B?RDYvaVR4T2hHdUVBbEpYWXQzd0tOQWdxQ2x1ZUVPM0tpUTNrRSs2UUZ3b3Zs?=
 =?utf-8?B?dDhiWklXd3EvRVpYNlBLWS9vZzIxL1VZWldpQ0RteU4wSklNTTZzR2NDQnBr?=
 =?utf-8?B?K1d0bzNYWFZsaERmZHpRS2s4bm9RL0dIV3lrdFNmemhGdVZpNzdKcnhmSjBJ?=
 =?utf-8?B?U3hKWVZ0aGtUK1RZeFNqMFZqUnBTaGVpMmNlUVhIZCtHcVU4c0haa3BqVVdw?=
 =?utf-8?B?ZFZLaHlMTU91eTZqV2ljNG5xZTNZbUJpYTBJZmUyN1dEcmZ3d3piSGhDYXlz?=
 =?utf-8?B?YlJJcUhrVEt5aUJJd084Q1U1d0lKbVZ2eld3amhETzl3L3l4eFVYc25aZ25o?=
 =?utf-8?Q?fyq0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96697c8-3971-43ac-e58b-08dda96f22d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 05:08:14.6688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B+jw6vIZAKUS4QQYU/QpRSnNvegEtLN089zLVcYlJs6P4erDUd+pPGvuicN65wdJH8FGN+3bJRSM6fRClOqlmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6315
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
Cg0KVGhpcyBsb29rcyBnb29kLg0KUmV2aWV3ZWQtYnk6IFN1bmlsIEtoYXRyaSA8c3VuaWwua2hh
dHJpQGFtZC5jb20+DQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFByb3N5
YWssIFZpdGFseSA8Vml0YWx5LlByb3N5YWtAYW1kLmNvbT4NClNlbnQ6IFRodXJzZGF5LCBKdW5l
IDEyLCAyMDI1IDQ6MzIgQU0NClRvOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBs
aW51eC5pbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEtoYXRy
aSwgU3VuaWwgPFN1bmlsLktoYXRyaUBhbWQuY29tPjsgUHJvc3lhaywgVml0YWx5IDxWaXRhbHku
UHJvc3lha0BhbWQuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2M10gdGVzdHMvYW1k
Z3B1OiBGaXggY29tcGlsYXRpb24gd2FybmluZ3MgZm9yIFVTRVJRDQoNCkhpIEthbWlsLA0KDQoN
ClNvcnJ5IEkgbWlzc2VkIHRob3NlIHdhcm5pbmdzIGFuZCBhY2NpZGVudGFsbHkgbWVyZ2VkIHRo
ZW0g4oCUIG15IG1pc3Rha2UuDQpZb3VyIGNoYW5nZSBsb29rcyBncmVhdCB0byBtZS4gVGhhbmtz
IGZvciB0YWtpbmcgY2FyZSBvZiBpdCENCg0KSSBob3BlIFN1bmlsIHdpbGwgYWxzbyBhZ3JlZSB3
aXRoIHlvdXIgcHJvcG9zYWwuIEnigJltIHBsYW5uaW5nIHRvIG1lcmdlIGl0IHRvbW9ycm93IOKA
lCB1bmxlc3MgeW914oCZZCBwcmVmZXIgdG8gZG8gaXQgeW91cnNlbGY/DQoNClJldmlld2VkLWJ5
IFZpdGFseSBQcm9zeWFrICx2aXRhbHkucHJvc3lha0BhbWQuY29tPg0KDQpPbiAyMDI1LTA2LTEx
IDE3OjI1LCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6DQo+IFJlY2VudCBjaGFuZ2UgYnJpbmdzIGNv
bXBpbGF0aW9uIHdhcm5pbmdzIHdoZW4gQU1ER1BVX1VTRVJRX0VOQUJMRUQNCj4gd2FzIG5vdCBk
ZWZpbmVkLCBmb3IgZXhhbXBsZToNCj4NCj4gLi4vdGVzdHMvYW1kZ3B1L2FtZF9zZWN1cml0eS5j
OiBJbiBmdW5jdGlvbiAnX19pZ3RfdW5pcXVlX19fX3JlYWxfbWFpbjMxMSc6DQo+IC4uL3Rlc3Rz
L2FtZGdwdS9hbWRfc2VjdXJpdHkuYzozMTk6MTQ6IHdhcm5pbmc6IHZhcmlhYmxlICdlbmFibGVf
dGVzdCcgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0NCj4gICAz
MTkgfCAgICAgICAgIGJvb2wgZW5hYmxlX3Rlc3QgPSBmYWxzZTsNCj4NCj4gRml4IHRoaXMuDQo+
DQo+IHYyOiByZW1vdmVkIGFkZGl0aW9uYWwgdmFycyBhbmQgcHJpbnRzIChTdW5pbCkNCj4gdjM6
IGNvcnJlY3RpbmcgZGVzY3JpcHRpb24sIG1vdmVkIHZhciBzZXR0aW5nIGJhY2sgKEthbWlsKQ0K
Pg0KPiBDYzogU3VuaWwgS2hhdHJpIDxzdW5pbC5raGF0cmlAYW1kLmNvbT4NCj4gQ2M6IFZpdGFs
eSBQcm9zeWFrIDx2aXRhbHkucHJvc3lha0BhbWQuY29tPg0KPiBGaXhlczogZGFkNGIyYmI5ZTVh
ICgidGVzdHMvYW1kZ3B1OiBhZGQgZW52aXJvbm1lbnQgdmFyaWFibGUgdG8gZW5hYmxlDQo+IHRl
c3RzIikNCj4gU2lnbmVkLW9mZi1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlA
bGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2FtZGdwdS9hbWRfY3Nfbm9wLmMgICB8
IDIgKysNCj4gIHRlc3RzL2FtZGdwdS9hbWRfZGVhZGxvY2suYyB8IDIgKysNCj4gIHRlc3RzL2Ft
ZGdwdS9hbWRfc2VjdXJpdHkuYyB8IDIgKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS90ZXN0cy9hbWRncHUvYW1kX2NzX25vcC5jIGIvdGVz
dHMvYW1kZ3B1L2FtZF9jc19ub3AuYw0KPiBpbmRleCA2NDQwMTZkNWQuLmM0MDZmMmZjNSAxMDA2
NDQNCj4gLS0tIGEvdGVzdHMvYW1kZ3B1L2FtZF9jc19ub3AuYw0KPiArKysgYi90ZXN0cy9hbWRn
cHUvYW1kX2NzX25vcC5jDQo+IEBAIC0xNzEsMTAgKzE3MSwxMiBAQCBpZ3RfbWFpbg0KPiAgICAg
ICBpbnQgZmQgPSAtMTsNCj4gICAgICAgYm9vbCBhcnJfY2FwW0FNRF9JUF9NQVhdID0gezB9Ow0K
PiAgICAgICBib29sIHVzZXJxX2Fycl9jYXBbQU1EX0lQX01BWF0gPSB7MH07DQo+ICsjaWZkZWYg
QU1ER1BVX1VTRVJRX0VOQUJMRUQNCj4gICAgICAgYm9vbCBlbmFibGVfdGVzdDsNCj4gICAgICAg
Y29uc3QgY2hhciAqZW52ID0gZ2V0ZW52KCJBTURHUFVfRElTQUJMRV9VU0VSUVRFU1QiKTsNCj4N
Cj4gICAgICAgZW5hYmxlX3Rlc3QgPSBlbnYgJiYgYXRvaShlbnYpOw0KPiArI2VuZGlmDQo+DQo+
ICAgICAgIGlndF9maXh0dXJlIHsNCj4gICAgICAgICAgICAgICB1aW50MzJfdCBtYWpvciwgbWlu
b3I7DQo+IGRpZmYgLS1naXQgYS90ZXN0cy9hbWRncHUvYW1kX2RlYWRsb2NrLmMgYi90ZXN0cy9h
bWRncHUvYW1kX2RlYWRsb2NrLmMNCj4gaW5kZXggNDVhODY0ZmViLi4yMzMwYjI5NTUgMTAwNjQ0
DQo+IC0tLSBhL3Rlc3RzL2FtZGdwdS9hbWRfZGVhZGxvY2suYw0KPiArKysgYi90ZXN0cy9hbWRn
cHUvYW1kX2RlYWRsb2NrLmMNCj4gQEAgLTQzLDEwICs0MywxMiBAQCBpZ3RfbWFpbg0KPiAgICAg
ICBib29sIGFycl9jYXBbQU1EX0lQX01BWF0gPSB7MH07DQo+ICAgICAgIGJvb2wgdXNlcnFfYXJy
X2NhcFtBTURfSVBfTUFYXSA9IHswfTsNCj4gICAgICAgc3RydWN0IHBjaV9hZGRyIHBjaTsNCj4g
KyNpZmRlZiBBTURHUFVfVVNFUlFfRU5BQkxFRA0KPiAgICAgICBib29sIGVuYWJsZV90ZXN0ID0g
ZmFsc2U7DQo+ICAgICAgIGNvbnN0IGNoYXIgKmVudiA9IGdldGVudigiQU1ER1BVX0RJU0FCTEVf
VVNFUlFURVNUIik7DQo+DQo+ICAgICAgIGVuYWJsZV90ZXN0ID0gZW52ICYmIGF0b2koZW52KTsN
Cj4gKyNlbmRpZg0KPg0KPiAgICAgICBpZ3RfZml4dHVyZSB7DQo+ICAgICAgICAgICAgICAgdWlu
dDMyX3QgbWFqb3IsIG1pbm9yOw0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvYW1kZ3B1L2FtZF9zZWN1
cml0eS5jIGIvdGVzdHMvYW1kZ3B1L2FtZF9zZWN1cml0eS5jDQo+IGluZGV4IDQ1YmQ3ZTc3MS4u
NGYzOGVlMDRlIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9hbWRncHUvYW1kX3NlY3VyaXR5LmMNCj4g
KysrIGIvdGVzdHMvYW1kZ3B1L2FtZF9zZWN1cml0eS5jDQo+IEBAIC0zMTYsMTAgKzMxNiwxMiBA
QCBpZ3RfbWFpbg0KPiAgICAgICBpbnQgciwgZmQgPSAtMTsNCj4gICAgICAgYm9vbCBpc19zZWN1
cmUgPSB0cnVlOw0KPiAgICAgICBib29sIHVzZXJxX2Fycl9jYXBbQU1EX0lQX01BWF0gPSB7MH07
DQo+ICsjaWZkZWYgQU1ER1BVX1VTRVJRX0VOQUJMRUQNCj4gICAgICAgYm9vbCBlbmFibGVfdGVz
dCA9IGZhbHNlOw0KPiAgICAgICBjb25zdCBjaGFyICplbnYgPSBnZXRlbnYoIkFNREdQVV9ESVNB
QkxFX1VTRVJRVEVTVCIpOw0KPg0KPiAgICAgICBlbmFibGVfdGVzdCA9IGVudiAmJiBhdG9pKGVu
dik7DQo+ICsjZW5kaWYNCj4NCj4gICAgICAgaWd0X2ZpeHR1cmUgew0KPiAgICAgICAgICAgICAg
IHVpbnQzMl90IG1ham9yLCBtaW5vcjsNCg==
