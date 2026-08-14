Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A878CC5CFCF
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 02:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4156910E082;
	Fri, 14 Aug 2026 02:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="H2c9OlQo";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="tnUDyANl";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F70E10E03E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 02:46:51 +0000 (UTC)
X-UUID: 64a97990978a11f1b1788b6acf885367-20260814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=EkPxBm8o3A1N2Z11tkFUTIlvrGkHl4Q87jkyRhUYvp8=; 
 b=H2c9OlQobvIld6+MpDgpjXuYXe4EDfUjbqNsFhpPiyz8alZz8vkGO1h7dlcxg8PDce/Zz7Do5krwNUaz44em86YuGMDRVkvznY7ZQxGSKyDNRqh+uO7rnCwl+JVnU0HC35LaWJy5MqEjWtQk3RQYj/uZD3k+MzbXdWoOnnqoWNM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19, REQID:d4e235a9-4c01-4608-9e9e-405d81097f23, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:7db8b62, CLOUDID:7602dbf1-0685-46a3-9cac-19d8f3a05ae7,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
 Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
 1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 64a97990978a11f1b1788b6acf885367-20260814
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 940099309; Fri, 14 Aug 2026 10:46:47 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 14 Aug 2026 10:46:46 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 14 Aug 2026 10:46:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDuveIaEr8kLzFU1UfS8sgxLq6elsYh21Z3nq0hIzb2Qvv3mRSJX0mJJygMmWD4dEYdtnOo/CYBiGEG6NZc702IQqgdEOy0yVaEQWLOK3PqB2EwUvQaUP9yfolx8a/zLPaYAowaQoOx69cbnbRMHiE5d6WKLYbhklt9ZCjRVCd9zwS3TXD1Iz2lNSmL9da7E0x6fwNvDX39Hdd0W5mLeEiInUPhEzB4e04Dz9awk5B+sD543ovu5VjJUb3h5CCXDzUEEycTX9PiNhGsOFFXHYaW8teb2AypcC2KPFoPlvnGkwLyFuW5udzySihkCLXJfyeO1kNpIZaesuSTjqO7l2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkPxBm8o3A1N2Z11tkFUTIlvrGkHl4Q87jkyRhUYvp8=;
 b=IZD1oPM9AK/lVGA1ytiVsKWfAzzjclQRR4rvVF4xhH4BAweRX5/7eA3sQ9q/Wo7HCj+kL/AaWo8vblhWVeNHEfoYcdUt2uNO1r2/n/4ryh0aT9DxzhxcOmoJUi46pAOb7A7IcSEcP8wpnnlgvNZW/rlKj6TuVUP/tCWeaNlJ18rTmRWzTQ1H8Lx82pkxFhIP8yroybWi5LUtoPDsbkwccZiYOTPMq8IocSGMBEn3/idnul2fk3nwomx/RKmpDdXWwdkQq0tLPwsgQD+yreP7UyBVDhOmaDm6CXhJxmshZPj0kD4/b0oOtqAOKr/yYgUyTl2nAXw2h/RDQSiMZ4pIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkPxBm8o3A1N2Z11tkFUTIlvrGkHl4Q87jkyRhUYvp8=;
 b=tnUDyANl3cq3Zf+tUPGU7gQ10fopTtXx+HrGIuKjEq86J2HHT5FZjiCb5NaQHSCLkaDxvnYxEhoFCZx/HEeMlnF52n9ubF+8AaIXJE0+KaoQ/xM6ADN1hYEh18HNjijviKX8OGgdqFoYOHT3yvrKp9SoWPLhAAI6PfQbgptIucg=
Received: from SETPR03MB10564.apcprd03.prod.outlook.com (2603:1096:101:316::7)
 by PUZPR03MB7064.apcprd03.prod.outlook.com (2603:1096:301:11f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 02:46:43 +0000
Received: from SETPR03MB10564.apcprd03.prod.outlook.com
 ([fe80::9b45:ef7d:a5fa:c791]) by SETPR03MB10564.apcprd03.prod.outlook.com
 ([fe80::9b45:ef7d:a5fa:c791%6]) with mapi id 15.21.0292.024; Fri, 14 Aug 2026
 02:46:42 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "fshao@chromium.org" <fshao@chromium.org>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "navaremanasi@google.com"
 <navaremanasi@google.com>, =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?=
 <Lancelot.Wu@mediatek.com>, "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_plane: Remove redundant CRC frame
 sequence check
Thread-Topic: [PATCH i-g-t v2] tests/kms_plane: Remove redundant CRC frame
 sequence check
Thread-Index: AQHdKax+FL+tk0d7V02B9zK2G+VE6rabVsIAgAB9tYCAAQZ1gA==
Date: Fri, 14 Aug 2026 02:46:42 +0000
Message-ID: <6ee0490b924a3e4ac37298069092fd955b8be58f.camel@mediatek.com>
References: <20260811161417.716771-1-jason-jh.lin@mediatek.com>
 <7244584b-4bed-4756-bdae-e06b0054d2b7@intel.com>
 <eeba8678-224a-4c9a-8e96-a0507faea016@gmail.com>
In-Reply-To: <eeba8678-224a-4c9a-8e96-a0507faea016@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SETPR03MB10564:EE_|PUZPR03MB7064:EE_
x-ms-office365-filtering-correlation-id: 6d05e72e-58e6-4a4d-4e2b-08def9ae45e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|23010399003|1800799024|11063799006|4143699003|38070700021|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: K3F3PNIZnMEcW6KXPTOPAZmaTbnlHzZ/Xmkd3I8JKwKXs7gaGm1KzEDZoBhlkVSZuQUe1pNtOF1CHdxrpb8RNd8YZszK+/Jmrls/SuwstMyQxrXZjFxs1BW5R1bdacyPnLjqrKtPD6G6KbQox13JeALa0pJ+5hpAJjF4qWq7ULHZEoVKYiP93cEnWj4+YcMuTGfYJIzaXS64KSDnxedh2RYzSzBuIsQTL0F0XMOKeoCwq3HF0wAkex5X7IAahL+UTG4WI7+BYGkHi1k37uPNMlvnOWl1Tlfod8q4c1M+PIgR8Mh4XOMRnEtf7vmeyuAx76f3qyAKtp4O43RLxP8psBspzqb0bE2BB4JAyNxQznp1jacT+jdZ7KXperWal3+gMEbVTOLaXWGvShmOod6/rAeAxmvv+FH3VT2Zczlp/RhINIHCv4Ond2ClUfxdGF7towUVKx7/XPnS46Ku2CWVKC6phE9rNftJmpupj9qjip9bMWl88Uv/YxTgb9foGNSw/DIiyjSKGqDhKIe2yBMJXEch/jyyJBUSEKuv0fEr1bF9zD63BFgqN1rPNKxG1wyIMa79pi1YFYJGQLtw0z9nmeOOc9t8Hjc5J/lGX9sGLukVuJRpI1v/kCg8plilusXmlRDUHclz+K6Vfscnp6HhXZaU4ErI1xtrPMZjc3e9qUhtDXOY7Vi/ondFpx5RDTtAN+5mExEzzajUEN/ggEdrEfl2gJN+emM/UsqHTxOvwWA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SETPR03MB10564.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(11063799006)(4143699003)(38070700021)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnFUdTg2eGRKTG5Ka25nVkY4alduanJhNmtQcGxmNXJkOTJ1endWSGdBVTQv?=
 =?utf-8?B?NWc0Q1E1aWhHZ250L0RwU21CbGdaQUorSWUybEFBVStwcEphNm52dkhEZ2Ur?=
 =?utf-8?B?UDZNTDZwdFBNa0ZSNkh5Z1FRRTVneEpNeWVuREt3UEk4a3YwaTdjU0ltVGJi?=
 =?utf-8?B?a2M3bW1rYkhnazlENFd1SHA1dVdjSHNFN05kSzBxMnVCY3BaVEMyb3M1M2sx?=
 =?utf-8?B?eHhNbEhyNmxCaUI3dVlkbk55MDVQcWRIMkIzdStzZUVtZjVZY0hCaHBDRmQ2?=
 =?utf-8?B?S3FlN1owS2RnMTF0aGlKQThwQzEvNW9vUmRjdE9xanVGc3BhRnBRM1VjS2xk?=
 =?utf-8?B?TlUyY05zTkl0L0MzYjhhOEFQaWdsWVExeWtQOHA1MTEwTFVZZFlqVWE0ckxS?=
 =?utf-8?B?cW5yVW9DeFUxdWt4NmZmMC9Fb1ZiSFdMYURvSnN3WUxSQWx2d2ZqakJDcXVp?=
 =?utf-8?B?ZnB5Y0FJTlJva1RqRnBGUkR6YlFwN0JwSmdhVTBHZjkxWXlPdHZNVitjRTJx?=
 =?utf-8?B?djdkS2lGalZzSHpBWVRxWklPT3dyUmVEcDdnemw4Y1lXenN4UGo3bGtmQ0hQ?=
 =?utf-8?B?THBxKzZ2Qlk0VUF2TnAzWWVwZzZBbFV1K1V4MUE0dC9ScW91czBjL3QwNFdK?=
 =?utf-8?B?RUw4QXFEUDR4Um5aNXc5ZWo1TmovRnp6Q2k3UlZHY3FOVmEwSVVWRUZPZVBS?=
 =?utf-8?B?MjU3S1FFV2ZKVldGSUljbnpWdzlvc2xVN1BJblFjT0k0WWQ4VmJ1RXRsd0l6?=
 =?utf-8?B?UGxsMzBwTXU4SHpvZ1pXS0hYSnBIck1TcHhuN1ZOZXpuWWEwbnNVWkdFc2t2?=
 =?utf-8?B?MkNIUE01ZXpmQ3grd0dOSHB5WGNWTFRQQVlqWkJRWWJVUlJhbmYwOEJxTFZR?=
 =?utf-8?B?Z1gvenR1TWVmVGxmb3Rsa3dpdERhR3BTeFovK2dZbHNZNnp5emN1Q0g0OWhh?=
 =?utf-8?B?ZXVhaUVWOGI0L2JONWZOT1FkR2QrQS94K2VROUdMTHBxL2xtek1HczZ2NE5r?=
 =?utf-8?B?YytHZlJ4NE9iSU9SUDhEK2RDQ2RwQVhKaGFDcjg1ekhuN3hZUnJuVlQ1ZHBx?=
 =?utf-8?B?M0Q5bG11alBwMTBzck1ad1ZuSEZ2WWxjbmZrenhMWlFPKy8wNHg3dWY0SEVn?=
 =?utf-8?B?RWJxblpkOE92b0dSV3pQQXRnZ0x3V1RYaXEyb1cxUnN6Mi9EcDAxU0lhZWZ4?=
 =?utf-8?B?aWVVN2ZoR2ZIWWNpd053Qm93MXJEZlpEU2RoOXJkZFRRR2c5QjY4aXFDT2h2?=
 =?utf-8?B?bTM0WGZObEtGaE9WUXo1K3QxSzI0bXA0QkxVcWdqdHkrS2R2Rkc1QVRWRFpP?=
 =?utf-8?B?MTNMZHVJaXJlSnBUeXZYTkdFbk5EeWgyaVZOS081ZEs0WjV0bld5cjNvZ1Zn?=
 =?utf-8?B?cEgwZ1ZMMmloNytKWHRNUUZXblJWYVRUVHMvVHJ2bjcxS1JVa1pzOVdZWnNH?=
 =?utf-8?B?OFlFNkkyOE9EWG5KQ3pqSURoWnhlSWFCSk9rQ3lGcXJTK09TaTYvblNHL2VN?=
 =?utf-8?B?RmdOLzhtQm5XN2hhUk5pbUxXcW5GMVhsWCtxY2s4V2d6Mmc5d0lFTUJBRGFi?=
 =?utf-8?B?YXFqT281K3lUZHQ0VjJiU2k1Tk5aSWJEMkpsTjRza0lxZEFqSjI2S013Z0R0?=
 =?utf-8?B?Qk9Qdk1LK1JZc0pxZEE1a1F2UEpxQVhOYzNDaUFSOEwyU0VDcGFBdUNYaHFV?=
 =?utf-8?B?WGFjblorSFI5OGVheVF1TFl4N3Z4SEhhRlFTeE5YYVAvUkNkc2VKOUMrZHN1?=
 =?utf-8?B?OXNQMGJrQ3N0L2NNTDc4djlRaUMzU0FvSDgzUkV3eHh5MmNPTWI2Sy81bDhV?=
 =?utf-8?B?ZElEUCtnd0pucmNKdjlSbml5N2Q3am56MkJYejBwUncrdHdRQ0RWU05aK2or?=
 =?utf-8?B?RFl4OXlUTzJRWG02S00vMzVJbjJwejdBMk5KWEtIa3JhMi9YVHZRU0Y3d04y?=
 =?utf-8?B?dWRqY2JhMXZ6SEFveVhlSlFJTkIwcVB2NGF5R2VNN3N4eGJxMzFUbjNrL3kx?=
 =?utf-8?B?RFVEMnorWGVEWlUxT1hCUUZJb2VEZzgranZyTG5mKzFFcE9DdWxsUVpzUFNL?=
 =?utf-8?B?L1Nsck8zVlB5dldROUYyWjAyaHBEbHhBUUJ1Mm1CdDN1U0k0by9XZFlpN29l?=
 =?utf-8?B?UkxPcW51VkxvL1ZBbVd5azFxTS83VC8veEh4UTZtRlFoK29yRkI3UlBpeURv?=
 =?utf-8?B?UkdQTmhueGxlcVVYeUF5U1dmazRSdGU2N1FQVk1IT096RUk4ZjNkSE9WYkJh?=
 =?utf-8?B?ZDFHYVRabFEvRGtWWTJNN080cklYQ1ZmeldBWHRlcStuSktiUUNlYnZWbng3?=
 =?utf-8?B?T2g2VGtqZUhRbWk5WkxVWmpCZHhFVWFCN01uSlZnUHJpcitGUHpFWFRvTlFO?=
 =?utf-8?Q?0UiyFCFwMafHyTrA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2F638BB7C6BAC428230DE8A8DEF585A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JSVuLfCjgQMBoeH+qP8xLXjPgHD3BiSD+BRx9RBEL0HMR5q45DTvCrDvxT5Gj7bJLYhrMsnLe0zaOBDxr82+92R8lyhWQXjrGAFRhr7Dpuj7cZgstegnOeUjo2AVepYfygtKPlPYENazDguY6jjuPiz/7K6YcbdBY8QwTqBZBgVwNV/3dxLhjOHnbQGKLu89By+kGPBqv9nShtfvBs7Coh4s50ZIBQ3NoNLXyA5YXPwngKHq1rtfyEPXi8ENEHwUDY23oU1e44iTWNcR/rAGVq1vRpswHv+Jo8bfx3nMHHnvsYFIWioylp2/fznNUUaIdQup7sRdEsNZvnn/7OzqNA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SETPR03MB10564.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d05e72e-58e6-4a4d-4e2b-08def9ae45e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 02:46:42.4616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OlbeTs9sHEKOHltaIs19d/d/XIDmfCvU/ZTAnR6RydkZb3gjVowGNw2vjBGD4oqzeUPkXrGWAdex9qfPTIBYJSr+KlK7cvcFdmYkOPANGPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7064
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

T24gVGh1LCAyMDI2LTA4LTEzIGF0IDE0OjA3ICswMzAwLCBKdWhhLVBla2thIEhlaWtraWzDpCB3
cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIg
b3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSGksDQo+IA0KPiBPbiAxMy8wOC8yMDI2IDA2LjM3
LCBLYXJ0aGlrIEIgUyB3cm90ZToNCj4gPiBIaSBKYXNvbi1KSCwNCj4gPiANCj4gPiBPbiA4LzEx
LzIwMjYgOTo0NCBQTSwgSmFzb24tSkggTGluIHdyb3RlOg0KPiA+ID4gVGhlIGNhcHR1cmVfY3Jj
KCkgZnVuY3Rpb24gdmFsaWRhdGVkIHRoYXQgdGhlIENSQyBmcmFtZSBzZXF1ZW5jZQ0KPiA+ID4g
cmV0dXJuZWQgYnkgaWd0X3BpcGVfY3JjX2dldF9mb3JfZnJhbWUoKSBtYXRjaGVzIHRoZSBleHBl
Y3RlZA0KPiA+ID4gdmFsdWUuDQo+ID4gPiBIb3dldmVyLCBpZ3RfcGlwZV9jcmNfZ2V0X2Zvcl9m
cmFtZSgpIGFscmVhZHkgZ3VhcmFudGVlcw0KPiA+ID4gY3JjLT5mcmFtZSA+PSBleHBlY3RlZCB2
aWEgaXRzIGludGVybmFsIGxvb3A6DQo+ID4gPiANCj4gPiA+IMKgwqDCoMKgIGRvIHsNCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqAgcmVhZF9vbmVfY3JjKHBpcGVfY3JjLCBjcmMpOw0KPiA+ID4gwqDC
oMKgwqAgfSB3aGlsZSAoaWd0X3ZibGFua19iZWZvcmUoY3JjLT5mcmFtZSwgdmJsYW5rKSk7DQo+
ID4gVGhpcyBpc24ndCBmdWxseSB0cnVlIElNSE8uIFRoZSBjYXB0dXJlIENSQyBmdW5jdGlvbiBh
Y3R1YWxseQ0KPiA+IGVuc3VyZWQNCj4gPiB0aGUgZXhhY3QgbWF0Y2ggb2YgZnJhbWUgc2VxdWVu
Y2UgYW5kIHdpdGggdGhpcyBwYXRjaCB3ZSdyZSBqdXN0DQo+ID4gZ3VhcmFudGVlaW5nICc+PScu
DQo+IA0KPiBhcyBLYXJ0aGlrIHNhaWQ7IHRoZSBjbGFpbSBpdCBub3QgdHJ1ZS4gV2hhdCB0aGlz
IGNoYW5nZSB3b3VsZCBkbyBpcw0KPiByZWxheCB0aGUgc2VxdWVuY2UgY2hlY2sgdG8gYmUgb3Bl
biBlbmRlZCAuLiB3aGlsZSBjdXJyZW50IGNoZWNrIGlzDQo+IG1ha2luZyBleGFjdCBleHBlY3Rh
dGlvbi4gSW4gb3RoZXIgd29yZHMsIHdlIF9leHBlY3RfIHRvIHNlZSBjZXJ0YWluDQo+IGNyYw0K
PiB3aXRoIGNvcnJlY3QgdmJsYW5rIG51bWJlciwgd2l0aCB0aGUgcHJvcG9zZWQgY2hhbmdlIGlm
IGV4cGVjdGVkIGNyYw0KPiBuZXZlciBhcnJpdmVkIGluIGNvcnJlY3Qgc2VxdWVuY2Ugd2Ugd291
bGQgYmUgdW5hd2FyZSBvZiBpdC4NCj4gDQo+IExldCdzIG5vdCBkbyB0aGlzLg0KDQpIaSBKUCwN
Cg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBMZXQgbWUgZXhwbGFpbiB0aGUgYmFja2dyb3VuZCBv
ZiB0aGlzIGlzc3VlLg0KDQpNZWRpYVRlayBDUkMgSW50ZXJuYWwgUXVldWUgTWVjaGFuaXNtOg0K
TWVkaWFUZWsncyBEUk0gZHJpdmVyIHVzZXMgYSBwZXItY29tbWl0IENSQyBxdWV1ZSByYXRoZXIg
dGhhbg0KY29udGludW91cyBmcmFtZS1ieS1mcmFtZSByZXBvcnRpbmcuIENSQyBlbnRyaWVzIGFy
ZSByZXBvcnRlZCBvbmx5DQphZnRlciB0aGUgaGFyZHdhcmUgcGlwZWxpbmUgaGFzIHN0YWJpbGl6
ZWQgKDMgdmJsYW5rcyBhZnRlciBjb21taXQpLA0KYW5kIHRoZSBmcmFtZSBudW1iZXIgcmVmbGVj
dHMgdGhlIHZibGFuayBjb3VudCBhdCB0aGUgdGltZSBvZiBDUkMNCnJlYWRvdXQsIG5vdCB0aGUg
b3JpZ2luYWwgY29tbWl0IGxhdGNoIHRpbWUuDQoNCkZvciBleGFtcGxlLCBjb25zaWRlciA0IGNv
bnNlY3V0aXZlIGZsaXBzOg0KDQpUaW1lbGluZToNCiAgRnJhbWUgMTAwOiBGbGlwIDAgbGF0Y2hl
cyDihpIgZXYuc2VxdWVuY2U9MTAwDQogIEZyYW1lIDEwMTogRmxpcCAxIGxhdGNoZXMg4oaSIGV2
LnNlcXVlbmNlPTEwMQ0KICBGcmFtZSAxMDI6IEZsaXAgMiBsYXRjaGVzIOKGkiBldi5zZXF1ZW5j
ZT0xMDINCiAgRnJhbWUgMTAzOiBGbGlwIDMgbGF0Y2hlcyDihpIgZXYuc2VxdWVuY2U9MTAzIChs
YXN0IGZsaXApDQoNClF1ZXVlIHJlcG9ydHMgQ1JDcyB3aXRoIDMtdmJsYW5rIGRlbGF5Og0KICBG
cmFtZSAxMDM6IFJlcG9ydHMgZmxpcCAwIENSQyDihpIgZnJhbWU9MTAzDQogIEZyYW1lIDEwNDog
UmVwb3J0cyBmbGlwIDEgQ1JDIOKGkiBmcmFtZT0xMDQNCiAgRnJhbWUgMTA1OiBSZXBvcnRzIGZs
aXAgMiBDUkMg4oaSIGZyYW1lPTEwNQ0KICBGcmFtZSAxMDY6IFJlcG9ydHMgZmxpcCAzIENSQyDi
hpIgZnJhbWU9MTA2DQoNClBsYW5lVGVzdCBleHBlY3RlZCB2YmxhbmtzOg0KICB2YmxhbmtbMF0g
PSAxMDEgIChmbGlwIDEncyBldi5zZXF1ZW5jZSwgZm9yIGZsaXAgMCdzIENSQykNCiAgdmJsYW5r
WzFdID0gMTAyICAoZmxpcCAyJ3MgZXYuc2VxdWVuY2UsIGZvciBmbGlwIDEncyBDUkMpDQogIHZi
bGFua1syXSA9IDEwMyAgKGZsaXAgMydzIGV2LnNlcXVlbmNlLCBmb3IgZmxpcCAyJ3MgQ1JDKQ0K
ICB2YmxhbmtbM10gPSAxMDMgKyAxID0gMTA0ICAobGFzdCBmcmFtZSkNCg0KY2FwdHVyZV9jcmMg
Y2hlY2tzICg9PSBleGFjdCBtYXRjaCk6DQogIGZsaXAgMDogZXhwZWN0ZWQ9MTAxLCBnb3Q9MTAz
IOKGkiAxMDMgIT0gMTAxIOKGkiBGQUlMDQogIGZsaXAgMTogZXhwZWN0ZWQ9MTAyLCBnb3Q9MTA0
IOKGkiAxMDQgIT0gMTAyIOKGkiBGQUlMDQogIGZsaXAgMjogZXhwZWN0ZWQ9MTAzLCBnb3Q9MTA1
IOKGkiAxMDUgIT0gMTAzIOKGkiBGQUlMDQogIGZsaXAgMzogZXhwZWN0ZWQ9MTA0LCBnb3Q9MTA2
IOKGkiAxMDYgIT0gMTA0IOKGkiBGQUlMDQoNCkxpYnJhcnkgYmVoYXZpb3I6DQogIGlndF9waXBl
X2NyY19nZXRfZm9yX2ZyYW1lKGV4cGVjdGVkPTEwNCkg4oaSIHJldHVybnMgQ1JDIHdpdGggZnJh
bWU9MTA2DQogIFNpbmNlIDEwNiA+PSAxMDQsIHRoZSBsaWJyYXJ5IGNvbnNpZGVycyB0aGlzIHZh
bGlkIGFuZCByZXR1cm5zIGl0Lg0KDQpUaGUgQ1JDIHZhbHVlIGlzIGNvcnJlY3QgKGl0IGNvcnJl
c3BvbmRzIHRvIHRoZSByaWdodCBmcmFtZWJ1ZmZlcg0KY29udGVudCksIGJ1dCB0aGUgZnJhbWUg
bnVtYmVyIGlzIGxhcmdlciB0aGFuIGV4cGVjdGVkIGR1ZSB0byB0aGUNCnF1ZXVlwqBwcm9jZXNz
aW5nIGRlbGF5LiBUaGlzIGlzIGFuIGluaGVyZW50IGNoYXJhY3RlcmlzdGljIG9mIGhhcmR3YXJl
DQp0aGF0IGJhdGNoZXMgQ1JDIHJlcG9ydGluZywgYW5kIGRvZXMgbm90IGluZGljYXRlIGRhdGEg
Y29ycnVwdGlvbiBvcg0KYnVmZmVyIG92ZXJmbG93Lg0KDQoNCkNvbnNpc3RlbmN5IHdpdGggb3Ro
ZXIgSUdUIHRlc3RzIGFuZCBsaWJyYXJ5IGNvbnRyYWN0DQoNCkxvb2tpbmcgYXQgaG93IG90aGVy
IHRlc3RzIGhhbmRsZSBpZ3RfcGlwZV9jcmNfZ2V0X2Zvcl9mcmFtZSgpOg0KMS4ga21zX3JvdGF0
aW9uX2NyYyBhbHNvIGNhbGxzIGlndF9waXBlX2NyY19nZXRfZm9yX2ZyYW1lKCkgYnV0IGRvZXMN
Ck5PVCB2YWxpZGF0ZSB0aGF0IGNyYy5mcmFtZSA9PSBleHBlY3RlZC4gSXQgb25seSBjb21wYXJl
cyBDUkMgdmFsdWVzDQpiZXR3ZWVuIHNvZnR3YXJlIGFuZCBoYXJkd2FyZSByb3RhdGVkIGZyYW1l
cyAoaWd0X2Fzc2VydF9jcmNfZXF1YWwpLg0KMi4ga21zX3BpcGVfY3JjX2Jhc2ljIChyZWFkLWNy
Yy1mcmFtZS1zZXF1ZW5jZSBzdWJ0ZXN0KSB2YWxpZGF0ZXMgdGhhdA0KY29uc2VjdXRpdmUgQ1JD
cyBoYXZlIGZyYW1lICsgMSA9PSBuZXh0X2ZyYW1lIChyZWxhdGl2ZSBpbmNyZW1lbnQpLA0KYnV0
IGRvZXMgTk9UIHZhbGlkYXRlIGFic29sdXRlIG1hdGNoIGFnYWluc3QgYW4gZXhwZWN0ZWQgdmJs
YW5rIGNvdW50Lg0KMy4gVGhlIGxpYnJhcnkgQVBJIGlndF9waXBlX2NyY19nZXRfZm9yX2ZyYW1l
KCkgaXMgZXhwbGljaXRseSBkZXNpZ25lZA0Kd2l0aCA+PSBzZW1hbnRpY3M6DQpkbyB7DQogICAg
cmVhZF9vbmVfY3JjKHBpcGVfY3JjLCBjcmMpOw0KfSB3aGlsZSAoaWd0X3ZibGFua19iZWZvcmUo
Y3JjLT5mcmFtZSwgdmJsYW5rKSk7DQpJdHMgY29udHJhY3QgaXMgInJldHVybiB0aGUgZmlyc3Qg
Q1JDIGF0IG9yIGFmdGVyIHRoZSByZXF1ZXN0ZWQgZnJhbWUuIg0KTm8gb3RoZXIgY2FsbGVyIGlu
IElHVCBhZGRzIGEgc3RyaWN0ZXIgPT0gY2hlY2sgb24gdG9wIG9mIHRoaXMuDQoNClRoZSBjYXB0
dXJlX2NyYygpIGV4YWN0LW1hdGNoIGNoZWNrIGluIGttc19wbGFuZSBpcyB0aGUgb25seSBwbGFj
ZSBpbg0KdGhlIGVudGlyZSBJR1QgY29kZWJhc2UgdGhhdCBpbXBvc2VzIGEgc3RyaWN0ZXIgcmVx
dWlyZW1lbnQgdGhhbiB0aGUNCmxpYnJhcnkncyBvd24gQVBJIGNvbnRyYWN0LiBUaGlzIG1ha2Vz
IGl0IGluY29tcGF0aWJsZSB3aXRoIGRyaXZlcnMNCnRoYXQgdXNlIHF1ZXVlZCBDUkMgcmVwb3J0
aW5nLCB3aGlsZSB0aGUgYWN0dWFsIENSQyB2YWxpZGF0aW9uDQooY29tcGFyaW5nIHBpeGVsIGNv
bnRlbnQpIHJlbWFpbnMgY29ycmVjdC4NCg0KR2l2ZW4gdGhhdCB0aGUgbGlicmFyeSdzIEFQSSBj
b250cmFjdCBpcyA+PSwgYW5kIG5vIG90aGVyIGNhbGxlcg0KZW5mb3JjZXMgPT0sIHdoYXQgd291
bGQgYmUgdGhlIHByZWZlcnJlZCBhcHByb2FjaCBoZXJlPw0KDQpUaGFua3MsDQpKYXNvbi1KSCBM
aW4NCg0K
