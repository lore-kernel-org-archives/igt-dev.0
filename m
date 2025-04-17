Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF9BC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 08:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DBC10E193;
	Thu, 17 Apr 2025 08:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4/glTslL";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2065.outbound.protection.outlook.com [40.107.100.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC92610E193
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 08:48:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeYgFbjhFusr9MANNtWqMEoRPCTffPwHer38/nHSlQPYkMseDR1Nw46YlFCEdCjNP78EenfTSepCvs0sInT/rpcaBkQ+E6RC9qsfqRXEACY4UjbrtHURwKjAcJDLif6REkvL+O7Nno8PJvSK5XOhfmCfi1Rlyo1dApTyQZ54yvx1UFTj+JzeLpZCKf8f68ipvnSofLGQNZNSsh6z93/IsmBY0dzdarjgVLi37iaaMF1IWpVPvQ1S5shspfXFsJRHCE/ihvSNVl5/hg6NBhTs5AzkilHARXqU2e2uTJbbEyq/uYLYSws1Pi3+DNmqWt5AOipM3inPhp7dtxIv3KfCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiU/jtpRzQuWVCwvNIOcN8aUDehzUAOeaAuDGNpIjsY=;
 b=nLIF2sH8g9RnZAi42toNOVrYMa41vAo2y7eqFvSweGB4qqXi/F/BEdlg3QgdJIFMChsyNhIwRFD+hJ+t6Btq2un5sku86oQt/h2DiVLXXLKV3CtTZhEEBKANtygkE5FlYCq7K1dzNdjk3a9twjYFV7pOq1pVSKWGVJDh4a0MD1jPFx/5rajwS+NlupYYePHOV8VefrPQVxQ7RSwAD5H8OVopCbZh17gMJsdrx2qdaw1jCEOEKnXjtKLx+iBVelgA3k6Ba3msou+etyU0RtCAZmXUrUVfKGiSDelkiA834mnTIllNDlX5Cz5E/tiO0SyRdYTDE3m9rpXAx7ryLG8/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiU/jtpRzQuWVCwvNIOcN8aUDehzUAOeaAuDGNpIjsY=;
 b=4/glTslLvwOBd1/+DJNaZ6zq6RP/lPb15TeiMlFVbNi+JTmqGM6EqHDPFgkSoYjFY/PHiFrbcdPYQMfUktzvANFGzDMyue2l6BuTIw1SmUUotnz11Ywz6RQMm6ZNS4b4IeX2bFMJ5rpkvv612OuM7rcJEHIvKN2RJkkuY6C4cFk=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by SJ1PR12MB6074.namprd12.prod.outlook.com (2603:10b6:a03:45f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Thu, 17 Apr
 2025 08:48:20 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%4]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 08:48:19 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH i-g-t] lib/amdgpu: Add priority and secure flags support
 for user queues
Thread-Topic: [PATCH i-g-t] lib/amdgpu: Add priority and secure flags support
 for user queues
Thread-Index: AQHbrz4aUQ3D51h0Wky0TUhhXDsperOnWxcAgAAwt+A=
Date: Thu, 17 Apr 2025 08:48:19 +0000
Message-ID: <DM4PR12MB515266FD2C18F45696496C45E3BC2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20250417021104.539935-1-jesse.zhang@amd.com>
 <BL1PR12MB5753741D81DE962E533BA88993BC2@BL1PR12MB5753.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5753741D81DE962E533BA88993BC2@BL1PR12MB5753.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=d765572f-cfed-4fe8-82d8-6c243865a26f;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-17T05:40:07Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|SJ1PR12MB6074:EE_
x-ms-office365-filtering-correlation-id: 619ce16d-dd06-43f7-42c1-08dd7d8c9a8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zZ+y0CI5JGHsPSocPcq8MCB263+HOwAJd5tHw4Qg0Xg2AW1f6CJWnJco2cha?=
 =?us-ascii?Q?bl3BPb4tatduGGJp6wfx3pKYkmn7mSjbPhUybZihP76Phfcsd6XxZ1lH4J4A?=
 =?us-ascii?Q?A7EbSVA6SE9eB6bbc8nbuugjJFHwFnO9ggz9bGmCVsp/wFydNUiObHEG5CZg?=
 =?us-ascii?Q?my7nxsEuOiCvArLEC/NtSpBvmXVm5IhxBF6r/caXIbbRES9KvJlLLko0wL7d?=
 =?us-ascii?Q?X+5mvCpvRC6l4NfjdAKg9geQDjZKJHMykoWq+yQ/xGzBVaCNPi3i+G5FrZp4?=
 =?us-ascii?Q?dE1RgWQg8MH8hSwSF2uj9O2VyPLQxgREDEVzjBDqv8juGSe2EcIRjgezqOG3?=
 =?us-ascii?Q?bRpRSAJnTWo7G2QTrsAQbnnBR0jfV9+dxpVu6btdeJ1ACeeiFmnc56adkCQ7?=
 =?us-ascii?Q?8nX6tJyYgSdpc1KYtsMrjvQm/E4/9uDm7DVchWq2O0hE24Y/FLPpRX7O0rJ7?=
 =?us-ascii?Q?4u2W1SAGgbffHKVbdG//+eUz0AnCR5qytwxQGpfcTJwn6OgL9nxpO2vPI4k0?=
 =?us-ascii?Q?FUYchc4yb1nCBlYnbxVr3T6EWctoflmZTQWI9FSTooN1yrPwUJBT64WiFDtt?=
 =?us-ascii?Q?NGZa2SMEjVqV9TRmoc0Z4tntTGQjXsFCT1VaYQ7kbkwjM8u6Z9/45Baiml3D?=
 =?us-ascii?Q?0yd5OTIXDx9jGDX7uuQpVEBQtBQEp92/tOAYK3jzF4pFIImfdR512//qouDC?=
 =?us-ascii?Q?tOdD2W3pQvZ4pNXVnSPzS/00cm0EXmfXvysu4sGNg05EVt52ipWXYq92/xo9?=
 =?us-ascii?Q?+9w65W8key2ycopnEOSMbLHr648BwNih8ocARvApEwrRLnT6k7NSeLpulKWF?=
 =?us-ascii?Q?zOE27ki1vYDd33XP5d8NUaiTT3Zb8V16VZP1eiXkg5Z6dIE6A5xdvDXoauIU?=
 =?us-ascii?Q?3ig/wpTGkg5ed1ZUj8kN+2LEKeYl7gjcZNmMkE/VC7u1aBX9IrsDOy9HWEJv?=
 =?us-ascii?Q?5sbiA8hBumJRd381dUzO9100q7WiP0vB+lYvebffXv1QSZSGPSS06wXB8G/9?=
 =?us-ascii?Q?MaZJEAMYtIcGQ1b14gm3pXMusAVAI1kdv+C21YTjQN+JlXng5Jqk/km3qW/F?=
 =?us-ascii?Q?qYC7obKyd7ojO0JKUzVLQqDjaesD2TqzFSC8QUKnzo6EZ07xzX74pOXhqlg9?=
 =?us-ascii?Q?fUMlItbzILmy8cTGgSVk01wgZVl/1ckNVLTqUcx1Hw8cR7QRA+kVQHpggVKR?=
 =?us-ascii?Q?MicW+htRbH22xJ/EAz6cP1cmhqJ1qHHWG7xuTWgvuhkyN4JmdKudyoVaoJOn?=
 =?us-ascii?Q?bAEYwpy3bIV3fk19k0Vc1p+GXstzyKRFCAxJ4mo/xmv91BpjfngliJTYcMCp?=
 =?us-ascii?Q?ODLWm5Gww6zJzqCI5PsPTpeqqvFPMPJkdCTjO4AXNCo2Qiqv/yMWNQ5xss1K?=
 =?us-ascii?Q?ttGojX1dDXZopoG2uH3fajMlYk0Jr018pZjLnuFiGXk6j8qb9xDEIprCB9Iu?=
 =?us-ascii?Q?AWaVdFVTLmAukY6hl/dpkvCipkEd/nEUnfox2URAA8v0IRi0yLQmZKdlNC3x?=
 =?us-ascii?Q?Th+41oBCSAyAWoQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V86gDhq6LDeTWwn7NSySVwmt0ZJuxG92nj+NlHkCCB3drIn2+y2uAddCqBIZ?=
 =?us-ascii?Q?BAgdGrPXVLhnhdhlgDZSHRXwDgJuR6gGiwm36xaQ5Y5RDQvHCxbkSTD3EHml?=
 =?us-ascii?Q?qT6CGwXHx9+Y7WFuPvIuL76YfFflD9uyt23Vjjwg8ZdZ2ASvAXXUmoKg9OId?=
 =?us-ascii?Q?2tCPNIP3Ki5RiDzrJZZkx7uAbWS7oIIcT5+9ouv3zsOMPRmBxvnWRTQKz+tx?=
 =?us-ascii?Q?/JySoRRsBrs8xjv3Gvqx58HK29i82Vshg26qzx9mpeGRQSQdXsCUfmkmpOeB?=
 =?us-ascii?Q?d6oPc8CH4ubiLxoHVjBL2gPR/vutaky8A4aPa64ObPPz5xxoVTh0d06zFcEu?=
 =?us-ascii?Q?/73+uFuO92gcKWTpsetEOGQVU619PNwqEv1I7G5EkfBX6su8VLxTVcHHrQPE?=
 =?us-ascii?Q?O7IYylz4IC1177oAg4wkc8+faW9ThMw+F2MrRCB7MNVbgxHykfUzwhd16ieh?=
 =?us-ascii?Q?6rBz8kpoNlP/mSijuYIaFl+4+D7DrCLjrAzD6h2bdCr9P3KRevQKRLhY0DaJ?=
 =?us-ascii?Q?rD2w2sXhXLB29oJQDLXCmAoPRxRHWU8YGvkAARQFVWxxR0ckFQLZ/DFChdQJ?=
 =?us-ascii?Q?ssqtajj13JVgBaT7VpcmRWUu+Kt0sCV6sOfHsMnjnS2HaYTSBGElZ3Xbp+Pq?=
 =?us-ascii?Q?z+e1ynpT2ML5KWdKYML5J6KfC7eTiLELUGd1ZGxgPIVSQ/GbBZgBSUU6wzQI?=
 =?us-ascii?Q?tTIx0tek7qoo8eLcVfT4HDhX5SSejXiOfDeCQ8OG2Z03wY8WjdjzW4EEjCO0?=
 =?us-ascii?Q?WfztHWc7Nb42B4K52rAbYJctcFi7LUrUk2HsbiYEjsJB4Vy2JXutKn38LfDa?=
 =?us-ascii?Q?nO8rOju6Yu4NMBhCWuQHQJ/QFXvy4s+z7AFTAh4Z4KNguOQOZahnW3DPO9DT?=
 =?us-ascii?Q?eZVDmAEYFuQXh0WLwRW3ligDL6BvFWkpZLn/kANO3krxuviCEOKlXf9tBtDk?=
 =?us-ascii?Q?qZugJpin3YzR+S3orHncb/oM/QL1RTqrAUtXUyKBKcAhnkBOWiHILfmno1EZ?=
 =?us-ascii?Q?KGVAwViS3NgjsCvAOhuCfzji18PaY9hr/Y6pn9rXrMomWM0e+B/+ULkiijMw?=
 =?us-ascii?Q?eXFZYnU5iJUrSAL/XAjst9oJnYdaeJaiwLM2xjXEmoeI17j1BE2igx7nhq7n?=
 =?us-ascii?Q?GCTpU/hwg6mH1yIbASvMqoIXQOrRjhs9qO4rFvU7iWCimM/yQYOUavRFgMMo?=
 =?us-ascii?Q?XWhek0ENG4OSuLm2yr1tqSOos5cceacjhc4FjEqeBKPScZn5xJCNCsebQgJm?=
 =?us-ascii?Q?AlOaidkA09aMGTLtivvwRYu100rGczgupu+GdFNvtG/vMksU0+NkNajymiSM?=
 =?us-ascii?Q?t+P5ptTMSV3vF51GftA8r1QCKteD1ZZhNiJ66I69LrvZnbxPmMlDsalw1zMB?=
 =?us-ascii?Q?FcmGW0sWplUszRygOliSxlEd8TvekpYJuJlT3Hq95hkqhB9JKlcoz2oqgRmT?=
 =?us-ascii?Q?XDQEFDzWKZT7tKJoN/5kCzY6SwVUh25a1hdNdSo5VhhbploATUga1PxNHm2k?=
 =?us-ascii?Q?RXc6N4myPj3dT/0v5IZfJQbtsZxEIeyzEmPiWAPy+OU7uGep8mw0KQRi1Vuk?=
 =?us-ascii?Q?CAu00vxUpsnb1yqGNWA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 619ce16d-dd06-43f7-42c1-08dd7d8c9a8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 08:48:19.8215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fo1E7du4mMP2CuLLcR4De5d+2r1ltdTYZJUsNzS5TbXbcJgl9l5vti8XPUSORMVhNVlq5Op6EzX8cA0/l/dB/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6074
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

-----Original Message-----
From: Khatri, Sunil <Sunil.Khatri@amd.com>
Sent: Thursday, April 17, 2025 1:52 PM
To: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhang, Jes=
se(Jie) <Jesse.Zhang@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
Subject: RE: [PATCH i-g-t] lib/amdgpu: Add priority and secure flags suppor=
t for user queues

[AMD Official Use Only - AMD Internal Distribution Only]

In general, UAPI changes should be part of a different change and only uapi=
 should be part of it. Also make sure that libdrm/kernel changes are merged=
 before igt uapi changes are made.


   Will split the patch. Libdrm/kernel is now merged.

Thanks
Jesse

Regards
Sunil Khatri

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jesse.zh=
ang@amd.com
Sent: Thursday, April 17, 2025 7:41 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhang, Jes=
se(Jie) <Jesse.Zhang@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: Add priority and secure flags support fo=
r user queues

This patch adds support for queue priority levels and secure queue creation=
 flags in the user queue interface. The changes include:

1. Added priority level definitions in amdgpu_drm.h:
   - NORMAL_LOW, LOW, NORMAL_HIGH, HIGH (admin only)
   - Priority mask and shift values for flag handling
   - Secure queue flag for protected content access

2. Extended the amdgpu_ring_context struct to store queue priority

3. Modified amdgpu_user_queue_create() to:
   - Parse and pass through priority flags from context
   - Handle secure queue flag
   - Include flags in queue creation IOCTL calls

The priority levels allow workloads to specify different scheduling priorit=
ies, with HIGH priority restricted to admin-only use. The secure flag enabl=
es creation of queues that can access protected content.

This matches the corresponding libdrm changes in commit fdf384d4b546
("amdgpu: add priority and secure flags for user queues").

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 12 +++++++++++-
 lib/amdgpu/amd_ip_blocks.h    |  1 +
 lib/amdgpu/amd_user_queue.c   | 15 +++++++++++----
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h =
index 8191d0bd0..3f4813879 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -329,6 +329,16 @@ union drm_amdgpu_ctx {  #define AMDGPU_USERQ_OP_CREATE=
 1
 #define AMDGPU_USERQ_OP_FREE   2

+/* queue priority levels */
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK  0x3 #define
+AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_SHIFT 0 #define
+AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_LOW 0 #define
+AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_LOW 1 #define
+AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_HIGH 2 #define
+AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_HIGH 3 /* admin only */
+/* for queues that need access to protected content */ #define
+AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE  (1 << 2)
+
 /*
  * This structure is a container to pass input configuration
  * info for all supported userqueue related operations.
@@ -355,7 +365,7 @@ struct drm_amdgpu_userq_in {
         * and doorbell_offset in the doorbell bo.
         */
        __u32   doorbell_offset;
-       __u32 _pad;
+       __u32 flags;
        /**
         * @queue_va: Virtual address of the GPU memory which holds the que=
ue
         * object. The queue holds the workload packets.
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h index =
231098eb8..7d48f9107 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -118,6 +118,7 @@ struct amdgpu_ring_context {
        uint32_t *pm4;          /* data of the packet */
        uint32_t pm4_size;      /* max allocated packet size */
        bool secure;            /* secure or not */
+       uint32_t priority;      /* user queue priority */
Ring_context struct is shared for both user and kernel queues and made that=
 way deliberately so we don't have to change igt a lot.
Add this priority along with user queue members which is towards the end of=
 structure but only if its applicable to user queue only else its fine.

Regards
Suni khatri

        uint64_t bo_mc;         /* GPU address of first buffer */
        uint64_t bo_mc2;        /* GPU address for p4 packet */
diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c inde=
x 0cdd0c4f9..b396d0307 100644
--- a/lib/amdgpu/amd_user_queue.c
+++ b/lib/amdgpu/amd_user_queue.c
@@ -270,7 +270,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle devi=
ce_handle, struct amdgpu_
                              unsigned int type)  {
        int r;
-       uint64_t gtt_flags =3D 0;
+       uint64_t gtt_flags =3D 0, queue_flags =3D 0;
        struct drm_amdgpu_userq_mqd_gfx11 gfx_mqd;
        struct drm_amdgpu_userq_mqd_sdma_gfx11 sdma_mqd;
        struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd; @@ -283,6 +2=
83,13 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, =
struct amdgpu_

        if (ctxt->secure)
                gtt_flags |=3D AMDGPU_GEM_CREATE_ENCRYPTED;
+
+       if (ctxt->secure)
+               queue_flags |=3D AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
This could be clubbed with previous if condition.
+
+       if (ctxt->priority)
+               queue_flags |=3D ctxt->priority &
+AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK;
+
        r =3D amdgpu_query_uq_fw_area_info(device_handle, AMD_IP_GFX, 0, &c=
txt->info);
        igt_assert_eq(r, 0);

@@ -404,7 +411,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle devi=
ce_handle, struct amdgpu_
                                            ctxt->db_handle, DOORBELL_INDEX=
,
                                            ctxt->queue.mc_addr, USERMODE_Q=
UEUE_SIZE,
                                            ctxt->wptr.mc_addr, ctxt->rptr.=
mc_addr,
-                                           mqd, &ctxt->queue_id);
+                                           mqd, queue_flags,
+ &ctxt->queue_id);
                igt_assert_eq(r, 0);
                break;

@@ -413,7 +420,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle devi=
ce_handle, struct amdgpu_
                                            ctxt->db_handle, DOORBELL_INDEX=
,
                                            ctxt->queue.mc_addr, USERMODE_Q=
UEUE_SIZE,
                                            ctxt->wptr.mc_addr, ctxt->rptr.=
mc_addr,
-                                           mqd, &ctxt->queue_id);
+                                           mqd, queue_flags,
+ &ctxt->queue_id);
Libdrm patches should land up first. Is libdrm patch raised already ?? Wait=
 for that to be merged if its raise already.
                igt_assert_eq(r, 0);
                break;

@@ -422,7 +429,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle devi=
ce_handle, struct amdgpu_
                                            ctxt->db_handle, DOORBELL_INDEX=
,
                                            ctxt->queue.mc_addr, USERMODE_Q=
UEUE_SIZE,
                                            ctxt->wptr.mc_addr, ctxt->rptr.=
mc_addr,
-                                           mqd, &ctxt->queue_id);
+                                           mqd, queue_flags,
+ &ctxt->queue_id);
                igt_assert_eq(r, 0);
                break;

--
2.25.1


