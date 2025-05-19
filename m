Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4218C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 04:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E024710E1D9;
	Mon, 19 May 2025 04:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N5LtkH/6";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3148A10E1E6
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 04:53:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RefEUaQg/nO4aMnn7B/RqzuUArglSy5do1EZ8BFSOM+2AMfBSt5x2gMQrC/RBMl4qzDXmcRHkhz8BNYnx4YQzZdqqDeE66lqTXC5ljqzhrJPOO2cJMBLpw5q2soETNrp1GQ1Y1VHRbjmdbJLZUmYDV+G++Zu81RRbE8Gt6b0yoo5g/+YEB918PK775Jq/iNE4VTcJugc1RlobYF6hjBbL/1XSOpKe/owRx47JmLbMPHYLGH+JZWsxcEjwPgEQ63+togCT1bphBI0wq9pfP4v7AF7RaQWBpG4vts95kRZygp30MCcDcRraFG8lKTmII0gYmZvLUl00YqlUWrBXMhzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogWxUNtAU+iu/BRhtn3eiAdN7Php57MLGEDeuPwPkIY=;
 b=T0TGzR+yS9J4hTdlX5+6WNxzSlemyvhpEg+VywCtnOuxJOG/1g3ac72UmOS78p9+7Ux5DRwYLSVPjnO9JE65thyzpyP5Chj1YdVWnEiBhELqOTV4/rw4V8x7Mg/tUPKzlu23sdVjljPcwEzaAvzzCIV/de+Pfvh0JYdKEge+RjYzgxksFZA2SWMK0P6rOzci5IRBCTlMhBIwkKoATdode+OwBTI8U9UWV68cgsRIHjK6e+Hp5lRmhnpkX/X86lyD1PnLpdRKHPDAlGzFzFRUeucWUPzldOGwAVRg28pTX2mjFWURf5GLAqwZAwImkvD5tBp2IdlMHgInGGam24cl7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogWxUNtAU+iu/BRhtn3eiAdN7Php57MLGEDeuPwPkIY=;
 b=N5LtkH/65QteoB78ND3UzJcpysBXhqVpjbca07eo9LPNqSKJU18Yg5YkkQ1AahlQDhCVVi5dwLmbxhgufYUcszIkseVAeoHHK5cACmB3EMfeRV/uN+cNIwkS+6Ye/F8h7r1vk+Byizeuv8afS3dxDEcdKHRrEJEPeOvANDvOwcw=
Received: from PH7PR12MB6633.namprd12.prod.outlook.com (2603:10b6:510:1ff::20)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 04:53:40 +0000
Received: from PH7PR12MB6633.namprd12.prod.outlook.com
 ([fe80::cf8b:bdd3:d791:fccc]) by PH7PR12MB6633.namprd12.prod.outlook.com
 ([fe80::cf8b:bdd3:d791:fccc%7]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 04:53:39 +0000
From: "Mohan Marimuthu, Yogesh" <Yogesh.Mohanmarimuthu@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 2/2] tests/amdgpu: add fwm preemption test case
 for userq
Thread-Topic: [PATCH i-g-t v2 2/2] tests/amdgpu: add fwm preemption test case
 for userq
Thread-Index: AQHbx+aOG/5GZmVmQUWBcVPvraSrS7PZP0HggAAhs0s=
Date: Mon, 19 May 2025 04:53:39 +0000
Message-ID: <PH7PR12MB6633A045C7FBB631195E3330FF9CA@PH7PR12MB6633.namprd12.prod.outlook.com>
References: <PH7PR12MB6633E37C674801431E4BFADCFF9DA@PH7PR12MB6633.namprd12.prod.outlook.com>
 <DM4PR12MB5152117AB462B2B8EA3A076AE39CA@DM4PR12MB5152.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB5152117AB462B2B8EA3A076AE39CA@DM4PR12MB5152.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-19T04:53:39.225Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6633:EE_|SJ2PR12MB8884:EE_
x-ms-office365-filtering-correlation-id: 03e2336b-4bcf-4d44-1749-08dd96911f62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|8096899003; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?o4i497NufubNNB5/i8itVH68vyClmOCPIBcVb2xa2Iv+OEOvckje89zbhw?=
 =?iso-8859-1?Q?3nSrIFqi8KVQ+fWRFu2jmNhVFd67vRsDF61lsiuWaoT8EZRuAYSx5mBRy5?=
 =?iso-8859-1?Q?ullE2xJtYlqDYFacI6UYr6eLoOvbVqu3dQRTahRwtVzlmLGUJWnIpoT1Ne?=
 =?iso-8859-1?Q?hnkQrixsvMhc2i3X2u2KBXj+XP0fcG3Tu1vKFL97D34jykqBcI93/llFuQ?=
 =?iso-8859-1?Q?i1mzA6+blNMqHIBi/ZH6fFAvmJLNRx+1Rqp+RiR9QJIa1aCBXfiscmtDSD?=
 =?iso-8859-1?Q?sTiwg/FBh0k7Wle/k3sCJQ5O9fHVbD8KynU3IXOnVGuMXCuVIZumh68s74?=
 =?iso-8859-1?Q?JlD1BM8Sn4EFZy7SaINaC9+z5R+e9g34YOlwuTa2AntjNucuneM7iVmQMo?=
 =?iso-8859-1?Q?grlGzYs0gHPx8mbdDxrWbhoxUCfr5nRpusoF7HobvC4tQMRyjz8RA9O0f4?=
 =?iso-8859-1?Q?IQWySRKIBGMZVxXwr/bADMIbqHOiK3TTLb+Okt7NyXGYrXAYoRv/duS+oh?=
 =?iso-8859-1?Q?5PBqnX5rGv/99tbgXdPJTQP7OPNG7ZaZIysQ9t8haiQ0QB/SVCfC9wiqwc?=
 =?iso-8859-1?Q?ce6SM7PbpRaVOhOFkgHKXv3YS1f3EcU7cMN6jxUfXxFr2BMTLj+T81nTYD?=
 =?iso-8859-1?Q?zmWpgrg1Q48ezIC/WQWdJpQ6ZI5oK0y1hs+EcGg+rQR7XBrS/+QZ01AM/z?=
 =?iso-8859-1?Q?Ouqak91ps6csTldkHwKDQS0/p8aHbNmPiARyrnK5WMLPEe9R0xf+hAEZBo?=
 =?iso-8859-1?Q?5rF/aSZ+P+TVa1hyBQKJ5v3QSq577/D0I+ajiSM7TtRlgUOsvNBWMord+g?=
 =?iso-8859-1?Q?OGp90ZeR+x5vW3Id2F7URnkNuywQtB5LqkKr27ZdsyCVMaFFTFL/aQZNEc?=
 =?iso-8859-1?Q?wio0nj0b4NjBs+DvXI/3DLoXIPifXC0S+Sq+Vd+Df6dz6I22mc+9fScu5a?=
 =?iso-8859-1?Q?Z2M5IYJ+Eq9umZ3tuSrk0KthRUvmIiPF6JzbEHXOYSn5FqBEqVrn9e+M3I?=
 =?iso-8859-1?Q?z9lByeETCuvDLYYk5F17gPWeUTtcgYDrNHL5zCrrKQoQBicaR0t0yBhOhm?=
 =?iso-8859-1?Q?ta07w7wjWYu54bE930diHl/aDyDEmk2zsaHJFNTgmLTqI7NwroyDLidgW2?=
 =?iso-8859-1?Q?XcbB9zDGyFDGp8SL+kGD6dKqPHk1CC67HT8TgAMhm9kAe2zHprYXbHwrvU?=
 =?iso-8859-1?Q?QAgX1Te3jcWM+P7wRELBRuvaf9HfmDqhWVZTvVk72Pa09QSvZmVkNM0GY9?=
 =?iso-8859-1?Q?hWGZg0DxazIbUb19XIiC56EDqLEvv1A14drayq3FWJDBxCt1xin2QMsl9q?=
 =?iso-8859-1?Q?o3PDCm2mgOJen0+XKWV7RB98J9IPOQ81QZ/JE14yGP3ReOgBZZccaoedgB?=
 =?iso-8859-1?Q?adHXPY8povIuWJ5FWqy9pqZ+iIhpokh+ncRvEzXLMVxhtEsTArfmVVFY8M?=
 =?iso-8859-1?Q?5RhpVEeqAwAF8NNtJZKA2sHdjGuIMuERAW8NP3vAdRRzaftjT2uNsST4Gu?=
 =?iso-8859-1?Q?nlgSOge6XtnrqjDggARSc+oHBO+59k4liBuFc3RIhwVA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(8096899003); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8x8dbBHRrh4QpyxTDqNrvHbuzjwmqo/T46tu6ZYlet2sGUeP3FMQABrzzY?=
 =?iso-8859-1?Q?6OfgxtE7VPjp3iipqV+VscPy9qG+MLM+VTvQI059DbvOMRWewHvavIBKF9?=
 =?iso-8859-1?Q?+vO30IuXntiCq3gq9JO9D43lrZl52X/Ehmw0pePmvoFoPcvQaWh/y/S8wz?=
 =?iso-8859-1?Q?5POOLAIsvysJ5Y74GRGC12Rp0QF2WVDtygbFIjnBRGW22UInfNfuczYZFg?=
 =?iso-8859-1?Q?Pq7B84YLH2IftlqA991eaAOpjQM2YARCepInankckZIiUaW/0XM6g2kbEH?=
 =?iso-8859-1?Q?hJmq8viQ8klEYQGfPSkJxts140cK1xzOQDek83bNOA17o/ev21OnUePP1n?=
 =?iso-8859-1?Q?17zSwZ/ilRlAW19b+5xKDfq8lBjKSTDYcR1iE91UxM1QImsSmmDC2L2xso?=
 =?iso-8859-1?Q?D3L5WHfj+F2UCeI+mzCmO9F2ily6b4jdECh93YPjPMuXFa4I7VrLGQqdTi?=
 =?iso-8859-1?Q?skjcIgU6dNWhtAL7u/erH1FPEYZZg1nPirVjRv9cWxd9L0bXRR3I9/mq61?=
 =?iso-8859-1?Q?ATphfNEwyfnstFwRko2bQhh0PTXfHLUoH1ySwSjRoCA+I3RW3wpqRAKYoE?=
 =?iso-8859-1?Q?+o5a38Hl2yYtn3nkKTFOKb7ZXxomYmN8GTX9QeH32AZomBJgBUHVPYDzQi?=
 =?iso-8859-1?Q?VW0rE625Xxo5+2KR27SWXhU3hmNC/uOgNPLl8/mblSbXnzcmo6dQhMohwG?=
 =?iso-8859-1?Q?iJLLQw3DkWsoQAqyTRtJfPnJPtEKudDgivr1ENn+SqYgZMPp7Gwd0/sC2K?=
 =?iso-8859-1?Q?NbV0IEn0URQz4au7FDKuaeLddMPXsSEth68X/BHybW4iBEQ7g7U6eV2ekV?=
 =?iso-8859-1?Q?W9kbj3HanljHT7gOyW+10JmCG16tPEb605TyV46LI10ghroapfSnfs/3IX?=
 =?iso-8859-1?Q?AJgr6m3UA+7Gwr3/Ch2pfLSfdvAuIVp7sjSeZUWU2+6+sh6fIQsVHhVxA+?=
 =?iso-8859-1?Q?FYq2cTSmPr9wnH3eeOgIZ8A1VOY/BbfnqlnhjWIYEt1H4RabZALZJeGU1m?=
 =?iso-8859-1?Q?+n/UdsHqFvhSBHAjqU4KHkIKu2+gcyY3ioBfQskzG38RzE3PmyWhGBF/hU?=
 =?iso-8859-1?Q?o61qLtCq6Qq9ARJ/N+Nsdeka/M+/OxUhbycs+zHB4H7XuMGi7kF/hfOrna?=
 =?iso-8859-1?Q?FNel6nmY1XqyoFthdUhcOs9zRFwTQKZNh+9ORQz0nrH6ym5GGYufiRyvBJ?=
 =?iso-8859-1?Q?zN6N2o6ywOajQZyM6khlxYZo92qVkkSpysPwS62mXjG9phdbT0WNREYmPR?=
 =?iso-8859-1?Q?XGpu+SC4zJTH8ZU6cJzeS7iEzH6MNh/beKBE6sjPbrPxUTCvm2LVJQuu+x?=
 =?iso-8859-1?Q?awIKzACib85KZkQnErwXxFMN8k8RfsNaxCpIw4aXsZ6XS+fPgysLEPr+k7?=
 =?iso-8859-1?Q?2ayShF2DEUNylb8jOqQIdcnNUSNf9GOEuFT16b4jwX67WjnmuV5eo66hR2?=
 =?iso-8859-1?Q?gk3Xq9lx/sFsKPZQKC/pZy1jY0CT6pgGYqqKdypRgTcOMiS7g1GxwUFmHM?=
 =?iso-8859-1?Q?Ma+bAxhgjgg8KDgMHKwLjFyuTbpy+Hb2MyRDIowjSP1WCN8D7at9JiJfaE?=
 =?iso-8859-1?Q?Fx0FoeNcoEc4XT9diPlNhnoqa+tXFV86L3zsXWmcLq/af2h1aX7kwJQ5wZ?=
 =?iso-8859-1?Q?Ofs/JxlDsqBt8=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH7PR12MB6633A045C7FBB631195E3330FF9CAPH7PR12MB6633namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6633.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e2336b-4bcf-4d44-1749-08dd96911f62
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 04:53:39.7091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CumRegTqQImJzgfTHrPtzPJD6VYW6b8BSCxrL8J1KZ1dkEgNC0jgMk02fIHWNH8JCVsLjryI117CnH+riM0V7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884
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

--_000_PH7PR12MB6633A045C7FBB631195E3330FF9CAPH7PR12MB6633namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[Public]

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

        The gfx_ring_write_linear() function does not add packets to existi=
ng cmd_base, it adds to ring_context->pm4 and does*pm4_dw =3D i.
        To use gfx_ring_write_linear(), I will have to do following which d=
oes not look good IMHO.

        ring_context_1->pm4 =3D ring_context_1->bo3_cpu + cmd_base_1->cdw;
        uint32_t ret_pm4_dw;
        gfx_ring_write_linear(...);
        cmd_base_1->cdw +=3D ret_pm4_dw;

        Thank you,
        Yogesh

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

--_000_PH7PR12MB6633A045C7FBB631195E3330FF9CAPH7PR12MB6633namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#008000;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The fwm premption is tested using below algorithm,<br>
1) create 2 queues<br>
2) submit dma write job with unsatisfied fence on both the queues<br>
3) if the dma write passes then the test has failed<br>
<br>
v2: reduce timeout to 2ms<br>
<br>
Cc: Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;<br>
Cc: Jesse.Zhang &lt;Jesse.zhang@amd.com&gt;<br>
Cc: Sunil Khatri &lt;sunil.khatri@amd.com&gt;<br>
Signed-off-by: Yogesh Mohan Marimuthu &lt;yogesh.mohanmarimuthu@amd.com&gt;=
<br>
Reviewed-by: Sunil Khatri &lt;sunil.khatri@amd.com&gt;<br>
---<br>
&nbsp;lib/amdgpu/amd_PM4.h&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 17 ++++<br>
&nbsp;tests/amdgpu/amd_basic.c | 178 ++++++++++++++++++++++++++++++++++++++=
+<br>
&nbsp;2 files changed, 195 insertions(+)<br>
<br>
diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h index 8f59b4223..d=
6a8446f4 100644<br>
--- a/lib/amdgpu/amd_PM4.h<br>
+++ b/lib/amdgpu/amd_PM4.h<br>
@@ -195,6 +195,23 @@<br>
&nbsp;#define PACKET3_INDIRECT_BUFFER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x3F<br>
&nbsp;#define PACKET3_PROTECTED_FENCE_SIGNAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xd=
0<br>
<br>
+#define PACKET3_FENCE_WAIT_MULTI&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 0xd1<br>
+#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; FENCE_WAIT_MULTI_PREEMPTABLE(x)&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ((x) &lt;&lt; 1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* 0 - no<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * 1 - yes<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
+#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; FENCE_WAIT_MULTI_CACHE_POLICY(x)&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ((x) &lt;&lt; 2)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* 0 - LRU<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * 1 - Stream<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * 2 - noa<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * 3 - Bypass<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
+#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; FENCE_WAIT_MULTI_ENGINE(x)&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((x) &lt;&lt; 8)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* 0 - me<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * 1 - pfp<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
+#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; FENCE_WAIT_MULTI_POLL_INTERVAL(x)&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; ((x) &lt;&lt; 16)<br>
+<br>
&nbsp;#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PACKET3_WRITE_DATA&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0x37<br>
&nbsp;#define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_DATA_DST_SEL(x)&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; ((x) &lt;&lt; 8)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* 0 - register<br>
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c index 914d=
27909..075057960 100644<br>
--- a/tests/amdgpu/amd_basic.c<br>
+++ b/tests/amdgpu/amd_basic.c<br>
@@ -689,6 +689,176 @@ amdgpu_sync_dependency_test(amdgpu_device_handle devi=
ce_handle, bool user_queue)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(ring_context);<br>
&nbsp;}<br>
<br>
+static void<br>
+amdgpu_fwm_preempt_test(amdgpu_device_handle device_handle) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring_context *ring_cont=
ext_1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring_context *ring_cont=
ext_2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_cmd_base *cmd_base_1 =
=3D get_cmd_base();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_cmd_base *cmd_base_2 =
=3D get_cmd_base();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct amdgpu_ip_block_version =
*ip_block =3D get_ip_block(device_handle, AMD_IP_GFX);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_1 =3D calloc(1, sizeof(s=
truct amdgpu_ring_context));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(ring_context_1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_user_queue_create(device_handl=
e, ring_context_1,<br>
+ ip_block-&gt;type);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_2 =3D calloc(1, sizeof(s=
truct amdgpu_ring_context));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(ring_context_2);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_user_queue_create(device_handl=
e, ring_context_2,<br>
+ ip_block-&gt;type);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* allocate bo1 for dma, bo2 for fenc=
e and bo3 for ib for render context 1 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_1-&gt;write_length =3D 1=
024;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_alloc_and_map_sync(de=
vice_handle , ring_context_1-&gt;write_length, 4096,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; AMDGPU_GEM_DOMAIN_GTT, AMDGPU_GEM_CREATE_CPU_GTT_USWC,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; AMDGPU_VM_MTYPE_UC, &amp;ring_context_1-&gt;bo,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; (void **)&amp;ring_context_1-&gt;bo_cpu, &amp;ring_context_1-&gt=
;bo_mc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &amp;ring_context_1-&gt;va_handle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ring_context_1-&gt;timeline_syncobj_handle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ++ring_context_1-&gt;point, true);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset((void *)ring_context_1-&gt;bo_=
cpu, 0,<br>
+ ring_context_1-&gt;write_length);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_alloc_and_map_sync(de=
vice_handle, 4096, 4096, AMDGPU_GEM_DOMAIN_GTT,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &amp;ring_context_1-&gt;bo2, (void **)&amp;ring_context_1-&gt;bo=
2_cpu,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &amp;ring_context_1-&gt;bo_mc2, &amp;ring_context_1-&gt;va_handl=
e2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ring_context_1-&gt;timeline_syncobj_handle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ++ring_context_1-&gt;point, true);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset((void *)ring_context_1-&gt;bo2=
_cpu, 0, 4096);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_alloc_and_map_sync(de=
vice_handle, 8192, 4096, AMDGPU_GEM_DOMAIN_GTT,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &amp;ring_context_1-&gt;bo3, (void **)&amp;ring_context_1-&gt;bo=
3_cpu,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &amp;ring_context_1-&gt;bo_mc3, &amp;ring_context_1-&gt;va_handl=
e3,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ring_context_1-&gt;timeline_syncobj_handle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ++ring_context_1-&gt;point, true);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset((void *)ring_context_1-&gt;bo3=
_cpu, 0, 4096);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* allocate bo1 for dma, bo2 for fenc=
e and bo3 for ib for render context 2 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_2-&gt;write_length =3D 1=
024;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_alloc_and_map_sync(de=
vice_handle , ring_context_2-&gt;write_length, 4096,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; AMDGPU_GEM_DOMAIN_GTT, AMDGPU_GEM_CREATE_CPU_GTT_USWC,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; AMDGPU_VM_MTYPE_UC, &amp;ring_context_2-&gt;bo,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; (void **)&amp;ring_context_2-&gt;bo_cpu, &amp;ring_context_2-&gt=
;bo_mc,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &amp;ring_context_2-&gt;va_handle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ring_context_2-&gt;timeline_syncobj_handle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ++ring_context_2-&gt;point, true);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset((void *)ring_context_2-&gt;bo_=
cpu, 0,<br>
+ ring_context_2-&gt;write_length);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_alloc_and_map_sync(de=
vice_handle, 4096, 4096, AMDGPU_GEM_DOMAIN_GTT,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &amp;ring_context_2-&gt;bo2, (void **)&amp;ring_context_2-&gt;bo=
2_cpu,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &amp;ring_context_2-&gt;bo_mc2, &amp;ring_context_2-&gt;va_handl=
e2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ring_context_2-&gt;timeline_syncobj_handle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ++ring_context_2-&gt;point, true);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset((void *)ring_context_2-&gt;bo2=
_cpu, 0, 4096);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_alloc_and_map_sync(de=
vice_handle, 8192, 4096, AMDGPU_GEM_DOMAIN_GTT,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &amp;ring_context_2-&gt;bo3, (void **)&amp;ring_context_2-&gt;bo=
3_cpu,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &amp;ring_context_2-&gt;bo_mc3, &amp;ring_context_2-&gt;va_handl=
e3,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ring_context_2-&gt;timeline_syncobj_handle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ++ring_context_2-&gt;point, true);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset((void *)ring_context_2-&gt;bo3=
_cpu, 0, 4096);<br>
+<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* wait for gtt mapping to complete *=
/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_timeline_syncobj_wait(de=
vice_handle, ring_context_1-&gt;timeline_syncobj_handle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ring_context_1-&gt;point);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_timeline_syncobj_wait(de=
vice_handle, ring_context_2-&gt;timeline_syncobj_handle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ring_context_2-&gt;point);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* assign cmd buffer for ring context=
 1 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_1-&gt;attach_buf(cmd_base_1,=
 (void<br>
+ *)ring_context_1-&gt;bo3_cpu, 8192);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* create the ib for ring context 1 *=
/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_1-&gt;emit(cmd_base_1, PACKE=
T3(PACKET3_FENCE_WAIT_MULTI, 4 * 1));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_1-&gt;emit(cmd_base_1, FENCE=
_WAIT_MULTI_ENGINE(1) | FENCE_WAIT_MULTI_PREEMPTABLE(1) |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; FENCE_WAIT_MULTI_CACHE_POLICY(3) | FENCE_WAIT_MULTI_POLL_INTERVAL(4=
));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_1-&gt;emit(cmd_base_1, ring_=
context_1-&gt;bo_mc2);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_1-&gt;emit(cmd_base_1, ring_=
context_1-&gt;bo_mc2 &gt;&gt; 32);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_1-&gt;emit(cmd_base_1, 10); =
// random incorrect fence value<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_1-&gt;emit(cmd_base_1, 0);<b=
r>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_1-&gt;emit(cmd_base_1, PACKE=
T3(PACKET3_WRITE_DATA, 3));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_1-&gt;emit(cmd_base_1, WRITE=
_DATA_DST_SEL(5) | WR_CONFIRM |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; WRITE_DATA_CACHE_POLICY(3));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_1-&gt;emit(cmd_base_1, 0xfff=
ffffc &amp; ring_context_1-&gt;bo_mc);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_1-&gt;emit(cmd_base_1, (0xff=
ffffff00000000 &amp; ring_context_1-&gt;bo_mc) &gt;&gt; 32);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_1-&gt;emit(cmd_base_1, 0xdea=
d0000);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Can we use the existing function=
 write_linear to replace this?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jesse</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; The gfx_ring_write_linear() function does not a=
dd packets to existing cmd_base, it adds to ring_context-&gt;pm4 and does*p=
m4_dw =3D i.</div>
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; To use gfx_ring_write_linear(), I will have to =
do following which does not look good IMHO.</div>
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; ring_context_1-&gt;pm4 =3D ring_context_1-&gt;b=
o3_cpu + cmd_base_1-&gt;cdw;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; uint32_t ret_pm4_dw;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; gfx_ring_write_linear(...);</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; cmd_base_1-&gt;cdw +=3D ret_pm4_dw;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; Thank you,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; Yogesh<br>
<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_1-&gt;pm4_dw =3D cmd_bas=
e_1-&gt;cdw;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_user_queue_submit(device_handl=
e, ring_context_1, ip_block-&gt;type,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_1-&gt;bo_mc3, true);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* if fwm packet got skipped by firmw=
are then 0xdead000 will be written */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usleep(1000 * 2);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq_u32(*ring_context_1-&gt=
;bo_cpu, 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* assign cmd buffer for ring context=
 2 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_2-&gt;attach_buf(cmd_base_2,=
 (void<br>
+ *)ring_context_2-&gt;bo3_cpu, 8192);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* create the ib for ring context 2 *=
/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_2-&gt;emit(cmd_base_2, PACKE=
T3(PACKET3_FENCE_WAIT_MULTI, 4 * 1));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_2-&gt;emit(cmd_base_2, FENCE=
_WAIT_MULTI_ENGINE(1) | FENCE_WAIT_MULTI_PREEMPTABLE(1) |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; FENCE_WAIT_MULTI_CACHE_POLICY(3) | FENCE_WAIT_MULTI_POLL_INTERVAL(4=
));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_2-&gt;emit(cmd_base_2, ring_=
context_2-&gt;bo_mc2);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_2-&gt;emit(cmd_base_2, ring_=
context_2-&gt;bo_mc2 &gt;&gt; 32);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_2-&gt;emit(cmd_base_2, 10); =
// random incorrect fence value<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_2-&gt;emit(cmd_base_2, 0);<b=
r>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_2-&gt;emit(cmd_base_2, PACKE=
T3(PACKET3_WRITE_DATA, 3));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_2-&gt;emit(cmd_base_2, WRITE=
_DATA_DST_SEL(5) | WR_CONFIRM |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; WRITE_DATA_CACHE_POLICY(3));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_2-&gt;emit(cmd_base_2, 0xfff=
ffffc &amp; ring_context_2-&gt;bo_mc);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_2-&gt;emit(cmd_base_2, (0xff=
ffffff00000000 &amp; ring_context_2-&gt;bo_mc) &gt;&gt; 32);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd_base_2-&gt;emit(cmd_base_2, 0xdea=
d0000);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_2-&gt;pm4_dw =3D cmd_bas=
e_2-&gt;cdw;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_user_queue_submit(device_handl=
e, ring_context_2, ip_block-&gt;type,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_2-&gt;bo_mc3, true);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* if fwm packet got skipped by firmw=
are then 0xdead000 will be written */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usleep(1000 * 2);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq_u32(*ring_context_1-&gt=
;bo_cpu, 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq_u32(*ring_context_2-&gt=
;bo_cpu, 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* set the correct fence value to fin=
ish executing the ib */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *ring_context_1-&gt;bo2_cpu =3D 10;<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *ring_context_2-&gt;bo2_cpu =3D 10;<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usleep(1000 * 2);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq_u32(*ring_context_1-&gt=
;bo_cpu, 0xdead0000);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq_u32(*ring_context_2-&gt=
;bo_cpu, 0xdead0000);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_user_queue_destroy(device_hand=
le, ring_context_1, ip_block-&gt;type);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_user_queue_destroy(device_hand=
le, ring_context_2,<br>
+ ip_block-&gt;type);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unmap_and_free(ring_context=
_1-&gt;bo, ring_context_1-&gt;va_handle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_1-&gt;bo_mc, ring_contex=
t_1-&gt;write_length);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unmap_and_free(ring_context=
_1-&gt;bo2, ring_context_1-&gt;va_handle2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_1-&gt;bo_mc2, 4096);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unmap_and_free(ring_context=
_1-&gt;bo3, ring_context_1-&gt;va_handle3,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_1-&gt;bo_mc3, 8192);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unmap_and_free(ring_context=
_2-&gt;bo, ring_context_2-&gt;va_handle,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_2-&gt;bo_mc, ring_contex=
t_2-&gt;write_length);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unmap_and_free(ring_context=
_2-&gt;bo2, ring_context_2-&gt;va_handle2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_2-&gt;bo_mc2, 4096);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unmap_and_free(ring_context=
_2-&gt;bo3, ring_context_2-&gt;va_handle3,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring_context_2-&gt;bo_mc3, 8192);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free_cmd_base(cmd_base_1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free_cmd_base(cmd_base_2);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(ring_context_1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(ring_context_2);<br>
+}<br>
+<br>
&nbsp;igt_main<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_handle device;<br>
@@ -815,6 +985,14 @@ igt_main<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_sync=
_dependency_test(device, true);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Check-FWM-preempt-=
using-GFX-UMQ&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;fwm-pr=
empt-test-with-IP-GFX-UMQ&quot;) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (userq_arr_cap[AMD_IP_GFX]) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_dynamic_f(&q=
uot;fwm-preempt-test-with-gfx-umq&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fwm_preem=
pt_test(device);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;#endif<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture {<br>
--<br>
2.43.0<br>
</div>
</div>
</body>
</html>

--_000_PH7PR12MB6633A045C7FBB631195E3330FF9CAPH7PR12MB6633namp_--
