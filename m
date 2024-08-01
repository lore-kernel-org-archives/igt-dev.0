Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232EBC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 08:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE6610E8B6;
	Thu,  1 Aug 2024 08:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uzIuDPsD";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A1910E8B6
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 08:29:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwpZRwWkS/PFMKmuu5SNZyJH0YBQ2whv32O33iJT/SeGOTXu8C3AeuEFNCDZA2g3H0FGegqlpgsOvNe7hmNT0UWQAHP09NXFGvzuc7ajarqTtTJCs2xgUoihWDWJa2v8zt6A7X4W61qpQRgGyWFaZyraZrsC6CdG8OcjHdGmwHQLzQT2DTyTuBT9wtfWoW0K8uRACpfIbPgX7o9FZJLIxrf7ELzmnwuaqK1FogxGBCPcWxFw+7zk0BYnXL1E6ulXh6IWVYlsUDkSt1XT7rYRIDSB/Gsb0eaFa3tIvQaSp+JTLnsTr2y2ZBGRhAk7uNx7KE/pdmBHiXnimhsBjFcX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1cFc2PsSI1eCeasN533RmUWIwf4gE4+4e1H1kpH3V4=;
 b=dcS09RRJwEhYQ65qQeY/7B+F/1Y7hHLX8p6Pwb6cETnz45UY4JABoXFBxzx5xdkfvTz3qTmrRUJwLeCIe1P1LO9oO/Rxp73gTdviXEoWJLe9PUE+Uc3w24z2DHMNqoGczfnEfS1pQLkS6LYHUK9yYs3d1khS/sq0q/RbqCymZ2fRhjGFPaBCMqZ5tJcndHxjz1fQtfzw+V1z1A/fNrAYmzJEP+UgOz15sT4TJVyLvQFD1rGM7nIgtQHNKpd1L56Ry9HQJna30HcFCJh7V/0XXDtY/hJO5zbrJ9nYK/Bdz1JmAZ53oe074o+VGpv6yMgX80zOOEellE3dLqryJF/4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1cFc2PsSI1eCeasN533RmUWIwf4gE4+4e1H1kpH3V4=;
 b=uzIuDPsDvR0KqzSCi8guS2wxapw8gycUn0xiHXduqN9IuD67KbQrrwvo0zkL1chj3YHWIuezvNVzohNajFisIN6AZEUZCFLL1BBTb4B5RwMEJDKQXY9WnTqbWY+0EXIAEbgB+T0VJGvc1W1tkLJSfAK5CRo0LWwswgHdNMO6MXQ=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by PH8PR12MB7376.namprd12.prod.outlook.com (2603:10b6:510:214::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 1 Aug
 2024 08:29:32 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%3]) with mapi id 15.20.7807.026; Thu, 1 Aug 2024
 08:29:31 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>
Subject: RE: [PATCH] tests/amdgpu: update bad length case
Thread-Topic: [PATCH] tests/amdgpu: update bad length case
Thread-Index: AQHa4+x4zQly1qepnUKqEoOGNDwbLbISEf1A
Date: Thu, 1 Aug 2024 08:29:31 +0000
Message-ID: <DM4PR12MB5152C489D1E7E771D44D24C6E3B22@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240801082548.2496123-1-Prike.Liang@amd.com>
In-Reply-To: <20240801082548.2496123-1-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=aa9aa2ae-34c1-451b-a736-3a933d0b4b02;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-01T08:29:25Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|PH8PR12MB7376:EE_
x-ms-office365-filtering-correlation-id: 66846b8a-f0b5-4501-b8dc-08dcb2041144
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0/fnlSp9lYDTYm1Il4iCJDGMtP4ApEP8t+dlg79hWyd9qwrt+TbUvKMSYHzt?=
 =?us-ascii?Q?mmUgC+NNfS/LTAzt1vj8m/bMBL+pPuixmhIQie8J1lY1IaElecHboAHhVzin?=
 =?us-ascii?Q?4BjG+mGvPUINA4vlHe/8Pu4DcKB6/fbKDCy7pG0QUimoyRAzdn+x2dQyUePJ?=
 =?us-ascii?Q?+ukvnDK1kTpB7PXLs93KDeICOz92PCgc0aGATW4LJQeebdnJJvObNJZD3w2i?=
 =?us-ascii?Q?UGUX8YF+eToNSTOapx/9mo97UuAIkXVApbaCZATIGiwGa36I4k5bheUaXtsE?=
 =?us-ascii?Q?kEYgyKhMdImUdp4ktf9PHRrGfwhpDZvqAzZqsat3TcW+hm4708jErlvn6yIm?=
 =?us-ascii?Q?bDjx0hjK1BAxSSPeY4+JF+ApC2qFZi7RgogARPX2p6LarFkG/yUPxCTrEQ2R?=
 =?us-ascii?Q?q6hKbrmXhaC6Kfl46TOUIfFC02WRx1gOm1s8jD/NAov0gB2IrCFMYyBWi2Al?=
 =?us-ascii?Q?QXtksLRXyvuQ6VnZtKKagsuGpT9MX+Rn/roQDoqipz7XOARTTU7Crb+I95yf?=
 =?us-ascii?Q?KNbXcAYPa5zOG6wd7nT0zb2cfpgM8HDgZ6Ee/A0kk2cvF2/5s7IXbLV68WtZ?=
 =?us-ascii?Q?5sA/eIiqrsnYm0kxBTef/kfv+zaD8UohZMCRG/QJMkfdTShZVt1EFcAlmRv1?=
 =?us-ascii?Q?x9A8zNcLnjK/x4svu4ddz5W24D94tVLHDpC5r/ZowgQWIa+jY3FkzCQNHPH3?=
 =?us-ascii?Q?hZAcF7bNKYPPWzYu6xNn6MEIRHe71AXjSRPfgwUCmInRwzPXjX0NMKN7JIyq?=
 =?us-ascii?Q?voqMzRjVIOh5NmhbCg9r+zuEtsm2uZmjNeh2VcdV/wpT2+kQoQtp8UmdYz7K?=
 =?us-ascii?Q?cnorU8WAh0xyxr60HAZJMd6J4gNyr3TRqtS4e/wnNz3NbNdh5n/yP73Lcc2D?=
 =?us-ascii?Q?+V6vDAgLlNkojIQR4XhnU/rEGq8+wCqTjhk1yeZ1fWv4oe9hfLXJunmk6HtN?=
 =?us-ascii?Q?J21hTi2Xq7w+6pbJ7uBuY8Ch+LnymzbvN+2ObfDfyQ4cB3+ihc+Ab11CDrQq?=
 =?us-ascii?Q?cGyRMNA6BajiDmkc1TKaLdmkQAhGIuin5qyekZQ8WA+cXuL0iedKzT20J7Hh?=
 =?us-ascii?Q?9jJccTJPi81pq8wUMzUV00qzGdBy5PihPeQf2wiN8xfsrQx26oa+h4ZUvuwj?=
 =?us-ascii?Q?fpCKw8ACT8FOqRwfmin0JqrLi8hW+2VmP0EAEqc59itmA/fG9kML+Xi1Pia2?=
 =?us-ascii?Q?Z5cjHR0HGJxnqT4TVTIWoiNJGJQrg4NOGmcWqiIj77h6BITbTEKYTg1ii0Vk?=
 =?us-ascii?Q?1lOfLmr5wGdENPV+h+u7UFZvz4qjYrdUToZlQrbEkvlc6daN5g5Qm1tOWiyG?=
 =?us-ascii?Q?iU8GPY0f864vix68BXqrW5KcS1BuwieX7NRI8Dg5eJs5ZJQmHOQwyvCI+uNy?=
 =?us-ascii?Q?M3aJMGzbdYq2v5t9xut7elYhIXfgORL6P9a6r2ppZJLbvYr5rg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DD2dgV6hCvlAkma/zQb0MsJvI/3AFEOebBSlBJ2V9zkOpAYFfypbqjSg6iJD?=
 =?us-ascii?Q?L2JWug8FH/bgjFh6Jq2cxFCfV76OPL1BuPl4FpY7suagTQ6ROZ4FIJexUG29?=
 =?us-ascii?Q?ensjllTicSdb8JQbBtIEqUljgmyP6Qa2QaNXcZVs/pdJDALCmKRjFAp6J7lt?=
 =?us-ascii?Q?qtvDBtnjPbJXFb0/0m5BP5fxUcqec7yDs2aXGaAF+SGmu+y/M8uEk9tTMaj7?=
 =?us-ascii?Q?CCGD4m7dqDqtuZGRWD/MkJyAJgEeA0PiPgq5UGxblPsgLrYCjutHujZeNsRx?=
 =?us-ascii?Q?JhAcRumAF1TgB2p7j1jX8MJcIJFE987Kb7Phm3dX5s3OtsU+IvmAJdEzFL8r?=
 =?us-ascii?Q?UFttvplXC8qyn0E1cN0rbhwh4iPhLL+Ec9dsQsPYRLwL9LBEH4A89VzRFkx/?=
 =?us-ascii?Q?V7HED/uiw0dwxpuCldr9Swu6FaROMtBqdPTBcx3WfrhOvrnmzZQaEdWcDfVK?=
 =?us-ascii?Q?YGMYtcIpGL9HP0Vug00DGu2ubtczEuMzwZlIV6SMJQN4y01RvJyT6B19aw+F?=
 =?us-ascii?Q?n625pcspLvkVj3x45HskYRHcj/qbgvGTEkVEl6XAzN5VGG1/GNxV9wNHRBMW?=
 =?us-ascii?Q?8/ZtsucHAYuSVAkCawVO62ZJW6OwEZkv6jU51nVHpYPDEkrobEZNoTk55Hkl?=
 =?us-ascii?Q?N67Zj43r8Cx58Hy1vJSDmTltV0+qS/Ma7r525Sq3ZhFrbhlSjg5k4GO4dmhX?=
 =?us-ascii?Q?M7VxElNw8dbgSr3iTv4zpNb+QzdTGqukGFmPjQVI9iawW8eLyunLXh03ibX2?=
 =?us-ascii?Q?ENBNnYYmmbmio744ResWdVjh/lfFJoEadioiqLPlL8GA52QPITbNflOA/V9J?=
 =?us-ascii?Q?XwHgMBRARQDqzMMwVsRCmnWUFYynQ8NruBQ/mR8xXa7mbe7uev9SIhl1XHGv?=
 =?us-ascii?Q?ba+UjMnzJaH8f2uJq63xv4CdB3eBazmMXtOaoJtXAhcSrNPmjrG4sDv4UqZM?=
 =?us-ascii?Q?GjaFtXzNWDpa1dpLap2kxbVVc2tvPUF21fvCPUkmo/k6Ijq3dIV1AT+vkP8n?=
 =?us-ascii?Q?RENnvUJFrLuy/UQitLIDKtVoBlZU20WXGKzQp30auj89nfSiSf7ARpunFAjy?=
 =?us-ascii?Q?b22We+i/lUwysUkWzj74MfopKIKPJCIqXOqYRVsG5dCCWBxe+z3splaxIWTm?=
 =?us-ascii?Q?Aqaglt9DBFHQUONk33sz5fAM2vLIbUseOEOHcjmgs1QrsDer5/XfRKt/tSHh?=
 =?us-ascii?Q?fCCiLjuhVcPPWLxR/i+kNOn/6Pya2lafEMH7lOKkU0uyRxps2PfIFTWlnGV+?=
 =?us-ascii?Q?TItnv8RRTbDA94an9wL6MpkckPmyPR3bqgGF7NwZJ4zgboDLYTsF+JOKffRI?=
 =?us-ascii?Q?Z54eqlWzuhKWE7+P0VNmvORN9PNtEKd93WBZwOX48ZESLpAfYmuYQRKtEE8z?=
 =?us-ascii?Q?tkUpPSOJfbCTcCCfHRHLV3BYDAyhMjmr0/MqJFhsSKE8Ce0HAeSzaq+zbKi0?=
 =?us-ascii?Q?COAqz6YyGt6my6Ay4lqVkcZkMH7MowUN4TVwwNu8abi76Lyw6VrEtfKIu+0J?=
 =?us-ascii?Q?Ngr0DaVTMNNGQqg5eZlh9TUSd1H5A2mlXCc8336nfhapWH6TWZ9QGz7s2jJK?=
 =?us-ascii?Q?1YfnFYnkKluz8QSCJBo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66846b8a-f0b5-4501-b8dc-08dcb2041144
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 08:29:31.8457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d1Yogdu+DIxOe8l5kRRgexYTmSbLJ6CTL/b3ZFrcKDG3fU/0CHEGG5pFNjDaDhV2+NpVxiuk/SdTGD+wHgoLpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7376
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

This patch looks good to me.

Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Prike Li=
ang
Sent: Thursday, August 1, 2024 4:26 PM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Liang, Prike <Prike.Liang@amd.com>
Subject: [PATCH] tests/amdgpu: update bad length case

In the bad length case, when the header length is bigger than packet stream=
 length then CPFW will pending on the stream data and raise a CP halt error=
 which requires do the pipe reset. As to the orignal case of header length =
is smaller than PM4 stream length then the PM4 stream data may will create =
a bad opcode error which only requires the queue reset. So for testing the =
pipe reset need to update the header length bigger than the PM4 stream data=
 length.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c index =
f675b97dd..edfd16e76 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -201,7 +201,7 @@ gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs =
*func,
        if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_OPCODE)
                ring_context->pm4[i++] =3D PACKET3(0xf2, 2 +  ring_context-=
>write_length);
        else if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
-               ring_context->pm4[i++] =3D PACKET3(PACKET3_WRITE_DATA, (rin=
g_context->write_length - 2));
+               ring_context->pm4[i++] =3D PACKET3(PACKET3_WRITE_DATA,
+(ring_context->write_length + 4));
        else
                ring_context->pm4[i++] =3D PACKET3(PACKET3_WRITE_DATA, 2 + =
 ring_context->write_length);

--
2.34.1

