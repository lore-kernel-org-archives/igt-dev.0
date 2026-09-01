Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF94C624C6
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 09:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDB110E3C8;
	Tue,  1 Sep 2026 09:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lofsWYiU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5108D10E3D3
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 09:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788254112; x=1819790112;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d9ZEIDmW9f5dtRNSX9AvNcIglLr5R91N5Plvl3qnd+Q=;
 b=lofsWYiUPIoyvT+erBngyYf93Ga4fUOp475FbyRDW71cN7XZptD7gHUu
 jKDRKn3gfCOxaB0+H48Pu/EpDX1V0dX9Sl4VDleDb0pwhrs/SKLy7rcTn
 5Ccpts/PgT0pb0Tca/eHtLyLU2fDb/kt/AFc7tG1o2HYa98UM+sPifPfk
 SluahcwrnJEA9y4aDJPz96ZWxDqyfY0z/waooEyBbfmgi5VMmTpxKxU5C
 /JAcPHBZX0PYan8QuYDsAxmYAM7YHNmu00PhrDLgb6q4++n5SIaUFNSlc
 Psc6W3PUkvuqFQxQtRN4+8aM169psxO0TTmpBbR6kiY3ngSliK8afXH4C A==;
X-CSE-ConnectionGUID: AByIyQdbQDevn8ZcDkRKBA==
X-CSE-MsgGUID: 6zi5pgeeS2CPIAbuJZ1vog==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92492480"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="92492480"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 02:15:11 -0700
X-CSE-ConnectionGUID: sWi55qKBRnqGOtLLsp7oKg==
X-CSE-MsgGUID: 7sVyJwRHRP2FwDvEJNHLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="298934824"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 02:15:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 02:15:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 02:15:11 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 02:15:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDo4QEABnA32lCJsCqazHv7r2S5xme/rMwhsSmnfwHVcwLg3tfYlrk+xSy6tNgCd/L90mZ5nIHKBtXQlasm6bvmlIGG8R12eNuTRd99hNNrXY3t4Howeb8/2kuPcitWEtjOY+/v/CfMQXhKy49uoIzwdf+MNOgTRqkH+YVPD/XvFbCmvBKp7LZAqaUwmb2U3YLVZYQLVQKMHxREjeWIc+0LNXnLQFuJwIvjp+WQ5xI7yOcl26jiPFR3fSvAlAlAAVq7xyLsndFHhJIR7EtUOppz9OlH01S8Zs+9YmTSLwAgaC14ZP5jBBGJ7H3U7KLwqKirr4qsJsOkUkuIp6FPykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9ZEIDmW9f5dtRNSX9AvNcIglLr5R91N5Plvl3qnd+Q=;
 b=Ields01woeN+CPtXMh+2Z4WuiYYUTVhDm+HRliQZSQZx7om/flFdTTzALoU7SnEhwu5pd+Q45YONAWNRMsnM00P/hYrLlaKWSarh0xhenV3kpjnOCkiJDDuPTYOpHWSAmats4+FSHyq/NqWQAplVSYp1oN65dlj7arvlYUPN3tZrOPTvu+m1KXS0NeelJ4H1PC1y3k3hjAjLbppPij7fx9QRFuxwmRzGl3RaEaJ/xI1wnfUSZtd+baPUFAxzdrLBQsyHQ0+6GuRQQXFd8byL1egMNr/C1C3wOMjS4Dc4f6QK8DgTahSfMHb5ZX1KuYJLyNVRsX8GzFKJlJZnSEGZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA3PR11MB8024.namprd11.prod.outlook.com (2603:10b6:806:300::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 09:15:05 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 09:15:05 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "Grzelak, Michal" <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t v5 4/7] tools/vbt_decode: parse & dump VS/PE-O
 tables for LT
Thread-Topic: [PATCH i-g-t v5 4/7] tools/vbt_decode: parse & dump VS/PE-O
 tables for LT
Thread-Index: AQHdClCEVKTQYlIvs0up9O8QCrzDcra5zzQQ
Date: Tue, 1 Sep 2026 09:15:05 +0000
Message-ID: <PH7PR11MB6053D10692F01DA128CBA26BE7A82@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260702182619.3973788-1-michal.grzelak@intel.com>
 <20260702182619.3973788-5-michal.grzelak@intel.com>
In-Reply-To: <20260702182619.3973788-5-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA3PR11MB8024:EE_
x-ms-office365-filtering-correlation-id: 17ec39f8-2abf-4419-a090-08df0809832c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|6133799003|18002099003|22082099003|56012099006|3023799007|38070700021|10067099003|11063799006|4143699003;
x-microsoft-antispam-message-info: Tv3zWDLIXLqtdzf9X49eAnR5MGFt4Hzre9KXFEv7l1JHvW/EeeJ8ZB+WlvLMZU0Dhjq+WkUYylDuGCxqjeLw5kTB68qT4EofV5yZPbBgKbb5kp4+GvjpbB2h0nWeSKBHnFfCVUQW9CeEQbMqZIjZ6J918XuVXQM6b6fkm9QvWIQZsf6yVYgPKeC+PqUGz05EJFpZ9GoqpNk3f8Vx424x15aKSK1FbYt+OTygppq26XUbiEzKtIQ8VqntqoIXH1CTFGBP7xiMnmjRvQDkL7iIS4Zt+A+amAE7M24l8oFghSfmSasXe5JOdMD5wsz8KjH1rtG2iPY2mZ5cpVM6Hxyt2wPcpUvT/UmJ5UQvzaox6jXWQqnYpaCV4slmA7S0M2A7Cwhl3LsnzzT/EnsXTZdUMgc7IUxjY5YLm11jjb5xPHl/QnL8YK3rW6E0mMjNJ8yioExl/eH/elawY18G2aK9IztQ6Od7WgRCSciQvthEkIBVO1FVdo6MvWL4Kus4aXv6u6dtxrolfu65Dev7Kgjr4uktRbG/pXUlP3i1zaKIqWGLObBfi4ymOqNOzWTpb81T9urEvfoLxsc7a0k98FZNdy2w/0V1XsXJ6bEvnSa4juVUAzt3oiJ8cWybFswCQpW3Ma3z5F1X8e7N9RT9udZDVKo83I3nyE2ouiEKjqKIfw8gYnBj1hOz6rmWvgr+dAfb3wR7NNCe50bxlGKk3ipaKb7bO8srfHYLF6nofPUp+uc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007)(38070700021)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnJNZ0VQUXVKQjRJbWQxbEFLMyt3dEVoUS9NdXZMWnlXbE5rVGIxcDlGSStR?=
 =?utf-8?B?ajcyTmxYYnh3L0JvcjRqZkJxc09Td0xzTndPaC9jMUlNSzNFVlpSMlRFakJX?=
 =?utf-8?B?MkxhR0VvS2pMY2JMeHdQV2R6bHdxTkFlaG9mN0FBRzdublhOUnR6YXIyay9v?=
 =?utf-8?B?Wm13WUlTV0JUSjFFaWJQWjM5UVMzZUhUdFd0bHdseEQrdWZ6eVZLVHowWG5P?=
 =?utf-8?B?SlpCWlJtaWJ2WGcramxCWWZnUms4YlRodFpzNUdHcVRBN21rSHYzaDkwUEg0?=
 =?utf-8?B?a3RVQkZaODgrV2p3VFZaWDNHMVFMWFJib0FsZ2ErdnlnaG1RcHh6NXFXcGdv?=
 =?utf-8?B?M2pxRDM3RkIrcko4UmZhZ29qR2RtSVZNeFNVQmp5c0UxSkxOT05FWDhtV3Z3?=
 =?utf-8?B?cW9hYWVrYkF4VmYvdlNKbHdpU3NiZG9VUnh3eHNuVTh0Wk5XRmRVR2Zpb1ph?=
 =?utf-8?B?WmxOSmxOeHhWRU0zbnIvNEJMVHZvdXQvT09TQnBmK3JlYmJwVDJHcVk3WDZP?=
 =?utf-8?B?ZldqR25VMjJxdmVYYlVDVFd0R0IrWWFrdCtDa0Fyc0liVHBlZ1VhSjRGLzY4?=
 =?utf-8?B?dWxiZjNwZnA5WGpDaTYwdGR2a0Fzc3JJZHJaWGJGbFFOSjVHZjE0bVRhWXZS?=
 =?utf-8?B?OHlZOUM0WEc3TWFtbE5vYS9nSE16VnFHWFRITmVUL1JPdUw3aXpSOHVmakpy?=
 =?utf-8?B?VmwvUXhtNUd6MVh6UDZWbTNmU1JYUGJ6TG0vWDZtV3JMRnBmWXpUYWdZckVh?=
 =?utf-8?B?MUIxWlpTYnlUOVJlRWNEd0w4alVsci9rYUxUQ0RiWHJNU0x4M25ycFRpZjkx?=
 =?utf-8?B?M2d4bmZUMXNQZ1hLc2FTejV4M2k4STVEditzSzFOK253SmxKQkIzRStiWU5u?=
 =?utf-8?B?clF2dG9wRjlRYzNHVkM1OVZ0VnJ5T1pHZGNrWDVNaDZwMVBkSmY1dURYQzF1?=
 =?utf-8?B?S3hHY0RXeHJjYjNKRUFIb2crS2tmT1JzNDZsYWlZNWJQY0Nza2tPUHhHK0ox?=
 =?utf-8?B?TXRzTzdMc2xiT3FVbkROZm41WGZ4OC9xWDVpTkFQTmtxUEFmS1lqV2hPVWV5?=
 =?utf-8?B?c2hFbDRSZVkxeXJhUHlENmVLR1FqY21rVVgvSmU0SDF1dkxnV0RadmFVK0Jw?=
 =?utf-8?B?NkUrZisxcXJnZEJyeWt3V2dlODh3Mzdpb0lXT3hLTVpzaEo5ME93SVI5dnln?=
 =?utf-8?B?ejltYUdZSU1sUGlnWnpoVFpxT1dPcUkvWGFDYk45ZEhaSitQU2V6Wjg4WnVl?=
 =?utf-8?B?cjVKU1hYa2ZyWnFQRVNyQ1ZUMStsNWZCMnJSYmdJRjVNT2JVSzhLZDk0ajRQ?=
 =?utf-8?B?cVNyaFpzeEQvV0hnaUtOcmp6R3p4VGZKWDhjYmRza0duOWh0NERZVEJOeDY0?=
 =?utf-8?B?c3NoR0F5STF1RytYbmRlR21aNUMyVnVqVGEwMHBocHRvTGlIdXorWk52YVV2?=
 =?utf-8?B?b1JEWi9sT3JwN1cvRmFRTXFsTnpvQkN2SW05M1htMUxlYTUvc3hQTWFiRjNG?=
 =?utf-8?B?S0ZjYmdmTjJEekRId01MQ1J0RzE0djZTOUsvdndEUk9ZK2NiS2R4U1c4QzJZ?=
 =?utf-8?B?VVZNVGlwN29CWm1tZ3MxNHNndktkd0FUd0habHFGYkdKUHdtSDFIa04zcFFq?=
 =?utf-8?B?K3VYS0VVNjFHb3grbC9pVHdGb0J0RUh6c3NlcTY3QmFSUzJpQTJaV09vN0dM?=
 =?utf-8?B?WTNyR0FNeERPSnBObjlFSlZRWVRRbUc5eTR6OXRJQTNXNC9CenArL2RFMGZX?=
 =?utf-8?B?cW4zSC82ZGFnMzMycUdoMmxqb2kzZ1c4VlBVaDdwZnFOMFNGSUxEa0szeDFK?=
 =?utf-8?B?ZGlrS1RBb3VKQ2x3ZCt3SVhXNENPa1dWQ0x1R0tHUDRDaDB4M2hNbW1INEFB?=
 =?utf-8?B?OGZnTXpaYjRHSjFkMEd1ajlFSHBRSmxQRklvQTBRNjZTUXE2b2xNSEc4WERz?=
 =?utf-8?B?YnZ2dHhWWXRzd210ditoMXEyNTFBZG0wZ295RVMrRWd1SC8rOFBpWmdtVEVa?=
 =?utf-8?B?Znk3YzVyRkJZRFZDeUVWS2tzSGFpaklkT2ZMYTJncDVJVlZhWHB2Vk1DSlRx?=
 =?utf-8?B?cVJNZUE2a0p0R3VlTEhIbTdkaGVuVmJ3anYvTCtYcEprOU9JUDM4L1lNbk5J?=
 =?utf-8?B?YTA3MEM1L0hRMmtpMkFHZEc4OWJ5MldWekRXeHBGRXpUc0VCSE1SdjB3UmdD?=
 =?utf-8?B?eXlhalV4VFdnTlFNVkZGYWpFenBmbHRmeWJlbDlrQ1NOLzlsdTBOVE1Wd2h3?=
 =?utf-8?B?YTZzOTVGMTllVXE0L0txRGlzS0JLSlVEUnNvRUxUeHhMYUMrNnV4UUMwL1Uw?=
 =?utf-8?B?eUM1WGxFWi94ZDdKS1A4ZU1PTFA5WDRDc3dxcTdVL0VWMElEL0pVQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gPSDapgfMEYdS81KP4AqXtSz4lnLGoQ+Si6ppN4EBEKBhV3DSkIyCWWWMoU8DfTFfmu/H2maGe4AOrQfEYb5zezmD0wwcD1quksVSjRMC3dAERNLdgsZrizDbPcx8JWEh9RSrlqPBa+oA7NDcE1BtoDhwiPrdkR91cpNzjN4QjyLYcuhDiAycmQBfsU3OgDnZgAQT/l8vkNWeYl+JSEyfa1Zbk1ieJo3yIobvho0yuJDwwyeK5ixL8syvSDG8zB/EOgKusqxqu4d8XBPHqQIy9Z+B7s1ymKEfgB3BoLlRyr9P5MoOjn1RH70Trqw2X8LHCo+oD5ca+ceoXr0e3En8w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ec39f8-2abf-4419-a090-08df0809832c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 09:15:05.8259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ovjtaKJLMC9bwTblRL/ZyqqyEs0f1jn8cbTvbTEcAP+IvzXLH3UDszGnlLejfiivQCZH/LM9GRFSQX5+98mjBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8024
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

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1k
ZXYgPGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBN
aWNoYcWCDQo+IEdyemVsYWsNCj4gU2VudDogVGh1cnNkYXksIEp1bHkgMiwgMjAyNiAxMTo1NiBQ
TQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IE5pa3VsYSwgSmFu
aSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgS2FuZHBhbCwgU3VyYWoNCj4gPHN1cmFqLmthbmRw
YWxAaW50ZWwuY29tPjsgR3J6ZWxhaywgTWljaGFsIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2NSA0LzddIHRvb2xzL3ZidF9kZWNvZGU6IHBhcnNl
ICYgZHVtcCBWUy9QRS1PIHRhYmxlcw0KPiBmb3IgTFQNCj4gDQo+IER1bXAgVkJUICM1NyB0YWJs
ZXMgZm9yIExULiBBZGQgYSB0YWJsZSBvZiBzdHJpbmdzIHRvIHN0b3JlIGVhY2ggdGFibGUNCj4g
cHVycG9zZS4gU2hvdyB0aGUgYWZmZWN0ZWQgbW9kZXMgb24gZHVtcGluZy4NCj4gDQo+IEN1cnJl
bnRseSBWc3dpbmcgLyBQcmUtZW1waGFzaXMgT3ZlcnJpZGUgaXMgbm90IHN1cHBvcnRlZCBieSBr
ZXJuZWwgb24gTFQsDQo+IGJ1dCBpdCBkb2Vzbid0IGhhcm0gdG8gYWRkIGRlY29kaW5nIGludG8g
SUdULg0KPiANCj4gdjItPnYzDQo+IC0gcmV0dXJuIDE2IHJvd3Mgb24gTVRMIGluc3RlYWQgb2Yg
MTANCj4gDQo+IHYxLT52Mg0KPiAtIGNoZWNrIHBsYXRmb3JtIGJhc2luZyBvbiBkZXZpZCBub3Qg
VkJUIHNpZ25hdHVyZSAoSmFuaSkNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgR3J6ZWxh
ayA8bWljaGFsLmdyemVsYWtAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRvb2xzL2ludGVsX3ZidF9k
ZWNvZGUuYyB8IDY0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS90b29scy9pbnRlbF92YnRfZGVjb2RlLmMgYi90b29scy9pbnRlbF92YnRf
ZGVjb2RlLmMgaW5kZXgNCj4gMzNmODU5OGU1Zi4uMmYzZjcyMDU3MyAxMDA2NDQNCj4gLS0tIGEv
dG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jDQo+ICsrKyBiL3Rvb2xzL2ludGVsX3ZidF9kZWNvZGUu
Yw0KPiBAQCAtMzQ2NSwyNCArMzQ2NSw2OCBAQCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHZz
cGVvX2RwMTRfbGV2ZWxzWzEwXQ0KPiA9IHsNCj4gIAkiVjMtUDAiLA0KPiAgfTsNCj4gDQo+IC1z
dGF0aWMgdm9pZCBkdW1wX3Zzd2luZ19wcmVlbXBoYXNpcyhzdHJ1Y3QgY29udGV4dCAqY29udGV4
dCwNCj4gLQkJCQkgICAgY29uc3Qgc3RydWN0IGJkYl9ibG9jayAqYmxvY2spDQo+ICtzdGF0aWMg
Y29uc3QgY2hhciAqIGNvbnN0IHZzcGVvX2x0X3RhYmxlc1s2XSA9IHsNCj4gKwkiVU5VU0VEIiwN
Cj4gKwkiVU5VU0VEIiwNCj4gKwkiVU5VU0VEIiwNCj4gKwkiVU5VU0VEIiwNCj4gKwkiRFAgMS40
IiwNCj4gKwkiRFAgMi4xIiwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGR1bXBfbHRfdnNw
ZW8oY29uc3Qgc3RydWN0IGJkYl92c3dpbmdfcHJlZW1waCAqdnNwZW8sDQo+ICsJCQkgIGludCBu
dW1fcm93cykNCj4gIHsNCj4gLQljb25zdCBzdHJ1Y3QgYmRiX3Zzd2luZ19wcmVlbXBoICp2c3Bl
byA9IGJsb2NrX2RhdGEoYmxvY2spOw0KPiArCWNvbnN0IHVuc2lnbmVkIGludCAqdGFibGVzID0g
dnNwZW8tPnRhYmxlczsNCj4gKwlzaXplX3Qgb2Zmc2V0ID0gMDsNCj4gDQo+ICAJcHJpbnRmKCJc
dE51bWJlciBvZiB2c3dpbmcgdGFibGVzOiAlZFxuIiwgdnNwZW8tPm51bV90YWJsZXMpOw0KPiAg
CXByaW50ZigiXHROdW1iZXIgb2YgY29sdW1uczogJWRcbiIsIHZzcGVvLT5udW1fY29sdW1ucyk7
DQo+ICsJcHJpbnRmKCJcdE51bWJlciBvZiByb3dzOiAlZFxuIiwgbnVtX3Jvd3MpOw0KPiArDQo+
ICsJcHJpbnRmKCJcdFBIWSB0eXBlOiBMVFxuIik7DQo+IA0KPiAgCWZvciAoaW50IGlkeCA9IDA7
IGlkeCA8IHZzcGVvLT5udW1fdGFibGVzOyBpZHgrKykgew0KPiAtCQlwcmludGYoIlx0VnN3aW5n
IFRhYmxlICMlZDpcbiIsIGlkeCsxKTsNCj4gKwkJcHJpbnRmKCJcdFZzd2luZyBUYWJsZSAjJWQg
KCVzKTpcbiIsIGlkeCsxLA0KPiB2c3Blb19sdF90YWJsZXNbaWR4XSk7DQo+ICsJCWZvciAoaW50
IHJvdyA9IDA7IHJvdyA8IG51bV9yb3dzOyByb3crKykgew0KPiArCQkJaW50IG1haW5fY3Vyc29y
ID0gdGFibGVzW29mZnNldF07DQo+ICsJCQlpbnQgcHJlX2N1cnNvciA9IHRhYmxlc1tvZmZzZXQg
KyAxXTsNCj4gKwkJCWludCBwb3N0X2N1cnNvciA9IHRhYmxlc1tvZmZzZXQgKyAyXTsNCj4gKw0K
PiArCQkJcHJpbnRmKCJcdFx0UHJlc2V0ICMlMDJkOiAiLCByb3crMSk7DQo+ICsJCQlwcmludGYo
Im1haW4tY3Vyc29yOiAweCUwOHgsICIsIG1haW5fY3Vyc29yKTsNCj4gKwkJCXByaW50ZigicHJl
LWN1cnNvcjogMHglMDh4LCAiLCBwcmVfY3Vyc29yKTsNCj4gKwkJCXByaW50ZigicG9zdC1jdXJz
b3I6IDB4JTA4eFxuIiwgcG9zdF9jdXJzb3IpOw0KPiArDQo+ICsJCQlvZmZzZXQgKz0gdnNwZW8t
Pm51bV9jb2x1bW5zOw0KPiArCQl9DQo+ICsJfQ0KPiArfQ0KPiANCj4gLQkJZm9yIChpbnQgcm93
ID0gMDsgcm93IDwgMTA7IHJvdysrKSB7DQo+IC0JCQlwcmludGYoIlx0XHQlczogIiwgdnNwZW9f
bGV2ZWxzW3Jvd10pOw0KPiArc3RhdGljIGludA0KPiArdnN3aW5nX3ByZWVtcGhfbnVtX3Jvd3Mo
aW50IGRldmlkKQ0KPiArew0KPiArCXJldHVybiBpbnRlbF9kaXNwbGF5X3ZlcihkZXZpZCkgPj0g
MTQgPyAxNiA6IDEwOyB9DQoNClRoZSBMVCBQSFkgZGVjb2RlIGxvb2tzIHBsYXVzaWJsZSwgYnV0
IGl0IHN0aWxsIGFzc3VtZXMgYSBmaXhlZCByb3cgbGF5b3V0IGFuZCBmaWVsZCBjb3VudC4NClBs
ZWFzZSBjb25maXJtIHRoZSByb3cgY291bnQgYW5kIGZpZWxkIG1hcHBpbmcgYWdhaW5zdCB0aGUg
cmVhbCBMVCBWQlQgZGF0YS4NCg0KUmVnYXJkcywNClByYW5heQ0KDQo+IA0KPiAtCQkJZm9yIChp
bnQgY29sID0gMDsgY29sIDwgdnNwZW8tPm51bV9jb2x1bW5zOyBjb2wrKykNCj4gLQkJCQlwcmlu
dGYoIiAweCUwOHgiLCB2c3Blby0+dGFibGVzW2lkeCAqIDEwICoNCj4gdnNwZW8tPm51bV9jb2x1
bW5zICsgcm93ICogY29sXSk7DQo+IC0JCQlwcmludGYoIlxuIik7DQo+IC0JCX0NCj4gK3N0YXRp
YyB2b2lkIGR1bXBfdnN3aW5nX3ByZWVtcGhhc2lzKHN0cnVjdCBjb250ZXh0ICpjb250ZXh0LA0K
PiArCQkJCSAgICBjb25zdCBzdHJ1Y3QgYmRiX2Jsb2NrICpibG9jaykNCj4gK3sNCj4gKwljb25z
dCBzdHJ1Y3QgYmRiX3Zzd2luZ19wcmVlbXBoICp2c3BlbyA9IGJsb2NrX2RhdGEoYmxvY2spOw0K
PiArCWludCBkZXZpZCA9IGNvbnRleHQtPmRldmlkOw0KPiArCWludCBudW1fcm93czsNCj4gKw0K
PiArCWlmICghZGV2aWQpIHsNCj4gKwkJZnByaW50ZihzdGRlcnIsICJFcnJvcjogY2Fubm90IHBh
cnNlIFZTL1BFLU8gd2l0aG91dA0KPiBkZXZpZFxuIik7DQo+ICsJCXJldHVybjsNCj4gKwl9DQo+
ICsNCj4gKwludW1fcm93cyA9IHZzd2luZ19wcmVlbXBoX251bV9yb3dzKGRldmlkKTsNCj4gKw0K
PiArCWlmIChJU19OT1ZBTEFLRV9QKGRldmlkKSB8fCBJU19OT1ZBTEFLRV9TKGRldmlkKSkgew0K
PiArCQlkdW1wX2x0X3ZzcGVvKHZzcGVvLCBudW1fcm93cyk7DQo+ICsJfSBlbHNlIHsNCj4gKwkJ
cHJpbnRmKCJXYXJuaW5nOiBkZXBhcnNpbmcgVlMvUEUtTyBmcm9tIGRldmlkICV4IG5vdA0KPiBz
dXBwb3J0ZWRcbiIsDQo+ICtkZXZpZCk7DQo+ICAJfQ0KPiAgfQ0KPiANCj4gLS0NCj4gMi40NS4y
DQoNCg==
