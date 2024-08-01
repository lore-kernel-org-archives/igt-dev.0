Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E32CC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 10:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDE910E905;
	Thu,  1 Aug 2024 10:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5URKLDbB";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF2E10E909
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 10:56:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAq0Hp3dsNuQsRFPUGg3obVfIqhuVCedJnvwkN2ekDFQfokBvoAxnUjb6DqJ+CGQT+VUfCYr0OjpTulki/mTG/xaifHTbOSbaWfiNwZaLBTz5BNZ8iNSyjrYmNxb/ckgwsM2mgXr68k03D7raPfypX+ptevTu7nzzJN7SRHMnicp/UgSCaRR0NAHW7UvKyCHkRZ2u6fbCDrOJPbb/yzrpzAwq3cCKO8qCLpK3jTHbJqjoqTQ5CjWbyYlELhFzLsGkyOw1B2Lffk7NAUD7eMpkx+eU0viJ31sILUh5qiptbor4EzqziTyuEApH3Hs77vXBEAgjT+fkok5KwGOMWo1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3Ubb+mX0ff5lSv5aGvz7Ze1gzcv1wBZQaYTh50LyTc=;
 b=oOfnt0OfH8ZiAgcCccUQbS47IJ0Nb0eSXr7bDDfEQUqYaE+uhmJSelbrC8zPzqUQk6T6+uALGFjgoEamw9v8apKP9cLCk5FubenInAVhlNO+aCvo9c3oltrDM+b+G5n4lEg2KJHxIdgdw1TEYBvJqFjFF5ZsUBA0BH6BgQX3J0gp6NNHEZ6qS7v/EJUQA0iw+jDcmjT01WWridyXaFSq+eyCkopRDNSDegJz81KBnVr7I5q2KlKKVEGE4cr1HN4rz9Di13pbSmZLNnWSkGhfj1MLUutqe1fyWwaKKEkYSC8lGlwVcyv9VjErouFvmk9IW/Zvc94Vlo33S/a8iS9EpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3Ubb+mX0ff5lSv5aGvz7Ze1gzcv1wBZQaYTh50LyTc=;
 b=5URKLDbBrCyZwq9znq2vMiQIy4E4OM15I9xPUxW9yp8+lvLZ65M943Kx2LR41818n2aJCmlwg0ASushl4AnzCz8o2e6h10bXIbUkz5o0W5x3w4DFTXJtPWFsUBcODdJtyqf5J72V8dwwQA6OLIXPSrvIl0Dv26Pqb6vnNrpLUks=
Received: from DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) by
 IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 10:56:32 +0000
Received: from DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::4dc0:f34c:9e7e:ccb]) by DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::4dc0:f34c:9e7e:ccb%4]) with mapi id 15.20.7807.026; Thu, 1 Aug 2024
 10:56:32 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] tests/amdgpu: update bad length case
Thread-Topic: [PATCH] tests/amdgpu: update bad length case
Thread-Index: AQHa4/kAxueTySvkz0CSozOoX9+yVbISOHmAgAACZKA=
Date: Thu, 1 Aug 2024 10:56:32 +0000
Message-ID: <DS7PR12MB6005BF529373A82A25764745FBB22@DS7PR12MB6005.namprd12.prod.outlook.com>
References: <20240801095540.2517506-1-Prike.Liang@amd.com>
 <DM4PR12MB5152008F7FAE1F7F8D1A4774E3B22@DM4PR12MB5152.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB5152008F7FAE1F7F8D1A4774E3B22@DM4PR12MB5152.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=8dff7b47-bcb3-45e0-9e04-fb64d951e7a0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-01T10:44:50Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6005:EE_|IA1PR12MB7687:EE_
x-ms-office365-filtering-correlation-id: 84fc77ae-59cd-4625-238f-08dcb2189a93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Umal4xH0ZeQhUnrSrH+GqhuUlL029HjwhWCh4uDi28idnqdgG1d8H1mVJUkc?=
 =?us-ascii?Q?RoJxZA69gm5xtOaftK7smk2PUTzIQgH3ibhdYc8mQpHeQb4mik8suUN81Cpn?=
 =?us-ascii?Q?NsF/JZDZhGEmgBviuxT5qhCYQFmAvkEKNHb5Ii/ZqR5PIkB++ig3bXxnOMFp?=
 =?us-ascii?Q?ebnd7OH2+GM9L/3lZCO0lbeAJHA4RB+KPBmqV4mUKBwJ7wYRmNL4PDYAKib9?=
 =?us-ascii?Q?FNNLZXQ8jYrYQqRhqE4VwRiqmPS60DhPu+Nd2hx8TEXPi4NxSSBySdXE5dRa?=
 =?us-ascii?Q?thO+AzjKhNkA1vJ4e34zgtBnNIPGfnYA1QdlyHuHal5fbOxcF2b618fCj+aY?=
 =?us-ascii?Q?Z4peXyCBe7csdhwUG7WNDQ/KTRI+H+xQ3gcUZehV+4CuxlmVOm6bXMMYGhkV?=
 =?us-ascii?Q?TtlF1wevgA+0mEk7WKWVOCADQAF2hP9R2nv7d0SEYEkKjZmJBxRwyOLmlFUx?=
 =?us-ascii?Q?3ZJFAQE6hMs1ewycPRN4oZkXCjuGH9/pBF0zbPjOfZoWe1g6IC85cbgnWR6X?=
 =?us-ascii?Q?BK+wlsKhwmMq/8eLeYa7sin0yZj3HE1rKbzii2elZzlkS1/V0gpq1Y8zodpl?=
 =?us-ascii?Q?IS2G2FSsTwSJx4ea43dzkS/S9HLxU71vUbgH0S4NZ8KHVF07fVo4/qMcg1ra?=
 =?us-ascii?Q?ebHsKkRkgU2u2C3uS076hu76MOtQERKgSG4KGUZRBgygiWzLYalv1O1Uffgl?=
 =?us-ascii?Q?Sjo8EZFGwYVZkFeBf1KCsd0aXq9jTcLq9mkjyoozdXYxSSRQeY71Ef5kv6tR?=
 =?us-ascii?Q?8JYDgydgzYjQMC3axhCsv0DdjKYh0X3vlaGh9KyQEEnh1NSTJGW6TDiHD2ol?=
 =?us-ascii?Q?/oGk3eOkYNBprUlEefWFFsUTD5L2SrAyG4rLRwwX41SL2XDrQfE9kSljKQMk?=
 =?us-ascii?Q?FnEm5ffZmWUogsqRkt0sqDOGHRlyRt0jXR8U0ZkeoYZtEigMjuLtcvNhfLp9?=
 =?us-ascii?Q?Mpe08pEVBVgpKCD9lCxu/vDutFhRgIpfvlR7hQoXa2wwp9SUGHfk5nXJjuvr?=
 =?us-ascii?Q?PsHAw/e8eZASiK2CDe5Enua7ycbEX3ugn0xZKkFzsVR8VTjU9SetcX3emEes?=
 =?us-ascii?Q?kW3ZquuyhYPN0bVTxPqbRdpmXE0u2lbr69xSCDC1erkyEaOnxqvxeNF47kHT?=
 =?us-ascii?Q?Lru+OoGL5q0phLOKN5ZSaeW9/PA2Vgbn+S90Ff8GN9NN4uoWn7X7Pa3JSNG+?=
 =?us-ascii?Q?fu+QK5Uak0rLJRos1DC6cm59hYXybRJp3F2i/O/XhQN9vlFliH1PfaS0kZCb?=
 =?us-ascii?Q?vTNVJyf2blos2R8Zap4tcsDQefNeTw1yVqjAP7SlPyMNKpYjgQEpoPserBkG?=
 =?us-ascii?Q?xXWeK9mJnpvl18faL220ht8cN0etIFs9a8XOn1DQfviGgVBc213vIk2/aqDG?=
 =?us-ascii?Q?zsHsGz3dpYNJ+BuzpHzGgQa5tcCBrc+1d3rwVNEgzaw9/zCkdQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7SfSptHqub6K8c8Xeub9jwMkXkKGTlYYEQLl/9q5mZ+4jVte+77flDdMm0zD?=
 =?us-ascii?Q?ItrhmKy4Yx0ASxzjJCAceqSc65wfp82kijHmjie7atRFb/oq2xCUjXqQECe2?=
 =?us-ascii?Q?PvpDJVRCysmv1ZBCAbcYf7GFThr2egYl/DqJ+qXWIAzeXgoYQYYZTWoYRYHo?=
 =?us-ascii?Q?JhdZhkliqBF5bHhqnkHHHOi6v1dP5qSVmJodhMCCjwIpSkJsCZMSxvDyYmCT?=
 =?us-ascii?Q?/kQokqthRnZadgGnwENJTAtsNw77zNEHPFwUQK3Oz8yR9o74QNePNea5iA1E?=
 =?us-ascii?Q?9xs0ywxQHLnSaMIJ5n++nMQNJf6HEzHLoqEssaT+ZkPBcJiF/1miZK9cK97n?=
 =?us-ascii?Q?dWI1QHUhkJ4V6RgtLLFKCRDoURs0corKRIHExnj7crNjgq8UCx0gbYfbGsDf?=
 =?us-ascii?Q?AI5/EgPp88ZqiI2Zgvl34mJWaSBoXeujv3sDNlBNupt0Q9oPeI69KbWJU5yw?=
 =?us-ascii?Q?KAzt8gu8zTXZ+8FpuN4y8ujLAf3IROAl1GsGIOhAnOxmYzazQctKcbgepohQ?=
 =?us-ascii?Q?qJByDkOAG2MV2/5ONA6bGrG/cD2SjCdYB+Vku263rgFnjHw0Pa+eqxqshqv7?=
 =?us-ascii?Q?0UUDyon0yRNmzNr6kbKKuVyi48VE9pa627ImnrQ3T8QcEr6RblK60elJ8acs?=
 =?us-ascii?Q?Offb5k8xg3+k6ElJB2AIAQIattuVq7UVKCdz/6l0t8nOPUoQQ8YTZ3xB+r5X?=
 =?us-ascii?Q?WcPb9frWHW4/YvI1mR6exbHY29urppI0wygenHSllauBkgiOYzuNENHeh63S?=
 =?us-ascii?Q?NoPUmqJ2EzeXYmuvysRuC3BicHYAdn8Z3rCmjb51mXHOYxVaa7qP8iIoiWzN?=
 =?us-ascii?Q?S+oK4XR2XqqF36zQ1YD8uN3zz9ILXZLSZ7j9BQdu9h3kv96C8L0lGKWB8Cx4?=
 =?us-ascii?Q?5Lze/CwiYeiecKr1zEQ4ogci8i1xzzKOKNp4BL9Rl3TjDuLKTx+PHn6072PN?=
 =?us-ascii?Q?4kSWQP5jYyGb8i8G9PxxY3GfOp8ejK6mt/IxP1flOCsX49bRQeZajk2GtDYQ?=
 =?us-ascii?Q?ol3xA229knaalOnP/AYnxFbFCpTxH84JbI6NqXA8cl/mK482+1yerqCzJ/Y3?=
 =?us-ascii?Q?CbMHTHKfDTt46EKMiWT7l/CYgf8OZ1uGmQC+JtVdOMJ3x31QOqZIdC2bec66?=
 =?us-ascii?Q?ebjkgL/CCbPplUIhVLHlaeafO1D1ZuacFiOvfCWKt4HF74Go1WpnxunEihxI?=
 =?us-ascii?Q?d0gAc6m4JYDCeoDgrddlo3zz1lH01GM5HkZz7Esltm+D5KoQAJubNwIaXMHB?=
 =?us-ascii?Q?4dfR6wNCDnO06cOJxtveoZ6OoiKpQFf92yo6utQeU3N0oQpuT/mtiU0y9ff+?=
 =?us-ascii?Q?oCGy8QOlo8dr6xK5oyB1C0ZWyrDhcymBPfPL00ejotPgXMY2nJmRHwxadvLN?=
 =?us-ascii?Q?Cnjy5mCNySPAR/PeaVaO12WcSJUnLM+Q2zhjaCt5HAWlaEPTTIsIqMwgoHpK?=
 =?us-ascii?Q?j8o7oxJUl3GD//C3NYT2nc/qjJkgWSjP/n055fpLv0rfThtLYO224lWGXv6q?=
 =?us-ascii?Q?tKsOERiJEMCAM+Xgi3oJa9QMvKQGM570RHNJ19e4ICVD6oVEjFdiX1IG3jmw?=
 =?us-ascii?Q?mSGLVkijWj6gsKcPiWI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84fc77ae-59cd-4625-238f-08dcb2189a93
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 10:56:32.1924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8LatpNkJw/ALmqJcMrS4BFrDupX2XnMx58X31wQ+kGWZ6HqYIUQZfKBs9CuZQvgd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687
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

It's a typo and will send out new version.

Thanks,
Prike

> -----Original Message-----
> From: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> Sent: Thursday, August 1, 2024 6:48 PM
> To: Liang, Prike <Prike.Liang@amd.com>; igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: RE: [PATCH] tests/amdgpu: update bad length case
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi Prike,
>
> -----Original Message-----
> From: Liang, Prike <Prike.Liang@amd.com>
> Sent: Thursday, August 1, 2024 5:56 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie)
> <Jesse.Zhang@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Liang, Prike <Prike.Liang@amd.com>
> Subject: [PATCH] tests/amdgpu: update bad length case
>
> In the bad length case, when the header length has more than 4dwords than
> packet stream length then CPFW will pending on the stream data and raise =
a
> CP halt error which requires do the pipe reset. As to the orignal case of
> header length is smaller than PM4 stream length then the PM4 stream data
> may will create a bad opcode error which only requires the queue reset. S=
o
> for testing the pipe reset need to update the header length bigger than t=
he
> PM4 stream data length.
>
> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c inde=
x
> f675b97dd..503b68431 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -189,7 +189,7 @@ gfx_ring_bad_write_linear(const struct
> amdgpu_ip_funcs *func,
>                       const struct amdgpu_ring_context *ring_context,
>                       uint32_t *pm4_dw, unsigned int cmd_error)  {
> -       uint32_t i, j;
> +       uint32_t i, j, stream_length;
>
>         i =3D 0;
>         j =3D 0;
> @@ -198,6 +198,11 @@ gfx_ring_bad_write_linear(const struct
> amdgpu_ip_funcs *func,
>           * But the range applies to all asics.
>           * 0xcb-0xcf, 0xd2-0xef, 0xf1-0xfb
>           */
> +       if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_OPCODE)
> [Zhang, Jesse(Jie)

