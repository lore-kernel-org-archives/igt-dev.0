Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E6BC02181
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 01:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A98110E3CA;
	Thu, 23 Jan 2025 01:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eqZ0on8E";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D592310E3CA
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 01:34:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZHho+rqNI94xWA9hTYr9f6pNC3ACttCapXCO1Wsedi1zCfFvDI9Jen7JxQqBQL8MHoTWCge+zqaA/NM0JVEtabRNgtz5HN+TZ2LOj16Jm48DphurlygXI9MrX1QjFuvKku18INArh2H1KBYinjIVtn1zWiMMtksL7yFuxCzOegxFlyL6Nf8XiLHpHOJdIp1gMUDD5E8trHeu/Ci7XJLpfQsC5IByXmpBeQ0a+tcCp/lM2Ifin3c4q37h5HmvsE5SXv0t6WGhn06FZftAIHZfjWLxh8VK4W/ccOc6OlQPH/JI5sEstBJEdyQFLxHAnSpf5I85d4/4oxLC/UsTmEDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0oynTCYW/wUw2zKAl0mZMmjQ8S0kESogCX8IXEv39U=;
 b=NVoTqr/+S5od+GSwWalrkX4zIKBI+dy7dVcrPw99xA5qSk+AuRnI/GZZZCrit0vEh487pSroUfpJbz6GT97ZbC3/PqRHFEY5287GsOjZ9M3/V/nQCYgnk6HpHs0VNRWcvOWIrSn39MpwmbFL3QnPHtJwjVtUvMJmc/KOYSXMRro2SzZ1dsYO/AliraxzYqngEwe4KSD0J6lTtSYaPaoqbnFAnYfKZgyRkLTmGW9e+FEHkwCm5rtQUSBv206sGK/jH9sd43TOqLD01y5WG6fTAAld/if0HO3kWedGryxek67hKAMYefI4BcTTuvUsr32Gz87OX7bpZqLtnSWizBJY8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0oynTCYW/wUw2zKAl0mZMmjQ8S0kESogCX8IXEv39U=;
 b=eqZ0on8EcHTPbKIbug6uUk8K9pHkoo7Gp0lOykNchdU9qOyhJJF047kbsfYgzt5zJt+dexXcgxXTtv8JPXmdvyePg4esWsGUP2zHUxVIJpg6/UxnurqxL41uXT8QnW9vy2g0eXlgq44t6WMHOYZLxfr9E7vgI0M4/Pb3ReQpxrg=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by SA1PR12MB8887.namprd12.prod.outlook.com (2603:10b6:806:386::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 01:34:37 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%5]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 01:34:36 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] tests/amdgpu: find PCI bus, device and function and use it
Thread-Topic: [PATCH] tests/amdgpu: find PCI bus, device and function and use
 it
Thread-Index: AQHbbTW12Z3IfC0Ku0m/nzMrJRI9PrMjk1OQ
Date: Thu, 23 Jan 2025 01:34:36 +0000
Message-ID: <DM4PR12MB5152562883272F8ED99C94CBE3E02@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20250123012525.131685-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250123012525.131685-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=eeac9a43-9724-4907-a402-87f26cbefcd4;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-23T01:33:57Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|SA1PR12MB8887:EE_
x-ms-office365-filtering-correlation-id: 207fac49-f5b9-4d88-9fce-08dd3b4e18c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Rt3JmYDEUOWsNVsFiD48C1ceZSj/F5c/ZIUtrKTpigk8J7czxqlO9AH9YVCE?=
 =?us-ascii?Q?MFAjFCnQULnMsfvifQ4bfW8zzAGopLzdMUQ+lJYk/W5hs679rgwWezWSKzqH?=
 =?us-ascii?Q?y3+BoNrPrgHxws7BMcKesHyR+NEp4utO3moQRyNh8eclteI43v8JCo+++U1q?=
 =?us-ascii?Q?WSaJi540GbX2W/Z6fV1IybQCLpYHh8aFZWPJSqWHDKjh0vJoyw4Mtr84DGI4?=
 =?us-ascii?Q?EblJsivSRlEniVcobJMOcccIIFv9Xxn6E3Si9G1L5pI/tO3rdwE0y2f5xi2l?=
 =?us-ascii?Q?WvfBOTSKVUp8rOU9Xjp7jB4giEm0xTmcr5tITNKO3xKsUPRh1Yzr1YTMER2L?=
 =?us-ascii?Q?j5xASIH6ph5m7/aV/XYoCtlYfSb0CgmY54BKJnNaybUlSirclz1ipFzFxBAw?=
 =?us-ascii?Q?mFtR5coLzm842USEVuCr1O5U9D5jIePjX7p+L9EmfWikw/YbrUvOuJlS/0Uz?=
 =?us-ascii?Q?joeXwGmhFc5Miu6Q7Vo1Zpbwig6ww5t6q9T/6263deytZsG5ndGALq7I1W5X?=
 =?us-ascii?Q?W1xNDnUHA576zlH+z2JRfjvyrSicVRAUtys1UzW7AfWW3HEiv5AjS46/Rfx1?=
 =?us-ascii?Q?PMuErQblYFCWhDP+ybKiWLi1kBBREpP8C1p57owxO6JIsfGQbrsH84CUtfFQ?=
 =?us-ascii?Q?YETT+PDTJc2l2TOl3Lcyu28+GUYRyN0DrUO3AOsaPsLhvaCXfq/PYScSqVbr?=
 =?us-ascii?Q?qj4w2ok6u5nGzfWrnlRSxWHW5UxnU41cpgee5eLS2KMBUUVyjET952sE5vgV?=
 =?us-ascii?Q?E8QRpxNeNWVZ7NdSh8y8VwKikc0+ZAdtKX0z1rvrOfnTDkfGeSoatSv9V0x9?=
 =?us-ascii?Q?MSJa8Me2v8a1RcTF0ErlI0yCJIhBigNpUDwP75RKasQ58vjiRVdUoDMrWI7s?=
 =?us-ascii?Q?DUw3wE+JjxcHfsklVlybGER05g8xGV2f8EfccbXWJWJxoazpbTI2JQ4qp1Sa?=
 =?us-ascii?Q?gdwzKlgwEbLYPASfIPM5cjszKUwqrXCgip0yoRCtQF4zd+1wyQe+02qRlCvL?=
 =?us-ascii?Q?hWXf8qXvTWSZ8g0pTFR04scxTS5QZ1jwivtxXh0R15E+Q02NzeCDKxZXNbOx?=
 =?us-ascii?Q?213XjwO0tpWRnqoEPxE+g17xXZRl7I3q20mgm59O1igiT36PbzvwyLf2nmF8?=
 =?us-ascii?Q?vmB6CEyYxg7RoJxS+YVom4KlBI2zbpgeVuX1FEi/+y2wPMBR/1HzjNPxRH8d?=
 =?us-ascii?Q?RhGfrNrk5quNF8Wk0LOrmaeH3lxR9IgGhnZhC7GfKS4S6YjSV3gRRR1EuHOm?=
 =?us-ascii?Q?8mrjcw0RNL/CL0EE2rjm7ubBjeiQaNBCQl8UppGbnJvq7t1pIzzlhTt0wpy0?=
 =?us-ascii?Q?XcmlMGEX2YSoA42ueKukIsag8LapDvf4jlyr3kpdlrC09uwp/QEzUNcROqzA?=
 =?us-ascii?Q?4IblFhf0O5lbAbkKkoEKHg7HEDYSAkOF4pHh436rKvgPFJXNfX36E2wEUjmf?=
 =?us-ascii?Q?4jzWmcI51BkliZzPhYF7toaAlpN6mXAp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KXjMVTZ0QSHKrrIcKUwxJbzrwG5lI8qn8YNMqC6BmBUaePyn3lVNEMCHix98?=
 =?us-ascii?Q?Gws8MuraSpiPrH8zhpd2tyGUUdUCcTDfMW2pyiKvdwr7rDz7XZNtu4MoCDWj?=
 =?us-ascii?Q?l/mziIdCYhbmStD0eqXETo4TZlCyrVeXWSQUF2n7vWzMYk51aeCrqi/mG4vJ?=
 =?us-ascii?Q?D6xsI3EzElbdSOCrOJjOiP+hn6Fa8aWPbwKpKgOL0NnFut0cMTfjZgnjgcy8?=
 =?us-ascii?Q?3pVX2jN3eREZZQD++FTYZJAv2IEkDsevOViN+3LbdZGl2iBfvVf/a695yx7b?=
 =?us-ascii?Q?pc9mTnoCy0Rkn0WumROURTZ9KXQzj9RVc/Dp2HhTsdouJOwao51fI+WEIkRI?=
 =?us-ascii?Q?hVnogu+xxACOTFAQkoHg1LofhisuiQCukdxjE7spkYdY3Gk3/MFMvWRhleNY?=
 =?us-ascii?Q?u6ZhEoM3aM0VW+zYIrJ5Ha6ftXhVKgfr3NUr0RwaIfDyj106GRlCMNYlECt3?=
 =?us-ascii?Q?p6zVgv++RY+cyOKsacMgxLXy7xFkr6eEg8VqdX/Be2TGR7kFvV0nUHP6fCK4?=
 =?us-ascii?Q?vCg5qntGLFUTluaH+89aCYl3mMdkSbWcXg+mcSHfKeGkOOjywithc4v9mulK?=
 =?us-ascii?Q?geJoUchUHabUycOlNS0A+55+8Aib1yHCLaapTEf39n7nellqUCsru8KSLNLV?=
 =?us-ascii?Q?GYvksz/Yyy1cbhpLzlO13wD4Zt7g8xfFX/gOBr5kzjrgJ3OJFI+JVnpjCclu?=
 =?us-ascii?Q?LcpDxHXgxHIQ/uOGwi/kdOF4/saMN0DklDZ+yMr7Tm/TrbUm5v/yQ9c2IYeD?=
 =?us-ascii?Q?2EVMhvf6M5UVeHKV+u1gGuc559qRK4FeADNRvGYtLm2ZYxTq2H196LD9aium?=
 =?us-ascii?Q?joo5mTZBTsoq+O6Rvs0E318UEPmJQssCiRE5wxXGsXJpP4c1Ewr7i/CqX7nv?=
 =?us-ascii?Q?9Zeb0GmDWcBehBrqOdqLvE+pTMlmLYxNRnQRNXfuBhDnR2IMCwjxD6ZGFb6z?=
 =?us-ascii?Q?sZ+KHsI6QL6EsEuUA+cirHgebV3wQsTJajVuLp6+qJf8Mwwo6P0dv2OT4qCU?=
 =?us-ascii?Q?VaN1lhtDNByiqC1AbRG4NIpx8Nr5WTXzT9EusxsPdB1I3qOz9YQfSo/buWHN?=
 =?us-ascii?Q?6a4FZdZN14HACT32YO2BcqNd3cUciOPbSO820QopGPZGh7qmq/N+qfqx6wbs?=
 =?us-ascii?Q?ULFR1bwefVeWAHoAdxWcL6nlaRQDwIa5zyuCVNhYKMljAbHRbrTtU/fhRnnD?=
 =?us-ascii?Q?Y22B58B0zk/bXzfnqfYttvqv/X6zbCG81QcUlWb1MEjsAyT7GzLoz+DUeNps?=
 =?us-ascii?Q?YmpswU0PGxT4Q4gYQRKx9tWIQ4KUOWywO2oobnTMYRbYxoptG71RP11tv5R1?=
 =?us-ascii?Q?E0So+n9+qSyTOGG4dbHHsy6ReoqVCVJDqPBYfsH0TsrdwCPSuNRn06CIDGiS?=
 =?us-ascii?Q?yD/XTq3Pkx5BRqycGI899jYzQgoYAJfdKRLyrBkiM2zu4EuU/DH2nA8U3bnM?=
 =?us-ascii?Q?Lq86KCf2P/Nq8CM1dVXFKgzoM02KQkkM9qdEHYHC3XPPTZQxxwg28i2rLTFJ?=
 =?us-ascii?Q?AC+dfD7ecTCSCiuhjK4XtK5atHd6qed76CfWIyZJteRWtrPfFPvzNDxfdIOT?=
 =?us-ascii?Q?2+OP2HupXmUVNH9lhXI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207fac49-f5b9-4d88-9fce-08dd3b4e18c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 01:34:36.5135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HUnmH/VRPb5xrnuEd001QNtyGo+FBTQKmKvymeCMT6sNZtbRwqkSeNiml9ijvSrfoZkTbEB5IKAIfe74XvRnww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8887
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
Sent: Thursday, January 23, 2025 9:25 AM
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

v2: Suggested to add igt_info log about ring enablement (Jesse)

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c |  2 ++
 lib/amdgpu/amd_dispatch.c         | 29 ++++++++++------
 lib/amdgpu/amd_dispatch.h         |  5 +--
 lib/amdgpu/amd_ip_blocks.c        |  9 +++--
 lib/amdgpu/amd_ip_blocks.h        |  2 +-
 tests/amdgpu/amd_deadlock.c       | 18 +++++-----
 tests/amdgpu/amd_dispatch.c       | 58 ++++++++++++++++++-------------
 tests/amdgpu/amd_pci_unplug.c     |  1 -
 tests/amdgpu/amd_queue_reset.c    |  6 +++-
 9 files changed, 79 insertions(+), 51 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_he=
lpers.c
index f274a6365..d7bf0e111 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -241,6 +241,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle dev=
ice_handle, unsigned int
                if (sched_mask > 1) {
                        snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %=
s",
                                                0x1 << ring_id, sysfs);
+                       igt_info("Disable other rings, keep only ring: %d e=
nabled, cmd:
+%s\n", ring_id, cmd);
                        r =3D system(cmd);
                        igt_assert_eq(r, 0);
                }
@@ -472,6 +473,7 @@ void bad_access_ring_helper(amdgpu_device_handle device=
_handle, unsigned int cmd
                if (sched_mask > 1) {
                        snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %=
s",
                                                0x1 << ring_id, sysfs);
+                       igt_info("Disable other rings, keep only ring: %d e=
nabled, cmd:
+%s\n", ring_id, cmd);
                        r =3D system(cmd);
                        igt_assert_eq(r, 0);
                }
diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c index 75=
fc326da..3153d88a0 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -549,7 +549,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_han=
dle device_handle,

 void
 amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
-                                uint32_t ip_type)
+                                uint32_t ip_type, const struct pci_addr *p=
ci)
 {
        int r;
        FILE *fp;
@@ -572,11 +572,14 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle=
 device_handle,
        }

        if (ip_type =3D=3D AMD_IP_GFX)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0=
/amdgpu_gfx_sched_mask");
+               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
+                               pci->domain, pci->bus, pci->device, pci->fu=
nction);
        else if (ip_type =3D=3D AMD_IP_COMPUTE)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0=
/amdgpu_compute_sched_mask");
+               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
+                               pci->domain, pci->bus, pci->device, pci->fu=
nction);
        else if (ip_type =3D=3D AMD_IP_DMA)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0=
/amdgpu_sdma_sched_mask");
+               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
+                               pci->domain, pci->bus, pci->device, pci->fu=
nction);

        snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
        r =3D access(sysfs, R_OK);
@@ -618,12 +621,14 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle=
 device_handle,
                if (sched_mask > 1) {
                        snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %=
s",
                                                0x1 << ring_id, sysfs);
+                       igt_info("Disable other rings, keep only ring: %d e=
nabled, cmd:
+%s\n", ring_id, cmd);
                        r =3D system(cmd);
                        igt_assert_eq(r, 0);
                }

                amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type,
-                                           ring_id, prio, version, BACKEND=
_SE_GC_SHADER_EXEC_SUCCESS, NULL);
+                                           ring_id, prio, version,
+                                               BACKEND_SE_GC_SHADER_EXEC_S=
UCCESS, NULL);
                amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_typ=
e,
                                                      prio, version, AMDGPU=
_CTX_UNKNOWN_RESET);

@@ -639,7 +644,8 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle d=
evice_handle,
        }
 }

-void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t=
 ip_type, enum cmd_error_type hang)
+void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t=
 ip_type,
+               enum cmd_error_type hang, const struct pci_addr *pci)
 {
        int r;
        FILE *fp;
@@ -664,11 +670,14 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle de=
vice_handle, uint32_t ip_ty
                version =3D 9;

        if (ip_type =3D=3D AMD_IP_GFX)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0=
/amdgpu_gfx_sched_mask");
+               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
+                               pci->domain, pci->bus, pci->device, pci->fu=
nction);
        else if (ip_type =3D=3D AMD_IP_COMPUTE)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0=
/amdgpu_compute_sched_mask");
+               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
+                               pci->domain, pci->bus, pci->device, pci->fu=
nction);
        else if (ip_type =3D=3D AMD_IP_DMA)
-               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0=
/amdgpu_sdma_sched_mask");
+               snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%=
04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
+                               pci->domain, pci->bus, pci->device, pci->fu=
nction);

        snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
        r =3D access(sysfs, R_OK);
@@ -710,7 +719,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle devi=
ce_handle, uint32_t ip_ty
                if (sched_mask > 1) {
                        snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %=
s",
                                                0x1 << ring_id, sysfs);
-                       igt_info("cmd: %s\n", cmd);
+                       igt_info("Disable other rings, keep only ring: %d e=
nabled, cmd:
+%s\n", ring_id, cmd);
                        r =3D system(cmd);
                        igt_assert_eq(r, 0);
                }
diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h index 8d=
bc4595b..166c6d7a8 100644
--- a/lib/amdgpu/amd_dispatch.h
+++ b/lib/amdgpu/amd_dispatch.h
@@ -28,7 +28,8 @@
 #include "amd_dispatch_helpers.h"

 void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
-                             uint32_t ip_type, enum cmd_error_type hang);
+                             uint32_t ip_type, enum cmd_error_type hang,
+                                 const struct pci_addr *pci);

 int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
                                        amdgpu_context_handle context_handl=
e, @@ -40,7 +41,7 @@ int amdgpu_memcpy_dispatch_test(amdgpu_device_handle d=
evice_handle,
                                        struct amdgpu_cs_err_codes *err_cod=
es);

 void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
-                                     uint32_t ip_type);
+                                     uint32_t ip_type, const struct pci_ad=
dr *pci);


 #endif
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
x 23d07561c..ceedbccd9 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -14,31 +14,36 @@
 #include "lib/amdgpu/amd_dispatch.h"

 static void
-amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle)
+amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle,
+               const struct pci_addr *pci)
 {
-       amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_GFX);
+       amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_GFX,
+pci);
 }

 static void
-amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle)
+amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle,
+               const struct pci_addr *pci)
 {
-       amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUT=
E);
+       amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUT=
E,
+pci);
 }

 static void
-amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle, enum cmd_erro=
r_type error)
+amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle,
+               enum cmd_error_type error, const struct pci_addr *pci)
 {
-       amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, error);
+       amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, error, pc=
i);
 }

 static void
-amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle, enum cmd_=
error_type error)
+amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle,
+               enum cmd_error_type error, const struct pci_addr *pci)
 {
-       amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error=
);
+       amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error=
,
+pci);
 }

 static void
-amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
+amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu,
+               const struct pci_addr *pci)
 {
        amdgpu_context_handle context_handle;
        char debugfs_path[256], tmp[10];
@@ -67,8 +72,8 @@ amdgpu_gpu_reset_test(amdgpu_device_handle device_handle,=
 int drm_amdgpu)
        r =3D amdgpu_cs_ctx_free(context_handle);
        igt_assert_eq(r, 0);

-       amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0);
-       amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0);
+       amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0, pci);
+       amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0, pc=
i);
 }

 igt_main
@@ -78,6 +83,7 @@ igt_main
        int fd =3D -1;
        int r;
        bool arr_cap[AMD_IP_MAX] =3D {0};
+       struct pci_addr pci;

        igt_fixture {
                uint32_t major, minor;
@@ -90,7 +96,9 @@ igt_main

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
e); @@ -102,7 +110,7 @@ igt_main
        igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMP=
UTE") {
                if (arr_cap[AMD_IP_COMPUTE]) {
                        igt_dynamic_f("amdgpu-dispatch-test-compute")
-                       amdgpu_dispatch_hang_slow_compute(device);
+                       amdgpu_dispatch_hang_slow_compute(device, &pci);
                }
        }

@@ -110,52 +118,52 @@ igt_main
        igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
                if (arr_cap[AMD_IP_GFX]) {
                        igt_dynamic_f("amdgpu-dispatch-test-gfx")
-                        amdgpu_dispatch_hang_slow_gfx(device);
+                        amdgpu_dispatch_hang_slow_gfx(device, &pci);
                }
        }

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
-                       amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHAD=
ER_INVALID_SHADER);
+                       amdgpu_dispatch_hang_gfx(device,
+BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci);
                }
        }

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
-                       amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_=
SHADER_INVALID_SHADER);
+                       amdgpu_dispatch_hang_compute(device,
+BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci);
                }
        }

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
-                       amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_=
SHADER_INVALID_PROGRAM_ADDR);
+                       amdgpu_dispatch_hang_compute(device,
+BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, &pci);
                }
        }

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
-                       amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_=
SHADER_INVALID_PROGRAM_SETTING);
+                       amdgpu_dispatch_hang_compute(device,
+BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, &pci);
                }
        }

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
-                       amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_=
SHADER_INVALID_USER_DATA);
+                       amdgpu_dispatch_hang_compute(device,
+BACKEND_SE_GC_SHADER_INVALID_USER_DATA, &pci);
                }
        }

@@ -163,7 +171,7 @@ igt_main
        igt_subtest_with_dynamic("amdgpu-reset-test-gfx-with-IP-GFX-and-COM=
PUTE") {
                if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_COMPUTE]) {
                        igt_dynamic_f("amdgpu-reset-gfx-compute")
-                       amdgpu_gpu_reset_test(device, fd);
+                       amdgpu_gpu_reset_test(device, fd, &pci);
                }
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

