Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D072E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 04:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E71F10ECD9;
	Thu,  9 Jan 2025 04:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vgQ5M4iM";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D3F10ECD6
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 04:14:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlRs1SV9JeNCHA4/LIcXTbIX0IMAE/i1lWIXAm8ph335gcSzCAnMZM2zfSZpYsxUShK6v7wTZggwPB/EaphA1p7uH4GcgY15rrrl1htknCfOve15T7PLR2hylt6o055N/WCrutkzkjr9NAi/lrfGj2WkrYMZ21bYEb6YP6yA146EivLFzdU+mHqWMB3G0zjHYJ2zIcQkjPBQ5Udv0cOAewmJ1OHCSsUpEn/IsAnv3KAo1XwVJJs6A1o34z4Hyras9W/mB8PyEFm0ExEPTRh83BtPVmqUoMjlzWvYsHFvFQSYG0ayaUwFBaVpP1fJkfO7LlwpfOAEtvoIIAT0ShLNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZXTXqQZiXKgHSyLsDc/QTJAfFwqIYmZKA9UUSNpioc=;
 b=NSKb41IkkiiILGY4law0Tg5CEIxbwcAJVYhRq7X1HHbnWKQRVyEjjEhNFBUlVecFshpF9QVg2sZVYYR0YNB58enaAgfRoG3WUlpO+k8DF1IOimC7nIhO0uqtALtSEsstpUvQo0Apx4NJ6NmIxbD3XPhEx8ovkNJjiOncq9olwcolmqh4OhJP4/QR9t+Ndf63LzMZZL9ocUonbjNpggP8m676WSU1ipzBgGO/AGcW18p5951VwE71xzdhm4HYTSP48PH1fMFlgQWZwkArCaEXejP2stCxl0TAQOPlI2OmcXWayTPcrUeDvY12Z+/9YbLcXLu6X0FcM3OdNKwsT78k6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZXTXqQZiXKgHSyLsDc/QTJAfFwqIYmZKA9UUSNpioc=;
 b=vgQ5M4iMnshDvpcbnDdaWBKEa3VfvHBDU1uDgpaDaf5hc/4/Nql+odcV1n53wIXaCdZfWze+dgGfJDSDm7j/2l1yjv3UhJGKdJf9RVBOrh/azkS78rz8Fc4x5O46gqaKjNEn/t9DEA07vaz0GwuM6Xw2TlE0B+x3JjwARNSP/d8=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by PH0PR12MB7096.namprd12.prod.outlook.com (2603:10b6:510:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 04:13:54 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 04:13:54 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] lib/amdgpu: improve pci_unplug test
Thread-Topic: [PATCH] lib/amdgpu: improve pci_unplug test
Thread-Index: AQHbYkcsaNo7zBEi2E2/uiBqxXPWHrMN1SbQ
Date: Thu, 9 Jan 2025 04:13:53 +0000
Message-ID: <DM4PR12MB5152F541F039C0EBD450E565E3132@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20250109033222.21861-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250109033222.21861-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=4a7e98c2-564e-4573-b966-6bae8af3a35f;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-09T04:13:35Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|PH0PR12MB7096:EE_
x-ms-office365-filtering-correlation-id: 9f392efd-dc5f-448d-974d-08dd30640799
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?l+pXZ0ofY881uBvp5unrLbzpt4R+3fAiyg9PHMDNHKxT8B97Nk2qsGFwz91E?=
 =?us-ascii?Q?86YUYI5eB4xt9KhpCdTRVeqYt6I1g66AnA3Q2hQtfqQDo/GyXzL3rjtvKBRQ?=
 =?us-ascii?Q?BFUnVatOxF0f5eTMQDeXOPzjRQQrLR5vNEBPgXRSfukj/UkzZQQ/N0eHJ0JD?=
 =?us-ascii?Q?tBWAXDrd8UQ/niGvQ0ejNWHEVwT8gcZPVL1s8rAyisWQDqeg9lT05H9xaJca?=
 =?us-ascii?Q?+sYKch3QDWHlFCF+LKzMch9dg/P1z9Hi+mnCrQ9cmgUC50gq5xFBd22PDpHs?=
 =?us-ascii?Q?4NpmFvExP2KJAPgS6oyOtTeHwtA8A9O3pIQJnPCvaJy0giA4pojKA1O6A8vn?=
 =?us-ascii?Q?tN/n5oQw+5mjhRs8rF2kaeCSQVXZbLutmssDz9kADx6Clcw+J0eA6D0GUGHv?=
 =?us-ascii?Q?sCGatx5R2STZo4ukNDgQSb81OTVCVu6RcFUJ3NTGBaH221ZW1IKd7gqXP81c?=
 =?us-ascii?Q?rDpT0gb4ikmOcP3MXlHmfZ42H/i9NbebdajZpkvNmoDsc5yP7tUk0Svnr816?=
 =?us-ascii?Q?rXJ+cQwp6YGElemK6oKKbcmaweuUEtuNNwU07z2EyNq+8ww4hlnTW05sqIFE?=
 =?us-ascii?Q?ued1wSfFtrOWuYrs/nGzJMOqvf5iRy0iYvpz/7UawvI2BiLh+ngzCMmyap7S?=
 =?us-ascii?Q?zNBos/cNfBayGotTRW120kcIng2+WzCNyiUbPz4i2b3thEmHvaS2GaPcE2RO?=
 =?us-ascii?Q?qs7Jv4+kN9GLzcUS/0IPvtaSfVZiAlLAkYkdMgrfW1JjOy0iHboM1fxUZNL+?=
 =?us-ascii?Q?4FZ3eNYmJ2R6DvQLmwGu/UqgVc9xa+xA4NwCI0F5Tx4xS2+iROdI8eWlGy3i?=
 =?us-ascii?Q?TmgjxZtby/m75EpiB94ge386BZrr8CmShgmTDVY7zUwo455LjrN+ZG/RZavs?=
 =?us-ascii?Q?Sv4nD5Zar8wQWi7KxVPcp8GX62OD8PFzwWaROEBO6yrDKxHsWRsWlL7OsECN?=
 =?us-ascii?Q?8gJoXuoDoH5UXk2E68p9gZ7hZYa6i13L1+qUmVOvhLWHFm7Xhg8MPWFJxnQU?=
 =?us-ascii?Q?9irEdVBEN9ypCpuEOLq4t5SXoJbOU75ehf93ADdJx4jnNESMEtpgRNWwoVdm?=
 =?us-ascii?Q?Ow+RtIzvYwmGP9xCirupsuAEMdara9nLSlcOUZj6PX4Aocn7aEMC/EBNSeSy?=
 =?us-ascii?Q?IeFpa3lhRb/FnZLECTt9W+zxC72/Ll2+Te9wiupNmhGTIbgTFncFMk8q7qJw?=
 =?us-ascii?Q?6ZkkULk2ZEgJvdhVedYdL1w+tUZ3lY+QFwuLLbeLE2jUDsJydAZlI1EnDPZ0?=
 =?us-ascii?Q?jJ013pW8EdvgqGYOUVCMpqIvsK8U3hv1ivmC0vz5jLvECXyrRyTWXXoDD5Ko?=
 =?us-ascii?Q?WXefvhnZO95mGN0uOYVnuhtngM4JDhBs3wmmx0ejBYPDV1YbEQRBae69Wfgn?=
 =?us-ascii?Q?kxkl4dRJGx88wvcoCcymnsyilT8r1FIsxfcGjTSgKSRCSbCJG03BJ0ZzXi7f?=
 =?us-ascii?Q?E2HYmLn2cfZCgHSMvQDWJoLj0wODTdr3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BuSguoYfi4H20pNAEdWP0ATpAo6JbWppyA3n5cdErghCg64xW6zOZMxApkT0?=
 =?us-ascii?Q?aDHL3L+3eVvKAojFiS1tSSrLInfKTMB8TB1YVz/BUHIiloUoNK1DyUFXNdJF?=
 =?us-ascii?Q?dHEqiIXYjCM2Z/QC9vI6qXXN39Zk2oPtrpoPfg01Y2Yu4GuvcKudUdcQ2BNV?=
 =?us-ascii?Q?yaq/6rvfoCqRbkP2vL2euDCMOzzMDqPXR2Tl7qz8PvTWueicd5aDCB8GMyvl?=
 =?us-ascii?Q?wQ0EYfF93rH1zFhmoVYXc2gze/wUS9M3atpRItn2QBv+YTnCvkhpeidhO9h7?=
 =?us-ascii?Q?7k3ZtM8lL8E61op6tqMPx2KuUlTr3uEnR18MKsUqrS8gkum3ILQdkZQbup3d?=
 =?us-ascii?Q?3emSJ1uXNnXyIzqxuDYVeWR4+wIA7gK68SWAnk1fV/a1hVlIPSfK7X6j5GDz?=
 =?us-ascii?Q?4FuVkce0O5zUkxlbPvfBqIZkjL8ew1XkwDOcqBESPboJ24rsXrpKEwczj4ha?=
 =?us-ascii?Q?SSAT98NxUiMMRd9300AeHZ/KpNJC4NkOBPgAF2xd4UgBCGu2zaNfolXfbJbu?=
 =?us-ascii?Q?dPj0IxEH1+j4kh1dj94z/wmBFyHqZSXXwqNHRR+8W5pTLdW1xnc2B4tvyJSw?=
 =?us-ascii?Q?+GlLUyfZYH+nouohphynaqpNqHHPiqGkhYUKSFag7bwLIIbc2q90MpFXskGO?=
 =?us-ascii?Q?SoKai+ckdTwTByV0v27q40rPvDh1arrGLhtwS6xhKtOKJLTsxVhBA8P5tMLx?=
 =?us-ascii?Q?jV7amjwcTLY+O03bWuM9fvw2m/0VFzqJ3zInh4gBD02JOyivMfgj6cRRIqsx?=
 =?us-ascii?Q?YKib+GwZGDsZzbS8zTeC+QMqDRwfxymjIgITF++TST75O+hg2qN2pFSrnPsG?=
 =?us-ascii?Q?KvA4dggYp238DGoACHhJfmNRm4c4SnVmKI7iRyseF/MHdLwuul+upFYkS3RU?=
 =?us-ascii?Q?WS2AoLjvhfWitDG+eYS2e6XWakZ24cvon3vNJTDVK6x4yDC0K/l9PuqKJ1H/?=
 =?us-ascii?Q?oVlHgxDXTCH1VL2UmGO/8p/17y3cd3ss3XBP9+Pzsfwt1v94nQweitjynneT?=
 =?us-ascii?Q?c77cS0J20ayBALzHyFqfVDpd4MuCek2qmK+PfdXozU4rIXf+WqXGi3UoYGiU?=
 =?us-ascii?Q?BvYbSpUnedPey5BisrFsv18UWnp68NB1dth4MrmcP/dk5I7HivY5XW6GtNnt?=
 =?us-ascii?Q?X4sDrMA6VvIrqi81kC+XoZw+iyHpBKCWyR7J7PsPXzZdbtxfrfSLy9b2eYSW?=
 =?us-ascii?Q?0bcceh9AHZEX0HyL+2WwwcFSt07Rc5fiDTxWThMlJjbCJTzxxVZpt/l5z+/M?=
 =?us-ascii?Q?+lRYCHEChk03OOcwX2mpK/sEf9WMzro7osDGdhugoEk31kfo94ncOOkSIqSP?=
 =?us-ascii?Q?c4XLSgxSfZD8QxWrHh2U7T5m51j4+yEKjaybaf4iEC4kCtuxDAepek2s//J/?=
 =?us-ascii?Q?qr/QVe3A5EW77LBSvH5LoLK7+oQGoKHSKusIbc3IAvDpwGzTbWJ8JtApQqkr?=
 =?us-ascii?Q?ODWI+uIQcjYZxcnSIgvt4ByaMyg5ynGF0U2W3jkcCfVY9JJAogireCd6kjHo?=
 =?us-ascii?Q?PMEpsX8AU7yTx/gPPJaceeXSM0r7DqkrQYFUEXv6vApEzM/dtt8wQNonF53F?=
 =?us-ascii?Q?s6rlAJB8XUn3SifYMxY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f392efd-dc5f-448d-974d-08dd30640799
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 04:13:53.8803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mz+r+P4h4k1E+L5ktc1x3Qb88m6IszszKvOffFRgqakGM+xA1ajSDINyEaHF/LYhfmCpvIQxemd5nPB8B+Rrwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7096
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
Sent: Thursday, January 9, 2025 11:32 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexande=
r <Alexander.Deucher@amd.com>
Subject: [PATCH] lib/amdgpu: improve pci_unplug test

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Replace the 1-second sleep with a semaphore for synchronization, using wait=
 and post operations from the worker and main threads. This change results =
in cleaner code and ensures precise timing, so PCI unplug event is triggere=
d as expected during job submissions.

Cc: Jesse Zhang  <jesse.zhang@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_pci_unplug.c | 10 +++++++---  lib/amdgpu/amd_pci_unplug.h |=
  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_pci_unplug.c b/lib/amdgpu/amd_pci_unplug.c inde=
x 107e1cbbd..5155c9474 100644
--- a/lib/amdgpu/amd_pci_unplug.c
+++ b/lib/amdgpu/amd_pci_unplug.c
@@ -238,6 +238,8 @@ amdgpu_nop_cs(void *handle)
        ibs_request.ibs =3D &ib_info;
        ibs_request.resources =3D bo_list;

+       sem_post(&unplug->semaphore);
+
        while (unplug->do_cs)
                amdgpu_cs_submit(context, 0, &ibs_request, 1);

@@ -263,11 +265,12 @@ amdgpu_create_cs_thread(struct amd_pci_unplug *unplug=
)

        unplug->do_cs =3D true;

-       r =3D pthread_create(thread, NULL, &amdgpu_nop_cs, unplug);
+       r =3D sem_init(&unplug->semaphore, 0, 0);
        igt_assert_eq(r, 0);

-       /* Give thread enough time to start*/
-       usleep(1000000);
+       r =3D pthread_create(thread, NULL, &amdgpu_nop_cs, unplug);
+       igt_assert_eq(r, 0);
+       sem_wait(&unplug->semaphore);
        return thread;
 }

@@ -277,6 +280,7 @@ amdgpu_wait_cs_thread(struct amd_pci_unplug *unplug, pt=
hread_t *thread)
        unplug->do_cs =3D false;

        pthread_join(*thread, NULL);
+       sem_destroy(&unplug->semaphore);
        free(thread);
 }

diff --git a/lib/amdgpu/amd_pci_unplug.h b/lib/amdgpu/amd_pci_unplug.h inde=
x 35d4dce3a..3799a6ec9 100644
--- a/lib/amdgpu/amd_pci_unplug.h
+++ b/lib/amdgpu/amd_pci_unplug.h
@@ -24,6 +24,8 @@
 #ifndef AMD_PCI_UNPLUG_H
 #define AMD_PCI_UNPLUG_H

+#include <semaphore.h>
+
 #include <amdgpu.h>
 #include <amdgpu_drm.h>
 #include "amd_ip_blocks.h"
@@ -42,6 +44,7 @@ struct amd_pci_unplug {
        amdgpu_device_handle device_handle;
        amdgpu_device_handle device_handle2;
        volatile bool do_cs;
+       sem_t           semaphore;
 };

 void
--
2.34.1

