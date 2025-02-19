Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7131EC021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 01:16:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC148933E;
	Wed, 19 Feb 2025 01:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pokriZvk";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAE68933E
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 01:16:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc6kizyyio/S1F60m26NhTKi+LUQMHMgDWhIlSGD5LgBUbDfwwUuaMWvS9TyEesnqr+7CIujWxWG8zXkvCc2r/RYeEQIoQp7xp3x4RlB6FYCCYhQiUZnjteUdHduqcP2UiSrSX1yVpxrA5BuhQKmOg1FD9ZayeWrSqPiLIYvdvtWY5nfTLhTJNdVM7HRy0NjUZYaRYW0LmZ25b6uF1V00s+hR0tQge4cADjvHuQgBW3qvC+rv6k68oD1KjmwDhIYQBzts5XXX6xJhBfql0nBIAKQc5MdKXRwXExKIDjTNUZxjUvxqjtjVbX1ByE0lhvLtpTiObQFPOmDO6vrTZiojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwmZjuclBsZLtpUOrOmuKTsN6CGmurwjGbS94f2ZMjE=;
 b=CBnnExQOGcH+P8xwCv+lC8Yherqs/ffdMQgPBL1bklxmQ4YVbI7KGEpumiz2heDxfQNI6+pX0FSL4rdCSJnLHoQe0+7x2MetgU702aHQDq4kq5lfB/ulOCkuokEKbkyHyahxNEsIVT2XX3MlD9Aj0JxKGe+u/iV+Wo7iQK6eqwyWSzoBb325MfRPxsHnT03XxnSeHs0UNDDaUhq6gIuzXu+kGc0Fqz+ZEgO4356Lr8awBfEKKLuqUM2gzb+eUHeTR9Oh0T3CdRQa59SeXDQvZQSzwJyRueO3tsJPv/UIG2wSjMpThTna9OHveqMc4SGqUDSRnzImt1z0tgY0lc8omQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwmZjuclBsZLtpUOrOmuKTsN6CGmurwjGbS94f2ZMjE=;
 b=pokriZvk7MumGq/kED6BjXbEgyUwEpbjVjn4jZNEVrlX1kC7EJvZC6ad4izlvy0wEtCfOOHH1DhBJ6zClWXysf6Taj+J4OWylzpDSvUUZWFv/um+FThCjvgiPeQojnRTGQwxre6A7DbV0G8jLvWClqY3CguPJK2R5M1W2S+D8so=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DS0PR12MB8815.namprd12.prod.outlook.com (2603:10b6:8:14f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 01:16:41 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%7]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 01:16:41 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "Wentland, Harry" <Harry.Wentland@amd.com>
Subject: RE: [PATCH] lib/amd: add memleak functions
Thread-Topic: [PATCH] lib/amd: add memleak functions
Thread-Index: AQHbgfpgRUI1ddtTBUyMPRiJOCB/R7NN0uAw
Date: Wed, 19 Feb 2025 01:16:40 +0000
Message-ID: <DM4PR12MB5152737BB90C9A8800A0F838E3C52@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20250218114341.122653-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250218114341.122653-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=84e3dd43-ebb7-414d-8607-bf95a5a7fa15;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-19T01:12:59Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DS0PR12MB8815:EE_
x-ms-office365-filtering-correlation-id: a0b6628a-86a2-4882-8395-08dd508310d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?n6X2lFmllctpuOBpGjmzpyRcRCNeM9s8DbF6j3tfcpnV5xDzFFOUO4bI4XwN?=
 =?us-ascii?Q?XHl3kY9MJLmyQ943UymKfhiijgP29UO0o0oJzPYCHcttXlZ1z0KUf8CBi7vl?=
 =?us-ascii?Q?/zYlI4OHkQzvYJopjMJMYewH0R3AXaWh3TbiRRYhIzNOzkUQx2o+3M46ZuSQ?=
 =?us-ascii?Q?c+f8Jgl3+9KrVgvfo5xsSTZzn1ybT4xbfs+LmyF69EWEfGtZ1u3PcccBV/x7?=
 =?us-ascii?Q?2UD54eR7Edq+Ok/bGulv7t7QeFABkiUhNJ7EUja+6CfNy08GNCor3vAbm01Y?=
 =?us-ascii?Q?LlAkGrfXxTUS+CPdpM+2bJc6RYgQLjeRKiXN6oHYCwJUGwkcdRr6JBRqpwRL?=
 =?us-ascii?Q?JulW74zRHOjAJCn6cmZHUY1yrh45hgeX+B5SMBKqiU30CrlZ9oQcuve0Jy1y?=
 =?us-ascii?Q?I524fwF0uSAyhVQnf1E20errgJoIZrixrCV0CbgXbffNnpP3FtUsV5SeErOh?=
 =?us-ascii?Q?01MCNimP91quAuN4TtFcT/UXalFClxmxCKNTtsxizqct1F64HBprh9CXoLK4?=
 =?us-ascii?Q?7GM25eK6cwi1Jr5lGlaX7scKvM+yyFAtF9ehywkDDvBuuqNQ3Vc3pllk692u?=
 =?us-ascii?Q?NJpf5pRaql5o7JUIJF3m7FFEsVN6kXYQc6wyvoChE5bqXXV5CpgBxMZsYquJ?=
 =?us-ascii?Q?WbBJRDgEvgaiClP7WXTtaQ6fMA9DonWSZv1Ta0G7Lg5pSF3W6a+qoICi+j8a?=
 =?us-ascii?Q?EoySvGt1gJbz4IYNa7ImPmGhrwqbVwTQyWB+U8K3vakZiNAX8iUnRtzLRs8t?=
 =?us-ascii?Q?l0Ugwr5J600WeIyU17NxSeVZ5/WAdqK+xoXv6iwlsBWY8dvJCvXFIfoI3O75?=
 =?us-ascii?Q?u+cYCwDSic26ZUbDsXn4cAhgWwvcmFlx5IM1TWGue0g6Q1PdlMwcL/UOWtEa?=
 =?us-ascii?Q?MsKWfJt+wg7FXqGDD9DhaZHwdrEwKYYU7tJidBTlcwyRpATkvuBtVCbByqWN?=
 =?us-ascii?Q?i0fNuTK91AmatKzNNWTKshcrNcCetHsV9It3KLPT3j1GfaejpvPo6LceIs64?=
 =?us-ascii?Q?RoVzQcqRL2zPKWqJ4gxb/hXtAC2yYwRumlqnDLTzNeoVK6M/mzzqKUGI9jLy?=
 =?us-ascii?Q?Lo+QCew5x2eZncfCUOaqziTu+ugpuTZOAKAXaQz1Sunu9fXSMsCG+7GwoaIp?=
 =?us-ascii?Q?Cna5qdhvJUUE22U3En0tSDXoJ7QyadSqHi7U1vL0aCGAHO93WbLsYpRPc2gT?=
 =?us-ascii?Q?m2fCDHHMQykXXzInIYOmfVroQCChlDmSU7eB36A4jIJDxYibt8IFo0xxweDA?=
 =?us-ascii?Q?YaCrfOjcxboLq4nyyXUwcI8hI+62eSM8F0Wo1750QtYnOsZZyQ3yrSo2yGZr?=
 =?us-ascii?Q?Z/DS3NsnxHnXsg2IrMEF++2zsKo6WRT4qOlfr+iahQf4KvlZR3mLDeDmLVwy?=
 =?us-ascii?Q?KgHMQ8GfBNGA11edJ+5bJxAblvQNMzjJAYcjy9tpX32xMqXp/+UmBpU+yeXv?=
 =?us-ascii?Q?d9G8JnTbP6BHCWnduGWlu9mipKg+V2Oy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JfKVV3armD0OwtvUT5hr4HwLyiSy02RxoLyCZN6pXsVrGUaWw6X1k/Yxx8Ip?=
 =?us-ascii?Q?MKX3QPUIFR/ZtdMAPIKTvIy/gcdQaad2E3/YPuJGCcac6dA0apLBc0BZkvy8?=
 =?us-ascii?Q?Qze8xQhnSpYY5eeaAxki6ktf7b1kCexZfUC5fuCb4o7SGosoB+7NRciQu7I1?=
 =?us-ascii?Q?BsjHbIh6UwqqDhx2CeOYixB/LbH0DZR62wgpsFXFYhowLEuRIg/jhzVfeBmd?=
 =?us-ascii?Q?8xLmwPHYPrtqQflnAOBLja7nV2iKKJ1BVHAffpMOftScYmY0zkKLpHRnD+UU?=
 =?us-ascii?Q?iV6JAZFrOUCWD1GGoAOWcIJJ+BtBWUy+8GHTCLd6xgPRPaYcioaSJjPYNnRr?=
 =?us-ascii?Q?aFFOHW5RTVcNSW5LK0rlN7xbPr+HSHoXu2IhvLfasmOq0lYCWHlxXmvJsDfb?=
 =?us-ascii?Q?OJcXlRoGiz1awnLJT4o7Jt1LtXvk+epC1Z8ggeeyNrtbLmr93BrIf3ddm+/D?=
 =?us-ascii?Q?JZvv61m07Fira1hjoFBy7X4JtV8slVdP9GqGFKQsiZZ3kc77niEbwisYDjuX?=
 =?us-ascii?Q?PiNDVJ0wHsshAuYUf+wvG22KhMuaez06W+oMNr1Jnx9CxPsCy3gMv/yEF6XR?=
 =?us-ascii?Q?RtRT6jBYglk616FRHfBAhanWE8VJ1lNU0GuU7UufSsbDmedcV6qdKDUQiIDO?=
 =?us-ascii?Q?YqZ0O+8BiVHTvdO2Ia5ze5Mq7bc3ehhMtZouX4LeoqQtXxjmh4K42+dm4+O4?=
 =?us-ascii?Q?GEisnG+E51CZbuCnnsrMpzHoLYyB01UsEZM0VyGQw6N8Zh7DRdpk5n8ihD0l?=
 =?us-ascii?Q?4qkOcNjysify8CpVuI03GWz3V8+Yzf0+ujC7GnzD5dH+bZEnbetv6ab3yOBZ?=
 =?us-ascii?Q?MStjKD2RszqZfudMl4+Z9xbrEqmpATk2b4gVQTOYzNhge2VdxKNW2gtBwkFC?=
 =?us-ascii?Q?5aKIz84NjXPLccxQjN7P8047j8XrtJ2siezIwpUPw4PQx97uAUQGPRhc64p4?=
 =?us-ascii?Q?qh50Q3Uo6tWqf1LFWMcz/AACC77wsOMYzEFvviwBJS5lw6Y2EbBQM2eJ/NQ7?=
 =?us-ascii?Q?u4+FEjVEnhP3wp283IyyFvjo7zWG/veaC9q7o5IsZSg/M2LGoZ8W375iUZws?=
 =?us-ascii?Q?YHPo+3cRbj4vQ0Z+vtAo6eUf2zDPcPtmfkiOems4hiBp2SvTBmRaMGjZ+smt?=
 =?us-ascii?Q?d2vS4AjspGKgosgTMy4uolBsqr12FwxydvV2KI5AeWbmXEI+SlpNkvEJreHI?=
 =?us-ascii?Q?oiAVU+3Nw6KR1o+zXjibA+TuUDiKGMBDxfcgIQzIeNMV1k473mIVcsREwJTP?=
 =?us-ascii?Q?FTb28ycGLWiA3jVoxRI5lg/3V+NQxkcvEGgrwe9lQU3fUih0JzRXd/rBsPvZ?=
 =?us-ascii?Q?/+QgyE3w1VY8GZRHjoOM1V1502T03Z5hSuG6oCEvkudhJKvMp5bp3F//FLJJ?=
 =?us-ascii?Q?dqs6+G7tHF6H710iK2G/klqiey35xmk+HKSZHODVAx+/0Nym17DBQL7M7bkQ?=
 =?us-ascii?Q?pO9LL2nElixO4PGw+Y/JFmgyYBlTXegxHMV9IIxTumhYMytxcV0oztO8Zwlb?=
 =?us-ascii?Q?OTqlp/7VQ9riV3pLpeYdE74hXBT+uYHCrCHq/V1e4VfqGm3IR4MMm3vx2F4F?=
 =?us-ascii?Q?3bJ2ilxLtYeyrS81HbQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b6628a-86a2-4882-8395-08dd508310d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 01:16:40.9552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xWKevGAqh5/8kUp9tzwgWl6uvtBFztLOEDqvENkjkB41kbz18pBe6FGQX3qakX6T3h5VrF64CG5Pevv7xBYc7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8815
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

Hi Vitaly,

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Tuesday, February 18, 2025 7:44 PM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Koenig, Christian <Christian.=
Koenig@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Zhang, Jes=
se(Jie) <Jesse.Zhang@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>
Subject: [PATCH] lib/amd: add memleak functions

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

refactor memory leak functions and add
them to the library for reuse across different tests.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_mem_leak.c   | 112 ++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_mem_leak.h   |  17 ++++++
 lib/meson.build             |   1 +
 tests/amdgpu/amd_mem_leak.c |  88 ++--------------------------
 4 files changed, 135 insertions(+), 83 deletions(-)  create mode 100644 li=
b/amdgpu/amd_mem_leak.c  create mode 100644 lib/amdgpu/amd_mem_leak.h

diff --git a/lib/amdgpu/amd_mem_leak.c b/lib/amdgpu/amd_mem_leak.c new file=
 mode 100644 index 000000000..a367b4eab
--- /dev/null
+++ b/lib/amdgpu/amd_mem_leak.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <fcntl.h>
+#include "igt.h"
+#include "amd_mem_leak.h"
+
+
+enum mem_leak_cmd {
+       CMD_SCAN =3D 0, /* as index */
+       CMD_CLEAR =3D 1,
+       CMD_MAX,
+};
+
+/* return non zero fp write successfully or null if failure */ static
+FILE *mem_leak_cmd(enum mem_leak_cmd cmd) {
+       const struct mem_leak_cmd_arr {
+               const char *str_cmd;
+               enum mem_leak_cmd cmd;
+       } memleak_arr[] =3D {
+               {"scan",        CMD_SCAN        },
+               {"clear",       CMD_CLEAR       },
+               {"",            CMD_MAX         },
+               {NULL, 0}
+       };
+
+       FILE *fp;
+       int len;
+
+       fp =3D fopen("/sys/kernel/debug/kmemleak", "r+");
+       if (fp) {
+               len =3D strlen(memleak_arr[cmd].str_cmd);
+               if (fwrite(memleak_arr[cmd].str_cmd, 1, len, fp) !=3D len) =
{
+                       fclose(fp);
+                       fp =3D NULL;
+               }
+       }
+
+       return fp;
+}
+
+/* return True if scan successfully written to kmemleak */ static bool
+send_scan_memleak(void) {
+       FILE *fp;
+
+       fp =3D mem_leak_cmd(CMD_SCAN);
+       if (fp !=3D NULL) {
+               fclose(fp);
+               return true;
+       }
+       return false;
+}
+
+/* return True if clear successfully sent to kmemleak */ static bool
+send_clear_memleak(void) {
+       FILE *fp;
+
+       fp =3D mem_leak_cmd(CMD_CLEAR);
+       if (fp !=3D NULL) {
+               fclose(fp);
+               return true;
+       }
+       return false;
+}
+
+/* return true if kmemleak is enabled and then clear earlier leak
+records */ bool clear_memleak(bool is_more_than_one) {
+       if (!send_scan_memleak() || !send_clear_memleak())
+               return false;
+
+       if (is_more_than_one =3D=3D true) {
Maybe we can use if (is_more_than_one) directly,
Except that,  it is good for me:
Reviewed-by: "Jesse.zhang@amd.com"

+               if (!send_scan_memleak() || !send_clear_memleak())
+                       return false;
+       }
+
+       return true;
+}
+
+/* return true if kmemleak did not pick up any memory leaks */ bool
+is_no_memleak(void) {
+       FILE *fp;
+       const char *buf[1];
+       char read_buf[1024];
+
+       fp =3D mem_leak_cmd(CMD_SCAN);
+       if (fp !=3D NULL) {
+               /* read back to see if any leak */
+               if (fread(buf, 1, 1, fp) =3D=3D 0) {
+                       fclose(fp);
+                       return true;
+               }
+       }
+
+       /* Dump contents of kmemleak */
+       fseek(fp, 0L, SEEK_SET);
+       while (fgets(read_buf, sizeof(read_buf) - 1, fp) !=3D NULL)
+               igt_info("MEM_LEAK: %s", read_buf);
+
+       fclose(fp);
+       return false;
+}
diff --git a/lib/amdgpu/amd_mem_leak.h b/lib/amdgpu/amd_mem_leak.h new file=
 mode 100644 index 000000000..5de4045a9
--- /dev/null
+++ b/lib/amdgpu/amd_mem_leak.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+#ifndef AMD_MEM_LEAK_H
+#define AMD_MEM_LEAK_H
+
+#include <stdio.h>
+#include <amdgpu.h>
+#include "amd_ip_blocks.h"
+
+/* return true if kmemleak is enabled and then clear earlier leak
+records */ bool clear_memleak(bool is_more_than_one);
+
+/* return true if kmemleak did not pick up any memory leaks */ bool
+is_no_memleak(void);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build index 9fffdd3c6..d01c90df9 1=
00644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -164,6 +164,7 @@ if libdrm_amdgpu.found()
                'amdgpu/amd_shared_process.c',
                'amdgpu/xalloc.h',
                'amdgpu/amd_cp_dma.c',
+               'amdgpu/amd_mem_leak.c',
                'amdgpu/amd_mmd_shared.c'
        ]
        if libdrm_amdgpu.version().version_compare('> 2.4.99') diff --git a=
/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c index e4a4b5c47.=
.74f887bf9 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -23,6 +23,7 @@
 #include "igt.h"
 #include "igt_amd.h"
 #include <fcntl.h>
+#include "lib/amdgpu/amd_mem_leak.h"

 IGT_TEST_DESCRIPTION("Test checking memory leaks with suspend-resume and c=
onnector hotplug");

@@ -78,85 +79,6 @@ static void test_fini(data_t *data)
        igt_display_reset(&data->display);
 }

-/* return True if scan successfully written to kmemleak */ -static bool se=
nd_scan_memleak(void) -{
-       FILE *fp;
-       const char *cmd =3D "scan";
-
-       fp =3D fopen("/sys/kernel/debug/kmemleak", "r+");
-       if (!fp) return false;
-
-       if(fwrite(cmd, 1, strlen(cmd), fp) !=3D strlen(cmd))  {
-               fclose(fp);
-               return false;
-       }
-       fclose(fp);
-       return true;
-}
-
-/* return True if clear successfully sent to kmemleak */ -static bool send=
_clear_memleak(void) -{
-       FILE *fp;
-       const char *cmd =3D "clear";
-
-       fp =3D fopen("/sys/kernel/debug/kmemleak", "r+");
-       if (!fp) return false;
-
-       if(fwrite(cmd, 1, strlen(cmd), fp) !=3D strlen(cmd))  {
-               fclose(fp);
-               return false;
-       }
-       fclose(fp);
-       return true;
-}
-
-/* return true if kmemleak is enabled and then clear earlier leak records =
*/ -static bool clear_memleak(data_t *data) -{
-       /* Need to scan + clear twice to properly clear buffer or else leak=
s
-        * from modprobe or other tests may appear
-        */
-       if (!send_scan_memleak() | !send_clear_memleak())
-               return false;
-       if (!send_scan_memleak() | !send_clear_memleak())
-               return false;
-
-       return true;
-}
-
-/* return true if kmemleak did not pick up any memory leaks */ -static boo=
l check_memleak(data_t *data) -{
-       FILE *fp;
-       const char *buf[1];
-       const char *cmd =3D "scan";
-       char read_buf[1024];
-
-       fp =3D fopen("/sys/kernel/debug/kmemleak", "r+");
-       igt_assert_f(fp, "cannot open /sys/kernel/debug/kmemleak for readin=
g\n");
-
-       /* trigger an immediate scan on memory leak */
-       igt_assert_f(fwrite(cmd, 1, strlen(cmd), fp) =3D=3D strlen(cmd),
-                       "fail to trigger a scan for memory leak\n");
-
-       /* read back to see if any leak */
-       if (fread(buf, 1, 1, fp) =3D=3D 0) {
-               fclose(fp);
-               return true;
-       }
-
-       /* Dump contents of kmemleak */
-       fseek(fp, 0L, SEEK_SET);
-       while (fgets(read_buf, sizeof(read_buf), fp) !=3D NULL) {
-               igt_info("%s", read_buf);
-       }
-
-       fclose(fp);
-       return false;
-}
-
 static void test_suspend_resume(data_t *data)  {
        igt_display_t *display =3D &data->display; @@ -164,7 +86,7 @@ stati=
c void test_suspend_resume(data_t *data)

        test_init(data);

-       if(!clear_memleak(data)) {
+       if(!clear_memleak(true)) {
                igt_skip("kmemleak is not enabled for this kernel\n");
        }

@@ -174,7 +96,7 @@ static void test_suspend_resume(data_t *data)

        igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE)=
;

-       igt_assert_f(check_memleak(data), "memory leak detected\n");
+       igt_assert_f(is_no_memleak(), "memory leak detected\n");

        igt_remove_fb(data->fd, &rfb);
        test_fini(data);
@@ -189,7 +111,7 @@ static void test_hotplug(data_t *data)

        igt_amd_require_hpd(&data->display, data->fd);

-       if(!clear_memleak(data)) {
+       if(!clear_memleak(true)) {
                igt_skip("kmemleak is not enabled for this kernel\n");
        }

@@ -199,7 +121,7 @@ static void test_hotplug(data_t *data)

        igt_amd_trigger_hotplug(data->fd, data->output->name);

-       igt_assert_f(check_memleak(data), "memory leak detected\n");
+       igt_assert_f(is_no_memleak(), "memory leak detected\n");

        igt_remove_fb(data->fd, &rfb);
        test_fini(data);
--
2.34.1

