Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD63C3ABC9
	for <igt-dev@archiver.kernel.org>; Sun, 18 May 2025 11:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CEF10E1F9;
	Sun, 18 May 2025 11:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M96s0t+F";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B2010E1F9
 for <igt-dev@lists.freedesktop.org>; Sun, 18 May 2025 11:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9LsGZ+VX4fskePzlgCxTa+6wM58KWpELylGUSt5CylzqtMSbG8a/zTf2L2DE3P99ybCLY7zhsa9oF20zO+8A0zpBK2bqyzVikZBgoQkA/TU5Y9G/RI2yVVYVLmHRVecsoaKf/O3Q4Elpep3/e1s4uDGjzin2sbSywPi+jNXqlctSSZ7JcbNKteKmCyZyUOJWbYKjLTZ4lLcMPogH/nKdbUTgEo5sPOh2C5RvDcHsd9UTmqrGxr3m9i3PAhbi+FYhger4tJn0klleob4DRMXRS2Cpvt/+zlZaTLPbO5pDkZP4g7U3T9XdOkURp/Oj+arD/jEN68Ghr6b2s5+sKOjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWXS6VuelIt+kzxtKlX83SMmrpF50k+JSuxJy3aQwBI=;
 b=QlGKezLrPmMBPbLPjbUp25NBU0p/B14zXQ1DPZv7c4tgnJDAtEu4lt4sx5xQDBrP8t/8AgVRrQdtvdiB+dFAia+WrnASN4TYM7O4qVYqGAWvuZ5XftpVOOl6X1m7H+yKWUgyC7ooLjqE/v2hcSrQ4BwnQmt9l646yd9SnWAkuQLjsAsL+ZK7fIj4gm++e8unzx9tJdA+OB03yy1763MFExwFHcokAl8hTb7f1ewVAkaJUwo6GFarOPLyS3vadRpAM7XqJ/WbwfivZFigXpzsFclkAMJYla7s8zUsiQeaALlJrdVC5Gytw/UZ6mxwh2D/rpYMrdJyhBO7r4ljAum+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWXS6VuelIt+kzxtKlX83SMmrpF50k+JSuxJy3aQwBI=;
 b=M96s0t+FQT/CXtPGl7kLz9WlTIr7fjXsejmp5VD/iuA4oZxDQlvLCj19QkGdXtno77rdAEbTp/nsufFWj6NpvseDu7bfgq8WdwkEtA3bg5TEUjen9rnyrOKyXhSkTBNnj3mW2YMYovSo/oW+SY3FyB5SLHQm5POt+hwN/QtNJcE=
Received: from PH7PR12MB6633.namprd12.prod.outlook.com (2603:10b6:510:1ff::20)
 by PH7PR12MB5829.namprd12.prod.outlook.com (2603:10b6:510:1d4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Sun, 18 May
 2025 11:57:30 +0000
Received: from PH7PR12MB6633.namprd12.prod.outlook.com
 ([fe80::cf8b:bdd3:d791:fccc]) by PH7PR12MB6633.namprd12.prod.outlook.com
 ([fe80::cf8b:bdd3:d791:fccc%7]) with mapi id 15.20.8722.027; Sun, 18 May 2025
 11:57:30 +0000
From: "Mohan Marimuthu, Yogesh" <Yogesh.Mohanmarimuthu@amd.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t v2 2/2] tests/amdgpu: add fwm preemption test case for
 userq
Thread-Topic: [PATCH i-g-t v2 2/2] tests/amdgpu: add fwm preemption test case
 for userq
Thread-Index: AQHbx+aOG/5GZmVmQUWBcVPvraSrSw==
Date: Sun, 18 May 2025 11:57:30 +0000
Message-ID: <PH7PR12MB6633E37C674801431E4BFADCFF9DA@PH7PR12MB6633.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-18T11:57:30.262Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6633:EE_|PH7PR12MB5829:EE_
x-ms-office365-filtering-correlation-id: 81175120-e2fb-4615-8b3c-08dd96032b1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?sLp+TdSdCYhuO2fwpws1wlbdLMEJQ1ppe8beik2qTM7R+eFOU0S3UoqSah?=
 =?iso-8859-1?Q?jLR3/LsO332JwwzHxH8jhclmGmxGwCqbVPumIMgTrgnY+AMkH7zE66IWR0?=
 =?iso-8859-1?Q?t5M2zHG5foWa2umVjWFiONnKj7zsG+JtS00z6tHm+zjDWafiKnTdisuEEC?=
 =?iso-8859-1?Q?baBYp3RmwwxSdkXRIi6uJtIf4eZ8dYtRLBwf/PDUYmGT3CdhDRQGj7QkVg?=
 =?iso-8859-1?Q?ogr/Yv9+JPW6tNeNex1LiU81YF1Qzkb5kXp34JYeHx/nQ9l6DE8oKCjUO8?=
 =?iso-8859-1?Q?NgMDX5hDKwtgJoZWXHv8DLFF0BsXh6bVltxk3u/e4JzWm/i1u0n6uwHluc?=
 =?iso-8859-1?Q?tFyppQ+/vwoFe/GS2FCbYLkd2eeHOT0RYhbJE0JDLAJZemVxHWnVxwdUC4?=
 =?iso-8859-1?Q?auiIgF8qFka4ucR7EhUQkhLef5zmdbQzmuYwc1ZT9wloxYV4J6kel/3vWe?=
 =?iso-8859-1?Q?SPzQdyS1MuVSMJIGPHZdy+ud70zfS9HEYPILbXBA2jOwl9UYZ/3asCNp64?=
 =?iso-8859-1?Q?XHIgNMb8+7OJD/UybQt9JbYkYSj/K/lRZ+WIgh5njLpTCK+OD+6Q2kWy2y?=
 =?iso-8859-1?Q?I0otevJlRvGrgo+fO+ltKZRzwhM70nN1NP6mVxbgtSkS9uFuFH0IKmGRKa?=
 =?iso-8859-1?Q?nBQS4skFHpuGqTqr/8RAqvbkRD1EgIv2pvIsYDuYOxmgYbByIWcZFUb49Z?=
 =?iso-8859-1?Q?LaPAZlgsjmBPZCsm4twTxQyJ8kqNP98rY2tO5R13HT9plxs4s7ge53ZqP+?=
 =?iso-8859-1?Q?Se+ejOM8CObf7+yLTBB8LvBPutHx8lgX0aFjcWqFVszRUy7mLrHKTniEvR?=
 =?iso-8859-1?Q?WjefoPfih/qL9EfOYrWyO8O0TQbDLU0clT+ZgAxqpk9hYX+FGxIbfksdAr?=
 =?iso-8859-1?Q?NcPPdhCjXmLK6JFdiNJUprTR/sKpXuM4tI5OR2GJYcM6x+u9zKixth0lER?=
 =?iso-8859-1?Q?bLg57HxzxG/Ti5Ync9YuxRPFnfDD4QyyQOGLHwzoanLk/lNQoRm/8Ou4Vb?=
 =?iso-8859-1?Q?qherVGE2tpuGBcixKhqAnV8WWeAgb8MwnLfrGH/5nPNgvrIrVodAg1fL6d?=
 =?iso-8859-1?Q?t/oHgm/5IS2YDwlLJL3c+skKKGQ8L6/9Wdp35J09HXsexlcl6JpY4Cwl7a?=
 =?iso-8859-1?Q?5qi/e6oUD5F/7xjCrdbN8bi8Q5//u+kAQl1cB4UvNNvzAV/L1S83eKIt88?=
 =?iso-8859-1?Q?tBZlJWaK4eMAc49EKlTN/parAu+tvs/XZXZ0lshDkXLm3ATeVSrLGvim+N?=
 =?iso-8859-1?Q?Bzxf2d2NXyIRlUTtWfDZls0GPiB/A3ROYUpitLWPEmjVzV0VWLHdWyKegw?=
 =?iso-8859-1?Q?u8IRRoRb55bMFj/5BXHk4Fud36Ii9otf3SaTvMpXYkHeSYWoGRkqHvzPCb?=
 =?iso-8859-1?Q?0j3B7WgWugZ86xXNmtVMGpAhKEyRAv0vuOQ01dpwmpmDXy/2T0mCcSqQpS?=
 =?iso-8859-1?Q?TghMxBp91+weAFi4eJPlhVr53XjSKmoAwKI1EAmpyri3ffVHzugg3FSJXM?=
 =?iso-8859-1?Q?npKvgN88aeu3CNRkAlVHcXe3stObj2sJNdx3HrMqGXmQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BgOL+LwBUGOiBW6RPuUh9ffb+UCMidUElZgqSngfWHgiEv6JOQe+xXZClv?=
 =?iso-8859-1?Q?37veFZOhEyyXsyUjwvmW+iMAnZ/eEbJwAnr6EEjdH1jGoQXK2YsTJj7rco?=
 =?iso-8859-1?Q?J46ZOk/I0SHgU0um5rdPF0H2yvXoArQsSycbKXy4Glw/HZo6MgbYi+1LPq?=
 =?iso-8859-1?Q?hbS/cHPbbRNSpD9w83DnCSAMR5CopfGLK33GabBvqP1J9+8zENwmUCo0Ww?=
 =?iso-8859-1?Q?oun9NYeNAgjyLVeOQe7pm5eeEwVqieys1jt24f1zypYGAyLEsIcsFRLQtl?=
 =?iso-8859-1?Q?gl4Ph/0WrshUsSY63k558MQx5SyOp+qrqDRRw16mKbu+fi4eUZv4GKSyvw?=
 =?iso-8859-1?Q?i1JJFtk+DZ53PlsaVdgAMOXAkwG2+XjmVx6GcHonNHVxcvCh4HhVmI72X+?=
 =?iso-8859-1?Q?fJpgx2k2vtNmEQPfqPgcpvXROb5z+UcQa2Htv8/Yb0LeTQMnGcoaX408IQ?=
 =?iso-8859-1?Q?jjEaqUDv3Ygxxu4UizbuZeZ6gvGtoZr81Oy/rdfhLDvvbmzXbE5fdTmtI1?=
 =?iso-8859-1?Q?ExT2QFMADzCaHpOMGDYLdlWG3rvs3iS4xIZqdUJAWVPFwvoZIz93FHhe7V?=
 =?iso-8859-1?Q?0dW0T9bztkpEFNWXJ9CNWf45PQx8uSExN8+e79MzUydVrUPNWbdM/YDPZz?=
 =?iso-8859-1?Q?tIozlG2bGA5j2JLeeNrdOQDAp+xXfmRhvP9HyxwUh3LrUWphf6ZWA3OT1M?=
 =?iso-8859-1?Q?8jlsQ69fpWOEfSvI+VjWt8XXP3JTjM+jBMvolzAB0nReRj96DhpXCOAyQI?=
 =?iso-8859-1?Q?Si4j0bsyZPQU0JWKVRxiT7xjbkgvhqH8cdnvst4iDCFCPXeZ01Kt5kwUJ/?=
 =?iso-8859-1?Q?GlUOMU4I5g8Xa3qPZwyrsSH3WWxcjGoNNE+0iq6vOYkH3EjaL8o/sd3Pbg?=
 =?iso-8859-1?Q?tgkf+BjnY8OOsAl8/YVR0G1+nIQTYtn0JVnBMhiT1sZZXPQcVROYMssygG?=
 =?iso-8859-1?Q?51hGISHokKudG6bk1xFsU/MTT0CROsN/8onCy4t9QSZx32MfGFuFsITtUq?=
 =?iso-8859-1?Q?6BSY11MwoWSB0kAhMz68QK0LAEih616I6leqH8un3YncY8tn/rXm+kttAu?=
 =?iso-8859-1?Q?jC/8w0gfiv4hAFzB0IZvohYHmzVAulAH/OJPbLimQev6i7rU3EatbzY3io?=
 =?iso-8859-1?Q?+1+twPH8v4L1QdbVUYVAZQXS6Lz9QBGwVZ3IhUJxOLwFO/wBJuQ4VQ6q1q?=
 =?iso-8859-1?Q?u5o8jL7S8e3Gf215bzrZkpH7+cmIWMEaOrgyj9VHch50YZgxMnoHZWQb+v?=
 =?iso-8859-1?Q?sqDa9iQNyrLMo+pUOt59w/ICX2Lz/fRd9j1m0IhTz/uOAfZ185Ero1dm2r?=
 =?iso-8859-1?Q?xwo2HKBjOFJfbH3mXLJ/mQR8LPfZbvI3DT/eWlCtS/nfJWz4CfpqlE0Hdc?=
 =?iso-8859-1?Q?dPlarfIU0GeoVwskP6II1vuY6kT/PLCEfI20Fxz0m6/buz6HlkSTpXrfyx?=
 =?iso-8859-1?Q?BskqmWtNUurGFSJh98tADRJO6rVOzyUi5MmfrPvbKfFsIDB2LBHGN21r/3?=
 =?iso-8859-1?Q?8BqBkdFxVyhieTQN5wPmPBDOI5aqynycE8mCPiXAdJr25KQZdJ+kdywD22?=
 =?iso-8859-1?Q?hZQ9fFkM35lbee0bptaaM1+I9HdredWfPIbtjpPe3DjqLwEPRFJlFivRC9?=
 =?iso-8859-1?Q?NMvCn1pZ5JR5o=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6633.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81175120-e2fb-4615-8b3c-08dd96032b1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2025 11:57:30.8637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tW0LWeSECJyfgNEga+NGxUd22jDHCb3n+xIhmUQo4FPXoPplxwQ0eBQ1L+mVr5QMjRXyd/si8fCUa6hXNNjVBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5829
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

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index 8f59b4223..d6a8446f4 100644
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
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 914d27909..075057960 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -689,6 +689,176 @@ amdgpu_sync_dependency_test(amdgpu_device_handle devi=
ce_handle, bool user_queue)
        free(ring_context);
 }

+static void
+amdgpu_fwm_preempt_test(amdgpu_device_handle device_handle)
+{
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
+       amdgpu_user_queue_create(device_handle, ring_context_1, ip_block->t=
ype);
+
+       ring_context_2 =3D calloc(1, sizeof(struct amdgpu_ring_context));
+       igt_assert(ring_context_2);
+       amdgpu_user_queue_create(device_handle, ring_context_2, ip_block->t=
ype);
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
+       memset((void *)ring_context_1->bo_cpu, 0, ring_context_1->write_len=
gth);
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
+       memset((void *)ring_context_2->bo_cpu, 0, ring_context_2->write_len=
gth);
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
+       cmd_base_1->attach_buf(cmd_base_1, (void *)ring_context_1->bo3_cpu,=
 8192);
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
+       cmd_base_2->attach_buf(cmd_base_2, (void *)ring_context_2->bo3_cpu,=
 8192);
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
+       amdgpu_user_queue_destroy(device_handle, ring_context_2, ip_block->=
type);
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
