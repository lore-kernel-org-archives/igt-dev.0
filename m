Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E37DCAC5B2
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 01:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9B210E04F;
	Wed, 18 Sep 2024 01:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pd3vCnJL";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0305410E04F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 01:25:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abw6rKXzlu9g7j7DCuyvUPQszgV+u6Kj2S3YfV4/rWvTqJpyw6/gIPQfxggppYSIEFETA6mgTb6e6WFjNxgd3tTpa5YKV6WSz9lWFOF5myhmwPQPCTWxdYYJ1f2+L6jxJBjoRCxYl/bKDiCBGDedC131O22+ZcPUJAepLaBctbeVmwPBz85KMgEfHWdmLpKZzN0pEWJrZUceysOOLjMjnIXEWwMn/lYamMgj0Z3dzfUl9jUoqO3IWc42Y2p5Qchj4H1TTLAEBJcbyqSGI41kcc38EEO0YUmS1DNbS7EsxTC07dgT86JBCokg0Po7EJZiqowFldPmeFvi98ygbBa+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEnqggcJpjdYsUydoTFwVygzij461zuoiGs7Xhd00Cc=;
 b=nrg2I2jFxpBNIiusveD+BtCIH8iPrReEQ7+GBiEm8qKV9TB/hb2vDeWzilkyRDX7ZT1CDwiYm9EnuQn7xCuF5fZdZNWEXzXDwt54MkvtDk9iSU53Od3pFiNPvMH4g6IIUpOB+ixbWttwAEsxugnqGydN8p1s/2ipTzufcBFwyXlzZtnaseJWE9ce8++nCu5jDA8takIzyMTs1ignFJZZA45ZyqESGVyl5ANzjo5/PdM8GIn+nuJ+TZmh+i3evi644bM6KRcKnAmLSsstkdycmv6tWUEzFTpSytPw6Zc9QytYAYpHWdT7mfuFiep6i5KH39W0GAguS4CTYjkDusJZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEnqggcJpjdYsUydoTFwVygzij461zuoiGs7Xhd00Cc=;
 b=pd3vCnJLAhr1rOZSHZESiWscMVz2VargONjcpWvQ+dQ98JZU0QziLWhy02+TL9F8nO+XHBHX28mZ8UkQHvw+5WG8ByMW9AKUSF+Ri44rNu3oJYRtZMuunon/u94UCNf1Lqn4N5ksXDq9ViUVrOf3JhIbVTXnF7L+2jhonJKSwco=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DS0PR12MB7801.namprd12.prod.outlook.com (2603:10b6:8:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 01:25:06 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%3]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 01:25:05 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH] tests/amd_queue_reset: refactor monitoring child process
 into a worker thread
Thread-Topic: [PATCH] tests/amd_queue_reset: refactor monitoring child process
 into a worker thread
Thread-Index: AQHbB9hcIAhlYz8cmEOa32qMLN/7DbJcwzOg
Date: Wed, 18 Sep 2024 01:25:05 +0000
Message-ID: <DM4PR12MB51526F9D9CCB9FE6D0A515BBE3622@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240916013245.125751-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240916013245.125751-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=3711a997-f82a-4873-96fe-cfa96125ed10;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-09-18T01:24:02Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DS0PR12MB7801:EE_
x-ms-office365-filtering-correlation-id: 9fac0db8-b289-4fa3-e39c-08dcd780ba08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?VmPhf2SShvQG+njguSxdkpExUqN3j8q2yH11x9VmjnhHiZKyONeFPw8GYOLT?=
 =?us-ascii?Q?zPPZQE0MDOqeGULM3TcACmJK+HydjX5iHIE/JSaM/VrAI1OQc4AHZQjtG8ik?=
 =?us-ascii?Q?U74JQOkOf+qxDm345vCWh9ItYQeG1suqyEbXC3nUSJawN1Uf34/hgmUG2AUI?=
 =?us-ascii?Q?9GAfmTlcqPL+5BGNiM4tfHHLrlaS0iMYNhxZk18RlJt2mLLiRcxh3nVubAiE?=
 =?us-ascii?Q?Dpoc7AwXcRFugnqREVTaA8QHVoWNY9Sf5ka0Hr5ZzAWRFZlMTuwdrZcLfonV?=
 =?us-ascii?Q?5LFfOMnMVAklh6d5p7pd3rq15Wco5RRba4A20vdsgX4syYUZp3V015rap3CY?=
 =?us-ascii?Q?SUoDE+AGPPfthqITKe4R5ooEwg3tPQ/Rm161950yc8thRrpNkT9bn4ShMvg4?=
 =?us-ascii?Q?3EC2Ite5ChWxIDPD7chY95hLIa9pzSfHd2elcQHR4myiSiWJCMBF3aktxjtX?=
 =?us-ascii?Q?8uVssT8LwruiWHIoP2zjEPx+ssioYzoHhZHa/7VogEoAwnlTOhPMSVm4KU52?=
 =?us-ascii?Q?GnUlHM/BBTTa6A9mX81re25Gq3ipwzWN/PHwF5IDX7HQ9W7YiruFE/o4sZ3i?=
 =?us-ascii?Q?2AgWfvWtmGKAfo4Xg3g0Pt2DAz3MLfxFs0xCrnSMtSedLF5QJUu4qdhG4h0V?=
 =?us-ascii?Q?0RuJDNzEcXz5y5MTOFUO2+u99JpRtOdrgTzv1uXwDbkxxAwJX9xMRVHlSjKd?=
 =?us-ascii?Q?QC64fIshswufnbPF2rZaRh8j33uc6ltuUkkQW3yeeY4JBls8BvowIcdVAWyg?=
 =?us-ascii?Q?aKGytUj/5iE0TPodE1lQm9sQW1NMhVZO2SfL2Z2yGFS0EFHLwADJ11sBcLqu?=
 =?us-ascii?Q?0MlTUQKn9dMgggWWZwsb8Mq79L22t3bkOBTDB1txsljwDOWFeM/QFHQT24yU?=
 =?us-ascii?Q?UvoO1CiazhYrauxEvxarD2HYSPf7vQ/e/0jsFt4nSdtMlhCDoAl+F0oiYiQb?=
 =?us-ascii?Q?iB/SZJTRfjbE4hdIMvGEhQwke+AwRQ1JL3CHVyEXVNCmxqqTOaU+auzKrRzh?=
 =?us-ascii?Q?BCYTERDhwQTkgSH5eESmASQVX8bN5O2QtN4gFfb0vFNDBkBtmUG6iqE7amz3?=
 =?us-ascii?Q?9iLm2ihXdzu0lVPdXQ2s7w7mWEKSMv2HjbUf+q6VCysIH4A59motwpjmGtoR?=
 =?us-ascii?Q?qg930iiSWJNg/tsp1T/J99n/o3f5LtkCmsV2fAicjXZSOowdTLLhuUav9Ial?=
 =?us-ascii?Q?Ntq84ePkfOQe0oXa6/8+cV2aBwcpM2PjL4wM8kdkxmTjlTfCWXs3yio5F9+3?=
 =?us-ascii?Q?eUynTZPeBFWBiHPEprVqAJl8ffubF6b9avb/gLeNLtaNauLa1+aTR3FqqB0x?=
 =?us-ascii?Q?h5YB2pjGBSfF6iGKh4bSWP5vNmhCZBbAQ/g5XU31eMr0+R7dLswlxhKvad6x?=
 =?us-ascii?Q?qTqoodo3AJfUl978R58PiYpATALWRlJSeL7/iWVyA12S/UHRMw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K/pzvM/luxU7Ogy2nPBlzFL2WE2eF0SH1BFMVsz9B1ynYTPvJn1oxDj2N/bH?=
 =?us-ascii?Q?AXrmcqK84Ka8wCw2tJfwLXsPEY+4zXO+Rt2+1qzF50xwxRfRJhxYz3QIqWSq?=
 =?us-ascii?Q?zUF0AQjnpGJvlKpHFUqYuYXqLqCSsqJBu6jFkca5EtZ/zPBYoicapR8KgqQV?=
 =?us-ascii?Q?5RW3/Ff4DQfhB5rL+3NfaLgNSRT/PRd7nW/b/GqJ6M1YOrMh7N2w/0SawgxO?=
 =?us-ascii?Q?80xXASiFDykEYGwaI4L3urS6CioMRt+BG6rBcrEZ7gNdMyqLQF8ZqbE7C3fh?=
 =?us-ascii?Q?A4kAtIx1VjGSqKbDFtRNFMcCVI+0RHXwGesOUWykWuCbCCaE/8jQdi8ljuPs?=
 =?us-ascii?Q?A230r4qFrDm1mxo1KUh5bgq+hl0XY6yFSGiFsOG4HxCEu1XaYHbE0xeg4fq5?=
 =?us-ascii?Q?AA5OoNMb+MGLbIKmR0aYaVBujUpEv7e/grgcm/AlsC0YG96Cgnt8f2ttVeP8?=
 =?us-ascii?Q?T94l9FnX5hMj1DNOzuBRW4ZePvvJvWyurnPeeb04zoYV6lbvVQt/4GrhJcAB?=
 =?us-ascii?Q?Flu9ZZgubZxnHdRH1pbvmnaHElwhpC4oWIM7F2JrHpsfS5ISz0Ny0awH3H2P?=
 =?us-ascii?Q?80/nmhWgdolkAatwhcxGb9BL5WLSyPLEOm9S775x30ns6CC2i/Iiebuuvqoj?=
 =?us-ascii?Q?nMvQsMa14DB1+5t+xv2i+HElF/wnfqSuXhZBmR3Q5j0LW7QwZm5K6sSDDShz?=
 =?us-ascii?Q?68clTTm3k5BKVc82WBPJq3b6GVgt/PfIhsZ/ZmbLpANpk0TPHRBfvswrOHU0?=
 =?us-ascii?Q?qoOP1fyMqIllja7HLa4QfonzjtgEYZEWc7sK7aohRNQdlrnx4kzNusKspQqn?=
 =?us-ascii?Q?gWE1TA9Nm7Vei89mSZnG7ccDSdD+i6Kp5LMGi8kmfMVv2ju++YubXicvb6fH?=
 =?us-ascii?Q?YiEOzmyA5Wxh2S/t+amNrrcx0TCFPLb82Aa2ZIkW5LrrDAixDlKo6bQIsH0h?=
 =?us-ascii?Q?57Z76mQytMaNKOLb2mhMkz0naM9OZ3iAVPSM7j2rdKpRaHiOShPdPCwO3WsT?=
 =?us-ascii?Q?ZmVomdztbhYvnbMsjZjNML8HXxxX7F+KBNTPDPONxfLHX1Q8js1sOAgf1Nbc?=
 =?us-ascii?Q?s0UmF5ik39FfA2sjUFKwmC/X5abkWTmQEAJYty+H71Frd3IW6QeJmAIWI3Ah?=
 =?us-ascii?Q?AAN512gpHZkHFFPqB7h2AM3E8KPIClducNJfDmGfqibdR2HYxjuv3H9LVD0j?=
 =?us-ascii?Q?8vLCJfaek5x1FFxOk8NHnYnTxwMU3XyHy1vzDo6BBWRW6V5ulUmY2/v6FCno?=
 =?us-ascii?Q?taTqwCv7EHMCANFsvhKiV3FrYegXYgwZnhdeTswhGYgzmdjxr5nGHEkubrt5?=
 =?us-ascii?Q?TSCRwCX/uEYCD307+vo7qrgG9QLVVGPK6Ux0N6LD4PYpCBDQ9vHVGzi1RGrn?=
 =?us-ascii?Q?1R3hicXQjgWhr4jqXZOdy9NwODDFUsXERJOSat0hcVNkwqH0X3Tl9o99cJfQ?=
 =?us-ascii?Q?z5ZoZKR5rsCcEMlw6CKN3smwvZSgqxbxlqgQtPBrPUQxCq7wgeR/Nf0ToAjZ?=
 =?us-ascii?Q?9/4YEW4OS+FsIxahwc5FB7zkTdlQ+S60OJdJ74nEAnR1Ov7vxAdPJk7Yqa2C?=
 =?us-ascii?Q?bOOETdDBTf5a4xVxB1o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fac0db8-b289-4fa3-e39c-08dcd780ba08
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 01:25:05.6490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ridS7azHauqgzMxR4+gXb1BnuCvEDqPc39Ms8n6pjZL949TPA3kafUlxu7NnWjH6rqnlVtMSQgpdvXKo6AFIZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7801
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

This patch look good to me,
Reviewed-by : Jesse.zhang <Jesse.zhang@amd.com>

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Monday, September 16, 2024 9:33 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christi=
an <Christian.Koenig@amd.com>
Subject: [PATCH] tests/amd_queue_reset: refactor monitoring child process i=
nto a worker thread

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

This refactor was necessary because AMDGPU contexts cannot be exported or i=
mported between processes. Previously, we used fork to share the context be=
tween child processes (test and monitoring), which was essential for queryi=
ng the context status of failed jobs to validate GPU or queue reset progres=
sion using flags.

However, not all failures result in a queue reset. In cases of a GPU reset,=
 the entire VRAM is lost, and previously created contexts could not be used=
 in subsequent tests due to VM generation token mismatches. As a result, we=
 had two options: eliminate the monitoring process entirely or refactor its=
 functionality into a worker thread within the test process. We chose the l=
atter. Now, the worker thread of the test process  handles the monitoring t=
asks, ensuring smooth context management and satisfying all requirements.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 224 +++++++++++++++++++--------------
 1 file changed, 133 insertions(+), 91 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.=
c index 8162e2186..d130c16a6 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -32,7 +32,7 @@

 #define SHARED_CHILD_DESCRIPTOR 3

-#define TEST_TIMEOUT 100 //100 seconds
+#define TEST_TIMEOUT 20 //100 seconds

 enum  process_type {
        PROCESS_UNKNOWN,
@@ -80,6 +80,56 @@ struct shmbuf {

 };

+// Local memory structure for communication between child process and
+worker thread struct localbuf {
+       pthread_mutex_t mutex;          // Mutex for condition variable
+       pthread_cond_t cond_var;        // Condition variable to signal con=
text availability
+       int context_ready;                      // Flag to indicate if the =
context is ready
+       amdgpu_context_handle amdgpu_context;// Pointer to amdgpu context }=
;
+
+struct thread_params {
+       amdgpu_device_handle device;
+       amdgpu_context_handle *arr_context;
+       struct shmbuf *sh_mem;
+       int num_of_tests;
+       struct localbuf local_mem;
+
+};
+
+static struct thread_params*
+allocate_thread_param(amdgpu_device_handle device, struct shmbuf *sh_mem,
+                                       int num_of_tests)
+{
+       struct thread_params    *param =3D NULL;
+
+       param =3D malloc(sizeof(struct thread_params));
+       memset(param, 0, sizeof(struct thread_params));
+
+       param->device =3D device;
+       param->sh_mem =3D sh_mem;
+       param->num_of_tests =3D num_of_tests;
+       pthread_mutex_init(&param->local_mem.mutex, NULL);
+       pthread_cond_init(&param->local_mem.cond_var, NULL);
+       param->local_mem.amdgpu_context =3D NULL;
+       param->local_mem.context_ready =3D 0;
+
+       return param;
+}
+
+static void
+free_thread_param(struct thread_params *param) {
+       if (param) {
+               if (param->arr_context)
+                       free(param->arr_context);
+
+               pthread_cond_destroy(&param->local_mem.cond_var);
+               pthread_mutex_destroy(&param->local_mem.mutex);
+               free(param);
+       }
+}
+
 static inline
 void set_bit(int nr, uint32_t *addr)
 {
@@ -548,8 +598,8 @@ amdgpu_write_linear(amdgpu_device_handle device, amdgpu=
_context_handle context_h  }

 static int
-run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_=
context,
-                          struct shmbuf *sh_mem, int num_of_tests)
+run_monitor_child(amdgpu_device_handle device, struct shmbuf *sh_mem,
+               int num_of_tests, struct thread_params *param)
 {
        int ret;
        int test_counter =3D 0;
@@ -561,27 +611,32 @@ run_monitor_child(amdgpu_device_handle device, amdgpu=
_context_handle *arr_contex
        int64_t cnt =3D 0;
        time_t start, end;
        double elapsed =3D 0;
+       amdgpu_context_handle local_context =3D NULL;

        after_reset_state =3D after_reset_hangs =3D 0;
        init_flags =3D in_process_flags =3D 0;

-       ret =3D amdgpu_cs_query_reset_state2(arr_context[0], &init_flags);
-       if (init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)
-               igt_assert_eq(init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN=
_PROGRESS, 0);
-
        while (num_of_tests > 0) {
                sync_point_enter(sh_mem);
                state_machine =3D 0;
                error_code =3D 0;
                flags =3D 0;
                set_reset_state(sh_mem, false, ALL_RESET_BITS);
+
+               pthread_mutex_lock(&param->local_mem.mutex);
+               while (!param->local_mem.context_ready)
+                       pthread_cond_wait(&param->local_mem.cond_var,
+&param->local_mem.mutex);
+
+               local_context =3D param->local_mem.amdgpu_context;
+               pthread_mutex_unlock(&param->local_mem.mutex);
+
                time(&start);
                while (1) {
                        if (is_subtest_skipped(sh_mem))
                                break;

                        if (state_machine =3D=3D 0) {
-                               amdgpu_cs_query_reset_state2(arr_context[te=
st_counter], &init_flags);
+                               amdgpu_cs_query_reset_state2(local_context,=
 &init_flags);

                                if (init_flags & AMDGPU_CTX_QUERY2_FLAGS_RE=
SET)
                                        state_machine =3D 1;
@@ -590,9 +645,9 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_c=
ontext_handle *arr_contex
                                        state_machine =3D 2;

                        } else if (state_machine =3D=3D 1) {
-                               amdgpu_cs_query_reset_state(arr_context[tes=
t_counter],
+                               amdgpu_cs_query_reset_state(local_context,
                                                &after_reset_state, &after_=
reset_hangs);
-                               amdgpu_cs_query_reset_state2(arr_context[te=
st_counter],
+                               amdgpu_cs_query_reset_state2(local_context,
                                                &in_process_flags);

                                //TODO refactor this block !
@@ -613,9 +668,9 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_c=
ontext_handle *arr_contex
                                        }
                                }
                        } else if (state_machine =3D=3D 2) {
-                               amdgpu_cs_query_reset_state(arr_context[tes=
t_counter],
+                               amdgpu_cs_query_reset_state(local_context,
                                                &after_reset_state, &after_=
reset_hangs);
-                               amdgpu_cs_query_reset_state2(arr_context[te=
st_counter],
+                               amdgpu_cs_query_reset_state2(local_context,
                                                &in_process_flags);
                                /* here we should start timer and wait for =
some time until
                                 * the flag AMDGPU_CTX_QUERY2_FLAGS_RESET d=
isappear @@ -643,13 +698,22 @@ run_monitor_child(amdgpu_device_handle devic=
e, amdgpu_context_handle *arr_contex
        return ret;
 }

+static void *
+worker_thread(void *arg)
+{
+       struct thread_params *param =3D (struct thread_params *)arg;
+
+       run_monitor_child(param->device, param->sh_mem, param->num_of_tests=
,
+param);
+
+       return NULL;
+}


 static int
-run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_con=
text,
-                               struct shmbuf *sh_mem, int num_of_tests, ui=
nt32_t version)
+run_test_child(amdgpu_device_handle device, struct shmbuf *sh_mem,
+               int num_of_tests, uint32_t version, struct thread_params *p=
aram)
 {
-       int ret;
+       int ret, r;
        bool bool_ret;
        int test_counter =3D 0;
        char error_str[128];
@@ -659,6 +723,7 @@ run_test_child(amdgpu_device_handle device, amdgpu_cont=
ext_handle *arr_context,
        struct job_struct job;
        const struct amdgpu_ip_block_version *ip_block_test =3D NULL;
        struct amdgpu_cs_err_codes err_codes;
+       amdgpu_context_handle local_context =3D NULL;

        while (num_of_tests > 0) {
                sync_point_enter(sh_mem);
@@ -676,11 +741,19 @@ run_test_child(amdgpu_device_handle device, amdgpu_co=
ntext_handle *arr_context,
                err_codes.err_code_cs_submit =3D 0;
                err_codes.err_code_wait_for_fence =3D 0;

+               r =3D amdgpu_cs_ctx_create(device, &local_context);
+               igt_assert_eq(r, 0);
+               pthread_mutex_lock(&param->local_mem.mutex);
+               param->local_mem.amdgpu_context =3D local_context;
+               param->local_mem.context_ready =3D 1; // Mark the context a=
s ready
+               pthread_cond_signal(&param->local_mem.cond_var); // Notify =
the worker thread
+               pthread_mutex_unlock(&param->local_mem.mutex);
+
                if (is_dispatch) {
-                       ret =3D amdgpu_memcpy_dispatch_test(device, arr_con=
text[test_counter], job.ip, job.ring_id, version,
+                       ret =3D amdgpu_memcpy_dispatch_test(device, local_c=
ontext, job.ip,
+job.ring_id, version,
                                        job.error, &err_codes);
                } else {
-                       ret =3D amdgpu_write_linear(device, arr_context[tes=
t_counter],
+                       ret =3D amdgpu_write_linear(device, local_context,
                                        ip_block_test, &job, &err_codes);
                }

@@ -692,11 +765,21 @@ run_test_child(amdgpu_device_handle device, amdgpu_co=
ntext_handle *arr_context,
                                break;
                        sleep(1);
                }
-               /* validate expected result */
-               //igt_assert_eq(err_codes.err_code_wait_for_fence, job.rese=
t_err_result);
+

                sync_point_exit(sh_mem);
+               pthread_mutex_lock(&param->local_mem.mutex);
+               param->local_mem.context_ready =3D 0;
+               param->local_mem.amdgpu_context =3D NULL;
+               amdgpu_cs_ctx_free(local_context);
+               pthread_mutex_unlock(&param->local_mem.mutex);
+
                test_counter++;
+               igt_assert_eq(err_codes.err_code_cs_submit, 0);
+               igt_assert_eq(err_codes.err_code_wait_for_fence, job.reset_=
err_result);
+               //igt_info("=3D=3D=3D=3DTest %s ip %s wait_for_fence %d=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n", error_str,
+               //              job.ip =3D=3D AMD_IP_GFX? "AMD_IP_GFX" : "A=
MD_IP_COMPUTE",
+               //              err_codes.err_code_wait_for_fence);
        }
        return ret;
 }
@@ -718,10 +801,6 @@ run_background(amdgpu_device_handle device, struct shm=
buf *sh_mem,
        unsigned int flags;
        struct amdgpu_cs_err_codes err_codes;

-       r =3D amdgpu_cs_ctx_create(device, &context_handle);
-       igt_assert_eq(r, 0);
-
-
        while (num_of_tests > 0) {
                sync_point_enter(sh_mem);
                if (is_subtest_skipped(sh_mem)) {
@@ -732,6 +811,8 @@ run_background(amdgpu_device_handle device, struct shmb=
uf *sh_mem,
                read_next_job(sh_mem, &job, true);
                ip_block_test =3D get_ip_block(device, job.ip);
                is_dispatch_shader_test(job.error,  error_str, &is_dispatch=
);
+               r =3D amdgpu_cs_ctx_create(device, &context_handle);
+               igt_assert_eq(r, 0);
                while (1) {
                        r =3D amdgpu_write_linear(device, context_handle,  =
ip_block_test, &job, &err_codes);

@@ -756,37 +837,36 @@ run_background(amdgpu_device_handle device, struct sh=
mbuf *sh_mem,
                        counter++;

                }
+               r =3D amdgpu_cs_ctx_free(context_handle);
                sync_point_exit(sh_mem);
                num_of_tests--;
        }
-       r =3D amdgpu_cs_ctx_free(context_handle);
        return r;
 }


-
-
 static int
-run_all(amdgpu_device_handle device, amdgpu_context_handle *arr_context_ha=
ndle,
-               enum process_type process, struct shmbuf *sh_mem,  int num_=
of_tests,
-               uint32_t version, pid_t *monitor_child, pid_t *test_child)
+run_all(amdgpu_device_handle device, enum process_type process,
+               struct shmbuf *sh_mem,  int num_of_tests, uint32_t version,
+               pid_t *monitor_child, pid_t *test_child)
 {
+       struct thread_params *param;
+       pthread_t worker;
+
        if (process =3D=3D PROCESS_TEST) {
-               *monitor_child =3D fork();
-               if (*monitor_child =3D=3D -1) {
-                       igt_fail(IGT_EXIT_FAILURE);
-               } else if (*monitor_child =3D=3D 0) {
-                       *monitor_child =3D getppid();
-                       run_monitor_child(device, arr_context_handle, sh_me=
m, num_of_tests);
-                               igt_success();
-                               igt_exit();
-               }
                *test_child =3D fork();
                if (*test_child =3D=3D -1) {
                        igt_fail(IGT_EXIT_FAILURE);
                } else if (*test_child =3D=3D 0) {
                        *test_child =3D getppid();
-                       run_test_child(device, arr_context_handle, sh_mem, =
num_of_tests, version);
+                       param =3D allocate_thread_param(device, sh_mem, num=
_of_tests);
+                       if (pthread_create(&worker, NULL, worker_thread, pa=
ram) !=3D 0) {
+                               igt_info("********Failed to create worker t=
hread");
+                               igt_fail(IGT_EXIT_FAILURE);
+                       }
+                       run_test_child(device, sh_mem, num_of_tests, versio=
n, param);
+                       pthread_join(worker, NULL);
+                       free_thread_param(param);
                        igt_success();
                        igt_exit();

@@ -909,9 +989,9 @@ is_run_device_parameter_found(int argc, char **argv)
                if (strcmp(ONDEVICE, argv[i]) =3D=3D 0) {
                        /* Get the sum for a specific device as a unique id=
entifier */
                        p =3D argv[i+1];
-                       while(*p){
-                         res +=3D *p;
-                         p++;
+                       while (*p) {
+                               res +=3D *p;
+                               p++;
                        }
                        break;
                }
@@ -967,35 +1047,6 @@ launch_background_process(int argc, char **argv, char=
 *path, pid_t *ppid, int sh
        return status;
 }

-static void
-create_contexts(amdgpu_device_handle device, amdgpu_context_handle **pp_co=
ntexts,
-               int num_of_contexts)
-{
-       amdgpu_context_handle *p_contexts =3D NULL;
-       int i, r;
-
-       p_contexts =3D (amdgpu_context_handle *)malloc(sizeof(amdgpu_contex=
t_handle)
-                       *num_of_contexts);
-
-       for (i =3D 0; i < num_of_contexts; i++) {
-               r =3D amdgpu_cs_ctx_create(device, &p_contexts[i]);
-               igt_assert_eq(r, 0);
-       }
-       *pp_contexts =3D p_contexts;
-
-}
-static void
-free_contexts(amdgpu_device_handle device, amdgpu_context_handle *p_contex=
ts,
-               int num_of_contexts)
-{
-       int i;
-
-       if (p_contexts) {
-               for (i =3D 0; i < num_of_contexts; i++)
-                       amdgpu_cs_ctx_free(p_contexts[i]);
-       }
-}
-
 static bool
 adjust_begin_index(unsigned int *ring_begin, unsigned int available_good_r=
ings)  { @@ -1095,19 +1146,13 @@ igt_main
        enum amd_ip_block_type ip_tests[2] =3D {AMD_IP_COMPUTE/*keep first*=
/, AMD_IP_GFX};
        enum amd_ip_block_type ip_background =3D AMD_IP_COMPUTE;

-       amdgpu_context_handle *arr_context_handle =3D NULL;
-
-       /* TODO remove this , it is used only to create array of contexts
-        * which are shared between child processes ( test/monitor/main and
-        *  separate for background
-        */
        struct dynamic_test arr_err[] =3D {
                        {CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM=
_EXEC_INVALID_PACKET_LENGTH",
                                "Stressful-and-multiple-cs-of-bad and good =
length-operations-using-multiple-processes",
-                               { { FAMILY_GFX1100, 0x1, 0xFF }, {FAMILY_AI=
, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } } , {-ECANCELED, -ECANCELED, 0 } }=
,
+                               { {FAMILY_GFX1100, 0x1, 0xFF }, {FAMILY_AI,=
 0x32, 0xFF },
+{FAMILY_AI, 0x3C, 0xFF } }, {-ECANCELED, -ECANCELED, -ECANCELED } },
                        {CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_I=
NVALID_OPCODE",
                                "Stressful-and-multiple-cs-of-bad and good =
opcode-operations-using-multiple-processes",
-                               { {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOW=
N, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } } , { 0, -ECANCELED, -ECANCELED } },
+                               { {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOW=
N, -1, -1 },
+{FAMILY_UNKNOWN, -1, -1 } }, {-ECANCELED, -ECANCELED, -ECANCELED } },
                        //TODO  not job timeout, debug why for n31.
                        //{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_ST=
REAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
                        //      "Stressful-and-multiple-cs-of-bad and good =
mem-sync-operations-using-multiple-processes"},
@@ -1116,16 +1161,16 @@ igt_main
                        //      "Stressful-and-multiple-cs-of-bad and good =
reg-operations-using-multiple-processes"},
                        {BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEN=
D_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
                                "Stressful-and-multiple-cs-of-bad and good =
shader-operations-using-multiple-processes",
-                               { {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI,=
 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECAN=
CELED } },
+                               { {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI,=
 0x32, 0x3C },
+{FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA } },
                        //TODO  KGQ cannot recover by queue reset, it maybe=
 need a fw bugfix on naiv31
                        //{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BA=
CKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
                        //      "Stressful-and-multiple-cs-of-bad and good =
shader-operations-using-multiple-processes"},
                        {BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_S=
E_GC_SHADER_INVALID_USER_DATA",
                                "Stressful-and-multiple-cs-of-bad and good =
shader-operations-using-multiple-processes",
-                               { {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_AI, 0x=
32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCEL=
ED } },
+                               { {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_AI, 0x=
32, 0x3C }, {FAMILY_AI,
+0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA } },
                        {BACKEND_SE_GC_SHADER_INVALID_SHADER, "BACKEND_SE_G=
C_SHADER_INVALID_SHADER",
                                "Stressful-and-multiple-cs-of-bad and good =
shader-operations-using-multiple-processes",
-                               { {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI,=
 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECAN=
CELED } },
+                               { {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI,=
 0x32, 0x3C },
+{FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA } },
                        {}
        };

@@ -1146,7 +1191,7 @@ igt_main
                        const_num_of_tests =3D (sizeof(arr_err)/sizeof(stru=
ct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);

                r =3D is_run_device_parameter_found(argc, argv);
-               snprintf(shm_name,sizeof(shm_name),"/queue_reset_shm_%d",r)=
;
+               snprintf(shm_name, sizeof(shm_name), "/queue_reset_shm_%d",=
 r);
                fd =3D drm_open_driver(DRIVER_AMDGPU);

                err =3D amdgpu_device_initialize(fd, &major, &minor, &devic=
e); @@ -1175,19 +1220,17 @@ igt_main
                } else {
                        process =3D PROCESS_BACKGROUND;
                }
-               if (process =3D=3D PROCESS_TEST)
-                       create_contexts(device, &arr_context_handle, const_=
num_of_tests);
-               else if (process =3D=3D PROCESS_BACKGROUND)
+               if (process =3D=3D PROCESS_BACKGROUND)
                        fd_shm =3D shared_mem_open(&sh_mem);
+
                igt_require(fd_shm !=3D -1);
                igt_require(sh_mem !=3D NULL);

-               run_all(device, arr_context_handle,
-                       process, sh_mem, const_num_of_tests, info[0].hw_ip_=
version_major,
-                       &monitor_child, &test_child);
+               run_all(device, process, sh_mem, const_num_of_tests,
+                               info[0].hw_ip_version_major, &monitor_child=
, &test_child);
        }
        //print expect error table for each test
-       if(!argc)  {// --list-subtests arg is 0
+       if (!argc) {// --list-subtests arg is 0
                for (int i =3D 0; i < ARRAY_SIZE(ip_tests); i++)
                        for (struct dynamic_test *it =3D &arr_err[0]; it->n=
ame; it++) {
                                expect_error =3D ip_tests[i] =3D=3D AMD_IP_=
COMPUTE ?
@@ -1224,7 +1267,6 @@ igt_main
                        waitpid(test_child, &testExitMethod, 0);
                }
                waitpid(pid_background, &backgrounExitMethod, 0);
-               free_contexts(device, arr_context_handle, const_num_of_test=
s);
                amdgpu_device_deinitialize(device);
                drm_close_driver(fd);
                shared_mem_destroy(sh_mem, fd_shm, true, shm_name);
--
2.25.1

