Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308DF10706CC
	for <igt-dev@archiver.kernel.org>; Sat, 14 Mar 2026 11:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D041D10E086;
	Sat, 14 Mar 2026 11:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WX65wA5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5714410E086
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Mar 2026 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773487863; x=1805023863;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ADG4s3OFUzbJl/XVxSDZfqAMGG7mR7pMlyoTY3sPB8A=;
 b=WX65wA5tgg/iLw6I+jk2yJUWmNBkMQGgnb/j2/UdIDmHUWX3Bf67dP4g
 WEjgrSfz/yh+HEKGf2v6w7s55eyBhZt6UBEqWy2ewNDI3EG/ypKOYOIjg
 6A0S7g1eQJeS/QzgPDOC8TiaUOjgCni3mE6zBve9cNuCfD+QKrhxlEXc0
 p150olwmHPWmKhXomG3pnOVodyH6XfmC5sAuEhLZi1ppI20a9pgG2xzve
 qO6aa/f9mFhmYM3Xvk2dJ8f2u5vNxbSvZZRIcmF6i4MZxerDVww9aR5Wl
 3wmoNLDb2sRL8aZknZhEc0NzpX4PwapGIN/f1J1xBLU9P8PgseG9Fz+go A==;
X-CSE-ConnectionGUID: RQF34tBGQZOON7rRpLF0LA==
X-CSE-MsgGUID: J1fUZUQTRIe7Od0eTbNREA==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="92147274"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; d="scan'208";a="92147274"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2026 04:31:03 -0700
X-CSE-ConnectionGUID: uDHhsy9tSaihrkNmhhjCeA==
X-CSE-MsgGUID: qayoAZu6SMO6OK5RuwiOUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; d="scan'208";a="223757949"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2026 04:31:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 14 Mar 2026 04:31:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 14 Mar 2026 04:31:02 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 14 Mar 2026 04:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTn0c/iSnYvGUtQwPcIxvhqsI//zF/dAqxmYK7yLIDbpNvop6dJ/3AGDBgusNpFRvmXIqMyp5xfYqF6raBXO92FHwVzohtV2xyqsqEVOVzvXAzbxSNNj6VEQ8xMP3ZUkjpZB56WXD3tPDMS/8O9EX6QmjOuS9GWg0nz8nouF3wzKzc+tdtmikFvOCsyAUnnac3xUhG7zzYeo7qULmADseYsKjVE9DPWkGpmIOMDXWqlpSSEz74BmRFyYYUqXNyGUZLsM5vf0FTboXTXPPeluf5cuc7dHrQwQGh1gd9FW8d2ToVKWjeTQB4PweSQFRJoyDqZ+kguzw2SxhynyiwbwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADG4s3OFUzbJl/XVxSDZfqAMGG7mR7pMlyoTY3sPB8A=;
 b=aXz22jnlqLRRwQ3cepQvPYNfJTCBNMzn5Fz9SRbfTsqDSTwhIW1hmRXhni6sT7RQY3zb5Vr7qFfz9Rl6R/y7bGt3Eod3jLPrLWhbZccwPauJerMBxolDpvKVXKqYjzXXkQgevDqTBYv7l3y+pQt8IfUbaGgZQZLSw48xOmhEZlg3WoAvvnZ1B1m8YTXQZ9zXJytVBH+LCgMjs+IOdH1SgkjoIyrLrN0yO7VTmfbSX79p/mijKVdJxj0MloEUHUMaG64qpzajEDjq8jyhF52YJC1TnmhFd5FzudDlgSEn7+lHmNF5qjW+2YLqtHJLe0g3m5gm3dXfcS8qmHwz5D9H6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by PH0PR11MB9611.namprd11.prod.outlook.com (2603:10b6:510:3b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Sat, 14 Mar
 2026 11:30:55 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9723.006; Sat, 14 Mar 2026
 11:30:55 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v8 5/6] tests/kms_flip: staticize & remove unused
 global vars
Thread-Topic: [PATCH i-g-t v8 5/6] tests/kms_flip: staticize & remove unused
 global vars
Thread-Index: AQHcr6a6ifaA0TKsOEOz/Rh3XS3CDLWt7GCw
Date: Sat, 14 Mar 2026 11:30:55 +0000
Message-ID: <LV8PR11MB8485D3A3D709E523A388F125E442A@LV8PR11MB8485.namprd11.prod.outlook.com>
References: <20260309092528.3336467-1-michal.grzelak@intel.com>
 <20260309092528.3336467-6-michal.grzelak@intel.com>
In-Reply-To: <20260309092528.3336467-6-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR11MB8485:EE_|PH0PR11MB9611:EE_
x-ms-office365-filtering-correlation-id: 822e624f-33bb-4af5-c45b-08de81bd281a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|7053199007|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: jZkTT8kltKj/16hkQitWodnbGRqu8jjiaMgNTPmOqHOYK2TFPbt2G9q4A1MaeRDQ9fwoaATEcGjuxcQE4ZKNHIXDQzAPo1hpBTk86QeJGCUT6twvb0+eeIkk+xyqCaMCM9NWY1JkA7M0+A8qyosJxSV8wb/2dOged/1cZeGE4T2UZ0eQ1RbVPfVW1UUk0qgLrz4ogj/zS2YuFJTGdikXpCMnPHhwvV77Xpc2j/+kErBL9h9bHgu287OKQI9E/v2R1mhOubERVcajUQQZ5XsqSIUXVhmkVFtcKmepywvHakNCDwxnGqaWOYtm2eAHgfgIcBpjhHXL77hxNEbpoubr2D4DHy+m0jhprJatgrlm8k754YYYVbT8vV7jLD1x3sqvsFyEjgb+YVCTJ+JheI7omuCnaVq3ITAuF23QJJlBDxa/OxcemXgvxVrSFseSnGp4kF27W/KXIdThXI4MS+/L+wzqAldDGoIRRUCfzJ2OAdNGyzT4hiSTQangEo81M7Loyf3XFF3/MGyevV0i7M/6/qX8wnvfmy+Eb3FYDkPa99Hi9gGAsrI1AU5fayktUvQhXaa4irqvTpboXWan7Ct2KU4dWCN2krViaN4HVbCl/nfcA04RY53TQj62Kz/EpT8OG16jqk0gpdDBtLEp3g9fdEik0ctbujd+GK/Cjypk6peKSRHmDFMnDV6IWrUNnfiZRpTTYy2ZjqOuNXIKLwTICecdr1DhqZvRu/dbCos7qQpEPFLwE5jefE2BeN1pptDPE96evJS+fkSmNOlIpQiFXAI2ous27kA7UzwjsQtTnaI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7053199007)(56012099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STFUeWF5dWYvcVJPSUF0b05CRVpheHJuQmNQeDNYenB6QUJ5YisrZjZ4Smth?=
 =?utf-8?B?VnZBYVBzcWRuZmNtRVp3QlljaGlzamROc1Z2QTRSbVpCdkFWUDdCWnZ3azVP?=
 =?utf-8?B?ei9yUnNkNXh6WW5hRHlKbEppSXJlYWcyUVFuZDdabnRkNkJkUUpZRnRyTWpD?=
 =?utf-8?B?QURFNDhrUnpGejhPWmdzUDB6L2UvTTFoS0dMOUhHT3hHM3ZWcko1N1E4WDJw?=
 =?utf-8?B?OVJzNnZCNUdaYW93L2hRVkw2OGczQStBY3F5b2xMbTR4OElPbDFpMGkzd3Y2?=
 =?utf-8?B?UGJrbzF0UW1yaDRFNG4vcXlRWmlYalhudUVBY1VhRlV6cjRsbkEwLzhqZ2Nv?=
 =?utf-8?B?MDZLNVB3RGxpZjl1YkhaYU1BZ1A0N0xBY0IrNGl3dlJqWjBwb0JscEFUazhT?=
 =?utf-8?B?SFdMMThHODJHMVZSM1pmR2hIVCtnWkpWb1lCekFlWXpHYXpWVGhwcG5UeVA0?=
 =?utf-8?B?UWw0V1RBWHZXTUVYNU9BaFNiR3h5NVlpbDNaR0VWNUIzdHNNa2NHNm1UNVVI?=
 =?utf-8?B?RURIWCtSWTNOU3pkcGp0eDQ2QzNhRkpDVmFYWGZjbW9OOEN2MkxXRHZ3THFW?=
 =?utf-8?B?ZHlYbS9iMnFHMEtXT3FHWi9kYjBZTGY1MytORnpNcHVJSWcwaDljWVMxQngx?=
 =?utf-8?B?MEpBVWNmdktTdkJiRXh5MWFpb3NJWFVURjIwN3loZ1cvUWw5bzVUWXFnaEpF?=
 =?utf-8?B?QlJBUVhhQURXbWR6V1hYS2REYlk0K1VNb0N2U3FOckZyMlFkQ1I4L3JHNTBK?=
 =?utf-8?B?SDdZZzYrVnFYSEdtWlhMb1RNa3pOZC9UNEVNRzZaTi9lLzVnVWlXR1RSbmlF?=
 =?utf-8?B?UysyYUdsZUZ1ZTJRcGhRMTZZVDVmemQ1U2luQS91ejlXK3gxSmJPalZrRGIw?=
 =?utf-8?B?YTF4Yjh6ZlFNMEZaSkQ5eXlLQUFybTJJdkthMWlydTdMNkx3dHprSEpPWEx1?=
 =?utf-8?B?NFdtNEhaZENxRkNkMHF2d1EwWDUvV3QwQnFQYVBSZUo1QUdpdkRZL1pSc1pL?=
 =?utf-8?B?VU0vN3liemVnKzJiY0Z0NXhIZDYxekxaYWZPTExuanIrWWZtTTlzWHBwbjhk?=
 =?utf-8?B?NU1mWjFCQ2IyTDlmR0tkNzlmQW9zTlVPUmcwOUNWYUNaTjkyUmxTOWREWjZz?=
 =?utf-8?B?NFAreGx0bFdDcHFWR0lNbUtCb1VzVHNod0M2WVQ1bDJma2hPUVpwRHFGNjJw?=
 =?utf-8?B?UWh3dU5OcVB0WDUyMC9ISVZQYWp1dU5teFVkMk5iWWFVUHlhYXVwa1VCUU5K?=
 =?utf-8?B?cWFFRWJhb0tFUmtJSldhT2o0bkVSZ0oxVHdHbGpORTY3YWJwNEtVV0EyVzgv?=
 =?utf-8?B?ODVkdFJabmM2SDFjelJ6Y3Zib1o0NTIvOGdlMHhpMjlQU3djSllXZnJyUklC?=
 =?utf-8?B?ekszL1U1bHF6VEM3clJGUmhqZVZJbExWLzVJaHBGS1gvY3lHOTBnU0NtVmNO?=
 =?utf-8?B?ZklUMGtPYWVqTW5xT2VHamVpL29wUThqYTZOSi9XWUNQa3AzVGtmUExCSTFm?=
 =?utf-8?B?NlRGY0U5S3h6QWdCenhzbnVkVEk3Q3J2WStjOFpzQmRWTDJ4ZCtxTWxoWWNK?=
 =?utf-8?B?M2lmalFuT2xveGliM1duQ1hGVHJvRld2bjJNVGtSVEc2QWRTTkxaTTI1b3Nq?=
 =?utf-8?B?c283OVpuQWZ2R00ybVZZbER1akl0OWVzc0pxNVJ2WkdZWE14MTR0MlBoS1BS?=
 =?utf-8?B?d2hmSmNXUFhvdU5GdlFBMmpkNmsyYWxqYnlMa0ZURG1mRWVIMmRCYTBRRXda?=
 =?utf-8?B?b2NtUHpHeVVMNmJFVG5uYkN5bnJuYUV6QjFkSXhTL2ZzdVFvZW9OVitUYWZt?=
 =?utf-8?B?RU1HejE2Z0Y0cHhjbFZuNXF2cUVvR3JuUDE4RVNEZ01xVzRxTlRpamJCelEr?=
 =?utf-8?B?VEdWR0twT2dHWTRtTThwei9CTTlkdDRNRmorNkI0TmJTNUY3S282Vi9wSEYx?=
 =?utf-8?B?dVo3QUJCNFUyMGhJNG1xWjdvTi9hR291dHQyY243bGFkOFVPbTZkeVZPWVN5?=
 =?utf-8?B?MWc0V0luSFBPbVEvckZ2MGhxQ2tvVGNpbWFQdlJ0ajkwNmJONDZibTY4RkxX?=
 =?utf-8?B?RGdYdm00TEIrMkZDWERqRlhBdTgzZUZZUXQ4eFUxVkVvSEtaZDJhRjlEMlRw?=
 =?utf-8?B?dUxpVk9NWVRTd1NXbDc5Z1ZhcUo1amNNSUNxY1kvU1lZL3doTW1GemVsMGRX?=
 =?utf-8?B?UG4rWGFyWmdRT1pQdm9jNmdkSnl1a2JZby9HajhCRW10eXBYS0VUYlQwVm9X?=
 =?utf-8?B?c3lHcDg2ZlY3TXkyOW1EVzh0cG9BWTFFcFR5dkVKTW4zd2xkeUNqTG9iQzNK?=
 =?utf-8?B?VGx3eWtqeHBFSGN3S0JBcnNSL0lKbTA5NkdUdlFZeFlHaDFWSUVEWVl6akNr?=
 =?utf-8?Q?r60nIP6EHGQxM47U8Wzh3Ah0vvbXiRUdkzQRgCYb7S+w+?=
x-ms-exchange-antispam-messagedata-1: 6ZD3Hf0Vz/U/tg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NKK7OGUwMuBlT/wcj7Y68Bx2egmgLrZnWOYg+64+AhDQ8oK1CgWbahdM9GZpw8p2CZRVvgbCY43u/nRxSZPyl2pw/LH4Pdcnn4+Ecru4slJvvxAcjlOo5REKQcJl433HfP2RBPk5Pk/OUumIDxHe7WG1nryFffHkK6WzuieGLeJrwUb3TGw0OX106Qopv/GuOmmhLS/7RcW32ITZTuOU2bPT9/KvG4ey5QEj6+Kb5AQt6+LhioFLJ6lb09RCyPjMhFpyiy4h0HrDMSc+Ur2BmTBn5As/jEEDDSPBq68ov6IxqzEBXAU22m3OvSq31hevh7jzKCF1vZpCzMKHQnVkbA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822e624f-33bb-4af5-c45b-08de81bd281a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2026 11:30:55.4780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a2OKnGNvVXgfJX+RC/0WnTy4tamgSRarisLzFG+qDUfot/kmHnc+k9QuuQfg4GdbShUk95lTYad0csYy6iiTPykjeLhuuxe45TWMKUVMog4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9611
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBHcnplbGFrLCBNaWNoYWwgPG1p
Y2hhbC5ncnplbGFrQGludGVsLmNvbT4gDQpTZW50OiAwOSBNYXJjaCAyMDI2IDAyOjU1IFBNDQpU
bzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBHcnplbGFrLCBNaWNoYWwgPG1p
Y2hhbC5ncnplbGFrQGludGVsLmNvbT47IFRoYXNsZWVtLCBNb2hhbW1lZCA8bW9oYW1tZWQudGhh
c2xlZW1AaW50ZWwuY29tPg0KU3ViamVjdDogW1BBVENIIGktZy10IHY4IDUvNl0gdGVzdHMva21z
X2ZsaXA6IHN0YXRpY2l6ZSAmIHJlbW92ZSB1bnVzZWQgZ2xvYmFsIHZhcnMNCg0KR2xvYmFsIHZh
cmlhYmxlcyBkZXZpZCwgZmJfcHRyIGFuZCB0ZXN0X3RpbWUgYXJlIG5ldmVyIHVzZWQuIFJlbW92
ZSB0aGVtLiBTdGF0aWNpemUgbGVmdG92ZXIgZ2xvYmFsIHZhcnMuDQoNClNpZ25lZC1vZmYtYnk6
IE1pY2hhxYIgR3J6ZWxhayA8bWljaGFsLmdyemVsYWtAaW50ZWwuY29tPg0KDQpMR1RNOiANClJl
dmlld2VkLWJ5OiBNb2hhbW1lZCBUaGFzbGVlbSA8bW9oYW1tZWQudGhhc2xlZW1AaW50ZWwuY29t
Pg0KLS0tDQogdGVzdHMva21zX2ZsaXAuYyB8IDggKystLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvdGVzdHMva21z
X2ZsaXAuYyBiL3Rlc3RzL2ttc19mbGlwLmMgaW5kZXggYWUzODA5NmFhLi5mMTdkMDI3Y2MgMTAw
NzU1DQotLS0gYS90ZXN0cy9rbXNfZmxpcC5jDQorKysgYi90ZXN0cy9rbXNfZmxpcC5jDQpAQCAt
Mjc0LDE5ICsyNzQsMTUgQEAgc3RhdGljIGJvb2wgYWxsX2NydGNzID0gZmFsc2U7ICBzdGF0aWMg
Ym9vbCBhbGxfY29ubnMgPSBmYWxzZTsgIHN0YXRpYyBib29sIGFsbF9wYWlycyA9IGZhbHNlOw0K
IA0KLWRybU1vZGVSZXMgKnJlc291cmNlczsNCi1pbnQgZHJtX2ZkOw0KK3N0YXRpYyBkcm1Nb2Rl
UmVzICpyZXNvdXJjZXM7DQorc3RhdGljIGludCBkcm1fZmQ7DQogc3RhdGljIHN0cnVjdCBidWZf
b3BzICpib3BzOw0KLXVpbnQzMl90IGRldmlkOw0KLWludCB0ZXN0X3RpbWUgPSAzOw0KIHN0YXRp
YyBib29sIG1vbm90b25pY190aW1lc3RhbXA7DQogc3RhdGljIHB0aHJlYWRfdCB2Ymxhbmtfd2Fp
dF90aHJlYWQ7DQogc3RhdGljIGludCBtYXhfZG90Y2xvY2s7DQogDQogc3RhdGljIGRybU1vZGVD
b25uZWN0b3IgKmxhc3RfY29ubmVjdG9yOw0KIA0KLXVpbnQzMl90ICpmYl9wdHI7DQotDQogc3Rh
dGljIGlndF9kaXNwbGF5X3QgZGlzcGxheTsNCiANCiBzdHJ1Y3QgdHlwZV9uYW1lIHsNCi0tDQoy
LjQ1LjINCg0K
