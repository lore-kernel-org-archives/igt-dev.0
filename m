Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A93C3ABD8
	for <igt-dev@archiver.kernel.org>; Sun, 18 May 2025 11:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC0E10E0C6;
	Sun, 18 May 2025 11:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="evjDDsPt";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCD610E0C6
 for <igt-dev@lists.freedesktop.org>; Sun, 18 May 2025 11:57:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kp2H502JBwZ65pMn5qhoRxV3g83eCWmeYstgTEQ1mi7mx607ot6Q/yrZb6u018a5CCj4Gcadc+dFzwxllNak+Hpfinz5PJpGwmSpqLc2S0bsvxvDtDIbqUWvo11a/yTSJyMV6nlf1mWneItEnS9FB9abg/DRGnzQ9aAA413KnvjUZa1QFpk4D/bxtIQxSgyqn5s94Ihz/VhKgbvO95JXnrrz6hk9A8lIVnOdc2M3/pOkNh3I5vTPyJucFE8UG03bgtYDvu7Osb8fymMona5IHgVE0UTEyZaCoKr7CLjgI1QrTfXd7lKZ8+MNAPPPAw8T3CPDZgCvT5bj5S1+1DHAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fbjwl5WylioqE30jPMObF5CF6DZL9wj2PCtong1UsI=;
 b=XMDePt83YKjCOSZR58F0gqiVqVUpUdpFUE4RG6pysMh76u5VQPEVLmd+Vjh/gFFWE/ZpilplF46fZisEuMxgikvITPwdKjnbKauOxCiXwVKjWZv1slNsK7SfVOFB09c3OSwmbRyxacxK+2kIEfDH/cIjIczQ/YGxoMCYhmZQdc7ZHsWqrJ+deZIX63T7mdlol6g0XvEZU3jbbqq4P7Wk91ZQ9NPf1ahdRVpfB2Mds79pd8+iMmRsZbPisiIM8TnDKOvP5RSm3ZSLrccqzzNzFYUaoGmJh2EXrACIBIYyS828wpRNXMV1Bo1kzv9QaRGrgEycomGABBQd+mcOGI34fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fbjwl5WylioqE30jPMObF5CF6DZL9wj2PCtong1UsI=;
 b=evjDDsPtNnhURCLmtTh0ui05JW26SbDROvoQHYf1qNt9YnWAf5pN/UAjhS7oOsfWXypildA27GxcmOcvI5RQZR8NpCRiLVJpS51N4QHSYFGWbg3TXOIE8FyfLn7l2MiARkDN15guxMYvu0Bsb3zGtCR0OGtmcq1G/45MqU1zV7c=
Received: from PH7PR12MB6633.namprd12.prod.outlook.com (2603:10b6:510:1ff::20)
 by PH7PR12MB5829.namprd12.prod.outlook.com (2603:10b6:510:1d4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Sun, 18 May
 2025 11:57:23 +0000
Received: from PH7PR12MB6633.namprd12.prod.outlook.com
 ([fe80::cf8b:bdd3:d791:fccc]) by PH7PR12MB6633.namprd12.prod.outlook.com
 ([fe80::cf8b:bdd3:d791:fccc%7]) with mapi id 15.20.8722.027; Sun, 18 May 2025
 11:57:23 +0000
From: "Mohan Marimuthu, Yogesh" <Yogesh.Mohanmarimuthu@amd.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t v2 1/2] tests/amdgpu: userq skip waiting for signal fence
Thread-Topic: [PATCH i-g-t v2 1/2] tests/amdgpu: userq skip waiting for signal
 fence
Thread-Index: AQHbx+aaaYFi+AuzF02t5aRm80IYQA==
Date: Sun, 18 May 2025 11:57:22 +0000
Message-ID: <PH7PR12MB6633AA2EFED618F772A7191CFF9DA@PH7PR12MB6633.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-18T11:57:22.581Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6633:EE_|PH7PR12MB5829:EE_
x-ms-office365-filtering-correlation-id: 08490a85-92f9-49d1-ece8-08dd96032669
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?rr1r8HOTQbOlwggbyOhXgtIrqzvQRslXeGRyEsUywa2DcSB2wGgy454J/a?=
 =?iso-8859-1?Q?1cmDk1w0EpukQ8XjQLAos6GP7hMYLcKeGqOSfpvFcYOWMWWiD6jumHFlXK?=
 =?iso-8859-1?Q?+NxvxUNVxU5fQbIxvpcSZ4pvtbIjPfvaI0HKWyVix9fxWlBkVHOTvguTIL?=
 =?iso-8859-1?Q?1G7X+TdQya52+NUzaWmXXQwkEHG/vi8vZRW+ZX3RFp01Xufn9R/m6z8PTk?=
 =?iso-8859-1?Q?wbYgQ08P62oFTWdnf7IgxIwdgG4yVG/cCnLs+S7KjpXSt0aJTpbjHjIbcO?=
 =?iso-8859-1?Q?MAlelWYUWVMT8k68+iJcxHnVWcFnPx+LwyCD+sEugz3yq5Ipaiyn2RmM7u?=
 =?iso-8859-1?Q?ZOViD0C1STdeH/zTIoKEi4j8fM94PpjcocqCK7wM7+leXyvZk8+UNz2erZ?=
 =?iso-8859-1?Q?9tIE0EU9S1FHtRqhlBu8YNOI5SJpsMFAD+lcTHMeYIaTLMvjsRxxPcoctJ?=
 =?iso-8859-1?Q?/vT9i4OgOQ5hqS7ovW+cG2vcLaDJCuatHgRPE/Lf47mJ5C6UOzuo6kDz1/?=
 =?iso-8859-1?Q?Am4ipr8UXvN3LrkBV8546i6MEoD8XXX0C1ECSwXdfVHHPnpR7n5B/9gaXJ?=
 =?iso-8859-1?Q?xLnXOzRFpuiSyT1QA3cLBWIuFw7Rz7wVxWxeMzXATHEpmPEAiW4lUxQy2/?=
 =?iso-8859-1?Q?S3CuOVlAxyCrGulrLzvcmv95wDAIpUTTbhYRzUwFH24immi5tm4EauZmWt?=
 =?iso-8859-1?Q?K7HorULvnrjOBIzoTAvi30Sx+75yHrZ74QEbLkSaqWCoY16q81GrKnNpNv?=
 =?iso-8859-1?Q?U8yH7m2GCW6pVIVJ2u74seKGdpKAoaXYlzsL2o/dXo2piZmKaALKZ7Op//?=
 =?iso-8859-1?Q?86Yzv5NkGQcPuDtewvnt/BBYKwhnho22ResHx0/5dtt4b4n116+mHiHjgJ?=
 =?iso-8859-1?Q?h97OjMrpMQsLIDv7vUCGu7Cv0gJCFh6D5R2aXG9Jel8zYq9Xq9HLFUIfFK?=
 =?iso-8859-1?Q?nQ9b9gVRrUVoEVhWDb9P+GilGudR4pp/m/b21VFPyMGO3MbBMinMFLUP5Z?=
 =?iso-8859-1?Q?53nTD/q89NAS0VOq0eujf5Vl37ChgtGhr4S4tqtXxuPHAN4BbW3XOUD9VP?=
 =?iso-8859-1?Q?Pf0PSWcacTFCORXvwE5TJx/C9EMj2L75t20CTBbfG2+bmGtYkTKpn80g/a?=
 =?iso-8859-1?Q?P+kAF6ca58RuqSWSRiuxFLern9al2cOsyx/QrH8xOjK5L1DY7xZmfI1ufN?=
 =?iso-8859-1?Q?0mS7eyqyx/bGpvhgT4PXqLsPnJIqocoqQ5WUTmPhTlh3DC/3psBVwzO/qN?=
 =?iso-8859-1?Q?FZztlzzfD7jRs2+5p/+62/+WlW3TxcKjm3P4TYpTtbfmECCeM+5K6U3UZO?=
 =?iso-8859-1?Q?hsrlJ0nuyGmt5Nxdlx8GIPYO+gHAkc0nyMRPlcRRK5bYDkzHognoYoILhX?=
 =?iso-8859-1?Q?6lUhYdQ6lvuXKPECgj8yGhSse6MQIOaIQwlR+NmymOZmBM2GTi8tAw8au8?=
 =?iso-8859-1?Q?TB1ogyBfucq7bxcQfY8mCNpMY2+vR0Vi9sOjSSxZh8FxD6cQ4uSa88WNdn?=
 =?iso-8859-1?Q?CeV5sj9AsA7SrMZ8rDrtaKFgPeNOvzvzRwBmqkedzDAA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KQKOOVsufJP1i0zzVL/G3EAn7+GYccIIMYg3D+yWmPz4rcSV4njNh4c+gE?=
 =?iso-8859-1?Q?vc7us0RVAR/08h84XdLMhNP9ikg9CgIVM3n1o31ctZE0eTZIXwx9ecobAU?=
 =?iso-8859-1?Q?AGcokION1m+Br5DnwEOp80zB90snTiUxUrnKNiKFKS/2y3USmQxQFNg3Zj?=
 =?iso-8859-1?Q?VCgUzPvt2samO9RvJUWui7D60HPFIWVOFF/cqKkr3H/S5Yt9utL0rwP+9c?=
 =?iso-8859-1?Q?6oopaiab9gUrNwQRjyfAD/ZVNYuceMTLBPMIc9XMEsWvZumFGCz5pC3Zcf?=
 =?iso-8859-1?Q?nTIJtLU+IXEI0UrpKbW3T/odNUoiBQefQ0mZOafl94HSzAvw3AXvP9ZCun?=
 =?iso-8859-1?Q?Dl4iMdryfVr+sfOiXgzlbmddaPpC/yQmQzJ9iu9i2WjOtcN1lqZRWS9wob?=
 =?iso-8859-1?Q?WyWJ3KvbEfiy6z0pqm5ihql7eiASalsr1KT5YU56lUtYqq1poBcdC+kY00?=
 =?iso-8859-1?Q?hMCC6IlzyGFELj4rl99jEPvAM8yrXUuLh+aD9J+4ovPhABlptgvcMXOHWV?=
 =?iso-8859-1?Q?xP08tW64sS7JR57WVBEUiUqDGddjMJ41KrMbx74Obltv0wMnYupEsNuAsk?=
 =?iso-8859-1?Q?Im+SxXY6txhrO3lM3PoibfvXACACAAIBtRlVi/A18ln7r09CgbTaDOD8yP?=
 =?iso-8859-1?Q?E2rld2Yl7cmMrptwtstiS47l6H4sHl2ebrUzpVhKdMGkTtBsbAGp+QOm1q?=
 =?iso-8859-1?Q?3JtVKPkmqtvhnoPE/gsjA3soxLfHPqx/EHtB3XOgUq9SQ5vsd6MKFJM6aL?=
 =?iso-8859-1?Q?7gOXV0AJaYA/RifMC2Dpk3drYsodAlHKM5CKNwvPwQEj2hGiHWxs4aulC/?=
 =?iso-8859-1?Q?i8NKb9W0eTjzOLAhm2xAdhtKnZpzJ2FAPmApMpprWudkgrnK9vKkDiZApw?=
 =?iso-8859-1?Q?tP1w3jsIUVqX4bMXtP0Cwyo5jmtCNcXVkwb2CdCiHoGlgvhFXhWrikOgQH?=
 =?iso-8859-1?Q?e4hPbguxHNpb9V45YD5RUi7sxDGelVzKX5DUed4uo9+LFoMcicHEVKttCR?=
 =?iso-8859-1?Q?FxcAOlPAk80KrrQB6YqOU7pfLfCFR9sZAH0eMt71rH39FAAR0ZHKg5FyJP?=
 =?iso-8859-1?Q?hYAspYX5HvHfyYzr5gXwVTI1gOPD5UALz9eoLICJRr6ZOuoQaodlam5Ily?=
 =?iso-8859-1?Q?D7+s1rPxA0nLMBQr2baDyhyAqpYzXbBFPVOX/G+fffXCKZR6m2TUwIdEeH?=
 =?iso-8859-1?Q?3DKNnkpybouDEbBk0l4U15mCEY+gFkD1wVxdX5hXeayLNpVdXRwh7JcnAl?=
 =?iso-8859-1?Q?c0snToNtNWQb55qmegS7G9HmJytD+WBDm016wrS/vN5LBqx0cclCKewQva?=
 =?iso-8859-1?Q?gXDO5zT+EdRIw4xcm2VI6vZU9jtmM5un8VBmdnT5YKcEmFMzSPT0nExRW1?=
 =?iso-8859-1?Q?QFoyapeXgsESeH0fOh5CO/F44fOzwoXqCZTeaWr0I6sGsIm6xErVlN9r8w?=
 =?iso-8859-1?Q?WVmKcHYqMTeWxHkhkCAEtbNliuBZYzGB5c6E0wDhsorE3pesKmDVqtd3oJ?=
 =?iso-8859-1?Q?1IlQ6njjdaNfVr4n0AQewodvU+4wcd+6kTn3Dk4DXNoCKFdar1gteG60Ua?=
 =?iso-8859-1?Q?HPw2no6Ocfo5wKYLk+UDqLi/VOC+koVQlGSfRD14MEGtDEJRZQkJ+RE8vA?=
 =?iso-8859-1?Q?9XIoIxAFeJNwM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6633.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08490a85-92f9-49d1-ece8-08dd96032669
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2025 11:57:22.9519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8eR6SEBlvRgACtsQvuiZUtiEdTknk4Ez5yUhsLg2JFFzproP/wRkEQJyAaRTNyd7UHKUVcrQ2g078guspHPxCQ==
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

For negative test cases where the job will not complete need to
skip signal fence. Pass a flag to amdgpu_user_queue_submit() to
skip signal fence wait.

v2: rebase to latest code

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Jesse.Zhang <Jesse.zhang@amd.com>
Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
---
 lib/amdgpu/amd_command_submission.c |  2 +-
 lib/amdgpu/amd_compute.c            |  2 +-
 lib/amdgpu/amd_userq.c              | 36 +++++++++++++++--------------
 lib/amdgpu/amd_userq.h              |  2 +-
 tests/amdgpu/amd_basic.c            |  4 ++--
 tests/amdgpu/amd_cs_nop.c           |  2 +-
 6 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_s=
ubmission.c
index fcc356f8f..c3dad3231 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -68,7 +68,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle devic=
e, unsigned int ip_type
        memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * sizeof(*=
ring_context->pm4));

        if (user_queue)
-               amdgpu_user_queue_submit(device, ring_context, ip_type, ib_=
result_mc_address);
+               amdgpu_user_queue_submit(device, ring_context, ip_type, ib_=
result_mc_address, false);
        else {
                ring_context->ib_info.ib_mc_address =3D ib_result_mc_addres=
s;
                ring_context->ib_info.size =3D ring_context->pm4_dw;
diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index 95bfa53aa..008186049 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -91,7 +91,7 @@ void amdgpu_command_submission_compute_nop(amdgpu_device_=
handle device, bool use

                if (user_queue) {
                        amdgpu_user_queue_submit(device, ring_context, AMD_=
IP_COMPUTE,
-                                                ib_result_mc_address);
+                                                ib_result_mc_address, fals=
e);
                } else {
                        memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info=
));
                        ib_info.ib_mc_address =3D ib_result_mc_address;
diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
index f8e1a4b45..0a983834c 100644
--- a/lib/amdgpu/amd_userq.c
+++ b/lib/amdgpu/amd_userq.c
@@ -127,7 +127,7 @@ int amdgpu_timeline_syncobj_wait(amdgpu_device_handle d=
evice_handle,
 }

 void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_r=
ing_context *ring_context,
-                             unsigned int ip_type, uint64_t mc_address)
+                             unsigned int ip_type, uint64_t mc_address, bo=
ol skip_signal)
 {
        int r;
        uint32_t control =3D ring_context->pm4_dw;
@@ -166,22 +166,24 @@ void amdgpu_user_queue_submit(amdgpu_device_handle de=
vice, struct amdgpu_ring_co
        /* Update the door bell */
        ring_context->doorbell_cpu[DOORBELL_INDEX] =3D *ring_context->wptr_=
cpu;

-       /* Add a fence packet for signal */
-       syncarray[0] =3D ring_context->timeline_syncobj_handle;
-       signal_data.queue_id =3D ring_context->queue_id;
-       signal_data.syncobj_handles =3D (uintptr_t)syncarray;
-       signal_data.num_syncobj_handles =3D 1;
-       signal_data.bo_read_handles =3D 0;
-       signal_data.bo_write_handles =3D 0;
-       signal_data.num_bo_read_handles =3D 0;
-       signal_data.num_bo_write_handles =3D 0;
-
-       r =3D amdgpu_userq_signal(device, &signal_data);
-       igt_assert_eq(r, 0);
+       if (!skip_signal) {
+               /* Add a fence packet for signal */
+               syncarray[0] =3D ring_context->timeline_syncobj_handle;
+               signal_data.queue_id =3D ring_context->queue_id;
+               signal_data.syncobj_handles =3D (uintptr_t)syncarray;
+               signal_data.num_syncobj_handles =3D 1;
+               signal_data.bo_read_handles =3D 0;
+               signal_data.bo_write_handles =3D 0;
+               signal_data.num_bo_read_handles =3D 0;
+               signal_data.num_bo_write_handles =3D 0;
+
+               r =3D amdgpu_userq_signal(device, &signal_data);
+               igt_assert_eq(r, 0);

-       r =3D amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncob=
j_handle, 1, timeout,
-                                  DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
-       igt_assert_eq(r, 0);
+               r =3D amdgpu_cs_syncobj_wait(device, &ring_context->timelin=
e_syncobj_handle, 1,
+                                          timeout, DRM_SYNCOBJ_WAIT_FLAGS_=
WAIT_ALL, NULL);
+               igt_assert_eq(r, 0);
+       }
 }

 void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct =
amdgpu_ring_context *ctxt,
@@ -456,7 +458,7 @@ int amdgpu_timeline_syncobj_wait(amdgpu_device_handle d=
evice_handle,
 }

 void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_r=
ing_context *ring_context,
-       unsigned int ip_type, uint64_t mc_address)
+       unsigned int ip_type, uint64_t mc_address, bool skip_signal)
 {
 }

diff --git a/lib/amdgpu/amd_userq.h b/lib/amdgpu/amd_userq.h
index b29e97ccf..dc39c1ca4 100644
--- a/lib/amdgpu/amd_userq.h
+++ b/lib/amdgpu/amd_userq.h
@@ -50,6 +50,6 @@ void amdgpu_user_queue_destroy(amdgpu_device_handle devic=
e_handle, struct amdgpu
                               unsigned int ip_type);

 void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_r=
ing_context *ring_context,
-                             unsigned int ip_type, uint64_t mc_address);
+                             unsigned int ip_type, uint64_t mc_address, bo=
ol skip_signal);

 #endif
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 97a08a9a3..914d27909 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -607,7 +607,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device=
_handle, bool user_queue)
        if (user_queue) {
                ring_context->pm4_dw =3D ib_info.size;
                amdgpu_user_queue_submit(device_handle, ring_context, ip_bl=
ock->type,
-                                        ib_result_mc_address);
+                                        ib_result_mc_address, false);
        } else {
                r =3D amdgpu_cs_submit(context_handle[1], 0, &ibs_request, =
1);
        }
@@ -647,7 +647,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device=
_handle, bool user_queue)
        if (user_queue) {
                ring_context->pm4_dw =3D ib_info.size;
                amdgpu_user_queue_submit(device_handle, ring_context, ip_bl=
ock->type,
-                                       ib_info.ib_mc_address);
+                                        ib_info.ib_mc_address, false);
        } else {
                r =3D amdgpu_cs_submit(context_handle[0], 0, &ibs_request, =
1);
                igt_assert_eq(r, 0);
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 268bc9201..658c8d050 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -108,7 +108,7 @@ static void nop_cs(amdgpu_device_handle device,
                        if (user_queue) {
                                ring_context->pm4_dw =3D ib_info.size;
                                amdgpu_user_queue_submit(device, ring_conte=
xt, ip_type,
-                                                        ib_info.ib_mc_addr=
ess);
+                                                        ib_info.ib_mc_addr=
ess, false);
                                igt_assert_eq(r, 0);
                        } else {
                                r =3D amdgpu_cs_submit(context, 0, &ibs_req=
uest, 1);
--
2.43.0
