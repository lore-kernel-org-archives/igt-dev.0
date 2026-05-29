Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD98CCD6E49
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 03:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B94610F836;
	Fri, 29 May 2026 03:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="r4zbDQ0B";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="skryTcJ6";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DBA10F835
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 03:28:09 +0000 (UTC)
X-UUID: 66fde9005b0e11f1b1788b6acf885367-20260529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Sw+yKwWbj8eL6yR32BIFqVZUMRjC1nXPsCAq0TshjrQ=; 
 b=r4zbDQ0BR4n73DKibID0Nwj12Wi6zK9QUkv1guDpfadq83btPg0iUgrzaT+qVMCSqzemLBrrR7HRtUiTIzCUlkdmS9STfHAyI08l3YR9Ke21WqAn0vsu3yu5xr+hbHh5ozdg6eIydLI1AD1wE8x8UKwO+n/bb0m7zN0NqQsWgbw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15, REQID:be8cb6df-d41f-4308-901e-5aaf4a1029f2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e276073, CLOUDID:90634201-8ecf-400f-ba4f-4c5e0901de3b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|136|836|865|
 888|898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,Q
 S:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
 RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 66fde9005b0e11f1b1788b6acf885367-20260529
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 361206679; Fri, 29 May 2026 11:28:04 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 29 May 2026 11:28:02 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 29 May 2026 11:28:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkyxG4IIepWnAGJeTzjYdMFIqQ2IuJlXtjk8sV78je2PBeBp9aM31+ZO+Nw9j349ns5WtOLWn8FK+oEo+LhqLZuwIVX/gy1WsiItS7dSb1ve2FOzvtBgXHMO6MaZ5ObggWJD/UYdpN+tCdbaAZjM4/8nzytSi2mouiP0PWBqxpzUonViT86Ad4NRJB+olkYGby0X0bbb4y26bxjqvMg4ba9ouOOtGwp1IxYXftgMerrdg6noro6oovz7dy25I6WcqIud3QXLMqhds1G47GDN4lqIMfe/C42HuJnkb3cnxAzPPQLfe/nCyxKb+Yf5/OLxlHIYjQj5GyLAiLM5uCyeTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sw+yKwWbj8eL6yR32BIFqVZUMRjC1nXPsCAq0TshjrQ=;
 b=vBXwRrbAjpt3suw6gHObYTfDkX8HoozoJwSPs6oC2g/Zxte4U4eqHhJ93qdrfEhDLZjL7hmxQZdU22Jvp4DKs1YBfNMuEdXJuTLnDhnUwrImFDA5PT0sZjxID3ugWSfCUGBtbkV7Z96vO4siqG9zr9oLSo92YGofcTdc3jw7V2Hne4AjNRTikqkyfBzkmN6+ltTNP+45k2oYT1y4Qr0buNf0F6ykJ+waByRb2jQLqdFtFUKAHkgFxbt6GNfkFA+2XGxBM+UqCdXwqYHSigTssknAytjJaVLFcHYDU5fqtqILJdpPbjHfif5iLekWgIGhJdxcBxwbzT0UawLfpLjDKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sw+yKwWbj8eL6yR32BIFqVZUMRjC1nXPsCAq0TshjrQ=;
 b=skryTcJ6QvGoNBUZAoWjWQdLdFDxnxy7tT/fdzy9AtPu9z5L60oIfo9b+BnKqiVDsNYpPrZtdIO8AKhzs747TQ/3M6MqVqACiv673BBAAqM+IrADBay0bYrLZue2TDvZRGB8M5LQm3oNGSLWKVhsINr82RcQKcWoEf/n6gNtCR0=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB7883.apcprd03.prod.outlook.com (2603:1096:400:480::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.3; Fri, 29 May 2026
 03:27:59 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 03:27:59 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "navaremanasi@google.com" <navaremanasi@google.com>, 
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "suresh.kumar.kurmi@intel.com" <suresh.kumar.kurmi@intel.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>, "bhanuprakash.modem@gmail.com"
 <bhanuprakash.modem@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Thread-Topic: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Thread-Index: AQHcyNH2YxjB3EtuVUiEvZIHanYs6bXYFx4AgAXP+QCAAK+oAIABBE+AgBc0A4CACVwMAIAhKO8AgADJwACAAEZZgIAAF0wAgAIpNQA=
Date: Fri, 29 May 2026 03:27:59 +0000
Message-ID: <f9fac697509e8c4c543e393152fd5c9809f0932e.camel@mediatek.com>
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
 <adjQJE8Ok5K_sNuc@intel.com>
 <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
 <ad5De-s-yxyyTt7s@intel.com>
 <73567dcf64c48d1e02206839ce589809b1366d58.camel@mediatek.com>
 <CAMNLLoSF9xLz=2pUwcTULURdxZDn+NR1+Y-oGHBaOsre3Uz-cw@mail.gmail.com>
 <CAMNLLoSDZ5mGALP=vwuL245R+yZWf+adpCD3cFyeqv9k1bKzAw@mail.gmail.com>
 <CAMNLLoSNXHyLS7gftj4ofMFknnhP-tdKoYjG32W3j3kb4DZO2A@mail.gmail.com>
 <61f912e0d6a934afac8e2e978dae27314d27a23a@intel.com>
 <986ffe07650b69ac71c36b10bb6d5e18aa82106f.camel@mediatek.com>
 <ahc3rjW0MFg3LBAB@intel.com>
In-Reply-To: <ahc3rjW0MFg3LBAB@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB7883:EE_
x-ms-office365-filtering-correlation-id: fb635be6-ff3c-4900-1458-08debd324859
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|22082099003|18002099003|38070700021|4143699003|11063799006|56012099006|6133799003;
x-microsoft-antispam-message-info: zNlg40JMLs7DP/U3OURQfcJrebuZMwK2yRin19Lyn1DjlIez6pu+/UsFGHf6ZyOBkQ+/zqMpTUKDVsR24FRV+K9UAP7BJmOtOvdMOyHkWcy8c/SrPbXbWcvufKCZXpf6Q4Cdf8lhEFWGzYquqJ9Ll48HMvnfD6g78c/mqR5t87XW8oVas94eG4rkuNmllYqxeQAgs+ThIq/t8L7uAc1h5AOayO2NNxDR03Fbi8WIFA6D5E6dEBD1K/Li9M5X6Yl32PiKq61w1Fr/qtpR4PUd5eA9D2sWUAHqe0aMxYmdysJtfgJw2aNC0UegYsHYEfQ/BuIKmC4v4qlyzdPHKP9oHvkxnFS0HhGE8p4eRJCp+5/IAjLRN+W3pG0kFqjmSz+jyZNQ+oz6HliLOftScJuX+detyuCABHT3LfPMwZVb0sJayecsYWxffvbiEwaxafiHixuLDb+v9LK960N8OKdgnE0KdcgNdohw3WOF5F9rOku2miOAxjl31goXKCTg3hyib5xOMf0J2B3ONE2zl5LTPi72Y/Z790sfshO8vH5M1FgAbsHRIoAsMyP3ctG++mQhjf3ItJdv4sKhQcmKClX89xL9AqISI+9sIv5/NbOgBMEgxQcNSMNvyYjNqsLmbz6r67AMzwby16ZdkurskR0UGd0w5AoyceipvZVdVgF1JJZ2F2UqnvgPzUDZHyiLskpUZsacSS5kq3esMHId/ksGcCHPgb/fYeARZxqbwUYyBfMbOdbx/QOa43FW4Ns6YM7Z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGtoQlJnbFhLOUMra3JqMU1lbUJyYUx4VFpSZWd5dm0wUERBbHY5VTlaNEpX?=
 =?utf-8?B?d2lzaFY5T09hYk1TN1FYUXdLR21zcHBWWW9oWmJmTHJsR2RlQ050ZUFpcU0w?=
 =?utf-8?B?Z3Z5OE04VnhoY1haRmE5RUZZNm1hUmdpNjkyVDFsdnNpTHM0UzYrRE9kZ2d4?=
 =?utf-8?B?bS9vWEFUdDFKYXNFaTYrang3cEpzOFVhcmliNUtuUUFQM1BzU3RRb3lVT0tv?=
 =?utf-8?B?ZU5CRGxMejlHQkR3VWNGMmMvMTA4MGZzNE9CMGVyTTlWUktHd0JDODdiblQz?=
 =?utf-8?B?azJENkdZQWozTmNhUjVvSmpURkxjYjdjV29ZaHpGQ2lHOFFzRDhQTnhDZjd3?=
 =?utf-8?B?WEd4NEpHekV2SkxkcGV5NFRNUDl5dUxNT05yRExoMjJuSTFrVjBycmNnbGVa?=
 =?utf-8?B?Tm1ndXo1UklBQnhEVGhpSjZkQ2dFUE9pWWRFSmRMRm9MWml4TS9ZVWp0UlRM?=
 =?utf-8?B?bEJaMmp3bk9RcmNNUnVpWHRkdzhkbEYyR3FsblpGK1Q5U1ZGUTRENVRQbjNh?=
 =?utf-8?B?dldVZEF2Y2NSN3ZJZVJhRkJZRDg0OXN5dDZVWHJiN295Vm9yT0RreTJmQWN2?=
 =?utf-8?B?Mnc5RXdDVFFEbUhPTGFQKytic0tES3oxWjNyRkwxZnpRWFR3S2JhejRlUTcw?=
 =?utf-8?B?ZnF5OXN3WEFoMUVNQUpINVRTOUpGNksyYWNzbURvQzFuMXArVFNxV3IweC9M?=
 =?utf-8?B?N0lPekdBYkthNjF2RVJUSCtWQVA2d3kwQXJvYUxYbXVmbmFDb2lKeVlsbVhV?=
 =?utf-8?B?Z1kzanp4UFRiZXprWjhYcTFLQmdoQ0V4QzZuejlvWkg0a21NYmFUeTF1blQ1?=
 =?utf-8?B?anBzNmRVZCsrTUwxcFUyQ2Jqbm5hcURSbWJDdU9lMmpUbWZiaXBCSzRRSGhw?=
 =?utf-8?B?RVRpZzNkZkJZQWdMUkljdVJzY0IvMEc3RUlPcFBoeWNsSnV3MGxwRDgzTGRi?=
 =?utf-8?B?aFBrNCtuY2trejNRNnpiQjVEaUlJbVFwZzN2a2xtSkVmMG1MTGFtV1hDR0c0?=
 =?utf-8?B?UnI2cUZzNEsrS1dZVno4czlkR0k4Qmc1eStLUVdFREhKRFUxcDV5cjdHM3FF?=
 =?utf-8?B?L2FpRjFrazRHalYvTWN4d1M5WWxtNEdqbVFRNTNmLzMzaU1tZHY5MlNqTzI4?=
 =?utf-8?B?UVR4eHFUZVZqblpVVDJJSjB2cUpHZTZ6K1lOakdCbE9ERFlmYXN5WGNZTEdu?=
 =?utf-8?B?Mi9sdHcyWm9uZEtrNGJuOFVTaFR1aEhla1l2WnpiWGxIaXNCT0pvSWw2V1dM?=
 =?utf-8?B?SnVkSVRpVmR5SXltMGpISDkyT0ZwWnE5NGxnT015NTZhakpkZW9STDZieDNU?=
 =?utf-8?B?SXh6S1BBOWJZY0ptbmVVQmdJVnM5QmxpbklCOXRPMDF6N1JreUc4dWRqeEZt?=
 =?utf-8?B?ZDhFS1JQM2NFV1dlYnM3d3VsbjBHOUFOaVlTdnBhWnBveVJLc2c3a01EZjZs?=
 =?utf-8?B?MDgxVVlmdUgvT0ZJZGE3QmU0YTJrWkU4SnBkTC93S2JLT3NXSXViZ01IY0po?=
 =?utf-8?B?a2E2NjNYRzRsaDBKZnBLeXN6K2RlUWdmVkgyUUZpWmN1OGJic2Z1NlBMYUZm?=
 =?utf-8?B?VmxqQjRlVTVJOEZxdHc2a1RLR1ZJeGxtL1dRSmVzUmM1NGFwNzhUVzhFbDJW?=
 =?utf-8?B?bDFBUEl3eWs3SzliV2VtVDhycnJxUkkrR0hTdSsvUnlYOFlieVgwcExtV3FI?=
 =?utf-8?B?V3VwdVpVb3U0MDBodjNoVlR6MlRWdnh5ZVBWN3B5RzdiR2g0OVJ1dFFDdmIx?=
 =?utf-8?B?OW10anMrU0NBaDBicWo3b3FpLzZYbTRZK1ZmSlpwOHV2d0xZZE9NRDNXRGwv?=
 =?utf-8?B?eEk2QzY2ZmpiSWFPNHd4alpNZ3RFeTdHYVU1Vk9YZXZBenJWOW1nN1BEZnZr?=
 =?utf-8?B?QzBwdlllV0RzcTEwbUNrQjlzamw2aWdzUmZxRlVGaUxuN3Z2QUo2S2RicGNZ?=
 =?utf-8?B?Q1V5YnVGRERBeEdKaEtiNEpaMjhtaHhlT3ROT1VMOUhaWFZ4bUhOZmxUNXh3?=
 =?utf-8?B?VFY1anZnbTBOeGU4TVBtazkvcy9XcitwQzhNNTR3eGNyMFJUajhuUTV6NXdO?=
 =?utf-8?B?WVZrY041TVorM3dkWXE5dUNpdk8yc0k2Ni9kc1RDclIwd2VEQU1nTUhvQUxS?=
 =?utf-8?B?NFA2TmFQNG5kMHFqbXFxNTRINE1vS3NlaGlGbW9zL1pnaTg4SUMvV0lqK3Z1?=
 =?utf-8?B?ckJxRDFUWCtNNVZJdVNqM1Bkb2tiZ2hSaENpUDBERnVUUXFZZTMzdzM0TkRR?=
 =?utf-8?B?eXdEWVI1WE5xRE9QZ1FvZ3hFQ1N6RytocmVkdXpwc1RDdkpXZnpraTdvMktJ?=
 =?utf-8?B?S0JhT09uMGJDSTQrMnRsaERDODJwaDk5V3A1akI0Slhqc1FsQTJnL2lzN2Na?=
 =?utf-8?Q?P5VpnvZSSEiWjStE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28E7AE51A0E7A34D9106DEFFCB37F7D4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: P5Ctahlw6D9YWo30Vk4+ZgxJxinQTFBv/YJQ4vAH4I1JtwzjvkvGobwQDhRY/IphYyYMSDUlZUEsp+M6atnKrY62m00zbH0yIxAHAts9INpbk4K6BNlR4uKQjrCA40wjB6GII3OR96uZiKCnP2wG0264tQzwYc3hiCIgOCUJDnxrKHc5dSz5fC+nXsGH4eQZZowQmuYVU+2+daHE/DPMPbViGrRs5NAITovKEF17oKX8TncqafBxpsLCDwZtCXFJklzhasMPkjCVUMLem2ii1gKfdF2Dn7Xp/si16Tn1FusytYYsNYm0f6WWI4e+4sZlJhQp7CHaA52I8zBL+scWyg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb635be6-ff3c-4900-1458-08debd324859
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 03:27:59.2682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlybcZH/wVeXTTcHYljWlkgEBnkLi+3dF4rLPqGvZlSWLHpuvZRtwpPi8UCu6Mc/YPAglsCrnrPQfW2p6LnfKYe/aVI7A1boYGhxPJF3gEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7883
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

SGkgVmlsbGUsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb25zLg0KDQpPbiBXZWQsIDIw
MjYtMDUtMjcgYXQgMjE6MjcgKzAzMDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToNCj4gT24gV2Vk
LCBNYXkgMjcsIDIwMjYgYXQgMDU6MDQ6MzZQTSArMDAwMCwgSmFzb24tSkggTGluICjmnpfnnb/n
paUpIHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAyNi0wNS0yNyBhdCAxNTo1MiArMDMwMCwgSmFuaSBO
aWt1bGEgd3JvdGU6DQo+ID4gPiBPbiBUdWUsIDI2IE1heSAyMDI2LCBNYW5hc2kgTmF2YXJlIDxu
YXZhcmVtYW5hc2lAZ29vZ2xlLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBIaSBAVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gQEthcnRoaWsgQiBTDQo+
ID4gPiA+IDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+wqAgQEt1cm1pLCBTdXJlc2ggS3VtYXINCj4g
PiA+ID4gPHN1cmVzaC5rdW1hci5rdXJtaUBpbnRlbC5jb20+DQo+ID4gPiA+IMKgLA0KPiA+ID4g
PiANCj4gPiA+ID4gQ291bGQgd2UgZ2V0IHNvbWUgZmVlZGJhY2sgb24gdGhpcyB1cHN0cmVhbSBk
aXNjdXNzaW9uLCBWaWxsZQ0KPiA+ID4gPiBoYXMNCj4gPiA+ID4gc3VnZ2VzdGVkDQo+ID4gPiA+
IHRvIHVzZSB0aGUgZnJhbWUgY291bnRlciBpbnN0ZWFkIG9mIGFkZGluZyBhbiBleHRyYSBWYmxh
bmsNCj4gPiA+ID4gd2FpdC4NCj4gPiA+ID4gSG93ZXZlciBzaW5jZSBNVEsgaGFyZHdhcmUgZG9l
cyBub3QgaGF2ZSBhIHN1cHBvcnQgZm9yIHRoZQ0KPiA+ID4gPiBmcmFtZQ0KPiA+ID4gPiBjb3Vu
dGVyLA0KPiA+ID4gPiB0aGlzIHBhdGNoIGFkZHMgYW4gZXh0cmEgdmJsYW5rIHdhaXQgYmVmb3Jl
IGdyYWJiaW5nIENSQyBvbmx5DQo+ID4gPiA+IGZvcg0KPiA+ID4gPiBNVEsgaHcuDQo+ID4gPiA+
IFdlIG5lZWQgdGhpcyBjaGFuZ2UgdG8gZ2V0IHRoZSB0ZXN0IHBhc3Npbmcgb24gTVRLIEhXIGFu
ZCB3b3VsZA0KPiA+ID4gPiBhcHByZWNpYXRlIHlvdXIgZmVlZGJhY2sgYW5kIEludGVsJ3MgaGVs
cA0KPiA+ID4gPiBpbiBnZXR0aW5nIHRoaXMgbGFuZGVkLg0KPiA+ID4gPiANCj4gPiA+ID4gQEph
c29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT7CoCBoYXMgcHJvdmlkZWQgdGhl
DQo+ID4gPiA+IGp1c3RpZmljYXRpb24NCj4gPiA+ID4gb24gd2h5IFZpbGxlJ3MgYXBwcm9hY2gg
d2lsbCBub3Qgd29yayBmb3IgTVRLIEhXLg0KPiA+ID4gDQo+ID4gPiBOb3Qgc3VyZSB3aHkgdGhl
IGRyaXZlciBjb3VsZG4ndCBkbyB0aGUgdmJsYW5rIHdhaXRzIGl0c2VsZg0KPiA+ID4gYmVmb3Jl
DQo+ID4gPiBleHBvc2luZyB0aGUgQ1JDcyB0byB0aGUgdXNlcnNwYWNlLiBNYXliZSBJJ20gbWlz
c2luZyBzb21ldGhpbmcuDQo+ID4gPiANCj4gPiA+IEFuZCB0aGF0IHJlYWxseSBtYWtlcyBpdCBh
IG5vbi11cHN0cmVhbSBkaXNjdXNzaW9uLCBiZWNhdXNlIHRoZQ0KPiA+ID4gdXBzdHJlYW0NCj4g
PiA+IE1lZGlhdGVrIGRyaXZlciBkb2Vzbid0IGhhdmUgYSBDUkMgaW1wbGVtZW50YXRpb24uDQo+
ID4gPiANCj4gPiA+IA0KPiA+ID4gQlIsDQo+ID4gPiBKYW5pLg0KPiA+ID4gDQo+ID4gDQo+ID4g
SGkgSmFuaSwNCj4gPiANCj4gPiBUaGFuayB5b3UgZm9yIHRha2luZyBhIGxvb2sgYXQgdGhpcyBk
aXNjdXNzaW9uLg0KPiA+IA0KPiA+IFlvdSByYWlzZSBhIHZhbGlkIHBvaW50IOKAlCBoYXZpbmcg
dGhlIGRyaXZlciBoYW5kbGUgdGhpbmdzDQo+ID4gaW50ZXJuYWxseQ0KPiA+IGlzIGluZGVlZCB0
aGUgY2xlYW5lciBhcHByb2FjaC4gSG93ZXZlciwgd2Ugd291bGQgbGlrZSB0byBjbGFyaWZ5DQo+
ID4gd2h5IHRoaXMgaXMgbm90IHN0cmFpZ2h0Zm9yd2FyZCBmb3IgTVRLIGhhcmR3YXJlLg0KPiA+
IA0KPiA+IFVubGlrZSBJbnRlbCwgTVRLIGhhcmR3YXJlIGRvZXMgbm90IGhhdmUgYSBIVyBmcmFt
ZSBjb3VudGVyDQo+ID4gcmVnaXN0ZXIsIHdoaWNoIG1lYW5zIHRoZSBkcml2ZXIgY2Fubm90IHJl
bGlhYmx5IGFzc29jaWF0ZSBlYWNoIENSQw0KPiA+IGVudHJ5IHdpdGggdGhlIGNvcnJlY3QgZnJh
bWUgbnVtYmVyIHdoZW4gY2FsbGluZw0KPiA+IGRybV9jcnRjX2FkZF9jcmNfZW50cnkoKS4gQSBz
b2Z0d2FyZSBmcmFtZSBjb3VudGVyIHdvdWxkIG5vdCBoZWxwDQo+ID4gaGVyZSBlaXRoZXIsIGJl
Y2F1c2UgdGhlIE1USyBkcml2ZXIgY2FsbHMgZHJtX2NydGNfYWRkX2NyY19lbnRyeSgpDQo+ID4g
b24gZXZlcnkgVmJsYW5rLCBidXQgdGhlIGxhdGVuY3kgYmV0d2VlbiBhdG9taWNfY29tbWl0KCkg
YW5kIHRoZQ0KPiA+IGNvcnJlY3QgQ1JDIGJlY29taW5nIGF2YWlsYWJsZSBpcyB2YXJpYWJsZSAo
MX4yIHZibGFua3MpIGRlcGVuZGluZw0KPiA+IG9uIGFzeW5jaHJvbm91cyBDTURRIGV4ZWN1dGlv
biB0aW1pbmcuDQo+IA0KPiBXaHkgaXMgdGhlIENSQyBldmVuIGJlaW5nIGFkZGVkIGZyb20gdGhl
IHZibGFuayBpZiB0aGUgQ01EUQ0KPiB0aGluZyBpcyB0aGUgb25lIHRoYXQgYWN0dWFsbHkgZ2Vu
ZXJhdGVzIGl0PyBTb3VuZHMgbGlrZSB5b3UNCj4gbWF5IG5lZWQgdG8gaGFuZGxlIG1vcmUgc3R1
ZmYgZnJvbSB0aGUgQ01EUSBzbyB0aGF0IGJvdGggdGhlDQo+IGZsaXBzIGFuZCBDUkNzIGtub3cg
d2hpY2ggb3JkZXIgdGhleSBoYXBwZW4gaW4uDQoNClJlZ2FyZGluZyByZXBvcnRpbmcgQ1JDIGZy
b20gdGhlIENNRFEgY2FsbGJhY2sgaW5zdGVhZCBvZiB0aGUgdmJsYW5rDQpoYW5kbGVyLCB3ZSBk
aWQgdHJ5IHRoaXMgYXBwcm9hY2ggcHJldmlvdXNseS4gSG93ZXZlciwgaXQgY2F1c2VkIG90aGVy
DQpJR1QgdGVzdHMgdG8gZmFpbCBiZWNhdXNlIHRob3NlIHRlc3RzIHZlcmlmeSB0aGF0IENSQ3Mg
YXJlIGNhcHR1cmVkDQpvbiBldmVyeSBjb25zZWN1dGl2ZSB2YmxhbmsuIFJlcG9ydGluZyBDUkMg
ZnJvbSB0aGUgQ01EUSBjYWxsYmFjaw0KYnJlYWtzIHRoaXMgY29udGludWl0eSBhbmQgY2F1c2Vz
IHRob3NlIHRlc3RzIHRvIGZhaWwuIFRob3VnaCBwZXJoYXBzDQp5b3VyIHN1Z2dlc3Rpb24gb2Yg
cmVwb3J0aW5nIHdpdGhvdXQgZnJhbWUgbnVtYmVycyBjb3VsZCBhbHNvIGhlbHANCndpdGggdGhp
cywgd2hpY2ggSSB3aWxsIGludmVzdGlnYXRlIGZ1cnRoZXIuDQoNCj4gPiANCj4gPiBJdCBpcyBh
bHNvIHdvcnRoIG5vdGluZyB0aGF0IGluIE1USydzIERSTSBkcml2ZXIsIHRoZSBwYWdlIGZsaXAN
Cj4gPiBjb21wbGV0aW9uIGV2ZW50IGlzIGZpcmVkIGluIHRoZSBDTURRIGNhbGxiYWNrIChpLmUu
DQo+ID4gZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoKSksIHdoaWNoIGlzIG9ubHkgY2FsbGVk
IHdoZW4gdGhlIEhXDQo+ID4gY29uZmlndXJhdGlvbiBhY3R1YWxseSB0YWtlcyBlZmZlY3QuIEhv
d2V2ZXIsIHRoaXMgSUdUIHRlc3QgZG9lcw0KPiA+IG5vdA0KPiA+IHdhaXQgZm9yIHRoZSBwYWdl
IGZsaXAgZXZlbnQgYmVmb3JlIGNhcHR1cmluZyB0aGUgQ1JDIOKAlCBpdCBjYXB0dXJlcw0KPiA+
IHRoZSBDUkMgZGlyZWN0bHkgb24gZXZlcnkgVmJsYW5rLg0KPiANCj4gQUZBSUNTIHRoZSB0ZXN0
IGVpdGhlciBkb2VzIGEgYmxvY2tpbmcgY29tbWl0IG9yIGV4cGxpY2l0bHkgd2FpdHMNCj4gZm9y
IHRoZSBwYWdlIGZsaXAgZXZlbnQgYmVmb3JlIGNhbGxpbmcgaWd0X3BpcGVfY3JjX2dldF9jdXJy
ZW50KCkuDQo+IElmIHRoZSBDUkMgcmV0dXJuZWQgYnkgdGhhdCBkb2Vzbid0IG1hdGNoIHRoZSBj
b21taXQgdGhlbiB0aGUgQ1JDcw0KPiBjbGVhcmx5IGhhdmUgYm9ndXMgZnJhbWUgbnVtYmVycy4N
Cj4gDQo+IEkgZ3Vlc3MgaWYgeW91IGNhbid0IGZpeCB0aGUgQ1JDIGZyYW1lIG51bWJlcnMgdG8g
YmUgYWNjdXJhdGUgdGhlbg0KPiBtYXliZSBqdXN0IHN0b3AgdGVsbGluZyBkcm1fY3J0Y19hZGRf
Y3JjX2VudHJ5KCkgdGhhdCB5b3UgZXZlbiBoYXZlDQo+IGFueSBmcmFtZSBudW1iZXJzLiBUaGF0
IHNob3VsZCBtYWtlIGlndF9waXBlX2NyY19nZXRfY3VycmVudCgpIHRocm93DQo+IG91dCBhbGwg
Y2FwdHVyZWQgQ1JDcyBhbmQgd2FpdCBmb3IgdGhlIG5leHQgb25lIHRvIGNvbWUgaW4uIFBlcmhh
cHMNCj4gdGhhdCBpcyBlbm91Z2ggdG8gZ2V0IHlvdSB0aHJvdWdoIHRoaXMuDQo+IA0KPiANCg0K
UmVnYXJkaW5nIHRoZSBmcmFtZSBudW1iZXIsIEkgY29uZmlybWVkIHRoYXQgb3VyIGRvd25zdHJl
YW0gZHJpdmVyDQpjdXJyZW50bHkgYWx3YXlzIGNhbGxzIGRybV9jcnRjX2FkZF9jcmNfZW50cnko
KSB3aXRoIGhhc19mcmFtZT10cnVlLA0KcGFzc2luZyB0aGUgdmJsYW5rIGNvdW50ZXIgYXMgdGhl
IGZyYW1lIG51bWJlci4gSG93ZXZlciwgc2luY2UgdGhlDQpDUkMgY29udGVudCBpcyBpbmhlcmVu
dGx5IG9mZnNldCBmcm9tIHRoZSB2YmxhbmsgaXQgaXMgcmVwb3J0ZWQgb24NCmR1ZSB0byB0aGUg
SFcgcGlwZWxpbmUgbGF0ZW5jeSwgdGhlIGZyYW1lIG51bWJlciB3ZSBhcmUgcGFzc2luZyBpcw0K
ZWZmZWN0aXZlbHkgaW5hY2N1cmF0ZS4NCg0KQmFzZWQgb24geW91ciBzdWdnZXN0aW9uIG9mIHNl
dHRpbmcgaGFzX2ZyYW1lPWZhbHNlLCBJIHVuZGVyc3RhbmQNCnRoYXQgaWd0X3BpcGVfY3JjX2dl
dF9jdXJyZW50KCkgd291bGQgdGhlbjoNCg0KMS4gRHJhaW4gYWxsIHByZXZpb3VzbHkgY2FwdHVy
ZWQgQ1JDcyBpbiB0aGUgYnVmZmVyDQoyLiBXYWl0IGZvciB0aGUgbmV4dCBpbmNvbWluZyBDUkMN
CjMuIFJldHVybiBpdCBkaXJlY3RseSB3aXRob3V0IGZyYW1lIG51bWJlciBjb21wYXJpc29uDQoN
ClRoaXMgd291bGQgbmF0dXJhbGx5IGVuc3VyZSB0aGUgbW9zdCByZWNlbnQgQ1JDIGlzIHJldHVy
bmVkLA0KcmVmbGVjdGluZyB0aGUgbmV3IEhXIGNvbmZpZ3VyYXRpb24gYWZ0ZXIgYXRvbWljX2Nv
bW1pdCgpLg0KSSB3aWxsIHRyeSB0aGlzIGFwcHJvYWNoIGluIG91ciBkb3duc3RyZWFtIGRyaXZl
ciBhbmQgdmVyaWZ5IGlmIGl0DQpyZXNvbHZlcyB0aGUgaXNzdWUgd2l0aG91dCByZXF1aXJpbmcg
YW55IElHVCBjaGFuZ2VzLg0KDQpUaGFua3MgYWdhaW4gZm9yIHlvdXIgZ3VpZGFuY2UuDQoNCkJl
c3QgcmVnYXJkcywNCkphc29uLUpIIExpbg0K
