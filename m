Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CCDEF4EA4
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 07:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610B310E1F4;
	Mon,  6 Apr 2026 07:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mbxa2D0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E2310E1F4
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 07:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775462304; x=1806998304;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vWt6W4vKdOX/YUatiAEvp2JmkClt+Q+G6IZrQJI25Z0=;
 b=Mbxa2D0ofHKppaWcECyzvIcU4gZ72IS7hCSFW1NJIgDmnm66hgluTVgj
 gajkVtHjdtZ9WAUoXi4u14gFVnLOvlVu2d9JJTZy4VH1F8Dfh1G6vhDA5
 oiCLOY5AatkJCZv6qbVRyECoG6HqtNKtVGdNIJKxdbQdwtdhGPZY7zgx+
 DdUaemxOXpeupr9bjlGPAR+rHbOlCUmcZfGzo1N9MuNco0NawSOFMalG2
 hDEeyQtwLxoUAedcQwNoAWuVX619+TA3rMkOJHO6Vdt0RSMNyuY/ZC5fe
 70Iu+QPNBgMP7MLEcIzYJwbPhufXUxLEkzbIRSZHmUSvCMmSELLiu6ITM Q==;
X-CSE-ConnectionGUID: /+4qJW3uQxa3Y6lnlqVo7g==
X-CSE-MsgGUID: EOwKaZj+ROaxIgRJpMqezg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="87801805"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="87801805"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 00:58:23 -0700
X-CSE-ConnectionGUID: OzTfqz5QTMOlBA6p7arm7Q==
X-CSE-MsgGUID: bhTsdoE2QQC0gh1EZc3wPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="265787999"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 00:58:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 00:58:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 00:58:23 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 00:58:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/SlwLp+8Hbfi6yrPkXZ0tnEvFJXVj8s2VP6yZJf28sLgAqemPgqjHlcMuf4f7D/1SCnVY+fHz9S15ExuJ/AuMlgdkXY+tbsnrwORxSw9fVLva+GpX3o6I4LIDiDp6XLhhqEelfdH2N5VjR8DN6p1a8/jlMnQ+qCxJG2a+4OFFwZ4BoQaWjPPAfy83VMbch/80VgnxSRhXhMwpf/Fj0crj76YIfoQOoz7ZhHYlowV4T5hmc7LeqNc7i+726mMVPdyIOvXAeSDS7OfeMLzYWPLMLK1hHQPmXbWA7xbGHftjQUADnet3Yw7cQ/Vg/biZuXJjqZ4hcjzTmKuk/jI3ezAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWt6W4vKdOX/YUatiAEvp2JmkClt+Q+G6IZrQJI25Z0=;
 b=O1jnoeCO8l8k4Z15XNmGd3zjpHVz1eERx3guoOYSf0x6w2EJfJv7Xmvu3UXuIhJx6eZMflZ/NIArF8RcOKkuCQNaaHhA6w2zNlY7LNPG9KBHaftJLIkUeRPSuJOQegVwsnay2tnkF6JKzyOFInxPE3o6IAxBYnYbSE7dCGAj74UvuNV7DukZy4xiLZK3K3itWT61Ns/Z0+Nnrdkes9jFybrqfIimm9bURwU187OWU63646EXp2ouxKrECsu51cQG9tbjfOMlwvmb0RILcnM3bzC8tLx4YhzGiuCOFhXWIWsQPKZBL+gaY3bbo5KE8NLHbVDIaptioczmQiAnQhuldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by CH8PR11MB9481.namprd11.prod.outlook.com (2603:10b6:610:2bb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 07:58:20 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9769.015; Mon, 6 Apr 2026
 07:58:20 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v1] README: Document skip message format
Thread-Topic: [PATCH i-g-t v1] README: Document skip message format
Thread-Index: AQHcwY27KoF8xfSpZ0iCiOSi+tqFGLXLu+GAgAX1yuA=
Date: Mon, 6 Apr 2026 07:58:20 +0000
Message-ID: <PH7PR11MB679649DA56147A6603331E9AE55DA@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260401043317.890733-1-sowmiya.s@intel.com>
 <27e9a4b4a37b220b0cf36901987ae7787d938922@intel.com>
In-Reply-To: <27e9a4b4a37b220b0cf36901987ae7787d938922@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jani.nikula@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|CH8PR11MB9481:EE_
x-ms-office365-filtering-correlation-id: 1f8f0417-416a-4677-cd0b-08de93b244dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: aLv3uCvxVGvcoD095ly9Mbq5c4CI/OpbyLmbQl2iXgaawI1w+D2e6wTp56scCpkkEPZcMr+cCMvuOGN6freFegsokvk36ugqEwvu8MfF40/ZGWJ0a76uNAEorx33K9TNvTYnPpolw9F0yFvtZ6wTRhE8CGeb3Wr3uT1EcuxUMm3HAZd9IiyWzwFExE2HFQUo39T42cGCLqgiNHTS0yFzGwkbmAaYBmyXXtgSxF9oL/YkOtQzjJ9mkgw3NAasoyuJWmAayTJH9dkTIhTuBU0qIoh6cwFr2xjd1CNbb1tWqUghdXPzXOg9qx4xrmJqEiQSlujesM+zyBFYJ4atM1mNk/WGsAZissyEgDSoii+s2YCxr1dg76no1KVMHKclMMx2i+Z1K0mSToRNybXeMjbdEDk+6qnWC5sfVpvOOe7jv4a8/Uw79bZbEK493F4tMW4rz6rHm6a34ijvFqSpmnhiZqEZjLjv38i9xAJbNLkDftUTxurcpnXlX1fc92vEOpzvlxkp5g4zuj+9ZLspp+0VTLxQATQNCcyl3QFcWR1YyeCQxUgvKybRoR0nmoqHZ3K+/0yQ7yCwDU9V7ZihmK/03FfJa8XfigTc61Ck4tt+PMl3ebeLJ+xyshgj2+bP/tJG2S3/gIj6WU+yKS4NX/GFRJneVaHo3ZkhGf+2hTuzwRCfkwCxa8dC48EnghcWKlvcOZVperorf1dUjYVZ6FgculIZu6QMb6y9EWnvzCeUqXBbzHBF7kwRcBk3D3BsNyQRs7pYRJq1Aie48z+K8MKvVmdth3vNzt9rZDdQdObHFx8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGdlNkdFSVRVb1V0SVJrMytjQTROcTVrYmdKQ1RpOWJoSEszdlo5ckx6VFhL?=
 =?utf-8?B?bWJTUitGU0VGWFlaeHJhNlJsK08wRFBhcFVkTE41YXRhUHFKZ0JPMytqK25q?=
 =?utf-8?B?cWt3QVF0bHVuVnlXSGxQVGhDUVF0cDYxYVpOamJXS05ldEgydGVOV1pCb0t0?=
 =?utf-8?B?dDYwM3hxM2EzZUxGeUVCTHdZMVpVVklXSytIWXI2R1ZiUWkwanRXNmVMbldQ?=
 =?utf-8?B?dHFKY3A4RldSeE5zdW14SjdlUDVrU2QwS1Exa0htTWxia1RYSm9qWTNteGN3?=
 =?utf-8?B?c0pUZ29nd3ovNDZzSFg4YnI0RTlURWJzMDdTemNVMUY3UmZDbmlBazJqTkdO?=
 =?utf-8?B?bWpqQis3amdqL1hXVWFXa2Z6Qm03YytUSDRQNno4WCs2V2Rob1Q2eVVZR0Ry?=
 =?utf-8?B?YTZoa3N4Rk5kZlhhSkNrb01UZE96TnJWRExhZXdIMERoNlZtSUJhWHlhWFNY?=
 =?utf-8?B?WEtTS1JxVlNDV3BuVHdTZVBvU1pIekZoYzRLUkxsbi94aldUNWpsZUFESTBx?=
 =?utf-8?B?TThTWEFwUGx5ZHYxeEpueFlMRU5TSXpJZEFOekJjbi9MTHh2UFRWZml3ZWpF?=
 =?utf-8?B?WVpiMVN6dHJycDVhWHpKczFDYmNmWC9WemRhVHQvMVkzbm9GTkhoc0pUVm13?=
 =?utf-8?B?MEtNRytENXRPby9WbEVKUE0wa25Cc2FTOUZaeStrQlUyTjR1NC9CNWd3V09p?=
 =?utf-8?B?Mmxvb2JKaFdmVXhuTlhtSUlSTUVaVnJqTDgxeWM4UlU2ZW5JL0JQSUI3NGFH?=
 =?utf-8?B?SWRKYjdrcXM4RGtqNTlsSEsrZHFLT3N0UGZwTUJzVXNTakx6dGcxeUpZeGRG?=
 =?utf-8?B?NTEvTGpDQitCbnhqQkc4UnFIazkycGd3NXdoSXI4a3dHakcxRFV4cThzUWg5?=
 =?utf-8?B?OCtKQVpwMlRhN0JJUlFNMnYzOEI0cE04TklHdmtDdFE0dDZycmV1ZVZQVE5z?=
 =?utf-8?B?Q1h4MVpTU0VZWDlwbDNITnZIakxZWnFMR3Q3TXEvZDdCckltaWYzRkc3dU9n?=
 =?utf-8?B?YnNyZWc0c2FzVUNyWXpFeC90YnBCQ2U5V2dwUHFZSGwybkNlaGRCdWdwSXEw?=
 =?utf-8?B?WC80bGw0V2s1a0VFMUJ5aGQwL2M5cTdNNTIwWGx4ekFzWGk2bDNTaTcxMzZy?=
 =?utf-8?B?NWxITzFXQkhBYW5qZmF1Yk5CcnEwb0tkMWxGTGlCZFRiSmRtUE90MXlGNDRi?=
 =?utf-8?B?bVJQUWNxYzZHWk95a29BNnZFeHJMb1BQMkxYaHhQTW9Rakx4bzB0WlJkWUNI?=
 =?utf-8?B?SldNUHp3V2ZmMjgrZTYyanRIdm1pTUVuMzdpenhoZ25PNDUwMDluRklmNzFy?=
 =?utf-8?B?RFJjWW9CMHpGU2UvTjlJU29xV3cxYVFkVEEzbTFLN3ZaWDNYUE4rUFM3ZXVX?=
 =?utf-8?B?dUtQWkxSS2U3b2xFemdkVy94NU1MTXJVOVNtQUxMcWRtVTZsRWVnMGNVemNq?=
 =?utf-8?B?Ym1ZeGJUNHJMSHdKWU9QRThEcENnK1doV21IT040M1NtQnhSSlRvby8xSHd3?=
 =?utf-8?B?d2pRclQ0emdlOWM0bm5NVzdCM253VCtwaDJ5QUNVVmh6NHdZdGo3VzNTS2Zt?=
 =?utf-8?B?RW1pYWZ4RGozUGo5UTlXZEE4eS9CUkE1Uk8ydTA3cnpIcTl4aXpKQmRZVlN4?=
 =?utf-8?B?VkdqOExXZEl3d1lTS0N3OTF3d0Qra0FGRWJsWEZCVGhsZms2aEs4c0V6VEFC?=
 =?utf-8?B?NStFZnh4Y0htMEE3SlFTTEJqL2c1NHd2ZXp2Rzl5OTNIeEwyemZCWXNIWnhT?=
 =?utf-8?B?Zk1FdDJlTm9qRCt0SEdZalBScGJQejVXQ2o3Uzc4ckxzRFBoRkVaZUszNEVO?=
 =?utf-8?B?VUI0NStySEl3c1pmMlFudm5FSUNvTkEzZFZLcnNLaW8zcUtrRW4rT3VuZFVl?=
 =?utf-8?B?bWRhbXpMTW1Wb2JvQUhDTzdDM2txUXB6a0ZPZ3R6R3I1Z1ZsdmRWQlgrdFpI?=
 =?utf-8?B?bURTWkVGc09tWnZTTy9ScGVrSXl1MUZBdW5BSlhhQ2pkdUE5NTlIR3lWRDhx?=
 =?utf-8?B?SDRHTzExOGRzYk50UllPMjVWL0xaMFplSmRBUXZDMWhaSDdVdC80b29Mc1lw?=
 =?utf-8?B?V1dlODhXL2hwNmwxbW1pcEJ0dUxWaUk0OEdOK0xBRThnVFBPbnJ6ODM3YTcw?=
 =?utf-8?B?b0Z1aTBVZWt0UFhURWV6OXRlZmtwSG9NaTZUejhHRGs4L3dLRlZLVkhDUUhY?=
 =?utf-8?B?dFB5cityZVp2TkJ3UDl5dzJGc3BDaDRiYTVMd1J1dm1BODZsRXZiMWpkeURC?=
 =?utf-8?B?OHdCRVFFY0ZzRmQ4K0w5d1ZjZmpPUm5OZitIMmlDeWtibnVYcHgzWmp3dDI3?=
 =?utf-8?Q?Svfdrzs7+8Mp5G/+BC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ph8v5ZOzAciB4jQ6GyUzKMXUdOi8DW46qYNc5Hez+dar+F+l3gkRLkIlAZuNUzhWTxGJTL2b/e7n1/IG72HwhqsGee/HAr7zwTIw7gzTuaJvSMk/6giyPCXZqUXzrPd2x6TbKtqtwQ1BMChT2/bLkBipywSQqfbo9OBqfz/OUCsYXuGhAK3MkNUBR/PONfDsxyUDRsUsg/Jfo6XowBm8mRqiET5vUAMDb5c/HPU2OUyRkFBB/4oE1uOevV8H99gYPWFnqzkCn71lRnBf9X3Sx6ZDNLtxV6x0dsaXkLnANJQqIM/MFV6CMmh0YfRPBjVOrmrGlqpU3NYtlljlCclmzA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8f0417-416a-4677-cd0b-08de93b244dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 07:58:20.2019 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +JiPsv39s65rZNf586s+D0rnNzyi/UT0xL8sVpCu5YlYSfVjV1znrSxMU5FRou9qiWaE37CLseLpFiP3f124bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9481
X-OriginatorOrg: intel.com
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

SGkgQE5pa3VsYSwgSmFuaSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gU2VudDogMDIgQXByaWwg
MjAyNiAxODoyMg0KPiBUbzogUywgU293bWl5YSA8c293bWl5YS5zQGludGVsLmNvbT47IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCIFMsIEthcnRoaWsgPGthcnRoaWsuYi5z
QGludGVsLmNvbT47IFNoYXJtYSwgU3dhdGkyDQo+IDxzd2F0aTIuc2hhcm1hQGludGVsLmNvbT47
IFMsIFNvd21peWEgPHNvd21peWEuc0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
aS1nLXQgdjFdIFJFQURNRTogRG9jdW1lbnQgc2tpcCBtZXNzYWdlIGZvcm1hdA0KPiANCj4gT24g
V2VkLCAwMSBBcHIgMjAyNiwgU293bWl5YSBTIDxzb3dtaXlhLnNAaW50ZWwuY29tPiB3cm90ZToN
Cj4gPiBBZGQgYSBjb25jaXNlIGd1aWRlIGZvciB3cml0aW5nIGNvbnNpc3RlbnQsIG1hY2hpbmUt
ZnJpZW5kbHkgc2tpcA0KPiA+IG1lc3NhZ2VzIGluIElHVCB0ZXN0cy4gRGVmaW5lcyB0aGUgZm9y
bWF0Og0KPiA+DQo+ID4gICBTS0lQOiA8cmVhc29uPiBbKDxjb250ZXh0X3R5cGU+OiA8dmFsdWU+
KV0NCj4gPg0KPiA+IGFsb25nIHdpdGggY29tbW9uIGNvbnRleHQgdHlwZXMsIGV4YW1wbGUgbWVz
c2FnZXMgYW5kIGEgY29kZSBzbmlwcGV0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU293bWl5
YSBTIDxzb3dtaXlhLnNAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBSRUFETUUubWQgfCAzNyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAzNyBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvUkVBRE1FLm1kIGIvUkVB
RE1FLm1kDQo+ID4gaW5kZXggYjRiOWEzN2VhLi5hNjUyY2MwZDEgMTAwNjQ0DQo+ID4gLS0tIGEv
UkVBRE1FLm1kDQo+ID4gKysrIGIvUkVBRE1FLm1kDQo+ID4gQEAgLTE4OCwzICsxODgsNDAgQEAg
SW1wb3J0ZWQgbm9uLURSTSB1YXBpIGhlYWRlcnMgZnJvbSBhaXJsaWVkJ3MgZHJtLQ0KPiBuZXh0
IGJyYW5jaC4NCj4gPg0KPiA+ICBUaGVuLCBjb21taXQgd2l0aCBhIG5vdGUgb2Ygd2hpY2ggZXhh
Y3QgY29tbWl0IGZyb20gYWlybGllZCdzIGJyYW5jaA0KPiA+IHdhcyB1c2VkIHRvIGdlbmVyYXRl
IHRoZW0uDQo+ID4gKw0KPiA+ICtTa2lwIE1lc3NhZ2UgRm9ybWF0DQo+ID4gKy0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gPiArDQo+ID4gK0tlZXAgc2tpcCBtZXNzYWdlcyBjb25zaXN0ZW50IGFuZCBt
YWNoaW5lLWZyaWVuZGx5LiBVc2UgdGhpcyBjb25jaXNlDQo+ID4gK2Zvcm1hdCBhbmQgaW5jbHVk
ZSBhIHNpbmdsZSwgbW9zdC1yZWxldmFudCBjb250ZXh0IHdoZW4gYXZhaWxhYmxlOg0KPiA+ICsN
Cj4gPiArLSBGb3JtYXQ6IGBTS0lQOiA8cmVhc29uPiBbKDxjb250ZXh0X3R5cGU+OiA8dmFsdWU+
KV1gIChhbHdheXMgZW5kDQo+ID4gK3dpdGggYFxuYCkNCj4gPiArLSBSdWxlczogc3RhcnQgd2l0
aCBgU0tJUDpgLCB1c2UgYSBzaG9ydCBsb3dlcmNhc2UgYHJlYXNvbmAsIGluY2x1ZGUgYXQNCj4g
PiArICAgIG1vc3Qgb25lIGBjb250ZXh0YCBpbiBwYXJlbnRoZXNlcywgdXNlIGAweCVsbHhgIGZv
ciBtb2RpZmllcnMsIGFuZA0KPiA+ICsgICAgZG8gbm90IGFkZCBhIHRyYWlsaW5nIHBlcmlvZC4N
Cj4gPiArDQo+ID4gKyMjIyBgQ29tbW9uIGNvbnRleHQgdHlwZXMgYW5kIGV4YW1wbGVzOmANCj4g
PiArDQo+ID4gKy0gYGNvbm5lY3RvcmA6IGRpc3BsYXkgY29ubmVjdG9yIG5hbWUg4oCUIGAoY29u
bmVjdG9yOiBIRE1JLUEtMSlgDQo+ID4gKy0gYHBsYW5lYDogcGxhbmUgdHlwZSDigJQgYChwbGFu
ZTogcHJpbWFyeSlgDQo+ID4gKy0gYGZvcm1hdGA6IGZvdXJjYyBmb3JtYXQg4oCUIGAoZm9ybWF0
OiBOVjEyKWANCj4gPiArLSBgbW9kaWZpZXJgOiBidWZmZXIgbW9kaWZpZXIgKGhleCkg4oCUIGAo
bW9kaWZpZXI6IDB4JWxseClgDQo+ID4gKy0gYHBpcGVgOiBwaXBlIGlkL25hbWUg4oCUIGAocGlw
ZTogQSlgDQo+ID4gKy0gYHBsYXRmb3JtYDogR1BVL3BsYXRmb3JtIG5hbWUg4oCUIGAocGxhdGZv
cm06IGk5MTUpYA0KPiA+ICsNCj4gPiArIyMjIGBDb21tb24gY29uY2lzZSBtZXNzYWdlczpgDQo+
ID4gKw0KPiA+ICstIGBTS0lQOiBubyBzdWl0YWJsZSBjb25uZWN0b3IgYXZhaWxhYmxlYA0KPiA+
ICstIGBTS0lQOiBjb25uZWN0b3IgaXMgZGlzY29ubmVjdGVkIChjb25uZWN0b3I6ICVzKWANCj4g
PiArLSBgU0tJUDogbm8gc3VpdGFibGUgZGlzcGxheSBtb2RlIGF2YWlsYWJsZSAoY29ubmVjdG9y
OiAlcylgDQo+ID4gKy0gYFNLSVA6IGZvcm1hdCBub3Qgc3VwcG9ydGVkIChwbGFuZTogJXMsIGZv
cm1hdDogJXMpYA0KPiA+ICstIGBTS0lQOiBtb2RpZmllciBub3Qgc3VwcG9ydGVkIChtb2RpZmll
cjogMHglbGx4KWANCj4gPiArLSBgU0tJUDogcGxhbmUgbm90IGF2YWlsYWJsZSAocGxhbmU6ICVz
KWANCj4gPiArDQo+ID4gKyMjIyBgRXhhbXBsZSB1c2FnZTpgDQo+ID4gKw0KPiA+ICtgYGBjDQo+
ID4gKyAgICAgICAgaWd0X3NraXBfb25fZighZm10X3N1cHBvcnRlZChwbGFuZSwgZm10KSwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICJTS0lQOiBmb3JtYXQgbm90IHN1cHBvcnRl
ZCAocGxhbmU6ICVzLCBmb3JtYXQ6ICVzKVxuIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGlndF9wbGFuZV9uYW1lKHBsYW5lKSwNCj4gPiAraWd0X2Zvcm1hdF9zdHIoZm10KSk7
IGBgYA0KPiANCj4gIlNLSVA6IiBjb21lcyBmcm9tIHRoZSBwbHVtYmluZyBhbHJlYWR5LCBkb2Vz
bid0IGl0PyBUaGVyZSdzIG5vIHBvaW50IGluIGhhdmluZw0KPiBldmVyeSBpZ3Rfc2tpcCogY2Fs
bCBpbiB0aGUgY29kZWJhc2UgYWRkIHRoYXQuDQo+IA0KPiBJbiBnZW5lcmFsLCB5b3UnZCBkbyB3
ZWxsIHRvIGRvY3VtZW50IGN1cnJlbnQgdXNhZ2UgZmlyc3QsIGFuZCB0aGVuIHN1Z2dlc3QNCj4g
Y2hhbmdlcy4gV3JpdGluZyBhIHdpc2hsaXN0IGRvY3VtZW50aW5nIHdoYXQgeW91J2QgbGlrZSB0
byBzZWUgaXMgbm90IGdvaW5nIHRvDQo+IG1ha2UgaXQgbWFnaWNhbGx5IGhhcHBlbi4NCj4gDQo+
IEJSLA0KPiBKYW5pLg0KDQpUaGFua3MgZm9yIHRoZSBjb21tZW50LCBKYW5pLiBZb3XigJlyZSBy
aWdodCDigJQgdGhlIFNLSVA6IHByZWZpeCBpcyBhbHJlYWR5IGFkZGVkIGJ5IHRoZSBmcmFtZXdv
cmsgYXQgdGhlIGVuZCBvZiB0aGUgc3VidGVzdCwgYW5kIGhlcmUgSSB3YXMgaW5jbHVkaW5nIGl0
IGFzIHBhcnQgb2YgdGhlIHNraXAgcmVhc29uLCB3aGljaCBpcyBpbmRlZWQgcmVkdW5kYW50LiBJ
4oCZbGwgcmVtb3ZlIHRoYXQuDQpJ4oCZbGwgYWxzbyB1cGRhdGUgdGhlIGV4cGxhbmF0aW9uIHRv
IGZpcnN0IGRvY3VtZW50IHRoZSBjdXJyZW50IHVzYWdlIGFuZCBiZWhhdmlvciwgYW5kIHRoZW4g
b3V0bGluZSB0aGUgbW90aXZhdGlvbiBhbmQgc3RlcHMgZm9yIGltcHJvdmluZyBhbmQgc3RhbmRh
cmRpemluZyB0aGUgc2tpcCByZWFzb25zIGdvaW5nIGZvcndhcmQuDQpSZWdhcmRzLA0KU293bWl5
YSBTLiANCj4gDQo+IC0tDQo+IEphbmkgTmlrdWxhLCBJbnRlbA0K
