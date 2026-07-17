Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009CAC44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 08:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FED10F49C;
	Fri, 17 Jul 2026 08:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="oS39kQYT";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Yc0dQWtu";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796AE10F49C
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:14:14 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H6q4V82920403
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:14:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=6ik7Q+4sLRS9/BZr9Nw3xRri/mz2jO+Z+ZeNl/KTMx8=; b=oS3
 9kQYTNoCc8Kr6N1prqAiasVWRFD7Shdzf46buz6fQKnQpcUS3DxJz+o5fLwmVW+X
 S+wuRF9D3dQQJwR6DWo+VHOwDNf65GPJrH+2LuT0vuJVsNUTwUG9SvoDQ4Ztvdgk
 I2WJ1dMZlEoCrHYh86jL5FNUqKchAKHht67lE7ZQ/BFmivLV27wYThOlE1aRsUJ/
 ge+SloWGEiBj9KUPGVuzgCXGkN8brwhrBWgUqVB4ZZ1OJM2YBUZ2niXopUaLVuz6
 gbo9Aa8hBpNiWwurBC4gHBvUukcCYIo2Kx9M8dLnmyrTiWTGbSKIaEAWOViHPkgV
 8gQaq7ZR+dQviB3kAMA==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021098.outbound.protection.outlook.com [52.101.100.98])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4fbcp7cxjq-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:14:12 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+L7w/VrqHfeLsTr1Gz9uhBMz4eE1ho7ytIaGIoNpYppn9r6Arnuf0Oq8Y8eBQp4ziXzERJXMWWqy41G9gCqeEW+AEcxEKCOD6/q15id+6rzvprDuZU7RPr3cAxE3bMhmNvrdwABlNgEHXsDuqd3X3gXQbLTAASpiKQXJ+tLOq7ljBZ0/HpMF5GfmWUCXvbsjKUfPGjzddnqbSkO/n2zFk3Py0g4LAo/6s1IBD75CRihMFFGD+GcwOrbykXUQIL/FjD3UIE4HBRxyoh76YEKXyKIABT2E5nf9ChvBQ75XmH3u3C6Ey5Y/Nxhq9M9WqAfg5xWDo3uUbZD+z/h6apvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ik7Q+4sLRS9/BZr9Nw3xRri/mz2jO+Z+ZeNl/KTMx8=;
 b=H/ktPMbSjGU2VFUyO/3g8iitFqgnd6EbTqB7LGkHhtglEE1gfFn2fnY3iQje/lLMw6EmasmWgXTb7qMQ8DT+F6lNFOcglWDom8uVy//Xn/PKWRlpSI1z0nsAxr/pMLlWOwGO0V50NEyg4Dd9m+Yz9aIKk7UZgLkPa05QIKyoClKz0ck1XS4Owe9nHLiFKqYEXb8g75ps9eu37Qb+vXgA1CPwOPZIWhf+m3q5bfg12AI6sQr6hcxizvAaUqfuLMjKntBiD83jdzIP+V04+e+W474jBsvrICCjTAchS8MqY1IgKgoLijuknw555T0h6fDRj//YkYIcqQESwzrbTbciIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ik7Q+4sLRS9/BZr9Nw3xRri/mz2jO+Z+ZeNl/KTMx8=;
 b=Yc0dQWtuh50h+SEpd6Y48oz0TaXHzzthpP1Y2VzcbXQUsOzSA4+oGx+AcgQj1kafuIh8LD/yxxhSK/A/Q/1oiFFVNgJrJnlxJiay/F9DuHVGUHW5iNhNOwtKUde4Z/PoNH9nSdD1PBe9oOH9QhSXQ8KavpEPsydpFvsg98x2StQ=
Received: from LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:222::6)
 by LO2P265MB4965.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 08:14:10 +0000
Received: from LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cc2d:a46c:188c:17c]) by LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cc2d:a46c:188c:17c%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 08:14:10 +0000
From: Robert Mazur <Robert.Mazur@imgtec.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <Robert.Mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
Subject: [PATCH i-g-t 07/10] tests/imagination: Add VM_CONTEXT tests
Thread-Topic: [PATCH i-g-t 07/10] tests/imagination: Add VM_CONTEXT tests
Thread-Index: AQHdFcQ+c8ZRRpNC4UexjUivuqS1zg==
Date: Fri, 17 Jul 2026 08:14:10 +0000
Message-ID: <dad20862fd724259a245cb8984241a4020260717-test-imagination-add-support-v1-7-2f02f9cc3b53@imgtec.com>
References: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
Accept-Language: en-150, pl-PL, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB4797:EE_|LO2P265MB4965:EE_
x-ms-office365-filtering-correlation-id: 2d9f43c6-46dc-446b-74e5-08dee3db613b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: C7FccjY5+ERYd3/hV1j11XF32Kb1akBKRdTtjlOfsdpCrVRytGEFQ0PtYGzaS8F3oCggyDAmqnpU474Wd1tfM5A5/di+FU2eJxjgK2ZSp1jmG16xX7e+1/hWQBc3u3AygV9jS38qPDrSTx4oHOxs4kMAh2+F9uy4WY3KGlhqdvdv2bZFIEJ+g2XduyvUG9EK1wG1Gfcxv9wVoG/aE8dCYGd9bjOecf3/EjbMvc8kcbjCg0BtizjaSYbK3P2ohwdLxZbp6i/m2LD5hkn51WEvr6Kb9JrE0/pgDxY5LVUNCv7RAxfJnflU2XgpOScXdphzERYvX0/FP0fzoafIc0MlxJQOceJCmAazxBjhc4Wdw+oWjhLZQkoZUqo2Zmrl9ULfUfe6q1oDVlJetUwYUODeiDKIedpj4T59gpOVvcEnswUmwPuKaxPmaz9l6RlmXG2yPgCQia7yQ8WB4rt0a4Y7Hcp54KBKLxqNeoDgu0c8I5XQGeBDSoLwIejOdERB68RlD0hJ3OpICOnJmpCtUXqjYAt4CB3kJch6LAf3hrmK6VuqMm7/FGFjiAAooAzZERJ1e/OpWGiNScpv0u0KTMtZuagCHM6dmhBEwLkG0DEr5g/ZL+zA4mObswTBWT/CY092jmv+//fYlivjO0rTmxRWDBjARiR/r+fWGeiBoS0+xBpvfZxpB+1w7jfxeP1L3XMN0OCHeaGAD6HWSHVn2ouq9QboTIc34laVn5fs1NWeIP0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KQYArnoOzlHhkAZPqBCBGNQqkmYtYnMCEVe4WMrP8mTZsG/IwLzKhIKUixuK?=
 =?us-ascii?Q?xvsQRcLOOzJ6TWaZ5tURas+6v52S5PZSk8nymtGp5AF6pWsyjWbk3AMAG1oT?=
 =?us-ascii?Q?h89t1HfErt0Qc9MTH53Iu34VXljlF9sjqvH0fhSoWVnN3TARU3/AIsLnoieE?=
 =?us-ascii?Q?IogrIDNgsj61xHZAMZzxqLuUoy53OqwY1Tvjqyk++HxFNjducZQUEB/o6koU?=
 =?us-ascii?Q?hc/NaNQqPY9cXgfnxc46srSSHbZ3wkgje0O8/rCFaMcqpHOrSpDZBazz14Dn?=
 =?us-ascii?Q?YYMFf1KZFZk07dhmdwV1cTnd6FA3AnVOkz2MIF3fkKG6fGELBw+fV8eaPpMi?=
 =?us-ascii?Q?EJgvAtqyHzKM+me3Xy0/ORlhmQs3H/u9kc8mSUoJFNHnXlY2Mf/2Zty/+uFs?=
 =?us-ascii?Q?gBuBYZaEVowb/7Anyar441hvTV3sGBPxwlG0ecXR9Ki9+b7STZz4Dy5T5/Y5?=
 =?us-ascii?Q?sIYzxy+sOAld5fj4bqWZjB6uKMu8JoF8fLPG+TkpsnnJiCljg76WoN2X67uH?=
 =?us-ascii?Q?gqMbOHqgghYsq+2/zV+xrOTcg+Ag5cbyhe+6u0rKIuvrvNIqxYmkUlc4tb7Z?=
 =?us-ascii?Q?C4ezDJ0dTg86Bp+53BA1FBngDQb9WHRbldgbyTEsH2fZ1euO1j8QqRjlUvgc?=
 =?us-ascii?Q?sBuUs4H9/HzuyYAwNPkOlj6cpg9CJVdqOfbnl675Efkpio/i6gsBRNneAvpa?=
 =?us-ascii?Q?ZRNyJyNTkrliSjDltMWQ6n3eOI+3MeaJ7tb1PhNh/ksVvDrzToadDD6RzvKz?=
 =?us-ascii?Q?vo6YilKkVenH1V3Qp3k3JasNKF53f7ZnGlxC4YbAqSMVSlNS8KjF3FrlMQN5?=
 =?us-ascii?Q?aHYsPcgqh45qGZqQ38i6wouNnGaI+thpkGOMdpLxSZP91hDyx9igk4zzFwgJ?=
 =?us-ascii?Q?9TSBc7a1AesuXf8iU6X0FiX1eY+u0J/KRdlDDIJJnF0ENj7xlKStZ9arCBs7?=
 =?us-ascii?Q?l7JwUYd8524xo4tiVMWwHThnaJpRLTlzScRVFLaqKks9ZNnkxZyCFaBELIBx?=
 =?us-ascii?Q?CHskQYCLL4DZ2sbg+LVjWNGQNBCPrNoZ21/XLZYCwEuyojms7hAf/e8BbxWE?=
 =?us-ascii?Q?yTBCwLk4lHVoxsIwFORW5X+6/MK78M6SreucQ0vLEhrKvJ8SkvDrLvCB+6wD?=
 =?us-ascii?Q?9FFR3N1JD1qthBQ5K/WFdhyKlsEvQ5gMnn/AFTIESq9GhQFiNGy26jLDxYyq?=
 =?us-ascii?Q?1/F9IR100/2VnsqGW3X2xFEfaXSVboVqadQDREgrti5hDJDRKGQwaVcUYHdI?=
 =?us-ascii?Q?NNNbwPevjZabJtkiy2x+yRq/m22GJMNccLRK3dkzv4uf3thom1n/uML1YoUN?=
 =?us-ascii?Q?57vp2/KJXbe/0QshwFdyVzRW5kG5qczQQLuUe5lrwzfncsa9GSrSRcT4oeyM?=
 =?us-ascii?Q?PjesScpPQAD2GjXMPu/a+TOUb5IhvNpZLeR73XUFGRYJdooWMt4RjjF44EkU?=
 =?us-ascii?Q?HyU8XonDcJXp+IckT+RCr3cZcGmZ/7NUvsWDJLbmPdyu0EE7VRMudDrBQC/Z?=
 =?us-ascii?Q?mr1VL4fTmob6Qk9GTNpfZpbx1K4oJYeR0BaJzsII0ijHXerfRKRRzWiCPDci?=
 =?us-ascii?Q?nQU5ZgGBZYbm/lHMn1Kpju/hpaKuHxKcYIePeqNws3ds5Dx2T0ZokX2An1JX?=
 =?us-ascii?Q?1V32dyE9eMWcjgEpegcILHl2ptQbSexhD6hohejLLFZhoAkqUm2JjpfRvsBP?=
 =?us-ascii?Q?CKNYRylGN0bWKDaqp+JG4+wMUWrq70Mix0fulaoeCAeGFBcp7HdI7MWyKCpV?=
 =?us-ascii?Q?yg1LdfO5VA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <49132F4F9186A743B7A20AFD24C7DF9F@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: krE/aq20WkC/h4A5dwit0nxRuNVQe/vimYICrdzoX3AO0JbQ89oh61G0aTxVrWRe063GtnM2+MtTfF2ST7q8K1N4L2oZfcY1AxfVUT+i+Ln5D+Pdb5Zxg8UKsZLXzhFq2zCZaTYv3AkLedPagU76fCaUmaKAUCVlTIVywxdrTpReHveGDbpCWwHrbEQcs5o5rm30f+QdbmiWzOmayXCX1hClbuq/saXe6SwHWay/YnCMfXaHjeqTg861sT2hnm5rz1d3GsdZA4tjseL43/jpBfigrCzrZ2AKDuVspaO1q8oOT/Jk8/3FjLoc81NhNaI0ZV0mjxudNcTfz2YFqOnVww==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9f43c6-46dc-446b-74e5-08dee3db613b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 08:14:10.1498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RiECpJq9dH+jITApdv7YQcs34evNRGF+95XfpeMwNQCrkVqAuyNJyDRdGTJST7s+VvCYSZ74ORJsoFwqQshGQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4965
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4MCBTYWx0ZWRfX3AJvz8jkkWRD
 xG2tMwdtV5zgMbr8N6uMxbGRY8Ocuqg1A/BzsGJdO1S2MsF+ajE0Urxyq/NMvJyRke4nWNnQPzr
 BvGFXKjlvWrcXUYwWaa2oVE6iAS+/SU=
X-Proofpoint-GUID: h_wbRxBEHdSKhqb9NfgkkBThd2C5B4RC
X-Proofpoint-ORIG-GUID: h_wbRxBEHdSKhqb9NfgkkBThd2C5B4RC
X-Authority-Analysis: v=2.4 cv=AYOB2XXG c=1 sm=1 tr=0 ts=6a59e454 cx=c_pps
 a=cnoDGqUUs/V690RzEPeUkw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22 a=r_1tXGB3AAAA:8
 a=XjKxqXRqJ_dD72vPlP4A:9 a=CjuIK1q_8ugA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4MCBTYWx0ZWRfXwbmknHDK84xT
 gi7eGX+WPsNNSattfF/1wept3kuyCV2f1DVKjSA+cUzTg5Ho5FjOvtZhSGmT53skfcO/kxSxbQr
 iERJDlqKLqhCbxm/r4sXTjzfIHgvxZErJreByfJtKkSqMRvLgSrsYfSRdCw9gRLsCvKPBLnPd3y
 MEUGhOHFmGpSymHe9+t7qyWWWqXq74D+jeXmcRZmAEC7pIpkq/5wSKWTNNr3ziW4j4oSL1qIVnE
 wzenX2Q8rUoGGxgMNaEwOruY407A1QkmmVgQXjmmd5fRzkKZ8iBowESZEyF6haJBFBCuwp3IVjH
 G3SbP8EVAGjRWt+p4Qetymd2qtnPqmKtoQSQwEnPPces5PsJaw871HQVOzF5JlFMy6LUov1/hxA
 V6AchqiW1R+bXjIFM2v08jm29FuCfpWTQiCBUt0de7ck//vjQ/xd6X48bi4YVSrQwYJAFaVRHGz
 7Pu8um4gaaU1vu4Hwuw==
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

From: Donald Robson <donald.robson@imgtec.com>=0A=
=0A=
Add subtests for VM context create and destroy ioctls,=0A=
including invalid padding and bad handle error paths.=0A=
=0A=
Signed-off-by: Donald Robson <donald.robson@imgtec.com>=0A=
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>=0A=
---=0A=
 lib/igt_pvr.c                      | 26 +++++++++++++=0A=
 lib/igt_pvr.h                      |  3 ++=0A=
 tests/imagination/meson.build      |  1 +=0A=
 tests/imagination/pvr_vm_context.c | 79 ++++++++++++++++++++++++++++++++++=
++++=0A=
 4 files changed, 109 insertions(+)=0A=
=0A=
diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c=0A=
index 437362dbc..a631c4ff2 100644=0A=
--- a/lib/igt_pvr.c=0A=
+++ b/lib/igt_pvr.c=0A=
@@ -113,3 +113,29 @@ igt_pvr_get_static_data_areas(int fd, uint32_t *array_=
len_out)=0A=
 =0A=
 	return sdas;=0A=
 }=0A=
+=0A=
+uint32_t igt_pvr_ioctl_create_vm_context(int fd, int expect_err)=0A=
+{=0A=
+	struct drm_pvr_ioctl_create_vm_context_args args =3D {0};=0A=
+=0A=
+	if (expect_err)=0A=
+		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_VM_CONTEXT, &args,=0A=
+			     expect_err);=0A=
+	else=0A=
+		do_ioctl(fd, DRM_IOCTL_PVR_CREATE_VM_CONTEXT, &args);=0A=
+=0A=
+	return args.handle;=0A=
+}=0A=
+=0A=
+void igt_pvr_ioctl_destroy_vm_context(int fd, uint32_t handle, int expect_=
err)=0A=
+{=0A=
+	struct drm_pvr_ioctl_destroy_vm_context_args args =3D {=0A=
+		.handle =3D handle,=0A=
+	};=0A=
+=0A=
+	if (expect_err)=0A=
+		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args,=0A=
+			     expect_err);=0A=
+	else=0A=
+		do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args);=0A=
+}=0A=
diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h=0A=
index e7fbdc82f..3486a52d4 100644=0A=
--- a/lib/igt_pvr.h=0A=
+++ b/lib/igt_pvr.h=0A=
@@ -22,4 +22,7 @@ igt_pvr_get_heap_info(int fd, uint32_t *array_len_out);=
=0A=
 struct drm_pvr_static_data_area *=0A=
 igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out);=0A=
 =0A=
+uint32_t igt_pvr_ioctl_create_vm_context(int fd, int expect_err);=0A=
+void igt_pvr_ioctl_destroy_vm_context(int fd, uint32_t handle, int expect_=
err);=0A=
+=0A=
 #endif /* IGT_PVR_H */=0A=
diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build=
=0A=
index fc24d0220..ffacce1fb 100644=0A=
--- a/tests/imagination/meson.build=0A=
+++ b/tests/imagination/meson.build=0A=
@@ -2,6 +2,7 @@ pvr_progs =3D [ 'pvr_dev_query',=0A=
 	      'pvr_gem',=0A=
 	      'pvr_gpu_info',=0A=
 	      'pvr_heap_info',=0A=
+	      'pvr_vm_context',=0A=
 	    ]=0A=
 =0A=
 pvr_deps =3D test_deps=0A=
diff --git a/tests/imagination/pvr_vm_context.c b/tests/imagination/pvr_vm_=
context.c=0A=
new file mode 100644=0A=
index 000000000..d1f75e873=0A=
--- /dev/null=0A=
+++ b/tests/imagination/pvr_vm_context.c=0A=
@@ -0,0 +1,79 @@=0A=
+// SPDX-License-Identifier: GPL-2.0 or MIT=0A=
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */=
=0A=
+=0A=
+#include "igt.h"=0A=
+#include "igt_pvr.h"=0A=
+=0A=
+#include "pvr_drm.h"=0A=
+=0A=
+#include <linux/errno.h>=0A=
+=0A=
+#include <stddef.h>=0A=
+#include <stdint.h>=0A=
+#include <unistd.h>=0A=
+=0A=
+int igt_main()=0A=
+{=0A=
+	int fd;=0A=
+=0A=
+	igt_fixture()=0A=
+	{=0A=
+		fd =3D drm_open_driver(DRIVER_POWERVR);=0A=
+	}=0A=
+=0A=
+	igt_describe("Test valid VM context creation and destruction");=0A=
+	igt_subtest("create-and-destroy-vm-ctx")=0A=
+	{=0A=
+		const uint32_t handle =3D igt_pvr_ioctl_create_vm_context(fd, 0);=0A=
+=0A=
+		igt_pvr_ioctl_destroy_vm_context(fd, handle, 0);=0A=
+	}=0A=
+=0A=
+	igt_describe("Test VM context creation with bad padding");=0A=
+	igt_subtest("create-vm-ctx-bad-padding")=0A=
+	{=0A=
+		struct drm_pvr_ioctl_create_vm_context_args args =3D {=0A=
+			._padding_4 =3D 1,=0A=
+		};=0A=
+=0A=
+		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_VM_CONTEXT, &args, EINVAL);=0A=
+	}=0A=
+=0A=
+	igt_describe("Test VM context destruction with bad padding");=0A=
+	igt_subtest("destroy-vm-ctx-bad-padding")=0A=
+	{=0A=
+		struct drm_pvr_ioctl_destroy_vm_context_args args =3D {=0A=
+			._padding_4 =3D 1,=0A=
+		};=0A=
+=0A=
+		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args, EINVAL);=0A=
+	}=0A=
+=0A=
+	igt_describe("Test VM context destruction with bad handle");=0A=
+	igt_subtest("destroy-vm-ctx-bad-handle")=0A=
+	{=0A=
+		struct drm_pvr_ioctl_destroy_vm_context_args args =3D {=0A=
+			.handle =3D 0xbad6bad6,=0A=
+		};=0A=
+=0A=
+		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args, EINVAL);=0A=
+	}=0A=
+=0A=
+	igt_describe("Test VM context destruction with handle that is not a VM co=
ntext");=0A=
+	igt_subtest("destroy-vm-ctx-handle-is-not-vm-ctx")=0A=
+	{=0A=
+		size_t size =3D 4096;=0A=
+		const uint32_t bo_handle =3D igt_pvr_ioctl_create_bo(fd, &size);=0A=
+		struct drm_pvr_ioctl_destroy_vm_context_args args =3D {=0A=
+			.handle =3D bo_handle,=0A=
+		};=0A=
+=0A=
+		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args, EINVAL);=0A=
+		gem_close(fd, bo_handle);=0A=
+	}=0A=
+=0A=
+	igt_fixture()=0A=
+	{=0A=
+		close(fd);=0A=
+	}=0A=
+}=0A=
=0A=
-- =0A=
2.43.0=0A=
=0A=
