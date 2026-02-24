Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756C3EEC2B8
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 01:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D44910E0A9;
	Tue, 24 Feb 2026 01:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WxhRAiKt";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7688210E0A9
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 01:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cV7kYSx0hRbWDwTD+WieL/0NQnpDttgdjxTBEby0lHFGuNwJykuZW0r/9WwS/BStm7uGzvCgabw9yN985G9qtXN0xj092BmNxdhixbFiAymdVg/F4JjtyGnELD8TzUELVFvphUImvgtCCu9IByTUihiUNBytbxT1dSMZRGCF6bCTBNBFnpEeLwzSJs8/VMt/tgK0mQf3KMlLfTJ8xMMnvHnhR2Z+CUPoT0w4c2HFgeqQzvevD5JRYL66BjBWwGoXs+VchhYpfhynzcnUvCqVsr2GaJ34OhrEPLx4ZSwvQwIAtVjhYMUMbFBIeHvIeg+PPYDmN+sHlwUqLpFJjBkvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SI+F1TBMTmEndQbjAQQn8P8Az5HoX9NWHDuXqE8e53Y=;
 b=mOzeknk5//BLVxlapu2BJtPknyOqx6KXLC7E2U1FF1s+P8mCwPlXIm+Vqqb/HtCOnBS0d1x1INdQVJqeU4/cvDtWpCTJJB5PNWp2s55gnDcqfI9Yfk8F/y4Xg5Ni9h0QSr+611b8n0UIzhkQOZVMzGM2hgEgaaRb2cM9ebtFduJoAS1Y0g9rou/dpJi8QJCg58GLE38oDQ4tBKa5E6JvfjY4GT/YNF/dRX/q8QBQk55V9qtbUSdAKmkc/pcyNfDXTvME06lAF3RUeWbqrNToATZ9DkHPVZg6eW6nmnF1G1KSUSnwL9Vc/WnRQLr0aq5G69/fXrHIGg5MdQj0dUk/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SI+F1TBMTmEndQbjAQQn8P8Az5HoX9NWHDuXqE8e53Y=;
 b=WxhRAiKtLS/OU+BEy73WAij2x4a48pDclhAuCFlYfQpumqb+lijyX+OcZeYk78ZYUOcQtqzBiLyEz3JBeDCBAKl/lwrq6R0nufX/jCxIUq5T7tzq4eve2yU4UWVin4z2eeV8KG8zMgDupbT4Iff1XBdMSFcc1D32OPmoGgszr2o=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by MW6PR12MB8661.namprd12.prod.outlook.com (2603:10b6:303:23f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Tue, 24 Feb
 2026 01:38:29 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:38:29 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 3/4] lib/amdgpu: fix SDMA WRITE_LINEAR COUNT field to use
 DWORDs
Thread-Topic: [PATCH 3/4] lib/amdgpu: fix SDMA WRITE_LINEAR COUNT field to use
 DWORDs
Thread-Index: AQHco6Kepa7Ys6+/w0qvbWhddnbBZ7WRFFiQ
Date: Tue, 24 Feb 2026 01:38:29 +0000
Message-ID: <DM4PR12MB51523121F2BE14F5AC84186BE374A@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260222022606.160188-1-vitaly.prosyak@amd.com>
 <20260222022606.160188-3-vitaly.prosyak@amd.com>
In-Reply-To: <20260222022606.160188-3-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-02-24T01:35:07.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|MW6PR12MB8661:EE_
x-ms-office365-filtering-correlation-id: 767ee42e-2cc7-4a87-4c26-08de73456983
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?IQzzSLx/kfQxWk24K/fABnT5Ptlpe+CcyHmq1K5B7fjQbvlxDATsvqnSIh?=
 =?iso-8859-1?Q?EasSRzBWIV6AjSxpTmhj3rG7qk6KCXCEZLXp/OXLqsH8BLxTbdsEo8T0OZ?=
 =?iso-8859-1?Q?aBw8w+qeXq936ErZ+4wCaNA/gFG/L7G3TbH3HLNyN3TQfKARupNumLbCn3?=
 =?iso-8859-1?Q?j78qTFzNfZThgMErDpdhTE9UMtVM5SKiYlGBkaz0WjV+J+7OQ4f6Bq7RiF?=
 =?iso-8859-1?Q?U52sUlOuWgUI3X4dfQwKJNj8pSezpKtQqRm401PaC39eCIBgNxfDUR/W/J?=
 =?iso-8859-1?Q?iYWrt4x76kWAITtNaPfgci2nwgWU8+6uVaq45l3Cq0kG5PB/PaQMZ77Jgt?=
 =?iso-8859-1?Q?vUwEa8Vjdi9MdqUIEIFMhyvoLq86KL6NZceFbc2c49LCHJpkTRG2ASPrKl?=
 =?iso-8859-1?Q?VImbDw0wM0XOUvXGrHYwmGrE/yo/D22PAQKpY8kQTo9D6679XhQwWJkEJ3?=
 =?iso-8859-1?Q?Zm3ftSYG8xPHVEQ9VW9XfWlnOMzyty71HMxCMV5pkNlyEU7TPQJ/RZq/qp?=
 =?iso-8859-1?Q?Bmy4EOmiCzhUxy1p7+yjmU9k80AYTKWhDCFa4Sn7t5PimeyfuAVov4ZpcK?=
 =?iso-8859-1?Q?F+B+KNaE7Yt9lHBvm7Wv0r8sSZF5EYlJ+MRGe79bVsskyijUhSXXSgrlGf?=
 =?iso-8859-1?Q?tq99hFgsQRO2GBLL1V3S4mzUNtbKmSTokUYZ6sy0KG0q4RN0gImrmGdVji?=
 =?iso-8859-1?Q?Hu9fwZmMuVWaI0d7wU4Rj19f9SuPFeQhesBStc0b6uSjJd9qFH+wmSbJ5e?=
 =?iso-8859-1?Q?QbM0iRd6w9sSYMSXuavUsdAF0hVGuPOpn0eIzGaf44dAqNUu67RO05ymsU?=
 =?iso-8859-1?Q?O7/qwzoy9MSt0XGyiKZgqmg69FZ5teoS/mZIpAPofkPbRwaMRtAxSlt1ZU?=
 =?iso-8859-1?Q?GFc6mIWLBoWv1KUGxg7iWjaAtd1Oxx5AtlTuzS7SlLnIT6czVwaCXYtOqx?=
 =?iso-8859-1?Q?vqCvvNDHKrbSXeqSPc+1cOpJGp5WvUVPIv+dWl2hvUkiIPVqOSFrrIpHgY?=
 =?iso-8859-1?Q?otE9wbqRvDyw94lY4MqAQ069oMwoGkn9p8PBJm34Owxj5Ml1hFRc+vVeIR?=
 =?iso-8859-1?Q?nakixhwztq0OFmZx5GQ2Rl1G0C2BD03bs9P5erJwpaYBfIHYzu8sOC61Jx?=
 =?iso-8859-1?Q?St90PznbmiH0fDkXan22QVnh66kHwMsZ8LAwXrUQfAFKSyD8PEap6zWoxd?=
 =?iso-8859-1?Q?IiomAGvxXL44T/ZgdiAw6vPgVkY4MHnlDPYWjr3QfF67vF2ZlCsSl97jcM?=
 =?iso-8859-1?Q?KYEoq+pcZNwV7Xf9hYkJOOu9S5pXukIKptNcUPEmB0468QX1Wl8tqTs+2X?=
 =?iso-8859-1?Q?Lz/sIzKvNfQQZmWsWU4jz6kbsVTTln1gQpo1SSK+j4HHfP+EvTlWBDRq55?=
 =?iso-8859-1?Q?V5zmDfoeDfxTn2XskikXsSks0umMDY/CzrO0fZ/qhAyWSd1Ekb6gf/At2l?=
 =?iso-8859-1?Q?GmGnfk4x9kGvhVRZtDhdOWtZMxCp4gLSKFvIrD0NImFDH/dEHwvgfSH14R?=
 =?iso-8859-1?Q?Z1E9fKAp9jF7cflmgbkG37DnwD9pLKN46BT20r6IlXqc0gb+/5/+60zSkf?=
 =?iso-8859-1?Q?SNIlrkJGowTJbS23s0EzEvpI58CAk2p1qo7tdC8YdzwkvBVJakJTZri/PD?=
 =?iso-8859-1?Q?ttjoQ9DeWo3OcTenghFigDMYvdCSFOb+3mtwSU4W5pSmjzxaHRWT4nnHYv?=
 =?iso-8859-1?Q?o/xQojXxGZv+QEk/TvY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?TdpfwzYOFE/0WUAL4PzwwbbPl0Md6aullkU/Gaf4T8UfA88SQxbEyaN2uf?=
 =?iso-8859-1?Q?uTteYdhwVaOc/mNt6sz5A9yFpBE0zNx3uKx4wOwbyfw37MJ5xkKkEa3kBI?=
 =?iso-8859-1?Q?OAivZ/35Cd/RjwGJ39b6xSyendyM4LKqauo96HGcnwguVRV9YDzl7XRUpQ?=
 =?iso-8859-1?Q?PjNhPY+gUJAMGWIqCtoKDaqIP9FWYReQQWcGXtF6OTzCbZytyHze1jZKzS?=
 =?iso-8859-1?Q?62RQ9/gschMSQCsc4AuCMsLvpRUnYHJ6SV9l6kW5svBzbdN+QbyzL65PDO?=
 =?iso-8859-1?Q?aTZ4RfRx7UxzIuIBw4Rf4KHzJm63sCkaa2HQAWwp1t80PKIa8jgT5K43GU?=
 =?iso-8859-1?Q?xuzArTLNePf66plZqV69ePpjEjkpHLVAeuTiBojYfA6abZFz3oYotbjjz/?=
 =?iso-8859-1?Q?G5UMBLXrEdNIL3ydlpzyA1bDzjdolaBAxCBuFi62LTeDYEn6op9xSdhvc7?=
 =?iso-8859-1?Q?dAp1tqj0n5tsJbiP1KehuDIdONCcJkJYULSfTYtwAS1JkoY5njegrdnVVF?=
 =?iso-8859-1?Q?bLXCghsT0tp/Dr8ZS4Pt9EGvhv2L+OAjhhnHg47E3VvEydJfPD+FjXPQUs?=
 =?iso-8859-1?Q?9zIRqtdN4bCS446hBAw+eIUips5k9oSfhssHdryQ3Sf/aAiqB8Oo8Zxu25?=
 =?iso-8859-1?Q?E2ZbpiDRHc2cEswCtm+d6E1Yv0WYooQiX5ngqlllxbkld9e7UbFo7mvW2a?=
 =?iso-8859-1?Q?ToOWvtlq+Zjnrbp5IWuvrp5J5vbIdsGAZwKsoX1t6VUaIa/GS2YJg/wog/?=
 =?iso-8859-1?Q?SSIG7Nl9ZRIVxF75IfcjTh9dXjaURefmjxO4dVxgBj8YQ6BA59MqT0/psF?=
 =?iso-8859-1?Q?l1H7iosKisWQP40pIEaBSaaWo2fxFt1ag81ryRKuIGb8hCtv0Uw2byrZ7D?=
 =?iso-8859-1?Q?Rw1TSKcVfh+JPE864R9GoKKa7vJcLvzMqAHp6tIKH4cU8/MFDcczBqoLsP?=
 =?iso-8859-1?Q?L8BCAnK1i1G0gsYNIqIvettn+3O9tRZf+3pJ0io9Q5LfY3UTJ02G5SnRWK?=
 =?iso-8859-1?Q?eFFtCmA42KIuEyhk1kuX+Dp1X4ZYCV9HjuOA4b49fxtdQ8LSdouM8M9pcx?=
 =?iso-8859-1?Q?l1pgik0qmwMr44F/L+o25UNQbThyGRM5pNzIrBSjsW/m1nR/Dmm9rq595L?=
 =?iso-8859-1?Q?ahTi1B/R/FZSZgbfS2Y/yJpEy2rWIQwkzdHAE3CiGM7CHDdUoF3eExEKwt?=
 =?iso-8859-1?Q?mj1kQpTlCUG46XPYHhj41Qymz8f31qTgJYzVVZb1YvsEjUerw1bEF/M7zl?=
 =?iso-8859-1?Q?Hx2lCsRB5t9UrN5P1DSPNYyKfD+nWg/1209zDFNulx2wey2e6GockXT6UR?=
 =?iso-8859-1?Q?wfR7S0peIriAdEruGDxVrbDiL0NehMImGjRTC+wEKytj7B98G31VLAm4ZQ?=
 =?iso-8859-1?Q?6Mt2A92UVFUsgPqHe9YcW7MhWn+a8qtrqMBlTtRyceizxVEzAdq+gnA9GC?=
 =?iso-8859-1?Q?vsikcl6QhwQ6yoWxk1K2qA4GSpwHPbcL+T6+x3wKHqtVlTtuPqzezIVKXV?=
 =?iso-8859-1?Q?vccSEiIX6J9+1ETIdtmLfnmXvk+4ROulRZsWXs/vcan0yasg2OJykKLlU/?=
 =?iso-8859-1?Q?9A3o18FH0lGrDkrqPmQ1nLTNz+iPZ1CSPozeGYtkAZuhO3P+IsDxSMAOCg?=
 =?iso-8859-1?Q?+1wwD2B7zo76VWmT0ZRl2fl20BBxDXqJhhVW+F05ELCPhwsIRvgMo9zjxk?=
 =?iso-8859-1?Q?dGqVUgTseV8tsWfYU47k6gRhs7Z/rmofsGa6n73qGo4hYXWZdGMzH+dbiq?=
 =?iso-8859-1?Q?9RPqHrrxwPE/RaYc5gTv7kzjr7g+vHm+kNso7imR06E+jh?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767ee42e-2cc7-4a87-4c26-08de73456983
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 01:38:29.2786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7CetsfZZZkJKG9ZckLn6v20QOJDVkFQONsXOt8UB2xfjZSK9cNKhI2Ks8awUWBR3wLusgkEmk2dQfRoXJFIpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8661
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

Series is Reviewed-by: Jesse.zhang@amd.com

> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: Sunday, February 22, 2026 10:24 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> Subject: [PATCH 3/4] lib/amdgpu: fix SDMA WRITE_LINEAR COUNT field to use
> DWORDs
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> The SDMA WRITE_LINEAR packet COUNT field specifies the number of
> DWORDs of inline data (minus 1 for AI+), not bytes. After the write_lengt=
h
> normalization to bytes in the previous patch, the COUNT was incorrectly s=
et to the
> byte value causing the SDMA engine to read past the inline data into garb=
age
> memory, leading to GPU hangs and -63 (ETIME) timeouts (e.g. in
> amdgpu_userptr_test).
>
> Fix by dividing write_length by 4 when setting the COUNT field in
> sdma_ring_write_linear and sdma_ring_bad_write_linear. Also fix the SI (S=
outhern
> Islands) SDMA_PACKET_SI header and the stream_length computation in the
> bad_write_linear error injection path.
>
> Note: SDMA CONST_FILL and COPY_LINEAR COUNT fields are in bytes, so
> those remain unchanged.
>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c |  2 +-
>  lib/amdgpu/amd_ip_blocks.c          | 16 ++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c
> b/lib/amdgpu/amd_command_submission.c
> index 079670d49..699b8ba6a 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -1506,7 +1506,7 @@ get_sdma_max_bytes(amdgpu_device_handle device)
>   * is 14 bits in DWORDs (max 16384 DW =3D 64 KB), but that limit is
>   * handled by pm4 buffer sizing, not by this struct.
>   */
> -#define GFX_CP_DMA_MAX_BYTES   (1ULL << 26)  /* 64 MB, 26-bit byte_count
> */
> +#define GFX_CP_DMA_MAX_BYTES   ((1ULL << 26) - 4)  /* 64 MB, 26-bit
> byte_count, DWORD-aligned */
>
>  /**
>   * get_gfx_cp_dma_max_bytes - return max CP DMA (PACKET3_DMA_DATA)
> transfer size diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip=
_blocks.c
> index 1282154fd..ad8fcd294 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -42,7 +42,7 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *fu=
nc,
>                    (unsigned long)ring_context->write_length);
>       if (func->family_id =3D=3D AMDGPU_FAMILY_SI)
>               ring_context->pm4[i++] =3D
> SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
> -                                      ring_context->write_length);
> +                                      ring_context->write_length / 4);
>       else
>               ring_context->pm4[i++] =3D
> SDMA_PACKET(SDMA_OPCODE_WRITE,
>                                        SDMA_WRITE_SUB_OPCODE_LINEAR,
> @@ -51,9 +51,9 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *fu=
nc,
>       ring_context->pm4[i++] =3D lower_32_bits(ring_context->bo_mc);
>       ring_context->pm4[i++] =3D upper_32_bits(ring_context->bo_mc);
>       if (func->family_id >=3D AMDGPU_FAMILY_AI)
> -             ring_context->pm4[i++] =3D ring_context->write_length - 1;
> +             ring_context->pm4[i++] =3D ring_context->write_length / 4 -=
 1;
>       else
> -             ring_context->pm4[i++] =3D ring_context->write_length;
> +             ring_context->pm4[i++] =3D ring_context->write_length / 4;
>
>       while (j++ < ring_context->write_length / 4)
>               ring_context->pm4[i++] =3D func->deadbeaf; @@ -81,9 +81,9 @=
@
> sdma_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
>       j =3D 0;
>
>       if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
> -             stream_length =3D ring_context->write_length / 16;
> +             stream_length =3D ring_context->write_length / 4 / 16;
>       else
> -             stream_length =3D ring_context->write_length;
> +             stream_length =3D ring_context->write_length / 4;
>
>       if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_OPCODE)
>               opcode =3D 0xf2;
> @@ -92,7 +92,7 @@ sdma_ring_bad_write_linear(const struct amdgpu_ip_funcs
> *func,
>
>       if (func->family_id =3D=3D AMDGPU_FAMILY_SI)
>               ring_context->pm4[i++] =3D SDMA_PACKET_SI(opcode, 0, 0, 0,
> -                                      ring_context->write_length);
> +                                      ring_context->write_length / 4);
>       else
>               ring_context->pm4[i++] =3D SDMA_PACKET(opcode,
>                                        SDMA_WRITE_SUB_OPCODE_LINEAR,
> @@ -108,9 +108,9 @@ sdma_ring_bad_write_linear(const struct
> amdgpu_ip_funcs *func,
>               ring_context->pm4[i++] =3D upper_32_bits(ring_context->bo_m=
c);
>       }
>       if (func->family_id >=3D AMDGPU_FAMILY_AI)
> -             ring_context->pm4[i++] =3D ring_context->write_length - 1;
> +             ring_context->pm4[i++] =3D ring_context->write_length / 4 -=
 1;
>       else
> -             ring_context->pm4[i++] =3D ring_context->write_length;
> +             ring_context->pm4[i++] =3D ring_context->write_length / 4;
>
>       while (j++ < stream_length)
>               ring_context->pm4[i++] =3D func->deadbeaf;
> --
> 2.52.0

