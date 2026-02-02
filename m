Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816C1D172B8
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 02:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C82B10E217;
	Mon,  2 Feb 2026 02:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4QMNkeaL";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011037.outbound.protection.outlook.com [52.101.52.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D05210E217
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 02:46:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sh3bTwvhU+ZkzNmZk74tgAVtXJz8gQolCf6DWBW26xpiVcgCDSh9LUAdXiHe0rG0SjuaTmOu58ajrTa5mwJlhBG+oPYgU8rohdmSoA3JHkSmEhFqWhEI5LHYStiQB572YhP8umthVLvtZ1xhCVtltXCAjpZIDQimXKxJLKbkQ3GwrlRCEBw5lVpvWVW0Nkb5BqFsTSIhTgv1IWzqB/aQAtHMSjXmffX7yCYCICSE4jUjxMT+cHizunb1jaiVxqMymmA0WszwXj5TNpbk8WBiYkW4QDo/+tiMwSRaDq72H15aFlbrtV1fC0EDTAujkQhwpin4sU4FDnlqW3uMZsseiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y15QoDMOI3f8hfE9AK5Tx7aeFhgTRT3NnetBqNHRtSQ=;
 b=QA0tWrQK6lKYitD69oLEJDGjtS0TNHwKM121p/w5khMRpfd2nxBFSq95r0GchKrrjgadGfCUZ5rbUDPUI+lxkIQu0rET4KYfyicNatd1WGuQIo9FhDZnTScXHAIr9vx9erdyg8TEXNgfv2IzvaG5OzGowuYsErul4uhylY6q6PMKjhYZ2/MhPFMVKnOrY/4PhbLylWcssT5Bu2W5iQOUxfVuCkaj7XHKNJRnoh08j7lvR3NmzVSqhPHmXug6MkDqCa/Tspl/+jXTIzw7ZjJkxk0iFGl2m1ZQ5v/j2vdxdyi214DgzK0Hu+xkWJJru3h3l1sqBih7QGxm2EM0qWtg9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y15QoDMOI3f8hfE9AK5Tx7aeFhgTRT3NnetBqNHRtSQ=;
 b=4QMNkeaLZH4JJR7PwNQqXx4Tc4lkTw4k0wwafQn4ad/YwozAUPiN4N5gyYxA5pT0twCqyBxumRcK3C60ohKf3VZCmWcUHJbrV4JNYHcmzsb6p9rLLLcGbPNIBr3NcWe2maeLEJwhtDCUHj3XTMACV7hzneWoPlL/VSueJtKBxuo=
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 02:46:04 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 02:46:04 +0000
From: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH i-g-t] lib/amdgpu: Refactor sched_mask read logic and add
 XCP partition mode support
Thread-Topic: [PATCH i-g-t] lib/amdgpu: Refactor sched_mask read logic and add
 XCP partition mode support
Thread-Index: AQHckcUGhgiXfmJT80Gp14kws9h4lrVut8dd
Date: Mon, 2 Feb 2026 02:46:04 +0000
Message-ID: <PH7PR12MB6420BB80484EE78F0B0855F4819AA@PH7PR12MB6420.namprd12.prod.outlook.com>
References: <20260130084654.4031554-1-Jesse.Zhang@amd.com>
In-Reply-To: <20260130084654.4031554-1-Jesse.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-02-02T02:46:03.474Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=1;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6420:EE_|IA1PR12MB6650:EE_
x-ms-office365-filtering-correlation-id: dc282052-54cb-4358-c11e-08de6205356b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|6049299003|366016|376014|1800799024|38070700021|7053199007|13003099007|8096899003|4053099003|4013099003;
x-microsoft-antispam-message-info: =?us-ascii?Q?fkLSQNiT4DMHhpX1/6z7OAXMI9UTXR10/s2lunPMRJ0GmuikhMGDIS6EYm1X?=
 =?us-ascii?Q?7RyUs2QKgFbHia4Yy6rzE33G7D0K+01YxG+ETUtkCoQHdkvVbqXaDCPU/G1V?=
 =?us-ascii?Q?CtiM11cbU548UpmuGgEUE9fKfIujdfHd+f9aEFkRJP0rcwraGmJ32SzXdarW?=
 =?us-ascii?Q?FSPCANs4leLYqfksMvO3J1tcTXxflHNTqGu6dao4m4d9GWX+iTeRyGRu7Xke?=
 =?us-ascii?Q?pjZ7IWqiY3yMCYBNbJGbPw1tCV0Yd41rtFnSeM6PiphcF/unvJHkaLi1RRvp?=
 =?us-ascii?Q?NhROBmOnu2g7zm+uJau2kdX0MmJ8IAp/gizYarYibb6XobEgqxv/g1qsw9eb?=
 =?us-ascii?Q?xFyV8PEmRiZJmilloCzJF9wXiJrHRxjbNlrav4Y0zppJzhyCbfaWMmRz8Sra?=
 =?us-ascii?Q?WzsGkMJC6F5Ac3OnRV6XRfHSJQ+OBSXVTeFiwB7HeC+MkQUDMn65ROTbjKHO?=
 =?us-ascii?Q?GPDQqZEkqHe8yzIhITEvlk9w/B7eduoQvsANTd5tvFNkmmWp9URG9lp5NI+0?=
 =?us-ascii?Q?xh/7v0YuJkC6IdNDPZhNM8chAs377jRhi5yinpwEdTX04Kd4EqlfD1Heq0PM?=
 =?us-ascii?Q?Ki+ywgiLGaMtoaMVsN9Z/0V7959XOtclAIFyj3o8/tERWMcNd9FS1WBcrPud?=
 =?us-ascii?Q?U/WfIIeoXrpUvImuccMjE1yxn56E5/zYwTJjYhMizX5sjDI2rKbJEXfQAcma?=
 =?us-ascii?Q?f9DJOmtuDFCUyk/jmuS3qSUJ31cDSPEDO+OmtCo+wBIrua4XFvyiR61Zf9hb?=
 =?us-ascii?Q?l6uMpgEmZovbfSnnnXseDqmb4elRM08OyS1n0p+JJ2Ya8QQ+TRcSHRN1mu8L?=
 =?us-ascii?Q?/eHUYfs2Oie7nIjLL4Np7PxwvLHPLBPMGJr73SxK1aB9JF2rWBNoOm52p/aJ?=
 =?us-ascii?Q?Al1nb65UCgjEz4UYvI+RWrOHeUdvsfD/pbpwNfjM9XJiXAP/Y6cswLjAAXZs?=
 =?us-ascii?Q?qHc6zrw/iy/JVoYIT4JDZ7X7L8mY23gvYMoTeE+IEhL4PJuaRD1KVZC1gB+3?=
 =?us-ascii?Q?AX25hI3N2hBZABiL280vVAfPWnGKSVBGNiGbMOgKdLRdUNSbCLgy0G/2crcb?=
 =?us-ascii?Q?gvwr8eA4c4ooOXxiCv06ORExzjAchg1DqjlPYrMBVt2fxPaAFcwm1vQ9mSRS?=
 =?us-ascii?Q?14w80Crbh5AlZnUnIEIcTrhChE6CJcIgL6HPEBe8J4klqE/bjO8c8gcnVczt?=
 =?us-ascii?Q?rAsQn2DWDWy97KusxjZTs/fo4MBOk3C6QKkBwJfpdwjDoA/OKuIaW4Bz5oVE?=
 =?us-ascii?Q?xiDM0zTd5meer8dg0DaMD1sKzuyPa3qRjWwlKiyuYntNTXnTz355NMTvsysZ?=
 =?us-ascii?Q?Z5yENfmehLuA9zOkeIJsN4o6oFC6D9mE/oVrhwSwzmAaL+Vhl9hgLCQX0Ly1?=
 =?us-ascii?Q?OdvYzSREgrXXxAnGnYUgjkTwPzzgVdOY+y+EEwBfANnZc2wn+zOzFCsxFwf3?=
 =?us-ascii?Q?X5HppSKKwH1FkOZsSw5d5j76QmdFf7d2KWw/19y80fwelZXQtFpDsRLEeXrV?=
 =?us-ascii?Q?Ccd2GIag5dwwNcMDqG6NtJ5YU3y9R6J/QL9rKl2dEHy05wu3EUA/r5K6Qb6V?=
 =?us-ascii?Q?PPVhN7iwPiA/boGpRymWXfjxWP4qSF033g3qn7M/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(6049299003)(366016)(376014)(1800799024)(38070700021)(7053199007)(13003099007)(8096899003)(4053099003)(4013099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?em6ZtqYMTxpy8BKr9j+73Y7YL/Nz+OBu67iyx3F4ilgvO+Z4u6HuuolyeWNR?=
 =?us-ascii?Q?BNvlIz7th7+XMIwcpPZauqk+q5ywVn2BM8071+4MEZCXjmkCWK9ydQNKEbw2?=
 =?us-ascii?Q?ml3VBoAiFcnafPonfFqb8bxl6k1F1bczMyIzzdc5Iwu8sUoBX3dC/eOmHMbI?=
 =?us-ascii?Q?erJSPRI6eYxg+4n1jsfhOeSj9iaOCnqCvCczlx6ZezYfUul4h++fkc59t+8R?=
 =?us-ascii?Q?Ws+Vq9eVwtBXAkGLozyGTutH5PxV3F0GJg/xJICh2fpohDbcAqUakVuv3Jje?=
 =?us-ascii?Q?pQbDv2IrAFS5QNGCVTmnKvmywAvSVMyBlPXkZOMKh7d+30Lbajk++sY3noog?=
 =?us-ascii?Q?wHx/v//fFq0zySek0PF4IiffxnrQ5dJdO5+oE7pD1GfNKXnvFS5sS/5acH5u?=
 =?us-ascii?Q?+ZndmXyeY3L7UBGdrb4b45ZiCVp0ARqcJWKqIYkDMYCJaAVWprcGIXvYJyfx?=
 =?us-ascii?Q?BRX4OYFqjXT8fS6hiyg7u0SCFipRAP8YasDzTv5Qr0hru8kX1TBOOnaXIg1Q?=
 =?us-ascii?Q?41QEUFu/QvlARjY69ZYAxY00GotcY7SWX5tX3ybTEALcchXVcRBLmfjNxfOW?=
 =?us-ascii?Q?UXx8rdeGmDA8DSyGuLGhIH0FURg+A71+PYqMXQvbg1HiMgHzBKZ8eDnj5r/8?=
 =?us-ascii?Q?9oT6Z3+4fqv85SAoOTmEeUNLPe960CBbHIKpTJ3df+mU6qoZNksWsq8Yib+m?=
 =?us-ascii?Q?7phH6kCi5HOEOCxWkH939vFgvcoAn2sl0+Hc+Mr+pNUKqgAoUcowcvf9njSV?=
 =?us-ascii?Q?pgwEOZHB8iSXBwiw1X2xgGEqMl3jXC3AkSW4cdnQCOnN3yOvavw63N96mZ0P?=
 =?us-ascii?Q?YnsiSAV2po0xiGkruaHZ2swEmW8bJ0+jp0c8hYl5qR7Em5NcDfOZ734wJxgt?=
 =?us-ascii?Q?CYHRUmVFbuOARcZNgNyssl/3aQDE7Zle9bpYRDaTlOIrOAlRlr5CyD3KEFOo?=
 =?us-ascii?Q?PcO83ok03pagvXAML1mcGb+zqNeSRzDgnYVlB/VhWTagHFGZrYFhBom90khs?=
 =?us-ascii?Q?dHnHw9Fk7NAyz+frIA4K2P3K7nOjcoXNdO+p8KVoMf1oqsj8qoFqzfaOptdx?=
 =?us-ascii?Q?Jo82C19BMy2cC9/anauMPlwZ+uGsnTNB7hSfTuNOHLQ2DAZcqubHQ0PnGQpP?=
 =?us-ascii?Q?P0/zTM4dqI+TU3wgv1iwwXpZC3R6yHt40AEzr6ctp5Rxz1SUQTYr04iwNBei?=
 =?us-ascii?Q?z47C8c7x8styi8TA84ayPULyEEqaHES+eW7TCEEeHbYUHQu9U2cGq6ZIaOAq?=
 =?us-ascii?Q?O4ML0GlVhLb+aYIjVZ4nvJvX4VyeJA3rCS4AuYCE3q7IqP2NpT0YeW1qclUV?=
 =?us-ascii?Q?YWRNh3MYuwjjXXgAW7+t19lI/1J/dvFJ+8tEFgFsYk7DJTXyEdHHUIQzRmId?=
 =?us-ascii?Q?ABpMlfms9yj7+wOD5oFWI6OUx/EsDoagiajAB3Q+FmFDKcro927hVFALsp8d?=
 =?us-ascii?Q?ON+GGUh51RU9ODzMWyNk1R83Z36XtVvrdaEGU1Ma3sk7fQZMmRKC64HiKtUW?=
 =?us-ascii?Q?XL+wVCxoEDdtYvB9XU34Wt3sa1UlCPUL/iUBVq6uqN13qvOcCKwzKYPD2i3/?=
 =?us-ascii?Q?TQKcSd1JuDtvN/wdzoTDuYHdTN8a6vYkI2pq5blGo0MsjvQgJOGcGhM+anrc?=
 =?us-ascii?Q?ZVOJ2lFfsG91CNh33G0Od+4wIGgb2gi+32KKgW39nXAU7SyGTN7l9YpfdONX?=
 =?us-ascii?Q?j2mdRK+8Rk2Ypy8IfrNtm+h2kyw3IjCcguyyO27mk3LsMXj4?=
Content-Type: multipart/related;
 boundary="_004_PH7PR12MB6420BB80484EE78F0B0855F4819AAPH7PR12MB6420namp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc282052-54cb-4358-c11e-08de6205356b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 02:46:04.3031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8aRnLuCD82L/jcax46l+r/srr3julnt6LQjCj4Yg5fRQmpYzNLiT55hRXutCC6EcA7K65zp0dW3ezzINbn/yyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650
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

--_004_PH7PR12MB6420BB80484EE78F0B0855F4819AAPH7PR12MB6420namp_
Content-Type: multipart/alternative;
	boundary="_000_PH7PR12MB6420BB80484EE78F0B0855F4819AAPH7PR12MB6420namp_"

--_000_PH7PR12MB6420BB80484EE78F0B0855F4819AAPH7PR12MB6420namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Thanks - this is a really useful refactoring. It removes repetitive, simila=
r code blocks and consolidates the logic into a single function.
Reviewed by: Vitaly Prosyak <vitaly.prosyak@amd.com>

[cid:34626228-e329-4899-a85f-fd7b6586890f]<https://outlook.office.com/bookw=
ithme/user/5be71e58d07c492d97048217b901df8e@amd.com?anonymous&ep=3DowaSlots=
EmailSignature>
Book time to meet with me<https://outlook.office.com/bookwithme/user/5be71e=
58d07c492d97048217b901df8e@amd.com?anonymous&ep=3DowaSlotsEmailSignature>
________________________________
From: Jesse.Zhang <Jesse.Zhang@amd.com>
Sent: Friday, January 30, 2026 3:46 AM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhang, Jes=
se(Jie) <Jesse.Zhang@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: Refactor sched_mask read logic and add X=
CP partition mode support

The refactoring maintains all existing functionality while creating a
centralized, more robust implementation for reading scheduler masks
across different IP blocks and GPU configurations.
Adapt IGT test logic to XCP non-SPX (CPX/DPX/TPX/QPX) partition modes, forc=
e sched_mask=3D1 for partitioned modes

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c       | 54 ++--------------
 lib/amdgpu/amd_ip_blocks.c              | 85 +++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h              |  5 ++
 lib/amdgpu/amd_mmd_shared.c             | 42 ++----------
 lib/amdgpu/compute_utils/amd_dispatch.c | 60 +++--------------
 5 files changed, 110 insertions(+), 136 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_he=
lpers.c
index 01c0f9928..cb37a3564 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -206,13 +206,11 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle=
, unsigned int ip_type, uin
 void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigne=
d int ip_type, struct pci_addr *pci, bool userq)
 {
         int r;
-       FILE *fp;
         char cmd[1024];
-       char buffer[128];
         uint64_t sched_mask =3D 0, ring_id;
         struct drm_amdgpu_info_hw_ip info;
         uint32_t  prio;
-       char sysfs[125];
+       char sysfs[256];
         bool support_page;

         r =3D amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
@@ -234,27 +232,8 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle de=
vice_handle, unsigned int

         support_page =3D is_support_page_queue(ip_type, pci);

-       if (ip_type =3D=3D AMD_IP_GFX)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
-                       pci->domain, pci->bus, pci->device, pci->function);
-       else if (ip_type =3D=3D AMD_IP_COMPUTE)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
-                       pci->domain, pci->bus, pci->device, pci->function);
-       else if (ip_type =3D=3D AMD_IP_DMA)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
-                       pci->domain, pci->bus, pci->device, pci->function);
-
-       snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
-       r =3D access(sysfs, R_OK);
-       if (!r) {
-               fp =3D popen(cmd, "r");
-               if (fp =3D=3D NULL)
-                       igt_skip("read the sysfs failed: %s\n", sysfs);
-
-               if (fgets(buffer, 128, fp) !=3D NULL)
-                       sched_mask =3D strtol(buffer, NULL, 16);
-
-               pclose(fp);
+       if (is_spx_mode(pci)) {
+               sched_mask =3D amdgpu_get_ip_schedule_mask(pci, (enum amd_i=
p_block_type)ip_type, sysfs);
         } else {
                 sched_mask =3D 1;
                 igt_info("The scheduling ring only enables one for ip %d\n=
", ip_type);
@@ -483,13 +462,11 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_h=
andle, uint8_t hang_type)
 void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned i=
nt cmd_error, unsigned int ip_type, struct pci_addr *pci, bool user_queue)
 {
         int r;
-       FILE *fp;
         char cmd[1024];
-       char buffer[128];
         uint64_t sched_mask =3D 0, ring_id;
         struct drm_amdgpu_info_hw_ip info;
         uint32_t prio;
-       char sysfs[125];
+       char sysfs[256];
         bool support_page;
         uint32_t available_rings =3D 0;
         r =3D amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
@@ -510,27 +487,8 @@ void bad_access_ring_helper(amdgpu_device_handle devic=
e_handle, unsigned int cmd
                 return;
         }
         support_page =3D is_support_page_queue(ip_type, pci);
-       if (ip_type =3D=3D AMD_IP_GFX)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
-                       pci->domain, pci->bus, pci->device, pci->function);
-       else if (ip_type =3D=3D AMD_IP_COMPUTE)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
-                       pci->domain, pci->bus, pci->device, pci->function);
-       else if (ip_type =3D=3D AMD_IP_DMA)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
-                       pci->domain, pci->bus, pci->device, pci->function);
-
-       snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
-       r =3D access(sysfs, R_OK);
-       if (!r) {
-               fp =3D popen(cmd, "r");
-               if (fp =3D=3D NULL)
-                       igt_skip("read the sysfs failed: %s\n", sysfs);
-
-               if (fgets(buffer, 128, fp) !=3D NULL)
-                       sched_mask =3D strtol(buffer, NULL, 16);
-
-               pclose(fp);
+       if (is_spx_mode(pci)) {
+               sched_mask =3D amdgpu_get_ip_schedule_mask(pci, (enum amd_i=
p_block_type)ip_type, sysfs);
         } else {
                 sched_mask =3D 1;
                 igt_info("The scheduling ring only enables one for ip %d\n=
", ip_type);
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index eb0b71728..9822662e3 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1873,3 +1873,88 @@ const char *cmd_get_ip_name(enum amd_ip_block_type i=
p_type)
                 return "Unknown";
         }
 }
+
+bool is_spx_mode(const struct pci_addr *pci)
+{
+       char path[256];
+       char buffer[16] =3D {0};
+       FILE *fp;
+
+       snprintf(path, sizeof(path), "/sys/bus/pci/devices/%04x:%02x:%02x.%=
01x/current_compute_partition",
+                pci->domain, pci->bus, pci->device, pci->function);
+
+       /* If file doesn't exist, assume SPX or non-partitioned capable */
+       if (access(path, R_OK) !=3D 0)
+               return true;
+
+       fp =3D fopen(path, "r");
+       if (!fp)
+               return true;
+
+       if (fgets(buffer, sizeof(buffer), fp)) {
+               if (strstr(buffer, "SPX")) {
+                       fclose(fp);
+                       return true;
+               }
+       }
+       fclose(fp);
+       return false;
+}
+
+long amdgpu_get_ip_schedule_mask(const struct pci_addr *pci, enum amd_ip_b=
lock_type ip_type, char *sysfs_path)
+{
+       char sysfs_local[256];
+       char *sysfs =3D sysfs_path ? sysfs_path : sysfs_local;
+       char cmd[512];
+       char buffer[128];
+       FILE *fp;
+       long sched_mask =3D 0;
+       int dri_id;
+       const char *mask_name =3D NULL;
+
+       switch (ip_type) {
+       case AMD_IP_GFX:
+               mask_name =3D "amdgpu_gfx_sched_mask";
+               break;
+       case AMD_IP_COMPUTE:
+               mask_name =3D "amdgpu_compute_sched_mask";
+               break;
+       case AMD_IP_DMA:
+               mask_name =3D "amdgpu_sdma_sched_mask";
+               break;
+       case AMD_IP_VCN_UNIFIED:
+               mask_name =3D "amdgpu_vcn_sched_mask";
+               break;
+       case AMD_IP_VCN_JPEG:
+               mask_name =3D "amdgpu_jpeg_sched_mask";
+               break;
+       default:
+               return 0;
+       }
+
+       snprintf(sysfs, 256, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/%s"=
,
+                pci->domain, pci->bus, pci->device, pci->function, mask_na=
me);
+
+       if (access(sysfs, F_OK) !=3D 0) {
+               dri_id =3D find_dri_id_by_pci(pci);
+               if (dri_id < 0)
+                       dri_id =3D 0;
+
+               snprintf(sysfs, 256, "/sys/kernel/debug/dri/%d/%s", dri_id,=
 mask_name);
+       }
+
+       if (access(sysfs, R_OK) !=3D 0)
+               return 1;
+
+       snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
+
+       fp =3D popen(cmd, "r");
+       if (fp) {
+               if (fgets(buffer, sizeof(buffer), fp))
+                       sched_mask =3D strtol(buffer, NULL, 16);
+               pclose(fp);
+       }
+
+       return sched_mask;
+}
+
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 8fd9fde9a..424b3210a 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -442,6 +442,11 @@ is_support_page_queue(enum amd_ip_block_type ip_type, =
const struct pci_addr *pci
 int
 find_dri_id_by_pci(const struct pci_addr *pci);

+long
+amdgpu_get_ip_schedule_mask(const struct pci_addr *pci, enum amd_ip_block_=
type ip_type, char *sysfs_path);
+
+bool is_spx_mode(const struct pci_addr *pci);
+
 int
 get_dri_index_from_device(amdgpu_device_handle device, int fd);
 /**
diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c
index f504db596..261ca7205 100644
--- a/lib/amdgpu/amd_mmd_shared.c
+++ b/lib/amdgpu/amd_mmd_shared.c
@@ -196,54 +196,20 @@ mm_queue_test_helper(amdgpu_device_handle device_hand=
le, struct mmd_shared_conte
                 mm_test_callback callback, int err_type, const struct pci_=
addr *pci)
 {
         int r;
-       FILE *fp;
         char cmd[1024];
-       char buffer[128];
         long sched_mask =3D 0;
         long mask =3D 0;
         uint32_t ring_id;
-       char sysfs[125];
-       char dri_dir[128];
-       int dri_id =3D 0;
+       char sysfs[256];

         if (!callback)
                 return -1;

-       snprintf(dri_dir, sizeof(dri_dir) - 1, "/sys/kernel/debug/dri/%04x:=
%02x:%02x.%01x",
-               pci->domain, pci->bus, pci->device, pci->function);
-
-       if (access(dri_dir, F_OK) =3D=3D 0) {
-               // test is only supported on VCN version >=3D 4
-               if (context->ip_type =3D=3D AMD_IP_VCN_UNIFIED)
-                       snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/deb=
ug/dri/%04x:%02x:%02x.%01x/amdgpu_vcn_sched_mask",
-                                       pci->domain, pci->bus, pci->device,=
 pci->function);
-               else if (context->ip_type =3D=3D AMD_IP_VCN_JPEG)
-                       snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/deb=
ug/dri/%04x:%02x:%02x.%01x/amdgpu_jpeg_sched_mask",
-                                       pci->domain, pci->bus, pci->device,=
 pci->function);
+       if (is_spx_mode(pci)) {
+               sched_mask =3D amdgpu_get_ip_schedule_mask(pci, (enum amd_i=
p_block_type)context->ip_type, sysfs);
         } else {
-               dri_id =3D find_dri_id_by_pci(pci);
-               if (dri_id < 0)
-                       dri_id =3D 0;
-
-               if (context->ip_type =3D=3D AMD_IP_VCN_UNIFIED)
-                       snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/deb=
ug/dri/%d/amdgpu_vcn_sched_mask", dri_id);
-               else if (context->ip_type =3D=3D AMD_IP_VCN_JPEG)
-                       snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/deb=
ug/dri/%d/amdgpu_jpeg_sched_mask", dri_id);
+               sched_mask =3D 1;
         }
-       snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
-       r =3D access(sysfs, R_OK);
-       if (!r) {
-               fp =3D popen(cmd, "r");
-               if (fp =3D=3D NULL) {
-                       igt_skip("read the sysfs failed: %s\n", sysfs);
-                       return -1;
-               }
-
-               if (fgets(buffer, 128, fp) !=3D NULL)
-                       sched_mask =3D strtol(buffer, NULL, 16);
-               pclose(fp);
-       } else
-               sched_mask =3D 1;

         mask =3D sched_mask;
         for (ring_id =3D 0;  mask > 0; ring_id++) {
diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_u=
tils/amd_dispatch.c
index ded62bbd1..23c15ef1b 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -664,13 +664,11 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle=
 device_handle,
                                  uint32_t ip_type, const struct pci_addr *=
pci, bool userq)
 {
         int r;
-       FILE *fp;
         char cmd[1024];
-       char buffer[128];
         long sched_mask =3D 0;
         struct drm_amdgpu_info_hw_ip info;
         uint32_t ring_id, version, prio;
-       char sysfs[125];
+       char sysfs[256];

         r =3D amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
         igt_assert_eq(r, 0);
@@ -683,29 +681,11 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle=
 device_handle,
                 return;
         }

-       if (ip_type =3D=3D AMD_IP_GFX)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
-                               pci->domain, pci->bus, pci->device, pci->fu=
nction);
-       else if (ip_type =3D=3D AMD_IP_COMPUTE)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
-                               pci->domain, pci->bus, pci->device, pci->fu=
nction);
-       else if (ip_type =3D=3D AMD_IP_DMA)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
-                               pci->domain, pci->bus, pci->device, pci->fu=
nction);
-
-       snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
-       r =3D access(sysfs, R_OK);
-       if (!r) {
-               fp =3D popen(cmd, "r");
-               if (fp =3D=3D NULL)
-                       igt_skip("read the sysfs failed: %s \n",sysfs);
-
-               if (fgets(buffer, 128, fp) !=3D NULL)
-                       sched_mask =3D strtol(buffer, NULL, 16);
-
-               pclose(fp);
-       } else
+       if (is_spx_mode(pci)) {
+               sched_mask =3D amdgpu_get_ip_schedule_mask(pci, (enum amd_i=
p_block_type)ip_type, sysfs);
+       } else {
                 sched_mask =3D 1;
+       }

         for (ring_id =3D 0; (0x1 << ring_id) <=3D sched_mask; ring_id++) {
                 /* check sched is ready is on the ring. */
@@ -760,13 +740,11 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle de=
vice_handle, uint32_t ip_ty
                 enum cmd_error_type hang, const struct pci_addr *pci,  boo=
l userq)
 {
         int r;
-       FILE *fp;
         char cmd[1024];
-       char buffer[128];
         long sched_mask =3D 0;
         struct drm_amdgpu_info_hw_ip info;
         uint32_t ring_id, version, prio;
-       char sysfs[125];
+       char sysfs[256];

         r =3D amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
         igt_assert_eq(r, 0);
@@ -784,29 +762,11 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle de=
vice_handle, uint32_t ip_ty
         if (userq) {
                 sched_mask =3D 1;
         } else {
-               if (ip_type =3D=3D AMD_IP_GFX)
-                       snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/deb=
ug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
-                                       pci->domain, pci->bus, pci->device,=
 pci->function);
-               else if (ip_type =3D=3D AMD_IP_COMPUTE)
-                       snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/deb=
ug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
-                                       pci->domain, pci->bus, pci->device,=
 pci->function);
-               else if (ip_type =3D=3D AMD_IP_DMA)
-                       snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/deb=
ug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
-                                       pci->domain, pci->bus, pci->device,=
 pci->function);
-
-               snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
-               r =3D access(sysfs, R_OK);
-               if (!r) {
-                       fp =3D popen(cmd, "r");
-                       if (fp =3D=3D NULL)
-                               igt_skip("read the sysfs failed: %s \n",sys=
fs);
-
-                       if (fgets(buffer, 128, fp) !=3D NULL)
-                               sched_mask =3D strtol(buffer, NULL, 16);
-
-                       pclose(fp);
-               } else
+               if (is_spx_mode(pci)) {
+                       sched_mask =3D amdgpu_get_ip_schedule_mask(pci, (en=
um amd_ip_block_type)ip_type, sysfs);
+               } else {
                         sched_mask =3D 1;
+               }
         }

         for (ring_id =3D 0; (0x1 << ring_id) <=3D sched_mask; ring_id++) {
--
2.49.0


--_000_PH7PR12MB6420BB80484EE78F0B0855F4819AAPH7PR12MB6420namp_
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
<div>
<div style=3D"font-family: Calibri; text-align: left; color: rgb(0, 0, 255)=
; margin-left: 5pt; font-size: 10pt;">
[AMD Official Use Only - AMD Internal Distribution Only]</div>
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks &#8212; this is a really useful refactoring. It removes repetitive, =
similar code blocks and consolidates the logic into a single function.<br>
Reviewed by: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<table id=3D"pbpsiglinktable">
<tbody>
<tr>
<td>
<div class=3D"elementToProof"><a class=3D"OWAAutoLink" id=3D"OWA03830c8c-c9=
c7-3745-2673-9cb67226f65f" href=3D"https://outlook.office.com/bookwithme/us=
er/5be71e58d07c492d97048217b901df8e@amd.com?anonymous&amp;ep=3DowaSlotsEmai=
lSignature"><img data-outlook-trace=3D"F:1|T:1" src=3D"cid:34626228-e329-48=
99-a85f-fd7b6586890f"></a></div>
</td>
<td></td>
<td>
<div style=3D"color: rgb(0, 120, 212);" class=3D"elementToProof"><a style=
=3D"color: rgb(0, 120, 212); text-decoration: none;" class=3D"OWAAutoLink" =
id=3D"OWA47fdfb61-9efa-e182-1110-66ba6ca421b0" href=3D"https://outlook.offi=
ce.com/bookwithme/user/5be71e58d07c492d97048217b901df8e@amd.com?anonymous&a=
mp;ep=3DowaSlotsEmailSignature">Book
 time to meet with me</a></div>
</td>
<td></td>
</tr>
</tbody>
</table>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jesse.Zhang &lt;Jesse=
.Zhang@amd.com&gt;<br>
<b>Sent:</b> Friday, January 30, 2026 3:46 AM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;; Deucher, Alexand=
er &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koeni=
g@amd.com&gt;; Zhang, Jesse(Jie) &lt;Jesse.Zhang@amd.com&gt;; Zhang, Jesse(=
Jie) &lt;Jesse.Zhang@amd.com&gt;<br>
<b>Subject:</b> [PATCH i-g-t] lib/amdgpu: Refactor sched_mask read logic an=
d add XCP partition mode support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The refactoring maintains all existing functionali=
ty while creating a<br>
centralized, more robust implementation for reading scheduler masks<br>
across different IP blocks and GPU configurations.<br>
Adapt IGT test logic to XCP non-SPX (CPX/DPX/TPX/QPX) partition modes, forc=
e sched_mask=3D1 for partitioned modes<br>
<br>
Signed-off-by: Jesse Zhang &lt;jesse.zhang@amd.com&gt;<br>
---<br>
&nbsp;lib/amdgpu/amd_deadlock_helpers.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 | 54 ++--------------<br>
&nbsp;lib/amdgpu/amd_ip_blocks.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 85 +++++++++++++++++++++++++<br>
&nbsp;lib/amdgpu/amd_ip_blocks.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 5 ++<br>
&nbsp;lib/amdgpu/amd_mmd_shared.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 42 ++----------<br>
&nbsp;lib/amdgpu/compute_utils/amd_dispatch.c | 60 +++--------------<br>
&nbsp;5 files changed, 110 insertions(+), 136 deletions(-)<br>
<br>
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_he=
lpers.c<br>
index 01c0f9928..cb37a3564 100644<br>
--- a/lib/amdgpu/amd_deadlock_helpers.c<br>
+++ b/lib/amdgpu/amd_deadlock_helpers.c<br>
@@ -206,13 +206,11 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle=
, unsigned int ip_type, uin<br>
&nbsp;void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, un=
signed int ip_type, struct pci_addr *pci, bool userq)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FILE *fp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char cmd[1024];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buffer[128];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t sched_mask =3D 0,=
 ring_id;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_info_hw_=
ip info;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp; prio;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sysfs[125];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sysfs[256];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool support_page;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_query_hw_ip_i=
nfo(device_handle, ip_type, 0, &amp;info);<br>
@@ -234,27 +232,8 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle de=
vice_handle, unsigned int<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; support_page =3D is_suppor=
t_page_queue(ip_type, pci);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ip_type =3D=3D AMD_IP_GFX)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(sysfs, sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci-&gt;domain, =
pci-&gt;bus, pci-&gt;device, pci-&gt;function);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (ip_type =3D=3D AMD_IP_COMPUT=
E)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(sysfs, sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_compute_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci-&gt;domain, =
pci-&gt;bus, pci-&gt;device, pci-&gt;function);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (ip_type =3D=3D AMD_IP_DMA)<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(sysfs, sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci-&gt;domain, =
pci-&gt;bus, pci-&gt;device, pci-&gt;function);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(cmd, sizeof(cmd) - 1, &quot;=
sudo cat %s&quot;, sysfs);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D access(sysfs, R_OK);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!r) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fp =3D popen(cmd, &quot;r&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (fp =3D=3D NULL)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip(&quot;r=
ead the sysfs failed: %s\n&quot;, sysfs);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (fgets(buffer, 128, fp) !=3D NULL)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched_mask =3D s=
trtol(buffer, NULL, 16);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pclose(fp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_spx_mode(pci)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sched_mask =3D amdgpu_get_ip_schedule_mask(pci, (enum amd_ip_blo=
ck_type)ip_type, sysfs);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; sched_mask =3D 1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_info(&quot;The scheduling ring only enables one f=
or ip %d\n&quot;, ip_type);<br>
@@ -483,13 +462,11 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_h=
andle, uint8_t hang_type)<br>
&nbsp;void bad_access_ring_helper(amdgpu_device_handle device_handle, unsig=
ned int cmd_error, unsigned int ip_type, struct pci_addr *pci, bool user_qu=
eue)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FILE *fp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char cmd[1024];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buffer[128];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t sched_mask =3D 0,=
 ring_id;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_info_hw_=
ip info;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t prio;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sysfs[125];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sysfs[256];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool support_page;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t available_rings =
=3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_query_hw_ip_i=
nfo(device_handle, ip_type, 0, &amp;info);<br>
@@ -510,27 +487,8 @@ void bad_access_ring_helper(amdgpu_device_handle devic=
e_handle, unsigned int cmd<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; support_page =3D is_suppor=
t_page_queue(ip_type, pci);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ip_type =3D=3D AMD_IP_GFX)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(sysfs, sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci-&gt;domain, =
pci-&gt;bus, pci-&gt;device, pci-&gt;function);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (ip_type =3D=3D AMD_IP_COMPUT=
E)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(sysfs, sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_compute_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci-&gt;domain, =
pci-&gt;bus, pci-&gt;device, pci-&gt;function);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (ip_type =3D=3D AMD_IP_DMA)<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(sysfs, sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci-&gt;domain, =
pci-&gt;bus, pci-&gt;device, pci-&gt;function);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(cmd, sizeof(cmd) - 1, &quot;=
sudo cat %s&quot;, sysfs);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D access(sysfs, R_OK);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!r) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fp =3D popen(cmd, &quot;r&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (fp =3D=3D NULL)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip(&quot;r=
ead the sysfs failed: %s\n&quot;, sysfs);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (fgets(buffer, 128, fp) !=3D NULL)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched_mask =3D s=
trtol(buffer, NULL, 16);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pclose(fp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_spx_mode(pci)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sched_mask =3D amdgpu_get_ip_schedule_mask(pci, (enum amd_ip_blo=
ck_type)ip_type, sysfs);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; sched_mask =3D 1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_info(&quot;The scheduling ring only enables one f=
or ip %d\n&quot;, ip_type);<br>
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c<br>
index eb0b71728..9822662e3 100644<br>
--- a/lib/amdgpu/amd_ip_blocks.c<br>
+++ b/lib/amdgpu/amd_ip_blocks.c<br>
@@ -1873,3 +1873,88 @@ const char *cmd_get_ip_name(enum amd_ip_block_type i=
p_type)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return &quot;Unknown&quot;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
+<br>
+bool is_spx_mode(const struct pci_addr *pci)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char path[256];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buffer[16] =3D {0};<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FILE *fp;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(path), &quot;/s=
ys/bus/pci/devices/%04x:%02x:%02x.%01x/current_compute_partition&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; pci-&gt;domain, pci-&gt;bus, pci-&gt;device, pci-&gt;funct=
ion);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If file doesn't exist, assume SPX =
or non-partitioned capable */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (access(path, R_OK) !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return true;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fp =3D fopen(path, &quot;r&quot;);<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!fp)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return true;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fgets(buffer, sizeof(buffer), fp)=
) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (strstr(buffer, &quot;SPX&quot;)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fclose(fp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fclose(fp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
+}<br>
+<br>
+long amdgpu_get_ip_schedule_mask(const struct pci_addr *pci, enum amd_ip_b=
lock_type ip_type, char *sysfs_path)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sysfs_local[256];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *sysfs =3D sysfs_path ? sysfs_pa=
th : sysfs_local;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char cmd[512];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buffer[128];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FILE *fp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long sched_mask =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dri_id;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *mask_name =3D NULL;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (ip_type) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_GFX:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mask_name =3D &quot;amdgpu_gfx_sched_mask&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_COMPUTE:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mask_name =3D &quot;amdgpu_compute_sched_mask&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_DMA:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mask_name =3D &quot;amdgpu_sdma_sched_mask&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_VCN_UNIFIED:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mask_name =3D &quot;amdgpu_vcn_sched_mask&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_VCN_JPEG:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mask_name =3D &quot;amdgpu_jpeg_sched_mask&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(sysfs, 256, &quot;/sys/kerne=
l/debug/dri/%04x:%02x:%02x.%01x/%s&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; pci-&gt;domain, pci-&gt;bus, pci-&gt;device, pci-&gt;funct=
ion, mask_name);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (access(sysfs, F_OK) !=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; dri_id =3D find_dri_id_by_pci(pci);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dri_id &lt; 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dri_id =3D 0;<br=
>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(sysfs, 256, &quot;/sys/kernel/debug/dri/%d/%s&quot;, dr=
i_id, mask_name);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (access(sysfs, R_OK) !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return 1;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(cmd, sizeof(cmd) - 1, &quot;=
sudo cat %s&quot;, sysfs);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fp =3D popen(cmd, &quot;r&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fp) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (fgets(buffer, sizeof(buffer), fp))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched_mask =3D s=
trtol(buffer, NULL, 16);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pclose(fp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return sched_mask;<br>
+}<br>
+<br>
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h<br>
index 8fd9fde9a..424b3210a 100644<br>
--- a/lib/amdgpu/amd_ip_blocks.h<br>
+++ b/lib/amdgpu/amd_ip_blocks.h<br>
@@ -442,6 +442,11 @@ is_support_page_queue(enum amd_ip_block_type ip_type, =
const struct pci_addr *pci<br>
&nbsp;int<br>
&nbsp;find_dri_id_by_pci(const struct pci_addr *pci);<br>
&nbsp;<br>
+long<br>
+amdgpu_get_ip_schedule_mask(const struct pci_addr *pci, enum amd_ip_block_=
type ip_type, char *sysfs_path);<br>
+<br>
+bool is_spx_mode(const struct pci_addr *pci);<br>
+<br>
&nbsp;int<br>
&nbsp;get_dri_index_from_device(amdgpu_device_handle device, int fd);<br>
&nbsp;/**<br>
diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c<br>
index f504db596..261ca7205 100644<br>
--- a/lib/amdgpu/amd_mmd_shared.c<br>
+++ b/lib/amdgpu/amd_mmd_shared.c<br>
@@ -196,54 +196,20 @@ mm_queue_test_helper(amdgpu_device_handle device_hand=
le, struct mmd_shared_conte<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mm_test_callback callback, int err_type, const struct=
 pci_addr *pci)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FILE *fp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char cmd[1024];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buffer[128];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long sched_mask =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long mask =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t ring_id;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sysfs[125];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char dri_dir[128];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dri_id =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sysfs[256];<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!callback)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -1;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(dri_dir, sizeof(dri_dir) - 1=
, &quot;/sys/kernel/debug/dri/%04x:%02x:%02x.%01x&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pci-&gt;domain, pci-&gt;bus, pci-&gt;device, pci-&gt;function);<=
br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (access(dri_dir, F_OK) =3D=3D 0) {=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; // test is only supported on VCN version &gt;=3D 4<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (context-&gt;ip_type =3D=3D AMD_IP_VCN_UNIFIED)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(sysfs, =
sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_v=
cn_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pci-&gt;domain, pci-&gt;bus, pci-&gt;device, pci-&gt;function);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else if (context-&gt;ip_type =3D=3D AMD_IP_VCN_JPEG)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(sysfs, =
sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_j=
peg_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pci-&gt;domain, pci-&gt;bus, pci-&gt;device, pci-&gt;function);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_spx_mode(pci)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sched_mask =3D amdgpu_get_ip_schedule_mask(pci, (enum amd_ip_blo=
ck_type)context-&gt;ip_type, sysfs);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; dri_id =3D find_dri_id_by_pci(pci);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (dri_id &lt; 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dri_id =3D 0;<br=
>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (context-&gt;ip_type =3D=3D AMD_IP_VCN_UNIFIED)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(sysfs, =
sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%d/amdgpu_vcn_sched_mask&quo=
t;, dri_id);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else if (context-&gt;ip_type =3D=3D AMD_IP_VCN_JPEG)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(sysfs, =
sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%d/amdgpu_jpeg_sched_mask&qu=
ot;, dri_id);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sched_mask =3D 1; <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(cmd, sizeof(cmd) - 1, &quot;=
sudo cat %s&quot;, sysfs);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D access(sysfs, R_OK);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!r) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fp =3D popen(cmd, &quot;r&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (fp =3D=3D NULL) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip(&quot;r=
ead the sysfs failed: %s\n&quot;, sysfs);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (fgets(buffer, 128, fp) !=3D NULL)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched_mask =3D s=
trtol(buffer, NULL, 16);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pclose(fp);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sched_mask =3D 1;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mask =3D sched_mask;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (ring_id =3D 0;&nbsp; =
mask &gt; 0; ring_id++) {<br>
diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_u=
tils/amd_dispatch.c<br>
index ded62bbd1..23c15ef1b 100644<br>
--- a/lib/amdgpu/compute_utils/amd_dispatch.c<br>
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c<br>
@@ -664,13 +664,11 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle=
 device_handle,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t ip_type, const st=
ruct pci_addr *pci, bool userq)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FILE *fp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char cmd[1024];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buffer[128];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long sched_mask =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_info_hw_=
ip info;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t ring_id, version,=
 prio;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sysfs[125];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sysfs[256];<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_query_hw_ip_i=
nfo(device_handle, ip_type, 0, &amp;info);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
@@ -683,29 +681,11 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle=
 device_handle,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ip_type =3D=3D AMD_IP_GFX)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(sysfs, sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci-&gt;domain, pci-&gt;bus, pci-&gt;device=
, pci-&gt;function);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (ip_type =3D=3D AMD_IP_COMPUT=
E)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(sysfs, sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_compute_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci-&gt;domain, pci-&gt;bus, pci-&gt;device=
, pci-&gt;function);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (ip_type =3D=3D AMD_IP_DMA)<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(sysfs, sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci-&gt;domain, pci-&gt;bus, pci-&gt;device=
, pci-&gt;function);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(cmd, sizeof(cmd) - 1, &quot;=
sudo cat %s&quot;, sysfs);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D access(sysfs, R_OK);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!r) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fp =3D popen(cmd, &quot;r&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (fp =3D=3D NULL)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip(&quot;r=
ead the sysfs failed: %s \n&quot;,sysfs);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (fgets(buffer, 128, fp) !=3D NULL)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched_mask =3D s=
trtol(buffer, NULL, 16);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pclose(fp);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_spx_mode(pci)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sched_mask =3D amdgpu_get_ip_schedule_mask(pci, (enum amd_ip_blo=
ck_type)ip_type, sysfs);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; sched_mask =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (ring_id =3D 0; (0x1 &=
lt;&lt; ring_id) &lt;=3D sched_mask; ring_id++) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* check sched is ready is on the ring. */<br>
@@ -760,13 +740,11 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle de=
vice_handle, uint32_t ip_ty<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; enum cmd_error_type hang, const struct pci_addr *pci,=
&nbsp; bool userq)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FILE *fp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char cmd[1024];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buffer[128];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long sched_mask =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_info_hw_=
ip info;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t ring_id, version,=
 prio;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sysfs[125];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char sysfs[256];<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_query_hw_ip_i=
nfo(device_handle, ip_type, 0, &amp;info);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
@@ -784,29 +762,11 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle de=
vice_handle, uint32_t ip_ty<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (userq) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; sched_mask =3D 1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (ip_type =3D=3D AMD_IP_GFX)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(sysfs, =
sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_g=
fx_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pci-&gt;domain, pci-&gt;bus, pci-&gt;device, pci-&gt;function);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else if (ip_type =3D=3D AMD_IP_COMPUTE)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(sysfs, =
sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_c=
ompute_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pci-&gt;domain, pci-&gt;bus, pci-&gt;device, pci-&gt;function);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else if (ip_type =3D=3D AMD_IP_DMA)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(sysfs, =
sizeof(sysfs) - 1, &quot;/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_s=
dma_sched_mask&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pci-&gt;domain, pci-&gt;bus, pci-&gt;device, pci-&gt;function);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(cmd, sizeof(cmd) - 1, &quot;sudo cat %s&quot;, sysfs);<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; r =3D access(sysfs, R_OK);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!r) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fp =3D popen(cmd=
, &quot;r&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fp =3D=3D NU=
LL)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip(&quot;read the sysfs failed: %s \n=
&quot;,sysfs);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fgets(buffer=
, 128, fp) !=3D NULL)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched_mask =3D strtol(buffer, NULL, 16);<br=
>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pclose(fp);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (is_spx_mode(pci)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched_mask =3D a=
mdgpu_get_ip_schedule_mask(pci, (enum amd_ip_block_type)ip_type, sysfs);<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched=
_mask =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (ring_id =3D 0; (0x1 &=
lt;&lt; ring_id) &lt;=3D sched_mask; ring_id++) {<br>
-- <br>
2.49.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH7PR12MB6420BB80484EE78F0B0855F4819AAPH7PR12MB6420namp_--

--_004_PH7PR12MB6420BB80484EE78F0B0855F4819AAPH7PR12MB6420namp_
Content-Type: image/png; name="Outlook-mwgmi1fu.png"
Content-Description: Outlook-mwgmi1fu.png
Content-Disposition: inline; filename="Outlook-mwgmi1fu.png"; size=528;
	creation-date="Mon, 02 Feb 2026 02:46:03 GMT";
	modification-date="Mon, 02 Feb 2026 02:46:03 GMT"
Content-ID: <34626228-e329-4899-a85f-fd7b6586890f>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAcpJREFUOE9j
ZAABr6aJDHqhuQwMDIxgPrHg19d3DLP91Bk+P3sD08IIN2x1hjPDy7NXiDWL4T8nM0NA33wGWRMP
hg5NJgYGhv8gvYwMFdf/MYAMu3twP9GGISssv/qLYVdzMsP5FYthBv5nmO2pyfDzzVuyDEw/eJ3h
xNyJDEenNSMMJMskJE2Hp9YxHJ2CZOBUM1GGz5/hAUuS+UVnXjOcXDCJygbOm4TqZUpcGDJjJcPz
S1eoYyAvrzDD58/vGRgY/iHSYcX1/wykupBXWpghe89reEbY0RjNcGHFMkQsk2pgwYkXDBz84iiR
16EJzmWghE26C8uv/mZgZGJBM5AZ5HXyDPRo7GMwCCuEG/jj40uGCRYS5LsQpNM6q4TBOLqE4emF
gwxrs8NRI2WynSTD19cvSErQOBQzMhSdecvw8vophqWxngQNBCWTrBMvMMIPpnF7dQQjA6+UCEP2
3tcM//7+Zvjx8QNOQydZizFk7bvNwCepgs9iWIHKyGAYEcPALaQEUQwq3mBplQmi5siUBoa0bRcZ
hBT18Bj4n7QSWlhGmiF19xOcBh6aVEyagSCTQEEUNf8Ag6CcFjyn/Pz8hmF9cQjDg8MHAaiKxp0e
iZJ4AAAAAElFTkSuQmCC

--_004_PH7PR12MB6420BB80484EE78F0B0855F4819AAPH7PR12MB6420namp_--
