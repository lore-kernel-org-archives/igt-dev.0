Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1808CD5BA4
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 18:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F46C10E40C;
	Wed, 20 May 2026 18:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OclQJt7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BFF10E40C
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 18:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779300129; x=1810836129;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4QGjIkZKxEJiDdxKzEW/MtZKqplWavdB33I4JMN1Xvo=;
 b=OclQJt7uOMTIaFOV6tu7cIzTIoJnAh/Xybpf5KeJDhUJEiYcKJtrSEom
 5DHb1Dxwl5WbTlRlKEIAgBi4vwv5v9IgjUhEO2RBp+uzUi38b/8pUx06X
 64Qv41Q8SIPJ1rixdV1lm7F6qrhV5fH0IB4etw47Yn7s9dsaMCfb+fvAg
 6DjXJmDYY14XkAYdd/omnL7YwmITkLAE+chp8AiDcOjsiSJJhj2KNmBzV
 c6rB1P60aR+/0mEYaMpkSwsjzztx6HBUhF7yzJnOsn1dAnFCQAZshqyWM
 KcOJ98ITjnRXEX/0M7dalMsaqflC93lkvy3QTF1qrxRZbFV4wSt0jOL0s A==;
X-CSE-ConnectionGUID: U3QpDcGdRAStY+cH8wIHJQ==
X-CSE-MsgGUID: tS4YlYCpQ2aGGPbzdRRQ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80327445"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80327445"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 11:02:08 -0700
X-CSE-ConnectionGUID: VKy9HFUUQ+efXXJCt4LArg==
X-CSE-MsgGUID: zbGArHDUQZiLRl9LvI/2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="237657443"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 11:02:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 11:02:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 11:02:07 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 11:02:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TN69BBiif7Oma7MjPkSk+H5pEK7k1F0RDJ7uj7zrfYSW3pHlFIEL22UKqYhGH6qff5d6dRiM2QXK/8LD1gldiWmGFLoacIB6kGG/LTMaDaZ43+6pAdbqN79C0gH9mIVW/irmoxPKY+Cgl4nYAZ/yae5g6x8NRzKDPO65DkKpTmPDpAoHojelqgJSkMxmeFF9QbBx9lb3MixjtYl3jMW9NCZNaO0hEeq6ksgYk34QyAbmhLXvN2GuvJmLh0lYfIh8RsZfJ+i3Xawi28lUO4JgTK2iV+dG36wh0YO9mrpVQtpWGnF3jFLplyGqk0Sx3Ku7A+3rcqCccE+z6rkj+bxq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QGjIkZKxEJiDdxKzEW/MtZKqplWavdB33I4JMN1Xvo=;
 b=D/JblcpVc+oGR87kYFIL2smF7f7NgpFGbrWmWvAIqCP1zYE0IVqeOr/CEnXaS5qki4RYyrnmne5EjBesHXye1yqTbrkj7fHP21idVWCfNEwh+F6/kI2Gjyt7a3SszkyqW9IZO2/X5aEoj+1RLSwo30dua9AgkYsqVWaIBIwq445IRSzT1JBYZc1ZzvrlD+L2lmYdpSncHfbS0iWYggX8Ocn5rMnvIj5jv6Zr3IGliGhLe3ECBK/grobJloN75OIuMDaSJ6gM5n4DqAHKibxEmH0yGOJwNltfyBo4PftFh2z4V9EAeMn24/4y+VjQC6Vb2HEgshT2ylXbjn1XUEpIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2842.namprd11.prod.outlook.com (2603:10b6:5:c5::12) by
 SA2PR11MB4857.namprd11.prod.outlook.com (2603:10b6:806:fa::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 18:02:05 +0000
Received: from DM6PR11MB2842.namprd11.prod.outlook.com
 ([fe80::8022:1ef8:d7b3:cb62]) by DM6PR11MB2842.namprd11.prod.outlook.com
 ([fe80::8022:1ef8:d7b3:cb62%5]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 18:02:03 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH 1/3] lib/gpu_cmds: replace open coded ibb data copy with
 helper
Thread-Topic: [PATCH 1/3] lib/gpu_cmds: replace open coded ibb data copy with
 helper
Thread-Index: AQHc6D8rUDygwaUAeEiwKm6G3FfU2rYXNMtg
Date: Wed, 20 May 2026 18:02:03 +0000
Message-ID: <DM6PR11MB28420F612B9198AC2D058474E5012@DM6PR11MB2842.namprd11.prod.outlook.com>
References: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
 <20260520-ibb_fixes-v1-1-d0c8ab2d07d3@intel.com>
In-Reply-To: <20260520-ibb_fixes-v1-1-d0c8ab2d07d3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2842:EE_|SA2PR11MB4857:EE_
x-ms-office365-filtering-correlation-id: dbdfcc6a-5f99-485a-4d1d-08deb699e5cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|4143699003|22082099003|18002099003|56012099003|38070700021|11063799006;
x-microsoft-antispam-message-info: M52OvzQHCexoZBk4Q0xR8qx7nFogRXQ+ucDOicQ58+CZ1t3ioijTVmW8ylJA4laga9ukiDAaYoGb3u3eI4/RXSZXsHWiH8L9bxG3BR4zTpdEyRknbSNE1ElazvxyKZoYNBQWcxWdOLv5FbICATLrDFy1AHGmakOsWLUggmEZhRAmrkZG++rlMLfbD47VXxPenWmN3GIji/GSuH0BXTyPhhMDjcuKemxYc4EL1KHV93ON2eQYrkNQb+PL9XlKLa18Qe/ZWoWpTzFEE2SRWk5Yyp8N3E2kTQmf76QaoFNYuF0CbOrnIeAlPp5bvpmtPUJTKV9cI7K4Rs8q/lCRiDbs8RMCo32/zE+iLhv1NbB28OeWGbZaTY30COPsgYJTV2WvZ+PrjPz0vZTgMaGeQN6p9Tb4wgMfFrQWBPxK3odoBTewyKmbtW9avkVM4nuCC7I5bZnaoL1ywbw1mZ4GqKo/kQvJ8MN6kG7bWBmL5PW2zp9FQAH4wANGdHot37fcNt4EwImCwW6f4Ffcm132B0MWni8Mn+cGVM2lhudlLhOF06Fy35s6L9KLcw56U2AM558LIOX5il9uBdXHzuCDTJ2BJXFspZ+NhWkAMYZsiiG9TLv5oQjw6Anv87tH438ItLLkV22CQs8RdB82/5+n2l81YJuQSLRtXlLoMAMSSvepMFYRzhUmTa4rxMQnfe1OSW5xgXPdEhrj3oJ86aZY03cz5vzs3HI1+JNFJfixShVLxwH6LEY8VrSFrvVG0h06sszR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2842.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(4143699003)(22082099003)(18002099003)(56012099003)(38070700021)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGtyMWxNQzZyTUF2K3ZuUVFCdkcvR09qSkF0UlQyWW42TWZsYWMwN29zSlYy?=
 =?utf-8?B?L3dvM0h3RVpOZytBN0pjYkUyRmdXcUZxNGZqcnlqZWZKREJONUJGV1hRaHVV?=
 =?utf-8?B?ZXJKdytZNUxDVGhkbDU1MXhZTEY0SFFDT3AwSmxUUVRLeDZudWE1RXA0MTZx?=
 =?utf-8?B?aUpZekJ3Q1A5RkExd09VZi9VRDJkRVY1VHR2V3grUHJiTWh5ajVQM3JzMjRC?=
 =?utf-8?B?YUM5bVlHeG5HUjIyRXdMZ0h1VkF3M0g0am9USWtqeW5xWHdWMzc3RUNZc2JS?=
 =?utf-8?B?MFNCNVcvck81Qng3V0FQcWpSYmVRWERhd2p2aFhZSVZoVEw0bzE0ZnVJTG1i?=
 =?utf-8?B?SmYrZFErb2FjUktVdDBXemU5OG1YQzZRZWc5dS9VWjB1NHNKVFY1Vm9DSVBP?=
 =?utf-8?B?NEJ2U3NhUjl4MHA2cEFrck1LU2prUXBOWW5SU0hhdzZzTmJuYTVxZTZGM0xx?=
 =?utf-8?B?cklkdy9XZ2NnVVdCeldGekRManRTeEVTYXBCUi8xcW5pZVpzT1VTMGhBb1JE?=
 =?utf-8?B?REJiampUUUhSL3JMNXR1TkU0VDJDcW8zVnBZYWxrNzRtV1VNQThIREh6aUdy?=
 =?utf-8?B?WTVIa3h4R3hYU0JMUHc3NEtsM2ovYVBqdUtQWUxJM0xjKzhWcEp3WTduUTVZ?=
 =?utf-8?B?WW45S2xCQkVJWksweFZnMEFCaUxiOVRENXVjaXdNZEUrV2E4c3FxOHVlRGpk?=
 =?utf-8?B?dUVxQTZmRUtsOEhldDlEQmN5Qy84NTBBK2YxZ2NlRUVMUHRrc3MrcHFYS2t4?=
 =?utf-8?B?bHR3NE9JdUx5Mk94MGVvZmFMaTk0Vzd1eDZRQ2RJMjgwNVNucVFjV3NQVEVN?=
 =?utf-8?B?NWhpYWxPK1ZPOFBrTDZTa1JuUzNSZWo3eTlNS2dxdkV5NHVJQnZxWitkbXkw?=
 =?utf-8?B?ZFdFYWlLb2dQUU0zOHFGdUNOVEJwOHlReFJZT1JWZ1B6NW41blJQckk2bmVW?=
 =?utf-8?B?UlRJVUpGZTJVckNaeHZaUnBybHhyYTZKM0luL09Vc1Blc0N3WEVEa0dwV1Z5?=
 =?utf-8?B?SXVJN1lqM3hOVml5dkVIekFBcUEzeE12THhDcEhCdnhPZW1mcHFCZkpWM04y?=
 =?utf-8?B?ZWNCVS9ibU40dVo1WlN5ZUJrdEY0VDlvc1RiaDBTcUFlU2NDczllM0Z3UStD?=
 =?utf-8?B?YlRnK0ZGVGRzMG12NzhmRjNJeDd1ZjIycDczb2psM2Z5SVMzbExINitLb3NU?=
 =?utf-8?B?NWpEZUxXTFI4SHBTMnV2VCt4RzBIMERwd0hVQnRBQ0FkQjZDMHZ4REtUSTJq?=
 =?utf-8?B?VDJCSEUxYUJtbXhMK1Q0T3F1Wm9iVWMrdjdmQVpJRDNudEJjZFBrcXRpelJL?=
 =?utf-8?B?UFBhNGJiUVcvQnZoYjVNMlVqTFh6OHFxc0pLbHZsemtzcGhSdzdDelNTY1JV?=
 =?utf-8?B?V2RzcGRZZWVUZDJpVEdzTStkaC8rOTFtM05kR012aVlETnRhamVKRWZCb0Zn?=
 =?utf-8?B?dExCRWVjaWhFWlZrS1g2cWdnaHI0TlRrUU5CdXN6ZmdCT0xFRGhoZ0hEdUdw?=
 =?utf-8?B?eFFlKyt4dmg1SzU5OU1Gbm54cjlESzZmQjJRZ0J3MDdjK0ZaWFZYWnF2emxi?=
 =?utf-8?B?R213MkxaT0JVL1FLMk93b0V1VnBCeE1xbjhuWHVGS2VPR1B3QUN3NWFSeFJm?=
 =?utf-8?B?WEJyVElRT3M4dzZWdzRqRTBCMEhHeEhRQVA3N0x3NjVaMjViOXVlR3ZzbExD?=
 =?utf-8?B?NXlEdzBVZlRtaDJJUGRnSGhnNnl4TXpuVlR4V1dGc2IyMDhUWTBjMnhrZTNG?=
 =?utf-8?B?cWJwU1kzS082bTB1OVcvc1FUbDZPalAvVElYL3RsU0ppZEtTQVMvb0liYmNa?=
 =?utf-8?B?eEF2V2tDekhWMnBid2NuS1pGZ3hSdHFLWlNnbFdYWkR0U3BYZnJqR0VSRk9W?=
 =?utf-8?B?Um00TzFtNXRocjBBN2wyVlpPbzlJbHdXVFlDU3BYTHd5RnhIZXZ4QlhWcUpE?=
 =?utf-8?B?TEtTclFKWERldThiMkVLUGhtUzZDTG5vZm1JRmttQTByY1JHNVM0UHNkV0V0?=
 =?utf-8?B?SWRGQkREL2pzTXozV3VsdCtsaWVieUppSDhVbTZGd250MGZUL3Jndkx2dW5C?=
 =?utf-8?B?dStiRzdLQ1BpaVJJNWY1ek9jUGYrRU5yWHY0RWxqSko4OC9nMmFOS0lWTmVL?=
 =?utf-8?B?enZ0TW9VOHd6NDN0ZVFPMFFpSU56MmlpaEhtOUxYSjRtQmpnWUlxK1dsMnJV?=
 =?utf-8?B?eW15YVBXVUgvYWpqc3NBMGFEVjRvblpPL0lrUUgwV245WkpCNkNmUVd3RGdZ?=
 =?utf-8?B?anFjZHdsV0xVTVFMREUwMmN0NzdSV3lPZitkVXFBL0lwKytMd1lGblF3NTVK?=
 =?utf-8?B?bEtON1V3RlNEc28veEczRUtUL0NtdWhEQndLYld1TnlaU1p4MXprSkpTZVQw?=
 =?utf-8?Q?GWUx5RQhNnFpTItgd+L12fvgBWBOxBWBZ96TlsqUZDCd8?=
x-ms-exchange-antispam-messagedata-1: KVhdlq4IHOEgyQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qEDAC0We3YfcVRVgc1JQI/x3v6t15jIa+hkHrQSEdH2mo1xc5sWcOCWN7uTgx0SsgwIrjvFfIDI7Nk2Atr1k+40nBozoIchsTJCwyI0nr5JPOw0MQAxrWj00pVqN/uC9XwgVEpOXNr2tIQy4H/1op2YjfjEEEzIMH87ONqXfACQtvQLBg6jnqat5tEXFGo0//GTTVoOC6ey/8b0cfKkpZaIBMzawTspEp1K4YcrcR5iXaPKmBzlrADPJqkcmgPP3f/+gMXF2suZiYR6BpHZ2bnariCL+fJ0GeP4T6ARMLG+7+x9QByGWWooXWwmMJZY3x7u6h2OVUBL/ZQusY/6u6Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2842.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdfcc6a-5f99-485a-4d1d-08deb699e5cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 18:02:03.4792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6OlzZWpX4BAsnW1/MqP40szMin+9I2UgxzQYw6x+eVRSrLiWzkTOA5vHlj5iKh14/vWAxaFRwf2h5Y/tpm2oPzmB0LWGq1Vwg7dMkXyg4Rs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4857
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

DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSGFqZGEsIEFuZHJ6ZWogPGFuZHJ6
ZWouaGFqZGFAaW50ZWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgTWF5IDIwLCAyMDI2IDI6NTYg
QU0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEtlbXBjenluc2tpLCBa
YmlnbmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsgQ2F2aXR0LCBKb25hdGhh
biA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT47IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29u
aWVjem55QGxpbnV4LmludGVsLmNvbT47IEhhamRhLCBBbmRyemVqIDxhbmRyemVqLmhhamRhQGlu
dGVsLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAxLzNdIGxpYi9ncHVfY21kczogcmVwbGFjZSBvcGVu
IGNvZGVkIGliYiBkYXRhIGNvcHkgd2l0aCBoZWxwZXINCj4gDQo+IEhlbHBlciwgYmVzaWRlIGNv
ZGUgY29tcGFjdGlvbiBhbmQgaW5jcmVhc2VkIHJlYWRhYmlsaXR5LCBhZGRzIGJ1ZmZlcg0KPiBv
dmVyZmxvdyBjaGVja3MsIHdoaWNoIGFyZSBtaXNzaW5nIGhlcmUuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCi1Kb25hdGhh
biBDYXZpdHQNCg0KPiAtLS0NCj4gIGxpYi9ncHVfY21kcy5jIHwgMTMgKy0tLS0tLS0tLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9saWIvZ3B1X2NtZHMuYyBiL2xpYi9ncHVfY21kcy5jDQo+IGluZGV4IGY3
YjZjODcwM2Y3Yy4uOWRhZDczYjZkZjRkIDEwMDY0NA0KPiAtLS0gYS9saWIvZ3B1X2NtZHMuYw0K
PiArKysgYi9saWIvZ3B1X2NtZHMuYw0KPiBAQCAtNzAsMTggKzcwLDcgQEAgZ2VuN19maWxsX2tl
cm5lbChzdHJ1Y3QgaW50ZWxfYmIgKmliYiwNCj4gIAkJY29uc3QgdWludDMyX3Qga2VybmVsW11b
NF0sDQo+ICAJCXNpemVfdCBzaXplKQ0KPiAgew0KPiAtCXVpbnQzMl90ICprZXJuZWxfZHN0Ow0K
PiAtCXVpbnQzMl90IG9mZnNldDsNCj4gLQ0KPiAtCWludGVsX2JiX3B0cl9hbGlnbihpYmIsIDY0
KTsNCj4gLQlrZXJuZWxfZHN0ID0gaW50ZWxfYmJfcHRyKGliYik7DQo+IC0Jb2Zmc2V0ID0gaW50
ZWxfYmJfb2Zmc2V0KGliYik7DQo+IC0NCj4gLQltZW1jcHkoa2VybmVsX2RzdCwga2VybmVsLCBz
aXplKTsNCj4gLQ0KPiAtCWludGVsX2JiX3B0cl9hZGQoaWJiLCBzaXplKTsNCj4gLQ0KPiAtCXJl
dHVybiBvZmZzZXQ7DQo+ICsJcmV0dXJuIGludGVsX2JiX2NvcHlfZGF0YShpYmIsIGtlcm5lbCwg
c2l6ZSwgNjQpOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgdWludDMyX3QNCj4gDQo+IC0tIA0KPiAy
LjU0LjANCj4gDQo+IA0K
