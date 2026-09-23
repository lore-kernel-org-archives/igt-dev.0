Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CB3C98304
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 14:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A7A10F0CD;
	Wed, 23 Sep 2026 14:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HucRjo0w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2771B10F0CB
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790173258; x=1821709258;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ukz0ciQ2xKMMm6Hq44xhWpqpN2iYI83Ys5DKUXfXI5M=;
 b=HucRjo0wxeS7M7tLeA6+seWwgb9xvwxXY3pHRpEUuftd3bEHQR7l5pHZ
 xk2rZQWm1kjttzXvQBgPyl0xeJXd0Y1/igBqVWG8//A+CzPCq/bhj8VfZ
 gkp1RPtw4U4UGDyAd9O7AD04UJGCqZlixEr1/614yK8czQAFI6tClwR89
 bUbJt8VtJLNUGAx4w9SGuLDMiSJrk69LNYR7IX8Bw5eK+aYl8vHRAM6kB
 ll/tHaLfDOfTelutFIk0k7kWE4I5cnR/rUiTf5y+T8HyW9A4jKV1v4B1i
 lWHgmrinp4NBDWiSslCN3Z1DmkfjfLy89XogO57oTQyi8GQPKSGUbzFFT w==;
X-CSE-ConnectionGUID: jmtxDgXwRJqtiPDKhWyjjw==
X-CSE-MsgGUID: 6SENnfevQOiNOdgqlZmJJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1380306"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1380306"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 07:20:57 -0700
X-CSE-ConnectionGUID: VoGtrVGGQZ+XuhfRBzYkQQ==
X-CSE-MsgGUID: aPvm15dtSTWzO98i95Q6FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4716187"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 07:20:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 07:20:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 07:20:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 07:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aq6kFoH97BgqLEipzU0ZOlTlZ2yPknQl94vnC1OxXcPJ6s8ivcJ/nSW0pMdqc6RRRcZshnROA5CnR6MVo1xvyOWrW+jVx0Ei6yS4RQNbZmVRUul23HixUr1er7/BoACiauxThiYd85hrIl2FtSiTLB1eVwIplMbm1pEyD3ns+n5l9BOJqhWYsGFX6V3rIA2dqd3SNMbDQErsqtVlTkPkzIYc0GKh1advOheHDUEL3Aaeqff7k0x3VMxI+XvkqbBq1OQYHWUva3Ry3NiBhC4k+PUapTGK6cQgp+BvPXuxJSPSJwOuMS1Oc3/WbRUMFwuG4HDfc2mPmQCKQ2N+HreqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ukz0ciQ2xKMMm6Hq44xhWpqpN2iYI83Ys5DKUXfXI5M=;
 b=KImaLuO5JrCC/hwg5gfWyi8KMHsUjIPWShGs9iCW5ckpGR8MIN5wqKPTqPgtzLj+F6iBf/WN2YXKZ7EgcSVMjHDZU0ksRaufFvlxhv8ri15DJ4PGtOFBMsHGrpcnjdfGPvMyuQpghzm4q6vhFXiu3AwSIBwP7aOAUDp0DiUfTquZ7Pf0QY59Nl+1ZVN1n42VZ3bELYYYR9hPvJ6VoypAsWdiQtjydd6t+Do1RrqORCXXNXxtGAf94JorV/cSE/2iBldP2QW64QoKSVlPOaJmoI4iIIFpKjZ/9YP2/F/OTMF0021KIvb0Fa8sYwMCAyO1mafJClKs7wGLGgej9gvzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5652.namprd11.prod.outlook.com (2603:10b6:5:35e::14)
 by SJ5PPF6E320AF71.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::833) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 14:20:52 +0000
Received: from CO6PR11MB5652.namprd11.prod.outlook.com
 ([fe80::4708:8b9c:437d:3854]) by CO6PR11MB5652.namprd11.prod.outlook.com
 ([fe80::4708:8b9c:437d:3854%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 14:20:52 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "vitaly.prosyak@amd.com" <vitaly.prosyak@amd.com>, "Musial, Ewelina"
 <ewelina.musial@intel.com>
Subject: Re: [PATCH i-g-t v2 0/2] runner: create results incrementally
Thread-Topic: [PATCH i-g-t v2 0/2] runner: create results incrementally
Thread-Index: AQHdRfLBnxVTr1y6VkSm1KzGpTihjLbcQZOA
Date: Wed, 23 Sep 2026 14:20:52 +0000
Message-ID: <4705502105960ddb2281fb565414685a32ee5f60.camel@intel.com>
References: <20260916154740.130190-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260916154740.130190-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5652:EE_|SJ5PPF6E320AF71:EE_
x-ms-office365-filtering-correlation-id: ec753bf6-febe-4688-048d-08df197ddfb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006|38070700021;
x-microsoft-antispam-message-info: lUxAY4OMguag61dykhldKdBRQ2ZDMgYljadgSCnCji/5jOq4cbqdCpu8X+5nZYEFhN3v/Jt9t94IKMLifWvygnhTMJehEViEAn3JIoDyVBrX6iDKf6IFHesHZp4wmgxwiYgcAX41Iwe8ikItIjVoPV2t5ffEvPyreRjoHCePgMvuIIpnnkrapbHeQ3+2oax2M4+EECO4ft6b0Jlmlbd89toy48pMnxiJ7jsxq0PamHzLyYbmzU41ec9UokSgfQKUE8rtAfgdM4mafB8DuGyQpdaXUutxLU4UNN3PB0f23MLVOndo6l7AqPtFp0vZ1inSm+eZYIoqJHjbfUSuCaRl0VfCKAZmzTM7Hn4w74ziaSOqjuljJj4od4HYFXhxOYpyvcV7d4Fe7iNhOxAUMdWKgteW841DS6VxwyfDp8uNUHrFHrxM+ppQths7ocxrnHbFBuiZT2fF+HtldqI3lCfOUKI9Op+6mc8SF7RDg7Z1IHZ1IBvvf1sb4vp64TI4YmAErkhx958sJbQO7ppt9ICybto6Rvp6jZa7l6366M7VeeOPbsbO/TK/pf6ox+Mh4/IWojEGc/gS/v1B2QiERe7Qrbqp8EI876xBAyb3WcByW4qzZquInxNie6hBUAVeO8UP8PqItWZH3vtbrwvBvVcmJGTk8r31vS/0FLiAknoxj35I2G6kFLaLo8m5YXSHB0JT4PCtcDMRODloASGYH+q5pfPJNW/IaQyrMzUFPQwspf8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5652.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEJGWDNPR1EzU2t3M3JqU3VMRXZxL0hpNVRBRjQ4ZnhKTjJLUzN5dzA4SVVz?=
 =?utf-8?B?b3YvWUpNWU9ucEprS3FOeXVhNDR5VWlIeFd1NnRnb1U3QVluK2xGTGpoL09R?=
 =?utf-8?B?cVlleGx0eEROTU9yWnFZQzd6d1oyaFNyRzl3Yk0rQWN3R2FWckN2NzFLMVVI?=
 =?utf-8?B?T0RoT0I2ZlUrRGZIbHZtUXI4TzZmK2lWYlBFTHRZMlhpS0lxUWg3K2lLdjVV?=
 =?utf-8?B?K2RJekd4S0xpbHE1cFlTQzdPSm5wOWdTUTd4WmVueXVnRmZJMnBmRVh4cUtz?=
 =?utf-8?B?cEg3VnF0RldZYlJYWEtFbTd4aCtoaDMwWnQ0Z2FsYVZOakJ6N2RTL0xZRDU0?=
 =?utf-8?B?a1NpUXpuZEI2WisrNUZEQU5OeGlnV084TjFnWTd1RndOVDhVeDVyNlUySkR6?=
 =?utf-8?B?WmY5cHlGWmcxOGxUNm41L3hTZVhWWFAzK01GSjJnV0h3KytRYW5wbUsxK29p?=
 =?utf-8?B?M09lV1dTOC8vc2FKMVA0d1JDU25DS0tZbW9yMUR5S0laQ3IrWUp3Lzk2a1I3?=
 =?utf-8?B?VEFJSXhsOHB0UjZ5OVJLNlk2T3pRQ01VUmJ4NE96R1RDbDRkTVo3OTV0bzk4?=
 =?utf-8?B?aWlDbG03ZFlHNS9UclNoOXVhZHN0eEh4LzBsUjlnQ2w2STRWM0xMNENpUUs3?=
 =?utf-8?B?QkRWZDRScFVPNDZSMXJrOE4wejN6K0ZOdFU3dGZxUXdpTnFyaitSSzdEQndm?=
 =?utf-8?B?OUw4Mkl0UUZaQ3FCMm9nNTJHZWNyMVRPZHgyMVlpRWJrOE5yNndkbTNlS0dp?=
 =?utf-8?B?UngvK2pQYlk5eEVGYWN4cmRmWW5IL2cydU5KMkEwaTk2YUdWelE0VWE4SG5S?=
 =?utf-8?B?QTlMeXFpRGF3a05Yeks2VWNNNlN1VUwvNDBUSXA1VnlDa2p0ZDJUVVhmU2Ry?=
 =?utf-8?B?OG9VZzNYd1pIazREQ1dzdzdRWG9taTRDYmRhRkg5K0FqMDhha25UYlh4NEZw?=
 =?utf-8?B?aTVDNDVrdlNBVGxKYjIvTHFyOFdMaERGMGMvbTJzemxmMVpWZHA2UjdneVEy?=
 =?utf-8?B?b0xFRlJvRFM5MkVSU1phM09CU2FaVVJIcnZiZ0JkOU84dXJIVFlKTkkyVklJ?=
 =?utf-8?B?bGkvSTZxWCs0K2MwVXJpMDY1cEJIVTVITjByTHFCNkdwb2JmWEVsR2xHZFY1?=
 =?utf-8?B?KyttSVVTeHBNTFphSVBOWTFRN013TnN0MUZOMFQraFhZaWZmN05ZMXdkeEZt?=
 =?utf-8?B?eTFjRjFDVWNnMmZ3K3hlRTNqcEk4SDQxMWxCRitSVFdmVllvNHJxbW1sZGN1?=
 =?utf-8?B?R2Z3L1JDdVArZ21kVlAwV2hvVDhTa0JOMWFSR2M0QzlnTmhGWnN1Z0pCUzE2?=
 =?utf-8?B?RWUvWFdlRVVOL041bUxYTngwcW5NdWcvU0Jlamw0QVg4V0M0SUNPOWFXcTha?=
 =?utf-8?B?R3hNdXhzUmV3L0hxTFR4YTBEd3dTVFdGemNkc3UwN3NNSHlFb1h4czFpN3ZX?=
 =?utf-8?B?R3dBODZoQVJsTVRhcWpyWGtKMHFtc1lVT2hnL0dNbWZ0M3hkM3FUMG4vZWtO?=
 =?utf-8?B?QmI5OU5WVnpDZW5BNWJzdTI3SDgyUDRTa0lrNTdmUzVWMDUyTVFxamdlS2VC?=
 =?utf-8?B?VUJpV3ZHZ1FGTXpCdHU4YzVybUc5OW1kSUNtMS9OSm1SVjRpdW9rbmNoTzNV?=
 =?utf-8?B?Tlo0VklHRnA3d1RVZzlqQmhkWUdaV2ltNFg1WWhqOUk2Q0hEdEM0cmwxTlVY?=
 =?utf-8?B?STBMN1NhN0gyZ3lCcVhtZUh2eFFzT1ZGVXRKWlEyUHBmTnJodkpkNWFOdHY5?=
 =?utf-8?B?ZzBuZzc5aHJ6TFg1cHRCWmJHblBnaXI2RUg3RUlITkNBRHJPUmVaRzJISEVq?=
 =?utf-8?B?R2U0SVdKU0wwSFdSR09rKzJpQ09lRVl4VTNEcmNBYzNlcTFYS3VsR1pvZXdD?=
 =?utf-8?B?d2NwZnYrNHdhNHd0d1BSanQ3MkwrbDVJRWZmalVwZ1FjeWxmM1dnZ1NnYUxj?=
 =?utf-8?B?c1Rac0JMNFFoeldPWXpuMXNMY0lJK2NCUzZWLzRLdGk4cDFUZWxZOXNyTkRT?=
 =?utf-8?B?Qis3aU5iR3RkNTNWU1B1WGUxOVJuUlJFK0g0Sm5vOE04dnJ6MWNhS243NTJD?=
 =?utf-8?B?eTJTZ01wRSsrV2UrZEhNMXNmbStTakI2d21lNzA0Mnh3bDV4dHZUMjRPby91?=
 =?utf-8?B?Ry92Z293YXpIakdSdWhTQ2lZWXJtem0xSHhqMTJmMXJVbldPbnBCdHdtY3N0?=
 =?utf-8?B?NU5Fa2lNOGE5M01BYlNzN0hOZUdramx5bms0VmdMcGJKbG1zemV0a3p3TXJs?=
 =?utf-8?B?VmRiUmxGT296TEpTS3RkR2FhK3I0TnREdWg4OXBudUNrcUZBc3p3MEVZWkJC?=
 =?utf-8?B?TDVNNWUvVFdXNkhVTEd1TjFISVlZQ2pMV3F5Z2ZseGRxL09GTExOb1V0THND?=
 =?utf-8?Q?A02IOq+V4jQR/eVs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE286F2A81BCCC4EA83759DB778A8509@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sOrP8Bi8g1uavkWkAYiQpSXule7s28YwMoMmf9REhmfveSBJOR1B3hmaJKSe8e56ERkCGmGOFLVEZFJJX0mWp5MI0z2pvMj7OSvbxJ5TxgqJySLBSCzRmBcDZGngG907GbQD1ErrZXfpKBgZY6q+wMoXfytX3ODfxXzNwZyWMACTzmtzgSX5lLLDojMjHM9ggloeae3yn4ZcrW37QIyF6ED/7/m8Uh9kreP+3RfiqjuTDNBenIHzkfe0GwBO7dJ8xNGbmNU6rA7uVNnvkcWF2RP29bE7+O5ucyAba2wNA3oTK3Fu1T7WlJLmr5yMsuZusDl/KcSG0w8bxWw243go8Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5652.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec753bf6-febe-4688-048d-08df197ddfb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 14:20:52.4891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H+5JyzQwDTGhVi+EN/EqwiIS57aVOOmwdS7mWYzLeixhH2fSZIQ+CAxY1Ote5NI59us+Qa+vYislSGF4shr5gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6E320AF71
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

TEdUTSwgc286DQoNClJldmlld2VkLWJ5OiBSeXN6YXJkIEtub3AgPHJ5c3phcmQua25vcEBpbnRl
bC5jb20+DQoNCk9uIFdlZCwgMjAyNi0wOS0xNiBhdCAxNzo0NyArMDIwMCwgS2FtaWwgS29uaWVj
em55IHdyb3RlOg0KPiAgICAgICBDcmVhdGUgcmVzdWx0cyBpbmNlbWVudGFsbHkgZHVyaW5nIHJ1
biwgZS5nLiBhZnRlciBlYWNoIHRlc3QgZW5kDQo+IGl0cyBleGVjdXRpb24gY3JlYXRlIHJlc3Vs
dHMuanNvbiB1cCB0byBsYXN0IG9uZSBleGVjdXRlZC4NCj4gDQo+IE9uZSBjYXZlYXQgaXMgdGhh
dCBpdCB3aWxsIHN0aWxsIG5vdCBob2xkIGxhc3Qgb25lIGF0IHdoaWNoDQo+IHN1ZGRlbiByZWJv
b3QgaGFwcGVucywgZm9yIGV4YW1wbGUgYWZ0ZXIgYSBrZXJuZWwgcGFuaWMuDQo+IA0KPiBJbiBz
dWNoIGNhc2VzIHRoZXJlIGlzIHN0aWxsIGEgbmVlZCBmb3IgY2FsbGluZyBpZ3RfcmVzdWx0cyB0
bw0KPiBjb2xsZWN0IGFsbCBkYXRhLg0KPiANCj4gdjI6IHJlbmFtZSBvcHRpb24gdG8gLS1zYXZl
LXJlc3VsdHMtYWZ0ZXItZWFjaC10ZXN0IChSeXN6YXJkKQ0KPiAgIHJlbmFtZWQgZnVuY3Rpb24g
dG8gYmV0dGVyIGRlc2NyaWJlIGl0IHNhdmVzIG9ubHkgcGFydGlhbA0KPiAgIHJlc3VsdHMgKFJ5
c3phcmQpDQo+ICAgdXNpbmcgcmVzdWx0cy5vbGQsIG5vdCAuYmFrIChLYW1pbCkNCj4gICBiYWls
aW5nIG91dCBmcm9tIHNhdmluZyB3aGVuIGVuZHRpbWUgY2Fubm90IGJlIHNhdmVkIChLYW1pbCkN
Cj4gICByZW9yZGVyIHBhdGNoZXMsIGZpcnN0IHNob3VsZCBiZSBpbnRyb2R1Y2luZyBuZXcgb3B0
aW9uLCB0aGVuDQo+ICAgdXNpbmcgaXQgKEthbWlsKQ0KPiANCj4gQ2M6IEV3ZWxpbmEgTXVzaWFs
IDxld2VsaW5hLm11c2lhbEBpbnRlbC5jb20+DQo+IENjOiBSeXN6YXJkIEtub3AgPHJ5c3phcmQu
a25vcEBpbnRlbC5jb20+DQo+IENjOiBWaXRhbHkgUHJvc3lhayA8dml0YWx5LnByb3N5YWtAYW1k
LmNvbT4NCj4gDQo+IEthbWlsIEtvbmllY3pueSAoMik6DQo+ICAgcnVubmVyOiBBZGQgbmV3IG9w
dGlvbiAtLXNhdmUtcmVzdWx0cy1hZnRlci1lYWNoLXRlc3QNCj4gICBydW5uZXI6IENyZWF0ZSBy
ZXN1bHRzIGFmdGVyIGVhY2ggdGVzdHMgZW5kDQo+IA0KPiAgcnVubmVyL2V4ZWN1dG9yLmMgIHwg
NjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAgcnVu
bmVyL3Jlc3VsdGdlbi5jIHwgIDYgKysrLQ0KPiAgcnVubmVyL3NldHRpbmdzLmMgIHwgIDkgKysr
KysrDQo+ICBydW5uZXIvc2V0dGluZ3MuaCAgfCAgMSArDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDc5
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo=
