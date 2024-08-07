Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6E7C52D6F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Aug 2024 01:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1241E10E0C0;
	Wed,  7 Aug 2024 01:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iNSpqa4G";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6490310E0C0
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Aug 2024 01:06:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyB3gffENw0TRfvS7Lax29Hgo45o17Mji/UDPLk1Nq6mLfJ3i/CdRPQNxh9JgMBs+MEaeqWf/C5N6QUJ1Y6qIFp+K16g/G+d70AVh++1pMTJ09B3vqPmp5kz0VFlO08Mszy4sOqZ2rP70o8x+TD07uuCJzHTA5F6daqWCYn720xPHDhLWRSBnwovkmTr6qx6LSqJi3aZPayJXKBKYyx9ZzGIdPkWNwU7CQ3ai2MgBjZyJPU/3kqluk78fok++xN4orrLeUQFbPROJ/YHWAUjWBJnrtyYJuALZLnUB99jzTZUFkY9vTt7/BRjWLRCZhbeLYicbZfo/zlMu9DVfgbUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpKKgOOvEb1xzQjrrNb8P4dk0tB/D+hX+Qi4WCmKrqI=;
 b=A3lNbSfYCVVwIKNDWXUZ5y83h2RrErpny6TsGX/iw0lx0MYgUauyiduBTSaOjLB4CqktJmr3sEw+P05Mj2leO0MR8+Ls4aGtJde/sfr/ZrpmVuTgfgYgaUlucyCbzhaBtUGHjO2HlYMXnVFNK8RUIRfj9lbUiksg9rUXd5AvocgniefqtOUhsdWDMlHGH4hGijyWwD07mgHaZ5guYh0PFeI39LlzekKT3xKnQ0G4u9ooYXUaKCamWYKDoRktnhOqVBdm1jMYm36lN8hfPxb7YaT5xcfQTCdwk8QKR9L2SUj+aaQcSseGIDqpkWtnPZRQBT5pNY/oUP48w1/TNDbPBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpKKgOOvEb1xzQjrrNb8P4dk0tB/D+hX+Qi4WCmKrqI=;
 b=iNSpqa4GbG1ZrYoaFMWoOQzlY2Lov2+mlKBY4ttw+rGwoDUrlz+b9cPH4jTbbHhhmYVSAYPW+QADJAZptou9jf51TXxpCXO9T1frFXDOV2bhJ+QyqzXIyibFbU98wBeeOPB4OVS5m5gyPBsK7/I+gu6Yk6XhR59D9rrakbhc3tE=
Received: from DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) by
 CYYPR12MB9014.namprd12.prod.outlook.com (2603:10b6:930:bf::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.13; Wed, 7 Aug 2024 01:06:51 +0000
Received: from DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::4dc0:f34c:9e7e:ccb]) by DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::4dc0:f34c:9e7e:ccb%4]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 01:06:50 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Zhang, Jesse(Jie)"
 <Jesse.Zhang@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] tests/amdgpu: update bad length case
Thread-Topic: [PATCH] tests/amdgpu: update bad length case
Thread-Index: AQHa5AHp0R4W3cfVK0WZ8rPWj0mcIbIbAw9g
Date: Wed, 7 Aug 2024 01:06:50 +0000
Message-ID: <DS7PR12MB60050E9E343F11B751C36AFBFBB82@DS7PR12MB6005.namprd12.prod.outlook.com>
References: <20240801105925.2523913-1-Prike.Liang@amd.com>
In-Reply-To: <20240801105925.2523913-1-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=60a05d89-6471-452c-8f3d-48dac4d88ecd;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-07T01:02:55Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6005:EE_|CYYPR12MB9014:EE_
x-ms-office365-filtering-correlation-id: fa761a6b-4b28-4b74-43e9-08dcb67d3829
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4Udo6qby0hXj78AXJrbVn/Kqiv9aH0qq9J8mHkjMs+PEhZ4dGZTJE8GV4EoV?=
 =?us-ascii?Q?aLvnB/VofvRy+BHPuIoxXR03vKBwiY9Y/x3dRhAyYNN5zrvmHaC2RblgQUEi?=
 =?us-ascii?Q?A0Z0JKe/UP6k773g/X+EfSTyp5lfpKvowkQ+j17P0/5vE0SW8QGVQNriUhA1?=
 =?us-ascii?Q?eL/d84Lb9Xq+xTaMu4qCUciI0dAOeUUf5mv4RxW8Jo7fGpSOk7eF6ri4d3C+?=
 =?us-ascii?Q?dl1rHG7kNnomh8aC3ZElfMK06zA1UfAMN5WAuo5mvO1wHvyGrCX60BUh4dqb?=
 =?us-ascii?Q?lzxPkRVC7tMBgQE+wlPySSrYvx5y+1vXS6Meg36AJvf15ljSLLKs1WfobfED?=
 =?us-ascii?Q?QB6GTPnHf7SAMUlyY3EyE+faJsCyyZrDuqrwEmu7XF4trv8U4Tc4ZHT/XVVw?=
 =?us-ascii?Q?lNjVHOoYNglzFQMiXDjRa0MR6t5YEmptRsqy3w5tmVPRyxdy0wxaxXjgYbRX?=
 =?us-ascii?Q?PyntVmtD6jviqGZSS+yYx5EQ3Xu8K2VYhtagdjzbYtymRDKwM1n0XCEAi51Y?=
 =?us-ascii?Q?uMMPuiZlcqcyVvIVDbnC9zN9MFIQt8Kh21QzkkOG0Vv9E2O9axcQS79aTDMG?=
 =?us-ascii?Q?zF7g/qTLSETIy8B0JvySwedvCQI7corCrlMbqhifHdEZcgrQGz3u7OerKHfO?=
 =?us-ascii?Q?f7BqS2rGXx4sPg6peWdfhHxWXjttQoC0wrLrGYwgKNuWyjkiV145FIiM12IZ?=
 =?us-ascii?Q?CXc72uy7uTmHRkYbM/kyTR/HoAQLaefWmTorfKWNrd5o8JzfsrzPv5/cw9T1?=
 =?us-ascii?Q?2NdjIGSa5qsaa/uHXDfEvAps3VBOjmeft5GYAk9A4I50HYsvj26xnYmhth7B?=
 =?us-ascii?Q?3L2RIpgk2cwTarW693CfEKJT9lQWwcjTqD+CF9SytO6RjbcRd1M6QoQa+4VR?=
 =?us-ascii?Q?dhkqTXR9FJqGY31xzUssoZNUVsGa3WfcIFJU48jMuhFwk/MRGz1SYWKB1Qkg?=
 =?us-ascii?Q?iWg6mmC20B0h5fDZh8xJshDFxJeVeA+5ZhY/HYUH72kXjq1U20WEupZs95rZ?=
 =?us-ascii?Q?KX5sont0+QKl+B6YlQTUQhowzEiWem1E/FyK90kTmu+ma0yc1l1l2zGPAlh5?=
 =?us-ascii?Q?rFPRh8R49Eta4lwQnjw4tpJ2HwOAXiR2kPFPWTfWHS1fGDPKut0gg2L2MT+f?=
 =?us-ascii?Q?mwakUV6SU2T60TRvfr8Y9+vsx8r1L29sfaP7NRly/udfYa82R1OTEZfsxzPB?=
 =?us-ascii?Q?GvHpTxtXNjMm040I/d3/QdpQwQ9nUjk0+fnL0b5XvWwX4AZLyjnee2I7dOj3?=
 =?us-ascii?Q?+01di6Alqkusx/JnPTYJlxOtTXwIuK9YRb+VGJK9xTHfHXXe67TCMHPvHReG?=
 =?us-ascii?Q?EK/OEegtihDwQa/Uh6sirRm2LsS9q+FLPiw/L3rySc3b2Q2UPNJR+hC9ua91?=
 =?us-ascii?Q?dP8GvGxtF6xkQR0AcQI2RO4bLLaJ6UG/3yeqY6II5POMRtOvrw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TDn4VyVEk4hDXmypdN9wTEdE6eY/YrvRkkrlS+QZMWJrgdN+UdACcy5zWdGo?=
 =?us-ascii?Q?gCHVphvzP1axlCxzoeDgdgjRmK/DFcraBoEiudi5n7zfM1GfhO945kxNP9hP?=
 =?us-ascii?Q?kFgyIuztAa25zh/QdsQyvkCjGCSZJc3td4pweGGWIlXoqgfh65Ns925kl0eh?=
 =?us-ascii?Q?LRPh1uG9ke7V4GfS3OmJyGyMqFq0pAkRCNNkY1kkkC3oR4GdVSSmiclOrMHI?=
 =?us-ascii?Q?JxG6pEvBT/HvLxhU+vrW5hxrDy/naK7sbOqnTJIJOe+Fypio2bZ5Ms7QBiY+?=
 =?us-ascii?Q?19G49opp0nvU6SonokEU5WnKH8+JcnmcucCQsWCBKaP+YqjZipRSSpvqMzmF?=
 =?us-ascii?Q?uNd1hXon0GbHPjsqJkV79KmhVLQ7yOFLrXRbLghiBu3Fmzjsr9jpEpEZvIuM?=
 =?us-ascii?Q?bmuIzB8oWLJ8eAhmPL82Hz4/ofsverTiuPvaJkaQzgqoXpDjQ+HNycuuPLV3?=
 =?us-ascii?Q?zZSVeqPX31OsWzhGHa3ouFxjwu1ELJC4Xm/inYq8OcGsD+2bgcaUJVppbkL5?=
 =?us-ascii?Q?J/1s/EXGQJuDWXr1rLHiqcFckqHGoLPN0eQwI5xOxIhob/CmQIaC5kmgHk0E?=
 =?us-ascii?Q?RMvOdHDXAbFeLquf67EeWPIIYt06lsh0DmrrMD8CEBD11St1BgEIkB+nB/L/?=
 =?us-ascii?Q?pa0O397W7CrgQY5Rd7bQfd2fBLFjoQ/mRolYk4ZWbca8TIz4E07+GZVX1zct?=
 =?us-ascii?Q?k951/z7sUuG58zV/oZFxPqWnuo68TLovFQr9GQL/LAe5NQkSHQ3kHez5Ws+I?=
 =?us-ascii?Q?Mck+Cq0WcsLM7HKVXFKk2ETKOyEnqq9FXZIyzbqCsE9aPO1suvneVGUqS9LP?=
 =?us-ascii?Q?gaKM8YU95dxLdWKG5srByn0Y1qdNJ+JNBi4yHMciUWxqd4vCr7/NCg9c7n1e?=
 =?us-ascii?Q?TBnxHNBPR88IeEkzVYhnP8heHOVMBr8Dd/fR/7uxb2UESJFdHlZc415ojS/d?=
 =?us-ascii?Q?brxwL+KDvKhzOWEZcVtXs7KCUfI8HEDQuefxBAOwcXvuG5SMc6H8/PkZShpy?=
 =?us-ascii?Q?QSjqPfmuAhAHvHRHa6AM2KqGSzXw9gSnGYjOSOMSunu36HWVOSwPVKstOJgQ?=
 =?us-ascii?Q?S0RddKxZyYzmjQxejegy7zNLBen+zK7VRPSMStMaAiifPWgIb/ij6nB+W1Jb?=
 =?us-ascii?Q?HLI5Uwu04VL9rbOKVO7dNvuvCcU73GG55zEd1gVygG5t40SG8rf1pVglr8Am?=
 =?us-ascii?Q?xOUDtUX45SBpI7R2mHYcZsLo0l05h2Fc3ohtIdefTjWRSRmu67gYI76qBOCK?=
 =?us-ascii?Q?VhxTHGAl0sHMQQX+wHwDM2E/ofTTZg282kCq2A72tQVCEqSFdlxBazUUi1OV?=
 =?us-ascii?Q?b4302p7+JNUnCxnabXTGNnCvWUmF85ab/+3hV2yRvnfLGVnuYW/4RzO/DRTg?=
 =?us-ascii?Q?a8O3SXlSwHff3ut4GEFNpHajJmFS7MDMW4UfR7Lcb7MvB2EIuAba3Jfz1Lrj?=
 =?us-ascii?Q?D67irXH7hSE5IDuamCelFCJPEbumpgHxAvw7/VYc/QgHl2E9MT7M9p426CZR?=
 =?us-ascii?Q?9T/6XctB2rsIFOZ69MovD/47XrsDFgqrb07OaqWtMmUgRjsVIKd8OaBbeRR1?=
 =?us-ascii?Q?8TtmNdhnT0cZSyYUm/M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa761a6b-4b28-4b74-43e9-08dcb67d3829
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 01:06:50.9070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GlOTWYGyL1i2Z6YSGoz0ZjpTMsDUgkKdMAJQ754MIc1PhwXcj/f0b3d4QdheY5WZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9014
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

Ping for the patch.

Thanks,
Prike

> -----Original Message-----
> From: Liang, Prike <Prike.Liang@amd.com>
> Sent: Thursday, August 1, 2024 6:59 PM
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
> f675b97dd..3ffacc065 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -189,7 +189,7 @@ gfx_ring_bad_write_linear(const struct
> amdgpu_ip_funcs *func,
>                     const struct amdgpu_ring_context *ring_context,
>                     uint32_t *pm4_dw, unsigned int cmd_error)  {
> -     uint32_t i, j;
> +     uint32_t i, j, stream_length;
>
>       i =3D 0;
>       j =3D 0;
> @@ -198,6 +198,11 @@ gfx_ring_bad_write_linear(const struct
> amdgpu_ip_funcs *func,
>         * But the range applies to all asics.
>         * 0xcb-0xcf, 0xd2-0xef, 0xf1-0xfb
>         */
> +     if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
> +             stream_length =3D ring_context->write_length / 16;
> +     else
> +             stream_length =3D ring_context->write_length;
> +
>       if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_OPCODE)
>               ring_context->pm4[i++] =3D PACKET3(0xf2, 2 +  ring_context-
> >write_length);
>       else if (cmd_error =3D=3D
> CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
> @@ -223,7 +228,7 @@ gfx_ring_bad_write_linear(const struct
> amdgpu_ip_funcs *func,
>               ring_context->pm4[i++] =3D upper_32_bits(ring_context-
> >bo_mc);
>       }
>
> -     while (j++ < ring_context->write_length)
> +     while (j++ < stream_length)
>               ring_context->pm4[i++] =3D func->deadbeaf;
>       *pm4_dw =3D i;
>       return i;
> --
> 2.34.1

