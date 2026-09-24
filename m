Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818D1C9830E
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 18:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2726F10F717;
	Thu, 24 Sep 2026 18:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9PoMFLZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5445910E565
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 18:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790275214; x=1821811214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zvmF3e0QNgHu54hq0JDbliJaG0nk7lbPx9zezaljZMo=;
 b=Q9PoMFLZADKVS1C/EBoSaZootnTMHPfzibCd5jZ6mRxU3Zj6oNL0MG5e
 nQWcl5X1r/3LUDw1DzOFZgF+Uy/Jrbn7haktK0AM6J5neCw/8xX46i+e5
 Lx+WbsatO0E0i9tClFfpGmjBaMH5+vLJWne5znefyrK4KTZ4j5DWHs+d2
 +HyQ5fdZ3ymnepb9U7jxpYfxLRLKlR149HBiWGWVSJT9/iOOOB+I/qGrR
 1Z82lITJmwyvKCgDCoxPWNIGtlVMWtOSLfySfyPmKWtR7ziR5LOlSnaxI
 WCUd4a/1qf2kkRgk5kt+dx5XPfa7QDr+b/p5JcTBe805qY1k44N8KmbLR g==;
X-CSE-ConnectionGUID: FmQcivq1S+yBpy7iPvg8Dw==
X-CSE-MsgGUID: zqkQx+PpTCu6YzpZ95e0DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89967802"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="89967802"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 11:40:14 -0700
X-CSE-ConnectionGUID: PQ2q7FZ5Q5+F1R/7ZCa5sA==
X-CSE-MsgGUID: LeJouW2bQhWg5MV7bm8N0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="282191043"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 11:40:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 11:40:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 11:40:13 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 11:40:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJh0Ah69aGCfWBuw5rWrFQtsyA04n2AyR+j7BZBQ9ST0U2kKExbOnJytTHdATDKwYdzINztlIwRGV7DvXLvspVdz7kR2fQR7KHLtmFo4k/eDhq6NB5XgRCeAq553kxYAbvtgfZ7k8sSgxlcUNeFJTdfD0i9/v4pWPjyzxWq9B7PHzj++xY5MUH89UYzSalm79wmYrPmZL0fQBtNvXZKIwSmksPxs/vw4l47U02YHxOTVPan8Spft3RFJmXOr5L5Ce1ofE8PNn0BG0RaQSNkfBLdo+uvr3s7zZi9H8im/vj40tOEXab+n6bFP52DHOEK34RgwIZ3/gnZWbvjkka4f8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvmF3e0QNgHu54hq0JDbliJaG0nk7lbPx9zezaljZMo=;
 b=RfMdAGMGpLgIHevcE6Gc5Xzh83x4RjQiekMZn0A0m/GaxyyBwlpotZ+Ca6mU4FNteawziQg85KPTO8QAvxxNJBl13FRqZbLXOPiW1efXtt2IcdEliZXIGVgzaDC9yiBXJJRRgQ+4YZwT0JBKIprIFdWSjrv/cIuLIBC3HY+5a8WsRI6b3UcUEZ6mLPDNuz70E+eX14Z0qmIU55C1X83smsfyCPR1RdY9SLHAENP3Iz2E21tJSMSrDLd8TPZQz4qWSbk0i+eBCIyiir68om8wBL3cRW7HL0RpYKdCtP/xMz84Aa4dd2Rx4yk1cb41AQ3FSZEFvOUkOEQ+5VeR5d6Gww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Thu, 24 Sep
 2026 18:40:03 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 18:40:01 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Patil, Shivtej Eknath"
 <shivtej.eknath.patil@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>, "Balasubramanyam, Smitha"
 <smitha.balasubramanyam@intel.com>
Subject: RE: [PATCH v3] intel-ci: blocklist multi-queue tests on BMG, LNL, PTL
 and WCL
Thread-Topic: [PATCH v3] intel-ci: blocklist multi-queue tests on BMG, LNL,
 PTL and WCL
Thread-Index: AQHdS2IAJSspaj0wL0ympX/myWUlFbbeD9qQ
Date: Thu, 24 Sep 2026 18:40:01 +0000
Message-ID: <IA3PR11MB9013E34AD5C91BF9CF8D4FCC85812@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20260923045308.13972-1-shivtej.eknath.patil@intel.com>
 <20260923134641.vaayj4jhcjlz7byk@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260923134641.vaayj4jhcjlz7byk@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|PH7PR11MB8598:EE_
x-ms-office365-filtering-correlation-id: 4f833d3f-2d6c-4fc7-b4f1-08df1a6b3ddc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|38070700021|56012099006|11063799006|10067099003|4143699003;
x-microsoft-antispam-message-info: Cpyu8yXB61fPXEn9HFL7RWyMQW2jyswcEheOZXB+jZD55/3xglcQ3OFs5OERQCF3C4TD4uuAOrn3uAvnuwYy/jQMiClbP8151Jq7pKpf3d6CP6rqfp2y8nCIlD4WZ+TNtoedvc8KwAvwJj1oEMkM6lqcJJRPZwJLu61xh/tIq+GOKQ8LEPzJwUmcsIOVRaWVE1q6MjMxBdSThWGYcQnoVG0ubVmj27MnLufkefIFVdc6F7VxbYm5H6uKiOgldsEJG8vs+y5J2ZSwPyeUG49QqeRroU2tnxOStPoXf3zaCN7GjRGIbbEYV/V/JJ3J2V49hWR8rOHdG44x03Ej8X/58xfk8zdnyE+N1T/aYSeHcMHvepI92U0DXJ/Y35tidrn3LaCkaBU7Lep26B8UcN3Kw1Xrb2QU/9efyJmumCEr5nPwsV54z3zRgi/fmjwv/hAGxGVFXuKj2oplDoekoNlO0kCEPORqintP5IRnCPNRaaoKhx3N1roIXJJW25OmXJHGG+DtSBepGBsKkx9oaxoCOdTepJPRE6qObjY2GjgkBz8GEkN1x2/UNZan0JfB++YyeyFkaqsIwHKNq3qjGkRPqELeeaD2mIaHolczC9WNgVyFORAAxeuwsmF63ww+tKtSwA5rHRm362HjqQOZENOe/NjBWmjrXo+y4VwfbRkpCAgtnEaa6wL5+ZVaHqj68fnYz5M94qbMaVHcrEc9LDqUqYobfDM6UlV7nbnJHeQsa9E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUFhZ2xyUlpPeWtnTGRwNHhyWVpaYldUV0dCTVdwR3FPcTNVc2VJWmF1a1VE?=
 =?utf-8?B?cVRGRlU3TUFpZTlFTmY1L3RVTG9jMTUwRjNvMElaVWZiOW53ZXlWWEtzdWkw?=
 =?utf-8?B?NnJpaWkrNHF1eFYxckFMMnhGUm90UDFPVEJvcGNTU3ZnYTcvV3doZlZ2czls?=
 =?utf-8?B?ZisvR2ZlV1ZzSnlaVkJiZXg0bXZyd09qVU00MElwTExFbWdGUmpPZmgwdmxZ?=
 =?utf-8?B?VElBc2N0dnZnTTNXdXhjQzlDUDdNQUk0dGJ3TXJPQ29QR0w2R0l2RWJLTXh2?=
 =?utf-8?B?S1RLOW1SaEVoZ2pFeVhWeFQ4MWxQb3pXOE03MmdWSytIZVBVQkNLaUk2VkhP?=
 =?utf-8?B?aXQ2QXJhb1ZaTHR6Rm1WV21rZFNCcFNhT0dXRXJHanRBWWtoaTZpbkNaekR2?=
 =?utf-8?B?YmFkcW5OaEpJS21JQ0U5dFlmRmVGTyt6TVZ4dndleGlHZlB2VGRPL1RKU1lJ?=
 =?utf-8?B?alM4ckpjcHV6cHdVU1h3RkpyWUIwdlRGTFhKTkJ2K0NvVW5jUlJkU3JqbUY1?=
 =?utf-8?B?MG9SM3JoT1NyK3Rna1RNU21xMTlIZ09iVjJQdC9HQkpCWTVrZnN0K25FUGUw?=
 =?utf-8?B?cTNERmdLelNYSGpERGJaQVo4eTd3STJGTGxkNk1rOEVNM1JVS0FXTGlnYU14?=
 =?utf-8?B?WEZHT28wRXRRL01nVnRzemcrcnRTeUkrRndGUWhWeXpUMnQvcSsrVndlYlFT?=
 =?utf-8?B?a1lRd2FOSWZBZEwrcGhBWUh4N2YyMng2Szc3aHhqQ3lMY2ZwTnE2UHR6TllW?=
 =?utf-8?B?amhrUlFWZVF1R0Vlb0w3aCtmeUx3cXBEVi8yOFk1bWd6RUpBdE9RUE1aVzVH?=
 =?utf-8?B?YUhnV2xsOWZGaU5EMkV3UnBHS1pJNStETTFjYUpGd1NLMGhPUklwT0VPbGlM?=
 =?utf-8?B?c1NkQmppMjFnUjNTTDhqL20xK0tMMlpkMUJwNkhHc1JUS3lkNS9GRklrK2RX?=
 =?utf-8?B?eFdJV1NTSythaXRLWUpBOEZQRVEvZnBTUUVMTjZIQTM0S2Y4d2NWV0pqZU42?=
 =?utf-8?B?QlQrc0x0V2czOVljWGVXckdGaE1LSzF5Y29VdXk0Njc1czdVUnVZRUJKVWZQ?=
 =?utf-8?B?T0NUYXlBRHBBWmNxeUpLb2h5MTU1bGFER2ZhbFlseHphTkNZMyt4MGVHWXFu?=
 =?utf-8?B?dmpmMnc0V1VNQmFXZDQvU0RVaVV0eDA2cmlmd0lkL2JKUXpLa0xETjNvSGlU?=
 =?utf-8?B?VVZIeUhUNHY5UVhRK2FBMVhIc0NxaDJ5TUtxM0pNWHBQOENBSUxRaHRzRlpO?=
 =?utf-8?B?SVkyTG15WWw0aCtSaXVMUUdtWklpWGVqSlJYZjVTdTNubkV0Nlg0dDkrcFo0?=
 =?utf-8?B?S3h3SDRER0JGRkJYWEM3TTNSYzQxd1FiSmVyYVJ4eWpScWQ5SGIyeitFam9C?=
 =?utf-8?B?bXV5STZoTlZFRFFqa0NpSnB6UmN6RVlNeWdtc0V4NWdsWThsWEJqMm4vU0xi?=
 =?utf-8?B?d282emY5YlVDOUtEU0duRGRIME9qcTJqaWJ5elQ4ekZpbXhsMXlzMkMyT3l5?=
 =?utf-8?B?ZHlMKzFRTHhMZVNabEdNUVI1U3NBMjR4ZFZuSERxRm5iTGdUZ2dkUDZpYmRQ?=
 =?utf-8?B?RW5PVnlSR1lIWEh0T09XcndyMmhzMTNyK2JLa0xBNEtaVVQ0WXBrRld6UUZV?=
 =?utf-8?B?MlpyeG13NmdTWHZFeGQxNGFsQTY4ZTFDU0t3MGZwNDk4V3MxaWxlWkJ0TEVv?=
 =?utf-8?B?STNZUmdFUXVDK2FwZlA3aE10VHo5SVN0M251b0xZZmViZG5hakJCanlBOXBV?=
 =?utf-8?B?cnFVcUdiSUxjV1RLRkNMVGdqNHRFS0FxSTFYUVAya3NZTWw1b3Z5NlNhN2Vl?=
 =?utf-8?B?UXZnam1TZG10b09SbE9GNzd2azJPNktYRjFDdTYrbXF2RnJVM3pybWwzVlhh?=
 =?utf-8?B?aWM5TFhNOHJWRU03K1E2Yzl6SkxwbURYN1lNVFFLSTVoSjNIOEZpQVd4RG5m?=
 =?utf-8?B?dmVEa3E1S0tzbUZEMDE1Sjhpc0kzWEdRZm9leDJyMnVYUWh1Z0JRdUVVT2Fr?=
 =?utf-8?B?QkM0YUNVZ2pXNXVBOG1VT2tvYi9UMVBYWk01QnlLbEJOWEN2MWRVT1IyTzRm?=
 =?utf-8?B?bGZYTjBrTUZaMm9FcEc4dWR6N2VvOVFOVUV5UXRzZnNHQVlGNEMxOVpiRVY1?=
 =?utf-8?B?bkJxVnQrREE1SXp3LzAweTJWVGdNOW9WbHRxdjJuakE0T050cmlaNWlYVmJM?=
 =?utf-8?B?Um14UEU4cnJQOHJlakZhRzFIU1F3aU1XVU5hTHQ2TVEyU09WUTIvci9QclVL?=
 =?utf-8?B?OUg0NWtQWGJiTW0zdmMzUGNaMi9Sck5JTVRwckpvQ2ptdW1pVDdGa3BiUjJv?=
 =?utf-8?B?NHM4OHJMSmRLdmxmOWF4VURtTFFjWk5tMTJLRi9naWNabFdYb1VOdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gerpSeH9aoilx8LCAsp0m3lXzzbAC9srACvyndSygzknUDkK17icb47PWfAzWe++JAJyh1HwfosonZ8OfYZu8twCx09JUCaUB8+guKps3gVbvtM/Cg1W7h2BFK7pPzIv4vUJ29KiOxx6YBmwKED9lEBXy7RRHwPb8asZGzjKgmEcfYgYUYrSIWRG7b+ouCY/IoCU5T3JHWi3cGfu4ACMYCspOo7nneJkMKZ96MyG+2DZoOVFoe8JIWQgAK5MZKIGLBWBrCE2ziF0qcJdIIcEA2VkPLyA1qsRzDXq28XahayMQMi9kknTbV8dA+MQ+d5FC0raedI3GmgSxHiBiJz8kQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f833d3f-2d6c-4fc7-b4f1-08df1a6b3ddc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 18:40:01.0432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iVUtr30vI6h28CmLBIFl9CfxY6UCA/3xt+8oWEKzzLjYTZ5zGGdOuMgluS/8QrVP2uVmUGzVemjxyjfCP1Lfh232wHFN4AYAz8cwL8VBnzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8598
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

DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYW1pbCBLb25pZWN6
bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
U2VwdGVtYmVyIDIzLCAyMDI2IDc6MTcgUE0NCj4gVG86IFBhdGlsLCBTaGl2dGVqIEVrbmF0aCA8
c2hpdnRlai5la25hdGgucGF0aWxAaW50ZWwuY29tPg0KPiBDYzogaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IEtvbmllY3pueSwgS2FtaWwNCj4gPGthbWlsLmtvbmllY3pueUBpbnRlbC5j
b20+OyBTaGFybWEsIE5pc2hpdCA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+Ow0KPiBCYWxhc3Vi
cmFtYW55YW0sIFNtaXRoYSA8c21pdGhhLmJhbGFzdWJyYW1hbnlhbUBpbnRlbC5jb20+OyBHYW5k
aSwNCj4gUmFtYWRldmkgPHJhbWFkZXZpLmdhbmRpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2M10gaW50ZWwtY2k6IGJsb2NrbGlzdCBtdWx0aS1xdWV1ZSB0ZXN0cyBvbiBCTUcs
IExOTCwgUFRMDQo+IGFuZCBXQ0wNCj4gDQo+IEhpIFNoaXZ0ZWosDQo+IE9uIDIwMjYtMDktMjMg
YXQgMDQ6NTM6MDggKzAwMDAsIHNoaXZ0ZWouZWtuYXRoLnBhdGlsQGludGVsLmNvbSB3cm90ZToN
Cj4gPiBGcm9tOiBTaGl2dGVqIFBhdGlsIDxzaGl2dGVqLmVrbmF0aC5wYXRpbEBpbnRlbC5jb20+
DQo+ID4NCj4gPiBUaGUgbXVsdGktcXVldWUgc3VidGVzdHMgcmVxdWlyZSB4ZV9oYXNfbXVsdGlf
cXVldWVfZW5naW5lKGZkKS4NCj4gPiBPbiBCTUcsIExOTCwgUFRMIGFuZCBXQ0wgcGxhdGZvcm1z
IHRoZXNlIHRlc3RzIGFyZSBleHBlY3RlZCB0byBza2lwDQo+ID4gYmVjYXVzZSBtdWx0aS1xdWV1
ZSBlbmdpbmUgc3VwcG9ydCBpcyBub3QgYXZhaWxhYmxlLg0KPiA+DQo+ID4gQWRkIGJsb2NrbGlz
dCBlbnRyaWVzIHRvIHN1cHByZXNzIGV4cGVjdGVkIENJIGZhaWx1cmVzLg0KPiA+DQpbR2FuZGks
IFJhbWFkZXZpXSBwbGVhc2UgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSB0byByZWZsZWN0IHRo
ZSBjaGFuZ2UgbWFkZS4NCj4gDQo+ICtjYyBSYW1hZGV2aSBHYW5kaSA8cmFtYWRldmkuZ2FuZGlA
aW50ZWwuY29tPg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGl2dGVqIFBhdGlsIDxzaGl2dGVq
LmVrbmF0aC5wYXRpbEBpbnRlbC5jb20+DQo+IA0KPiBMR1RNDQo+IEFja2VkLWJ5OiBLYW1pbCBL
b25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBSZWdhcmRz
LA0KPiBLYW1pbA0KPiANCj4gPiAtLS0NCj4gPiAgdGVzdHMvaW50ZWwtY2kveGUuYm1nLmNvcmUu
YmxvY2tsaXN0LnR4dCB8IDEyICsrKysrLS0tLS0tLQ0KPiA+IHRlc3RzL2ludGVsLWNpL3hlLmxu
bC5jb3JlLmJsb2NrbGlzdC50eHQgfCAxMiArKysrKy0tLS0tLS0NCj4gPiB0ZXN0cy9pbnRlbC1j
aS94ZS5wdGwuY29yZS5ibG9ja2xpc3QudHh0IHwgMTAgKysrKystLS0tLQ0KPiA+ICAzIGZpbGVz
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL3hlLmJtZy5jb3JlLmJsb2NrbGlzdC50eHQNCj4gPiBi
L3Rlc3RzL2ludGVsLWNpL3hlLmJtZy5jb3JlLmJsb2NrbGlzdC50eHQNCj4gPiBpbmRleCBjZDM4
ZDE2ZjguLmY4M2I1NDRjYiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC1jaS94ZS5ibWcu
Y29yZS5ibG9ja2xpc3QudHh0DQo+ID4gKysrIGIvdGVzdHMvaW50ZWwtY2kveGUuYm1nLmNvcmUu
YmxvY2tsaXN0LnR4dA0KPiA+IEBAIC0zOSwxMyArMzksNiBAQCBpZ3RAeGVfY29tcHV0ZUBjY3Mt
bW9kZS1iYXNpYw0KPiA+DQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+ICBpZ3RAeGVfdm1ALipleHBvcnQuKg0K
PiA+DQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIw0KPiA+IC0jIFRlc3RzIG5vdCBhcHBsaWNhYmxlIGZvciB0aGUgcGxh
dGZvcm0NCj4gPiAtDQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+IC1pZ3RAeGVfZXhlY19tdWx0aV9xdWV1ZUAu
Kg0KPiA+IC1pZ3RAeGVfZXZpY3RALiptdWx0aSgtKT9xdWV1ZS4qDQo+ID4gLWlndEAuKkAuKi1t
dWx0aV9xdWV1ZQ0KPiA+IC1pZ3RALipALiptdWx0aS1xdWV1ZS4qDQo+ID4gLQ0KPiAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMNCj4gPiAgIyBFeHBlY3RlZCBza2lwcywgS2VybmVsIHN1cHBvcnQgbm90IGF2YWlsYWJsZQ0K
PiA+DQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIw0KPiA+ICBpZ3RAeGVfZXVkZWJ1Z0AuKg0KPiA+IEBAIC04MCwzICs3
Myw4IEBADQo+ID4gaWd0QHhlX2ZhdWx0X2luamVjdGlvbkBleGVjLXF1ZXVlLWNyZWF0ZS1mYWls
LXhlX3B4cF9leGVjX3F1ZXVlX2FkZA0KPiA+DQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+ICBpZ3RAeGVfcG1A
ZDNob3QtaTJjDQo+ID4NCj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ID4gKyMgRXhwZWN0ZWQgc2tpcCBvbiBCTUcg
ZHVlIHRvIHVuc3VwcG9ydGVkIG11bHRpLXF1ZXVlIGNhcGFiaWxpdHkgIw0KPiA+ICtNdWx0aS1x
dWV1ZSBpcyBub3Qgc3VwcG9ydGVkIG9uIHBsYXRmb3JtcyBvbGRlciB0aGFuIHhlM3ANCj4gPg0K
PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjDQo+ID4gK2lndEAuKm11bHRpLnF1ZXVlLioNCj4gPg0KPiArIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL3hlLmxubC5jb3JlLmJsb2NrbGlzdC50
eHQNCj4gPiBiL3Rlc3RzL2ludGVsLWNpL3hlLmxubC5jb3JlLmJsb2NrbGlzdC50eHQNCj4gPiBp
bmRleCBjODMwYWMzYzguLjg4MTE1ZWMyMiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC1j
aS94ZS5sbmwuY29yZS5ibG9ja2xpc3QudHh0DQo+ID4gKysrIGIvdGVzdHMvaW50ZWwtY2kveGUu
bG5sLmNvcmUuYmxvY2tsaXN0LnR4dA0KPiA+IEBAIC04MSwxMyArODEsNiBAQCBpZ3RAeGVfY29t
cHV0ZUBjY3MtbW9kZS1jb21wdXRlLWtlcm5lbA0KPiA+DQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+ICBpZ3RA
eGVfdm1ALipleHBvcnQuKg0KPiA+DQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+IC0jIFRlc3RzIG5vdCBhcHBs
aWNhYmxlIGZvciB0aGUgcGxhdGZvcm0NCj4gPiAtDQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+IC1pZ3RAeGVf
ZXZpY3RALiptdWx0aXF1ZXVlLioNCj4gPiAtaWd0QHhlX2V4ZWNfbXVsdGlfcXVldWVALioNCj4g
PiAtaWd0QC4qQC4qLW11bHRpX3F1ZXVlDQo+ID4gLWlndEAuKkAuKm11bHRpLXF1ZXVlLioNCj4g
PiAtDQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIw0KPiA+ICAjIEtlcm5lbCBzdXBwb3J0IG5vdCBhdmFpbGFibGUNCj4g
Pg0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMNCj4gPiAgaWd0QHhlX2V1ZGVidWdALioNCj4gPiBAQCAtMTA4LDMgKzEw
MSw4IEBAIGlndEB4ZV9tb2R1bGVfbG9hZEBmb3JjZS1sb2FkDQo+ID4gIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gPiAg
aWd0QHhlX3BtQGQzaG90LWkyYw0KPiA+DQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+ICsjIEV4cGVjdGVkIHNr
aXAgb24gTE5MIGR1ZSB0byB1bnN1cHBvcnRlZCBtdWx0aS1xdWV1ZSBjYXBhYmlsaXR5ICMNCj4g
PiArTXVsdGktcXVldWUgaXMgbm90IHN1cHBvcnRlZCBvbiBwbGF0Zm9ybXMgb2xkZXIgdGhhbiB4
ZTNwDQo+ID4NCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+ICtpZ3RALiptdWx0aS5xdWV1ZS4qDQo+ID4NCj4g
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIw0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS94ZS5wdGwuY29yZS5i
bG9ja2xpc3QudHh0DQo+ID4gYi90ZXN0cy9pbnRlbC1jaS94ZS5wdGwuY29yZS5ibG9ja2xpc3Qu
dHh0DQo+ID4gaW5kZXggMzYyNzExNDA2Li4zNWRlZjZmZmUgMTAwNjQ0DQo+ID4gLS0tIGEvdGVz
dHMvaW50ZWwtY2kveGUucHRsLmNvcmUuYmxvY2tsaXN0LnR4dA0KPiA+ICsrKyBiL3Rlc3RzL2lu
dGVsLWNpL3hlLnB0bC5jb3JlLmJsb2NrbGlzdC50eHQNCj4gPiBAQCAtNjUsMTEgKzY1LDYgQEAg
aWd0QHhlX3BtQGQzaG90LWkyYyAgaWd0QHhlX2NvbXB1dGVAY2NzLQ0KPiBtb2RlLWJhc2ljDQo+
ID4gaWd0QHhlX2NvbXB1dGVAY2NzLW1vZGUtY29tcHV0ZS1rZXJuZWwNCj4gPiAgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMN
Cj4gPiAtIyBUZXN0cyBub3QgYXBwbGljYWJsZSBmb3IgdGhlIHBsYXRmb3JtDQo+ID4gLQ0KPiAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMNCj4gPiAtaWd0QHhlX2V4ZWNfbXVsdGlfcXVldWVALioNCj4gPiAtaWd0QC4qQC4q
bXVsdGktcXVldWUuKg0KPiA+IC0NCj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ID4gICMgRXhwZWN0ZWQgc2tpcHMg
YXMgdGhlIHRlc3RzIGFyZSBub3Qgc3VwcG9ydGVkIG9uIFBUTA0KPiA+DQo+ICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0K
PiA+ICBpZ3RAeGVfYWNjZXNzX2NvdW50ZXJALioNCj4gPiBAQCAtOTEsMyArODYsOCBAQA0KPiA+
IGlndEB4ZV9mYXVsdF9pbmplY3Rpb25AZXhlYy1xdWV1ZS1jcmVhdGUtZmFpbC14ZV9weHBfZXhl
Y19xdWV1ZV9hZGQNCj4gPg0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gPiAgaWd0QC4qc3Vydml2YWJpbGl0eS4q
DQo+ID4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjDQo+ID4gKyMgRXhwZWN0ZWQgc2tpcCBvbiBQVEwvV0NMIGR1ZSB0byB1
bnN1cHBvcnRlZCBtdWx0aS1xdWV1ZSBjYXBhYmlsaXR5DQo+ID4gKyMgTXVsdGktcXVldWUgaXMg
bm90IHN1cHBvcnRlZCBvbiBwbGF0Zm9ybXMgb2xkZXIgdGhhbiB4ZTNwDQo+ID4NCj4gKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIw0KPiA+ICtpZ3RALiptdWx0aS5xdWV1ZS4qDQo+ID4NCj4gKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+IC0t
DQo+ID4gMi40My4wDQo+ID4NCg==
