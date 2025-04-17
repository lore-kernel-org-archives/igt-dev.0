Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3528C369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 12:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ABA10EAF9;
	Thu, 17 Apr 2025 12:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UAna0j7/";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0977010EAF9
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 12:42:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSPo/k9QvMm+8cj+dyEkRYHKtJevta/ngh1XvipD7fAzBeKN9wvOSA4c8BKGMcnhotD90qYswtaArhdZLAbHwa3PiP1hscFGWezkF5D9uJY0JP5a/ESr82gzgOie8TKGm1n1euu8k0Dq5RSOiJnozPGwr88ZeuB/Tv/28uvOyFGyTZjhxFbH+h+I8DuWCHHMPLJLCPHWYRD/Ke4e6UCht9997uLts5pPHpYI3EXvX5Fsd6EHHxk5cPiuFsB8FQh/SYXXDLYT6+ASc8R3EDPpb9OqJoslBsWXuyip8mVo/kOINdMnKpWOukTMoIrfbHYh4UgVSJujbmMA16lceY0vDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AER9V1JePfupDLKzY6s9nJ+x8Dn8dbqnq0i0A9jwsLU=;
 b=vuWO8Buj2MVKc+FN8ws+fh2CunZcwgq75SfhUc92OjbwuXbf3Zv/y+gGbafL41EUc0gOFvU/ai5ocayqYbyYS50gA1x9dV42rFdp8hEcQ5f8DhF1B0E9mf6M8alG3MvZILF7FeyiQSvGUL3TC9KdIzdjv6Lk6OYBHnDvcTVBb5Z1zlUOnEIDEYngZQO3rv0qg8tsEFeevxKvPmrSYYokT+co8vb7vzz3boGEKfNPtNR3IWhzyKjIElwFnA+GB08MXmkw4S424zHXuKg/c3/KCzlNz7/vMP6wV7mv0rmnz5jLlbFx5UZ5jZOaTv2RIxrmOjcE+aifNKE2QuhapXn+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AER9V1JePfupDLKzY6s9nJ+x8Dn8dbqnq0i0A9jwsLU=;
 b=UAna0j7/dWx2o2y58bwQRD3aiP2eLpHG31R9clngDTRgwA6l7ys9XdwAxN36xcGr+/B2BQ+s9hzIDpMsw9jzDhA0Ghl0w+2TpYG8wqExPTPBT+8TPJFK0envxbW9Tvp8RvrxCGZIHq+xhCvuTOMvXJJMoFbAcf7TRY99c3PBSOM=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SJ2PR12MB7991.namprd12.prod.outlook.com (2603:10b6:a03:4d1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 12:42:44 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 12:42:43 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "Zhang, Jesse(Jie)"
 <Jesse.Zhang@amd.com>
Subject: RE: [PATCH i-g-t v2 1/2] drm-uapi/amdgpu: Add queue priority and
 secure flags definitions
Thread-Topic: [PATCH i-g-t v2 1/2] drm-uapi/amdgpu: Add queue priority and
 secure flags definitions
Thread-Index: AQHbr3Yd4u+dllQueUa7dT92xI8YqbOnzXiA
Date: Thu, 17 Apr 2025 12:42:43 +0000
Message-ID: <BL1PR12MB57538FD3A85D29235460E48A93BC2@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250417085247.592557-1-jesse.zhang@amd.com>
In-Reply-To: <20250417085247.592557-1-jesse.zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=feaa1ff8-bff3-441c-b0d3-2b8b5606e5dc;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-17T12:42:36Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|SJ2PR12MB7991:EE_
x-ms-office365-filtering-correlation-id: 652c030f-c509-4a69-e223-08dd7dad5961
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?sIpgBEPgpkYgG7WxxLMY1uhZfqMsSEgNyFvHoO7Jo2ZPCVYAkLOy6ruJQrYc?=
 =?us-ascii?Q?oR25/zAVtU2PkyeVXaLVhs/79iCnVj0xAx3edxrXsGQOExaSk7DaJCGCnL1n?=
 =?us-ascii?Q?rNn4QlZlBIdb8aSkD2JGBtiXCxoT4RvjtgNZ80WbwGy/YCe2QU5VN1opW5ku?=
 =?us-ascii?Q?6dg/quMNL8SibzqF288B+p4Lyy3MS7NnbEvrvEOPmPvB1+IcekzINiy9rjVH?=
 =?us-ascii?Q?nHMvlmvKjZyvZHxP0ZNdF0S6LEXiR8HfZmogrGTf4nrmxeJ0wEz3gGRNuHY8?=
 =?us-ascii?Q?5KBuY4Wi8pnTPULzQK1xfQZ2UC9tRwVlkjVKxvqKHKqrYdjnnk1R1dww1+vh?=
 =?us-ascii?Q?mOe/sS2KX/gx+W2fDVZszznKiI8wlFCcu0KfT8ltLojolp3RlfYFzzCOoiwO?=
 =?us-ascii?Q?0CVpAqeHtnKEhjd7JJ4Vf/qczFpsk0wxXd142+y5Jq8xNC5vijTP50s+e72P?=
 =?us-ascii?Q?5NQQHcL1DiR0ZpzRlSufAGDgZR+V/bmbzNfd1D2paMWpoib3k6XQiphWkU5u?=
 =?us-ascii?Q?/SHY2gd44YQXRNLtEt0ckOuXSnl2khvgmiwSKCdt8B7Tg7np8GHPD1dkcWdu?=
 =?us-ascii?Q?CvF/h+CXGKjx5HCVPNJ1cGONWNiJDO6N46OTaH/zEV5hDViqHj8+uaLBRAxb?=
 =?us-ascii?Q?/fLr1E+AzwXFThEoz19ZPBMO9qFoh4hLYfBJ6P68RDsmAWFRZxflZJ/Baa8f?=
 =?us-ascii?Q?OMqu9Heybdu1A2Keyn57cyMiHC5rTeJk9MlAik8rieDOcdYNnbfYwaUOzpfd?=
 =?us-ascii?Q?pmaP1L5LofjoeFaravZhELoA9vF2W4i5zW0QRzjMR+i4E+BXAKHkF68oJIKv?=
 =?us-ascii?Q?7IjPTd0EvByNYTDNM9QEbWWjIjHkdUrjIEGxCaWwo8piGQUhVoN7ameF0qXh?=
 =?us-ascii?Q?9a4jTfthZv4W4ep4c1Z7b5vnDY54jhpUD5J/EhXVQWoc6RUFjNP+nMFg46Qn?=
 =?us-ascii?Q?UzOwfJ34jhzG0IXVN4IBaY9AgA3ZHaZanEGP66pNOcCEwY7FYR66W5LVcpl6?=
 =?us-ascii?Q?Qi1JhYD5of4gIUnDUExnzVW6dXmpIma7PNDIr3Z+5HABwJGnskGi4vGLS+XA?=
 =?us-ascii?Q?ez1Eu44cMkyTZ0TJ8UgFojyvD2xyF6gzLpHhp+M95zf1xAr+sY92zJxkjuH9?=
 =?us-ascii?Q?IIyRSV8qCNm1qZgDdED8ehsDFkdGxfxh7i07DLq79vYi1fAVvxZGtkjGvVyR?=
 =?us-ascii?Q?8yLvg6uWBWqL0UCrX2P7yDGayNrjxr9lEOzxsqzs7k76SYbFCcx2JXFUg+vX?=
 =?us-ascii?Q?9F+DZ4s41lPK/WxsJ/+45g/hPjAZC/++BFxFrmmCCmH34u6Gt08ai7iPMGtM?=
 =?us-ascii?Q?sFw66X5RTzz9hQZgIxQzB550SuTD5DvERPR94nkquiXnm1/PTRszAvKuBUNS?=
 =?us-ascii?Q?gDmy1lWkrOEuC2liCog358rlc6SLCRut73cG7vhhgGa2I5tHqfRDxq7zWemZ?=
 =?us-ascii?Q?wDWt0VVEFcQwlgdet3BiIhWzl7F3L9j1I+bQw3GedJxxygqSYUYE0w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1DJquXoAqUlXS9kCOd21jqG6x3QJyfyWu9s/QlB2HH4kcE/cK29DTJ+NBYCX?=
 =?us-ascii?Q?S3K+HKX/k33bEJMFFRJHXY6GnSleH4Fz5VhTCbhyAseuYx1LYnGAtQFgjqFD?=
 =?us-ascii?Q?uPsuhgWsZwSoQ08K0ghsU1BSMavCKd1II1ioXbTihhSHXaorwvCuY0bHVt56?=
 =?us-ascii?Q?sO6ZBvQnseCwsGfJ64usj5OYRDnQLOUYQ6PcJ5a65uU90KT7L+xIBiNstiL8?=
 =?us-ascii?Q?D7ECkz93XYgzNG4/tqbKMtFt3arwc0lTo2E5WKSkA2JJbdeI6842zGY5FSSY?=
 =?us-ascii?Q?xGVmSJJFVa8sKCyK4gaXiH0FycABzsVTouWBqSYTDT+MXs188DBYc7/7NMJ3?=
 =?us-ascii?Q?B6k4pd9KQcHVKVCQp4jFcKuyB8FjGsSpL7jFrrMdkShX89MWFz4FeSukIX+b?=
 =?us-ascii?Q?Y096nhCMcvgOYaZ8d+YSp9PgA6c1XmoOkJPdJvo3r/5AD8RCP3kUaz3FeNzC?=
 =?us-ascii?Q?LIrTycCzamRga16GSWMljsxwdrpZotGPWNwCr4Kdf2tQSCNBYsOx3Gux/6iM?=
 =?us-ascii?Q?2n9THMcvwOuaV9K2lZealmdPib76J3DUQpMJj6fU/EC91UwPY9+hJbGZitc6?=
 =?us-ascii?Q?wwZidf+Im3SmmCQbjuPDZ5/ekNjEYOtZfJEH9lQhM0HbtsZ15+MPtm9iFZH7?=
 =?us-ascii?Q?TFhqB/imgittlslrjbfQTjs8OITH6Ah7lefCKMYnzAYbhxFZ4pkkkV4+glZn?=
 =?us-ascii?Q?xU4p8osqf7PJRUjyczxu//y1nMIeaB678SnNIrZGCC6QOXVe8rTFzOMaJ6vt?=
 =?us-ascii?Q?G18ybQL8eMyfFCUxh0ztuUiEDKQvE3YyJD9gRackPgOl7Hiqo7U/Z/X/7N5Z?=
 =?us-ascii?Q?xrxDr9+np4WdzaLOJoG891zfCvyW6Gm/hBQOT1qyWdIHw+9MA/R3dSNqI/vi?=
 =?us-ascii?Q?UgaYDdBZwJjfbrboEpGg78Tn81osBZ6HBbwj0haDXhUDI/Z9o81xGxsTOUwZ?=
 =?us-ascii?Q?c9EAicQ9dtOBtvF/U/tBL4Q/9DTtNiwelcmhnIgSQ7rk62QtMi4zUGqLPO0C?=
 =?us-ascii?Q?4lrqdxwc+hFSpMmfC8Tco9OqKP0kHgEf6ZsVSx6gpBpznhWukyfqIm+57Lal?=
 =?us-ascii?Q?tzes9/GnkUxInyZJuvEENJWGg7EFXgIxWrBaEP9envg1d8/uKN4Zogv0NlRo?=
 =?us-ascii?Q?Ww9VcK+0Ma0hiNtLvZLl/nJk5mWzua7Khl4ilh0m+cn09IyPkZHoZ8NJrpCa?=
 =?us-ascii?Q?g7VgAH8H78mmuxE2pvLC5Xaq81vpIsAafEaLp/4RaOnyUuy2ffCTX5LuZIGF?=
 =?us-ascii?Q?KEPw78XEIG3kFP5epkn391qF6yJoXldaLnnE2oVVKzeupULQ908qGiJQ88Pj?=
 =?us-ascii?Q?j0MQ3gCj7Zn0V/hV9WYBDDDz0q86nx3DPOdpe4wcOiuIsEc6qTc1Nq0vtobV?=
 =?us-ascii?Q?0rneXrkO19lleuiOCT9yPO0NYI/6TTWiuCq+AC+iQMwe0jRimqlDj3aOWt1H?=
 =?us-ascii?Q?FD9o6xxzT+avcNUN7hX3lJPJGH91AJNwblDlsrTZrx1wVT/9QjbvXQ1/x0Yi?=
 =?us-ascii?Q?9efUeWq1ZSJGn2mPxgftKMAPtfkFx+rOS4C1fhhD9qFJ1iCFhLqIa8uRzV6b?=
 =?us-ascii?Q?kmNnje1FCqXNKc8zRXU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652c030f-c509-4a69-e223-08dd7dad5961
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 12:42:43.8362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 24bbqR8MUrkDL8F9IYIQDpYExVkpJoKNOL9cNdlbNgD5uS+Ol5t+OhMSNy0QN/ieEeb1f8LSwcf+6/8sRhoDkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7991
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

Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>

-----Original Message-----
From: Jesse.zhang@amd.com <jesse.zhang@amd.com>
Sent: Thursday, April 17, 2025 2:23 PM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Khatri, Su=
nil <Sunil.Khatri@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; Zhang,=
 Jesse(Jie) <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v2 1/2] drm-uapi/amdgpu: Add queue priority and secur=
e flags definitions

Add UAPI definitions for queue priority levels (NORMAL_LOW, LOW, etc.) and =
secure queue flag in amdgpu_drm.h. This matches the libdrm changes in commi=
t fdf384d4b546 ("amdgpu: add priority and secure flags for user queues").

v2: In general, UAPI changes should be part of a different change and only =
uapi should be part of it (Sunil)

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h =
index 8191d0bd0..3f4813879 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -329,6 +329,16 @@ union drm_amdgpu_ctx {
 #define AMDGPU_USERQ_OP_CREATE 1
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
--
2.25.1

