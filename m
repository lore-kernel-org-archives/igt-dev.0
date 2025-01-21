Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4603EC02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 04:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAE510E4BB;
	Tue, 21 Jan 2025 04:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ydWAuQRx";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2041.outbound.protection.outlook.com [40.107.102.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A36910E1C3
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 04:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A28pGmfh+uru86wvavVln7fJMH7LpIvDS57gNS7Y2HlIN0TCxgwxMCKOQc2zN2KFWAu0AojNqY4IyC4LRsw0cJ2PQvQgZ65KJVAVzw1H9uF+lGv6fsdA6goempDmNhpp2FHPXjsYJQBaQaKSq+Z0qYyfaIvVLn6Sdq5Wi934CkoJvJCwVDV6YlvWSsHjkiwrqHS0tnc7kAWXlZzYdsFqIqztLrK+J7m3+1Xf479NDeU6wCR/Y4VSlPHoxZxY+ry/9246lWQlzB5igxQT/T2y3K9C17dHWfAT5NntXUduAZ5OYHGo3YuM3UjwSllk3tj84RQxuf75RjUE/lzRcT07mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVT/uDiIjiGd7DLTxLMEF54EPXTYXNWQW4m+1oxwZ2E=;
 b=pwhnoex5fLxgKPI7MIcT7mxROCWeitalTt6EPlNIaC+QppvtaAOPrzX8ph47d3tzTvSuT3q8LanyfyRm4vuNfFXKh6CKmbKTV7JYo2UsbFqzDG2zZB/NLR9uK7XZ3OJwLzH7ha5NIfgZ7Pf1PI1pQeqX1byLIxir/wIU1mK5tK/P1r1ZCh5O2PMQ3dEQAjlq3I/JG9eljQVJzKhJpPUEu9uz9LFVE/93RA+/m48teKFupdEwhTYKpV3TiCXvdEW2blTyx0uR6l18mWlvVlVBSkoxZX1VaYUvwtcBYqHGHtyxwKHGESHiNqHqcE1SXhEEm562Lf96kUwqQFKjPnJyZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVT/uDiIjiGd7DLTxLMEF54EPXTYXNWQW4m+1oxwZ2E=;
 b=ydWAuQRx4BL0Gq7xgxbviGAI+G9fYlwdevrS6z2LKaC/hbjtwqCHYw/A5gOswC7tziTa7dk3udIExGsfkBTFFo5CQu+7HLUYDmDrNXns+XxCVjz938wpM258hajQfXDuv89th5CSAao5tzUf4g/zYcvuJxolpb6sM2tj5soLM8w=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by PH8PR12MB7349.namprd12.prod.outlook.com (2603:10b6:510:217::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Tue, 21 Jan
 2025 04:54:24 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%3]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 04:54:23 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] tests/amdgpu: find PCI bus, device and function and use it
Thread-Topic: [PATCH] tests/amdgpu: find PCI bus, device and function and use
 it
Thread-Index: AQHba77H1dCGogbRykmBzexsN0aDWbMgqXaw
Date: Tue, 21 Jan 2025 04:54:23 +0000
Message-ID: <BL1PR12MB51443EBA6963B8DF75455F3FE3E62@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250121044025.167761-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250121044025.167761-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=b2482df3-9f8e-4606-8313-e0079c0b3cb3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-21T04:53:55Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|PH8PR12MB7349:EE_
x-ms-office365-filtering-correlation-id: c9695006-667e-4ffb-ddf7-08dd39d7ac98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?k9YeELeZaPoumxgMulBk8ylNTbRP1DYFrq2/bajSUX88S0ZBkOkw6qpstCyx?=
 =?us-ascii?Q?+dWTcYLXJURfdGLQ6nNWKGRfshcHziTT6fZVy+6aYj1UtNxVKZQrAs/V5X4U?=
 =?us-ascii?Q?jvKhST1i/1ssfOr67UR/PoHnz4T6yPwLtJ4cEfSmlRtLnIIQakzZlkovhYZg?=
 =?us-ascii?Q?0fuDVZct6Yov6vGJt0GxHr+pkG8s1UOAcaRijaVEpNXrod7nYBu6LJx3cpBE?=
 =?us-ascii?Q?qdB6M7JOuWbwo/fJ6X9DxJ3RRwaTzGqIcmCR61q/4jiinTtg2P5W9hWo39s1?=
 =?us-ascii?Q?iIe9VIcp5HG/ml3AgkA5x8aEnYQzTxQRaeSGZZfihqpPf97yv4MLB+qWQzeo?=
 =?us-ascii?Q?XOxfcu+Dla6yAx1LFNLnP4nOmV8yopWWF33OkI7mvMihM/X+At7KjIjoOa4/?=
 =?us-ascii?Q?SE5HmDsRVBqeh91ZwG4k8prwFkFwOQ2aqJS33+rTyrPV6St0lUUxL6xD6wL1?=
 =?us-ascii?Q?OYjSMtlT6cAQKZJ7OLgE6k2fQ23fkroXLGpriIJcn2WwkJkl0/L2NcOEbMtS?=
 =?us-ascii?Q?sHJls5mR4WlyYBNyKCBOcXUOdeGaBORJiahNk9o62Mqm5b1LEMscoD6J1x7Q?=
 =?us-ascii?Q?GsnSvd9+jQ3UnAHoec3gW1HGW6zmn77F4xty0RiovD0KdWtJU+2Q09ASf8ZY?=
 =?us-ascii?Q?HgwGvq0uL9h53yzf8wXf4xs62fH//8cvqAGJ/obSJgRR9VI6wJk7U3TX5hYU?=
 =?us-ascii?Q?Ms0FgCeuz29VoudKovURBrpbrFxlU5lND5FcIat6oZgGAB0JB/H5rHiJZOI+?=
 =?us-ascii?Q?qciSkwOGdlfb+xCYj7E+R5tcQXpKkqGQbU/r5G7W3A9D19aub9NNzTB/wMSF?=
 =?us-ascii?Q?J+1ou40rGufPjiT/XT+ugGufLJqYxIU0stEzhCr/hQfP9r6LHcgUWq5BYXUB?=
 =?us-ascii?Q?VKN4GpS78UQDKz+HWDSADZU6hdDBK53RMC+6O2I/dkVZk3UBxMXtLtQXj6b4?=
 =?us-ascii?Q?EgG+1YbFeMPCahqHt1xBGvnFAsakAFLu2UrNGwtlK4OrEhdxS85kKSd1G2ps?=
 =?us-ascii?Q?zi0qEP6+OcDRpbn8I7JivbWGVg2mXuXxvQzAuh2Z7Lxh60pvLmc0sN/CUhAu?=
 =?us-ascii?Q?JkYkgJTkRhuYOf7Lm5ZBjNrQn2IWFBDDi4YRFH3Hi7skEGkUuaHjfOB0A5W2?=
 =?us-ascii?Q?+vnGNUnQRtXH1pNqyRansOAyvaIRwIYVXPiOuSvjvOR1rOcJoD04OQjeAszW?=
 =?us-ascii?Q?5TLuVgNTLpqjHQpoCrkJDzg8gCuwYvmkBsOT1sKG6LE2oXUe/nSpENeby7UE?=
 =?us-ascii?Q?OWWw3AWE7xbSF1nfzwztuamnV9P/kuMnjHqYY+6K8/BHxgUP0R3BYfjEPuR/?=
 =?us-ascii?Q?kHebW3T/xYYinLyLSJ7sjhYaV5XYa6cx1vZNVhMzcliXLDV7oscqdnH22Q4k?=
 =?us-ascii?Q?T80Jgnsmtpx/lfE/GHCLVXYrXvhO5QJtpbHAMUblCvVSL2ptfKX5/eSakWDd?=
 =?us-ascii?Q?zlxNoej+iajqwaERJby9rW94kz8mXbMS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bfZ82I2rt8uOzVdFIbqPNoJVQmMRUf6Nuig3dc64E7vkgv5BMkdftPFnixmo?=
 =?us-ascii?Q?tINPsSI6uUus8cIDFXzrmG1xXNFM2r/LlkCJhm8hT4uzINHW5J2Naf3hcznP?=
 =?us-ascii?Q?20eA0cQrqj9hHsc8lb/wnEG82fUQbBB9M2JUaxwhm8NZod4VHhdLC+DKPvAg?=
 =?us-ascii?Q?D/mC6x8piTyMwT7hPKbuyGs/3ig43anlMJV9yFRQOqnrldBzlF1iEYV7c02u?=
 =?us-ascii?Q?LYGOOR9yf9CJJfIi7V3BCtywGeXKBfrS/oQCXQvWCgbb0/e92iKr+EbK/Pw9?=
 =?us-ascii?Q?koBbvIVszpu8j+v+mq4KKS/saMu0XTKU5+A/9sJnBy/bb03v20wlbufSK6bh?=
 =?us-ascii?Q?k/hq8Mkth8zc4g6HA+v8hiXudAh9Z8f8llz7zFKBvonuaqeqC+iQyAncyKDP?=
 =?us-ascii?Q?jYv0idU+av4OCW46p9gJv1iFyR3ywknj4A2gU9elf+Vq/YjFMkaU9RgjncR9?=
 =?us-ascii?Q?Vhx9W1RxGmOvxmPVdNtfkyQV0JOBjt/6ASGs3n1PAZWRCcfg4iLsNsqfPO1a?=
 =?us-ascii?Q?EITR63pCSbQ/X2HF5xIm46jzjP11AX7BpftKZ/7S/Bfz9ay7cnCchF9QdF6Z?=
 =?us-ascii?Q?j4eu6IN1SYpeirC+mgel4MH9Bej4ohoyK6xLfkjD3+EF0Cg9abfahb94l1pi?=
 =?us-ascii?Q?D9brdFoPshAwrcURI/SsNO+eiHm/B5F5ZO2U1X0giUCorcSv13pF+rI4Ctz0?=
 =?us-ascii?Q?nKO47eImrLdX0Y5sirMQ/q9bKw/3MQpRg+0FJMKrptBR3XsADCag+8CMVX3z?=
 =?us-ascii?Q?J5NI0YAo6F/n6Ev3Sz/N7CtifTwrnoZu9CNxF9+WFXTXt6x8CFZiiXvShk/v?=
 =?us-ascii?Q?OJnXA+NdgOwMIHvoxAdksFraiNYzvWZzJlarEWjKJiuIkqwWYpH5gEO5Vm2o?=
 =?us-ascii?Q?L4k2P22dBnmOvF5EWNbz8Z0Vlkk/AIHuWNQ3vkQok12her7etrX3OPZKJQHg?=
 =?us-ascii?Q?71iVUZwIF+qf+v6LPc4WpA7KwX0L8mpuSWVSUnOhfToygpsZzeim3NImoehR?=
 =?us-ascii?Q?CERfHhO/Q30iTAuZWmCSnQ3zwblXtLrk6MM4sfoynLiCXe2MjnkUR5E4GPto?=
 =?us-ascii?Q?jCur5QmOkh58SH6hUU7dsifiPMEvPOpVQjM2/6a9Mvpa+eVrb/f4yqRUDBeC?=
 =?us-ascii?Q?cyFeS6JLGddEXrGhoSVhELNLxslAzrglN/YV44HUfsOU/sMvTmrk9agi+eY0?=
 =?us-ascii?Q?fxI72XCehtcjwbVfvArxyCHAXCv5S+GPX+3CeyVI5uHGhYLsYKIrVeaEOpgw?=
 =?us-ascii?Q?wruscQWGqWx/ZjdrQ/cvUo3aIElkDsZpxIWta79niXIzTFit0YSNafoHb2Mz?=
 =?us-ascii?Q?zRZantkw5Iog8NoOhMe/8YZoPJoUB0jt5MkdTz4Nd2EFcbli/iG0euBxuLMQ?=
 =?us-ascii?Q?DL7jKTFzPxBS+AN/Hatu7YWbdRQMkMPlQUv7xLDdIrrBDpEJIQ4uZOrV63cL?=
 =?us-ascii?Q?Zp2NoP9Jkhw0N1Dg2nI5+Z0fqnLW/g9dnemnQJYm7FrgJ08s3mUdxtKHEbZN?=
 =?us-ascii?Q?ci9r+ijSmXudVLf8McO6LCKNVAgytjctWKHLNDCwstz/GCtUuIsFa837rt8A?=
 =?us-ascii?Q?sUj+9W0dvGzcYVuZaGw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9695006-667e-4ffb-ddf7-08dd39d7ac98
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 04:54:23.2512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMXIxL2sfVMtD/IsRhesvZCGVEs8DVqQ73o6EKLSXGKiZxUoFmHHlUnHM2X8IaaDi4hOzAgBFTeCLEl4xE/Bgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7349
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

This patch is good for me, and
Reviewed-by: "Jesse.zhang@amd.com"

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Tuesday, January 21, 2025 12:40 PM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Koenig, Christian <Christian.=
Koenig@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Zhang, Jes=
se(Jie) <Jesse.Zhang@amd.com>
Subject: [PATCH] tests/amdgpu: find PCI bus, device and function and use it

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Use the PCI domain, bus, device, and function ID to determine the required =
path from the file descriptor. This is utilized to check whether the GPU re=
set mask is enabled for GFX, compute, or SDMA rings.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c     |  9 +++++++--
 lib/amdgpu/amd_ip_blocks.h     |  2 +-
 tests/amdgpu/amd_deadlock.c    | 18 +++++++++---------
 tests/amdgpu/amd_dispatch.c    | 15 +++++++++------
 tests/amdgpu/amd_pci_unplug.c  |  1 -
 tests/amdgpu/amd_queue_reset.c |  6 +++++-
 6 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c index =
9749e2072..2b1b84414 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1004,7 +1004,7 @@ asic_rings_readness(amdgpu_device_handle device_handl=
e, uint32_t mask,
  */

 bool
-is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type)
+is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type,
+const struct pci_addr *pci)
 {
        char cmd[256];
        FILE *fp, *fp2;
@@ -1019,7 +1019,12 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint=
32_t reset_type)
        else
                snprintf(reset_mask, sizeof(reset_mask) - 1, "sdma_reset_ma=
sk");

-       snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/0/na=
me |grep -oP '(?<=3Ddev=3D)[0-9:.]+'");
+       if( pci)
+               snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/=
dri/%04x:%02x:%02x.%01x/name |grep -oP '(?<=3Ddev=3D)[0-9:.]+'",
+                       pci->domain, pci->bus, pci->device, pci->function);
+       else
+               snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/=
dri/0/name
+|grep -oP '(?<=3Ddev=3D)[0-9:.]+'");
+
        fp =3D popen(cmd, "r");
        if (fp =3D=3D NULL)
                return false;
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h index =
dc4d87151..595b2b16b 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -233,7 +233,7 @@ void
 asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask, boo=
l arr[AMD_IP_MAX]);

 bool
-is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type);
+is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type,
+const struct pci_addr *pci);

 int
 get_pci_addr_from_fd(int fd, struct pci_addr *pci); diff --git a/tests/amd=
gpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c index 29b7ae509..472f28e68=
 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -76,7 +76,7 @@ igt_main
        igt_describe("Test-GPU-reset-by-access-gfx-illegal-reg");
        igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access") {
                if (arr_cap[AMD_IP_GFX] &&
-                       is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_Q=
UEUE)) {
+                       is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_Q=
UEUE, &pci)) {
                        igt_dynamic_f("amdgpu-illegal-reg-access")
                        bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD=
_REG_ADDRESS,
                                        AMDGPU_HW_IP_GFX, &pci);
@@ -86,7 +86,7 @@ igt_main
        igt_describe("Test-GPU-reset-by-access-gfx-illegal-mem-addr");
        igt_subtest_with_dynamic("amdgpu-gfx-illegal-mem-access") {
                if (arr_cap[AMD_IP_GFX] &&
-                       is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_Q=
UEUE)) {
+                       is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_Q=
UEUE, &pci)) {
                        igt_dynamic_f("amdgpu-illegal-mem-access")
                        bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD=
_MEM_ADDRESS,
                                        AMDGPU_HW_IP_GFX, &pci);
@@ -105,7 +105,7 @@ igt_main
        igt_describe("Test-GPU-reset-by-access-compute-illegal-mem-addr");
        igt_subtest("amdgpu-compute-illegal-mem-access") {
                if (arr_cap[AMD_IP_COMPUTE] &&
-                        is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_=
PER_QUEUE)) {
+                        is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_=
PER_QUEUE, &pci))
+{
                bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADD=
RESS,
                                AMDGPU_HW_IP_COMPUTE, &pci);
                }
@@ -122,7 +122,7 @@ igt_main
        igt_describe("Test-GPU-reset-by-sdma-corrupted-header-with-jobs");
        igt_subtest_with_dynamic("amdgpu-deadlock-sdma-corrupted-header-tes=
t") {
                if (arr_cap[AMD_IP_DMA] &&
-                       is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_Q=
UEUE)) {
+                       is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_Q=
UEUE, &pci)) {
                        igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-heade=
r-test")
                        amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_=
HEADER_HANG, &pci);
                }
@@ -131,7 +131,7 @@ igt_main
        igt_describe("Test-GPU-reset-by-sdma-slow-linear-copy-with-jobs");
        igt_subtest_with_dynamic("amdgpu-deadlock-sdma-slow-linear-copy") {
                if (arr_cap[AMD_IP_DMA] &&
-                       is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_Q=
UEUE)) {
+                       is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_Q=
UEUE, &pci)) {
                        igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-cop=
y")
                        amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEA=
RCOPY_HANG, &pci);
                }
@@ -140,7 +140,7 @@ igt_main
        igt_describe("Test-GPU-reset-by-sdma-badop-with-jobs");
        igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test") {
                if (arr_cap[AMD_IP_DMA] &&
-                       is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_Q=
UEUE)) {
+                       is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_Q=
UEUE, &pci)) {
                        igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
                        bad_access_ring_helper(device, CMD_STREAM_EXEC_INVA=
LID_OPCODE,
                                        AMDGPU_HW_IP_DMA, &pci);
@@ -150,7 +150,7 @@ igt_main
        igt_describe("Test-GPU-reset-by-sdma-bad-mem-with-jobs");
        igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-mem-test") {
                if (arr_cap[AMD_IP_DMA] &&
-                       is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_Q=
UEUE)) {
+                       is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_Q=
UEUE, &pci)) {
                        igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test")
                        bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD=
_MEM_ADDRESS,
                                        AMDGPU_HW_IP_DMA, &pci);
@@ -160,7 +160,7 @@ igt_main
        igt_describe("Test-GPU-reset-by-sdma-bad-reg-with-jobs");
        igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-reg-test") {
                if (arr_cap[AMD_IP_DMA] &&
-                       is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_Q=
UEUE)) {
+                       is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_Q=
UEUE, &pci)) {
                        igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test")
                        bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD=
_REG_ADDRESS,
                                        AMDGPU_HW_IP_DMA, &pci);
@@ -170,7 +170,7 @@ igt_main
        igt_describe("Test-GPU-reset-by-sdma-bad-length-with-jobs");
        igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test") {
                if (arr_cap[AMD_IP_DMA] &&
-                       is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_Q=
UEUE)) {
+                       is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_Q=
UEUE, &pci)) {
                        igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test=
")
                        bad_access_ring_helper(device, CMD_STREAM_EXEC_INVA=
LID_PACKET_LENGTH,
                                        AMDGPU_HW_IP_DMA, &pci);
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c inde=
x 23d07561c..26b179f35 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -78,6 +78,7 @@ igt_main
        int fd =3D -1;
        int r;
        bool arr_cap[AMD_IP_MAX] =3D {0};
+       struct pci_addr pci;

        igt_fixture {
                uint32_t major, minor;
@@ -90,7 +91,9 @@ igt_main

                igt_info("Initialized amdgpu, driver version %d.%d\n",
                         major, minor);
-
+               igt_skip_on(get_pci_addr_from_fd(fd, &pci));
+               igt_info("PCI Address: domain %04x, bus %02x, device %02x, =
function %02x\n",
+                               pci.domain, pci.bus, pci.device, pci.functi=
on);
                r =3D amdgpu_query_gpu_info(device, &gpu_info);
                igt_assert_eq(r, 0);
                r =3D setup_amdgpu_ip_blocks(major, minor, &gpu_info, devic=
e); @@ -117,7 +120,7 @@ igt_main
        igt_describe("Test GPU reset using a binary shader to hang the job =
on gfx ring");
        igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-gfx-with-IP-GFX=
") {
                if (arr_cap[AMD_IP_GFX] &&
-                       is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_P=
ER_QUEUE)) {
+                       is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_P=
ER_QUEUE, &pci))
+{
                        igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
                        amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHAD=
ER_INVALID_SHADER);
                }
@@ -126,7 +129,7 @@ igt_main
        igt_describe("Test GPU reset using a binary shader to hang the job =
on compute ring");
        igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP=
-COMPUTE") {
                if (arr_cap[AMD_IP_COMPUTE] &&
-                       is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_P=
ER_QUEUE)) {
+                       is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_P=
ER_QUEUE, &pci))
+{
                        igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
                        amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_=
SHADER_INVALID_SHADER);
                }
@@ -135,7 +138,7 @@ igt_main
        igt_describe("Test GPU reset using a invalid shader program address=
 to hang the job on compute ring");
        igt_subtest_with_dynamic("amdgpu-dispatch-invalid-program-addr-test=
-compute-with-IP-COMPUTE") {
                if (arr_cap[AMD_IP_COMPUTE] &&
-                       is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_P=
ER_QUEUE)) {
+                       is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_P=
ER_QUEUE, &pci))
+{
                        igt_dynamic_f("amdgpu-dispatch-invalid-program-addr=
-test-compute")
                        amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_=
SHADER_INVALID_PROGRAM_ADDR);
                }
@@ -144,7 +147,7 @@ igt_main
        igt_describe("Test GPU reset using a invalid shader program setting=
 to hang the job on compute ring");
        igt_subtest_with_dynamic("amdgpu-dispatch-invalid-setting-test-comp=
ute-with-IP-COMPUTE") {
                if (arr_cap[AMD_IP_COMPUTE] &&
-                       is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_P=
ER_QUEUE)) {
+                       is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_P=
ER_QUEUE, &pci))
+{
                        igt_dynamic_f("amdgpu-dispatch-invalid-setting-test=
-compute")
                        amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_=
SHADER_INVALID_PROGRAM_SETTING);
                }
@@ -153,7 +156,7 @@ igt_main
        igt_describe("Test GPU reset using a invalid shader user data to ha=
ng the job on compute ring");
        igt_subtest_with_dynamic("amdgpu-dispatch-invalid-user-data-test-co=
mpute-with-IP-COMPUTE") {
                if (arr_cap[AMD_IP_COMPUTE] &&
-                       is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_P=
ER_QUEUE)) {
+                       is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_P=
ER_QUEUE, &pci))
+{
                        igt_dynamic_f("amdgpu-dispatch-invalid-user-data-te=
st-compute")
                        amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_=
SHADER_INVALID_USER_DATA);
                }
diff --git a/tests/amdgpu/amd_pci_unplug.c b/tests/amdgpu/amd_pci_unplug.c =
index 4c055b99f..cb88185a0 100644
--- a/tests/amdgpu/amd_pci_unplug.c
+++ b/tests/amdgpu/amd_pci_unplug.c
@@ -47,7 +47,6 @@ igt_main
        igt_subtest("amdgpu_hotunplug_with_cs")
                amdgpu_hotunplug_with_cs(&setup, &unplug);

-               /*TODO about second GPU*/
        igt_subtest("amdgpu_hotunplug_with_exported_bo")
                amdgpu_hotunplug_with_exported_bo(&setup, &unplug);

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.=
c index 87cf665f3..a7aca4171 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1126,6 +1126,7 @@ igt_main
        unsigned int ring_id_job_good;
        unsigned int ring_id_job_bad;
        int expect_error;
+       struct pci_addr pci ;

        enum amd_ip_block_type ip_tests[3] =3D {AMD_IP_COMPUTE/*keep first*=
/, AMD_IP_GFX, AMD_IP_DMA};
        enum amd_ip_block_type ip_background =3D AMD_IP_COMPUTE; @@ -1202,6=
 +1203,9 @@ igt_main
                        igt_require(fd_shm !=3D -1);
                        launch_background_process(argc, argv, path, &pid_ba=
ckground, fd_shm);
                        process =3D PROCESS_TEST;
+                       igt_skip_on(get_pci_addr_from_fd(fd, &pci));
+                       igt_info("PCI Address: domain %04x, bus %02x, devic=
e %02x, function %02x\n",
+                                                       pci.domain, pci.bus=
, pci.device, pci.function);
                } else {
                        process =3D PROCESS_BACKGROUND;
                }
@@ -1236,7 +1240,7 @@ igt_main
                                reset =3D (ip_tests[i] !=3D AMD_IP_DMA) && =
(it->test =3D=3D CMD_STREAM_EXEC_INVALID_PACKET_LENGTH) ?
                                        AMDGPU_RESET_TYPE_PER_QUEUE : AMDGP=
U_RESET_TYPE_PER_PIPE;

-                               if (arr_cap[ip_tests[i]] && is_reset_enable=
(ip_tests[i], reset) &&
+                               if (arr_cap[ip_tests[i]] && is_reset_enable=
(ip_tests[i], reset,
+&pci) &&
                                                get_next_rings(&ring_id_goo=
d, &ring_id_bad, info[0].available_rings,
                                                info[i].available_rings, ip=
_background !=3D ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
                                        igt_dynamic_f("amdgpu-%s-ring-good-=
%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
--
2.34.1

