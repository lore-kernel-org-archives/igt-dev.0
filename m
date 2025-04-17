Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DD5C369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 05:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5488410E0C7;
	Thu, 17 Apr 2025 05:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Lt4RLZWk";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E2610E0C7
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 05:51:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSVgjdIe6pgBZx/T7UOsWkVsFY8rtOYRLc8A0R9pkFJ2Kng1Pdfg7y/NWNRoa5bC6JW5CQjDI/yLhFZXQhdo/hHIVSqvoX84mmkUOghEUVAsrsXt1cu4ht6YIzb+AQVQPiuZU2tfC10pRFva1xXEf9k27P8FmaZJycoelP4EkxFslok/e3+mCm5xgHVrmHTgxFapJNd+qXOyWb8IyDYbigOb4f/PqLWas9WjOPcc9V6+XOzvz+qy6y75oa5pYO3/K6YjO+BGHUjZjXo5EeqzM5yivOmhKLfAT+wp3I4oK1BUuzhqzAOHdOj52+jeBU4Vhs+1gHwWTuY7KMWHeffZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1K+nDzFKpqXMhReCo7qFxoYJhJyTvO6uP/+rIkwRV4=;
 b=AnpWB7ZlthutNM0xFqhK15VFQD5+mqyuEnDqod/DvIBFrAVW/8RD/0vuvhLVx/BTbo/TzYgt6gSOBFW9/Il/Qv/AsaT85QZPCmtApCf8OyKh9+Cq9vRFDsZWcXQHyqbpT5kY51Ad+MfHhtTIq6untPGrHFN9oFnakUw2qM1/5zwk4xJBqk7qydQ79ttfLYWX95cPFynhdaUJIorsoVrKK/u/5OPuXst1484OGmiTWyJIv12MW+az2uqBlnN/H2DUuIWVRUCNHyMgnq07eVh5r3HBaW+sU+GmsmdQthd99G72056UFKkw+JYW/ZK/P87I1xeCqWsfhXXZVJkBzHuliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1K+nDzFKpqXMhReCo7qFxoYJhJyTvO6uP/+rIkwRV4=;
 b=Lt4RLZWkrwk+7IeYgaVrGxmaAd9RNMOXqWCEyyWzgzW4OI+4eo2cWKxn7ibkxQZfCahc+0j09T5eGeXicNqm3ZUzrsYygxcninPvLWdVfnF90c52aa2QQzqfHNO7OtzDT6OtdPSvcQRWzF23PmzKlBq+G3krQ+JQFlNKOOaWK1w=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by DS0PR12MB9274.namprd12.prod.outlook.com (2603:10b6:8:1a9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Thu, 17 Apr
 2025 05:51:40 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 05:51:40 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "Zhang, Jesse(Jie)"
 <Jesse.Zhang@amd.com>
Subject: RE: [PATCH i-g-t] lib/amdgpu: Add priority and secure flags support
 for user queues
Thread-Topic: [PATCH i-g-t] lib/amdgpu: Add priority and secure flags support
 for user queues
Thread-Index: AQHbrz4ikT095Rp/ekeUuL4dfLP6w7OnV94w
Date: Thu, 17 Apr 2025 05:51:40 +0000
Message-ID: <BL1PR12MB5753741D81DE962E533BA88993BC2@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250417021104.539935-1-jesse.zhang@amd.com>
In-Reply-To: <20250417021104.539935-1-jesse.zhang@amd.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|DS0PR12MB9274:EE_
x-ms-office365-filtering-correlation-id: ca1f58ef-5e0a-4521-b5a0-08dd7d73ecb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PRc73uXmKAodJlc2/99PS7qJ8kBtnNcQBE/YvmhdHMx+1T5sNPvvlnCprE8p?=
 =?us-ascii?Q?7/9B3AtQwgWp1svGaOTxfA1TYXS91oVw9/uo7PpEE6W7kMWe5WPzx3rcC9Hu?=
 =?us-ascii?Q?oXyoGWyhnOJj/McdEnqaevxyGXE+Ws5jJJJGESfGUaetkZdytGrDI6dTPtfd?=
 =?us-ascii?Q?dFhE8wdV1x9c9nEubbV8FoKgLqPa1lzFl/Xc/qwilo9HX170qEXnayWJlDW3?=
 =?us-ascii?Q?JeQgoEsuaDDgoBmqDP2ZW3Dh1xxpAhLjYKjohs+qWxEZnWd8eU7WJJrHn0+7?=
 =?us-ascii?Q?LTmJmUqjhGNz8gjCrmTXL5Lovp8cf2VOWN3NzXJhuHG417hWDbb0gf2mdxeb?=
 =?us-ascii?Q?kHK/u2b4lesClc8M63UVLzRr+TvN2z+QbDQ0qwFxdf0p40sXVkKoy7LVGxy7?=
 =?us-ascii?Q?cGXOVV5VyS/UZdpEcmZMm1vjf4E5MsBlnYglns++8I6/Nks30RNwEA6Jm3MK?=
 =?us-ascii?Q?W7jPJTjQGGkE1YaOvDFW8A4FqcZY4MPET0PruV1Eitw31w1Xe3+eHgqaj2nA?=
 =?us-ascii?Q?WdokjxzUHZW83b4jPoXQlJoJFB1lnY7HL3KzTfcIKpcHr3FOubw80SEtfw/E?=
 =?us-ascii?Q?t9IzoIoPe4/0HVPnGObaOuRvoQeyHk+ddDvGE7HCX4ehaJmUJjhy65SrDRkj?=
 =?us-ascii?Q?nRdcN0I/DrgiCzMGuTpi6KmQU3//4AaXSUya1L5Gnb90LKURKHHO0BfFVRY3?=
 =?us-ascii?Q?62FK3b1WYq6sOVfYlq91n5qXwp62RVXTHxF5fXJZ7lrQE58Lsw1RFmi3GyIz?=
 =?us-ascii?Q?/OasytZVOjy2Zzvm+zOajXc8jf1wV913IFrDMtNN95mVE3IbZXgftrYWuyOT?=
 =?us-ascii?Q?nPDEg57y/GqoNyV4hKC18htmpUN6t+G2CyJ2K9yR6BK2EJsYxEA+Yo7+zJoO?=
 =?us-ascii?Q?2a9+kahQkfCgbW6xrqb2A7RcC70Q5qi3Gc+8m/cOgptFKyVDNYnlSOf8fxRk?=
 =?us-ascii?Q?JCstwdgNu+2zO29uri8f98G6NYDaW54hgzn6Jtv9PKVlEsUoPeWoG/Dj/Fto?=
 =?us-ascii?Q?16R6SmOgRvMXxrjjZPKzjMs1giDCuauc0ijLP4bFvXCVWMI70B/qrm5qRiTZ?=
 =?us-ascii?Q?nSh3QuwBQOcLRYCaZ5ASNHNhGUhTGEobHKNyY2zFRoD28zMIynOkPnbDgU6p?=
 =?us-ascii?Q?ne9KqjT7WhWk0b1BL0C0PbntfpNfNdfMDLxY3wZOfiiE7qCXWAJVbK6dk1r6?=
 =?us-ascii?Q?X+3uNBmC8SK74zq2eKmMLG+2cC9A9ub1C+E4jVsyhApRaAKXljqGiW1EnWkh?=
 =?us-ascii?Q?aCffprNBzigQwcgqrA5GizX/LHH4LHMuVv1zcO2zDsBtTwylHxbbYVSt/Ym0?=
 =?us-ascii?Q?JC2rMnyvoYw3dLHfv4fMl67UmR8UPeL5H1/aRVJpB7IazhhJMgonGVRXqHqo?=
 =?us-ascii?Q?X46nHpGmNlPhlvKkJwdypeNAeFNtYxWDylenQ+mTJ1O5x3dX8Sr5rc+Nf958?=
 =?us-ascii?Q?dLPj8jX89Tc0tr6WvoSBEHcza7gM+M18Z4V9Q4W3NkNisioVmeyuGudqjAeh?=
 =?us-ascii?Q?b3C+NgwqlA2Ym4o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?91N0AHOnbxPYpfN3woI9xKwPlQjH4+2balDOMfkajPZrooUlZIojoc38c19J?=
 =?us-ascii?Q?QQ5fo/JI3QFKkD1Od313lOX2ZAZAL1ebaeeH8Y+WgPrvvXv9SMCBAENv7EW6?=
 =?us-ascii?Q?M4hsoH8XBrdJgkRonFdnZPMxYVEjwo622hvyqRbyucRIFoLq1+KlGQn0QELJ?=
 =?us-ascii?Q?StiORNCAaH71D7UqlESN7cXwMwVIgI64dH6bCaLuF5iDfIbbS36oEJGpr378?=
 =?us-ascii?Q?R/YQk/125MVIvpW09IBTEdDSd3CkCGVI4X73/ekOebBN7ixV7/hTCaDgWVcH?=
 =?us-ascii?Q?3TPgM7tdMwLncdZH/6XRgbeqFu0khL7aed6Aj0+LhW0Q2lmCZ9t+jqk7reuZ?=
 =?us-ascii?Q?R70ceGak617FwTOcTrKLqPa6exEzUTuQWke7r6YauhC9T0IV6ectVvLq1dVJ?=
 =?us-ascii?Q?sccY5XMTPlL/zdQ1vzV9hehib5JNnnPQi5PNaOYB1I7PRUuske8VAhanxFyE?=
 =?us-ascii?Q?M5J+NfLBBnfUf3k5vyf/t6tZ/NGfaY/21rQQPijuLllzjGdLLNKry7Uf39Pq?=
 =?us-ascii?Q?o3LOZN4+R4KNOTOWE45YYFrlvao5j5vNDcRYFhpteZdV2dLTF9G0UUeZ0B8b?=
 =?us-ascii?Q?M7oKMvmBjFjyJ30yBTw0wwJyMktbjyuQcZsQJmKXFRnr3Vji2Ak7Stihxvbm?=
 =?us-ascii?Q?ElrdPVj7xqJtbb3Hwxm0+bG9yShEa6b8e6PrScgH5INjoIyteyOXSILGnqGA?=
 =?us-ascii?Q?mxHFh6fdUlcqO7r5MB4AYBGkonCsZPeU3oW8DVmTJ+xV1sF+E8TE2onkrfw2?=
 =?us-ascii?Q?3vIzc9Yvvnq/zQdEVFcr65c/yU2noliaYr8Yg2JoMG87pxfvL9KGLI0YxBQC?=
 =?us-ascii?Q?U++w61kjoJJxEr85GCOCSZU57Q+kBzG4+kDJZZV/DNq4WTnaFOBoMJ6igoFd?=
 =?us-ascii?Q?3QLPxuOzKbGK4h6IAw5MfuRefhfEgb8k9f8Je/fIedJYg3Qm7cLamyxi0aFH?=
 =?us-ascii?Q?o+wf/WqfID47ezAGYfqwbUKkjgiZl3MWB+Vy29kMUuqnJwyZ7gGduIf+49Ev?=
 =?us-ascii?Q?x9JYbsNRytoP9ghfhXP9xVV/53TWFR9PSmcSr26GkPEJhro0KgKhGG8B7fe7?=
 =?us-ascii?Q?p/gvvrbYGb0vioPCa+MzbxQb3jIOFT815c9odXIG9DGrWHyL4+aOlF6LE6kd?=
 =?us-ascii?Q?rtKNavquxVWqjjTr6RfOmnEL71qevYf9aX/+OrS1PTrf7fmGBB04cC+Ijekq?=
 =?us-ascii?Q?T7HMF8DRQLQHWui2IvXj1S5wmY4AT34WFIrLQcNfYfKh9QdzlErTXXURySNr?=
 =?us-ascii?Q?glBdpcb7f/BZzC9zdA65//C3oTIuDyXVn4i+dSa/5aVQpp6KacJ5z1VFbZe7?=
 =?us-ascii?Q?xgN4musWPU3fgAIyyOUBmnOVWEV5R1etHQCHlvcwh6cipOuiJeFJzSs/HH8H?=
 =?us-ascii?Q?WrMqf6MjE2RC5x2W2V7M1G04JzX7xIXm2d/esmQOnD6qq+k4rPJ0IWEu8oJV?=
 =?us-ascii?Q?P9oJa+Rj2+KNsxUI1/P4GF05Cq5mpErFBphLQrvwp7tl5yed8ecv0JNUv40Z?=
 =?us-ascii?Q?Kpo4byGt3uyKQO9Px7XJ65LWL9wLuSG4shgxoEniHbfS3VgWgICrADHloBX5?=
 =?us-ascii?Q?g6HbqlHxtoWPSfT/cco=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1f58ef-5e0a-4521-b5a0-08dd7d73ecb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 05:51:40.1926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: znbJgf6JitaHUGeUpusg0EXaVNuelOQIlkprgaoDj+u2PkvcRazmiLK21eTkD67YP/t580tjcAKTFbZXOyQ25w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9274
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

In general, UAPI changes should be part of a different change and only uapi=
 should be part of it. Also make sure that libdrm/kernel changes are merged=
 before igt uapi changes are made.

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
+                                           mqd, queue_flags, &ctxt->queue_=
id);
                igt_assert_eq(r, 0);
                break;

--
2.25.1

