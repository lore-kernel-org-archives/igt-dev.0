Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20299C43458
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 07:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C6089711;
	Tue, 14 Jul 2026 07:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="BSDRTrus";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FJHW0OgX";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A581589711
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 07:55:42 +0000 (UTC)
X-UUID: 659366fc7f5911f1b1788b6acf885367-20260714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=LMoEpqolYkXFNCG0yVwDyC2KgqwEtIeEpgXjxRgQZ7A=; 
 b=BSDRTrusdg5P/rw8/RYAGcPdy7Dxn0ve5ss+FogXy45mfcw6Vdlqap14BApX4JjzUAF52z+82AhA022MD2cPsRvium7UD1UKpe2OpggH0yQA+E70SKuUxKI70y2ZRu/n9KT6ZbHmq9kDmADFFnW5QoUSKCuV3Z/hNTozScchHSU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:1e34851d-5bde-4a5d-8062-48c9514c3cc7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:d497b38, CLOUDID:d4401a19-ab14-4403-9336-76696324c5a8,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
 Content:-10|0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,B
 EC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 659366fc7f5911f1b1788b6acf885367-20260714
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1802439865; Tue, 14 Jul 2026 15:55:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 14 Jul 2026 15:55:34 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 14 Jul 2026 15:55:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zI4US5qQdiSAISnzQ5VUjWsMs8uN5F22/P1oUN0p5mBvMPr4A3RKEIOoTmDSv1Fp1ezORuTKAvo0nMwMWoQArxnCXcQgnQx/2RLJevYglYd6xpg4XJAaEGct/Di5V4LL6iUPWq2lAy0O6bQi1OdbpIQf2J6twlNojveOlJuanlH+menJYr3vWltG7T1obJJhQx9dPvfFgEp8BgJFZ5Ug2TIK5K4csEkWzuv3/1j/OOLmyfMzhv6xvQJYBha5XQlHZzUYvj7KM4Qnkhmxe/ZwXD8HH93I+Q/DUX4O3wa0MCswH9oI7iCBD/1l/I2V9y7ExE1UCT+VMABCY2ZdpULPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMoEpqolYkXFNCG0yVwDyC2KgqwEtIeEpgXjxRgQZ7A=;
 b=TEmAbzYYYVQ02AS372pZJ3aeMpVO7xR67lR6kVCZiU5wzG3ktRYz/g9LxYtWDYJ+mIm3l/MvNF4zT/seyHPzWahOWb8j77uW0sjDAPWVpfNO1vqZ7d0EJkEBjGn6eNNtEM9KgGIr9+dzRcQQsRUu2zGea750f9mkibYW9ivll0JacOKeIVF1LTaqU9/FpKBSTCK7zD3fe5BNDpCIOM48kG9pv9rZZRSpsJTFbbhKmHHI8PEnCNyJN6e+at/jQm+lzmu46jYY7YvYUZhaVRhPV+HR6Db61/keTMfmubxMOsdy6qPSEAnpI5M4drPKhOuZlMICTr02pujR8RVjFr26NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMoEpqolYkXFNCG0yVwDyC2KgqwEtIeEpgXjxRgQZ7A=;
 b=FJHW0OgX+DwGHY7Z6ZLU8TThJEX/AmvqRrQkZz2OvVBpOzfLfnv36u768erzDd9rVeAj98gajfqkzmLLVyCfJZxFpmAdNt1iaIWUQxLU96yDNzVSt5cdnOED5ZTNL95U33heGHS0dD5ZSIx7VBoeQViEBlfMulIfoFX0nKiQDuM=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB6490.apcprd03.prod.outlook.com (2603:1096:101:46::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 07:55:31 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 07:55:31 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "gildekel@google.com"
 <gildekel@google.com>, "navaremanasi@google.com" <navaremanasi@google.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t v3 2/2] tests/kms_setmode: Add basic-no-cpu-idle
 subtest
Thread-Topic: [PATCH i-g-t v3 2/2] tests/kms_setmode: Add basic-no-cpu-idle
 subtest
Thread-Index: AQHdEFIsH+S6qJjU50qH8oR3OMXGTLZrYPeAgAFKrAA=
Date: Tue, 14 Jul 2026 07:55:31 +0000
Message-ID: <b77c9195d446be40ef2ba7494950b08e81f3f565.camel@mediatek.com>
References: <20260710095358.2518446-1-jason-jh.lin@mediatek.com>
 <20260710095358.2518446-3-jason-jh.lin@mediatek.com>
 <20260713121159.dyctydohvvtmyrfn@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260713121159.dyctydohvvtmyrfn@kamilkon-DESK.igk.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB6490:EE_
x-ms-office365-filtering-correlation-id: a4f66291-9eed-4e66-4d2e-08dee17d4705
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|7416014|376014|1800799024|11063799006|4143699003|56012099006|921020|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: WgvmtsZkB5Y/fu2+pCOkRLxrusTL/CtE8l/hSYKQ11FiLVgSQdxNR9YP/TDdiugrgugpDX/PmiWXjC3xr8rOpgDnHd+hC7Flv5ghCrllz6/E1tkSN8DI9r74KuXvSrocxDDCtcSQj+oNVzfz2HRw3pntmzu6808Svrw4vAZ3scwPCuffBHYrjOiy2wCMXt4EzQcwTMh4mi89AmLybs7fADadTahL+AHVM8JifukybcTWnYb1O2+gh0WgIomvEm7RvbO1LUnuaI7KH7kSqv+dVh8F3TKctdsxzOw0CWOBnjypAvWkhay+XddE9rHucOCe2urtIC7Ww4kt8KXUdL8GQWbRb1Q/1xvz+HCaOHj5WD9rQj62Xp4KS/6QeJPm1ROMXYJfERZLl9fTScWYdLHsbLw9mO1dLLKJuBMqTw6XylkzQTcg8kJ7NSqyqDSoBikpFTaq0Us8lW161Ybfyy75jiV6ZNw2dEazXNA5nIhL1XgrAmSl0A1l0zac5lWdGLw6kxdmOI28scFaijV+pGz4bGFaoI9cCE249BNd6hORH+n5UaC06wkv/Od1k5dkhj4FHLCgB9jU+puDN/e25uXJkiolVY9kbaZhqvD1nRqylB/zABsgRRbr1jSXoq+7lkZ6KMW4aRr+vzX7eJ0JmAfKwgeJCLin5NugqtiO7kYIF+u1e4FgWA08cJ4caltOlnV6m65YnPCA6zPx6R/kQkpiUjE0wm/BShknWYDspvE+8g0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(921020)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bktmSDFCTUN4ZXN5cW1Bc3BuQm1iOE82SXFMQmhqb1JWMHBoZmg1NjRtNjJI?=
 =?utf-8?B?bkhuODhoSTFtQWttRlZiV25YS3J2SGdvdEkrcWdQYUVEbmZ2Q0xSTG11bXE4?=
 =?utf-8?B?MVFidU1FRUNNUHNWaTZDdTlIeEpQcWFMOGs5d1VIRlQ0b1g2S3Bma0lBQTB5?=
 =?utf-8?B?bEFPTUJnODNvdWxIU1liWEtqaGgrc3JUSGg3b0VFU0JVVEplZ1pUc0o0eXNs?=
 =?utf-8?B?OFZwOWhwblczZ2JZaXErOE9PNTBoQ3pZemZFMjQ4WE5tRGFQTUtOMTM4VG1w?=
 =?utf-8?B?c3pxVVRWQ2lZWnZndzIzNmp1dSs1SE50Ky92MTNiaUtaeGRtamRKMGQ5ZU8r?=
 =?utf-8?B?SXRHN0hXb01ZUmFPNVdVT2t4WlJ1MmE4eUdiRkgwWkFPQklxdmd2b0E2Unpr?=
 =?utf-8?B?L2RlVVduMW9TcDI1Rk9FT1drd1BZNWZJRndvTDhwdWtKMG1nLzR3emkvbjlj?=
 =?utf-8?B?T25zenlLOGhrelpoR0pmZzhqYWF3a0xsZ056L1ZPMmQ3dkFqcUw2K2lyaldU?=
 =?utf-8?B?Z25iSXpvUUpNWjQrMGFUL3pIN1VmaFJhVnpDZHRtZzZjVE9QbmtoZEVYK2Fy?=
 =?utf-8?B?dXd5ZkFldVJZaFd2REhET2RjUDdjRGRNR1dJRlkvWWRFcDA2aXB2bENIb2Rq?=
 =?utf-8?B?T3dnQVVuRWFYbW1QSHlDcDZsemhtUXFEM2xDbG5UNWE4OXZCMkV5Nm1ic0Jv?=
 =?utf-8?B?cFhsTVlGRytWNGh5WnByY285bFltWEJtZ1FRV3dLVWFMSVJ6aGwzZVZBMHp1?=
 =?utf-8?B?VDhGUFRiNVp0TytES2dBVncrTWdKRjJmWFFnNzNNWnJPaUxramQ3bDEvVWYr?=
 =?utf-8?B?cno3RjBLaXhsVzJDRUhDK1hXbzhMbUpxT2xOSVBuYkdUZmttSFpUNlRDYWM4?=
 =?utf-8?B?OVZqcVFVVUNTZXhJeVJidWF0VzNHRm81S0lDZWNtSGg5VVQyd0JMNjVYZG9H?=
 =?utf-8?B?NHRWb0hwN0w4a3NWTnU0QnUvQlR0YmVDc1cxQ1NDenNWaUZzeTdxUlBEZ3dE?=
 =?utf-8?B?QU9qMWEwS05jcjFBVjJSQnhvaU9keVI5Z1pBdVgvV1UyZjNzemd6VURoQjRp?=
 =?utf-8?B?c2ZWNHNIWlBodWpFb25ZRGZkT3JtNC81dkFWUkUyZWhaMFdJK0dkR2EyemVN?=
 =?utf-8?B?eEpCTmNENWl3NUtnTHU0U0hwczN6Ynkva0pWMVhoWHdxa1BLbXFYNUJrK0Q1?=
 =?utf-8?B?KzFQWXpVdG1XajNTYmhwRTVGQ1dOUHExU2UvSGg3ZlF4LzRyMzQrWjBjQTZY?=
 =?utf-8?B?S21rSExDSm9yOFpNSGgraHhFWjZaZys0eElraVE4WlB5ZEsxeDBTNlpCWDNV?=
 =?utf-8?B?V2xFbHNWSXlTZk1TMjNFM1FxQXBsWndVVVNydTRKUkU2UmlBcEJrc0I3K1Ex?=
 =?utf-8?B?TEM1QnBTY1JtbEdVNXp0UjhxUzBGZldqUXNvdHN6QTNXd0lGOU5OeGNmVzEx?=
 =?utf-8?B?SHhpZVArdUxiWkVuWTh5ZUxWbk5WWUpyZTc3RXJCS0Y1R1ZEbnZEaGdOVHh2?=
 =?utf-8?B?MHkzcUx2ZlpuUkx6QzM2dnROcTZkQ3MwUktPSkZJd05xbFVTYXVZZXFsMFJo?=
 =?utf-8?B?cG1pb2IzREFPdTVLWE85V3pQTlF6NjBZQ3NXUUNyYkhnQWtjUnlxMkFwMVYx?=
 =?utf-8?B?SEl3OWh5SlJ5SWtqMXR1c1JTTW5hYnI2bStIaDhjOG0xb0UxK1MwdFN0ajlY?=
 =?utf-8?B?QWh0VmpJWXppOVJkRlZXYkI5SjVQT3lXY01WR2trejRjd3E2OXZ0ci9IMi94?=
 =?utf-8?B?WVpUT2xsRXI1S1AxMHhuZStWZFJRTGZ5VUh1T0d3WTVnZzZBbXRLTERmRDFw?=
 =?utf-8?B?WXlnTUlUaFFGM2libUxkTU5WTitXeGNudlYxVVZzZmhMWjMwUStzOVVZa29a?=
 =?utf-8?B?VEZXK0pYMHRtcFhsajJma2FINTVJSUllTUNlQVM0WmpCWFRRQmlWZmFpeUw3?=
 =?utf-8?B?a2dBVzMydHdwK3lPWml6MXlTTjViMnkzMTJQbDI3ZlZOcHI2bzdVQnVYWUUw?=
 =?utf-8?B?R0ZiWTZITis2QWJEdzBvR3JBQWNDMzlFYS9ERmVVVmhGRFVrVCtrVlN5dkdX?=
 =?utf-8?B?WjNTK2pLcDk3YUtHZzFYYnlzejRod2tJWFNkY0NKWWxYQmxVRjBEWVBCeXVT?=
 =?utf-8?B?UUU5RGVJWjZ1UnVsejQ3S1ViWjdTVm5pdDlPdHYyc2I3L1VCUkpFaXdtTWgr?=
 =?utf-8?B?TDhXZ1U1N3BKeG1ieFMvSC9UdlFqYjYwY2ovRm5iZ0MwQ2RnNjE5UXNZczMz?=
 =?utf-8?B?aElvOEpVLzlGQmFDZjVOZnFvNkJTMkpJOTlzeUxIVnB6VUpmZlJNRGZEdTYz?=
 =?utf-8?B?bnhpM3FVMDZoelgvUGFORnErTGVJamcyNkh3eUtJdTFDRytJeHZ4VlhSb1o3?=
 =?utf-8?Q?VqZp1hJcdiQPTqNs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AA8137F30A8C74CBCFEB7C130417B1E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OnWSg87g7Z6NZ5J9gdOj7MqwkE9sr0d8/hf8Ihy/4wi/NOPU+vGvFfH+pV44LlwcwJ+/rqcu14IYKaR1C16ELOWOGEiQO6QojQ8jCO1mtttHZ/4JTc1PbG49vzCqo4NFrRS/CgfutpTv4TVyAnNwYepVeCinjwXaGEAqPv/KrlsdZ3LN2UjKTWx489mC7UCVFUQi/jVohEA+5JAv8l1FKW2vxJ43DXuGMqrbldSrgs7HzTpXGoXMum8ge9+L6EgL+Z82Xv7yTsfM9KIV8neK/TI0DAHfupc6u+xsMmR6z+yb6dTogqhG7r2NC9X+LA9h2izfiD1iBAnThiEzyf6TSQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f66291-9eed-4e66-4d2e-08dee17d4705
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 07:55:31.1777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aOgsqgTuORRLMbP/3Cr5UCv1C28XxarIfmo/EOKXS8rG3qaL+0pmfA6yW7V2stmH63YDDPLUjnxoSXM2ShVsTYp7/sY9dXbjFUoqnOF/Aek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6490
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

W3NuaXBdDQoNCj4gPiArDQo+ID4gKwkJaWd0X3JlcXVpcmVfZihpZ3RfcG1fZGlzYWJsZV9jcHVf
ZGVlcF9zbGVlcCgpLA0KPiA+ICsJCQnCoMKgwqDCoMKgICJQbGF0Zm9ybSBkb2VzIG5vdCBzdXBw
b3J0IENQVSBpZGxlDQo+ID4gY29udHJvbFxuIik7DQo+IA0KPiBNYXliZSByZXR1cm4gYW4gaW50
IGlkaWNhdGluZyBob3cgbWFueSBDUFVzIGVudGVyZWQgbm9uLWlkbGUNCj4gc3RhdGUuIFRoaXMg
cmVxdWlyZSBhbHNvIHNob3dzIHRoYXQgaWd0X3dhcm4oKSBpbiBsaWIgaXMgbm90DQo+IG5lZWRl
ZCwgaW1obyByZW1vdmUgYW55IGlndF9pbmZvKCkvaWd0X3dhcm4oKSBmcm9tIGEgbGliDQo+IGZ1
bmN0aW9uLg0KDQpPSywgSSdsbCBjaGFuZ2UgdGhlaXIgcmV0dXJuIHRvIGludCBhbmQgcmVtb3Zl
IGFsbCB0aGUNCmlndF9pbmZvKCkvaWd0X3dhcm4oKSBpbnNpZGUuDQoNClJlZ2FyZHMNCkphc29u
LUpIIExpbg0KDQo+IA0KPiBSZWdhcmRzLA0KPiBLYW1pbA0K
