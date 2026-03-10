Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0A1FCC9D4
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 07:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D8F10E20F;
	Tue, 10 Mar 2026 07:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="mf0k2vxd";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="uKS+4ZZp";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBB510E20F
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 07:20:58 +0000 (UTC)
X-UUID: aaaee6501c5111f1a02d4725871ece0b-20260310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=XktkoVU6b3kl5k6U6VHTL0loludsWJJ684njPNZw+Vw=; 
 b=mf0k2vxd5gHwIWKhzOQYSV+ZCVvUUjlh0TAaY5TBu2PI6KKQJJftZazqCd2H0TMJCnYSkT1vN+vhgWM48KY9B58i4pj8BqJzrtpcIpnRwuECKS3SE4Cb0SK4Lt0vJSmQcgzQZxsdC9QnxEsGe642aG66IDh+YCWnCEDCcrS0xSI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:8dc22f1e-802b-411c-a0ba-08d40b3f0af4, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:4ef277f1-16bd-4243-b4ca-b08ca08ab1d8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:-10|4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aaaee6501c5111f1a02d4725871ece0b-20260310
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1930887261; Tue, 10 Mar 2026 15:20:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Mar 2026 15:20:49 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Mar 2026 15:20:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjmioKodh89rJrdYBhl7kurtw0GM8hBTKxXqYMKwLWwzipRwyNxvpFyjL3Szy7j7W4IpndjDZli22G32Zk7xS2WbuTFAwFrCDCn13pEtD767wqKt+aKue2wmHtf5hIPTXlWACtY5H3Mkf6yN9z1cSEoUL8eKk67hxGEri/DrpgJe+NmnWR/STf+fIjd2rNFK8RQM594618pnKZRPmXvdnrmgIZ9yMoNuGao3dy+J6bXh7mIvpwL3mDIt1Ko5czfejcO2v7mWh5B9NLLiuqFgrWbeRx8sqqX3bPuaZ/rEoGcbOZt9Kyz3n+sNt6LwiRTxXnqbhwJmbhIgAOZgNmwgog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XktkoVU6b3kl5k6U6VHTL0loludsWJJ684njPNZw+Vw=;
 b=kx6NKjZj17RnehHpeqy4tTTvRy349dsICRWjH43+hFar9xHURjtFoKF4HPwoPz6iagztt8DsGFjAL0uE6ZjSv/YkhRDu6F6P4B4BJQ0SC5hZbiRuYbqoaB0B+tza4QzNfynYOLOFXqXhlZzA02Ftnlj4oB5e46LWxbC3luj1btKOoy4nUzNHm1TQeelhpUhZ5kINz/8HBThV7BRngeVqSJokrUCDhDImkIH1B6XryJqOtLNeHYD/7aGtlRA+hjPWIp8OhJ5nUmZCgFp5RoDT2Ntty/+T1INO1qdOU4puRPU47rLursXvwPNr6fRFz316yK5fmsE7fgGSHK64OSRJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XktkoVU6b3kl5k6U6VHTL0loludsWJJ684njPNZw+Vw=;
 b=uKS+4ZZpW6b3CikS1uUCahuQpw8exx+GbwuUiBlkGl2zs2NxIyBRAake8ejflB83BotJY1GxfnH3gFrpvsJU2nX9zwRxKgZNy65tyUz0jxwcmPYJ5fCH2o+F2nmII/Dm5GXE4ELOM+pMdWgOMz2SVYNQHfh8iXbSmQ8Ey6DozaI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB9753.apcprd03.prod.outlook.com (2603:1096:101:304::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Tue, 10 Mar
 2026 07:20:46 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 07:20:45 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>, "bhanuprakash.modem@gmail.com"
 <bhanuprakash.modem@gmail.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "fshao@chromium.org" <fshao@chromium.org>
CC: "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t] tests/kms_bw: Skip tests when outputs don't support
 the mode
Thread-Topic: [PATCH i-g-t] tests/kms_bw: Skip tests when outputs don't
 support the mode
Thread-Index: AQHcpnBv+cBw1fdCD0KF0VpHGuKOLLWmEwCAgAFc8AA=
Date: Tue, 10 Mar 2026 07:20:45 +0000
Message-ID: <dbe45d826484415512b59888fed6a1096450aaa1.camel@mediatek.com>
References: <20260225160408.4116524-1-jason-jh.lin@mediatek.com>
 <e4bd5ad3-9d1f-4be3-941e-004fd57233b8@bootlin.com>
In-Reply-To: <e4bd5ad3-9d1f-4be3-941e-004fd57233b8@bootlin.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB9753:EE_
x-ms-office365-filtering-correlation-id: 26d033b3-c710-4025-bce3-08de7e758bd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|38070700021; 
x-microsoft-antispam-message-info: cbQZP7qxmuyfA+eliFj3HABSx9r1gGvu4S6SgJiNwXhMN1PTa62PrGhreXTOHovDy/g66FTS3HXxpCxK6/BX0n7Sf1Ikd/CQuEiN8h+ihb7MkJTxz1SuAlU56euEIY6vG1JixNNMfcnF/ciVGTwNlULKfI+8BxQOeSKTKWj8XPYfiV0jUmq6uVg6Q/Cup3cF8kosaJTH3w+HK6gHviwbb/5n7zWK3ltsYxq88jF5B05GXgLxJq3amPF7SF55Q3LmbYfa8mjD+1gRsWEjzLc3uzerehhLdOun3O/PD6XdqJRjVu9rFi3v/8/v6q+NxQtBRvf+OpHLg822ezbg+FfLnZT2ShGIP4sp1a1WH8bc/JXkZQVjm0yFKE2IG99DERBUTl8Im1Nj1Rc8SG7VPIArDrhnAkEubwlLN/UO+MhUkdCapsb/lQ82jV5MEJo/XY3TO97mAdPDz6NvQ9iL+44+1cf9RuQsOW/NE+ENyxAIoarM132evq/zP+G55IANhIF/IcYeixw27PgqYn7kEUQ2Sc/LjmOhiZGlDcH04eYyG2RT6p8dQIYzyd90UX+tQgYWMeyMsU9kbkT901vpBOgwyDr4fA0po+PykeJA4s1HnSOgVGTGCnrUG6R/g4jFOLoMrG3WBcBIc+BSyHq+Uv35KNJNx3EK7KOOOaJgGEl/XR9lCYnlUZ7tTjshiFxrma+K5NPB/WjBAA3ZSbdIr93GotOE5bdcSdWrF5kNPzPjVKLOEdaP8rPE3VyTI/HZ/MLkWtJanIwFxKPUfuESVWEkc8cjkLkZWeFf1f1LAe4ld94=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T29pai9pblUwbzlYOXVTMktKK1djUWM3R2tNeWZ4ejZuN1NpYndPOXNEa2l2?=
 =?utf-8?B?cCtaOG9vSWdyZ2huNERYdWUxSkhkSXcrMmdoNmxGejI2R2lJb2F2TUpzU2ZT?=
 =?utf-8?B?djk5YVVhSmNwTldOMEFCRG50bko3ai94UGxaTmhJL1NqMHhzcTBsSDJhMThG?=
 =?utf-8?B?eldPWGtFeDZ3c3RRRjZ0YkVxN2YwYVJLRWhGdlkvaXF4TThVVUF2NWtrVFlo?=
 =?utf-8?B?cDhFSFBsYndqWlU4azgxMW9lUU1VMXlsWVBRRzhCTHpVbkVheHcrSE5Zeis3?=
 =?utf-8?B?bWpGOHJ1dVh6TThPNi9yeEFBdENNQ0Eyd0xPazZ0Umhzd3prV09sc0RKREh2?=
 =?utf-8?B?UXFpTk5vK1VRVDNBaUdLMHB2NVBlSnFuN0FQSWpoQlg2WVp2ZnlWSlNtSW0y?=
 =?utf-8?B?dUtRN0oxdWZncDQ5OXhBZWlETmlJODZkbWozSzNBYkZ0ekpBRVJva1VXcXk1?=
 =?utf-8?B?a3BDTDZTeHhVU1hqd2wzVmYveFBCd1FOeFlrN3JxTmpnWFo0aFl2c1Z0eFh5?=
 =?utf-8?B?MkdQUU1JODB2S1luZnZXUGovcWtJZXBDSW1IOFprQ290dE11YUZsMXBsYjR0?=
 =?utf-8?B?amVLRmEzcWRjTHlQQzU3eHZHSmdEQjRqQ2htSndxdStqUm9lL3dCcjRLakt0?=
 =?utf-8?B?bktVVjlkRVVXRDZ1SFVRcGs5TW41d1ZmTzhzRXJTbzFzVlRNNGtRUzRJczVy?=
 =?utf-8?B?ajdXRklqa241dnRraHNJWWtvT2F3ZTlkYzgzVHM5OGk0TmZqUGs4UjRYZm9B?=
 =?utf-8?B?WFNlbnIvc1lPVHpwVXBjM0dacE4xUks1NUwrZ2E2NTJ5cjkzeUphN1VpTVdo?=
 =?utf-8?B?QVAzMEd1RlNWRDYzdE5WVFJPSElWeWc1NlRZT3NtMkt2dHM1aHkrWTJmUUV5?=
 =?utf-8?B?NzNQV3hVQUhOa1NhWkNIMGErclFRenZhclQzSTFtaDFpcEpwWlhoSithQWdn?=
 =?utf-8?B?eTNyN2Jia081ZkptZko2SzA1eDlmWEVwaWtrVXpqcE9DWXp1QnE0MFJMcmVJ?=
 =?utf-8?B?aXUwQkNab3BleWdxYzg5YjJGSE1hdWNDdXI0RjR5NU5QL2VlS1lqRXpvWE5i?=
 =?utf-8?B?ckFDWlJ5eGROVW5saXA1NEE3MnhkWWFyUTlZdnQ1S2VhREVCSExzNXF3UDk1?=
 =?utf-8?B?WDBkZkRuOW92RXBFMk82eUl1cm4zbCt1OEtLTjZKV3NEZWw3ZWpsWThYVmZJ?=
 =?utf-8?B?bWI4ZkpKQkRxUEkzRGFENDF5Q3M2bE9EeGRFOUdaRXVxdjN2SGthWEtJMWV4?=
 =?utf-8?B?WXVZblFPOFNjcmZHbm00U1d6RmZqOExNd3NGOVdINXFBb1NoNmpxdU1XeVdw?=
 =?utf-8?B?cGxvSFp5eEtzdjl5K3dud2JvdCtjR1grNWNlMDViYnNwTmorQWZLd0VNNFNi?=
 =?utf-8?B?TW4wT014dWh6aGpmc1pxZWZLSHc3YmxTaGpLMjRUKzZvV2E2ZWNTbnVTSzlp?=
 =?utf-8?B?S2M4NUpYckkxU2pRMjRtRlZBSzg5Wmk2elFMOGFsRWNLYzBxcisySUdETFFH?=
 =?utf-8?B?YkVLd3BURlNWZkNtVW5LZzJwUkc5TTFDOFdoSGRkL0dWVC9QYmZ0TnNrUlVJ?=
 =?utf-8?B?MWo3WlFXS00vNWx3cUxSSEdyNXBNR2JKb0txamVxblFBRXZkelJaT0xjQmFo?=
 =?utf-8?B?aHA0cWlxUzJXaDBHenY0L2YybTFwSTZDallZMHlWQjliRFg1Z2tpaEo4TWhU?=
 =?utf-8?B?YWpvbDBIaDF1b1Nib3NRalBqNG1vWkhEOUI1WldmK0ZlNy9PK2czVXhiZVg5?=
 =?utf-8?B?ZnI1ZSs5a2cxR3lFVmNsTVdoWFU5dkZiUDVSR2V2YUNqa3VqWkRSQWdyQnFD?=
 =?utf-8?B?bXpCT25PY0s5OGxIR2JWbDZIbExQRmg0NS9TQ1N1a2MxV0ZoTlNSTmM5d3ZU?=
 =?utf-8?B?WTJ6ZGpHRWhLM0JQMmo1bVFBT1lFdjUrVnFSayt0SGl2ZEJjNkNBU3pSNzBp?=
 =?utf-8?B?WXl5YzMzeXlBd1NoVUlOaEp4TEMyNkc1bkhWVXRvOWVqQitMc2tLWEV5eUl1?=
 =?utf-8?B?eFp1MlhhUWl3Zko1Q2t4aEpFYnkxQ0NuQWRWU21OWER2RVphNlc1Wk4wVjZM?=
 =?utf-8?B?aDBFd051bmxYNzVRQWlTOERHb05EQ3Vlb2pNSzY3K01zNkxvdjFQT1FRalRR?=
 =?utf-8?B?NlBLaTlMT1NlaEZuY09DZnowQURISW44NGtxeDZnbGJaZTVCdWhOdjZqSDJa?=
 =?utf-8?B?eWk1aVNMeEMrTkFwZS9QSlE3QjRzUHhmeG5vNU5sU2RxQmI5SlBPbG1EMVRK?=
 =?utf-8?B?b3BoaGNyQWdUeTRJa0FKWUtLMHdubUZsbzU1UnErMVRIMWc2bEczTTM0cXp4?=
 =?utf-8?B?MXp5Slo2aVZNTFNQTXNQZDVuL0VNMnRVSnFQbHNYTU9lWE9MNFFNTnV5UVAv?=
 =?utf-8?Q?0zTV7/h3ofeauKnw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDD426A6685A41418E566606F24D815F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mteriIfKhw0aNLaCa9dsxCzuFHt6XiK18+8wT9papG1ZqpqZRDP7NCoBdOqx3QIpYtm86O0oGYUgww1CSgU13MdW/7sb9Suti9SDbWb9/Uh3zTiD603Ke8G2mWGyB20DWkMM5B9T8UYy/NexNaITFKjq8pR1dE4Ecwz2gJk3YO/gkPYUzNwIe1jZPLCFZWpE1Ht3F8j7s4k8+Xc/G53Hkif8rc+RQpSk+QUgoYD5GOBzTQReu/gOYzwAO7DLxCMd9DD8vhtFo9IkhBEKnWvN+k6+5aHd8m5mNW5mgRLEmn2c2xyXFUJMrBxZVEHhvzmvV+LLQZTKvDp3YjhAPgCYAQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d033b3-c710-4025-bce3-08de7e758bd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 07:20:45.5436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jks3qTSLNpvEBxvsq4lpFvpT6s4paqdLEo6vRQCM/6OTB5i75RON0RO/lpfrCukDWfbj3qKc6WnGFosJ4F9ah3JOKqJXUComVoS8+YIBIdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9753
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

DQpbc25pcF0NCg0KPiA+ICtzdGF0aWMgYm9vbCBvdXRwdXRfbW9kZV9zdXBwb3J0ZWQoaWd0X291
dHB1dF90ICpvdXRwdXQsIGNvbnN0DQo+ID4gZHJtTW9kZU1vZGVJbmZvICptb2RlKQ0KPiA+ICt7
DQo+ID4gKwlkcm1Nb2RlQ29ubmVjdG9yICpjb25uZWN0b3IgPSBvdXRwdXQtPmNvbmZpZy5jb25u
ZWN0b3I7DQo+ID4gKwlpbnQgaTsNCj4gPiArDQo+ID4gKwkvKiBWaXJ0dWFsL2ZvcmNlZCBzaW5r
cyBzdXBwb3J0IGFsbCBtb2RlcyAqLw0KPiA+ICsJaWYgKCFpZ3Rfb3V0cHV0X2lzX2Nvbm5lY3Rl
ZChvdXRwdXQpKQ0KPiA+ICsJCXJldHVybiB0cnVlOz4gKwlmb3IgKGkgPSAwOyBpIDwgY29ubmVj
dG9yLQ0KPiA+ID5jb3VudF9tb2RlczsgaSsrKSB7DQo+ID4gKwkJZHJtTW9kZU1vZGVJbmZvICpj
b25uX21vZGUgPSAmY29ubmVjdG9yLT5tb2Rlc1tpXTsNCj4gPiArDQo+ID4gKwkJaWYgKGNvbm5f
bW9kZS0+aGRpc3BsYXkgPT0gbW9kZS0+aGRpc3BsYXkgJiYNCj4gPiArCQnCoMKgwqAgY29ubl9t
b2RlLT52ZGlzcGxheSA9PSBtb2RlLT52ZGlzcGxheSAmJg0KPiA+ICsJCcKgwqDCoCBjb25uX21v
ZGUtPnZyZWZyZXNoID09IG1vZGUtPnZyZWZyZXNoKSB7DQo+ID4gKwkJCWlndF9pbmZvKCJGb3Vu
ZCBtYXRjaGluZyBtb2RlIGZvcg0KPiA+ICVkeCVkQCVkSHogb24gJXNcbiIsDQo+ID4gKwkJCQkg
bW9kZS0+aGRpc3BsYXksIG1vZGUtPnZkaXNwbGF5LA0KPiA+IG1vZGUtPnZyZWZyZXNoLA0KPiA+
ICsJCQkJIGlndF9vdXRwdXRfbmFtZShvdXRwdXQpKTsNCj4gDQo+IEhlbGxvLA0KPiANCj4gSSB0
aGluayB0aGlzIHNob3VsZCBiZSBhIGlndF9kZWJ1ZywgSSBkb24ndCB0aGluayB0aGlzIGlzIHVz
ZWZ1bCB0bw0KPiBzZWUgDQo+IGl0IGV2ZXJ5IHRpbWUgaW4gbm9ybWFsIG9wZXJhdGlvbnMuDQo+
IA0KPiBXaXRoIG9yIHdpdGhvdXQgdGhpczoNCj4gUmV2aWV3ZWQtYnk6IExvdWlzIENoYXV2ZXQg
PGxvdWlzLmNoYXV2ZXRAYm9vdGxpbi5jb20+DQo+IA0KDQpIaSBMb3VpcywNCg0KVGhhbmtzIGZv
ciB0aGUgcmV2aWV3Lg0KT0shIEknbGwgY2hhbmdlIHRoaXMgdG8gaWd0X2RlYnVnLg0KDQpSZWdh
cmRzLA0KSmFzb24tSkggTGluDQoNCj4gVGhhbmtzLA0KPiBMb3VpcyBDaGF1dmV0DQoNCg==
