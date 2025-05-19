Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E783C3ABD8
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 02:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B23710E314;
	Mon, 19 May 2025 02:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OgzA2zdo";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAFD10E335
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 02:45:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWokJSEKTgXrJf5TMWh6JejdlpaCXwPXPltj+Svo5GQjFBBOdR1rxSF4rZ/CeTfbWjZACg45Ulps1Kspu0mQPL40WFWAjYuZ7Ydi3KD9PEqCNp15H4Swof+iSPjiBWmLsnB/eaY8xptPxDaNWmqkYVwgxzMlSiTtjd95v5HdlLH40PZmTjbCPZ4f3WDJtZ4qVqphgQqGCIvBu96sibBJhGGj+spjmeI+JSBw08sWaamJIQ/DzKM53pVSoh2pLc3vUZOgCIkJex05sreoEZNCPhVdWfYbk5J4dcHDaj1tBtXHGvCEvFyt1ZMAuMzDHF+3DfNdn0+VCjHThSBY6IT1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1NfEBS4KbhTWY4UILW4H/OmCCxGJxYa3gHJNsyDdC8=;
 b=PeoGPk3Uu4liC3st167KPLyb4MVoE30s9KsdrFjBHkxg6zopcA8U1Rtq29wvOGKwWVn49jq6VddSl1YFn3f/c72222Cz6ImClYLpdU+Qzz54v4Y6YSIv/Y08QD9d2Kj9gCt83XdDXEa2o8JLxsFt/igNWdL2FknUOfNVY5YjAq4BZgJMQAK0AHvecOJWMdQOlGDQOctShQOQfOV1yqwKdAKnYxLgmeQSZ3tDa2ihoxg949UPqeUa9tdH3PIxhvTzwNpNUCuCbNS5xbPE3FZFA9i7bqdwTF+fIktVjzDbCN46fBiVHmqA/KCPQJQVq0wvctXMtj3r3JATMLtXl23gJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1NfEBS4KbhTWY4UILW4H/OmCCxGJxYa3gHJNsyDdC8=;
 b=OgzA2zdoCQtIcey/sGy/YGrP29Q+5JetKIzs06NTTp0if8aHM7z20OOLBt2AXPxcC8zx9qAgxFmnlqLkqrPx6HWYRMS8uLd6VxR4tMaYZ/Pfrt7jlwi3IDUOcQ5z48Wp7+9T556PQ/bdkRu8yBbkolqJH2HRpEW7960iNdIZ9sc=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by CY5PR12MB6408.namprd12.prod.outlook.com (2603:10b6:930:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 02:45:27 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 02:45:27 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Mohan Marimuthu, Yogesh" <Yogesh.Mohanmarimuthu@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 2/2] tests/amdgpu: add fwm preemption test case
 for userq
Thread-Topic: [PATCH i-g-t v2 2/2] tests/amdgpu: add fwm preemption test case
 for userq
Thread-Index: AQHbx+aOG/5GZmVmQUWBcVPvraSrS7PZP0Hg
Date: Mon, 19 May 2025 02:45:26 +0000
Message-ID: <DM4PR12MB5152117AB462B2B8EA3A076AE39CA@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <PH7PR12MB6633E37C674801431E4BFADCFF9DA@PH7PR12MB6633.namprd12.prod.outlook.com>
In-Reply-To: <PH7PR12MB6633E37C674801431E4BFADCFF9DA@PH7PR12MB6633.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-18T11:57:30.262Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|CY5PR12MB6408:EE_
x-ms-office365-filtering-correlation-id: 26cc45e7-2ee6-46eb-1abe-08dd967f3627
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?9Jj9VQvwk1xAJTIxblAMEotmfMc6S0qOyJNPxc438SQGNpc4vqHNSqh/K5il?=
 =?us-ascii?Q?LkDXBdI2EugqJcV8VGe+soDO2g8MLWoUyBvZSo+XCVRYwgougT1soGfnGPtJ?=
 =?us-ascii?Q?v3Smp1/cJja/1Oz2JYdhrP16gcWViLNhevDUxqVOQ3EIxVV6oDDG7g1ZT3yn?=
 =?us-ascii?Q?eOxJakQ51YrKSxCj6EjCGucn8+uVMisgwoKAthg7PgkboHrGdEB2mwLI8bYN?=
 =?us-ascii?Q?0zYJRGFeRkBLsszm3IlgIdy+TzB27EtuCE3eF6kXkayyvJ8340gq+tvcMHl/?=
 =?us-ascii?Q?5/I/JL2xPZRKVmhYSfpVrU2vCGGVR4T91IkdXTQ5joiUakdt+rI3Ah1H9z36?=
 =?us-ascii?Q?0LBzTvkqLpSYixvvMV/PoFFLLnMOAQAFPRoIBojmrZwBa3yqaPJw/mLBCuja?=
 =?us-ascii?Q?YO8H9Xo2svk0/bRLHIQKyNImNtyoFPFKFxh3kgzMdLYg3HDdvaJscW/e/gNl?=
 =?us-ascii?Q?pW4YKQaPbmyApgcX3QmxqUyh2H7frO6/LBM5e93C20TuIAy7zKRvNzWzswtO?=
 =?us-ascii?Q?sdcZZpYZa5kqJmgVq0RdYL6EZXePGg3x5NnExnnEoHdtQ9I9DZdM4gG02lQN?=
 =?us-ascii?Q?6LEaMc9dPNlxXBFZVvEcewkQvxJ6f4qdClgos2DSum6loVe3zSa7Xaf+wkun?=
 =?us-ascii?Q?gsfGByyLsguWISafX5RhPSg8t+ob4xez4FE5PLka4NtYN1sHKTCleu+Q7VZM?=
 =?us-ascii?Q?FOZfphFMwHq9G73OvT/01C6F6YdpBXYa0At9KfF8V5R77s2BPuOga2dvyKGd?=
 =?us-ascii?Q?XsTHO73J/bZC6evxs9bJLGnZRmx9U1d1SDgBZQluJ4hqDj0jW4eKBlh4ODmF?=
 =?us-ascii?Q?Om8OVD4xwXgvYw5nNh1PgRiP0UGEAvBO280/oeLIUnClYjLxurExlpxS2tdZ?=
 =?us-ascii?Q?YQ5JpsN/T0goFL6PvTeXpvKhOZglJSvjQkiBye5PeN9+4QIkQCTWubb1tLi7?=
 =?us-ascii?Q?6rjZjUTLUHYQHC4m2hiIOMoJdKmvlPieHTrun5dlyphXkvgWB8Hye0Ibp7sQ?=
 =?us-ascii?Q?PSo7J5X3QqrJOrUIhYAfeuD4f864RcWnSCzPofRSTodQ9Y76sKOHh4EfRgo5?=
 =?us-ascii?Q?tCW92QTKXfhUenKapqB0G+Mm5Dsx8Jy9NrG/BYQr72pdYfkPAyoWemoVgpcz?=
 =?us-ascii?Q?igI9dldYAQ0s7q6wKbqcVrWNHTR1Yj+j0UCEk9kGDaVKwQ9MFMPTkoTJRS8P?=
 =?us-ascii?Q?D+rlRYUepCJT/vF3FTo6+1rlaT6MpneG0erFku4bZ5Ksf44CyVeZZBR3dmUC?=
 =?us-ascii?Q?JCjYmnPzK3ahG+nU7FvOo2izVUQSj3AYvkn4oA9peYFZQSG1yRtt4pPt/QVU?=
 =?us-ascii?Q?HgG79Po/ufnS4bUtFlOdl20Ykwt4nuk5mMYt23fM935nym3clasfNcUx5ntS?=
 =?us-ascii?Q?unCx9oKh4778jrIaw1xN/UdAevot9yeEnmP+xsfgjbaNIsu84lADGjtrwuIZ?=
 =?us-ascii?Q?8hNuy5zMti3gFzbgMk13cluTUtNwSZB8FP/TtUwNju+Az8XnAfh/Og=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DFdRar9+AOl4x4yNR8VleFpzf/hqnHqEUo3hGI9sKauQQKsT14H4IHLgAmnn?=
 =?us-ascii?Q?uZ+F8y7xDdxeVU+vQrn/6tzKwOPGAKOa1r8Q0LfrXWBQhHmcg/jbQGEIbXVU?=
 =?us-ascii?Q?rqwGMM88trI7I1NY6xCKNLqUvMaEeBSx5RjxFqDXtw6XsNRT9Oj5hMrxzRIO?=
 =?us-ascii?Q?XvycR6awfM1q2nqOqzamOR+xqdGKArINNsUHqOgKLoOolgEeNbDKoftffHgm?=
 =?us-ascii?Q?IPfbyaE4gQnS8AyLApnWuveVzsT+Y9fR4zqyfMK5jSVyXLjQXRPT8MsDFQOz?=
 =?us-ascii?Q?TggsVXEmB0sNOhUZh7hCIay/4EvEkH2C7kQSIw8EXqP24i8HcMOfEWB0+v5X?=
 =?us-ascii?Q?+X+gqNbQ9bmWLV0zrh9VweNSAJGvX4k5gdQEppZVrOQYq+NHVMqSKMOac81Z?=
 =?us-ascii?Q?XWF7pBSBlswm20Wue3pvTDRVMZOp4pvjaXdLzfzcWKRYUixt/nGXfGJnpBNS?=
 =?us-ascii?Q?IUwtsgKcsZDI6rPYrkZLkvmhiWK4v32+VQC4O1Beil0U6ssiNxGnOe68H7mJ?=
 =?us-ascii?Q?AZyM8/5wSh2CuJsRXiZKHH8q+O2mP1cCkZqUyg6LKlEBCcfHDmDmPKI7kofG?=
 =?us-ascii?Q?rJ81WorIUOCF7YpC8PQ10KHwVllJePNvDhxOZshdyLIrHYt6ntsYnJkkqnsk?=
 =?us-ascii?Q?jL+9GTB+7x2KRlG2fwKlEiKH52TwSaibTVoyvLEh9NLbnzqV88gaDaZ6b/4O?=
 =?us-ascii?Q?hGEFU3ZGfn71teukJIa/vXHl16tgd5ZanYaGqwRXyiteKe0WEaC8AiQbNtu5?=
 =?us-ascii?Q?EcLVY83RhXlm1yzz64qvOVGd5qzFlJs+ZMijWqfD+OOXCYjguTxEK1YKGkdK?=
 =?us-ascii?Q?CZuXkOeXXQoccoVVN1Dwu7Uo8+rUt8niZQxnvb0s7FVzjcY6F02pI2WrpcwM?=
 =?us-ascii?Q?iJxZb1rE5uPVDKJLya1sKRV3eOBaMAZQkehQqIQdqJ7WoQ55jRFggPCMwGVN?=
 =?us-ascii?Q?tdLH6yFpPfkxJD+zDWWyLl7EeZr6B2mqOobs3u2UV68QGD0jdihds1ObbETX?=
 =?us-ascii?Q?wcy80HyZDlHaFoyBiW0woVy3w36ITAv/IXtKfVX0WiEwDQGBV+QzNvDbzu42?=
 =?us-ascii?Q?gQd310lXuaN9ztgbQ6L5hbPhcjlFlG9ofZoI7u4zysfL8J8GAY5Y8AFoqHOD?=
 =?us-ascii?Q?VMBiBdqHmsh5v+dTEbP/Qrc1vmMODfW1rLS7cDd8xtsg694F1GfGNs8g7bAi?=
 =?us-ascii?Q?HyMxteI89dx4f/s3KoSnl+aYggfTZoqtV2L5VS4qHmPgvZbcP0FL77uIGnVk?=
 =?us-ascii?Q?n1nDnKbg0gVgxf/+zm29j/q7Nqvt8790/q+cdQqZb9r5AQO8vN/h5XAQlxW3?=
 =?us-ascii?Q?TC5IMTAzn/AIj2gct/mNzlq3Se1AQulf9lT6Vaf4kni1VgNFpQ2vUrKMaxXy?=
 =?us-ascii?Q?Jk/Zg+1YTqkMExFeQqmXX/OSSMVZ1nK2QHx6A/UMbieJ0QR3cnt2VXuCP1li?=
 =?us-ascii?Q?9T7TxuRHg8L0qSSk3ExGRLO1PL+CCQzdZ1vrUkV+hXtMOgP09JzI6oJ4LGhv?=
 =?us-ascii?Q?HgzaWd67myPZfKr2WFxfMsoA3c2wBB982BwRAcMvFr61H4UGawoD3XZewMsB?=
 =?us-ascii?Q?s+szdFYAkA7faolu4to=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cc45e7-2ee6-46eb-1abe-08dd967f3627
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 02:45:26.9724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99dFScC3PRU82buLSayWEdIBiOCyisIQscuHWK4AL978UDg3ktanE9J00VaOdpzOAwQxJ+WA5GjBn/hgDGnzzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6408
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mohan Ma=
rimuthu, Yogesh
Sent: Sunday, May 18, 2025 7:58 PM
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 2/2] tests/amdgpu: add fwm preemption test case fo=
r userq

[AMD Official Use Only - AMD Internal Distribution Only]

[AMD Official Use Only - AMD Internal Distribution Only]

The fwm premption is tested using below algorithm,
1) create 2 queues
2) submit dma write job with unsatisfied fence on both the queues
3) if the dma write passes then the test has failed

v2: reduce timeout to 2ms

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Jesse.Zhang <Jesse.zhang@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_PM4.h     |  17 ++++
 tests/amdgpu/amd_basic.c | 178 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 195 insertions(+)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h index 8f59b4223..d=
6a8446f4 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -195,6 +195,23 @@
 #define PACKET3_INDIRECT_BUFFER                         0x3F
 #define PACKET3_PROTECTED_FENCE_SIGNAL                  0xd0

+#define PACKET3_FENCE_WAIT_MULTI                        0xd1
+#define                FENCE_WAIT_MULTI_PREEMPTABLE(x)         ((x) << 1)
+               /* 0 - no
+                * 1 - yes
+                */
+#define                FENCE_WAIT_MULTI_CACHE_POLICY(x)        ((x) << 2)
+               /* 0 - LRU
+                * 1 - Stream
+                * 2 - noa
+                * 3 - Bypass
+                */
+#define                FENCE_WAIT_MULTI_ENGINE(x)              ((x) << 8)
+               /* 0 - me
+                * 1 - pfp
+                */
+#define                FENCE_WAIT_MULTI_POLL_INTERVAL(x)       ((x) << 16)
+
 #define        PACKET3_WRITE_DATA                              0x37
 #define                WRITE_DATA_DST_SEL(x)                   ((x) << 8)
                /* 0 - register
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c index 914d=
27909..075057960 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -689,6 +689,176 @@ amdgpu_sync_dependency_test(amdgpu_device_handle devi=
ce_handle, bool user_queue)
        free(ring_context);
 }

+static void
+amdgpu_fwm_preempt_test(amdgpu_device_handle device_handle) {
+       struct amdgpu_ring_context *ring_context_1;
+       struct amdgpu_ring_context *ring_context_2;
+       struct amdgpu_cmd_base *cmd_base_1 =3D get_cmd_base();
+       struct amdgpu_cmd_base *cmd_base_2 =3D get_cmd_base();
+       const struct amdgpu_ip_block_version *ip_block =3D get_ip_block(dev=
ice_handle, AMD_IP_GFX);
+       int r;
+
+       ring_context_1 =3D calloc(1, sizeof(struct amdgpu_ring_context));
+       igt_assert(ring_context_1);
+       amdgpu_user_queue_create(device_handle, ring_context_1,
+ ip_block->type);
+
+       ring_context_2 =3D calloc(1, sizeof(struct amdgpu_ring_context));
+       igt_assert(ring_context_2);
+       amdgpu_user_queue_create(device_handle, ring_context_2,
+ ip_block->type);
+
+       /* allocate bo1 for dma, bo2 for fence and bo3 for ib for render co=
ntext 1 */
+       ring_context_1->write_length =3D 1024;
+       r =3D amdgpu_bo_alloc_and_map_sync(device_handle , ring_context_1->=
write_length, 4096,
+                                        AMDGPU_GEM_DOMAIN_GTT, AMDGPU_GEM_=
CREATE_CPU_GTT_USWC,
+                                        AMDGPU_VM_MTYPE_UC, &ring_context_=
1->bo,
+                                        (void **)&ring_context_1->bo_cpu, =
&ring_context_1->bo_mc,
+                                        &ring_context_1->va_handle,
+                                        ring_context_1->timeline_syncobj_h=
andle,
+                                        ++ring_context_1->point, true);
+       igt_assert_eq(r, 0);
+       memset((void *)ring_context_1->bo_cpu, 0,
+ ring_context_1->write_length);
+
+       r =3D amdgpu_bo_alloc_and_map_sync(device_handle, 4096, 4096, AMDGP=
U_GEM_DOMAIN_GTT,
+                                        AMDGPU_GEM_CREATE_CPU_GTT_USWC, AM=
DGPU_VM_MTYPE_UC,
+                                        &ring_context_1->bo2, (void **)&ri=
ng_context_1->bo2_cpu,
+                                        &ring_context_1->bo_mc2, &ring_con=
text_1->va_handle2,
+                                        ring_context_1->timeline_syncobj_h=
andle,
+                                        ++ring_context_1->point, true);
+       igt_assert_eq(r, 0);
+       memset((void *)ring_context_1->bo2_cpu, 0, 4096);
+
+       r =3D amdgpu_bo_alloc_and_map_sync(device_handle, 8192, 4096, AMDGP=
U_GEM_DOMAIN_GTT,
+                                        AMDGPU_GEM_CREATE_CPU_GTT_USWC, AM=
DGPU_VM_MTYPE_UC,
+                                        &ring_context_1->bo3, (void **)&ri=
ng_context_1->bo3_cpu,
+                                        &ring_context_1->bo_mc3, &ring_con=
text_1->va_handle3,
+                                        ring_context_1->timeline_syncobj_h=
andle,
+                                        ++ring_context_1->point, true);
+       igt_assert_eq(r, 0);
+       memset((void *)ring_context_1->bo3_cpu, 0, 4096);
+
+       /* allocate bo1 for dma, bo2 for fence and bo3 for ib for render co=
ntext 2 */
+       ring_context_2->write_length =3D 1024;
+       r =3D amdgpu_bo_alloc_and_map_sync(device_handle , ring_context_2->=
write_length, 4096,
+                                        AMDGPU_GEM_DOMAIN_GTT, AMDGPU_GEM_=
CREATE_CPU_GTT_USWC,
+                                        AMDGPU_VM_MTYPE_UC, &ring_context_=
2->bo,
+                                        (void **)&ring_context_2->bo_cpu, =
&ring_context_2->bo_mc,
+                                        &ring_context_2->va_handle,
+                                        ring_context_2->timeline_syncobj_h=
andle,
+                                        ++ring_context_2->point, true);
+       igt_assert_eq(r, 0);
+       memset((void *)ring_context_2->bo_cpu, 0,
+ ring_context_2->write_length);
+
+       r =3D amdgpu_bo_alloc_and_map_sync(device_handle, 4096, 4096, AMDGP=
U_GEM_DOMAIN_GTT,
+                                        AMDGPU_GEM_CREATE_CPU_GTT_USWC, AM=
DGPU_VM_MTYPE_UC,
+                                        &ring_context_2->bo2, (void **)&ri=
ng_context_2->bo2_cpu,
+                                        &ring_context_2->bo_mc2, &ring_con=
text_2->va_handle2,
+                                        ring_context_2->timeline_syncobj_h=
andle,
+                                        ++ring_context_2->point, true);
+       igt_assert_eq(r, 0);
+       memset((void *)ring_context_2->bo2_cpu, 0, 4096);
+
+       r =3D amdgpu_bo_alloc_and_map_sync(device_handle, 8192, 4096, AMDGP=
U_GEM_DOMAIN_GTT,
+                                        AMDGPU_GEM_CREATE_CPU_GTT_USWC, AM=
DGPU_VM_MTYPE_UC,
+                                        &ring_context_2->bo3, (void **)&ri=
ng_context_2->bo3_cpu,
+                                        &ring_context_2->bo_mc3, &ring_con=
text_2->va_handle3,
+                                        ring_context_2->timeline_syncobj_h=
andle,
+                                        ++ring_context_2->point, true);
+       igt_assert_eq(r, 0);
+       memset((void *)ring_context_2->bo3_cpu, 0, 4096);
+
+
+       /* wait for gtt mapping to complete */
+       r =3D amdgpu_timeline_syncobj_wait(device_handle, ring_context_1->t=
imeline_syncobj_handle,
+                                        ring_context_1->point);
+       igt_assert_eq(r, 0);
+       r =3D amdgpu_timeline_syncobj_wait(device_handle, ring_context_2->t=
imeline_syncobj_handle,
+                                        ring_context_2->point);
+       igt_assert_eq(r, 0);
+
+       /* assign cmd buffer for ring context 1 */
+       cmd_base_1->attach_buf(cmd_base_1, (void
+ *)ring_context_1->bo3_cpu, 8192);
+
+       /* create the ib for ring context 1 */
+       cmd_base_1->emit(cmd_base_1, PACKET3(PACKET3_FENCE_WAIT_MULTI, 4 * =
1));
+       cmd_base_1->emit(cmd_base_1, FENCE_WAIT_MULTI_ENGINE(1) | FENCE_WAI=
T_MULTI_PREEMPTABLE(1) |
+                           FENCE_WAIT_MULTI_CACHE_POLICY(3) | FENCE_WAIT_M=
ULTI_POLL_INTERVAL(4));
+       cmd_base_1->emit(cmd_base_1, ring_context_1->bo_mc2);
+       cmd_base_1->emit(cmd_base_1, ring_context_1->bo_mc2 >> 32);
+       cmd_base_1->emit(cmd_base_1, 10); // random incorrect fence value
+       cmd_base_1->emit(cmd_base_1, 0);
+
+       cmd_base_1->emit(cmd_base_1, PACKET3(PACKET3_WRITE_DATA, 3));
+       cmd_base_1->emit(cmd_base_1, WRITE_DATA_DST_SEL(5) | WR_CONFIRM |
+                           WRITE_DATA_CACHE_POLICY(3));
+       cmd_base_1->emit(cmd_base_1, 0xfffffffc & ring_context_1->bo_mc);
+       cmd_base_1->emit(cmd_base_1, (0xffffffff00000000 & ring_context_1->=
bo_mc) >> 32);
+       cmd_base_1->emit(cmd_base_1, 0xdead0000);
        Can we use the existing function write_linear to replace this?

      Regards
      Jesse
+
+       ring_context_1->pm4_dw =3D cmd_base_1->cdw;
+       amdgpu_user_queue_submit(device_handle, ring_context_1, ip_block->t=
ype,
+                                ring_context_1->bo_mc3, true);
+
+       /* if fwm packet got skipped by firmware then 0xdead000 will be wri=
tten */
+       usleep(1000 * 2);
+       igt_assert_eq_u32(*ring_context_1->bo_cpu, 0);
+
+       /* assign cmd buffer for ring context 2 */
+       cmd_base_2->attach_buf(cmd_base_2, (void
+ *)ring_context_2->bo3_cpu, 8192);
+
+       /* create the ib for ring context 2 */
+       cmd_base_2->emit(cmd_base_2, PACKET3(PACKET3_FENCE_WAIT_MULTI, 4 * =
1));
+       cmd_base_2->emit(cmd_base_2, FENCE_WAIT_MULTI_ENGINE(1) | FENCE_WAI=
T_MULTI_PREEMPTABLE(1) |
+                           FENCE_WAIT_MULTI_CACHE_POLICY(3) | FENCE_WAIT_M=
ULTI_POLL_INTERVAL(4));
+       cmd_base_2->emit(cmd_base_2, ring_context_2->bo_mc2);
+       cmd_base_2->emit(cmd_base_2, ring_context_2->bo_mc2 >> 32);
+       cmd_base_2->emit(cmd_base_2, 10); // random incorrect fence value
+       cmd_base_2->emit(cmd_base_2, 0);
+
+       cmd_base_2->emit(cmd_base_2, PACKET3(PACKET3_WRITE_DATA, 3));
+       cmd_base_2->emit(cmd_base_2, WRITE_DATA_DST_SEL(5) | WR_CONFIRM |
+                           WRITE_DATA_CACHE_POLICY(3));
+       cmd_base_2->emit(cmd_base_2, 0xfffffffc & ring_context_2->bo_mc);
+       cmd_base_2->emit(cmd_base_2, (0xffffffff00000000 & ring_context_2->=
bo_mc) >> 32);
+       cmd_base_2->emit(cmd_base_2, 0xdead0000);
+
+       ring_context_2->pm4_dw =3D cmd_base_2->cdw;
+       amdgpu_user_queue_submit(device_handle, ring_context_2, ip_block->t=
ype,
+                                ring_context_2->bo_mc3, true);
+
+       /* if fwm packet got skipped by firmware then 0xdead000 will be wri=
tten */
+       usleep(1000 * 2);
+       igt_assert_eq_u32(*ring_context_1->bo_cpu, 0);
+       igt_assert_eq_u32(*ring_context_2->bo_cpu, 0);
+
+       /* set the correct fence value to finish executing the ib */
+       *ring_context_1->bo2_cpu =3D 10;
+       *ring_context_2->bo2_cpu =3D 10;
+       usleep(1000 * 2);
+       igt_assert_eq_u32(*ring_context_1->bo_cpu, 0xdead0000);
+       igt_assert_eq_u32(*ring_context_2->bo_cpu, 0xdead0000);
+
+       amdgpu_user_queue_destroy(device_handle, ring_context_1, ip_block->=
type);
+       amdgpu_user_queue_destroy(device_handle, ring_context_2,
+ ip_block->type);
+
+       amdgpu_bo_unmap_and_free(ring_context_1->bo, ring_context_1->va_han=
dle,
+                                ring_context_1->bo_mc, ring_context_1->wri=
te_length);
+       amdgpu_bo_unmap_and_free(ring_context_1->bo2, ring_context_1->va_ha=
ndle2,
+                                ring_context_1->bo_mc2, 4096);
+       amdgpu_bo_unmap_and_free(ring_context_1->bo3, ring_context_1->va_ha=
ndle3,
+                                ring_context_1->bo_mc3, 8192);
+       amdgpu_bo_unmap_and_free(ring_context_2->bo, ring_context_2->va_han=
dle,
+                                ring_context_2->bo_mc, ring_context_2->wri=
te_length);
+       amdgpu_bo_unmap_and_free(ring_context_2->bo2, ring_context_2->va_ha=
ndle2,
+                                ring_context_2->bo_mc2, 4096);
+       amdgpu_bo_unmap_and_free(ring_context_2->bo3, ring_context_2->va_ha=
ndle3,
+                                ring_context_2->bo_mc3, 8192);
+       free_cmd_base(cmd_base_1);
+       free_cmd_base(cmd_base_2);
+       free(ring_context_1);
+       free(ring_context_2);
+}
+
 igt_main
 {
        amdgpu_device_handle device;
@@ -815,6 +985,14 @@ igt_main
                        amdgpu_sync_dependency_test(device, true);
                }
        }
+
+       igt_describe("Check-FWM-preempt-using-GFX-UMQ");
+       igt_subtest_with_dynamic("fwm-prempt-test-with-IP-GFX-UMQ") {
+               if (userq_arr_cap[AMD_IP_GFX]) {
+                       igt_dynamic_f("fwm-preempt-test-with-gfx-umq")
+                       amdgpu_fwm_preempt_test(device);
+               }
+       }
 #endif

        igt_fixture {
--
2.43.0
