Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA67CD37AE
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 20:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4547910E59C;
	Tue,  3 Sep 2024 20:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjoKrLGx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6882910E599;
 Tue,  3 Sep 2024 20:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725397181; x=1756933181;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=2tuRwm9KVxCqJXPGbD4mhaaUwXr83w15C1P51d9DjyE=;
 b=fjoKrLGxlmGCxtUpSEvJumnK3znPsc6fVSxS7XFz9ut75rmnLJc+8iqv
 6lbOqHGaPN+9O0VLgXJ1rsPuE/RLvYNNcTjV3/H25/NWScOg0zt3fNlfK
 5Q4ybr9yhwTk0gc0m0mZU38A2ezl8qW8VmLreqskxvWq3+1de2gJr5Gh+
 QS7ErZAAn0HuRhTc99XZMckQsffdhbJzJn/2AhyvCqTnuMWNpxrHiUxHY
 DOHmbyaT7F6wXyUAUczonzVZojCNELXndTU1fk1u24HguCnC6WQEERANN
 f6vIzXoX38qlfdBZjsiwZPj2KCD59/rnDrnv76RmYqiIm6mYKyPgcC2Lz g==;
X-CSE-ConnectionGUID: f7+FLIYXQ2W1fIT4NmP8xw==
X-CSE-MsgGUID: wj//P/3iS6OxMzarQkTy2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="13353828"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="13353828"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 13:59:39 -0700
X-CSE-ConnectionGUID: 9y2N2NWRTqOaJPLO5pac2w==
X-CSE-MsgGUID: CB7qbyXKQxyb0J17g89WaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="64689858"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 13:59:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 13:59:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 13:59:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 13:59:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVdQhpE6FFPssw2iDzotj4x05M22SGCYsJBQD9okjzvMYnBxIC4sZRphA65bY2BxuliXg2DBtqt9Jov6BFYVN/god5uQqUPvZl213FxTSxhar1jadvQ56olUBckroFoR8OPBm/o9Nw7ejVpn0hS4X8oldqhmvzZIArnhawVGvx0ZSt1joLiXIyAXe3TzS8Ghv0Bh0Z617kWR6NoYb2z19YUs5UYebEmJY8k9vA9bhlVtrfx3X437/7nmGV8mqOXCkmoghYIZkd8yArpu+ZtoEO2EBIOuLCghwLgLOJQnYRTNaWP8ur/0dggjhHLt/8OR0S+nKhfOcMnp5ch+KNv2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tuRwm9KVxCqJXPGbD4mhaaUwXr83w15C1P51d9DjyE=;
 b=sgUH/gCVWKe37fDNr16Tqn52GBpbtNh9S4WV6o6ZGlSvHjKm5H3XBp/P37/AryLHn6AkpVBn0DOVgg5M6sshbQDCEOpFGXwkmYZivPOhV/lI7NFfnAwfkwbZ3sJLsAClILd7caLZE0FowR1ShI+GLl19dlRQUdpZb1YMlKDMzvkfs3q1VORo7h120XPrazCNO1K7jLdzrixFzV2CYgD9z5hMwYXwSogcBylEOUh4xRGbwb1mIvCOOxdMiv8mCxNKjV3O3ku0IIobCtHvbt6sSwu/8eHV1T9x978hSydXOsAIwXOT2PN/GguBVSBRjz4/Yz0tZDTRmtOKCVhKxGjUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 20:59:29 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 20:59:27 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: LGCI Ubuntu 24.04 Upgrade Reminder (1 of 3)
Thread-Topic: LGCI Ubuntu 24.04 Upgrade Reminder (1 of 3)
Thread-Index: AQHa/kQqWPfizjUB/02hepi0vubcOw==
Date: Tue, 3 Sep 2024 20:59:27 +0000
Message-ID: <a0320c200ea8b08545ba7d35e5636abba2faf6d4.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|CH3PR11MB8316:EE_
x-ms-office365-filtering-correlation-id: b3a8e473-1f7c-41f7-e1a2-08dccc5b4c9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SUt4OEt2U1Ira0p5dWs5TVB3dDJRTHhFRWpNbkFoU3ZQbno5Q2dVWU5HSjI5?=
 =?utf-8?B?UjVqK0FPNHlyMUNKNzJqN1hRT3hkSG8vNllPelp2VmEzdUVxODI0NkF4UUJj?=
 =?utf-8?B?MDJqUGcrVlFEZUk5Mjl6QW5OQmVjekwweWRLMlp5U2lGdERZL1FPM0lOTm1H?=
 =?utf-8?B?Qy9lV2d6bk5UQk83ZXBkOGhsSnVjYkR2a2h1dE1VMk94b1U0Qy8yZ1p5QU1t?=
 =?utf-8?B?T29zRTVLM2YyZno5amhsUmlFbFk4Z0d0Q3RtMWlSd1IvRDJUZDIrMDNyaXp6?=
 =?utf-8?B?djRDVktwbGlDVWk4bCtEVzdOQmdLVjF0RTV4UUFBWndLRDJzdFFlY0dYMk15?=
 =?utf-8?B?dm43eXJ0c3ZsUmdGcEN3OTkrWnlDOGdmYlozanFrb1hYRUNXb1d0ckhyV05G?=
 =?utf-8?B?WXJNVis1dlRxSUxHMGlFU2hXZXV1UWZzY0RQOGhLQ1pDVWpHL1p1NzlqdHJa?=
 =?utf-8?B?MVBOaktQS05pV1cvd2UrMXkyeExtNGxybkhEUGNpWmpzMkMvZldWS2YzdnUx?=
 =?utf-8?B?aVBtcUZwam4rNkFhQTVUWHp2NDRyV2l0OU9wVis3di8waFdkWW8zcXBuODMz?=
 =?utf-8?B?SjNtZUtRQzZKZnQwR3J3THRiTCtTV0Z3OUJIVnJJVE1DakRNa245NUR6QzRD?=
 =?utf-8?B?T2MzT2U5OXVMWU9OQ2NtM1ptNlVyQTlyVFhQV0liZnlhcm0wcEo4aDZqa2l2?=
 =?utf-8?B?WTZPNmdxZU54WkJoYVJ0KzR1cWpWOEw3b2szWjdXWkdoblpwQzFUTnc5YTYz?=
 =?utf-8?B?dEw3MExTNWVLUDV3ejlabzNlc3djN1d6dldycm1SbUpMZTJIRlVydlVjY1hI?=
 =?utf-8?B?VG9yMUlPblhkYnFneHpTRnpJQ25IWkRFaHJIN3BpdWIrdWhiMmlpSDR6Zk0v?=
 =?utf-8?B?L1RoclhrWnZBSG5Cc2F4ZzJXVXVNYUU1T1BLQy9icG9yOTZlZXRERnRlK0gz?=
 =?utf-8?B?cWdHTmI1MWUzTHUwYXpkSTlhS3pUa3BwZUFwU1IrV3M4ZHBPWDNaKy9XL1Iw?=
 =?utf-8?B?SjVvaUlabkttMEZQT1hRUmM2NDRBc3VHcC82dDRkTHZZVytnbXFLeThiM05n?=
 =?utf-8?B?NldGYTlkOXgralNSS0wvTEZYZHZSMjAveEV5NERadFlMYk9Oc29PSjlVNjZ6?=
 =?utf-8?B?TTRUNGtZdE00VmRpRWJWQWFrbVg5Nml0THY3cktlZjd1YitIV0NqZTJIOW9m?=
 =?utf-8?B?WnZ6VE1tMHFtdjI1VGFqcytTMWZiTUUzNXc1Mi9PL2N3M1ViU1lDTFhTRFhS?=
 =?utf-8?B?S0orWEpxenY4dUM4eExWSERCSzVZdm5hTnMyK1l3VGJCR3c5TktzN1hSUVZh?=
 =?utf-8?B?a1Q1WjBIVmxnVmRyQm01cVlDdTRpSGpnUlF6d3dpSG90YTVPcHRDSldoWmN0?=
 =?utf-8?B?M2NiUForOUMyZ0JyUU5Sekp6am9XWHJkK3ZpY28vQ0dRY1pRUkRyNTE2SVgz?=
 =?utf-8?B?YTNwNkc2Nmlud0xraGJVOWxQR1FsNUtlMnZ1K1BHc2dMbzdhNVlWNFlEMGJS?=
 =?utf-8?B?M3ZqcjFuYWN2a2FSUEdrV0J6WHVUL0VnbGRadDhFVDVhL21BVm5tUnVuMUN2?=
 =?utf-8?B?eFQ2cjhEazV0VHBDTGdqWm9CNHdhVDBXQTJsMm5ubTU1UWV5RVZhNi9JREpM?=
 =?utf-8?B?TFk4ZWNnaHFBYVUyQXFkUmxvQXcrb0JZTmZoNXcvTjE0c1BuUzRzWCtSQnVz?=
 =?utf-8?B?QnAzTlk2bTlrMUdmVEJWNnYvVWxOWm5GaUdtUlp3ODhUY3UwVVJXM2RPRDhW?=
 =?utf-8?B?ejYvWEI5VXhlNDFVaDVZOEd1K3Jtd2hKNHZDLzUyRmNKd2t3V29aeHJRblor?=
 =?utf-8?B?bFd4bDhHRlBoK2JzWTlWTUdEUVZ4RnhhL1U5MjF0bFB2SlVUdW5lV3NJR0xr?=
 =?utf-8?B?MHp1SUFPNlZtRndtWHUzVy9GS2NVenJrYzdXaTU0b01EK1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW82VTNPM0o4bHc4VTNacmdjdExOZ3lNWkgwSFQ4eDVrblU1cVJBWkczV1h5?=
 =?utf-8?B?dk1EN0IxQkxvUi95ek40NWp5ZHBPZUxXMVpDOHFSRTNhK05YZWlqeW45U2VB?=
 =?utf-8?B?QjNwUkpkS0hRZUIwR01Wek1FSXhtLzk1Y1MzNWY0QW5SRnVhVlJyb29DRWVR?=
 =?utf-8?B?dTFmSk80MVBJdW9ueDZSQllXUFVGS0pxSmVldUJzSFEzcVIwZ2RFK3NIekVq?=
 =?utf-8?B?TkJnWjV5cGt2TFFyN3BmanR2V1E4Y0ZwZDRtUjdqNTVMZnRIZ09XQ0llZjhX?=
 =?utf-8?B?UlBFMzRHeTRGMEpLNllMRUpYNVdCYlJtL3J0VW5pcFNXZzJ2MUoxdEVwTXFh?=
 =?utf-8?B?UHdwczhqMDZCWGpkWkhHTUJFOUN4NmNVMHY2Tm1XQ1VqZWQ0WDlEUlRTODlv?=
 =?utf-8?B?L1VQdnFOUm1aT29KRVBjSGhrS3B1cG9DUzV1QnY4akNLZWhHQmNRN1JKTElJ?=
 =?utf-8?B?aVp2R0cwWlhQUW8ycmx2Wi9QRjU3cVVDcWx5MUxEZXpXNlR0emMyeTZHNnpG?=
 =?utf-8?B?cVdHNUVYaHJPTHRkajhiYjFLei9rdkpnMnp5Vk83Y2twU2hkUlg1dEF6SzMy?=
 =?utf-8?B?ejZFZ2FPSmJtUElQUWlvMjhPVDVud05PRnl3TzVKOWJmbDNJeE43dkNCWC92?=
 =?utf-8?B?N29CdzRlcFRYRVY3b044SDUybmpkT0diSUNNRERRODFsUW9TZmpxQXF2U3Iw?=
 =?utf-8?B?b0Q4elZ0NjBmSlJOcDRkWUEwNkV4UWtLK0ZXSGl6UW10WFRqZnFMOWxvT05C?=
 =?utf-8?B?Y09sVGo5RXFQOXNOSzM0NGMzR2NPL3ZEczdJU1hqdU1qVDlHVDRralBMSnJo?=
 =?utf-8?B?OXc1QjZaUy9KTFZvMWRoR1VDODMwdmZhMThRY3BlUjJFOGN2T0NwVjBuVnp6?=
 =?utf-8?B?UGtRT2tES1lCY1VvZFNsbGxzeVRFdGN3N0ErbktDSi9BcXBENmd1NVlBNVN2?=
 =?utf-8?B?dG04SndHc21wTVFhVm9rdVFXSHNUVGkvMG9tZFdGVUJBenFnRmZYL203L2pF?=
 =?utf-8?B?Zmt6VWQ1dktQeFFjQnZ4T0laeW1ra2N3YmdEUmwrcFIvK3MyczBwNzhHd0pj?=
 =?utf-8?B?NkpyQ0RkdTNJbmFWeFhRSjVMdkQ0dTM4U2daUkNJYkxJc3JCbXNxZENZb2Mw?=
 =?utf-8?B?aHFQZzhzS3RYU1RlVzZLejhxSVFIV2g1N2ZJTURzbHJ6bGtmblY2YzhwK3NL?=
 =?utf-8?B?QmVURkRWMjV1bGhuTTRqbHZ3QWFTY0VHeHlET0pGRVIzR0R5Smh5blQ4QkhV?=
 =?utf-8?B?MkFXVktrNG9vRDVkcERYejlwZzhvRFlzOGRYQVB6UGJzT2JmUHcrRDhoZU0w?=
 =?utf-8?B?RnY5Q0RoOEpnbTFIUTlxakRiRjRGZ09oRm1mVE91UFRBWU5lalFYSU1panZF?=
 =?utf-8?B?WEU0d0srR2J2bHNhdmR0Q0NWTHZQVDlYZUFjT2pncmFQZEozVVM1V3FHM05L?=
 =?utf-8?B?SHYrL2hBdnVOZWxKUFlpSWRGSzFFWncwNWMyeHo4bHRsSjM1V0dwZS8ySXdw?=
 =?utf-8?B?cXM4WVBrVEFhbkJrTS9UOEdTR1FERVpoOVc3Mm83d2g4aFZ6RWsyWUxtSlVQ?=
 =?utf-8?B?TC9LWWtEc01zZ0dYOEZPRFFEbUVpVXlKNDYrQVcvZFZDUCsrY1dmaVMxeFZ2?=
 =?utf-8?B?TDF4SEQya3Z3dFhLZ1VQTFl6dUZ0aFN5VE5wZm5ZZ3F1dy9SMnQvRVdra3Fr?=
 =?utf-8?B?MHZuM2grZW9lL09WNStmRVZrS2ozSlN1ckVBWFVVS2RsWG1JMGFhRjJ2ZVk0?=
 =?utf-8?B?M3F1Z2R3c3dvY21CSkc1SzRnNjRTaldGRHJJSjRvZ2RrNDJZUHFoQ3ZYU1NU?=
 =?utf-8?B?L3FjbHZldklLemJxL1hnT3lnYWViQnFPckFISDZGNWJFNjNPZTNRNyt4b3FT?=
 =?utf-8?B?REtWMkJUTTBDVEhuRUZrZXJ6cy9CcEtCWUVjVDJqR1dsV1AydnJaQVM5UmtY?=
 =?utf-8?B?UGd6UDZBajJML1V0Yzl4YTNOU3l0c2FwVXUxelVvSjE5UHcrQ3hkRmFid0Y5?=
 =?utf-8?B?RjFnckRHaUdVZzI1Y0ZnVWZydGdqdEZwT2g5eHBESHJHRGFZSXdJRkZRazNG?=
 =?utf-8?B?WTZQZFpkbGFWUmdpcURscUpXMThtbENodkI3RUV0V1pxc0RBamJsK3VMNU5G?=
 =?utf-8?B?ZDYvWFlSR3paZmhzR25OZzY5c2lQcEtRNGlYdXNhZ25sTit4TjdjK1ZXd0RW?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC0F744D817B3B45B8F13EB65132C46E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a8e473-1f7c-41f7-e1a2-08dccc5b4c9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 20:59:27.8937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zqjsUCl8IkDld+D4oopuVLkQWQUEajS0UMArkkklctZ24t2MLAs8aZnw52oNwj8qchG5a/bYFzVlvIO+b0RskQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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

SGV5IGV2ZXJ5b25lLA0KDQpUaGlzIGlzIGEgcmVtaW5kZXIgdGhhdCB0aGUgTEdDSSB0ZWFtIGlz
IGdvaW5nIHRvIHVwZ3JhZGUgYWxsIERVVHMsDQpzZXJ2aWNlcyBhbmQgZXZlcnl0aGluZyBvdXIg
a2luZ2RvbSB0b3VjaGVzIHRvIFVidW50dSAyNC4wNCBpbiAzIHdlZWtzLA0Kb24gMjMuMDkuMjAy
NC4gV2UgaGF2ZSBub3QgcmVjZWl2ZWQgYW55IGNoYW5nZS9kb3dubG9hZCByZXF1ZXN0cywgc28N
Cmxvb2tzIGxpa2Ugd2UgYXJlIGNsZWFyIHRvIG51a2UgYWxsIGRhdGEgb24gYWxsIERVVHMuIElm
IHlvdSBzdGlsbCB3YW50DQp0byBncmFiL3JlcXVlc3Qgc29tZXRoaW5nLCB0aGlzIHdlZWsgaXMg
dGhlIHRpbWUgdG8gZG8gc28uDQoNCldlIGhhdmUgcmVjZWl2ZWQgYSBmZXcgcXVlc3Rpb25zIGFu
ZCB3b3VsZCBsaWtlIHRvIGNsYXJpZnkgb25lIHRoaW5nOg0KVGhlIGVudGlyZSBzeXN0ZW0gaXMg
Z2V0dGluZyB3aXBlZCBhbmQgdXBncmFkZWQgdG8gVWJ1bnR1IFNlcnZlciwgbm90DQpEZXNrdG9w
LiBJbiBwcmFjdGljZSwgdGhlIERVVCBjb25maWd1cmF0aW9uIHNjcmlwdHMgc3RyaXBwZWQgZG93
biB0aGUNCmRlc2t0b3AgYml0cywgc28gd2UncmUganVzdCBza2lwcGluZyBtb3N0IG9mIHRoYXQg
YW5kIGluc3RhbGxpbmcgdGhlDQpzZXJ2ZXIgdmFyaWFudCByaWdodCBhd2F5LiBPdXIgc3lzdGVt
IGlzIG5vdCByZWFsbHkgdGVzdGluZyBhbnkgM0Qgb3INCm1lZGlhIGJpdHMgZm9yIHRoaXMgdG8g
bWF0dGVyIC0gYW5kIGlmIHdlIGhhdmUgdG8sIG1ha2luZyB0aGUgc2VydmVyDQp2YXJpYW50IGRv
IHdoYXQgd2Ugd2FudCBpcyBzdGlsbCBtdWNoIGVhc2llciB0aGFuIG1ha2luZyB0aGUgZGVza3Rv
cA0KdmFyaWFudCBub3QgZG8gd2hhdCB3ZSBkb24ndCB3YW50IGl0IHRvIGRvLg0KDQpUaGF0J3Mg
aXQsIHNlZSB5b3UgbmV4dCB3ZWVrLg0KUnlzemFyZA0K
