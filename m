Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C3FC61DD3
	for <igt-dev@archiver.kernel.org>; Fri,  4 Sep 2026 06:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC3C10E54C;
	Fri,  4 Sep 2026 06:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="XxODs9jy";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="iJv3ur7b";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F3410E54C
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2026 06:37:55 +0000 (UTC)
X-UUID: 25ec88e4a82b11f18dc8c9802ae25ab1-20260904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=mfaSaEP9LXsRMuPcUpnUA85hnkvjaExQbNgaMJUS1wE=; 
 b=XxODs9jyYtHbeyYuISMA7l/hUblpdYZw3vMT9UdUZ0WbINO50FGL4bJuwG/mgRz3PyISd+Ow5RxY8wM+B9h3y/o/tSxt5P742aJDZyggprR3QIXxLX/vFdBEZc84L4usBr4NuRB3itsXjUh7uK1HvkBN786i4msno3OD0AYhvM4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19, REQID:3913e9c9-3552-4ec3-88fd-a84c8da7be8f, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:7db8b62, CLOUDID:5cd18739-098d-451b-8b31-af7bd5fef508,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
 :-5,Content:0|15|51|99,EDM:-3|-100,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:
 nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
 :0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 25ec88e4a82b11f18dc8c9802ae25ab1-20260904
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <xiandong.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1357102111; Fri, 04 Sep 2026 14:37:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 4 Sep 2026 14:37:48 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 4 Sep 2026 14:37:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JoxY81C1HYhbonk1qlWexqqFRcFGw/8gEiXDIV5TGtsQ5q544DVcUhcW4lsAimQ2fBt57cir++FW8I3qOzTmkQzWLpF6yGwg4Y383PwP3XQ2ZviyAaesXyRr6fdf9S/bUA1gKjTu7YNFk7pm1DNB+ZH0D0lLd7zgxDgQM/Yq99wyMFdw4n+mwMw/J5YGbKS+f1147fQGLTcZQe7Q5C5dPiVSTrRlqQDkjPdu4sg2gydq9XrNi/oLRoBvZ682UtAgSiQ82COOCmj57N+K8Q7nv2YAwLdLIE47f9dtLtfaBdYfLxOwuq4+ZGHrKdO0T5ETIrYo1ftaiRTPe+HdJ8eCBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bucAmvGTCkP1fFwOmtYcLnNbZXSuHg5GtTOcl9ymiE=;
 b=lZyva6B9Q4U9zsH0INm1vZFRV7gK3YzQZR+OvWRxrBs9WOlwiTeQv0cg0CJgem/W9tY/DUDaqTxd0pxvaVMQDPyv3GX4n7jnmCNwOznE1qnP4AR5lAaEEo/Fcw14lREUGz/KcufFQkM1jIf3nQdUZKW4+JduGAbFfq2yVmT1InzyCpEukELdjeUVq7cUbEQ7m/gpVaJn4nUs/ncCYL6CMOmncGl6M7U5rjprZHdXbLUOTq73pvAr+Kc0mZ0C1FW578JkMlGrDwEJ/0+3EG/IVB/8PNkJV1AxJjqAitnau/zDWlVhQRrZ7/WOcv9LSqAFatt2zaLpc4hdBTZtbLpKcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bucAmvGTCkP1fFwOmtYcLnNbZXSuHg5GtTOcl9ymiE=;
 b=iJv3ur7bNSnlEQ7LSjkhMqZliHRcVs8aBYMjOcb84wNYgbSTrRXEuje/Y7hIjjXoWZxXqv8CIG1m5ePRLRq5NA8vKXqCNgpt/rZBpdQg4nVTIOk1rtFuUYb6pucJmsaeW6WDOU9UxO6F/pvC2Vjq7sXBg33irWGM0QtHqI1Fi6M=
Received: from PSAPR03MB5735.apcprd03.prod.outlook.com (2603:1096:301:83::6)
 by SEZPR03MB8359.apcprd03.prod.outlook.com (2603:1096:101:196::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:37:45 +0000
Received: from PSAPR03MB5735.apcprd03.prod.outlook.com
 ([fe80::fbb0:b153:ae19:807f]) by PSAPR03MB5735.apcprd03.prod.outlook.com
 ([fe80::fbb0:b153:ae19:807f%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:37:45 +0000
From: =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH i-g-t v1 0/1] kms_atomic_transition: Skip unsupported
 blocking transitions on MTK
Thread-Topic: [PATCH i-g-t v1 0/1] kms_atomic_transition: Skip unsupported
 blocking transitions on MTK
Thread-Index: AQHdO3dZ9ZPbnPKc1USRRUL6MigAvLa9qa0AgABPLAA=
Date: Fri, 4 Sep 2026 06:37:45 +0000
Message-ID: <09881f2730eee29814902250667e3973a0c73bda.camel@mediatek.com>
References: <20260903073900.7877-1-xiandong.wang@mediatek.com>
 <47868a6f65a4e0d86a347ae409edf92563d4428b.camel@mediatek.com>
In-Reply-To: <47868a6f65a4e0d86a347ae409edf92563d4428b.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5735:EE_|SEZPR03MB8359:EE_
x-ms-office365-filtering-correlation-id: 32bd5417-4254-4d86-1da1-08df0a4f0770
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|38070700021|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: DFmJw3jdTwUF+4SM7zxIp8gW9vu9dA176W3+Bi9YFL6FwjpSl6FZFcHxxH5RiMTctYez64aidifAzjp93bXefe/GvbRNT2MJxyBD83Z8DghOOYYRMWoTOStAB51GXglJy2a0r8pLiAsPHexU91m7SPbWk8XPo2dZNexBrwqaFad2BO3M87Y/9RfDu9JqvSfLFg91UjAOmuqpn2hmOt/7yYRqxI+UpgkIefEyT5S+5Imd+k+JQuMy/xr21QixsLgwBWEwwPqJee1kfB/RapVS343SscswZZ7EEkkiI88hVcuUmE4JiPT8ZxGxfYTf6edu+hrgA+yAp9/iqA/4PaHMO7On0XWqaw22ig8F1GNRRwkwpzJ12yM14V/A6EBvtWsHcaf8jDEAOxyb8Ydjn9sJ6HCKncS9m1QYmp22cykw5n6rIuGFZDWXZQKj0JcHXVchaz2ngfnLXKFp4R6c3Phogk9AaJqyrdzVoZrWAtFHA7VSsVD16/Rk+hCBkwwGe7ZgOvAkp+sqSmDX5XiaYJaoUaHhtey8k3Gq/rmnvv/iMRe1nfPevnSBH5fDxsFvqNsv4goIy2WC8+ei+2AgMpsDCk08kwpnMJGtPbdt15vz9BM+8qFvX8NSsZxuSeLZ0539qbZaa6CLMPLE5JNp8s4YGIXxJ4rSr5L5wvlXqh7xNQU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR03MB5735.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUNYZkQvNmplc2lLRFg0Q0EzTVl3NDluYVU2d0kyN1BocGV1UU9MdVNYa1lK?=
 =?utf-8?B?T2prMHVqQnhVQnRXWjJOSjB0Z3dIMEFNcFp5SzFHZ1FsOG1nUnhkcHQxZE1S?=
 =?utf-8?B?aDZKUXFkOVJPUms3ZEtnanF1TUhkTVQ4M2d3cGZCb0lPUjA4eHN5b08walBX?=
 =?utf-8?B?RTBSYUR4c2dDM1hpZUYrb1pZM2tCS0lnVzVaczZJTVIxRE9nd1V1WmpJck03?=
 =?utf-8?B?RkJpMkcyNlJ0alQrdzk0L3FMWmZyRGl2MU1DbEVKM0RseW1RMjYzY29zL3cy?=
 =?utf-8?B?c3pVZzhNbEN0WXVpN2dQWUhCVVhkZEJlZlRtU2twK0UxbWVGUFNJUFRncXl2?=
 =?utf-8?B?WHllbUVBamVGcUFMbUplUEs5eXk2SGZqbFVTbXo1WHlDdnBHaUlHdmM3eDgv?=
 =?utf-8?B?ejZvVnpoR0JMWGxoZ0pyaDREdHBjRTZPQ0pxNVlwUWlzUEViRmNLY3FwMDN4?=
 =?utf-8?B?OG9PZHE1ZE5lMDYvVTFBaUI5a29KWnBkRlBURUpNeFJaQXFBNHFOTzFvNjJD?=
 =?utf-8?B?ajlJK0ZsYTcxNEo3Ykw0cC92NDJuKzVoR2Fxb284RG9YYlFHUGVQMWtPTGxF?=
 =?utf-8?B?cG4rSEtSaC8ySm50YllpdWkrd3FWNnd5WVoyalZFbDJuYWtpL1p2MTM3R3JU?=
 =?utf-8?B?SGNTOHYxZzEvendBbitTSEwzK3lVcXl4V2gwMDlNWno1MUR0NWY3cmpoazFX?=
 =?utf-8?B?U3RrN0Z4WXNiOTMrTGRkWGlGRDNpMVN4Zk9TOWxaWVQvbVBwNDVzMnZzVWdI?=
 =?utf-8?B?cTZWQ0RQQnZJQzg3TXNxRGtsUmM3S2RXMS9ZSEpiYTVSZDA1N3lnTlhVNkpl?=
 =?utf-8?B?cmFqR1Z0dDNzc1J2dnBvUUM2VW5DL2xtbWY2cmxBVE0zbnQ1WGZ5YlNtODVt?=
 =?utf-8?B?eENuVDgwTUVwN1YzblZkK0Z2amdrVnN0Yy9PclVmQ2c3SXFnMHpMWVYvS2FI?=
 =?utf-8?B?Mlk2OU5WTnF2ZWNlQjhNdnVQMjBlQnhuQ0ZDclRPMFBhaWlsSWVUWGMxU3RC?=
 =?utf-8?B?MnNYQUlsWnJVdjVieGZQbWkrb1ZPaXREbW0vWCtHengxRzJxZnFPU2dxYktz?=
 =?utf-8?B?UmRiWlVNRGIramovWXhNZHRWL2M4N2RMcjdpVmNRUzNPUzkzdi9pb1Fhd1d1?=
 =?utf-8?B?TFNXV0hFVkVURE1oaFhJRC82VE5oRW9RRnFlYVl4eWVOcVg3T1BPUDNRcGsy?=
 =?utf-8?B?dVNaMExtR3ZNU3U4Y2Z0c0VDbkJ1UHpTTmtueW9iOUVGQkxHRTROUVFPZ2tN?=
 =?utf-8?B?VnlZOHBNSjNDUWN2YWEzalE0d1JFWnA1TTNocUMyeW5UTTdRL1krcXNCWDNi?=
 =?utf-8?B?RnoxN1JWVVFFeGIzNFhVcXVTVkFzM2RxelI3djdLNTEvWDJacjlmVmpYdUxp?=
 =?utf-8?B?ZmsrNEdJK0YwbHhQbmJtckQ2cjZYWnNaMWZXQmdaa1lPdFlPc0ZhK240emxQ?=
 =?utf-8?B?bVAvZHJIZTBhWldiODJ0QXZ2aHlIZlQybkhIKytMRjMrRkl5emZ4Ny9WVGts?=
 =?utf-8?B?aW5YeTV4VncrclZpUzlSL3ZTRHlBSHdrQ0w4aFhIY2xmR1NNUmxOVmxhUEN0?=
 =?utf-8?B?QzB2cXpBZlNFRE9VODd6WEhIR1ZyY0RKLy9wWjUwZGI3QjQvZjhkMUtBZVp4?=
 =?utf-8?B?QUQwYk5HdEpaaExNd3Fzd0o2TE5aZU9RNnFUZjh3dHZqSXZ1a1VEcG1HUjlk?=
 =?utf-8?B?UTRXVTJiOTBURURQM3RTOHBQTTY5R0lqUk1xUjJpSEVRL3FYWHZuTXcxR0pD?=
 =?utf-8?B?YXNHelk1cUF2SVFibkhjTUtzUXMyWW55bXE4MWgyS3NZeVRqenlZOS9yKzZu?=
 =?utf-8?B?cFFuZ1pNNnJYVnhBRHVqR3daalU3bVJGMldwcjJaRjRhcUR0cTF4K3RUalRz?=
 =?utf-8?B?dWZRU1dpSnZTUkxxMkJ1ME1MQVBJUmZVTG5oWE5RblZ2UlpNY2NudVVlTE1L?=
 =?utf-8?B?ZUs1NUJtanBMZkt5UjV4VDNYV3RVUFl2YnN1L1NXdGdaUi9BSlBlcU9IRERt?=
 =?utf-8?B?anRzNGF4dWVmQy9XTUhoUXI4UlJOek0vNGNVTUpITkdLa3RaTjZVYk5idUdQ?=
 =?utf-8?B?dDlZNUwwYXl3TzZYWWk2T2hJQjVwd3daZG9QMERpVEpXd1A0U29QdVBKeWR0?=
 =?utf-8?B?OHFEenlOOWlrbzN6UXJzOGxiSXBVaVlpMGZwdVNZV0UwMkZSZDBNdGc5ekJV?=
 =?utf-8?B?MmxaaW1SSHVPWjVLVnZpc3FLSmp6UW1icmowYWFhTTdnek5pL0ZQaEtnMlhy?=
 =?utf-8?B?VGY5M0NYN3k0MWNBSDkvVmY0NDdlQkhucHVBd2JtYlZKRTlRTGI5eEFQbitH?=
 =?utf-8?B?YUhKYjVkRnhrRSszSTFyUkFOOUFvWCs2aHNndGFRL2FQREhBZnFTdExnSFZ6?=
 =?utf-8?Q?bLXPz7Y1RMVS358E=3D?=
Content-ID: <6153A24AFAD55A4EB4BD9F12B3C1D04B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bqouTRiNx+Qnr4ocUzGUqsuUhg+KJoaFn9v/PjS+q9JUVnCaaiIbz0g/+b9qDFPo+tzTijv1XebTT/YW7smzX77r9I6SIBCSRR67AHtzYXHjvuJW4TXIqlJpIfQlfglX8WrBZfiMB4hXVV2DuONkvmtsbccLvkvWnk+X33ddxnE4G6OiI1lSnjYQokqrhyeqTbeykFBmmCF7DYrSlvUpAHc5VDWHTGHkHwd5cbVyfdlk1YFF4tMUIPlsf9P24dCkTmEJRVpqzn2PI0qPBx6PEQTsgdREWhP+kW3IaZZKxhWqwzKXUAxA+gxObJZUnH8LVAQMC8X1RVoOgWWO76Bzlw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5735.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bd5417-4254-4d86-1da1-08df0a4f0770
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 06:37:45.3267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAmMEJmAQDKTRml2XoU1Hvlan6fCYM19IVlb3uIe5wfrBAvHkWwxsMgHVx5imZ0QStLr6KIQKs+7+7lPu0NfisUcl4ueskW6Klz5gox8e/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8359
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1067528861.944438574"
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

--__=_Part_Boundary_001_1067528861.944438574
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2FtaWwsDQoNClYyIGhhcyBiZWVuIHNlbnQuDQpodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvNzUwODE0Lw0KDQpUaGFua3MhDQoNCk9uIEZyaSwgMjAyNi0wOS0wNCBh
dCAwMTo1NSArMDAwMCwgWGlhbmRvbmcgV2FuZyAo546L5YWI5YasKSB3cm90ZToNCj4gSGkgS2Ft
aWwsDQo+IA0KPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQo+IA0KPiBJIGhhdmUgYWRkcmVzc2Vk
IGFsbCBjb21tZW50cyBpbiB2MjoNCj4gICAtIFVwZGF0ZWQgdGhlIGF1dGhvciBlLW1haWwgdG8g
eGlhbmRvbmcud2FuZ0BtZWRpYXRlay5jb20uDQo+ICAgLSBXcmFwcGVkIHRoZSBjb21taXQgbWVz
c2FnZSBib2R5IHRvIDY1IGNvbHVtbnMuDQo+IA0KPiBJIHdpbGwgc2VuZCB2MiBzaG9ydGx5Lg0K
PiANCj4gVGhhbmtzIQ0KPiANCj4gT24gVGh1LCAyMDI2LTA5LTAzIGF0IDE1OjM4ICswODAwLCBY
aWFuZG9uZyBXYW5nIHdyb3RlOg0KPiA+IE1USyBEUk0gZG9lcyBub3QgY3VycmVudGx5IHByb3Zp
ZGUgdGhlIGltbWVkaWF0ZSBwYWdlLWZsaXAgZXZlbnQgb3INCj4gPiBvdXQtZmVuY2UgY29tcGxl
dGlvbiByZXF1aXJlZCBieSB0aGUgYmxvY2tpbmcgYXRvbWljLXRyYW5zaXRpb24NCj4gPiB0ZXN0
cy4NCj4gPiANCj4gPiBTa2lwIG9ubHkgdGhvc2UgYmxvY2tpbmcgdmFyaWFudHMgb24gTVRLLiBU
aGUgbm9uYmxvY2tpbmcgdmFyaWFudHMNCj4gPiBhbmQNCj4gPiB0aGUgc2VwYXJhdGUgbW9kZXNl
dC10cmFuc2l0aW9uIHRlc3RzIHJlbWFpbiBlbmFibGVkLCBzbyBjb3ZlcmFnZQ0KPiBmb3INCj4g
PiB0aGUgc3VwcG9ydGVkIHBhdGhzIGlzIHJldGFpbmVkLg0KPiA+IA0KPiA+IFhpYW5kb25nIFdh
bmcgKDEpOg0KPiA+ICAgdGVzdHMva21zX2F0b21pY190cmFuc2l0aW9uOiBTa2lwIGJsb2NraW5n
IHRyYW5zaXRpb25zIG9uIE1USw0KPiA+IA0KPiA+ICB0ZXN0cy9rbXNfYXRvbWljX3RyYW5zaXRp
b24uYyB8IDQgKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+ID4g
DQo+IA0KPiAqKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCj4g
ICoqKioqKioqKioqKioqKioqKioqDQo+IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhp
cyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCj4gYXR0YWNobWVudHMpIG1heSBiZSBj
b25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvcg0KPiBvdGhlcndpc2UNCj4g
ZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVu
ZGVkIHRvIGJlIA0KPiBjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChz
KS4gQW55IHVzZSwNCj4gZGlzc2VtaW5hdGlvbiwgDQo+IGRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcs
IHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsDQo+IChpbmNsdWRpbmcgaXRzIA0K
PiBhdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZCBhbmQNCj4gbWF5IA0KPiBiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50
ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvcg0KPiBiZWxpZXZlDQo+ICANCj4gdGhh
dCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUNCj4gc2VuZGVyIA0KPiBpbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwp
LCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzDQo+IG9mIA0KPiB0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KPiBkaXNj
bG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFu
ayB5b3UhDQo=

--__=_Part_Boundary_001_1067528861.944438574
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0thbWlsLA0KDQpWMiYjMzI7aGFzJiMzMjti
ZWVuJiMzMjtzZW50Lg0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzc1
MDgxNC8NCg0KVGhhbmtzIQ0KDQpPbiYjMzI7RnJpLCYjMzI7MjAyNi0wOS0wNCYjMzI7YXQmIzMy
OzAxOjU1JiMzMjsrMDAwMCwmIzMyO1hpYW5kb25nJiMzMjtXYW5nJiMzMjsoJiMyOTU3OTsmIzIw
ODA4OyYjMjA5MDg7KSYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtIaSYjMzI7S2FtaWwsDQomZ3Q7JiMz
MjsNCiZndDsmIzMyO1RoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jldmlldy4NCiZndDsmIzMy
Ow0KJmd0OyYjMzI7SSYjMzI7aGF2ZSYjMzI7YWRkcmVzc2VkJiMzMjthbGwmIzMyO2NvbW1lbnRz
JiMzMjtpbiYjMzI7djI6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7LSYjMzI7VXBkYXRlZCYjMzI7dGhl
JiMzMjthdXRob3ImIzMyO2UtbWFpbCYjMzI7dG8mIzMyO3hpYW5kb25nLndhbmdAbWVkaWF0ZWsu
Y29tLg0KJmd0OyYjMzI7JiMzMjsmIzMyOy0mIzMyO1dyYXBwZWQmIzMyO3RoZSYjMzI7Y29tbWl0
JiMzMjttZXNzYWdlJiMzMjtib2R5JiMzMjt0byYjMzI7NjUmIzMyO2NvbHVtbnMuDQomZ3Q7JiMz
MjsNCiZndDsmIzMyO0kmIzMyO3dpbGwmIzMyO3NlbmQmIzMyO3YyJiMzMjtzaG9ydGx5Lg0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtUaGFua3MhDQomZ3Q7JiMzMjsNCiZndDsmIzMyO09uJiMzMjtUaHUs
JiMzMjsyMDI2LTA5LTAzJiMzMjthdCYjMzI7MTU6MzgmIzMyOyswODAwLCYjMzI7WGlhbmRvbmcm
IzMyO1dhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7TVRLJiMzMjtEUk0mIzMyO2Rv
ZXMmIzMyO25vdCYjMzI7Y3VycmVudGx5JiMzMjtwcm92aWRlJiMzMjt0aGUmIzMyO2ltbWVkaWF0
ZSYjMzI7cGFnZS1mbGlwJiMzMjtldmVudCYjMzI7b3INCiZndDsmIzMyOyZndDsmIzMyO291dC1m
ZW5jZSYjMzI7Y29tcGxldGlvbiYjMzI7cmVxdWlyZWQmIzMyO2J5JiMzMjt0aGUmIzMyO2Jsb2Nr
aW5nJiMzMjthdG9taWMtdHJhbnNpdGlvbg0KJmd0OyYjMzI7Jmd0OyYjMzI7dGVzdHMuDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NraXAmIzMyO29ubHkmIzMyO3Rob3Nl
JiMzMjtibG9ja2luZyYjMzI7dmFyaWFudHMmIzMyO29uJiMzMjtNVEsuJiMzMjtUaGUmIzMyO25v
bmJsb2NraW5nJiMzMjt2YXJpYW50cw0KJmd0OyYjMzI7Jmd0OyYjMzI7YW5kDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjt0aGUmIzMyO3NlcGFyYXRlJiMzMjttb2Rlc2V0LXRyYW5zaXRpb24mIzMyO3Rlc3Rz
JiMzMjtyZW1haW4mIzMyO2VuYWJsZWQsJiMzMjtzbyYjMzI7Y292ZXJhZ2UNCiZndDsmIzMyO2Zv
cg0KJmd0OyYjMzI7Jmd0OyYjMzI7dGhlJiMzMjtzdXBwb3J0ZWQmIzMyO3BhdGhzJiMzMjtpcyYj
MzI7cmV0YWluZWQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1hpYW5k
b25nJiMzMjtXYW5nJiMzMjsoMSk6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7dGVzdHMv
a21zX2F0b21pY190cmFuc2l0aW9uOiYjMzI7U2tpcCYjMzI7YmxvY2tpbmcmIzMyO3RyYW5zaXRp
b25zJiMzMjtvbiYjMzI7TVRLDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMy
OyYjMzI7dGVzdHMva21zX2F0b21pY190cmFuc2l0aW9uLmMmIzMyO3wmIzMyOzQmIzMyOysrKysN
CiZndDsmIzMyOyZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzQmIzMy
O2luc2VydGlvbnMoKykNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsq
KioqKioqKioqKioqJiMzMjtNRURJQVRFSyYjMzI7Q29uZmlkZW50aWFsaXR5JiMzMjtOb3RpY2UN
CiZndDsmIzMyOyYjMzI7KioqKioqKioqKioqKioqKioqKioNCiZndDsmIzMyO1RoZSYjMzI7aW5m
b3JtYXRpb24mIzMyO2NvbnRhaW5lZCYjMzI7aW4mIzMyO3RoaXMmIzMyO2UtbWFpbCYjMzI7bWVz
c2FnZSYjMzI7KGluY2x1ZGluZyYjMzI7YW55JiMzMjsNCiZndDsmIzMyO2F0dGFjaG1lbnRzKSYj
MzI7bWF5JiMzMjtiZSYjMzI7Y29uZmlkZW50aWFsLCYjMzI7cHJvcHJpZXRhcnksJiMzMjtwcml2
aWxlZ2VkLCYjMzI7b3INCiZndDsmIzMyO290aGVyd2lzZQ0KJmd0OyYjMzI7ZXhlbXB0JiMzMjtm
cm9tJiMzMjtkaXNjbG9zdXJlJiMzMjt1bmRlciYjMzI7YXBwbGljYWJsZSYjMzI7bGF3cy4mIzMy
O0l0JiMzMjtpcyYjMzI7aW50ZW5kZWQmIzMyO3RvJiMzMjtiZSYjMzI7DQomZ3Q7JiMzMjtjb252
ZXllZCYjMzI7b25seSYjMzI7dG8mIzMyO3RoZSYjMzI7ZGVzaWduYXRlZCYjMzI7cmVjaXBpZW50
KHMpLiYjMzI7QW55JiMzMjt1c2UsDQomZ3Q7JiMzMjtkaXNzZW1pbmF0aW9uLCYjMzI7DQomZ3Q7
JiMzMjtkaXN0cmlidXRpb24sJiMzMjtwcmludGluZywmIzMyO3JldGFpbmluZyYjMzI7b3ImIzMy
O2NvcHlpbmcmIzMyO29mJiMzMjt0aGlzJiMzMjtlLW1haWwNCiZndDsmIzMyOyhpbmNsdWRpbmcm
IzMyO2l0cyYjMzI7DQomZ3Q7JiMzMjthdHRhY2htZW50cykmIzMyO2J5JiMzMjt1bmludGVuZGVk
JiMzMjtyZWNpcGllbnQocykmIzMyO2lzJiMzMjtzdHJpY3RseSYjMzI7cHJvaGliaXRlZCYjMzI7
YW5kDQomZ3Q7JiMzMjttYXkmIzMyOw0KJmd0OyYjMzI7YmUmIzMyO3VubGF3ZnVsLiYjMzI7SWYm
IzMyO3lvdSYjMzI7YXJlJiMzMjtub3QmIzMyO2FuJiMzMjtpbnRlbmRlZCYjMzI7cmVjaXBpZW50
JiMzMjtvZiYjMzI7dGhpcyYjMzI7ZS1tYWlsLCYjMzI7b3INCiZndDsmIzMyO2JlbGlldmUNCiZn
dDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjt0aGF0JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3JlY2VpdmVk
JiMzMjt0aGlzJiMzMjtlLW1haWwmIzMyO2luJiMzMjtlcnJvciwmIzMyO3BsZWFzZSYjMzI7bm90
aWZ5JiMzMjt0aGUNCiZndDsmIzMyO3NlbmRlciYjMzI7DQomZ3Q7JiMzMjtpbW1lZGlhdGVseSYj
MzI7KGJ5JiMzMjtyZXBseWluZyYjMzI7dG8mIzMyO3RoaXMmIzMyO2UtbWFpbCksJiMzMjtkZWxl
dGUmIzMyO2FueSYjMzI7YW5kJiMzMjthbGwmIzMyO2NvcGllcw0KJmd0OyYjMzI7b2YmIzMyOw0K
Jmd0OyYjMzI7dGhpcyYjMzI7ZS1tYWlsJiMzMjsoaW5jbHVkaW5nJiMzMjthbnkmIzMyO2F0dGFj
aG1lbnRzKSYjMzI7ZnJvbSYjMzI7eW91ciYjMzI7c3lzdGVtLCYjMzI7YW5kJiMzMjtkbyYjMzI7
bm90DQomZ3Q7JiMzMjtkaXNjbG9zZSYjMzI7dGhlJiMzMjtjb250ZW50JiMzMjtvZiYjMzI7dGhp
cyYjMzI7ZS1tYWlsJiMzMjt0byYjMzI7YW55JiMzMjtvdGhlciYjMzI7cGVyc29uLiYjMzI7VGhh
bmsmIzMyO3lvdSENCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+
PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGlj
ZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRo
aXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNv
bmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0
IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRv
IGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1
c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9y
IGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkg
dW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0K
YmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlz
IGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFp
bCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJl
cGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRo
aXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBh
bmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3Ro
ZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_1067528861.944438574--

