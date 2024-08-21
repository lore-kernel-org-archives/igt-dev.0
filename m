Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCED7C3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 01:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733EB10E47D;
	Wed, 21 Aug 2024 01:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ute1f5ji";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5019610E47D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 01:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PigY5GWsErB0/ppNBtqbgNow+feHF/xZh1n+zbHdqtemT+goOwRiUilXnIWH73YgWzMQsf0Iiq2DULwIeSV+ol35+9CAJviip66WRJr4llT4Pij1usYbtQwYXN1NsZePATDHdIh2VAth605lWMAIdB/Lz2jQRkiHpC8VHY+PWseJWw1uZfJ6TjalJ8qikc0SaSfg5R1Go+Ha2yS1LQ87xOIeJ2Rzbszcw6WLtAXayDVGiRXjwkbeLO45kpmp08NmWrykEEG9/xkumlRKbiKiWrdf34IjDQ2BjLPMCUb4+tIBDYWd6rD3y9/bCvwKydMlyV5sihpc5AzvbzIJoNlw/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OupdM22A+IY9KCTyRf6FJ3MbA4vrMS5gOOsKOlAfqWk=;
 b=yHrWg0dtObnDHbCkMCDqSN5tqbuafJtDod0nvXxhBqpVDD3cx1IjaR9Hi9RyzEP2zADiYxJNqLSqToBh5X190Rx6yif56dS0FftcslP5bp/b3Umb4iXzi8OMSaWkF0rJKXkF1ZbaEWiQsl/6gyfAX1eGLZSuPmytz0tqLLk7uKzyUbxBni4PavkpF9eOLVnpmIgc5JbKtro7EJ1wI1OeD9Oe/RcXJQ9GpNoBgn3PkK5eznqqMPslET4krsfCk/Mpdw17r+1CeAXEq/tzEpbd219RRm4HYBD4CLqYw/b7Nm3nUVueNl7wUqdGA6+KUxponPa8p7eFYdu4wqxK7D7pkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OupdM22A+IY9KCTyRf6FJ3MbA4vrMS5gOOsKOlAfqWk=;
 b=Ute1f5jiO3nbTeR5jaMv4geZJ2+MlHbj0ZWtozuC1rDI8ezoycmF6cLUZ/5ca68alQnvsnQ9NGpl7hNetPGNDayXzHAx6utzHmwK32kyi22cr/XuKlU0UgVAwMVlYBIGoZcJ4xXdI7vGNh9JHgPPdjRQN8MN2pppzM/n7nkcSTw=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DS0PR12MB8042.namprd12.prod.outlook.com (2603:10b6:8:141::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Wed, 21 Aug
 2024 01:12:44 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%6]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 01:12:43 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH] tests/amd_queue_reset: refactor code blocks
Thread-Topic: [PATCH] tests/amd_queue_reset: refactor code blocks
Thread-Index: AQHa8135TQXSdSI79Uig15X9DgI87rIw56/g
Date: Wed, 21 Aug 2024 01:12:43 +0000
Message-ID: <DM4PR12MB51527B64FF1B86BA95092822E38E2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240821000616.310678-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240821000616.310678-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=5b3c6bb4-733e-43cf-a1ed-12425e9176b8;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-21T01:12:37Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DS0PR12MB8042:EE_
x-ms-office365-filtering-correlation-id: e96fab2e-88fd-48b5-593f-08dcc17e5c5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?6XXw5Po014vnGvQCDFRpCF70Xua7Ebd2PgmXlUnqvqC/N9BZtRsOav31UbuT?=
 =?us-ascii?Q?do3PERNOgTV8v4+14//vNt7zoWGmi3d3rLhcqlPDZrq0BrpsbWtQWaxVUqHC?=
 =?us-ascii?Q?NG2WiK9URqb6gA8jVB9xq0tTYpG8U316f2pntyDh671S/Oo5re9TNblDvvkw?=
 =?us-ascii?Q?aQOOH7fa1o0H1ZuT25dyYdTYbW4PJ6nZTmwOhNLZPFSINTp2uoX0zI3JeWGJ?=
 =?us-ascii?Q?yDY1ZExuYo8FSOTKxkCtTTUS9+ocSzghmhzSQMA+tZoUXFX4bczM4ugWvYz6?=
 =?us-ascii?Q?YrlVFckAY8fgApIVFvCnGr7hIHmlKmfaxhtn1IKx0Z+/WvvJT/Mc5vMlcWLB?=
 =?us-ascii?Q?QrkpaEb1H26PhbMz4e4NWoBa5EG//uVHtM8PNhRi7infvGXGLxL5fXf+vcv+?=
 =?us-ascii?Q?I52WAjy4VmOlaMjYnNhNvey+aAEASiCRt3wbrHKQWGWfaHpgs9Kg56QYfD4O?=
 =?us-ascii?Q?H+YXi7iRGQtM0A/v5un7mj8FWXiYMyk7SLFqX2nmwcOl6jlOgwJSys+SyP4i?=
 =?us-ascii?Q?tlXxPMruM4poqfva3hqVqvLoTj3cuP5c58RVNAdBE0SUPDBgcoyBLve7BSbt?=
 =?us-ascii?Q?qXlUUjN2TVU9Qlvp0t0CWD7UI5+jWQpXUBaH/f6cCg2VxCAE24icu9ieDh1T?=
 =?us-ascii?Q?liWnwd3/d9q8nK480eb/eUrCsomCe4TpPu3tYbTMK2uR3fOUEKzx/wF30PGx?=
 =?us-ascii?Q?klJyXSn9rg1KxqT3JDnOKvoyy1kqFOcK3l+DSLEgHqUhPaRZMryydTnoqCg0?=
 =?us-ascii?Q?f4NvYSAdop/x1+WLWtN0YUiBTKkzqywQwUdNKFrCrttHdigoNveZMS1P8rVB?=
 =?us-ascii?Q?XjjBUe9i8bAehHxEEw/zeGpsB6mGn3iXz1w/WE0hFBukCL6/9tIO3b+mC1TR?=
 =?us-ascii?Q?LkCBDnqJT9rvNtrxuUOiGUkgUO3IMfaYj8rXuBQNtifNWFjD7Lc+kfwFrSGm?=
 =?us-ascii?Q?PkwxMjJud+F63ZM3RBnhHFJl8778txk8BKk163IqTX6TsW3VpPMw8P1ICxOr?=
 =?us-ascii?Q?+AApXSx6zEwaPL+Mq8uwEIJpGGAaufqHNJei81mISen20W1xrWLm0GdHZ6Nv?=
 =?us-ascii?Q?f3IH6HGFaClBcjGHAhe4oKRhsIKV2TU57ahBFex79tX8GkeAcobTVJ5cIWXW?=
 =?us-ascii?Q?Z0F1v2DUhHzbQYGzyeJcMwvPMKqb1iXMAUDERrsXj/upqJky/J7Dm7eDKCeS?=
 =?us-ascii?Q?M9SYOppBT4RIlPWPw3L6UUpGBijpivaJ4dBJRmWflTBj1NW2ai6KPD34Ms7a?=
 =?us-ascii?Q?2nyLdn81qrAw2PmxnNLJLwkRSkNoPfLeRjZGm3l1FoDChvB8Z3MLt6LvXf3I?=
 =?us-ascii?Q?rvKSZedPZi2b/CKksN8WY2DD1q+O62qQX4SYDOg6TcNyxMuzr5Es+UXAauzA?=
 =?us-ascii?Q?AQYDzTx8HShwOfBARFbs/4HIEBytH0Z7n0HKb4ZU8nkBEy0W/A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JKMqYzWS64t04rCEURaT2YjQBwTZ4BW0KibJ9f4PZWXyL/cZVsZuICY6FxaO?=
 =?us-ascii?Q?qeoCDc6xVh5o3PI7foos8mX0iy7ZFScZvzGBUHayBZbtPXtJluAlHBFl6zeV?=
 =?us-ascii?Q?qtWqeftdyv114P2LJ1rVbmU0yFcbvAoIZun8lvm5zjcHw0neQDdnnPupldCi?=
 =?us-ascii?Q?IqwYGofc7hWb1WoYmyMEmW4XO6jFLKzyqewSSUKNiariR4VALJfPwOmtc+3P?=
 =?us-ascii?Q?8Bo/PEJRgadetiKuNnv66sQH+JmIz7zQj3HHuUza0VFXXIsclNQ+cAmzc6X+?=
 =?us-ascii?Q?YTlxD8iYwPQ3F/GGkU3aSVbFta0IuSn8Jys9ioPZ2PG6XgXuydSj2TkNyAdj?=
 =?us-ascii?Q?7ZQM0bKHwHC4ridbb3HTOWQNcU6h8PDLXHoIHcrNRyoxVLYE+36pifkpSxa+?=
 =?us-ascii?Q?+732+xvFigYUkmnYQP3sByd1OJPvOMDnn+5AiTCsWoY9RBVcLaX0w6Qbas0f?=
 =?us-ascii?Q?+IZDiVWZAjUoXzxkWVKy4LudCZ0DgS+v9ieB7RY1oBZJ5GZQ1ds/3gRnobAp?=
 =?us-ascii?Q?OOHronU18IsQ8HResZ4WDuUdg8/F+cPTmjhvVX0TLqSv6cj8B4Eqk47MpfDr?=
 =?us-ascii?Q?j5e2Yg1956VwOGe+11Mnti7jACoiQDTiaFDLlCQtzNwUto9JEMKEKRCqZW0g?=
 =?us-ascii?Q?9Iyy7/9k3Q7ER4u3bz5FuR3imym3BrBSipBE0t1pEPd4Dz2zQtVFIr5CQHr3?=
 =?us-ascii?Q?GT0tvmIhqMILxdvha1uSUZV47YD+EBQ2s6ukw/dZBSV9tvsQsF9wojFnauK2?=
 =?us-ascii?Q?bnUMtJun/wWN5NsD5e4Zct+P2xAlFlWloCJqodTZse11m1LP7Ayt0Hhp8y89?=
 =?us-ascii?Q?f7EBSOz8SuhcNzcDpL8BUafLBC+L/lq91kwkiWegeQdcc+woueESZ40k7DJb?=
 =?us-ascii?Q?3aR1SRZnWyNZkQeQemO6rplxmBkbc6HmGtEjPShFtTrdH+qgB52vQsZi6xt3?=
 =?us-ascii?Q?7uifDvhCTdo2ZohciUuenLqo4372q+IrnADibpn7BdqO3ETfpOfbmwG0wdJV?=
 =?us-ascii?Q?0/q3CduLWC9PY9vXkHJF8vgZJ2fe9TbbdqUYYNsg4iOaprb4TRGnNLeiSqZP?=
 =?us-ascii?Q?MDMjCd9cSBDfteUjLvjesOMENs9LgRDDvEXbs+yN7Xi8Yj1j3mOwgpWrgL0A?=
 =?us-ascii?Q?i10YGU613jlBay+/2aL1nFiSYsX/qMaKfFMT9IxDNLdo/4g4tzKwxNWX7iNE?=
 =?us-ascii?Q?NNhhuuYwnPbvjykG8r4U0EKLmAINhXgleEo344s1cpMh+0Kg6pyHPn7jcEEZ?=
 =?us-ascii?Q?CHAFlK5dTAv7k7JSwBnT2nrU5VtyEMR2QPZhvLL0wJCBEmWKoQOhf+01KvX4?=
 =?us-ascii?Q?wLWktjEoWDF6RQkxPHYl6ExWIUy7c+Qtf5YT9wazULl0WEHCN/Ogh6HI1exb?=
 =?us-ascii?Q?vGM1b/0w++o6MoeNULv5hNx9aGB3rSdqxojCYVmI1/H6xHYcQQFQJXVR65gb?=
 =?us-ascii?Q?OB0pVP4cXp253UdI9ITaVWGPaVQrlctAmIZyxD4p0e/lrMIG5zIYTph02D6s?=
 =?us-ascii?Q?vH0PnJ5420lSfZaRlRs5sHlVq4jgSVD32Hspo0xRWRiFVcnJVpAK5jzpKJY1?=
 =?us-ascii?Q?Ut0Kqyio8ufo0OOcHHk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96fab2e-88fd-48b5-593f-08dcc17e5c5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 01:12:43.8984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vZEu4VwEaNfUSVoM18c/KdcbOP8peoJun1YhWnSz1jQMv0YMncWuwDqAq/HiFTTSG4tGdIlzitC3zIvML+9heQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8042
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

This patch look good for me,
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Wednesday, August 21, 2024 8:06 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christi=
an <Christian.Koenig@amd.com>
Subject: [PATCH] tests/amd_queue_reset: refactor code blocks

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

This refactoring includes the following changes:

- Initialized child process PIDs to zero.
- Moved the launch of the background process after
  validating the is_queue_reset_tests_enable condition
  for GFX > 8. This change is essential because the
  background process can hang if the test is not executed.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 35 +++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.=
c index fe5e0effd..6a094d812 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -26,7 +26,9 @@
 #include "lib/amdgpu/amd_deadlock_helpers.h"
 #include "lib/amdgpu/amd_dispatch.h"

+
 #define NUM_CHILD_PROCESSES 4
+
 #define SHARED_CHILD_DESCRIPTOR 3

 #define SHARED_MEM_NAME  "/queue_reset_shm"
@@ -403,10 +405,12 @@ error:
 }

 static bool
-is_queue_reset_tests_enable(const struct amdgpu_gpu_info *gpu_info)
+is_queue_reset_tests_enable(const struct amdgpu_gpu_info *gpu_info,
+uint32_t version)
 {
        bool enable =3D true;
-       // TO DO
+
+       if (version < 9)
+               enable =3D false;

        return enable;
 }
@@ -946,8 +950,8 @@ igt_main
        char **argv =3D NULL;
        char *path =3D NULL;
        enum  process_type process =3D PROCESS_UNKNOWN;
-       pid_t pid_background;
-       pid_t monitor_child, test_child;
+       pid_t pid_background =3D 0;
+       pid_t monitor_child =3D 0, test_child =3D 0;
        int testExitMethod, monitorExitMethod, backgrounExitMethod;
        posix_spawn_file_actions_t action;
        amdgpu_device_handle device;
@@ -1012,16 +1016,6 @@ igt_main
                else
                        const_num_of_tests =3D (sizeof(arr_err)/sizeof(stru=
ct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);

-               if (!is_background_parameter_found(argc, argv)) {
-                       add_background_parameter(&argc, argv);
-                       fd_shm =3D shared_mem_create(&sh_mem);
-                       igt_require(fd_shm !=3D -1);
-                       launch_background_process(argc, argv, path, &pid_ba=
ckground, fd_shm);
-                       process =3D PROCESS_TEST;
-               } else {
-                       process =3D PROCESS_BACKGROUND;
-               }
-
                fd =3D drm_open_driver(DRIVER_AMDGPU);

                err =3D amdgpu_device_initialize(fd, &major, &minor, &devic=
e); @@ -1032,6 +1026,7 @@ igt_main

                r =3D amdgpu_query_gpu_info(device, &gpu_info);
                igt_assert_eq(r, 0);
+
                for (int i =3D 0; i < ARRAY_SIZE(ip_tests); i++) {
                        r =3D amdgpu_query_hw_ip_info(device, ip_tests[i], =
0, &info[i]);
                        igt_assert_eq(r, 0);
@@ -1041,7 +1036,17 @@ igt_main
                igt_assert_eq(r, 0);

                asic_rings_readness(device, 1, arr_cap);
-               igt_skip_on(!is_queue_reset_tests_enable(&gpu_info));
+               igt_skip_on(!is_queue_reset_tests_enable(&gpu_info,
+info[1].hw_ip_version_major));
+
+               if (!is_background_parameter_found(argc, argv)) {
+                       add_background_parameter(&argc, argv);
+                       fd_shm =3D shared_mem_create(&sh_mem);
+                       igt_require(fd_shm !=3D -1);
+                       launch_background_process(argc, argv, path, &pid_ba=
ckground, fd_shm);
+                       process =3D PROCESS_TEST;
+               } else {
+                       process =3D PROCESS_BACKGROUND;
+               }
                if (process =3D=3D PROCESS_TEST)
                        create_contexts(device, &arr_context_handle, const_=
num_of_tests);
                else if (process =3D=3D PROCESS_BACKGROUND)
--
2.25.1

