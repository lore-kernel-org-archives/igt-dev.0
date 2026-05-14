Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA86CD4851
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 06:48:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B62610E36F;
	Thu, 14 May 2026 06:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="RLUXKeuk";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="YWXMgJTK";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89BB10E366
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 06:48:40 +0000 (UTC)
X-UUID: ef49d1704f6011f1b5a00d44d12bea5a-20260514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=7da1a2SEwCIpQZcJxLMhIEc0hIgVb8JUrWaxw8eEXn0=; 
 b=RLUXKeuksUdt4LQ891FcDNRrqgw4UjbvEYFoAnd+6VdbDH6N0W1MqkFAOP2RWIgth2TvC5BHudRJ43EMlplAZ+EhaNjvXpUvKwCszefR0YNgTYgMHs3VHkmRYkeISILULjZGuCG2oOXJlPlxJ46M2Iq0GokYrf2h6w2p5gxlES0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:2fd82832-a6a0-45a1-8880-e4ba526fcb45, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:b2d3e440-4f1a-4cd1-8315-22e1f88ac479,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ef49d1704f6011f1b5a00d44d12bea5a-20260514
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 635848526; Thu, 14 May 2026 14:48:37 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 14 May 2026 14:48:36 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 14 May 2026 14:48:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXDb3MK74qTn56XGIKbDdnZluKJacRZVvUcWc7+Rmj2KBZ4szuIjjsGV2RchtzaweiOIX7W3JpKw1CJ8xinJM6Ai4nlLgrxp0GWTVq0C7qrxr8jY7hgeFCnmMfMflbgo+Ja48uFoiSYvbJQGQto3DMmr1cYlHGUJj8xE27VMeNFX1dkYuUs5SdmoxdvrOT2uCBMM3qfVpZNaCbmgEm/Ac/0fDdQ1D0Z/rvbdhVsa9LzEJSBpgmCngYDklg6ziNLPX5m7qgIKBdF5/hRW8RsDVqckonsaWR/F3tHZqjf9VjSQpoZY1nJKnciZkXcAe7efQTERv/pXsTNH3D9Bp03Oww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7da1a2SEwCIpQZcJxLMhIEc0hIgVb8JUrWaxw8eEXn0=;
 b=nwjM8ypivYLiOMN4hoJZjO5q5ambOg7wVm26+ZfC4pvOrulb+OT9OanssC/8BScJaCJevRzyyHJAJvB5vSwcLHSu54i30h0ZnOpqTIQQyr5NCAuOgq5dF4yVe2baXbqRgDkpmlWPWX9m1nVXe5eOkNFVZGP1aWFc/ubX/FgrcjN0hWzitOYVJS2+YwSazHmw9Gsfat9ptmAImamvNZbDQm4MTlo8mZjUuwHLqIZOfRVpHk0OaFhwRBMTw7fxRUpkagfh+cP4x/EhRsofW3yMcAmbzz3zrrHyGqCWQRpCBDYkgNbDnMz27C5LCX7MbPHipoFznhezkRZU/iato7Aqrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7da1a2SEwCIpQZcJxLMhIEc0hIgVb8JUrWaxw8eEXn0=;
 b=YWXMgJTKYXIHTxbd0sgLWRto81HRGpwKmA33e+OZOYlheA69ozJ4D07RCDO+s0Juq2FQ9P60u9h8Wgk+SQh32OxsrgQ/KAf+teLWY3XccHLuQs4eD8pD7OHxrfMtEifrXBRvG2TqDUrRvrKHay4UbVNG0QW11lxBm4yJXqg+gKg=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB8518.apcprd03.prod.outlook.com (2603:1096:405:63::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Thu, 14 May
 2026 06:48:32 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0025.012; Thu, 14 May 2026
 06:48:31 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?SmF5IExpdSAo5YiY5Y2aKQ==?= <Jay.Liu@mediatek.com>
CC: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "gildekel@google.com"
 <gildekel@google.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_color: Add 10-bit color depth
 support to gamma test for MediaTek
Thread-Topic: [PATCH i-g-t v3 1/1] tests/kms_color: Add 10-bit color depth
 support to gamma test for MediaTek
Thread-Index: AQHc42k70moFRQXMUEW0YAqx/Z7sxbYNFIYA
Date: Thu, 14 May 2026 06:48:31 +0000
Message-ID: <c52272543cd52886aabbf9fc5ac216d08b029247.camel@mediatek.com>
References: <20260420134348.21855-1-jay.liu@mediatek.com>
 <20260420134348.21855-2-jay.liu@mediatek.com>
In-Reply-To: <20260420134348.21855-2-jay.liu@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB8518:EE_
x-ms-office365-filtering-correlation-id: fe66077e-ae0d-45df-e80c-08deb184d00e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799003|3023799003|56012099003|18002099003|22082099003|4143699003|38070700021;
x-microsoft-antispam-message-info: PgklVW+m/8AOj/KuJ6fIooj//1MBAq5F/7/HexR7en0HGzb7Li/8NmXYxPEAE95/wasf/6LJmLFQGTkINFB62oSdgUwqEHQAJcB2kijtISi9wgOAJ0El5AoElufqnNA68OHTlaw4CfMycus1dk7EIBFqrSlHM2h2ZplbTYFIX0wQF1S9+cU5hyyB352FVq4QxGz0WJNakIbeinAF+UIF9RwBqFHz9ivgMw8NOPbquSfUx0RXevF/FM5MlInlUCg732ukl0uPIStuxvYZdgtkA6QaKit6mnXZAQicL/LmR8iwqxxhoKrqFNpow8emBQ5pmFE05pB1AEUExUPZj/7xHqoZJ0UNkFl4M0gnorUykB1klFrHlbUjnHFcyi6zzT6xtljvgxTrfacqiSiSQWgD7f6YxNXnZkBv1HTMHz9shn/xhQLeHq5zHJjnnqEsuz/7sKJ6RNbDyrNLPGh8SzwhSuWIf8jM5V8xC44DfqPapT1erysS8fMd6cq0QDmHsciLdFBLsVRzpg75bqou52uUT7blwYVPA6prgW54Oa49sHCIPG+Q/buJynb49eulvLNhzqcQzZfuSULi8keg+58GzxEDfMqzUEbZn9LoVImDjoz8Te+NGEAMfoYFcfVHFlxOOiHqzaUon4aAV+jI3kJ5fwfhAGKpwcVEXnJ6XENec4NuFwY6fW95pkUgk4YP4OYxLoyYFnz/MNlSGcx8IzTROsUaKnG20uGkyPm3PCEAWrrtbDUakVkXmgcjvorHvD8Q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(3023799003)(56012099003)(18002099003)(22082099003)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTFTcTRMQzZUUDZwM0VDRnhmK2R0TDJSZFlvMlM5VXRQbVZnU2lsSTdxL3Nt?=
 =?utf-8?B?NVdYNzlaMDhRU1VOcDcvRnNxeDF0M2Q5THlGQ2FzZThENnpJaGJOQ0cwTUNM?=
 =?utf-8?B?cUVITzcrR2hoZVNxdG1yZlMwcitKTWdFbGYrc01iQWgrZFJDOHVsMkF2Yjd4?=
 =?utf-8?B?UDE4MXJFdWt0SFlGdDlvd0M5VjJ6OWVwZlVDSnl2Y1E4TlE2NUhEdlZDNWpt?=
 =?utf-8?B?UkZvMlVoSUhJNk55NVpNYkFKV0tjc2M1YXNHcWdxTFlraEs2a2liMlMwdFc5?=
 =?utf-8?B?blNIdDB3TWtjZjdCZjNVdDJlMjN4SXhJNFYrTkFHWmRzOVJodFBUN1Rqb2wv?=
 =?utf-8?B?ME9UUVBFYjYyYWMrRFNwMU4rMjByc1B4UUNXR0JjWTJMcWVGQjgvNjNUb1ZF?=
 =?utf-8?B?MWUvSis1L2F6WlBacXRiN2g3bVI4SEkwbkRTTVdMaGZ2MjlBN2I0T0F0T08y?=
 =?utf-8?B?VTFnc2JTRHl1VUI4KzEySTh3ckVYelVpMkZNOHRpUlNWVm9vbnJubFJLT3VM?=
 =?utf-8?B?ejI1ODhOYW9YeWZaZ2pIRm0xd09EclVnSXNQYnByVTBidnZxczRldW9USzVi?=
 =?utf-8?B?NlloZkVpRHo3TlZJTWdVZlg2VEpUYTdQR3VyR1c3WVk2eGYwTHJ0UENRUm5O?=
 =?utf-8?B?OVdyVFhaYUE2VEx1N2JIaS9yaURuYVlBMXVLdjZHbEJmdmp0UFpxUTlYMnpS?=
 =?utf-8?B?NEJKOEtIWDRNYmIwZytOS1pjTjJwUmZ1Q2xUV0pORmRkOVh0eWtCYllnamo1?=
 =?utf-8?B?VUFaeTAyTHRjNkdVY1hKWnhEVlAwbUxCUVRpcmN2bkZpNHJVdTdEeGx6RzZs?=
 =?utf-8?B?QzRqZTh0b0JNZ1FpZWVzSVlBckJaa2RtL0J3QUhmMy9RUWZOZmVDWEcvZzBy?=
 =?utf-8?B?OGVOWkpuOFNJSXZUTHc1Y0tFNmZQREpyRmlnZ1YzbUpnSDVkOEFVSGJPRmpl?=
 =?utf-8?B?d01nbXh6c3d2OFhVQXZBN0ZmaTNhWEw4cnhhV0QvVkhTSnpqODNYS3NYbzNj?=
 =?utf-8?B?SXVhSGc5M0tEMFIzZERDZ2RhY25ncjZjeHp1alg5Z2dPaDVISHhLTnQwYmhH?=
 =?utf-8?B?bFZjMlFqOFBiVmVMMmd1ZlBDOVFCcm51MUt6L3JoWk5Zc2wrZlJHUzE4SUVI?=
 =?utf-8?B?emFXSGFRMVVIUEs0cC9kaGVhSnRDYytNTVZiRStOR1VoYnkveDhVd1dnMFFx?=
 =?utf-8?B?WEFoZkxTTVVrd2hyaXVudFl1bGRnTTBKSDZFekxJQmZyWUoyMnppZ0VscEo0?=
 =?utf-8?B?U2cwV0ozWjlzYWFiRVpnTFU5Q3ZPcTFaSVVOanFRS0dab0pOYzJzVDlocGIz?=
 =?utf-8?B?YWJWbldUU214YXJMNXBmSnNYZEJ6c05vZjl3Q2FFaS9BY0kyY1lrTnYzNzlG?=
 =?utf-8?B?Yys3YjZlNHEyRzBLZUtRNzBVR21uRm9PMnMxV1ZlRHFvSlE4UytVT1RPMEh1?=
 =?utf-8?B?dzFpVDlLUHEyOC9DQlZuUVFsVGN6Uno1YjN1LzJ4RDhJOEpXaEdMZWFaZ3Ba?=
 =?utf-8?B?ak9URlNmZ1FVRWYxYjNxVXJVZk9MSEdLdWE5dTc3SC9FSjJNZlVyNllsMmlo?=
 =?utf-8?B?cFgxMnZmZ2xDOCtxSWlWZDM0anhCaEFIY0tTNFRSR0UyMjArZXRrb1RZcGFO?=
 =?utf-8?B?ZG1POFlCb3hLS3paQmtQejllWUsyNkNkaTVHQTVMOHhiV3J4c0JMQnRlQksr?=
 =?utf-8?B?SlFmYTdVQW1YaitxaDIxNnEyczE4K2d4YlpPN0NocWhDT21oUU90NkVNWFor?=
 =?utf-8?B?dzN4SUd4Y1ZZWVZUcFdyeDNmWjhmbFViZk9samFob2xJbC9PMjlhVG1oaHU0?=
 =?utf-8?B?RmU5UnVUVEpSTkJCV1RKSjZ2NzQydzRrZ2o4NUptWGxEcVI4OExzUUp4RXpk?=
 =?utf-8?B?T1RXaElUYXNBRHp2allLL0lLZlhFa1hvckxRWXBPWTBVRkZVTFZJQmVsVFRP?=
 =?utf-8?B?ZDF3ZDh6MjRvaXpsWTIwM3dIVWkrOGR2VkxjWUpFMHRQamZMcFplbDZ5eU52?=
 =?utf-8?B?SFE0eUR5TUVER3FGRHZ3bFk3Vi90K2FRLzBKYlBpWjhzeVhxWm1qbjVNcFh0?=
 =?utf-8?B?aXUyaENUQ2xidi8rY1ZQWFJiSFNyWUVralIwMzF0c0FyLzFZa2dPaXk1Yk1S?=
 =?utf-8?B?dDhtWHBXS2N1ZFp2ckRHWFdoVkNuL3djSlUwU2FOeUlMekRHWTMrTi83RDd2?=
 =?utf-8?B?NDlhTzZ5NUNqYVliUVpVdnUwaWJtamNhemVlZ3RQRGc0UUlUaVBENUs1YWpt?=
 =?utf-8?B?VkR1YWNuT1V6WDhpN200ODE1VWZaYU1IR2lZa1RkbVVydG9MSjhSMlc3U2FQ?=
 =?utf-8?B?V2N0UVVXSGlHc3c4OUtuQ2d2cWhPUlgzS2JBL0x0UmtQd0FQVEVKV3l0bm5v?=
 =?utf-8?Q?AS1Ihmbg8UAK554s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FA502DCA3B0C943B2ED0EBB155B9467@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JFnNuYiy16jSbEiQr8jPvb7lGDrXHjQHWaOpuygIGICVnvAWk1SxYwdWW8Hu2fiAukutlWP4j6d2q7NYl2kdelSAwPFKJHdam65hilsqLImi5AmSlvxqa904or5b+28edQDK/bxXeWS9k/T1802L+eLCzZIoCuLsTB5o2hPRHPCHwk4qCNY0YzNmYD5Tl1Xerb3POAQlNWRf7cJWcM3GHF2bMsdzuFHdbe+44eVHK0827t3FhXxEg72QW62DBqp6jb3OrLbVFJmPlPcPvR4nwrYPWaEOXgC756x7TcF4Sg1iVwOW+fqxTLl1bdtF79lbgTZN4xJ0Cql1eAT8WI22HA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe66077e-ae0d-45df-e80c-08deb184d00e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 06:48:31.6990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U6tGC7nL5ilwhGtdvRB/KDoaIgGXio/MGM9yQztPe9os3QjUlcGMLAa6nu50MBb1UXyKDUW8nT+ZkgmRZ4mdq8LrD1VJRyoBt6XNFADewxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8518
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

T24gTW9uLCAyMDI2LTA0LTIwIGF0IDIxOjQzICswODAwLCBKYXkgTGl1IHdyb3RlOg0KPiAxLiBB
ZGQgMTAtYml0IGNvbG9yIGRlcHRoIGZsb3cgdG8gZ2FtbWEgdGVzdCBmb3IgTWVkaWFUZWsgZGV2
aWNlcywNCj4gd2hpY2ggb25seSBzdXBwb3J0IGJpdC10cnVlDQo+IHJlc3VsdHMgd2l0aCAxMC1i
aXQgZGF0YS4gVGhlIHRlc3Qgbm93IHNlbGVjdHMgOC1iaXQgb3IgMTAtYml0IGNvbG9yDQo+IGRl
cHRoIGFuZCBmcmFtZWJ1ZmZlcg0KPiBmb3JtYXQgYmFzZWQgb24gZGV2aWNlIHR5cGUuDQo+IA0K
PiAyLiBUbyBzYXRpc2Z5IHRoZSBsZWdhY3kgZ2FtbWEgdGVzdCByZXF1aXJlbWVudHMsIHRoZSBN
VEsgR2FtbWEgTFVUDQo+IGxpbWl0IHNob3VsZCBiZSBzZXQgdG8NCj4gNDA5MiwgaW4gdGhlIGN1
cnJlbnQgMTYtYml0IExVVCBkZXNpZ24sIHNldHRpbmcgdGhlIGVudHJ5IHRvIDB4ZmZkMA0KPiBl
bnN1cmVzIHRoZSBkcml2ZXIgbWFwcw0KPiBpdCBjb3JyZWN0bHkgdG8gNDA5Mi4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEpheSBMaXUgPGpheS5saXVAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gwqB0
ZXN0cy9rbXNfY29sb3IuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jb2xvci5jIGIvdGVzdHMva21zX2NvbG9yLmMNCj4g
aW5kZXggNTY1ZWRiMmRjLi4zNWIwMTA2YjcgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc19jb2xv
ci5jDQo+ICsrKyBiL3Rlc3RzL2ttc19jb2xvci5jDQo+IEBAIC0yODgsNyArMjg4LDcgQEAgc3Rh
dGljIGJvb2wgdGVzdF9waXBlX2xlZ2FjeV9nYW1tYShkYXRhX3QgKmRhdGEsDQo+IMKgCWZiX2lk
ID0gaWd0X2NyZWF0ZV9mYihkYXRhLT5kcm1fZmQsDQo+IMKgCQkJwqDCoMKgwqDCoCBtb2RlLT5o
ZGlzcGxheSwNCj4gwqAJCQnCoMKgwqDCoMKgIG1vZGUtPnZkaXNwbGF5LA0KPiAtCQkJwqDCoMKg
wqDCoCBEUk1fRk9STUFUX1hSR0I4ODg4LA0KPiArCQkJwqDCoMKgwqDCoCBkYXRhLT5kcm1fZm9y
bWF0LA0KPiDCoAkJCcKgwqDCoMKgwqAgRFJNX0ZPUk1BVF9NT0RfTElORUFSLA0KPiDCoAkJCcKg
wqDCoMKgwqAgJmZiKTsNCj4gwqAJaWd0X2Fzc2VydChmYl9pZCk7DQo+IEBAIC0yOTYsNyArMjk2
LDcgQEAgc3RhdGljIGJvb2wgdGVzdF9waXBlX2xlZ2FjeV9nYW1tYShkYXRhX3QgKmRhdGEsDQo+
IMKgCWZiX21vZGVzZXRfaWQgPSBpZ3RfY3JlYXRlX2ZiKGRhdGEtPmRybV9mZCwNCj4gwqAJCQkJ
wqDCoMKgwqDCoCBtb2RlLT5oZGlzcGxheSwNCj4gwqAJCQkJwqDCoMKgwqDCoCBtb2RlLT52ZGlz
cGxheSwNCj4gLQkJCQnCoMKgwqDCoMKgIERSTV9GT1JNQVRfWFJHQjg4ODgsDQo+ICsJCQkJwqDC
oMKgwqDCoCBkYXRhLT5kcm1fZm9ybWF0LA0KPiDCoAkJCQnCoMKgwqDCoMKgIERSTV9GT1JNQVRf
TU9EX0xJTkVBUiwNCj4gwqAJCQkJwqDCoMKgwqDCoCAmZmJfbW9kZXNldCk7DQo+IMKgCWlndF9h
c3NlcnQoZmJfbW9kZXNldF9pZCk7DQo+IEBAIC0zMjIsOCArMzIyLDE5IEBAIHN0YXRpYyBib29s
IHRlc3RfcGlwZV9sZWdhY3lfZ2FtbWEoZGF0YV90ICpkYXRhLA0KPiDCoAlpZ3RfcGxhbmVfc2V0
X2ZiKHByaW1hcnksICZmYik7DQo+IMKgDQo+IMKgCXJlZF9sdXRbMF0gPSBncmVlbl9sdXRbMF0g
PSBibHVlX2x1dFswXSA9IDA7DQo+IC0JZm9yIChpID0gMTsgaSA8IGxlZ2FjeV9sdXRfc2l6ZTsg
aSsrKQ0KPiAtCQlyZWRfbHV0W2ldID0gZ3JlZW5fbHV0W2ldID0gYmx1ZV9sdXRbaV0gPSAweGZm
ZmY7DQo+ICsJZm9yIChpID0gMTsgaSA8IGxlZ2FjeV9sdXRfc2l6ZTsgaSsrKSB7DQo+ICsJCS8q
DQo+ICsJCSAqIFRoZSBNZWRhaXRlayBHYW1tYSBMVVQgbWFwcyAxMGJpdCBpbnB1dCBkYXRhIHRv
DQo+IDEyYml0IG91dHB1dC4NCj4gKwkJICogSW4gdGhpcyB0ZXN0IGNhc2UsIHRoZSBtYXhpbXVt
IGlucHV0IHZhbHVlIGlzDQo+IDEwMjMuDQo+ICsJCSAqIFdoZW4gdGhlIEdhbW1hIGZ1bmN0aW9u
IGlzIGRpc2FibGVkLCB0aGUgZGF0YQ0KPiBkZWZhdWx0cyB0byBhIDQwOTIgb3V0cHV0Lg0KPiAr
CQkgKiBUbyBhY2hpZXZlIGJpdCB0cnVlIHJlc3VsdHMsIHRoZSBHYW1tYSBMVVQNCj4gbWF4aW11
bSBtdXN0IGJlIHNldCB0byA0MDkyLg0KPiArCQkgKiBOb3RlIHRoYXQgMHhGRkZEMCByZXByZXNl
bnRzIDE2LWJpdCx3aGljaCBtYXBzIHRvDQo+IDQwOTIgaW4gMTItYml0IGRlcHRoLg0KPiArCQkg
Ki8NCj4gKwkJaWYgKGlzX210a19kZXZpY2UoZGF0YS0+ZHJtX2ZkKSkNCj4gKwkJCXJlZF9sdXRb
aV0gPSBncmVlbl9sdXRbaV0gPSBibHVlX2x1dFtpXSA9DQo+IDB4ZmZkMDsNCj4gKwkJZWxzZQ0K
PiArCQkJcmVkX2x1dFtpXSA9IGdyZWVuX2x1dFtpXSA9IGJsdWVfbHV0W2ldID0NCj4gMHhmZmZm
Ow0KPiArCX0NCj4gwqAJaWd0X2Fzc2VydF9lcShkcm1Nb2RlQ3J0Y1NldEdhbW1hKGRhdGEtPmRy
bV9mZCwgcHJpbWFyeS0NCj4gPmNydGMtPmNydGNfaWQsDQo+IMKgCQkJCQnCoCBsZWdhY3lfbHV0
X3NpemUsIHJlZF9sdXQsDQo+IGdyZWVuX2x1dCwgYmx1ZV9sdXQpLCAwKTsNCj4gwqAJaWd0X2Rp
c3BsYXlfY29tbWl0KCZkYXRhLT5kaXNwbGF5KTsNCj4gQEAgLTc1MiwxNCArNzYzLDIyIEBAIHN0
YXRpYyB2b2lkDQo+IMKgcnVuX2dhbW1hX2RlZ2FtbWFfdGVzdHNfZm9yX2NydGMoZGF0YV90ICpk
YXRhLCBpZ3RfY3J0Y190ICpjcnRjLA0KPiDCoAkJCQkgYm9vbCAoKnRlc3RfdCkoZGF0YV90KiwN
Cj4gaWd0X3BsYW5lX3QqKSkNCj4gwqB7DQo+ICsJYm9vbCBpc19tdGsgPSBmYWxzZTsNCj4gKw0K
PiDCoAl0ZXN0X3NldHVwKGRhdGEsIGNydGMpOw0KPiDCoA0KPiArCS8qIE1lZGlhVGVrIHJlcXVp
cmVzIDEwLWJpdCBwaXBlbGluZSBmb3IgYWNjdXJhdGUgKGJpdCB0cnVlKQ0KPiBjb2xvciBwcm9j
ZXNzaW5nICovDQo+ICsJaWYgKGlzX210a19kZXZpY2UoZGF0YS0+ZHJtX2ZkKSkNCj4gKwkJaXNf
bXRrID0gdHJ1ZTsNCj4gKw0KDQpJIHRoaW5rIHVzaW5nIGAxMGJpdHNfbW9kZWAgb3IgYDEwYml0
c19kZXB0aGAgaXMgbW9yZSBmbGV4aWJsZSB0aGFuDQpgaXNfbXRrYC4NCg0KQmVjYXVzZSBvdGhl
ciB2ZW5kb3JzIGNhbiByZXVzZSB0aGlzIGNvZGUgbGlrZSB0aGlzOg0KaWYgKGlzX210a19kZXZp
Y2UoZGF0YS0+ZHJtX2ZkKSB8fCBpc19YWFhfZGV2aWNlKGRhdGEtPmRybV9mZCkpDQoJMTBiaXRz
X21vZGUgPSB0cnVlOw0KDQpSZWdhcmRzLA0KSmFzZG9uLUpIIExpbg0KDQo+IMKgCS8qDQo+IC0J
ICogV2UgYXNzdW1lIGFuIDhiaXRzIGRlcHRoIHBlciBjb2xvciBmb3IgZGVnYW1tYS9nYW1tYSBM
VVRzDQo+ICsJICogV2UgYXNzdW1lIGFuIDhiaXRzIG9yIDEwYml0cyBkZXB0aCBwZXIgY29sb3Ig
Zm9yDQo+IGRlZ2FtbWEvZ2FtbWEgTFVUcw0KPiDCoAkgKiBmb3IgQ1JDIGNoZWNrcyB3aXRoIGZy
YW1lYnVmZmVyIHJlZmVyZW5jZXMuDQo+IMKgCSAqLw0KPiAtCWRhdGEtPmNvbG9yX2RlcHRoID0g
ODsNCj4gLQlkYXRhLT5kcm1fZm9ybWF0ID0gRFJNX0ZPUk1BVF9YUkdCODg4ODsNCj4gKw0KPiAr
CS8qIE1lZGlhVGVrIHJlcXVpcmVzIDEwLWJpdCBwaXBlbGluZSBmb3IgYWNjdXJhdGUgKGJpdCB0
cnVlKQ0KPiBjb2xvciBwcm9jZXNzaW5nICovDQo+ICsJZGF0YS0+Y29sb3JfZGVwdGggPSBpc19t
dGsgPyAxMCA6IDg7DQo+ICsJZGF0YS0+ZHJtX2Zvcm1hdCA9IGlzX210ayA/IERSTV9GT1JNQVRf
WFJHQjIxMDEwMTAgOg0KPiBEUk1fRk9STUFUX1hSR0I4ODg4Ow0KPiDCoAlkYXRhLT5tb2RlID0g
aWd0X291dHB1dF9nZXRfbW9kZShkYXRhLT5vdXRwdXQpOw0KPiDCoA0KPiDCoAlpZ3RfcmVxdWly
ZShjcnRjX291dHB1dF9jb21ib192YWxpZChkYXRhLCBjcnRjKSk7DQoNCg==
