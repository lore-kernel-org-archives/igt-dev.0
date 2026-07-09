Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2A3C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 07:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F5710E02D;
	Thu,  9 Jul 2026 07:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="nt901pJ3";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="k7+FLncz";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7A510E02D
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 07:43:05 +0000 (UTC)
X-UUID: cfd2e6bc7b6911f1b1788b6acf885367-20260709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=1ZkRDy3PNUF2FUms5jnnT6eIy8Yl7JIdEyApHs0hoIE=; 
 b=nt901pJ3Ilxt4UcEgjTjLLg8cQXQgNCiw8VpQoViML9gswB2x1G/iYrUwonwHdNrquZQBMpmRgcK9rWMrTVEo7fXSoPkiucjPEnRDz37mUDe60GSuOYpXF+pC00CxSE/LrB689SaEOiCtI8jpmnYumRkHAdukDDsPJmGVLKn+xg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:8757c063-862a-4dfc-8008-210260196958, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:d497b38, CLOUDID:802ae918-ab14-4403-9336-76696324c5a8,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
 :-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:
 nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
 :0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cfd2e6bc7b6911f1b1788b6acf885367-20260709
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 602407512; Thu, 09 Jul 2026 15:43:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 15:43:01 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 15:43:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3K7kKNM2kMN509z0OmNhfYpBvQz11/3sEcH1YoBoodfIZn83ejv/WuHEug7Yh+N3pfBnMa+NYL0ab/WW3T4saBkZHXziQr578/Y3TBeRqL35d19fmSpKDwh1FCVUMaff3fpqt9zNfJsxgtGbDDzcqfSXMdpDqRjtzgUBd6pOanmGqXNeiiE/4ejg/Vhgq/YvdKCRSDRU3QIOLO1hDUdla0Y4Q5rMOyvP5xH2ccDF7LZ65TRAAn13qli/y9iRD+WSCZoHoIAPXOGb/HR3Yje6YxagF9TUOVStgiYyz57Uwjxw9376guCznVwGf65I3RcBCqRDEAEA6u+gRas51MjJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZkRDy3PNUF2FUms5jnnT6eIy8Yl7JIdEyApHs0hoIE=;
 b=UP3Z1nTzCcIFzPFJ5JLvwg7mEtwblQrnazJvN5/pDv6J/q2wxc5nSS8HHWp3Se1k/EtsSPaej7mqynqLMd1vpt8uI84/5cR/8FZoYPhwZZSj4jYCNn55PIROfh9q84jG1XTKpKrVd/ogSMxh4m0qWxesBxA4AvheoiL5EGzUumVp/5vOhYh0/7AKmSXi95wsusSXlrlHmb3TkHZY04WTPsspi+a2B+ubgsSKKdcFcKgN8EARHR7TaPXmafcnERxFSDzjdZPP4944SDsjL83X884A1vnCLS3n9Edg3Jrdt3U4+7Huz2QXcGxprYmI1ONUw3Rmy7PjIMfz5D5D4+KBbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZkRDy3PNUF2FUms5jnnT6eIy8Yl7JIdEyApHs0hoIE=;
 b=k7+FLnczog/P3pZAo89Nxk7QWBVcQf+lsqZmKnQjYWGZQbJlXlLZ7XLgptyUHPOuD55O4njlccQ4zfPYSZ3jgxXiRtPUZeI6Oy3iXe9aELGM/+D9EWNza0TK2ph+IG65vCXt8GlIO1WidQTB4oVm08RRDE8y+ZNvHbim4nUG4WI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KUXPR03MB9713.apcprd03.prod.outlook.com (2603:1096:d10:5d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 07:42:58 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 07:42:58 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "suresh.kumar.kurmi@intel.com" <suresh.kumar.kurmi@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>, "gildekel@google.com"
 <gildekel@google.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>
Subject: Re: [PATCH i-g-t v2] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
Thread-Topic: [PATCH i-g-t v2] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
Thread-Index: AQHdAVV9F5AhXflWfEiY7iw5xcNBxbZkT9hggACGdACAABQmgA==
Date: Thu, 9 Jul 2026 07:42:57 +0000
Message-ID: <e6b4e5b8b39eae29a2749d15e1d13a34b7d24b04.camel@mediatek.com>
References: <20260621081043.598388-1-jason-jh.lin@mediatek.com>
 <520d7fe2b1ef01d81cbb9cba7ca79e5cbd15922c.camel@mediatek.com>
 <CAMNLLoTHYoE3AiFeTaCj14ktcvuMjR0LoewUnmR+AXpoEoxpZw@mail.gmail.com>
 <bd0165e7-d245-4780-ae78-691589bc808a@intel.com>
In-Reply-To: <bd0165e7-d245-4780-ae78-691589bc808a@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KUXPR03MB9713:EE_
x-ms-office365-filtering-correlation-id: 34daa156-d3db-4d94-d630-08dedd8db1fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|7416014|376014|38070700021|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: wI+N0uNk2tqW/unZhECeZvW9FDeWza0ku2jmuO4pBvbHra4OvlszpODIYIroZdiRo47imAvt2HXewj1UoTx2F3UEgcY4m8a5R+rjNiJQzCYvZIP4dHgjTtBByRkA/+K33GVxdpnbbiLOGWwu91Gl7o5VYVfDr1A4j3RAB0gr4PyqhttCVPv69xRWN5Z8vFk+jVrumd3dtMSWmT6JqagOPFonPyFaYmwzIvYb+cG0dXMA+LdRICStDPiqv8EgJvdVea81DP0LW6UA3eOJLRgbGuyWYZXLHjHjmVXyS0nf6TwUxdDd14NHd2DRqn+jYR95JrEOqfXKKZS7+8a2TZ7bcLEJPfQ5x4WHDzF6qC8ohlucC8GRznubK0SXeU4/fY+YjNcaeS8lhcuI8CI8azh74/MGItL9muXtsPUPApU6l12n01hUnURaya54mKLHKX+HCZY9H0Ds+VkIjtIyasqt19uTuHzlU4dctL0vfIw/2m5RNWBDrd7/5eDow0xodHOHObkIeZCOiU5iJEs6fwm4AqsX/wNNhraeQbhACxsnav3ANe4iOZw/WqqV8D68lE9mRHwV68feRxgfAAz2YmYPbn0NFlfa07E36Yql5zymz/7DQV/MEw12Y7hKjw+c8uRvgZsoPeon/BxvAmNn6M84XNjnFlWs4G2xbAFo1afIxQg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(38070700021)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3ExdTBjcHZOQXFwQUI3YzNRcnI2Z0NvdEg1dE5vcmZ6M0x4NXdMTkxHaExL?=
 =?utf-8?B?dWZ6UGRuU0VxWEs5aVRZeU5SaThwaGVjdUVtc2NUYk1KODFCREozaCtBVmFp?=
 =?utf-8?B?MHVDTlZaTFhlSEVuMEdXeE51djNZUTQ4SXRyUGpxeDh6ajVGdEJ2aFBiUWwx?=
 =?utf-8?B?NFUzT0NFM1VhYzNwcDZHQURpRDJYK3NoaCtTUEQ1SXMrdHpIWE5qZ3lvbkNQ?=
 =?utf-8?B?VUF5Ly9mMkNmMG03OUlzNW5WTit1dmRGWFh5Q2dCSHNHSnhEZUsydXZYLzJB?=
 =?utf-8?B?Nkx6YjJ4YzJRaTd2SWMvSmdKZmpXK2MyR3ZVTFVlcVlxazFPZlpFS1VVM1J0?=
 =?utf-8?B?NXJEQ3laSkZDN0dvWmtFd1c4T1pKOXdEbkVEYU5LTER3SGx3VXhmMlcvSVdD?=
 =?utf-8?B?OW5sU0wzY1E0RDNiMVova3o5Mkp6YjN5NmhjV2R4cXJoSGZKaklLL3JwR1ZH?=
 =?utf-8?B?Z3VtWFFJcEExSWR6dlI3S1V0Y0FiOFV6RjhOM2dJT2Z1WjhxNWpXOVQxVkxV?=
 =?utf-8?B?UXp1ZUtzWHlaNEhjQ2xWOUNkSmlWeUQrYm9hWGpoQlY1aHQ0bVBDRW0yTEdv?=
 =?utf-8?B?WUlVQ1dzd01idWs0NXZYRVhtSEhaVGdOOXV5WHFJVjNTUGpmVWczcUp3bEpL?=
 =?utf-8?B?MjdpMWMyYUhYMmhlRVlsTHhVdFU4cXZhOWJJOHBVY3Fpa1pmMVRtYUQ1T2Ja?=
 =?utf-8?B?cHh1d0pXRCtia2ZPQ3VSdDg0Z0VCa2dwV0Y4ZllmZnBiUlJNNno5aUxRYm45?=
 =?utf-8?B?cVhDQzA4VDNGRktBRmw1ZTg0V2dGa3NWUmFHcGlZQlIvMXljWWl4Vkt2dnda?=
 =?utf-8?B?V2VqdFNhUVNIMFQySXhOcFJFVzRwNjNkaGJDdDZpeEs3cGo4Y1E5KzhLcUpl?=
 =?utf-8?B?alliaDVvcnBHR25YdS82SjlUazJjRW0xTlZQTUJNMWhJVUYydGpMbG03cHk1?=
 =?utf-8?B?VnFlMG83Y1RkSk5KWnZZckp2UXdMUmIzd0xLYW1NYjdJVWpRQzh0dG5HTWM2?=
 =?utf-8?B?RklKNHkxaW45TmNsUmlodXFSVmtMNDJJb2laZ2xZUUtmL280ZEJSejF2dlFW?=
 =?utf-8?B?SmtJQkZhWEVFNUVEZnp1VzN6QTJyaVdrZzQwWkQ4S0swNGdudW4zZGZVT0FS?=
 =?utf-8?B?c1VWUEN3dmhtRy9sQk8yekpENjd4TzBFbUFoeHFReDZocThBVnU5V1QwQTFl?=
 =?utf-8?B?cFVReWNRT3JTL3YvcGplVVI4S09weEcwb0hrR3RSZHVyY1BSTlJMT2JUb3JZ?=
 =?utf-8?B?R2NBTkVKQXBlMFM2RnpmamgvYlFSY0dFT0gvVUZPTWpCMDJmUTdKQjVQM1Ux?=
 =?utf-8?B?c2ZxUy9mU3dxTDZiZ2g2SHVIUEswZVRwK1R1OFRGNU1oREJVVnlsbWFVMnpX?=
 =?utf-8?B?YXNhZDhENThEV2QvK1Evek00REprTklkczczMGFGTUQrcVp1bGZ1VGZweElw?=
 =?utf-8?B?NnBoaTJjSG1kYjNxRXRzaGRITjB1aWh6bWtLbWkwNHdSNDh2Zlp6cHdLME02?=
 =?utf-8?B?c09KMmtqbE1XRUcwNmJBdU9FOXh0WU91RWtTdnRmY1VNb0FQUDZhN2UvQXMy?=
 =?utf-8?B?dWNvM2d1ZWdlRlh3dHBFcS9vTmNBeUZ1RmJVTk5SRnhQRlpoNVJxTXJxUmxu?=
 =?utf-8?B?RWlnT3BSa2laalZBRVpNK0FSQUJwak44YjI3d0V6TTB3NDZoaUQraWlMN1Z4?=
 =?utf-8?B?cmJzMlcxOFRBZWh1UG11RHlWMm8yS0x0NzRaWU1kUlhRTUNTU2t4UmM1OWly?=
 =?utf-8?B?Wnh5N3ZIZTZKb1kvTzZXRVZkOEpCVTRNM3hQTDF6eVU2RytmREs2WWEyenpj?=
 =?utf-8?B?NEFTdXNvZzBOVDFPTU9jYmlkbys2blhPMWJ4MFJCRkFnMnZQNC9aVUg0amJl?=
 =?utf-8?B?dDJFamhDcFgvWHdKSmVpRlh0SklGbmJIa21GZGRuR3gxV1cvUEdXYVZTemxl?=
 =?utf-8?B?R2M1ZEd5Kzk2RXBXVGVpSEgxWEpFTDU4NW9HRkwraDJDb1luUEpZWWd3RGk5?=
 =?utf-8?B?cHJGNzFjTmEvdlc5c3ZGWVMzdFZjbW1lSUlDOXYzVjFKU0ZOOVUxM1p0K0xM?=
 =?utf-8?B?YkU1STNiTE1KSHgxd2NBTlNSUEFXeGk2Z0o5NnM3OCszdThzNTZCeGR2Q3Az?=
 =?utf-8?B?RUUzdncyYWU2ZFBJQThGb3hNdm5BZkM4UkNVZDlBYTRsK05TYlJ1NXNab3du?=
 =?utf-8?B?ZUVrM0tPR1ZrM05jbEh2V1hzZjh3RVFLc1NZcFpXTWY3dGpiZjBFY0FSRnlC?=
 =?utf-8?B?OWxNQWh0Z2pLMlk0UnRlNTlIU2tDT290U25TT0FpUWh5NVVPbDN2akFtYkhE?=
 =?utf-8?B?Mmc0V21TN2tBWGFqZUF6SVdULzNrN2pqVDNWRmc0L3V0aDljODBxOUlrZTZi?=
 =?utf-8?Q?+RuPUegLBvgeeJ8Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F1BEE002589374D8F1359CF9089462D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JT+pKl8YbtTnvvEsQB3nNZ1MA5LMhaBmrz+zmQpDC5KP6lndl7Wy/CuNGMghOs2P6WOX6/atcRhXW8xX8MhsDFUW7bxMawMuaFu1UjiPryJvYpZawzdZkqR89r3i+Si9XMRWT2B2I1HRv+xJp9ZNDn8djF/GY9LL0ctL4Z4JhW3dt3FGFxwcEf2DCjM0OKNetuuFJCVJWlIrGxrZdsroRdrDc2s9iJdK2nKO92oAjw4c5b2CjE2ailqJGiM4ZXMVT+/hoJ2HsSsML30FTq1InhD6VUk3whFiKx4pdUZERtF/rGXQdmUhHgbPvLzs5zvIzeQDEmfUUwcbDAEIcmVihA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34daa156-d3db-4d94-d630-08dedd8db1fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 07:42:57.8928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dWnQybVoff+DMu4WlepPWBKGnGLsVzaR51lfGGCy2+hTnJ6s36qpQIy5edo7QmNSgb9INw0SN1+e/DEpCurj2/kD3QUt8WF+AVNbQCt4Az0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB9713
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

T24gVGh1LCAyMDI2LTA3LTA5IGF0IDEyOjAwICswNTMwLCBTaGFybWEsIFN3YXRpMiB3cm90ZToN
Cj4gwqANCj4gSGkgSmFzb24sDQo+IMKgDQo+IFJldjIgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy8xNjY5MjMvI3JldjIgaSBzZWUgSUdUDQo+IGJ1aWxkIGZhaWx1cmUs
wqANCj4gwqANCj4gY2FuIHlvdSBwbGVhc2UgY2hlY2s/DQo+IMKgDQpIaSBTd2F0aSwNCg0KQmVj
YXVzZSB0aGUgc2VyaWVzIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMv
MTY4NzU5DQpoYXZlbid0IGxhbmRlZCBhdCB0aGF0IHRpbWUuDQpJIGhhdmUgY29uZmlybWVkIHRo
aXMgcGF0Y2ggaGFzIG5vIGNvbmZsaWN0cyBpbiB0aGUgbGF0ZXN0IGNvZGViYXNlLg0KDQpJIHJl
c2VuZCBpdCBhZ2FpbiwgYnV0IGl0IHNlZW1zIFtpLWctdCB2MiBSRVNFTkRdIHdpbGwgbm90IHRy
aWdnZXIgYQ0KbmV3IGJ1aWxkLiBTbyBJIHNlbnQgYSBbaS1nLXQgdjNdLCBwbGVhc2UgaGVscCBj
aGVjayBpdC4NCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTY2OTIz
LyNyZXYzDQoNClRoYW5rcyENCg0KUmVnYXJkcywNCkphc2Rvbi1KSCBMaW4NCg==
