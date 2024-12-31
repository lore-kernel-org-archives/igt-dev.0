Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A90DE77188
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 05:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609E410E09A;
	Tue, 31 Dec 2024 05:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CSPwcyUp";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF95410E09A
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2024 05:00:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMZUcFj6JK62kAwgwTzsxNPYA+6JcghkI9ZRl8FtHHlsSwEaaxyt59+8PS86oYg25J+uuzdZewa0NRBNUG+HdXdIKMz+sS1/uTSqb5NnVSjQDOaJE4kR/k9I6nZTm4LNuHBhzAOXp4qukFazcY4+HUPARdA4cHJCccSemov6915AOSYDcZr2/h3U5xIAWkozRljdt2J2/PjPeKMo+lAXN1hPotAunQlBqdyC/hHfl0cdzn84IuR5hAUP0jSAfdwLfmBsr7/9OMu8SfQO+jcf2MNJw945PXky398W/75DHKf6lzHQmmNkP6Gwwjk+FJ3ZLgvvKf1KoB9dKcCJ/Nsg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEMmCqs46wHxaBcJ1XHkIJx4DN0C/aYsxILx4BIRcVw=;
 b=seel7Ve4HTCMkDcv387GVdQgq5Cf0LC7/dz73vGBIgd6NfG0fhg7eLutcA0U2XwRtDRgtFP5TVI2B8NdIQz9NVPMI7ZpsqO5QQbxI9EZqhmHs1r2auco2Z0La2plESRdPxZtOWzy7j2JCikJl8EHeFhLEEqkzgAgw87gK44t9UPLbCOBratw9tkhnbukG7N1+HNonzTQHyijAcbJuI84bfqGPxfXmgld8w2EReFUmh86XG10JpridzbHpVj2FwzAx+1qfWW4yiGKQWjf6+WlhcQtbtBNZKTM3DiNtNaccmBTMeZrzbV8n3b/tvt+NxIClR3b0JuiWEhMpT8uOENRbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEMmCqs46wHxaBcJ1XHkIJx4DN0C/aYsxILx4BIRcVw=;
 b=CSPwcyUpmyWwjBjY8ffNWso2onIZhUtlapnDivKyOG60UQ0/5ozcwLWZG3iE7yALjuXq3nUmuv+uhlsvEAPSbvHi9tddQDdtMT/0tZfj3FEXNKVV2+8fYaR/JuRkV5++kwjTCk3JyjZQ84kLzblZ0Ss1J3ZLaeJ65Yf+xvDUFoQ=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DS7PR12MB8084.namprd12.prod.outlook.com (2603:10b6:8:ef::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8293.19; Tue, 31 Dec 2024 05:00:09 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%4]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 05:00:08 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "Khatri, Sunil" <Sunil.Khatri@amd.com>
Subject: RE: [PATCH] lib/amdgpu: enhance readability of packet creation logic
Thread-Topic: [PATCH] lib/amdgpu: enhance readability of packet creation logic
Thread-Index: AQHbWvWd0DLu8xvfz0K3nTStUM0DZLL/xEAA
Date: Tue, 31 Dec 2024 05:00:07 +0000
Message-ID: <DM4PR12MB51520642D5060086D31AF515E30A2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20241230200115.93749-1-vitaly.prosyak@amd.com>
In-Reply-To: <20241230200115.93749-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=60cec6e2-609f-409f-a220-6be7b5839a01;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-12-31T04:33:05Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DS7PR12MB8084:EE_
x-ms-office365-filtering-correlation-id: 36360041-85d0-4509-f5cb-08dd2957ff64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?06bT5wYndiA8toBAnsdZljtBv+oKLqRifcX586jhh55yhy0VseQv6Jn4yMdm?=
 =?us-ascii?Q?QrUpkQaRO8eGqu7s2KvN4OyCyQ8JLWNzXFLtC31P8myKkvoOTt7LFf5ncA3F?=
 =?us-ascii?Q?rHa9Nug4DxadepJKINHM0nAcEgjHHAUJqe3QOB38mUJoM8SbKLQh9ZmKJNGN?=
 =?us-ascii?Q?JzJKn/5vCVqXFYivxAJSA4UA9evYBZM7J4CrCKvssmfSFpm6bQypDdVFPVLh?=
 =?us-ascii?Q?BttrVy9FUG4x6r3R0yqQuAT2ft5GoofBSOcDjvqTnF4QWYp8injooAYZQrec?=
 =?us-ascii?Q?/DV7l0UF1ucg1trjN7ZbQzkEM6h/i0VfymkfbxK2TbQ4AMAxQkZ00gKp/d1r?=
 =?us-ascii?Q?sSyyQV+W5cACYyKJw/NI4QKFJMAOyBySGJnhcGEdPzf2epKMn6k9yKxzUHlz?=
 =?us-ascii?Q?glsDmK6BoI1XbduS5/l+L0JD5/F/0bVCxRJAdZ3HRITUMf2hXz/BulfwYyvU?=
 =?us-ascii?Q?fMN0snyySh3bTNbfwOy5dAD3RR6SS7E19rv9E21hPsyfwFgM01rBK/ximOiR?=
 =?us-ascii?Q?R25x2i2azjB7vR4NFjIcY3TSJLcK4l2HemCXvFcq8bIc7JumXMXU1eaNr8xJ?=
 =?us-ascii?Q?ALYbvjhJ/BMn10cLj9JIMtnhq2GjRLqfqqj6679gTcOH9M1cQJsx5cukNaPw?=
 =?us-ascii?Q?8RjGU3aq3kXpB/xLOiyfsc73efZq/ml+yFCO5TO23X0kDYT5O9baYspRaYce?=
 =?us-ascii?Q?FGnd6BeebIHvM3tGe8hICUiFrNdY9mXLuVW7slu76RQbwEtFVx4WAMm2bkNq?=
 =?us-ascii?Q?xisb1I+g0+E5m9RXDwLMYPtTYzmUkeogwrVb5OuZAKOTMf6KXf1gwJyWhpG/?=
 =?us-ascii?Q?LBYTEBiEaoKBWQCrXy+hq4yzW8TTOTGFsxyrTJ2bgrSGpOBRvHISFv2BYYAs?=
 =?us-ascii?Q?iBChryTQPYbhA9rhFRequmAKbBQ7hmC4ytu0Ap8JbpeSkXyL5FlXJBrtkY/O?=
 =?us-ascii?Q?7wKpDFaDpdpbrFBMMW6PGNh1sSk2cGSazsS8A5djU00rnIs+KskCk66T84sb?=
 =?us-ascii?Q?tiflKPMcnZUqyq16GZX7UPZ824xk/YGn23+M1lPkQUm13ETIBnKQEHcSXsWs?=
 =?us-ascii?Q?2iXlbxOHsRjViiWhQk6c5hni8YcU8Tjqb4x2EBqrarMakwuTRgMTUw9dMdMX?=
 =?us-ascii?Q?7LeILqyfPh6oa36638dmasS0yZ1u7TQJQjLUA4VtpqNQm8bQlBGBxVAsUw77?=
 =?us-ascii?Q?LlpV1ekyc3JPuO8VDF+t9CXMxNnaEDqrBDYWBulVjuuGriAextpMaarWCwul?=
 =?us-ascii?Q?9q/qOfQ2RKuEAJtjlYcJ/pMHmebtIWgHj/W8264vtqUDz7jjBqCUCeDpjxQL?=
 =?us-ascii?Q?TjVX9jLuETexEBOwlR8i9o0gyKBHcM1rlCCmSAKvqQV4c6VzUUAznFaeBnrC?=
 =?us-ascii?Q?ibM4IKR8jHhQ+ywukdoS7nuC4KsrtqF7kprMJHH0FHm3A+50X2Wxdbpp7ops?=
 =?us-ascii?Q?aWszSZdOXDSbkpXatN+UrIZWw1jlcuWM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aBxDefJb1XT2VgXf9soHauaP6X0qKGrfKi+ES6f/K1BNrrJFCN7pXuW5i+Nx?=
 =?us-ascii?Q?v7b6T9E/lTXD0NaWBZQuC/K1qtN4Zt/QPZN2PyhOQ4qgfYIIjrnf5T81oPZT?=
 =?us-ascii?Q?lZx1jZrDm12EhKa+l4+0u4klaNwSGzKtYpOjDe9n5iKRTzhnt6WJIhWVWeRP?=
 =?us-ascii?Q?M6kB+9pufBtyes+dUFH9cWHvjKi58coLOZGE/cnvbzblULam5FnKzdcd3VND?=
 =?us-ascii?Q?+f9JrUi0xhjKVcfIUGkOprXhmYa/In99XpFS/fB/MBquKN9goAdLA4YKlsOi?=
 =?us-ascii?Q?zHIQ75VUJC3qL00zF43NCBMJIlSTUQzWateHkdxTqaNKRONVVIF027+Roqs/?=
 =?us-ascii?Q?jTaa1HWPXAG001yjk6rB39C7WpZeUi9FTo8q/zarlKxglgV677+SzuewW1yg?=
 =?us-ascii?Q?C0W/enSmO/WLWrAaNIT2dPMlAfMJZtguT204oUBtSBlm2nmahZV19heaVRkx?=
 =?us-ascii?Q?FUa+iN16AW851w41AEMyNsMnlDtTLKQ3/lp5zinyi5SmQP6mz1TgDqakQ+H1?=
 =?us-ascii?Q?cXSdaXdZtzJw4BX0hHVQbJHDMrq9GC5CuFTe0Dd7fEdO6kQb8E7X2jMHTeUt?=
 =?us-ascii?Q?Pwx+eK2NYRZfnWAF7xo9oPy7Zb9MgL5GhmJhEjTLX8Ub1AHblN5YbqYnhv3R?=
 =?us-ascii?Q?LtNqU250fGSL0dGpDYn9TY4kOwDktjDyAjipGLWLAB2e5v0N3PIisrQtNR1M?=
 =?us-ascii?Q?9dxRY8akIPcN5FWdgyXnF51770qoBsPKSfL1SUbBvC2KbPCn+7VZnWmAkkqx?=
 =?us-ascii?Q?OAkHEBUSJFdqXrfmkKhqW2/YGObu7diEyc2a/83jWianUTLAl0uzhRptmGVt?=
 =?us-ascii?Q?5yaTI+6Xwm0BYOHGioYKv1/0U4QHO5P0g2l/9sBVALM5bc2O78J54poFgMis?=
 =?us-ascii?Q?DwRm9ArUtF+5jub0RunbtNyftEpiMv1at2HDBAK6GzQ4gTpnm/yGhPp3TbCu?=
 =?us-ascii?Q?+i3w3nk9qS8eoobHdyuhxIcmztBFzsraWIL+QsqqjeND8pbUVg4bmbd216cn?=
 =?us-ascii?Q?fJXNiEbH0RCh2V7QaQQWKobKJ9sctsXzMgeJMiyWHkmLFQPLUf/kxrET7t0A?=
 =?us-ascii?Q?ORB/864dWTX3/MzjITtukaHBnMuu/DAmRxKQNy+YurmoStIAd2YFAWlOD060?=
 =?us-ascii?Q?TvnKWnS5/V04SAHs983WY4CMQ6z7tlyLApmH00FDNGgpTnxCamZZLASjMvho?=
 =?us-ascii?Q?Y4Tyn0GMwK0asVlnSO5LvtfA+4lGULa3iZAZOH89D82VPpaP33LtzNzNiLvT?=
 =?us-ascii?Q?OdJITSdd9KFY1xFJGEQDqw3zT8j+0pvj2tFDNzHeBvgX6DjdCW44TUnNZaOk?=
 =?us-ascii?Q?WJxlTQfG2isVnRWTBIDPQoTMVjZlTSkoulBMAUy5MLlbRysqrU7OGnEQa2KA?=
 =?us-ascii?Q?7fhyG9m54krQObvh1qerANF4DwU9l6qo4X8iaX6To7n5lVji/LJ3dMPNnQ8N?=
 =?us-ascii?Q?x3snF5IBVHDY9dsewEEEOv6WJL5UilMCFZ4PkoWVjRCixgH0OyvmH6XEFylf?=
 =?us-ascii?Q?p9nzsUTKnMdbt8U6JvOBcJNw+ggnxjqu2ximYbudEQIy+3kj21yRL/f2LwUv?=
 =?us-ascii?Q?DIVmcKg18sB36bBmlR4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36360041-85d0-4509-f5cb-08dd2957ff64
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2024 05:00:07.9831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fo2NkG+t/khaR1p/Kd4mEOMnG5g6yJB0a21upkhFhUKIagxZRKkpLr/O6Eg0sN4Zb8hVuO+L8J1fd/ie6oLbVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8084
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

This series is good for me, and
Reviewed-by: "Jesse.zhang@amd.com"


-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Tuesday, December 31, 2024 4:01 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexande=
r <Alexander.Deucher@amd.com>; Khatri, Sunil <Sunil.Khatri@amd.com>
Subject: [PATCH] lib/amdgpu: enhance readability of packet creation logic

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

No functional changes.
Added PACKET3_SET_CE_DE_COUNTERS, PACKET3_INCREMENT_CE_COUNTER, and PACKET3=
_WAIT_ON_CE_COUNTER for PACKET3 operations specific to GFX6 through GFX10.

Cc: Jesse Zhang  <jesse.zhang@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_PM4.h    |  5 +++++
 lib/amdgpu/amd_memory.c | 13 ++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h index dd483baee..5=
bc3cb783 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -216,4 +216,9 @@
 #define mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR                   0x54f

 #define GFX_COMPUTE_NOP  0xffff1000
+
+#define        PACKET3_SET_CE_DE_COUNTERS              0x89
+#define        PACKET3_INCREMENT_CE_COUNTER            0x84
+#define        PACKET3_WAIT_ON_CE_COUNTER              0x86
+
 #endif
diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c index 208e20=
eb8..92ddc9fe2 100644
--- a/lib/amdgpu/amd_memory.c
+++ b/lib/amdgpu/amd_memory.c
@@ -24,7 +24,7 @@
  */

 #include "amd_memory.h"
-
+#include "amd_PM4.h"
 /**
  *
  * @param device_handle
@@ -328,20 +328,19 @@ void amdgpu_command_submission_multi_fence_wait_all(a=
mdgpu_device_handle device,

        memset(ib_info, 0, 2 * sizeof(struct amdgpu_cs_ib_info));

-       /* IT_SET_CE_DE_COUNTERS */
+       /* IT_SET_CE_DE_COUNTERS valid for gfx 6-10 */
        ptr =3D ib_result_ce_cpu;
-       ptr[0] =3D 0xc0008900;
+       ptr[0] =3D PACKET3(PACKET3_SET_CE_DE_COUNTERS, 0);
        ptr[1] =3D 0;
-       ptr[2] =3D 0xc0008400;
+       ptr[2] =3D PACKET3(PACKET3_INCREMENT_CE_COUNTER, 0);
        ptr[3] =3D 1;
        ib_info[0].ib_mc_address =3D ib_result_ce_mc_address;
        ib_info[0].size =3D 4;
        ib_info[0].flags =3D AMDGPU_IB_FLAG_CE;

-       /* IT_WAIT_ON_CE_COUNTER */
        ptr =3D ib_result_cpu;
-       ptr[0] =3D 0xc0008600;
-       ptr[1] =3D 0x00000001;
+       ptr[0] =3D PACKET3(PACKET3_WAIT_ON_CE_COUNTER, 0);
+       ptr[1] =3D 1;//Conditional Surface Sync for wrapping CE buffers.
        ib_info[1].ib_mc_address =3D ib_result_mc_address;
        ib_info[1].size =3D 2;

--
2.34.1

