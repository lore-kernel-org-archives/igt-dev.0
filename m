Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FE2CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 17:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822A810E292;
	Wed, 27 May 2026 17:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="jhJk76Tj";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Rr9gun5n";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453CF10E292
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 17:04:51 +0000 (UTC)
X-UUID: 27d910e059ee11f18dc8c9802ae25ab1-20260528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=WsZNyMDh7v33ZOO3hmb3x9I8ZoJqCWX1AXYgR4t2ki0=; 
 b=jhJk76TjPI9xFU7DAWx6BIxQPZ/PZ1LATI1lvCmlT386yTaXD2PpFVkqRekWkuLF6jYovIp1TWlnKF3ROd3gLRyeSJ0SeZJvZPAyBl5b1/VohjYllD34nGkwpC4NOT4fHoHsOycn/T9vDmNGILWfkIscP9YQb9sE6Pun2PkKFds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15, REQID:98d828a2-a9ef-45ef-baab-96f56b5eac13, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e276073, CLOUDID:2cb432a9-fbb9-4d7d-b284-0fb0c0327417,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|136|836|865|
 888|898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:ni
 l,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:
 0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 27d910e059ee11f18dc8c9802ae25ab1-20260528
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 523092703; Thu, 28 May 2026 01:04:43 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 28 May 2026 01:04:41 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 28 May 2026 01:04:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JO/AW+w2Et9XoaMkZvFuMjReg2zzhDt2C3oQCFdmeC5+u7Qv8q6Z38p+7oOXaY5knNXEC895Ttccb/2ltK2faj+NlIdWFZgShSPw1tlKbwRFy9mISgDgxMU7SVMpwTfDcAzVyIcIiWzCr8nAnUmSp2bKeOXOE/VvxEg7PNS7P0GFqG3XYqU1UevmZLeICPepTSWh2/UCrtnjUtcFR9mwEpbR2YK/eY4vBkU7U59mVCsrB3HyzGy9EJYvAH8lqdmVYcTVpCznCM8z+leDpLany+M9jOT1VIayeu+cKeg+wADIEr/41Xja/mjGbgopt3TP2bYxtDT8rJMdbUs5jyJiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsZNyMDh7v33ZOO3hmb3x9I8ZoJqCWX1AXYgR4t2ki0=;
 b=ovN+3WumrH7DjS30vXGRZZ/EtjOvzKHh5EXEECt5G1zwbmhnQXA0YJEbfCF/c0Vegyu5wp4FolM4+qSY+oFxOyaUNOFzUlqhod01ZHl0rpiPSCJDy40MgUHD0aO4LlW4DJvDAwuQA8sj/SJnZFKbkHBNYATu27Wp02jh/4HJYC3yRJ2vuaWsThcyXMVJhiB2M3zbZLZMzjOWkiDpSFVptzqKlRZ8qU93tY2eWMotF4cCGLkniOr7pqIT9Qi42BD16I5Yys8R0UYXdkZ/jZ0uH3am7OscLDOkZEa/hlubv+I/sw4tzdcpzTsx0Qp4u7lwzPQ4qcVmKF7Yj463T0Xx5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsZNyMDh7v33ZOO3hmb3x9I8ZoJqCWX1AXYgR4t2ki0=;
 b=Rr9gun5nNjCGBtQRLlcT2DsSNY7uPg63355lHqohuwQ489VqVbuKiup8TSvxQSX1fWptb6pAYSJ593jXnq9zTk95tfVF9Ne7gHvyNpgCjtIoP3R7mb/LRbWBucJ5E+5VF6DWV2dMhRog9s6yWJD3R88em/ns7uRa8i2Tq51Ah78=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by OSQPR03MB8434.apcprd03.prod.outlook.com (2603:1096:604:27e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.4; Wed, 27 May 2026
 17:04:36 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:04:36 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "suresh.kumar.kurmi@intel.com" <suresh.kumar.kurmi@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>, "navaremanasi@google.com"
 <navaremanasi@google.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>, "fshao@chromium.org"
 <fshao@chromium.org>, "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Thread-Topic: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Thread-Index: AQHcyNH2YxjB3EtuVUiEvZIHanYs6bXYFx4AgAXP+QCAAK+oAIABBE+AgBc0A4CACVwMAIAhKO8AgADJwACAAEZZgA==
Date: Wed, 27 May 2026 17:04:36 +0000
Message-ID: <986ffe07650b69ac71c36b10bb6d5e18aa82106f.camel@mediatek.com>
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
 <adjQJE8Ok5K_sNuc@intel.com>
 <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
 <ad5De-s-yxyyTt7s@intel.com>
 <73567dcf64c48d1e02206839ce589809b1366d58.camel@mediatek.com>
 <CAMNLLoSF9xLz=2pUwcTULURdxZDn+NR1+Y-oGHBaOsre3Uz-cw@mail.gmail.com>
 <CAMNLLoSDZ5mGALP=vwuL245R+yZWf+adpCD3cFyeqv9k1bKzAw@mail.gmail.com>
 <CAMNLLoSNXHyLS7gftj4ofMFknnhP-tdKoYjG32W3j3kb4DZO2A@mail.gmail.com>
 <61f912e0d6a934afac8e2e978dae27314d27a23a@intel.com>
In-Reply-To: <61f912e0d6a934afac8e2e978dae27314d27a23a@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|OSQPR03MB8434:EE_
x-ms-office365-filtering-correlation-id: 90cb5bac-9d7a-4386-b569-08debc1207dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021|18002099003|22082099003|6133799003|3023799007|11063799006|5023799004|4143699003|56012099006;
x-microsoft-antispam-message-info: /vpgO3S2Mg5Xu9cyukq8RvoZ2No/vEs4wuIE7aixPXahOITW276pO2ztHsqY+agkNf6GWrRUoTNVRtR/V7lTS72NKi5fCpajbfGtKOFcTBts4LyunMpwgeJcsdQI35ga1ljdTpQIXLsg8CFyF970SYPrsEmLY8oj/mxTp/rmYOTL0vgshy9UzllNIQorz6wr0WwffWltX3AJZtwYTCx6jFd+UV+MTZ51XCen6pvcfRMwVUCpMTzlKhTEQZGamTWmRVweLei/2PGm64tYq39SGNsSSJMZyjCi0TfuQm1E0OKTqBIEl0gvk92sy9vsrR5u12pMZnxh4onf0I920S3kgR34ZbAuZjFdnFv9VlzRK8PB1zB267jX8sMznW4zTdY8LrrrutwPjVxIgijAJxJejnyD3kUp1CG9+bxrLSnXU8pj2WAK1V9Rzu3OVr62f0PUvbS0vGp8mBJk8wXblYFesOLKkj2xk+Yfon6PlgGU1zKQRgFUC6rHfzMQJL5OpoZx31YWC65WrXQDhFoMoThRKZ7wH49Neyk2vm6mk8LbmPWd1wX6yL6tI+jUAWXyTGvGAlWazIuSeqPALGqLghpfPa7kKrYCtY1mAQcSP47rebHEbQnxVL5xkTnqQyI00je8WfXjzc1Aor5SKZ5Bdrk607OGIOJJoBMdHO9K+4otdVqgz+rXM1vPwUzwBS89KoHoTfSq5pj8sZ+RQQoeqt6dbpXj2kKfb1B8uwweaE3TJRAOK3itfKvPRps2UO8IOSXS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(18002099003)(22082099003)(6133799003)(3023799007)(11063799006)(5023799004)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFhmcENVM0NiQm9HSUVXRjhuYWNhSzV1WVhiYldpQjZNMjFTcGNnamFmTEdG?=
 =?utf-8?B?czB4aHpWR2FQT2tuNFJVbkg1MUp2dThBakFHKytPUDZwS3FaVmtSTkY4S1Ix?=
 =?utf-8?B?Ky9IdWk3S1BRNk5rUTF1M1k4Y2pyTFJaMU9HTFo1MUw3bVFVbDZaT09TY0g4?=
 =?utf-8?B?WVVXM1lzYWhQZzBCQUtjTnVVREZIVEI0eDNyeTdCOFZwZEVFa0ZJa3A2aVh6?=
 =?utf-8?B?ekhJVFBzSjZjL1gxRWNEckxBUGdPN1pPQTM3RmtvYUZIL01namhzbHpjdFgx?=
 =?utf-8?B?TkJQTVh2THZEVFVUZysydEIxemlmRE5EZmxwZWxnM2taRi9rN1FSZTFDdWUv?=
 =?utf-8?B?cmhOck9Pa2hTQUx1SjIyZzc0TEYycXZiTUp5VndGT3VBcVY5UU4zaUpuRXNY?=
 =?utf-8?B?KzIxd0IwVXg1azdBTng0b08vMEVxTUNzdHBVd2FKcmZxVlF0SEVnTG5JV3hx?=
 =?utf-8?B?NVlmczJSa2I3ZURIeVNEYXdQVnUwb09iVEhjUE8vT0t0RUpobHhwdjNTMHRz?=
 =?utf-8?B?VTVGVHR2MElsNm9Vbkl6TmwyZDBIdGhueVVSMUhtTEZTazdneHgxdXJ1RDFL?=
 =?utf-8?B?WTAyK0x4N0NreG54YnZEaWZCbXg5YlEwNi96eW9sajRVR0o4TEZVMjE0UVZT?=
 =?utf-8?B?ZUtKWTVraGZGTWZ0QW14b0tRcXBOUUU5aVdFaXY4U3VUWnUzR3AzZUpEa01j?=
 =?utf-8?B?M1BkODBvVGtPL0JOL09yNW5tdWxZakI5YW91ZVFEQ09iU2pDRGc4VXRYeUxO?=
 =?utf-8?B?M0VReUFkMmdITTZBdHdIQmFpKzQvdUJaVEdqTVVTUWh2bWlzOExxV2JSeEsx?=
 =?utf-8?B?amI4aEo5WW4wa1BYczhpMlo0L1MwNUs3SGM5eE02SkNyL01vZFZoaDcweFhn?=
 =?utf-8?B?K25kL1YxUGlPRDJzVXlXeTFOeGN3S2hRU2NVYW5td0p5Q0RraVFSQkNoWVpD?=
 =?utf-8?B?d0M2VFp4STR6REdwWmJkRWlaSU5TRlQ3ci8vemFjeFN2UDlraXFJMkFpSnFl?=
 =?utf-8?B?TUtPT1FNdTRJVklyUUlPdXZMa3JWVU9IV1hrSS93L0l3a0QyeWFQaDJWRHhB?=
 =?utf-8?B?a21QQkpzNm1jQ2x4TUJOOWNFNVdpYmQ1WWw4SGZWVkpkOVEzd25aQVF5Yit6?=
 =?utf-8?B?cUpCRmsyZ1F1bFhKNGl3cjNxVVJQUjhib1pwazYxeE5LSVcyT1lZL0J4dGxs?=
 =?utf-8?B?cmZxb2FxdTZjaHBaNTBhbWpUZ1hmMFNEaFhJaU54RllqeCtsS3pXVXRockRn?=
 =?utf-8?B?RFZ3ejdOTzBjdi9zb21VVU05TFlncjIzdEh2RG05cDVLTGZ1dG4yODM2V3Ba?=
 =?utf-8?B?VE5OV1JtTitMK2NaV2FQbHdxZEZJcFBsaTBVN1VtUHRpTzBYbXQxZmlmMmtx?=
 =?utf-8?B?M2NpRzFyVzJBanNla2ZBOEMva2c4aGpVaXNGalIxQTBNVEcxVG91OXRZWGVs?=
 =?utf-8?B?dmp6WUk1TFZvc0ZlSjN5UGFhcm43VXBZbE8zM21XK0hUdkNxSFhWaUZVQ2wz?=
 =?utf-8?B?dDl6d3I5VnRLQ1dFNEV0ZlJnVFlad2hUTHJMYkdrSE9zcnpLejE2NSt6L0or?=
 =?utf-8?B?QlM3bzl2ZDFrVXAzcXVEa1BBekthbUc1YVNPcDZCTWtxR1MrazNrSjVDZDVC?=
 =?utf-8?B?dm9WNkI5dCsvY21YSzl3UFgwMUZuQURTUmRwcjNpbkF3azdDK0dsZDBKVW1Q?=
 =?utf-8?B?ZEVERjVwejlhZGJ1Q3FCS0NLOFFNeGxqa2w1b240TkdtcEUzMk9IbnhDbTNC?=
 =?utf-8?B?Tmt2OE9DYitwQ1d5c3NlR20rUkNpbkJWY0VCWUNhdU10YnpBUDZsR1NUVWY1?=
 =?utf-8?B?eGl2cVExR0VQTHNxaTdBcW94Vkh3RUVZNU9uTzJ3RnI5RkFDRnlmSlR4amJX?=
 =?utf-8?B?bkc4SXMvZzV3MUNnSlpxOTVBajUxOTIzaldremZJY1hzdWIvMSt4elBWWk9i?=
 =?utf-8?B?VkxZUHlUazhuMkpHSDFUZjB4V1M1ZFJVOHUvQkxKMWtOakpEekdmTVRnOVV2?=
 =?utf-8?B?QjBxcHBnWGNxV2RPNHJ3SzBmYnhhQ1hRUElPeEVYK2VhVi9YalBMT1k3b2NM?=
 =?utf-8?B?T1g5dGFWd3hPQWg3eVZZdk00emR3dzVrZlJTRGh5QjNNQkQwTHVtZi9TYkVO?=
 =?utf-8?B?Y1IyTkF6MTJBUzFjcnQrNlBFckVTL05CRUg2UmlqSGdYaEpEbGhhTXIvaVJi?=
 =?utf-8?B?S1E0UUNVT25JVmpoTVBhQzNNNDhTMlF4UitDeFB5SndnZ1B3Rm5GTnBrL3Nk?=
 =?utf-8?B?eGxBRExEeDFia1h6Ykk0SVFveU1SNGpQREFQNEV6OVF3bytaQm9FMktoTkVr?=
 =?utf-8?B?OCtXT0J1MXdTUkpOelhWdVlXWko1Zkk0a2wwNm9wd1lBUHV0NDdEeDZsVzMv?=
 =?utf-8?Q?yEl/y8cEmGBteFns=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9C5B85D08C9874EB483FCC4E2C92045@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QXMp8r/FwrqutJJeGnrkC7vtbnhuvvBBa3oqTVgN4B2PYeBf5bvoEEyWjrphuuXuFGuAc+OCCPzilcwjBT5kGFbZX13rH4sGo0us3WGWqyrW7HkadblzYyQ6oFg1LXXkrWnl/E4BIkYPLl9vjaaNlQygahaeyQVU6iF5Y6H+8gVUPhdeignfAgTeLTLJnHS83EFW5NQV3lj0A7u08U6WK78qV+7WNSW5k25be0ths2RwZ8qjRjoHCV0mcp2RMBo8Nm9w4T7/gHUJ6jbtULRP9meRw3m/eJUgJZXT7olJW0T5/mfohP2bIKWzGGaLFgAFXIaatUd0lSvLO7c3CsmU8Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cb5bac-9d7a-4386-b569-08debc1207dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 17:04:36.0449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BGz+UtoLma03GydpuiGJI7ARIYxmQsFnhR8mNacVP3SwvHFg4UyQMCAfoSAh1PVem0h0pn1IATrI4oAHSQXGUlHTUzGV1mSXljUzo9rYIIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8434
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

T24gV2VkLCAyMDI2LTA1LTI3IGF0IDE1OjUyICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gVHVlLCAyNiBNYXkgMjAyNiwgTWFuYXNpIE5hdmFyZSA8bmF2YXJlbWFuYXNpQGdvb2dsZS5j
b20+IHdyb3RlOg0KPiA+IEhpIEBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPiBAS2FydGhpayBCIFMNCj4gPiA8a2FydGhpay5iLnNAaW50ZWwuY29tPsKgIEBL
dXJtaSwgU3VyZXNoIEt1bWFyDQo+ID4gPHN1cmVzaC5rdW1hci5rdXJtaUBpbnRlbC5jb20+DQo+
ID4gwqAsDQo+ID4gDQo+ID4gQ291bGQgd2UgZ2V0IHNvbWUgZmVlZGJhY2sgb24gdGhpcyB1cHN0
cmVhbSBkaXNjdXNzaW9uLCBWaWxsZSBoYXMNCj4gPiBzdWdnZXN0ZWQNCj4gPiB0byB1c2UgdGhl
IGZyYW1lIGNvdW50ZXIgaW5zdGVhZCBvZiBhZGRpbmcgYW4gZXh0cmEgVmJsYW5rIHdhaXQuDQo+
ID4gSG93ZXZlciBzaW5jZSBNVEsgaGFyZHdhcmUgZG9lcyBub3QgaGF2ZSBhIHN1cHBvcnQgZm9y
IHRoZSBmcmFtZQ0KPiA+IGNvdW50ZXIsDQo+ID4gdGhpcyBwYXRjaCBhZGRzIGFuIGV4dHJhIHZi
bGFuayB3YWl0IGJlZm9yZSBncmFiYmluZyBDUkMgb25seSBmb3INCj4gPiBNVEsgaHcuDQo+ID4g
V2UgbmVlZCB0aGlzIGNoYW5nZSB0byBnZXQgdGhlIHRlc3QgcGFzc2luZyBvbiBNVEsgSFcgYW5k
IHdvdWxkDQo+ID4gYXBwcmVjaWF0ZSB5b3VyIGZlZWRiYWNrIGFuZCBJbnRlbCdzIGhlbHANCj4g
PiBpbiBnZXR0aW5nIHRoaXMgbGFuZGVkLg0KPiA+IA0KPiA+IEBKYXNvbi1KSCBMaW4gPGphc29u
LWpoLmxpbkBtZWRpYXRlay5jb20+wqAgaGFzIHByb3ZpZGVkIHRoZQ0KPiA+IGp1c3RpZmljYXRp
b24NCj4gPiBvbiB3aHkgVmlsbGUncyBhcHByb2FjaCB3aWxsIG5vdCB3b3JrIGZvciBNVEsgSFcu
DQo+IA0KPiBOb3Qgc3VyZSB3aHkgdGhlIGRyaXZlciBjb3VsZG4ndCBkbyB0aGUgdmJsYW5rIHdh
aXRzIGl0c2VsZiBiZWZvcmUNCj4gZXhwb3NpbmcgdGhlIENSQ3MgdG8gdGhlIHVzZXJzcGFjZS4g
TWF5YmUgSSdtIG1pc3Npbmcgc29tZXRoaW5nLg0KPiANCj4gQW5kIHRoYXQgcmVhbGx5IG1ha2Vz
IGl0IGEgbm9uLXVwc3RyZWFtIGRpc2N1c3Npb24sIGJlY2F1c2UgdGhlDQo+IHVwc3RyZWFtDQo+
IE1lZGlhdGVrIGRyaXZlciBkb2Vzbid0IGhhdmUgYSBDUkMgaW1wbGVtZW50YXRpb24uDQo+IA0K
PiANCj4gQlIsDQo+IEphbmkuDQo+IA0KDQpIaSBKYW5pLA0KDQpUaGFuayB5b3UgZm9yIHRha2lu
ZyBhIGxvb2sgYXQgdGhpcyBkaXNjdXNzaW9uLg0KDQpZb3UgcmFpc2UgYSB2YWxpZCBwb2ludCDi
gJQgaGF2aW5nIHRoZSBkcml2ZXIgaGFuZGxlIHRoaW5ncyBpbnRlcm5hbGx5DQppcyBpbmRlZWQg
dGhlIGNsZWFuZXIgYXBwcm9hY2guIEhvd2V2ZXIsIHdlIHdvdWxkIGxpa2UgdG8gY2xhcmlmeQ0K
d2h5IHRoaXMgaXMgbm90IHN0cmFpZ2h0Zm9yd2FyZCBmb3IgTVRLIGhhcmR3YXJlLg0KDQpVbmxp
a2UgSW50ZWwsIE1USyBoYXJkd2FyZSBkb2VzIG5vdCBoYXZlIGEgSFcgZnJhbWUgY291bnRlcg0K
cmVnaXN0ZXIsIHdoaWNoIG1lYW5zIHRoZSBkcml2ZXIgY2Fubm90IHJlbGlhYmx5IGFzc29jaWF0
ZSBlYWNoIENSQw0KZW50cnkgd2l0aCB0aGUgY29ycmVjdCBmcmFtZSBudW1iZXIgd2hlbiBjYWxs
aW5nDQpkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KCkuIEEgc29mdHdhcmUgZnJhbWUgY291bnRlciB3
b3VsZCBub3QgaGVscA0KaGVyZSBlaXRoZXIsIGJlY2F1c2UgdGhlIE1USyBkcml2ZXIgY2FsbHMg
ZHJtX2NydGNfYWRkX2NyY19lbnRyeSgpDQpvbiBldmVyeSBWYmxhbmssIGJ1dCB0aGUgbGF0ZW5j
eSBiZXR3ZWVuIGF0b21pY19jb21taXQoKSBhbmQgdGhlDQpjb3JyZWN0IENSQyBiZWNvbWluZyBh
dmFpbGFibGUgaXMgdmFyaWFibGUgKDF+MiB2YmxhbmtzKSBkZXBlbmRpbmcNCm9uIGFzeW5jaHJv
bm91cyBDTURRIGV4ZWN1dGlvbiB0aW1pbmcuDQoNCkl0IGlzIGFsc28gd29ydGggbm90aW5nIHRo
YXQgaW4gTVRLJ3MgRFJNIGRyaXZlciwgdGhlIHBhZ2UgZmxpcA0KY29tcGxldGlvbiBldmVudCBp
cyBmaXJlZCBpbiB0aGUgQ01EUSBjYWxsYmFjayAoaS5lLg0KZHJtX2NydGNfc2VuZF92Ymxhbmtf
ZXZlbnQoKSksIHdoaWNoIGlzIG9ubHkgY2FsbGVkIHdoZW4gdGhlIEhXDQpjb25maWd1cmF0aW9u
IGFjdHVhbGx5IHRha2VzIGVmZmVjdC4gSG93ZXZlciwgdGhpcyBJR1QgdGVzdCBkb2VzIG5vdA0K
d2FpdCBmb3IgdGhlIHBhZ2UgZmxpcCBldmVudCBiZWZvcmUgY2FwdHVyaW5nIHRoZSBDUkMg4oCU
IGl0IGNhcHR1cmVzDQp0aGUgQ1JDIGRpcmVjdGx5IG9uIGV2ZXJ5IFZibGFuay4NCg0KQXMgaWxs
dXN0cmF0ZWQgYmVsb3csIGV2ZW4gaWYgV2FpdFBhZ2VGbGlwKCkgd2VyZSB1c2VkLCB0aGUgY29y
cmVjdMKgDQpDUkPCoGZvciBNVEsgd291bGQgc3RpbGwgb25seSBiZSBhdmFpbGFibGUgb25lIGFk
ZGl0aW9uYWwgVmJsYW5rIGFmdGVyDQp0aGUgcGFnZSBmbGlwIGV2ZW50IGlzIHJlY2VpdmVkOg0K
DQphdG9taWNfY29tbWl0KCkNCiAgICB8DQogICAgdg0KICBFT0YgTiAtPiBDTURRIGNhbGxiYWNr
DQogICAgICAgIC0+IEhXIGNvbmZpZyB0YWtlcyBlZmZlY3QNCiAgICAgICAgLT4gZHJtX2NydGNf
c2VuZF92YmxhbmtfZXZlbnQoKSAtPiBwYWdlIGZsaXAgZXZlbnQgZmlyZWQNCg0KICBWYmxhbmsg
TiAtPiBkcm1fY3J0Y19oYW5kbGVfdmJsYW5rKCkgLT4gdmJsYW5rIGNvdW50ZXIrKw0KICAgICAg
ICAgICAtPiBDUkMob2xkKSByZXBvcnRlZCB2aWEgZHJtX2NydGNfYWRkX2NyY19lbnRyeSgpDQog
ICAgICAgICAgICAgKENSQyBjYXB0dXJlZCBiZWZvcmUgRU9GIE4sIHJlZmxlY3RzIG9sZCBjb25m
aWcpDQoNCiAgRU9GIE4rMSAtPiBDUkMobmV3KSBjYXB0dXJlZCBieSBIVw0KDQogIFZibGFuayBO
KzEgLT4gZHJtX2NydGNfaGFuZGxlX3ZibGFuaygpIC0+IHZibGFuayBjb3VudGVyKysNCiAgICAg
ICAgICAgICAtPiBDUkMobmV3KSByZXBvcnRlZCB2aWEgZHJtX2NydGNfYWRkX2NyY19lbnRyeSgp
IOKchQ0KDQpOb3RlIHRoYXQgaWYgYXRvbWljX2NvbW1pdCgpIGlzIGlzc3VlZCBhZnRlciBFT0Yg
TiBoYXMgYWxyZWFkeQ0KcGFzc2VkLCB0aGUgQ01EUSBjYWxsYmFjayB3aWxsIG5vdCB0YWtlIGVm
ZmVjdCB1bnRpbCBFT0YgTisyLA0KbWVhbmluZyB0aGUgY29ycmVjdCBDUkMgd291bGQgbm90IGJl
IGF2YWlsYWJsZSB1bnRpbCBWQmxhbmsgTisyLg0KVGhpcyBpcyB3aHkgdGhlIGxhdGVuY3kgdG8g
dGhlIGNvcnJlY3QgQ1JDIGlzIHZhcmlhYmxlICgxfjINCnZibGFua3MpLiBIb3dldmVyLCBieSB3
YWl0aW5nIG9uZSBleHRyYSB2YmxhbmsgYXQgdGhlIHVzZXJzcGFjZQ0KbGV2ZWwgYWZ0ZXIgYXRv
bWljX2NvbW1pdCgpLCB0aGlzIGlzIGVmZmVjdGl2ZWx5IGVxdWl2YWxlbnQgdG8NCndhaXRpbmcg
Zm9yIHRoZSBwYWdlIGZsaXAgZXZlbnQgKFdhaXRQYWdlRmxpcCgpKSBiZWZvcmUgY2FwdHVyaW5n
DQp0aGUgQ1JDLCB3aGljaCBlbnN1cmVzIHRoZSBjb3JyZWN0IENSQyBpcyBhbHdheXMgY2FwdHVy
ZWQgcmVnYXJkbGVzcw0Kb2Ygd2hlbiBhdG9taWNfY29tbWl0KCkgd2FzIGlzc3VlZC4NCg0KDQpS
ZWdhcmRpbmcgdGhlIHVwc3RyZWFtIENSQyBpbXBsZW1lbnRhdGlvbiwgd2UgZGlkIHN1Ym1pdCBh
IHBhdGNoDQpwcmV2aW91c2x5Og0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQwNjE0MDI0NjIwLjE5MDExLTIwLXNoYXduLnN1bmdA
bWVkaWF0ZWsuY29tLw0KDQoNCkhvd2V2ZXIsIGl0IGhhcyBub3QgYmVlbiByZWJhc2VkIGFuZCBy
ZXN1Ym1pdHRlZCBkdWUgdG8gaW50ZXJuYWwNCnNjaGVkdWxpbmcgY29uc3RyYWludHMuIEFkZGl0
aW9uYWxseSwgdGhlIE1USyBEUk0gZHJpdmVyIGlzIGN1cnJlbnRseQ0KdW5kZXJnb2luZyBzaWdu
aWZpY2FudCBleHBhbnNpb24gYW5kIHJlZmFjdG9yaW5nIHRvIHN1cHBvcnQgdGhlDQpsYXRlc3Qg
Z2VuZXJhdGlvbiBoYXJkd2FyZSwgd2hpY2ggaGFzIGZ1cnRoZXIgZGVsYXllZCB0aGUNCnByaW9y
aXRpemF0aW9uIG9mIHRoZSBDUkMgdXBzdHJlYW0gcGF0Y2guDQoNCkluIHRoZSBzaG9ydCB0ZXJt
LCB3ZSBhcmUgcmVseWluZyBvbiB0aGUgZG93bnN0cmVhbSBDUkMNCmltcGxlbWVudGF0aW9uIGZv
ciBJR1QgdmFsaWRhdGlvbi4gV2UgZG8gaW50ZW5kIHRvIHVwc3RyZWFtIHRoZQ0KY29tcGxldGUg
Q1JDIGltcGxlbWVudGF0aW9uIG9uY2UgdGhlIG9uZ29pbmcgZHJpdmVyIHJlZmFjdG9yaW5nDQpz
dGFiaWxpemVzLg0KDQpJbiB0aGUgbWVhbnRpbWUsIHdlIHdvdWxkIGFwcHJlY2lhdGUgYW55IGd1
aWRhbmNlIG9uIHRoZSBwcmVmZXJyZWQNCmFwcHJvYWNoIGZvciBoYW5kbGluZyB0aGUgQ1JDIHJl
cG9ydGluZyBkZWxheSB3aXRoaW4gdGhlIGRyaXZlciwgc28NCndlIGNhbiBtYWtlIHN1cmUgdGhl
IGV2ZW50dWFsIHVwc3RyZWFtIHN1Ym1pc3Npb24gYWxpZ25zIHdpdGggdGhlDQpleHBlY3RlZCBk
ZXNpZ24uDQoNClRoYW5rcyBhZ2FpbiBmb3IgeW91ciBpbnB1dC4NCg0KQmVzdCByZWdhcmRzLA0K
SmFzb24tSkggTGluDQo=
