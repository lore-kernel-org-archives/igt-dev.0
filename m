Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F82C369C2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 12:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAC710EAF9;
	Thu, 17 Apr 2025 12:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ct9FU3zF";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B2910EAF8
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 12:44:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkNntvyutP3ELAfq9vYA8Q8xf5HlY2NNx4E1rW+0N0Q1igXPAvJzzDM2RN8RwudSKFz5mOIpJAkUsYHS1+CfQck+UQWiru5TiNpd+x5ipjZsvg/C+SM4t8rVLc5069S8XF42b2+PEWvpHdxshS6gXga4wk4Z7VNjG6QLHMFM1xAMhtguwCd+ML9LPiENSTYRbAqW+YhbgY+X1scqunyM/SNT1PWV9zKvbV5uh/Sw9f9vr0BmM6/ap9tSiG+9kbWyoOHQWegC25xLtod0zwe6DIYl9DhxdEXwEsMkteo6psDb4vD6oEBSha9riSDDqrwBCMQfaxjxOi+/EfWoFfGgNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5UAYg5jksVMsoyNsLGNR2mDamUWR+9vw8onHkxKZy0=;
 b=dXna1Pr8dbOrm4xQBli4z5rXdakiHwPNqyzqLknmMRnvTRu4QmPFHMitwxmw8DWHB8Gj0S1zg3iieZLFsy3GZzNB9LJB4QnXsyGCS9WNT9v2hnI8EwIBHipeKtX8fk3n/GmaYPB9YPCDt1ZH0PPVjAPwdxULLX55n243DS6qQuf3rbJUg/xuDyJeBVbk8mJi0srkUxDGGlUoVeLWIztJbNmdomGv/sN22Px/Goy/FOE8ppgXnWRw0yTKxtFtiOjM79RZbLpzw97NBDPnIL7+PIQ1tC7Le0mAmroELRAHr5kqD9T6xzmZQKtT7X5LCbjt3Y3M72El47ogBhwANFJscw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5UAYg5jksVMsoyNsLGNR2mDamUWR+9vw8onHkxKZy0=;
 b=ct9FU3zFXzEP1H254VmaUTPj3lYsFA9JeALkURSJx+/LLtlGA+xE4VAu/TfoBD7jjLBVN5XBkK+NmQqR22J39HEmZGR2XKy1L7BCLWx7pG/bFyHr9V05um9P0T8F8e2dTLSt50vGTb9bQQD5sVrAWRxUdK2wiuOHPUoMQedGxLY=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by IA1PR12MB6260.namprd12.prod.outlook.com (2603:10b6:208:3e4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 12:44:32 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 12:44:32 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "Zhang, Jesse(Jie)"
 <Jesse.Zhang@amd.com>
Subject: RE: [PATCH i-g-t v2 2/2] lib/amdgpu: Implement priority and secure
 flags for user queues
Thread-Topic: [PATCH i-g-t v2 2/2] lib/amdgpu: Implement priority and secure
 flags for user queues
Thread-Index: AQHbr3YiTdUJjOkJGkSu5yH3p6YPQrOnzZiQ
Date: Thu, 17 Apr 2025 12:44:32 +0000
Message-ID: <BL1PR12MB575322CBEB267AA09A7B38EC93BC2@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250417085247.592557-1-jesse.zhang@amd.com>
 <20250417085247.592557-2-jesse.zhang@amd.com>
In-Reply-To: <20250417085247.592557-2-jesse.zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=7c4dee36-aac4-4a61-9cf0-2d6063829a5b;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-17T12:43:02Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|IA1PR12MB6260:EE_
x-ms-office365-filtering-correlation-id: e5b53b0d-121f-4edf-d527-08dd7dad9a12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?WawrYRx8xbJykBg8qwf7+vbANmdGr+jIT33sernt59LmVmRp/jV2i7fQBiFX?=
 =?us-ascii?Q?820XKUGsaNTm6uBH8/RyjUEmEkFq0yyBzqdAupwEOuIrnMvHgWavnmDue9G1?=
 =?us-ascii?Q?c4KvJrWFi6xJxa9IOPfNSVKCIAb8y2vzQIYKGuK4VCesTQxJTdV6Qxyk3u7R?=
 =?us-ascii?Q?kZTKcQCW467W01K6j2KtQT4tc9eYgZLccvwyswhoWhbOrTyeKrfcjumgo6v8?=
 =?us-ascii?Q?k5bFCoS4PQmbuLkwwEtAE8sqlSDu0BHpR4dIyB3UXF22scNvmS4tcTAmNqEG?=
 =?us-ascii?Q?nRZKA1swz5KGL1in6sYwtgHQ59zXHT7Af9juHl1YNxvuZN4BG4VrZ7k5QfvK?=
 =?us-ascii?Q?XYjavML51PLC1WS4dwepo4JFUO1M0/dF7ri+AUGnJNis3WriTCoCezuD5WYW?=
 =?us-ascii?Q?taEKSM5UxNwU9WBFFFp8uNZbbvZgGcw5jJ5dW/xYco9lrSmMmyiUu8ovhYLK?=
 =?us-ascii?Q?O5pGxRGkBw+rY4AU2veTplAbCRTqYGEcDQz/lNy8UTlyAW9VL9rGIOJtSYUI?=
 =?us-ascii?Q?vPt4jMe1cg9Ote4yaVCdLi5a1tsvjZqBuGzuV3mzL0RneWQiDARBg69+MjHZ?=
 =?us-ascii?Q?vimpcr9RTk9f7bCuk4tQR41z4OXKPBr7dPRhfTZVo2XdHZv74ijn9WdKXSm8?=
 =?us-ascii?Q?Cj2MMgb4qy01FHDqz9iCwySoLxP7C1CUHh0f6i7ke5j18vT1qE0RxK3W3g1d?=
 =?us-ascii?Q?CRSlqDGV/s6v/nti63RAGT55ChtO4iytsK57SoQpVRP8QVCG/8hz4g0kvmkU?=
 =?us-ascii?Q?9Cno0XQt9i9CmRFP9iXPJIaGXjn1e2PbMq5CYRyQgt/wrzuGKCo1wIrrvMvf?=
 =?us-ascii?Q?hiU8/mYzSHUq7h8uJvcTdUmYbtS5irE36EGKKnKZky0syaCkH5R96gjX1AAD?=
 =?us-ascii?Q?ZY+l4SuvIfOoiZFnWIaWR4Rrghz81+3XslFGSO6z4i9cbKfiYwxK2Ssm175B?=
 =?us-ascii?Q?He6fPxKJn0sTOeCXRmsjAbrU1MU7Njr8+OEbgm2w6Sds3h6U8ex3TZXS+G3m?=
 =?us-ascii?Q?dg0hOHe5NV05bSgy9IpnOmw/mOTlNc7ttkzTJbdu3SUZ3o32n0cs/RrHSVZK?=
 =?us-ascii?Q?dsgnPA+d9359p1yBq2qC4SGD4p5k+eI7YYF9xuC/5vvDNd2QkQdGnTEeHcts?=
 =?us-ascii?Q?sjt9g9JUtp3zQwkHu2gkr/uVgC56E5GglVZoEYJXQaa2TqS/WAKj2/zihmYK?=
 =?us-ascii?Q?lvIYQMBq6zo1bV3mg6Mj8rwCv0pM6FvLnOMZgB/EuFG/GHYJ3E/DNRk0qu7V?=
 =?us-ascii?Q?P1C+RBUU2BPWbvQwMKXd0lgCkkVlbn0MmRPhS39BhIV+/0BI0ZFsrv9CL2Vw?=
 =?us-ascii?Q?M8H/Z8YasRLB4fgIXBFeWoICbMdaJHFYaTjEI6NfCEWkXUjWZglIIvWcCtRK?=
 =?us-ascii?Q?2Zyv+Wh0VhuCbJMiyzsTP72dB49Pu6FM8HeQJtd344LTBCPENW8usH55YWhu?=
 =?us-ascii?Q?xpFCUrZokx6zvHAIuqo0iFPC28SVf+xPhlbh8q36OjoMSvxwBtVqsQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X9DiAQ4ySPszCZwCKlpocAveuMcxjPM/Euk8IEciQP6dIypGflWygBjzNAC8?=
 =?us-ascii?Q?5HXwhedVHCdSOJVb7BPhPXdMDr3tfuydDBoxhHrHmrT3ju9sUjWcP1/Ctazp?=
 =?us-ascii?Q?9+VTlCaQeNRoRXDQw3FIEE5hOpcnKGt6Hcc46zCuPmfrO7OXoIoZR8bXUcS+?=
 =?us-ascii?Q?po60HbiBFKNFcLaBVCWpMLJflPoz3Rp86DjmSXILcrH+F/MbjAkf0+9JxEU1?=
 =?us-ascii?Q?f2RywTgu6YgxO/3HGIxJTb3lu7aMbTdwwcGOaBnnAz9F1hE0Lyllcp9d9bz7?=
 =?us-ascii?Q?O27PsTVYD5DTkMN1p4sDJ7ppZkLkOGE3bWrMpQBcZsHTKjS3obWCFOcUixuR?=
 =?us-ascii?Q?npws82f8KnLPn9upF5b5NgFYyXt0jSpeoylYxxN4H9emWDN3KbPva8ZOV9HN?=
 =?us-ascii?Q?Nv9XVLs7PJSgBcufAEil8KKNjq1QByhjHA4y2UaDbpEFJEnpd6HAFwqR5GDl?=
 =?us-ascii?Q?fLBq2nTp6kXeBxIcc5DaO80VFa9S/xH8Wj8lyhVgoKGIrOp9fdedGtIzjje/?=
 =?us-ascii?Q?kzUdnZizRGCynYcBgKK/JBVzHmxMW9pPk2lPRtEwjWt04ABZwTSQ629F9IAX?=
 =?us-ascii?Q?jeutKKHbKi/vh10uUFJDjpIJQgd9DalRggpUKRMvaKqziVuZgxpP2WOeVRot?=
 =?us-ascii?Q?JqfPa4DtGq62gK2OADtcUAz4+TwHBRUjbNurQXbJF+CjPRa5Dovkw087lmo4?=
 =?us-ascii?Q?MSuvOGY9AkqWxC7YtoHvbhs6EUNvxAMtz5QdD9KGz/lN6iNo5DigNjZkJiPl?=
 =?us-ascii?Q?tssJTh1RGQ4+Ws6P/cYzTd91zd6xaiDC/QuVlMFgJn4yUgo70OVexY49q6Ia?=
 =?us-ascii?Q?iwFv1DIk5t7/3qEf169L2m3ORujsSmfbpEK8ghAy+ZZu76jtAc6QFVfDuvx/?=
 =?us-ascii?Q?KwDerDNzfk9bpchJwjKL6Y10skU0N1Bzc6jVTcSHffv688P2qhivufvEiGJN?=
 =?us-ascii?Q?f1VqbvRAEG1O8bquut+RNEY9ahGSNoKiJwFyrVSUpGtmN6d4BSY7x6GtWRso?=
 =?us-ascii?Q?KzPCV4sfE0oRUVL9Y+EEqNdyKHj0BD8VI1i9TSEaZoNIudZ9vold/JnKw79a?=
 =?us-ascii?Q?f26rBhE5JB1G1y4/cgLWZhMEYnf2LXJorTeLALMofx/YYIJpsYN8fOgeN1tv?=
 =?us-ascii?Q?5UEUNIHw4B0HNov8w8uglnLM5F+rmYOR32rJDRACY2RhbrqMPQRULvEJnRVR?=
 =?us-ascii?Q?qq8m2iXEDjEQas25HrAD9gVo/ndCWi/UTZz5egJWBG9jGKVGXgYe8P3GTMq9?=
 =?us-ascii?Q?Mwg4Q9JlU7eAEsbyBz4nrUje/zPjSPk/u7cW+D8koi1jWUoKZimMzRpXaXbT?=
 =?us-ascii?Q?pTfKiL4lgf3r/25Qv+Kb7Qna9d2g1Gxczju8YJq8f9xOXkrJsqY/3BNBIOUQ?=
 =?us-ascii?Q?P+DeoH62XX0ZbCnTkKRQ6ddKiNppAqcysiVGq67NPXPKYPlypHefJqdB6CUZ?=
 =?us-ascii?Q?v9S0DwXLmss9ZpU0teS4dStieB/A9rIYXNM2p2FV01mvo4NqKefOcSX9N2aC?=
 =?us-ascii?Q?UbCv6djRnMvLgxQH9a/ViNEvHUJduFHggMio1E+qNoEYHoRNa0I+H2d+f/Gf?=
 =?us-ascii?Q?mz+ZbjC8AHrBcU4bRok=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b53b0d-121f-4edf-d527-08dd7dad9a12
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 12:44:32.4189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1BlAOA78Vev6TuauGJ6015gAUkXdG13gqDzdmEuJ/l4bmfvWg1CJb9Rlrl76lklGp94DAcszzNeAXre5vzM9TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6260
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
From: Jesse.zhang@amd.com <jesse.zhang@amd.com>
Sent: Thursday, April 17, 2025 2:23 PM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Khatri, Su=
nil <Sunil.Khatri@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; Zhang,=
 Jesse(Jie) <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v2 2/2] lib/amdgpu: Implement priority and secure fla=
gs for user queues

This patch adds support for queue priority levels and secure queue creation=
 flags in the user queue interface. The changes include:

1. Extended the amdgpu_ring_context struct to store queue priority

2. Modified amdgpu_user_queue_create() to:
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
 lib/amdgpu/amd_ip_blocks.h  |  1 +
 lib/amdgpu/amd_user_queue.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h index =
231098eb8..7d48f9107 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -118,6 +118,7 @@ struct amdgpu_ring_context {
        uint32_t *pm4;          /* data of the packet */
        uint32_t pm4_size;      /* max allocated packet size */
        bool secure;            /* secure or not */
+       uint32_t priority;      /* user queue priority */

        uint64_t bo_mc;         /* GPU address of first buffer */
        uint64_t bo_mc2;        /* GPU address for p4 packet */
diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c inde=
x 0cdd0c4f9..b396d0307 100644
--- a/lib/amdgpu/amd_user_queue.c
+++ b/lib/amdgpu/amd_user_queue.c
@@ -270,7 +270,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle devi=
ce_handle, struct amdgpu_
                              unsigned int type)
 {
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
+
I think its better if you could add both the conditions under one if (ctxt-=
>secure), with that in place its Reviewed-by: Sunil Khatri <sunil.khatri@am=
d.com>

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
+                                           mqd, queue_flags, &ctxt->queue_=
id);
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
+                                           mqd, queue_flags, &ctxt->queue_=
id);
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
+                                           mqd, queue_flags, &ctxt->queue_=
id);
                igt_assert_eq(r, 0);
                break;

--
2.25.1

