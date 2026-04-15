Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27C6F9D0FD
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 01:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6107D10E021;
	Wed, 15 Apr 2026 01:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="tNbqLczm";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ZurqYQ7+";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA52E10E021
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 01:26:37 +0000 (UTC)
X-UUID: 2286c39e386a11f19a16598d5ca7f8ec-20260415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=aVRXu1vQrvRm5YsRVdwUs57msm5lYJz+VJVLnmPH6R8=; 
 b=tNbqLczmGwYl7UAAzGjHUPVB9YyGKMOPj7UthoT6SAP+p42ZKEZaknV92csZsk5S605suOBKEYFC/cRUeqSyBBlAmbMQ+g5nNebi5URMOENuwYay72vgKN8ZqmZ+22tL6mHl35cSyuByu/Azp0JICL3yG6XDsJ3FXVFqPu9Kihk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:27da15fa-723c-419d-b106-7dd647a38f5a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:eddcde24-cb5c-4236-a89a-9a7fb20c9bc4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2286c39e386a11f19a16598d5ca7f8ec-20260415
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2014993373; Wed, 15 Apr 2026 09:26:32 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 15 Apr 2026 09:26:30 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 15 Apr 2026 09:26:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MW/JNy0Q7f/xUBAjUKmbHWnMGGVqD06KehCcaE+766BtKIxaB+QkCgHDWjzErEmM8euBequFpq68gZj52Sk1YbAVAoYCy692vX1fuPFhSAy9A9TB8g6RfP4WTNxIFuOmJ2EeR40sbxmDnrEd51pKqfVOiuQeOK/1b89GzAQX82USYqKkbeZsrn+AbPHAGf9SLr9Jf9yWmhgobv2MRgx0r7NkASpDKKUAaCTC8pzd5NHShXxpOYHHUtSuhahO3Xgj3GKd0BK+yx6/AUy2/ARKPE7jFwCJ4vg877uA8EQA+nw3lkvSj5m8yAECyRgj8qDCbKHctTp0RdMbtf3qya7yrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVRXu1vQrvRm5YsRVdwUs57msm5lYJz+VJVLnmPH6R8=;
 b=IFlnNTmDdBnR7vDue0GNAhZUWPwsglQOLQurwkgpPlMDg+bvh5+vKk9WA6I8//3hfZ6x0IPHZeSTiN7w7PZUXGfjiJQl4WQC2+SkapldU4Fs95QF1Lfm+A7gOSir7EeagB6T4or2+MlDhuwPhW2WRvAWHUkvtzzlLhxofKl5ArrgEDO2/W+TQIpzBMMhQECEtuu0SN6XPZLHoGDBgwU4dFqfTrAvHIjXb6JbtB5SoB2XtdAlOl7t3MA4tI/IXr5M3YhH0t2Y9lLhV69L/DBR+apk+LQz6PxZuPt1mqxEJs5wVWqxROVU3+XqmTUixkRV6W/jGJqg+O24VYbHqISqoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVRXu1vQrvRm5YsRVdwUs57msm5lYJz+VJVLnmPH6R8=;
 b=ZurqYQ7+G74MwuItGXHB/2KdxVpAqeVKUc1r7qytRX8tUIC/AFzmqyKfQ4S4Or3E1dXpcFqRAu17AkwPoYBq0LMz+DRlkVCc4plHDaoJEdCtj8wLsEGZ0U07jYtmyC7vRqWVq31Yrdx84sW2lcR/bhHvWpqgJzkcyxOS92bT0cs=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB8584.apcprd03.prod.outlook.com (2603:1096:101:22e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 01:26:26 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 01:26:26 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "bhanuprakash.modem@gmail.com"
 <bhanuprakash.modem@gmail.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "fshao@chromium.org" <fshao@chromium.org>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t] tests/kms_invalid_mode: Allow clock-too-high test
 on non-Intel platforms
Thread-Topic: [PATCH i-g-t] tests/kms_invalid_mode: Allow clock-too-high test
 on non-Intel platforms
Thread-Index: AQHcy/cJ3kLsSgzP2Umw3ML9fG3ig7XeX4QAgAD2TYA=
Date: Wed, 15 Apr 2026 01:26:26 +0000
Message-ID: <2591726e756287cc6c18060f4927802a51495b80.camel@mediatek.com>
References: <20260414101108.1920755-1-jason-jh.lin@mediatek.com>
 <0399eabf55ed7aefb133376cfe307e468d646f91@intel.com>
In-Reply-To: <0399eabf55ed7aefb133376cfe307e468d646f91@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB8584:EE_
x-ms-office365-filtering-correlation-id: 4f1070a8-2726-47d6-55ea-08de9a8e031d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021|56012099003|22082099003|18002099003|18092099006;
x-microsoft-antispam-message-info: uyjYtWpY+FF8Kv8hBvxLAJ54p5YKZrTd5XxJBPvQAf6JOIlZjASThZTnpDA3Bmh61rHDPq2Afy8uczC3uZb8Lj6lWdhfD5qVZqX0rH29C9EpP64JJOvmS8jZwT2ew2U2qFKYCrJiK5QUsjserhMxJR5cjlSJ2oXxqAGEkkUu0tKMTyrvyAMCu0o6h1IrUDXODoldTid0Z8NrnH4CGu32ADSPoAnUJCVsU2ifiyDfV5HGoPrF40vqGAGr36PIhcPYXALJcNn7hjBCm5ywopgV67TwuzwHGfrfLvHabPcE/Tj8Y/An4t8KTI61zKeiTT3sI5cSZjpxGW78Z4Wj+ZhPiGIb6rRQlxRgSuI0tH9slyFbOf24Nthl7g83DVv/doLWdItuCH1BNPT43wPFCsVzZaXkZdJNcNj0OgFzdJFCjzeRN11bb8lIixLY/wXdr7Skml0SPo29I+DXS+rbNRzTpMjb9q7D19Tru/rbFTJL3fQ17Zvc0auJMAA655+jMGhTBVoQNcCDERP4aU3OJ9iD4GhP3SCha0APjMGix5qbyQgydzNH+WJscycEE/a9TNbS7FHDLFAWYPJUIBIpnaJe1FPDcU9tqIcnHKk4xAe420jbLrfTGNdiSr9D37drOPopQbzVEWOqPFzTNt7kt9cIjUirLSwIhOpdhIShUnkLLvZJxeryC2c5SssqrZSUwlp1OKIUuNVtA+HvB4EWMQ/J9/wrGIK2CUNf2RPXrVlxckdTkHd57xIyD896xGlWuXgmHBSFhosJQQM71vTdQ/KOHL7DSJ1+eXUBG7CGQASiqBA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003)(18092099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWRtTmVLa3RXK05OL1F2MXN0S1NEMCt6UTljRjlidDNraTlsN0RRelloZC9u?=
 =?utf-8?B?L20rQUNLbkpSMzdRY2EyVXpvU2ttMzcvS05CMjgvTnA0N0owYXl0TVVuS2gv?=
 =?utf-8?B?ckFsd3p4eVRGdU1vS282UEdTVEh4WHBLWUx1SUx5YmhkREV1M2hNaktxUHMx?=
 =?utf-8?B?QzdzN0tCS0hKMk41RHByNjJkdmt6MzhDQWNPaHhSbkZSZ29oWjNvckJOWm1i?=
 =?utf-8?B?MVBIVzVvT3NhKzgxNFJJUnJyVUJrak5MNEZoQ3RYckROc3hFSlRyS2tlMGoy?=
 =?utf-8?B?MC9sYWtHdERqdThuTExmTHBzSXYwbmd6Tk1qdU5HVUlRZmFGUWRCVkloeDg5?=
 =?utf-8?B?U2VTMjdGVExIV0Y2TTUzV0ZzRm4rVUR5VVRTOGRzKzdlck9rS0Y4OHJkSUNh?=
 =?utf-8?B?OVJ0UzJ5RXgxOW1mZ21XWjlaS3lYL014ckU0ZFJQL0t1VFVzd3ZkUTNwTlJW?=
 =?utf-8?B?U0pKNk5wNFMwYTZ1VE1lenlVYytOb0lyRm5YbFdxaW1nSHdEb3lackcvTHhV?=
 =?utf-8?B?Q084T1JtakZPQUlIQ3VXcXZsZmNkRU52VmdTdlJKZDNMZGhsenlPODFMSVdB?=
 =?utf-8?B?clViOHY3UUR6ckxDWThjQlo2ZDZvS1dtYnRraXVIVFJ1cXJKMzZxY0VJaS9G?=
 =?utf-8?B?Z1JPbEVQYW05bUdYZGtXSlBFQ2ZPZURxUEE3dlVIM1dJMk5tNXlCUkJhZjZP?=
 =?utf-8?B?cEFGU3doVjluRmV1dGdnQnYwS0FOajlxeHNjTHp5ZXlOOWd3U3l4STBnNDBL?=
 =?utf-8?B?aXpFeEo5d0RwVGRrYlJqVnlSRkhHY3huaE1obUhzQ2lpTEx6cWRzZ2VMUE45?=
 =?utf-8?B?REhaUkpFSXhlQll0Qmt2Kzg5OVJzZy9ZU0pFaldhNUNIc1FMbzFvSFlLU25L?=
 =?utf-8?B?TEltOW1yZ0dkVFhBenJVMGxSUzROSGNmNTc3YncwRUcyK3ljQjBrdnJvTGJ5?=
 =?utf-8?B?QmlzWktWczRUSTlnZzY3MHhoMzQxUDJIdHZ6SEFQRVJKSnllUHNFOGlSWlVy?=
 =?utf-8?B?V3ROUUliTGw2Tk9kSndCM1kyUWZXRWRRS3o0YktIcllGekljS3IzWGkxM000?=
 =?utf-8?B?Z1g4VXJLd2pTQk9WSlRKQ2JhM0FsRkU5MDRldVQvNXFPNi9ZR2xWamZJUGRB?=
 =?utf-8?B?TjkzNlU3M0l0d3ovVURKbi9qbUFiRGVYS2h5K2RmYzF6SG9HeG9IckVYNEJF?=
 =?utf-8?B?VDAwV204TFJwdkNIOWdxVXBUR2owTjdHRHNJZmlZUS9adzRyTnJxSEVjbHoz?=
 =?utf-8?B?dnpYdnFDSDR6TlVTTkdoVDNmU2NScVgzaXB6bCt3UHpkUjM3dGJ6dVl5V2NG?=
 =?utf-8?B?dXdnZ0lJQUhKYWtubFpxWWNzS0JiK1R4UC92Yk5ZYk43VUlxT0xwU0cyS2ZK?=
 =?utf-8?B?R3g1K2d4alVFK1U4MmVJWWFMbXlJQU5oS2ppUEY0NnZFYjF5b3B6Q25rVW5n?=
 =?utf-8?B?MWVXNTByQUh4T1RIVzJxMmtmS3djRXhPZVRTZTEwRnNDWk9mZnVSb3pqQmFl?=
 =?utf-8?B?UHVBenRncUFNZXRBN2JwNWtNUURBRU9hVlVNNlV4TVM0ZkgyN3NyREtCRVMv?=
 =?utf-8?B?ZlNKZDJDNVZYa09RRy8relZ5SDlodEswOFQ1c3A0Zmo4N2g5dXNkc0VCOGNz?=
 =?utf-8?B?YmNCQnQvT1BVRG00b0NRVG1GM1lGSEl4YU9uQWJHN1RWc2crMEFxeDVJbXlO?=
 =?utf-8?B?WUg4NTZlZE8vZXAxMy8zb0JFN2syQnRoVDk0YXhOa3FkcE9wNG9uekVYL2Fv?=
 =?utf-8?B?bjJTcS9HMjN2Mm1lR3hpYzA0SS9id1Zybmg0b0pSeVY2bjQ1cGtyZjRoOEV1?=
 =?utf-8?B?eGczcFEwSE1VVHlDSzVKdTJDVTlPMDJZSlRab2ZZRWpZSytxWlBaaTAxNnhn?=
 =?utf-8?B?YTQ1TUlSOFhqNVV0bG5LWExZd21uSVR3emk2TG5jSWJodnlqOUJTbUxDeENm?=
 =?utf-8?B?MDQwdXFaalZISlFjbnlzQnJObFZYVjI0YXdyRW5CdXk5bXJJQm9kQjdRM1Jt?=
 =?utf-8?B?R0kwakhMM1p5TkVEazM0UWxiWjVVMklHc1Zqd0ZXcXJUazkvdVQ5TDBuaTd4?=
 =?utf-8?B?S0UwYzZ3RE0zRS9lSTNSNyt3elAyc0RIVDV1QlVrb0JyblI3b1BnRUsweEFE?=
 =?utf-8?B?aVo4Mzl5N0FsWC9ZcERwT1RTcGJYaVkxVUdFRFBLcUw2RmZLQTVwbktNTzds?=
 =?utf-8?B?ODd0UTQzc2FqRmZ1MFJOUlJudDA1Q1RjMWhSVHMvb2Fyak9FSGU3U2dvdStK?=
 =?utf-8?B?YlQrUXhxOGh6ZWYwR3J2RzhjeFVhZzd4d3B4MUtScGRxTnIvMFRZZUgwZnBa?=
 =?utf-8?B?RXZ5V3ZuazNmOE16dGtScm9KaGZXSVMydTlhVkxkcE56dXRVZ25jQWNIdTFp?=
 =?utf-8?Q?1Ud81q7TtYpyaQ18=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <699174DD4F7AE547A5B0E41623C3CA7F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: s6wpjuQSkm234TCY7rU/3ox5GjFf2CGcM63y2qpcwLPNJp4VBPlMmdomYkm3OtPNV772kMEOz1rxBiMHHcIxUk966OaEbTH49eitztkhK+Sx9BABfXrk7XfQlyOj1lma1E0rXONEAojokIPR035NC1pKfU947RUJi6dN3tmMiAKP1UZOEub3AsYusL2STveGrSgcVOVzQ0ydXFJKDRgifL5RIGRoZXbAUMSyZuML9prKBQ/dEyrDXK8p4TNhLbRyuPWM72FaGKQlDf4aATkKotHg8bSDZ5Ek3WU5cY2MwAH55fWK4+oeA0dYiPbpxKyWuao92mfDRF9VDEpgySFogQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1070a8-2726-47d6-55ea-08de9a8e031d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 01:26:26.0957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hnxHrT1198FayOaLth7SudBxuOUAotXY8ZGicqwUcteghTbu5tPIFmNEcKrvy8YGNpXlgjOL/ntxLsUTybZsFpvUi2BhHb0sBmkpurDASw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8584
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

SGkgSmFuaSwNCg0KVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiENCiAgDQpPbiBUdWUsIDIwMjYt
MDQtMTQgYXQgMTM6NDQgKzAzMDAsIEphbmkgTmlrdWxhIHdyb3RlOg0KPiBPbiBUdWUsIDE0IEFw
ciAyMDI2LCBKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+IHdyb3RlOg0K
PiA+IFRoZSBjbG9jay10b28taGlnaCBzdWJ0ZXN0IHdhcyBiZWluZyBza2lwcGVkIG9uIG5vbi1J
bnRlbCBwbGF0Zm9ybXMNCj4gPiBiZWNhdXNlIGlndF9nZXRfbWF4X2RvdGNsb2NrKCkgcmV0dXJu
cyAwIHdoZW4gcmVhZGluZyBmcm9tDQo+ID4gSW50ZWwtc3BlY2lmaWMgZGVidWdmcyBmYWlscy4N
Cj4gPiANCj4gPiBUaGlzIGNoYW5nZSBhbGxvd3MgdGhlIHRlc3QgdG8gcnVuIG9uIGFsbCBwbGF0
Zm9ybXMgYnk6DQo+ID4gLSBVc2luZyBhIGNsZWFybHkgaW52YWxpZCBjbG9jayB2YWx1ZSAoMTAg
R0h6KSB3aGVuIG1heF9kb3RjbG9jayBpcw0KPiA+IMKgIHVuYXZhaWxhYmxlLCB3aGljaCBhbnkg
cmVhc29uYWJsZSBkcml2ZXIgc2hvdWxkIHJlamVjdA0KPiA+IC0gUmVzdHJpY3RpbmcgYmlnam9p
bmVyL3VsdHJham9pbmVyIGxvZ2ljIHRvIEludGVsIGRldmljZXMgb25seQ0KPiA+IA0KPiA+IFRo
aXMgcHJldmVudHMgdGhlIHRlc3QgZnJvbSBiZWluZyBtYXJrZWQgYXMgSUdOT1JFRC9TS0lQIG9u
IG5vbi0NCj4gPiBJbnRlbA0KPiA+IHBsYXRmb3JtcyB3aGlsZSBtYWludGFpbmluZyB0aGUgb3Jp
Z2luYWwgdGVzdCBpbnRlbnQgb2YgdmVyaWZ5aW5nDQo+ID4gdGhhdA0KPiA+IGRyaXZlcnMgcHJv
cGVybHkgcmVqZWN0IG1vZGVzIHdpdGggZXhjZXNzaXZlbHkgaGlnaCBjbG9jayByYXRlcy4NCj4g
PiANCj4gPiBUZXN0ZWQgb24gTVRLIHBsYXRmb3JtcyB3aGVyZSB0aGUgdGVzdCBub3cgcHJvcGVy
bHkgZXhlY3V0ZXMgYW5kDQo+ID4gdmVyaWZpZXMgaW52YWxpZCBjbG9jayB2YWxpZGF0aW9uLg0K
PiANCj4gSSB0aGluayBvdmVyYWxsIHdlJ2xsIG5lZWQgYSBmcmFtZXdvcmsgdG8gYXNrIHBsYXRm
b3JtL2RldmljZQ0KPiBzcGVjaWZpYw0KPiB0aGluZ3MgaW5zdGVhZCBvZiBwb3J0cmF5aW5nIHRo
ZSBzZXJ2aWNlcyBhcyBnZW5lcmljLCBsaWtlDQo+IGlndF9nZXRfbWF4X2RvdGNsb2NrKCkuDQo+
IA0KDQpBcyBmb3IgYSBtb3JlIGdlbmVyYWwgcGxhdGZvcm0vZGV2aWNlLXNwZWNpZmljIHF1ZXJ5
IGZyYW1ld29yaywNCkkgYWdyZWUgdGhhdCB3b3VsZCBiZSBiZW5lZmljaWFsIGZvciBicm9hZGVy
IGlndCBkZXZlbG9wbWVudCwNCmFuZCBjb3VsZCBiZSBpbXBsZW1lbnRlZCBpbiB0aGUgZnV0dXJl
Lg0KDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5A
bWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IMKgdGVzdHMva21zX2ludmFsaWRfbW9kZS5jIHwg
MzggKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ID4gLS0NCj4gPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2ludmFsaWRfbW9kZS5jIGIvdGVzdHMva21zX2ludmFs
aWRfbW9kZS5jDQo+ID4gaW5kZXggNWVkZmZiNjQ5ZWY0Li4xOGQ3OWU1OWM3MzYgMTAwNjQ0DQo+
ID4gLS0tIGEvdGVzdHMva21zX2ludmFsaWRfbW9kZS5jDQo+ID4gKysrIGIvdGVzdHMva21zX2lu
dmFsaWRfbW9kZS5jDQo+ID4gQEAgLTEyNiw3ICsxMjYsMTMgQEAgYWRqdXN0X21vZGVfY2xvY2tf
dG9vX2hpZ2goZGF0YV90ICpkYXRhLA0KPiA+IGRybU1vZGVNb2RlSW5mb1B0ciBtb2RlKQ0KPiA+
IMKgew0KPiA+IMKgCWludCBtYXhfZG90Y2xvY2sgPSBkYXRhLT5tYXhfZG90Y2xvY2s7DQo+ID4g
wqANCj4gPiAtCWlndF9yZXF1aXJlKG1heF9kb3RjbG9jayAhPSAwKTsNCj4gPiArCS8qDQo+ID4g
KwkgKiBJZiBtYXhfZG90Y2xvY2sgaXMgdW5hdmFpbGFibGUgKGUuZy4sIG5vbi1JbnRlbA0KPiA+
IHBsYXRmb3JtcyksDQo+ID4gKwkgKiB1c2UgYW4gb2J2aW91c2x5IGludmFsaWQgdmFsdWUgdGhh
dCBhbnkgZHJpdmVyIHNob3VsZA0KPiA+IHJlamVjdC4NCj4gPiArCSAqIDEwIEdIeiBpcyB3ZWxs
IGJleW9uZCBhbnkgcmVhc29uYWJsZSBoYXJkd2FyZQ0KPiA+IGNhcGFiaWxpdHkuDQo+ID4gKwkg
Ki8NCj4gPiArCWlmIChtYXhfZG90Y2xvY2sgPT0gMCkNCj4gPiArCQltYXhfZG90Y2xvY2sgPSAx
MDAwMDAwMDvCoCAvKiAxMCBHSHogaW4ga0h6ICovDQo+IA0KPiBOb3QgYSBmYW4gb2YgdXNpbmcg
bWFnaWMgbnVtYmVycyBsaWtlIHRoaXMuDQo+IA0KPiBQZXJoYXBzDQo+IA0KPiAJaWYgKCFtYXhf
ZG90Y2xvY2spIHsNCj4gCQltb2RlLT5jbG9jayA9IC0xOw0KPiAJCXJldHVybjsNCj4gCX0NCj4g
DQo+IHdvdWxkIGJlIGxlc3MgbWFnaWM/DQo+IA0KDQpGb3IgdGhpcyBwYXJ0aWN1bGFyIHRlc3Qs
IHNpbmNlIHRoZSBpbnRlbnRpb24gaXMgdG8gYWx3YXlzIHN1cHBseSBhbg0Kb2J2aW91c2x5IGlu
dmFsaWQgY2xvY2sgdmFsdWUgdG8gZW5zdXJlIHByb3BlciBkcml2ZXIgdmFsaWRhdGlvbiwNCkkg
d2lsbCBzZXQgbW9kZS0+Y2xvY2sgPSAtMSBpbiBjYXNlIG1heF9kb3RjbG9jayBpcyB1bmF2YWls
YWJsZSwNCmFzIHlvdSBwcm9wb3NlZC4NCg0KVGhpcyBhdm9pZHMgbWFnaWMgbnVtYmVycyBhbmQg
a2VlcHMgdGhlIG9yaWdpbmFsIGxvZ2ljIGZvciBJbnRlbA0KcGxhdGZvcm1zLCBzbyB0aGVyZSBz
aG91bGQgYmUgbm8gcmVncmVzc2lvbiBvbiBwcmV2aW91c2x5IHRlc3RlZA0Kc3lzdGVtcy4NCg0K
SSdsbCBzZW5kIGEgbmV3IHJldmlzaW9uIHdpdGggdGhlIGNoYW5nZS4NCg0KUmVnYXJkcywNCkph
c29uLUpIIExpbg0KDQo=
