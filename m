Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AF8C4345F
	for <igt-dev@archiver.kernel.org>; Sun, 28 Apr 2024 01:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D2310E055;
	Sun, 28 Apr 2024 01:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5mMtr6i3";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7224E10E055
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Apr 2024 01:37:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgP35MAyKuqSmBRlAibtOB3WmQTNAPc3caU42gpRUmxUlHuCD4kPamj+xvMg2DPgIDDqsDZPqINVhJegn1GgZsBbrZ4Cxh/qc+cMTpyyR5DbVHNgTQEegXAx4DoCRMym+YLXd0lM+KUTPkaZHWAsPU2EEAyNdsJ5gfK617Sgk51QUP0gtGZrH4bRjRabu1KLrWG0w87Lj/Whc6RAFray85+TN7lQRshIy41/JA0nGY/TFN5RsNMhRCZqWo7wvOTp7yUOGeUSvcx6z6YL0RbLNZB/TAx7njig5RI0QT0siSAevvRMRNouvMutC0LOsv4XT96dQg8doqwQwCQ7wq+2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6x2R5uJ1rXOrlR7sAp/DVv6p+mA0XxidnSQaMVbUA8=;
 b=ZLSvIcKIx7csz3FgBMDiXtmTtvyQaysrLneIVm1M1wU8woqL9azdp0Ab01kGtApUF8YjRy9Wf1Ea8XIu6nJnKktFVGcMk+GzwgXC+8ndHGMIITbTeyELnLG66RMvidy79hBKfB3rnlMywzzlY+92tvPZ4FTQ9glV0AeRZlYCe2Q0ickBQjsk3XbpPUptQgYc4qJn9rz+6Wvr+uQ6fug5QcCge3hW7akp+bzYoUxZBrvdGwFkNCWs8rfinHa0mkZZ9V4zG55gBPb7ePdk1EqQLUsUBz3D9uQUVFj1MlW3SuH4LrAQykaVTDUrw8RekZS77dvhjXnGsfTMdgQY9Kj6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6x2R5uJ1rXOrlR7sAp/DVv6p+mA0XxidnSQaMVbUA8=;
 b=5mMtr6i3K5MXzE8bctMe6QZw+/JZyJI89zTR9wI1k0oFywvEtCEy97yeVUK361eAFdXezvUfweuLtbI5odMqAo/fy6XUEXnahdUj5rNmokYe4drDoDXR4q+xfo6jrZOO9S9WMkV0/qkJoMwPOFKrGZAc5Kt5jFW+c2XmU00iWQw=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32; Sun, 28 Apr
 2024 01:37:30 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::6d24:19fb:11d3:b00e]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::6d24:19fb:11d3:b00e%7]) with mapi id 15.20.7519.030; Sun, 28 Apr 2024
 01:37:30 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH] tests/amdgpu: improve fuzzing test
Thread-Topic: [PATCH] tests/amdgpu: improve fuzzing test
Thread-Index: AQHamFjNoGLR6+1ej0qDtYI19qRYzrF86Hsw
Date: Sun, 28 Apr 2024 01:37:30 +0000
Message-ID: <DM4PR12MB51525472EE973CF7C90001B8E3142@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240427040946.539853-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240427040946.539853-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=1b065735-806e-4a3c-9432-8e26794f2111;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-04-28T01:37:10Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|MN0PR12MB5786:EE_
x-ms-office365-filtering-correlation-id: b299b6da-3a01-4320-a793-08dc6723c4e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?Pm85Q3bxDfEJ71tCE8EvoqBHYKrJ69QJtGa+q3ZVN2kx4rudBLijomEGebJx?=
 =?us-ascii?Q?OAMX42DpQ7XhoGrLskB1SCc//vkP6Po1QqnBUdIQArnhODZr//DsP5CG3K38?=
 =?us-ascii?Q?In296Ee5kwP+LgZqjcpt6SvbNLOOVXaRfwm6zjfnUpoNK/o3aJzySXwI0ACt?=
 =?us-ascii?Q?Mr1KsiTvWNU7OHgw4RE/yG08zspcY5oMBk4Jgr2bcCYCxNNs71Quxene2DrG?=
 =?us-ascii?Q?Nvo9yiLFef8r0WY+UB0GcG1UcNhg2Ds27JdGr9Boo6j8QRhAtss5n0vdo29z?=
 =?us-ascii?Q?ZdD5EeXDqzjkdeeA9tUuU4yO8zKt4m+WdJNAKHL8RW8Y7aNOgFJLLpcmQuqQ?=
 =?us-ascii?Q?uW9zux6V+FcnXeutLxpBhLBlLMjSLFlG61zYdBH5iLjx5BEjiy2oCNuFqoJ5?=
 =?us-ascii?Q?Z4StkA6Pv5sjQEZEMh8oTOO/cag/NzV8ZR/Z3xg+8fZS/szc2zK4i49YNqAp?=
 =?us-ascii?Q?bDPU/Yl0BRjl96wXc22COy28wb2wPe6GjcKHZS6PmYB6c5dXPqoyHuQB8YKX?=
 =?us-ascii?Q?naQBxXNt3I5bXeAq5ycZsLa4BqxCY1xWnZ1JPAx8gsdA8sxz3+R0SgCBzhEg?=
 =?us-ascii?Q?1tQXUFrVnmzBGK6QgBkIXjsCiOpMdUaKdk4YNWJLDInBXoRRhGnHNzmSrGdz?=
 =?us-ascii?Q?qWnhH+sKuOHdV2muCtJ1/zUX8iLj5iCLz+ojQKZwBzZQ8AxbaeKFP60w1pok?=
 =?us-ascii?Q?HnMGrSnbP1kLRhXlIL/Wa/ypyfk7poT8Eja2qwaduCIwMBw7xSLZF5fZ7tJJ?=
 =?us-ascii?Q?7hQnVDaCmmloBE/QgTEhowM3Pkg7CejfYb1//u3J2Qc2oMt/KEeZy7WU/Isj?=
 =?us-ascii?Q?Hz0o09bcJndDqZLn9PgJGnYatRVvjTnDE+06w7yQ89s0pY+mv+nWdwB6382l?=
 =?us-ascii?Q?1lxfLuUAG3KwW0ejUR2Xe4NnOsQpgGCe8u+bkuS0PwJ+WV1Rq0fP/Ql9VTto?=
 =?us-ascii?Q?PwfSYonLMeu7XzvEl6bgWEsuEBk8CM/8A/sUOq+1fvT4mfR/Z+ttC6/Lk3ii?=
 =?us-ascii?Q?H/kCAutJEtkOmkkPs/18zKzW0TcoFcLhHIib3lkjj9awhVL86Xmco7VnRtpD?=
 =?us-ascii?Q?cr5KQFroFmDS1hCNR3p+woLo/QTOZ0bKm76Y7+r3+tANVWE9kuhFvzoAnLzF?=
 =?us-ascii?Q?s38Ott4EwAb9v3jfNcoWQ+zLu3CWOF9zn/oWgfLsHom4wjmDNck6Gm1VejFx?=
 =?us-ascii?Q?qtdKzy5DUPdtpzlngD7pyU4eCo+buGpG3nK5JurRm5ifPxRTr0uV55ChhA84?=
 =?us-ascii?Q?tFVJys98vidsPPrBjSp8VYdn7CRg8DKeoxbBHcmUI3Fe9lrxK8Dn7sh0bman?=
 =?us-ascii?Q?mih7XXsl8dqYcay3wBwxfJBGCDVBb7tHzvv3sB16Tz6uMA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w0OTPNSGtLiNyq/lTMdv6zJKm3Wfv4iVkeYyUSd1o2ICzO/pubIM1aAwrbVk?=
 =?us-ascii?Q?qi6/+Gq+ooPzaX0/DMqb0EfYJu1H8ZGGYZmyzwDQ7RuYtKZexdwipSnpm3u7?=
 =?us-ascii?Q?gwxit1HTkH2DPD+4lF0WsgDO9RK/HPp0HvfZ+6QL3pb6L+fKqZfB4JVi9UNz?=
 =?us-ascii?Q?n8ZDhXWZ9TsZOM/cpZf3v8nUHwDXUxevgQPtMX6SyXa4uimivtCzFlkDdQmH?=
 =?us-ascii?Q?QmwjGPl9cyRyMHjxCh6jOXrTJktbLpyFYxAov5cbILrWGetEMULt6GQ3Cme+?=
 =?us-ascii?Q?gWcZrQGTkRG7Yy0k3TxDe596xLMmqPmgHyIp/+ll5uxCBUY7Pqoij5sKolKu?=
 =?us-ascii?Q?XOkSFedAB4eb1VgqSb1iu4UyQnJLdct5axeMUapwk8RMLtAvmmTSSdybF2BU?=
 =?us-ascii?Q?fz5qMyHsC7/RenmhgkLNQ6taoibV/aJHl4H+rsrCZI++e9L50BmaEkDjDubt?=
 =?us-ascii?Q?ZMqVKRzuV97MMkslTIZF3K6MElD7WopmkTdCtnLxIgVBHDdRxqGXiGPRQ0Iw?=
 =?us-ascii?Q?kV+JCcV+XImfyiMqzg9Bl8vp1r5gk3jLkwNBJDzxYqZYx0IMJdICDH78mSt3?=
 =?us-ascii?Q?pe5CgPC1H3gKEU6F43qHt9/oWBjf9MLtmnsVNt01LPa4mOTQHe3DTt+o80wV?=
 =?us-ascii?Q?bxE1wPsuPQ9tTALmgqK2boWaMNM4RitZ+Yj3RoKGgMej1EzkZu0pn84C5MhQ?=
 =?us-ascii?Q?8PJ07EImGJNjnJI5j8Nw+8AYGa0vtZSc97VrwR/zZ9hEYgqdF/fl5+OF5Ia9?=
 =?us-ascii?Q?I3mYQvFemutcKLoN89qJklsYanJEsgmY1/3d5GemDEeqJq5BF9yIBivENlNb?=
 =?us-ascii?Q?tEcWpHwPejcADNSDZ9p6GSxJwbLnQwpFqQIQ5efiBXmL615zdXhKP1VtkTSi?=
 =?us-ascii?Q?IriycCfoTcUUs3ENoHAFJ65aD2yr4ElWw7qjMzKhTZ/O1dDQyE2aO+n0GxER?=
 =?us-ascii?Q?N1OmCbJ0b46qUDTL+36reTeMrzAHu+AsfE0e32A1pz4FoH5VeLPIqlZzokT3?=
 =?us-ascii?Q?5xM/S/ZsztVclrV1NWbHHRCHGwvxO5SRhHWABOeodyTXhJOsUJjePrjZ9m+6?=
 =?us-ascii?Q?4exWMxG19ob7APQ6kqJzKBoV5okHqdj9FnGQqMfPV1Rm21I6YzrPOJb8ZbaJ?=
 =?us-ascii?Q?hutqSiNa+YAXJdUF+JdX2h8q+h6qXjaJ0KghOAWz0IgHIUQ5cXiJocGDfzyQ?=
 =?us-ascii?Q?wx7R9K++f6qmOY3tQijNYlWozjFBiqO3AhOOnBTKzPBM2wqyNkcjFXpbXDj9?=
 =?us-ascii?Q?Khx6mgRxCxyGBCyDnGb5xDi+xiCzfv3F4vhxXz3Ah5cYgebOSSChlkkWHye+?=
 =?us-ascii?Q?VRum8gDq/YxmVGTNObk4ZHVcOOZ2ui16hcL02aIcf8jmaVuPqw5W0ZHBA6pM?=
 =?us-ascii?Q?PwGYdm2imutYrWitQ3c2bAamSB80yL9k/zpxf9eyUjiXvjTkyr4oNwv7N+Vy?=
 =?us-ascii?Q?FBw2McpVKJoorAUUti3SieHwrKbqS8kTAAs7yD/Okk8KKByRETOsclbxJ/DS?=
 =?us-ascii?Q?98uKEoyHJ8bQ6xX18oTNMrTl1Rh/mslyACUYLrjxhynFNbXlYmMqq0dJbDRS?=
 =?us-ascii?Q?1kv7N2e3RhKOmZteOsY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b299b6da-3a01-4320-a793-08dc6723c4e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2024 01:37:30.4799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A73nWvUiMk+taV2MbBqunjsZt8clhYLK2KKyBIrL4sK4daMR6ItjT92d/2w2vLD7rliEtHiA9PKhNhdMxDTkiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5786
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

[AMD Official Use Only - General]

The change looks good to me.
Reviewed by: Jesse Zhang <Jesse.Zhang@amd.com>

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Saturday, April 27, 2024 12:10 PM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Kamil Koni=
eczny <kamil.konieczny@linux.intel.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd=
.com>
Subject: [PATCH] tests/amdgpu: improve fuzzing test

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Improve cs wait for fuzzing test by using all possible IP blocks.
Due to some IP blocks being different for different ASICs's the return code=
 for ioctl  DRM_IOCTL_AMDGPU_WAIT_CS is ignored.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c index =
b47b26cf0..b2bba83fa 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -91,7 +91,6 @@ void amd_cs_wait_fuzzing(int fd, const enum amd_ip_block_=
type types[], int size)
                r =3D igt_ioctl(fd, DRM_IOCTL_AMDGPU_WAIT_CS, &cs_wait);
                igt_info("%s AMDGPU_WAIT_CS %s r %d\n", __func__,
                                amd_ip_type_arr[types[i]].name, r);
-               igt_assert_eq(r, 0);
        }
 }

@@ -160,7 +159,10 @@ igt_main
 {
        int fd =3D -1;
        const enum amd_ip_block_type arr_types[] =3D {
-                       AMD_IP_VCE, AMD_IP_VCN_ENC, AMD_IP_VCN_JPEG, AMD_IP=
_VPE };
+                       AMD_IP_GFX, AMD_IP_COMPUTE, AMD_IP_DMA, AMD_IP_UVD,
+                       AMD_IP_VCE, AMD_IP_UVD_ENC, AMD_IP_VCN_DEC, AMD_IP_=
VCN_ENC,
+                       AMD_IP_VCN_JPEG, AMD_IP_VPE
+       };

        igt_fixture {
                fd =3D drm_open_driver(DRIVER_AMDGPU);
--
2.25.1

