Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD87F433FE
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 05:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28CA10E189;
	Thu, 16 Apr 2026 05:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yj2d+hHX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8206510E151
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 05:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776319006; x=1807855006;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/LKWHKQJJnrIQM3ynfKMFx5Nm1Uu416v6WrZtRCR8Js=;
 b=Yj2d+hHXS26bErMsIhshCeA+Ev0x2VUmQ+ObzPNuylk4foyMKelLNmWO
 rgdZvY6vxKW6WsI81Ae4NzIkbVja1AhCATW8CNMb+Po56jlHdeTyukM8h
 Y9cvOQ8j6Q/Nn+X+HxB5SkuYBDuI6QLMilChdpWZVkEawb/MNVaKaCvtu
 PDtYzI3mG4f76E7lyjNE9HTJd8dfEwaaOFoqKFdNAJzx4UNAwQo+jZ+4v
 eWWOew3D1FD9tjwJlIybNhANDKk53ECgnQRdwSvwLvo5eUyNo40A5OpDh
 MLp0Rz0hIxLo/E9k9h+1X4PIfOnBYvL5kpPICDyBBWf/m7P1VMdG9QtQK Q==;
X-CSE-ConnectionGUID: /zD174O2SPa5TwLtpYvjuw==
X-CSE-MsgGUID: FayT6sy5R9a0MFIPcbc3lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76342371"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="76342371"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 22:56:45 -0700
X-CSE-ConnectionGUID: wVW8Cz2ORj6qmH84Qp7RCA==
X-CSE-MsgGUID: P0/6GeiuQu+rOgWftdcrEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="261059711"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 22:56:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 22:56:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 22:56:45 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.42)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 22:56:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNfIvGYV+d+QLRepQwzr+gx2CWVD/C0m7bT2ih5ZUoGNtYwOuSaifTTxTKMB6oDjTcjIbbNT0pRQyCqo+1nC9hJ6ZCWVrSpeBj/BWRvbb9SiVdQ3gVtxFC9gyCu1Q1CKQZFexea68LQf8SKFBM7LYiIQU2NQ614zfjucvRUq7WOP5uOWd7XKNw16sYj11eH7/qetjI8ngKuVv1MuLmClylvPt+cVbWxT//GPa1LudWQ5Ap8TFboB4kq5Tbkufy+yEV6ojFiiXMSKDyU//+hCuRKpWK4bhaYteKVjFZUPNOQeLGI1lzl2KY8c/iJ2QyauMbYYtBUspMKEWFUJqZXwMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LKWHKQJJnrIQM3ynfKMFx5Nm1Uu416v6WrZtRCR8Js=;
 b=RTvI51N/F8Ia/gTw788MA1YtE5Prb2+I3GEfWNPe8S/yGU5Fi+yCi/qv3drmUxtkfM2eMPXI1kfgUFgMOL85roOxBcTE4hEPEJuz3TKvPh3Kx8s6rRF2NXvXTlYJ4X/MxmLC2nYRbKmzG3QAEMD7DVzrhoBt/AjYA6hbYuj2nlgSgquHVzgu+1EGOgl8KgExWUNWGQS8nzTk6+lwkTv9woXbiui1aDlYHBYUNVHV5z1l5PknssjcgACfFgdUbp06a13S7jKT/i3SgUluBop3+tYKlUiubSUj4t/VC431/EcYK6jxwHEdZfW8R9h/G6L3/Dp6SMWTzRnjl+zhjNnMvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB7515.namprd11.prod.outlook.com (2603:10b6:510:278::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.25; Thu, 16 Apr 2026 05:56:41 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 05:56:41 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "B S, Karthik" <karthik.b.s@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 "Project_Global_Chrome_Upstream_Group@mediatek.com"
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: RE: [PATCH i-g-t] tests/kms_setmode: Relax vblank timing tolerance
 from 1 scanline to 1%
Thread-Topic: [PATCH i-g-t] tests/kms_setmode: Relax vblank timing tolerance
 from 1 scanline to 1%
Thread-Index: AQHczUxjd2lLLGIz0keqxaQu1ZjbE7XhLmww
Date: Thu, 16 Apr 2026 05:56:41 +0000
Message-ID: <DM4PR11MB6312060B26A9D7B66930D2FC90232@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260416025408.2924216-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260416025408.2924216-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB7515:EE_
x-ms-office365-filtering-correlation-id: 37522be6-7004-4c0e-2ff6-08de9b7cee9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|56012099003|921020|38070700021;
x-microsoft-antispam-message-info: dxAaXg6+QgOeTZG23gD6YX2Ht+z+p5qFbJ4QvItIFz3aoA0843lI6hk9WCidfMy5U/RslGGN5C0IcpLav/GyrWY9xE7UyqD15ICNRBxzbMejBfNtBT3Ypxt/GM+1819AOVuzO/3koP1RfxSfuAoA2yXEmchxEaTrALi0Cm3WSt6Bs56z80R3YeKsl1n63AnzqJkkpdFT75lOdJZvCrQRRd/bT5A1ovbQkc01g0tBfs/pXXeFsri822Uf5dC2wnQietA4JKbZd1kCnRvaB39Rm0hAbU+5jmytglyUVHs7X49nGYj7SmzMsIrswLlKElD/1cgSzEnDcsLWsSjbJVFxqKO+cLw0dZjCjPUzBTsjDfaIk5INcDQF63Z3F5MurnH9Uf9Hl5nkEPImv5asfoiTabQvp4+jmuj60tDY9r2go/bzLoOllc8cRJrvMy6qIbH3Br957mZVF8JVprKxkVxBTG3TrQHPD8qil3L2pjJHS2feEevstYfbpCuxzxbsyGkz2GLKjGxuGBqjxbmNL9+bbm14jtvy+f2iHL86OAwXqgVNMmmVG0JXzWf5lFPhChoj3hPNGIx/UgUWJi90K2b6+i9b2hqUXTwnlIEzm9EeVcg5y177UAm3+CqVrvzWweuYRVH6fLPmBc0BfLn230B51eA3Li7Nral0oXgBq3idSYm7Vh9PlXWZNr1w8x+0jHQ0rUFPsJZIDocyXN51pnctFZPyehf+tRWJDWYAA9OS5SPItzg52MDQLJGBhEVZ+rtF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099003)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXU5REVBQ1E4c2dVYnJNSVNXbHlBZ0R0Q05Jb1FRT2E4K3M4Z3MxRCs5VVpO?=
 =?utf-8?B?clptNlFFdnZQSFJQYXRqb1VKMk5TUDRTSnVGS3JwamVoZE90emMyaFRhb0hw?=
 =?utf-8?B?VkR5WW55Z1NqMHBCNXdoeVRhbTBsdnBja2h6L2VkRVcwQ015Y3FBcVdSby8r?=
 =?utf-8?B?Z0FUYkRoRnNXbGZwaDB2d1QxcnpwSytCekJUaVBFbGtNZkRiaUdqRHFENEdC?=
 =?utf-8?B?bUJTRndnQ056akg4cm5oZGVtNXFJTGlXTk42aDBoZm83TGFSNXo0NzVQVFpp?=
 =?utf-8?B?VFRDZk1TMGdodVhzazRBb0pGUFhjZDlsUFNzZXNrTkFWRUJkWklpdGp1SkJu?=
 =?utf-8?B?dk5vbjliL0tJYmk0M1Mxa2lFNkhZMlZDTERhV0xRZnpGNkUrTVNyVkZRWnJj?=
 =?utf-8?B?VnRqdkdkQ3paUHFid2l0MUZQamJaczhIamJiTkkzNUFMYzQ3YzZ1QUxaVFVT?=
 =?utf-8?B?M2JIUkZEYUJoR2pZdEwzMEsrMms2cFpBdXhCU2taZHVrNktXczYwSThta0ds?=
 =?utf-8?B?SXFVT2tnOUYwV01zcXd1SEIvR2YxSWZQYTNsekRGSlBDQUVtQVhYbEgreE44?=
 =?utf-8?B?Y0xPOUdkTkJxeWRLMzRQMm5yZ0prTVlzRmlRM05jaG5RRXVMaGdPWW9ydkZZ?=
 =?utf-8?B?UkdIalcwaTN3eStPcDdZN3R6SGxCMVRzM2hRaEppa1lCRGNFWVQ3L1g2S3BC?=
 =?utf-8?B?WlhJVjU5a1N5VVdyVjR0MkRSaUcxK2d5TU9GMkgvY0Fuc1MyQVJxOW5wVzl0?=
 =?utf-8?B?djl2S01tZGRnWWxTL2c4ZFpsWWFjaW1WZVN2MWVpdkkxWW53aEd2RFl0SXRG?=
 =?utf-8?B?WlcxL2lIZmUvVGxyWkxuTmw5VVZDVEtTV3Rka1d5U0dQdjQ3OXhVNTZpbkVQ?=
 =?utf-8?B?Wms2empKYmR0NCt5QURtY3dSdVY1cU1iZ200a05sRlorT1Jua0kvS2thdkUy?=
 =?utf-8?B?RUdpaUtSSlZISVh0UnlSdmVkUVFzUjk3L3V0bXZUMjZvdFB3dWUyd0hzaEkr?=
 =?utf-8?B?ZmVuT3ZPWnNQc2R4TDBvRDRMQWpkN3JvV0ZkVVpKdVB4QXFTaDF3NHFLWFlP?=
 =?utf-8?B?NENKbmZUMnhkY2VncVM3MUZGSm9Yc0lEcTJvTzl5QkJoN2ZDSktjUVMwRG1O?=
 =?utf-8?B?S2FDMVl3ZDRhSDFBS01OVjRnNXBiVEo5Wk9NL01FNlAvYWlCdUMyMzcvK1ZH?=
 =?utf-8?B?emJmTWJQUFBCaFBoV2tZUnJ3aEhRb1lzeEZhS0RLcGJxN0Y2M1prdXZCaUV2?=
 =?utf-8?B?RDhqdGJjVC9Rb3ErUUluL0NDTW4rYjU0azJnQXFUb1FvenBEU1hGb2JDM05H?=
 =?utf-8?B?K0M0ajJZbm9mb3BvWkg4a0svUFZrTFFBbS9iYzh6N25ZVm80bFoyeEc1TFJ2?=
 =?utf-8?B?UDZaNEw1OXZQNTRERXZsWW5hU0FZUnUrRDR3WmhrV2VwdjI0anZFRXJ4c0w1?=
 =?utf-8?B?KzlPQ0hRMUo0TlF2ZlhHd1dmcUkzcm5XeFVIVXEyOUtmUGlzZ1NpbjUxNzQ5?=
 =?utf-8?B?VE9ETEExdlhaa0ZMTzFPd01GWVYydkZQY1A0STlaMkJWaFo2ODB6K09FWE15?=
 =?utf-8?B?V0RhSloyc21QVEpMQWE1NG5abjRPMk95UHYvbHhFVDRUL0tyZE9sMlBNaTR1?=
 =?utf-8?B?WktMQVluSHV6Q2U4cnRUZjR0SUc4MERGRVpvcEVOTXVqUCtxenBRdlNvck1n?=
 =?utf-8?B?VzBXQWF2eE1xQ1VTYzU3MGVkZUdIQ0o4OE5DRkRCRWJLbkxhOGRrUUtGeG85?=
 =?utf-8?B?VldFREt0TklyVHpGbHpISHU3TnlvWG16Qm1NcjhibTNraGlGcFJlZU5iSjRl?=
 =?utf-8?B?VXdKUStETWxJSURqRytlbVNrNmZCN0pHQ3dOMThNeGx3MU1QYm9vS1cwZDRa?=
 =?utf-8?B?UlFvbWUwQ1M4c25oZGtBUkNiQy9wTlU3eFdtempEN0hhWlA1ZjhXTTJDNmV1?=
 =?utf-8?B?NmNveDN5RkxURFIrbmhHVTRoTXNobVFyTFBQTWtScy83eUczQldla3ovRjN3?=
 =?utf-8?B?czBLd2JWV0pDZW9Rc0N2Ym95dm9GMXlZOE1ZMFJTVEtDNEFXdVlIRkVUOXM3?=
 =?utf-8?B?Ny9VcnhDZWtGRW0xV2t4aUw5R29rUmp3dlE4QXpiNHJicUUydkJQNjVwc2h6?=
 =?utf-8?B?bWk0U3JIdnRnd1EvcmJzc05oSWNpMkV1N1RnQm9YTFV6ZFJsK2JzWVJhM2tV?=
 =?utf-8?B?blVCZHZHMFRKL1hlR3V1dVRsZ2VoK0hGSVNxQkNJaldsRkZjOVh6d1JTaEdW?=
 =?utf-8?B?SHVpT0JtMjVIc3NLNWM5TG05MEJsSmhlb3ZVaXJCeGNyVEtnSEFoRVNtanVn?=
 =?utf-8?Q?yqVCkqwXXN272C5A2m?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iLAei15Oni9UqTlyUWKB5GNPe7RCkZrzbdb2m9eFlz9vXD24Wafk4KtA4yEoGXL9emDbexgklnV1mwmM2K8UfWhuzhrU1ZDyDNJTxeerzzapPbaxD58qqMQkbEBXubwTSRkcuyi6/s3pGowik5EwoeqXXvQegHkulWeColYbMiCEIMJrXVe0shsbRbP0GR2xBIkLsYvbZqCDNPGRwIgNqnzTJ0e0fJaJcnTFlZuaNAgNcX7LkF67tKIhUWPBmED2AC6pEdp5lHjgPehhbM/As+5GYNsyaI1rvBj8rZbyAKL0txR9+cD35Ueod0ANZv4TWUa7PZnFKqVUL4MSrWgm4g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37522be6-7004-4c0e-2ff6-08de9b7cee9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 05:56:41.4511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5WD6gZ3ozhhx92zLSlzw9LezCMhVsDR7MEpnP5WUuj7qdHRXSZo3zLoW5/EwU504nFrDvZrMzBSGtuQNYttKOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7515
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmFzb24tSkgNCj4gTGlu
DQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxNiwgMjAyNiA4OjI0IEFNDQo+IFRvOiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQiBTLCBLYXJ0aGlrIDxrYXJ0aGlrLmIuc0BpbnRlbC5j
b20+Ow0KPiBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+OyBLYW1pbCBL
b25pZWN6bnkNCj4gPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+OyBKdWhhLVBla2th
IEhlaWtraWxhDQo+IDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPjsgQmhhbnVwcmFrYXNo
IE1vZGVtDQo+IDxiaGFudXByYWthc2gubW9kZW1AZ21haWwuY29tPjsgRmVpIFNoYW8gPGZzaGFv
QGNocm9taXVtLm9yZz4NCj4gQ2M6IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29t
PjsgSmFzb24tSkggTGluIDxqYXNvbi0NCj4gamgubGluQG1lZGlhdGVrLmNvbT47IFBhdWwtUEwg
Q2hlbiA8cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbT47IE5hbmN5DQo+IExpbiA8bmFuY3kubGlu
QG1lZGlhdGVrLmNvbT47IFNpbmdvIENoYW5nIDxzaW5nby5jaGFuZ0BtZWRpYXRlay5jb20+Ow0K
PiBHaWwgRGVrZWwgPGdpbGRla2VsQGdvb2dsZS5jb20+OyBZYWNvdWIgPG1hcmt5YWNvdWJAY2hy
b21pdW0ub3JnPjsNCj4gUHJvamVjdF9HbG9iYWxfQ2hyb21lX1Vwc3RyZWFtX0dyb3VwQG1lZGlh
dGVrLmNvbQ0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIHRlc3RzL2ttc19zZXRtb2RlOiBSZWxh
eCB2YmxhbmsgdGltaW5nIHRvbGVyYW5jZSBmcm9tDQo+IDEgc2NhbmxpbmUgdG8gMSUNCj4gDQo+
IFRoZSBvcmlnaW5hbCBjaGVja190aW1pbmdzKCkgdmFsaWRhdGlvbiByZXF1aXJlZCB2Ymxhbmsg
aW50ZXJ2YWxzIHRvIGJlIHdpdGhpbiAxDQo+IHNjYW5saW5lICh+MTV1cyBmb3IgMTA4MHA2MCkg
d2hpY2ggaXMgb3Zlcmx5IHN0cmljdCBhbmQgY2F1c2VzIGZhbHNlIGZhaWx1cmVzDQo+IGR1ZSB0
byB1c2Vyc3BhY2UgbWVhc3VyZW1lbnQgb3ZlcmhlYWQuDQo+IA0KPiBDaGFuZ2VzOg0KPiAtIEtl
ZXAgb3JpZ2luYWwgc3RyaWN0IGNoZWNrcyAoMSBzY2FubGluZSwgMS43MTggc2lnbWEpIGFzIHdh
cm5pbmdzIG9ubHkNCj4gLSBBZGQgcmVsYXhlZCB2YWxpZGF0aW9uIHdpdGggMSUgcmVsYXRpdmUg
dG9sZXJhbmNlIGZvciBwYXNzL2ZhaWwNCj4gLSBVc2UgMyBzaWdtYSB0aHJlc2hvbGQgKDk5Ljcl
IGNvbmZpZGVuY2UpIGluc3RlYWQgb2YgMS43MTggc2lnbWEgKDkwJSkNCj4gDQo+IFJhdGlvbmFs
ZToNCj4gSGFyZHdhcmUgc3BlY3MgKFZFU0EvSERNSS9EUCkgYWxsb3cgwrEwLjUlIHBpeGVsIGNs
b2NrIHRvbGVyYW5jZSwgd2hpY2gNCj4gdHJhbnNsYXRlcyB0byDCsTAuNSUgZnJhbWUgdGltZSBk
dWUgdG8gaW52ZXJzZSByZWxhdGlvbnNoaXAuIEhvd2V2ZXIsDQo+IHVzZXJzcGFjZSBtZWFzdXJl
bWVudCB2aWEgcmVhZCgpIHN5c2NhbGwgYWRkcyB+MC4zLTAuNSUgb3ZlcmhlYWQgZnJvbToNCj4g
LSBJbnRlcnJ1cHQgbGF0ZW5jeSBhbmQgc2NoZWR1bGluZyBkZWxheXMgKDUtNTAgdXMpDQo+IC0g
U3lzdGVtIGNhbGwgb3ZlcmhlYWQgKDEtNSB1cykNCj4gLSBWYXJpYWJsZSBkZWxheXMgZGVwZW5k
aW5nIG9uIHN5c3RlbSBsb2FkDQo+IA0KPiBUb3RhbCB0b2xlcmFuY2U6IMKxMC41JSAoaGFyZHdh
cmUpICsgfjAuNSUgKHNvZnR3YXJlKSA9IMKxMS4wJQ0KPiANCj4gVGhpcyBtYWtlcyB0aGUgdGVz
dCB+MTF4IG1vcmUgdG9sZXJhbnQgd2hpbGUgc3RpbGwgZGV0ZWN0aW5nIHJlYWwgdGltaW5nIGlz
c3Vlcw0KPiBhbmQgYWxpZ25pbmcgd2l0aCBpbmR1c3RyeSBoYXJkd2FyZSBzcGVjaWZpY2F0aW9u
cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlh
dGVrLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9rbXNfc2V0bW9kZS5jIHwgNDgNCj4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0
cy9rbXNfc2V0bW9kZS5jIGIvdGVzdHMva21zX3NldG1vZGUuYyBpbmRleA0KPiAxZjI4NDliYzI2
Y2YuLjMwYWI1M2ZlZjQ3YyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMva21zX3NldG1vZGUuYw0KPiAr
KysgYi90ZXN0cy9rbXNfc2V0bW9kZS5jDQo+IEBAIC01NjMsMTAgKzU2Myw5IEBAIHN0YXRpYyBi
b29sIGNoZWNrX3RpbWluZ3MoaW50IGNydGNfaWR4LCBjb25zdA0KPiBkcm1Nb2RlTW9kZUluZm8g
Kmttb2RlKQ0KPiANCj4gIAkvKiA5OS43JSBzYW1wbGVzIHdpdGhpbiBvbmUgc2NhbmxpbmUgb24g
ZWFjaCBzaWRlIG9mIG1lYW4gKi8NCj4gIAlpZiAoYWNjdXJhY3kgPj0gbGluZV90aW1lKGttb2Rl
KSkgew0KPiAtCQlpZ3RfaW5mbygidmJsYW5rIGFjY3VyYWN5ICglLjNmdXMsICUuMWYlJSkgd29y
c2UgdGhhbiBhDQo+IHNjYW5saW5lICglLjNmdXMpXG4iLA0KPiArCQlpZ3Rfd2FybigidmJsYW5r
IGFjY3VyYWN5ICglLjNmdXMsICUuMWYlJSkgd29yc2UgdGhhbiBhDQo+IHNjYW5saW5lICglLjNm
dXMpIC0gIg0KPiArCQkJICJzdHJpY3QgY2hlY2sgZmFpbGVkIGJ1dCBjb250aW51aW5nIHdpdGgg
cmVsYXhlZA0KPiB2YWxpZGF0aW9uXG4iLA0KPiAgCQkJICBhY2N1cmFjeSwgMTAwICogYWNjdXJh
Y3kgLyBtZWFuLCBsaW5lX3RpbWUoa21vZGUpKTsNCj4gLQ0KPiAtCQlyZXR1cm4gZmFsc2U7DQo+
ICAJfQ0KPiANCj4gIAkvKiBBdCBsZWFzdCA5MCUgb2YgZnJhbWUgdGltZXMgZmFsbCB3aXRoaW4g
dGhlIG9uZSBzY2FubGluZSBvbiBlYWNoIEBADQo+IC01OTEsMTYgKzU5MCw1NSBAQCBzdGF0aWMg
Ym9vbCBjaGVja190aW1pbmdzKGludCBjcnRjX2lkeCwgY29uc3QNCj4gZHJtTW9kZU1vZGVJbmZv
ICprbW9kZSkNCj4gIAkgKg0KPiBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9TdGFuZGFy
ZF9kZXZpYXRpb24jUnVsZXNfZm9yX25vcm1hbGx5X2Rpc3RyaWINCj4gdXRlZF9kYXRhDQo+ICAJ
ICovDQo+ICAJaWYgKGZhYnMobWVhbiAtIGV4cGVjdGVkKSA+PSBtYXgobGluZV90aW1lKGttb2Rl
KSwgMS43MTggKiBzdGRkZXYpKSB7DQo+IC0JCWlndF9pbmZvKCJ2YmxhbmsgaW50ZXJ2YWwgZGlm
ZmVycyBmcm9tIG1vZGVsaW5lISBleHBlY3RlZA0KPiAlLjFmdXMsICINCj4gLQkJCSAibWVhc3Vy
ZWQgJTEuZnVzICstICUuM2Z1cywgZGlmZmVyZW5jZSAlLjFmdXMgKCUuMWYNCj4gc2lnbWEsICUu
MWYgc2NhbmxpbmVzKVxuIiwNCj4gKwkJaWd0X3dhcm4oInZibGFuayBpbnRlcnZhbCBkaWZmZXJz
IGZyb20gbW9kZWxpbmUhIGV4cGVjdGVkDQo+ICUuMWZ1cywgIg0KPiArCQkJICJtZWFzdXJlZCAl
MS5mdXMgKy0gJS4zZnVzLCBkaWZmZXJlbmNlICUuMWZ1cyAoJS4xZg0KPiBzaWdtYSwgJS4xZiBz
Y2FubGluZXMpIC0gIg0KPiArCQkJICJzdHJpY3QgY2hlY2sgZmFpbGVkIGJ1dCBjb250aW51aW5n
IHdpdGggcmVsYXhlZA0KPiB2YWxpZGF0aW9uXG4iLA0KPiAgCQkJICBleHBlY3RlZCwgbWVhbiwg
c3RkZGV2LA0KPiAgCQkJICBmYWJzKG1lYW4gLSBleHBlY3RlZCksDQo+ICAJCQkgIGZhYnMobWVh
biAtIGV4cGVjdGVkKSAvIHN0ZGRldiwNCj4gIAkJCSAgZmFicyhtZWFuIC0gZXhwZWN0ZWQpIC8g
bGluZV90aW1lKGttb2RlKSk7DQo+ICsJfQ0KPiArDQppbWhvLCB3ZSBjYW4gZmlyc3QgdHJ5IHRo
ZSBzdHJpY3QgY2hlY2tzLCBhbmQgaWYgdGhleSBmYWlsLCBmYWxsIGJhY2sgdG8gcmVsYXhlZCB2
YWxpZGF0aW9uLiBBbm90aGVyIGFwcHJvYWNoIGNvdWxkIGJlIGFzIHNob3duIGJlbG93Lg0KYm9v
bCBzdHJpY3RfZmFpbGVkID0gZmFsc2U7DQoNCi8qIFN0cmljdCBjaGVja3MgKi8NCmlmIChhY2N1
cmFjeSA+PSBsaW5lX3RpbWUoa21vZGUpKSB7DQogICAgaWd0X3dhcm4oLi4uKTsNCiAgICBzdHJp
Y3RfZmFpbGVkID0gdHJ1ZTsNCn0NCg0KaWYgKGZhYnMobWVhbiAtIGV4cGVjdGVkKSA+PSBtYXgo
bGluZV90aW1lKGttb2RlKSwgMS43MTggKiBzdGRkZXYpKSB7DQogICAgaWd0X3dhcm4oLi4uKTsN
CiAgICBzdHJpY3RfZmFpbGVkID0gdHJ1ZTsNCn0NCg0KLyogUmVsYXhlZCB2YWxpZGF0aW9uICov
DQppZiAoc3RyaWN0X2ZhaWxlZCkNCiAgICBpZ3RfaW5mbygiUGFzc2VkIHJlbGF4ZWQgdmFsaWRh
dGlvbiAoc3RyaWN0IGZhaWxlZClcbiIpOw0KZWxzZQ0KICAgIGlndF9pbmZvKCJQYXNzZWQgc3Ry
aWN0IHZhbGlkYXRpb25cbiIpOw0KDQpyZXR1cm4gdHJ1ZTsNCg0KPiArCS8qIFJlbGF4ZWQgdmFs
aWRhdGlvbjogMSUgcmVsYXRpdmUgdG9sZXJhbmNlIGZvciBhY2N1cmFjeSBhbmQgZGV2aWF0aW9u
DQo+ICsJICoNCj4gKwkgKiBIYXJkd2FyZSBzcGVjaWZpY2F0aW9ucyAoVkVTQS9IRE1JL0RQKSBh
bGxvdyDCsTAuNSUgcGl4ZWwgY2xvY2sNCj4gdG9sZXJhbmNlLg0KPiArCSAqIFNpbmNlIGZyYW1l
X3RpbWUgPSAoaHRvdGFsIMOXIHZ0b3RhbCkgLyBwaXhlbF9jbG9jaywgdGhlIHJlbGF0aW9uc2hp
cCBpcw0KPiArCSAqIGludmVyc2U6IMKxMC41JSBwaXhlbCBjbG9jayDihpIgwrEwLjUlIGZyYW1l
IHRpbWUgKGluIG9wcG9zaXRlDQo+IGRpcmVjdGlvbikuDQo+ICsJICoNCj4gKwkgKiBIb3dldmVy
LCB1c2Vyc3BhY2UgbWVhc3VyZW1lbnQgaW50cm9kdWNlcyBhZGRpdGlvbmFsIG92ZXJoZWFkDQo+
ICh+MC4zLTAuNSUpOg0KPiArCSAqICAgLSBJbnRlcnJ1cHQgbGF0ZW5jeSBhbmQgc2NoZWR1bGlu
ZyBkZWxheXMgKDUtNTAgzrxzKQ0KPiArCSAqICAgLSBTeXN0ZW0gY2FsbCBvdmVyaGVhZCBmb3Ig
cmVhZCgpICgxLTUgzrxzKQ0KPiArCSAqICAgLSBWYXJpYWJsZSBkZWxheXMgZGVwZW5kaW5nIG9u
IHN5c3RlbSBsb2FkDQo+ICsJICoNCj4gKwkgKiBUb3RhbCB0b2xlcmFuY2U6IMKxMC41JSAoaGFy
ZHdhcmUpICsgfjAuNSUgKHNvZnR3YXJlKSDiiYggwrExLjAlDQo+ICsJICoNCj4gKwkgKiBGb3Ig
c3RyaWN0ZXIgdmFsaWRhdGlvbiBtYXRjaGluZyBoYXJkd2FyZSBzcGVjIG9ubHksIHVzZSAwLjAw
NQ0KPiAoMC41JSksDQo+ICsJICogYnV0IGV4cGVjdCBwb3RlbnRpYWwgZmFsc2UgZmFpbHVyZXMg
ZHVlIHRvIG1lYXN1cmVtZW50IG5vaXNlLg0KPiArCSAqLw0KPiArCWRvdWJsZSB0b2xlcmFuY2Vf
cGN0ID0gMC4wMTsgIC8qIDElIHRvbGVyYW5jZSAqLw0KPiArCWRvdWJsZSB0b2xlcmFuY2VfdXMg
PSBleHBlY3RlZCAqIHRvbGVyYW5jZV9wY3Q7DQo+ICsJZG91YmxlIHJlbGF0aXZlX2FjY3VyYWN5
ID0gYWNjdXJhY3kgLyBleHBlY3RlZDsNCj4gKw0KPiArCS8qIENoZWNrIDE6IDk5LjclIHNhbXBs
ZXMgd2l0aGluIDElIG9mIHRoZSBtZWFuICovDQo+ICsJaWYgKGFjY3VyYWN5ID49IHRvbGVyYW5j
ZV91cykgew0KPiArCQlpZ3RfaW5mbygiRkFJTDogdmJsYW5rIGFjY3VyYWN5ICglLjNmdXMsICUu
MmYlJSkgZXhjZWVkcw0KPiAxJSUgdG9sZXJhbmNlICglLjNmdXMpXG4iLA0KPiArCQkJIGFjY3Vy
YWN5LCAxMDAgKiByZWxhdGl2ZV9hY2N1cmFjeSwgdG9sZXJhbmNlX3VzKTsNCj4gKwkJcmV0dXJu
IGZhbHNlOw0KPiArCX0NCj4gDQo+ICsJLyogQ2hlY2sgMjogTWVhbiB3aXRoaW4gMSUgb2YgZXhw
ZWN0ZWQsIG9yIHdpdGhpbiAzIHNpZ21hICg5OS43JQ0KPiBjb25maWRlbmNlKSAqLw0KPiArCWlm
IChmYWJzKG1lYW4gLSBleHBlY3RlZCkgPj0gbWF4KHRvbGVyYW5jZV91cywgMy4wICogc3RkZGV2
KSkgew0KPiArCQlpZ3RfaW5mbygiRkFJTDogdmJsYW5rIGludGVydmFsIGRpZmZlcnMgZnJvbSBl
eHBlY3RlZCEgZXhwZWN0ZWQNCj4gJS4xZnVzLCAiDQo+ICsJCQkgIm1lYXN1cmVkICUuMWZ1cyAr
LSAlLjNmdXMsIGRpZmZlcmVuY2UgJS4xZnVzICglLjFmDQo+IHNpZ21hLCAlLjJmJSUpLCAiDQo+
ICsJCQkgImV4Y2VlZHMgMSUlIHRvbGVyYW5jZSBvciAzLXNpZ21hIHRocmVzaG9sZFxuIiwNCj4g
KwkJCSBleHBlY3RlZCwgbWVhbiwgc3RkZGV2LA0KPiArCQkJIGZhYnMobWVhbiAtIGV4cGVjdGVk
KSwNCj4gKwkJCSBmYWJzKG1lYW4gLSBleHBlY3RlZCkgLyBzdGRkZXYsDQo+ICsJCQkgMTAwICog
ZmFicyhtZWFuIC0gZXhwZWN0ZWQpIC8gZXhwZWN0ZWQpOw0KPiAgCQlyZXR1cm4gZmFsc2U7DQo+
ICAJfQ0KPiANCj4gKwlpZ3RfaW5mbygiVGltaW5nIHZhbGlkYXRpb24gcGFzc2VkICh3aXRoaW4g
MSUlIHRvbGVyYW5jZSlcbiIpOw0KPiAgCXJldHVybiB0cnVlOw0KPiAgfQ0KPiANCj4gLS0NCj4g
Mi40My4wDQoNCg==
