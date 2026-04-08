Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D63CFD5F91
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 07:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3DA10E548;
	Wed,  8 Apr 2026 07:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="cYQgvuLu";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="nMvvYsBt";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3950210E548
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 07:28:59 +0000 (UTC)
X-UUID: 933d2ca2331c11f19a16598d5ca7f8ec-20260408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=s2/YdY2fyJ5sInXAbdEKuUSvDVdCBU48Kdzw7b6L4Y0=; 
 b=cYQgvuLuc/N4g/z4z4q3grFs1j/NxIW6Mjhx7TGTRu5qgCG0bslufOAWz/vf23pRnrgddSkkdIKcIED0F420XbQgXUHg5qVgBrh+fbjiTi/qm8HUXPr14i3fHkygEgtTj0Okp8W2hsmczIMvye2uNrNwIR0fEhxH7ThSYFbzbyE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:7b1a8dfe-03d7-40ef-80a0-177fca2edca7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:e70b9e24-cb5c-4236-a89a-9a7fb20c9bc4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 933d2ca2331c11f19a16598d5ca7f8ec-20260408
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2008149456; Wed, 08 Apr 2026 15:28:44 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 8 Apr 2026 15:28:43 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 8 Apr 2026 15:28:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSX1L+5w4FHe+YL6FZfOyoO6qK0ObUsMEaWnfVIebnZsyrz9l2fGjbJY9vXCQRvumtBs3BaLp51AeshimAnhJlMOr9SgonRp89mat4PZFyjGZijgJnjbNrMklExumed6KfibsZr7BUPQ1/ts5cVHzjiYbPVw+zeYK8LVKSDsHT+QdFy6gGh//sc4aRHNP1p90TYwA7scQzZUtbKrREksulHFwwhcOwDZbHwdU2lPlGItlHI4JMRPaGVf0Xgi7L5ARui3iQIO9OqfXJfF7JEKSUWtBtnebZp8Yopfg7eIN9XKStMjsoLvxkcGi4Fa5RI4df3PdGLy1r3AStGnR7NPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2/YdY2fyJ5sInXAbdEKuUSvDVdCBU48Kdzw7b6L4Y0=;
 b=dhxxEQwVuSZAmbLOmlAKzJV4HHR0yrMDk9v9fWfXQghG4RlzwvPCk0sVCYuReCWP9mAzM1lMKsQxINedbdbi5RM/YyGhH5meDOt44zYMknpfnt6Z1NhCCzxKcvJJi3GrnoSaT5C8+C+Xaz7Zt3AWZNdUYqksX3BOBtIJQaPh+PqY4YxTe5kjBRx9H/8rMRDT4roeTg9qH9IRLrVc9DHrU1ZInU1RKKbn9EtXT21mfSePPVcnd42v1PkvwZge9AHSJwpeJtGwqbuuVAXBJWY01aVMk6rmfq18hiXji+fcA+XY3VSNlphFvBsBgeuG4usm8f6W2NG8PSDJ0bsMlHXQOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2/YdY2fyJ5sInXAbdEKuUSvDVdCBU48Kdzw7b6L4Y0=;
 b=nMvvYsBtcB2KJgjESFP5bXezYjPbJJKEKQatyQsXcLaOsLvulBsr3YEbZabYi7jJ1lq9n/fXGEO9UlxLlARBrSprDm+jqn85fbdRw7iZpKr2sNUO5owW6KunzopiVy8zFKI5aVaXQUrxxL5BUGgeeKp3030DfnzilhZzJtXcRvg=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SI4PR03MB9891.apcprd03.prod.outlook.com (2603:1096:4:29c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 07:28:41 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 07:28:41 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>
CC: "kunal1.joshi@intel.com" <kunal1.joshi@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_bw: Allow custom modes for external panels
Thread-Topic: [PATCH i-g-t] tests/kms_bw: Allow custom modes for external
 panels
Thread-Index: AQHcxnTiz36AwNCc0EetEn/TTQeS17XUxboA
Date: Wed, 8 Apr 2026 07:28:41 +0000
Message-ID: <cb3848cf3d23882d16a6eb8976f6e21719a046a0.camel@mediatek.com>
References: <20260407095234.1728691-1-karthik.b.s@intel.com>
In-Reply-To: <20260407095234.1728691-1-karthik.b.s@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SI4PR03MB9891:EE_
x-ms-office365-filtering-correlation-id: 5e4a23ed-bb96-44a0-88f6-08de95407574
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info: gQNjgIQotl+rMfG2Nq060/MzUChbNNhiBGI8ZnJAWxEq352bXU6tGAEDXXnPf1dQtfCoE8uECfVZCm34kC5QbPQ3y7Vj4OvQgBIgdX5MVVeJ4XRWx3c/Hpg6JV432NdxlFW961qITAz0vD7RejC75q7Esgbu9gUmijZXlfQDNX4OBZ5WtGR8KRTh3+tq7/JlOGtT2Q0rdEZVzf1wu4t+F6FawsdKoDtPZdoW1uraqDMWf1gOzXKKYLWRjsYvm4q35yAMlxqlCXOvCY+4ubpUWaQjSa6H9YCDU8AIVQ+o6F9idBIJilEZUYhmbsrlQWKHTUBJzZ8oXW0lfw7ENq0VStdiubWuLxYxmDoAOPD54wln0kxaqXAcfOKmw9ZdQuFZW0LyiW7KEhTmVRtOS7tP/BVAglaojyXXi3PDmMoNNxONwtgfIq2nPxqZccQg1LrJYzJ7/KinuS/XPNtmuSRMSCQ5rYtCiLPONnphfvY9XgezGokGx5CZXOHIXAJD+dFUbGKegmTQfHTzI9yVN3wxetxWywOWX6kbstDVZCOrSTGW7eaaRTeCLemu+/y+Bi5SjllgxVo9rHXHR2pc4Z0MdncHRcZa/lhEcmyAjMmCV3yv8oylowELlbn7IU6LjtwOcZphCNTSl9IS4UyFzcUk50MjBuPOhf0jK+eM1oUWIRmCxBfVm1YEHY5/X9IMTk9KM2bfaPUublzeye9qwLr92uYHpIDNmHBTFb5rjehqCeLF56cWzLedZ0F/D+RSPOW+NUqpp9/x0ryx6v4Oycd7j2J4jkIgK8Ec0EOnw0inA7Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(38070700021)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0JRNTdjUDBuUEs2dGEvZCs3N3R1TUpub3dXNEhyUEduVjZ3aVVKclQwQWJk?=
 =?utf-8?B?TDhUVEJTTGxhQ2Irb2hlT0ZMYlF2dldhMFRlcnhZYk5NQ2hReGxabFJsKy81?=
 =?utf-8?B?YUtoVDA4UWJRYXJwdmtwSzk4cldrZXZadFBSSkR1NjZvdEZ0UC9xL1NHZSta?=
 =?utf-8?B?MTRwU3EwSjhCaWs5YjhrVDdVYU44b0g5dWx6WEZoQnV4eEtOSkVpaC9XYnlh?=
 =?utf-8?B?UzhrdlJaM1YxZGh6SG5BTVM1MWJabkhHcWRCMnRtRWNDdnVwaXYxZDBwL2dw?=
 =?utf-8?B?Y3hKNHRRQitzR1AvNTYxNGM0bzVHV2NEa1Y2bnorc3IvT1J4WUFlVkQvRFhJ?=
 =?utf-8?B?czdyc2tQWXM1UkUyUERzZ2RRMnBxODB3bWsyamxWL3o0OFdwSU9ISmFNVVdn?=
 =?utf-8?B?a0Q0OHpMTk5LSjFuL3UramxjdXp2a3NHV3pxSGZjVElkM0RGZEdoVDdKdnFt?=
 =?utf-8?B?akU0OWdxM3l2bmhwbTlQVitvWGN1dUJrT1I5bzQyMnVGTVlLMFg2d2JOUGx6?=
 =?utf-8?B?Uk05TDhoZWtVTXdXeUQ4cG91RnZBOTNySFI2bmwrTyszcHJQTkU3TmppU1Zo?=
 =?utf-8?B?a0xIY1R5QWZUYXBjNXRYN3owNmZRdWwvazQ3N0dUY242c1p4c3FaTHJGbWtj?=
 =?utf-8?B?cGE3Q3R6Qkd1dnJObVp3ZndmVTc5N0lnZjFoUDluUW9xYzMreXlITnNFMzlG?=
 =?utf-8?B?Z3BneFpOcDQwUmhzc2EwVXZnbVNXWkUzdzJHR1pLL2FJRTRRWngwbjdXTlNS?=
 =?utf-8?B?YnY5OWNnczBkRU4xMHk5L0piV2hqWWsrVUh6WEZIOUhuL2lmYSsyVmV1TTF0?=
 =?utf-8?B?UzMxUFIvNlpzSzAwUU9PcUpBWkpxUnBCaG5QWVBiSGUyaEdtbVRJL1E2cW83?=
 =?utf-8?B?cTBUeTIxd3gwanNXQUxzS3FFdDBubTEzUllwR3hGZUJDTEkrMjgzd2dTb0Ni?=
 =?utf-8?B?OG5PQUE1S3JuaVVFelcwWmlzUmpSZG1QZWh1NDRUY3ZvcVhMTy9sK2Z1VXlj?=
 =?utf-8?B?UWxjL2xzNUJvZnlEVm02c1pOQk9qNjRMVStrZXBveFFUc0RjZTRCa283ck5V?=
 =?utf-8?B?YVR1c3djUHZIWXhCcnc3ZExyd1ovRDdFL0QvWU55eVduN1dkN3VJS3pkVHA5?=
 =?utf-8?B?NHJzZnErRk9BZG1FT3VJelBFRkhLeUExMjdFRThFTFlNaER2dmhQSmFITndP?=
 =?utf-8?B?Y2V1bGE4b0JFVnZNSHRTaVpBZ1EzOWpxRTFhZGpVb2R4THUxb2g3aWpjS3k3?=
 =?utf-8?B?MCtiZ3dSb2h5MDZOaFhKb2tOOEwvREV0MFhqa2dZWldVYjVzcjVmRktlRkF4?=
 =?utf-8?B?TThrMWM3OWQwOGd6OVpXMXp2MGlqZlZtUkJNRHhERzZhVmEwMFdKSDZuMUs5?=
 =?utf-8?B?YlVZT3UzbVR5Q2JIckp6Y0hCOHJpay9SUHpIRG1yUVlZcVRjc3VDTjlrV1hv?=
 =?utf-8?B?dFR4VnBjdEU2SDd3UHFQTTVGRGVCMGwrMUVOZmVuT0tCQmlhaUNYbmRGODFZ?=
 =?utf-8?B?K09QcUlaNk5yYUFXQWRIWDR5L3oyWjNXek5naFpCR3VXY054dkFEdDlrY2pr?=
 =?utf-8?B?TkUzYTY1OUdvNEpPQWNXY29xYlUxaGg4dW1BNStFb1lleHpKdjYveHJQZVlq?=
 =?utf-8?B?QnkzTEFVUldKakk3QXNFSzRBazJoUkhFTXI0SExZdEVyaW8rRUxjS0pxZzRw?=
 =?utf-8?B?NzZNbXNRd1I0OTFlOWJ6MlIwV3daV2NqN0R4MWg1UkcwNkkrMGIxQTNJenNB?=
 =?utf-8?B?RzM4ZU54STY1ZzZlekpTYVpGUkk3Y1VrRFMwdzZjRlY5dVcxNVZFWWhaQ2Rj?=
 =?utf-8?B?aUtjVVBIZFpVWi94bHpvamtwNE1zWG1pMXFNWWZKczluNEtodnNBbHhZeFIz?=
 =?utf-8?B?SjRzYVd0cjkzZ0VXRnhRVEdZUlRXVDUweEhqa1hKZzJmK0xjZ2RVMG94eUpU?=
 =?utf-8?B?cjBoT3FTN3hCMnZNYXp3c0ZvMWFIUms0VHM3WHZnUEJFNTJvOFdmSzBxSkNv?=
 =?utf-8?B?SzJoVGxCank3SUwyNEw0YmRzNU1Tc0EwMDk1RkFyMm9scFl1MStBZVV1bjFS?=
 =?utf-8?B?QWxiaFJvZ1lreHkrcGQyMkpDMFFQK1UzMVU0S1FTdXozKzlzMHM4TE45Snlq?=
 =?utf-8?B?cHNoZXlTbjJ0UHRxaGo4N2JQYlVDTlh2b3dDZzZadkxJZ0RDU2JpTks3VW9r?=
 =?utf-8?B?QklPbksra2xVRzREOGdwaUpNalY5dFRDcHpuMnBDcFdma0I4S3c5T0hLd1lE?=
 =?utf-8?B?Nm1FejRwUzNBK1ZYNC9qTHVkV2RzOHJFYXpMbm1xSEtVUitBSGE5and5SzNy?=
 =?utf-8?B?TzNmdHMzYlFrZHo0N1N1QjNHcWJiT0FhMGhzKzNXUWxuOTMvVXdKcDFmMVRJ?=
 =?utf-8?Q?TiklIxsRbgBoTTnw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E66F0F60C214FC4BB1B92022AE4B4E1C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Y9Q74rKTB4QobzAR4nPNbkDFZIkyI7xXBC0l8CK2dfMDQyUQ7rWk04Wwuv5q31DC0jl5Ixk4EUxGh4ESVjqw9wV0uh+quMl7SS/ziqlolx2QTXLSha2m0+AHvjqMKOOY+7hFsd6PnBfR+B0kbEsmXuctSIZmopDyfnbCl2gduzZRNJ5bV+NbMb51UaSUxrJrn3gMsK/graooR178yMyHTW+7xCaeX71dmbX2LD7h2KqBHKfO4n2ykZ7+7p2Ith2xIsOw6T/CkOnzkSJe1uYx+loc2YsNBnb3rnwrVgjwiuhwXG1rvDg5/8ThaPTfWkDuwsVx7nmI6ECGbzlzaCzx6w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4a23ed-bb96-44a0-88f6-08de95407574
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 07:28:41.3648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p7aseQM/hP4H4CXdt6ByNSf3CoqdqGH4Z1bJDrQaOJmsQufBKw+meINHwuX5IY1ZXCUQ3MmEFWoGemxE8Gc7NTl5a7zJEyco71S/efqXAmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR03MB9891
X-MTK: N
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

T24gVHVlLCAyMDI2LTA0LTA3IGF0IDE1OjIyICswNTMwLCBLYXJ0aGlrIEIgUyB3cm90ZToNCj4g
Q3VycmVudGx5IHRoZSB0ZXN0IGlzIHJlamVjdGluZyBhbGwgdGhlIG91dHB1dHMgd2hlcmUgdGhl
IG1vZGUgaXMgbm90DQo+IG1hdGNoaW5nLiBUaGlzIGlzIGxlYWRpbmcgdG8gZXhjZXNzaXZlIHNr
aXBzIG9uIGNvbmZpZ3Mgd2hlcmVyIHRoZQ0KPiB0ZXN0cw0KPiB3ZXJlIHBhc3NpbmcgcHJldmlv
dWx5Lg0KPiANCj4gSW5zdGVhZCBvZiB0aGlzLCB1c2UgZGVmYXVsdCBtb2RlIGZvciBmaXhlZCBt
b2RlIHBhbmVscyBpZiB0aGUNCj4gcmVxdWlyZWQNCj4gY3VzdG9tIG1vZGUgaXMgbm90IGZvdW5k
LiBBbmQgdXNlIGN1c3RvbSBtb2RlIGZvciBleHRlcm5hbCBwYW5lbHMgYXMNCj4gdGhlc2UgYXJl
IGFsbG93ZWQgYW5kIGhhdmUgYWxzbyBiZWVuIHBhc3NpbmcgcHJldmlvdXNseS4NCj4gDQoNClRl
c3RlZC1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KDQpUaGFu
a3MgZm9yIHRoZSBpbmZvcm1hdGlvbiENCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo+IENj
OiBKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+IENjOiBLdW5hbCBK
b3NoaSA8a3VuYWwxLmpvc2hpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogS2FydGhpayBC
IFMgPGthcnRoaWsuYi5zQGludGVsLmNvbT4NCg==
