Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1D9CA5FC5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 23:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA9510E1D5;
	Wed, 30 Sep 2026 23:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWRLG36+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A3510E079
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 23:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790812618; x=1822348618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QAKmix05UA6YDnHiERfXp1ecn2/fqdu8n+Jd05Z6jkE=;
 b=IWRLG36+im7o74x6OfDM+gYE7f8ZyAUbSmhEOsTusNwIIor6IAGI6/OJ
 CHZfESvpp84GUx5vw2cIwoqKlJ9iB7SoiJxoeQJ+saZhCTYWAHyQxWCG2
 pofFmQgQQ6I+ys0UBCuRbZ1O5/f+CdGkcuzG3SxkGOMOgbYHz2U2qNlYJ
 o780qhhvB4SYIzfhK7jKrZFSZHb1OgMKn3fZRBEIoWpA0NtV3nVAqGtyh
 P4dEUqJPALHvvp81K5CiVcoi/vO9McuRBiWIxkRyXPAUJc8NNN3WZK9g+
 e6NlrLIvMoYwUdYbYuRH8si4bTMGDkS9+7bYGNzmgXKQqvHcHitIIbqzV A==;
X-CSE-ConnectionGUID: A/98yGR4TLWT10pHg/S6zQ==
X-CSE-MsgGUID: sRg20avYQECC79A4Cp9i7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91579014"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="91579014"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 16:56:55 -0700
X-CSE-ConnectionGUID: rzNIBMHPSWGArTOLl4RxqQ==
X-CSE-MsgGUID: OX4ClexBTpO/Hgn0Kpwnaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="273930288"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 16:56:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 16:56:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 16:56:54 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 16:56:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7WWulFy2BwWA1r5FvqKrcWDpPappLIxhNGPnvLKUFCvVpZrrFUnb1OHJT28iK0e1cIUfkZqTKsGu+hDIhQlBoYheVvx3X8JdGL58O2Do7dQvkZSSeQL62nDqsSgsspmfE9/GrqW+xw7HyCx7R6nXSSEmIPJ4ca2RfjmZBvCKcSDHfg2wfdXWJysNFFfokkJCa68ef0rpNrX1vufYJHRv6xaW4w+ehhBzuouqwNjQLM8gKW2mf82gx1ayidqdYFP7qnpqpY7QmmIgUnVCn9JGmuiFSI+C8ZQUwyBLJ3fqIi4BUrtqMx+f1VQQoBUEgzadLsvJNTRD2TbvPeaHduKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAKmix05UA6YDnHiERfXp1ecn2/fqdu8n+Jd05Z6jkE=;
 b=nA6NthU1H+NmkaDiBy66+8phriR8tD/jjh6Pc52UxsYNKSaSXRD2rQDxqQNB+Ay3mXf76dUEqUqg5wv/DJ2fVVR3StUTuPPbHRjyvywoRLr9rtuICrMhTL7IAwWBbqsifOVWLJmsMzZz3Ek4UMgoMZqF9ZNCsGFv7pVMuJsgbRxWQzmbCfqFkr54S2v7MyVXXO7Z/XR9/uXpfRQ4f9oo3H3T/XMSJLqM3XJ+5y15opFFjauR5IHc0uWXfxJeRiLVf/zNI1R1AJDu3wkAejFRbhHZ+qX9EZmL1L3Q8sgGFNzjJbGIQfulf4CtrNtVyitbzeWEeE5yRotWXcLvOaxDrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by IA3PR11MB9228.namprd11.prod.outlook.com (2603:10b6:208:57a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 23:56:49 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 23:56:49 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Filipchuk,
 Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH i-g-t 1/1] intel-ci: remove pxp from NVL blocklist
Thread-Topic: [PATCH i-g-t 1/1] intel-ci: remove pxp from NVL blocklist
Thread-Index: AQHdUEMLysHCtpXlOk2WCxt0eyRo4bbm2qIAgADzjQA=
Date: Wed, 30 Sep 2026 23:56:49 +0000
Message-ID: <310d9cd60c0198a1c23d6815f2ec31a4ec12bc27.camel@intel.com>
References: <20260929184745.2208854-2-alan.previn.teres.alexis@intel.com>
 <20260930092506.s63zyy7lvgq64o6f@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260930092506.s63zyy7lvgq64o6f@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|IA3PR11MB9228:EE_
x-ms-office365-filtering-correlation-id: 8d469264-3bd6-420a-898f-08df1f4e7e58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: Ocy0SJM1/8OojdtFJFSa9ZEvjvzRHr5khCcGbQVzRrlsU0Q6Bq0FW+b61UE1pfsPWUzoqADbI6Bw+jhQALq5K42o2tOCoqe195b3+0IycPTO3ITB86Oby+Nc1XdC8fzSL1UFGKbxMCYM0cQSaBhdRqVWXujj/EzXXCfgUOtY+w8nAVnF43h3AWbyPWE/7rhmnPBMWDD/FdrxA0et+xzwGeAhpU1PFhr0DpkpbrtY05PH9fvs1XCw8v/7NWM6wDQBJXqkDzh2i52OEL0R2tj6/+iXfylpsQh35KC2yr7dI4XoJHzkXxwhIRnSRehBMk+KWG6ib9ocS2vtzxp+JkwYOQLF66usu/27Mm724BIH0CbJdo0+keVF8Vde4PtfBvUllG17b4JRGh2y4iNYtO9yokDAj+rSTSHSBknEGhh7pogmdqVMYSkLoft8FOvC3NFJOUadS0WTG9+ueQ5mDEROhtwJHALqfNR1orRi/WYQ8Nnav23amzUGXEKHmAcN0bgffAXJ4XZ2aA+qSB3kF9BUIojlD4Ds9NrZ2U8XwTUbY6vDItc1PMAcTUEVDYZ50bczzEqUfrLaF/9CGOGVC/qAYb4g4UnrGQG+gNOteguPwll8xQCacW/Uz2KPnTX4jupp4RbptSMKjiu7JRKZN0gbkUB/DDLx10sLqP3eLuNspsE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3lUb2w0TGV4eW5kT1VoZ2hjdHgrS0dxV1BQUlhUaU1hNzBlSFRCeHFzczA4?=
 =?utf-8?B?YWJhai9oV0VEckZVVVU1UkJNTlVudWh0Uk1CUUpjUUI5NXVjWk52NlJLS2Fj?=
 =?utf-8?B?cExsOEFSNjMrcmtJdVBjNXRGN0FwQ2gwTlBOa0JnRW1KZzB4Sy9ZaWdYYXJk?=
 =?utf-8?B?bURjUlFOQXFYbzZLSzZTak0zSEFRVWJNRzZJOHN6UWpQV3gwSVY5Z0txZGFo?=
 =?utf-8?B?aHlOeklkbmNzNllSWDBnNlY2S1BFaWJlUE5RSUorT09lM1pXbFU3WlVNS0I5?=
 =?utf-8?B?eENuUFo1WHVwaFBiL3dXMzc2d252WmhDekN6QnVoMmZmUWpSYnhJaFBBbXRl?=
 =?utf-8?B?cnB2RUlMcHg0YUFsY3ppMWFGV2YxUjNPRTFpaGRMQytYdHliOFIxNlpmZ1hL?=
 =?utf-8?B?NTVIMTB2VlpNaU12SkhaYi93cDZ4bDB4UDlnSm9uck5jTnJDZWpubnZ5UEZn?=
 =?utf-8?B?d2creWpzUFJWeFdhQ1ZZRHBIdDBGd0RoNG04bjUzMHZtTHFnamF3eDFnVVFB?=
 =?utf-8?B?enlOcVcvVDJtbDFYSVkwQ3RTdEc5QUhYYisvbDBEUHlYcFB6TGI1WE5MeGhz?=
 =?utf-8?B?a0tsbkp2Q1B5eS9sa0RTQzRTUXpIcGVONHEwU1JwVjU3QTZnQldOR1JNNnda?=
 =?utf-8?B?MVhEYWtqdWFhVnZKQTVDRXp0Sm9BbjZEZTlsSVFNMmx5SjduRjFGV0xNbUk3?=
 =?utf-8?B?MWpFVnJBU2dubkYyT21GeUYyWmlmeWcrS1EzQW5NMGFDdnI5Q1pUajJkdGZ1?=
 =?utf-8?B?bnN2UmszSzYvRGhQbnZIeUdWcDBvZDBoRlk3Ri9uc0h2QmpGYVhCbWtjTUIv?=
 =?utf-8?B?cEQ1MEYwSjd2bnBWL3dNTWlmZ2xtRzREVUxocnREK2FYL0ZqU0dHOTRaVlVu?=
 =?utf-8?B?VmVscVh2SWpNRzFMbDRIZWpmc2xvV0l3UTY3SHNTVmhYTFJFazN2YzlOZ0xt?=
 =?utf-8?B?VlFCQ2NnRU50K3c0N3RSYjYwd0NhR0NoVlkwVGRPVkEvWDZsTjVBNmhsWXlr?=
 =?utf-8?B?bEEraWpKUjVaMC9zdC9oKzhFeWxPbHNIbmVrMXoyV0lBeWRXQStqaU0wMG1l?=
 =?utf-8?B?clFmeDVaTVQ1UEFHZ3liZWRueUJzS05zemRubkx1TU9Kd0tpUTFJSU1qa1hG?=
 =?utf-8?B?Q0gyZ0dwcjJuajU2WjFqV3g4dkxWM0orWDBRVFZYa29NT2lZRldrZmdpZHdI?=
 =?utf-8?B?dThzc2hZdzJnT3U5VjBDUVFTQW9USGVyYk4yTkg4d1RrblNzL2kwTFY5cFlo?=
 =?utf-8?B?dnpMWnpjRkE0amFDNGVSdzZ4bFZxRmlpOFJkZkovZy9OVUttak9iY08xTzJ6?=
 =?utf-8?B?Y2RFL08yd3R2TlRmZ3VJeEdxN0VGYUJFZGNtQjE2UDZyRm5obGRkeGVRSkJH?=
 =?utf-8?B?ZTVXY2RCMmNpVE9JQ0Y0N3MzWnlVTmZwaFVvSEhud1JjU2FZa1ZsdkhaNjNa?=
 =?utf-8?B?UlIvZnlqbHRZN2NNQjR2aDBIVmU1OWZ3MkQ3dmZtbjJRc28wbjRTRkRQSmt1?=
 =?utf-8?B?RUNocVhRRVR0cHlwVGFHY1VibE95V2dYRDQzNGpqSDgyNjlReENadHpLNytB?=
 =?utf-8?B?eTJkMSs1QnZ6S1FHRXUxUjVPbkUraElmRWZPaUpURWlIWkk2a25JSjlBSmNz?=
 =?utf-8?B?SDZvNHVWMDd3STVSVlBqUUxzcjZ0U3dxYTNKVDdxQy9KNjV2MGJCYlA1QWJX?=
 =?utf-8?B?NHZGK1NVbVJLSkZlcVlBK3g4aUNvcW5sMWFCVUlSTmRPQmp6WHJDSDRGOGhh?=
 =?utf-8?B?d1Exdm9Wbi9DS2h3dFp3bkphYkNPWUNCemlXeVhkOHVWWVprU2lkVTBUNnNV?=
 =?utf-8?B?Y0tDaWh5V2pUbENXMHNnWUJId2dwbjllWXh2TWFRdzloVEtQZE4vbFdjZzRF?=
 =?utf-8?B?dlhqZkdnY3lXUHNvaXZPK0ZTNjdqVzhjV3NYRGhPMHQrdlJSRDdITE9tcUhU?=
 =?utf-8?B?OHJxN0c3bm4wbjNZTlFZQVBhZEllbW9DTjFjSHFjdUlCRUpQUXJXUEN3RFpE?=
 =?utf-8?B?UVNuZGVMVlFxbnBkZFdVaS9FRXhwK2VlRUpPVVVtR0lsZFdjenlUcTVKTFhI?=
 =?utf-8?B?NGdVT1hRdzlmdS9TL2JKS2Vsd1VCUWNuRkJOK0hyTHFUbEl3WDY2MnNGdkxh?=
 =?utf-8?B?aE1HSHRNY2hPVE1jcUtveE04YldORzhIc1loOGxiOHhpczgxaU03eGFDMnUw?=
 =?utf-8?B?dXVIZUhacTFGNDU2d1JCb1FoV1ZadVEzYW9udTRqbEJqVW1qaVQ2YlJCRnRl?=
 =?utf-8?B?VzFabmFndGtGc1BMc3dXU1lqbVk3NDdnL0NpRGZUWWpsZ1VhdkNKQ3FKUUlF?=
 =?utf-8?B?ZnNyclFpVkduQUdCM3NUM0p5MkpBbjJ2eFdYOVdEcnNvdEhsblVGSzgvZUd3?=
 =?utf-8?Q?FLUyTGVTch1BjupL/exTQN1pMinpsuP18KGWg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E383EF0E808E14B963F0C6F22460D33@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hhzPz3AmWIQkK+1Y7100rrcOcMZFyaH61c2B0sh8Vcd0qnsIw3u3Ns6kSra0h14q+9zVg51b4cGoPsgjp++SJMHfyPq+cDqM9GXv2b1+DgcszoyfEvlqlZo99xdJYP7+6BZxCgV0CSuqKd0vl4Ic1nzFzxxPKXuVSkFW9mG/3Khmu75qQ/XKXiH9xLnfRYXyh4r3Iey9b1xH6L2YOzC4WecPSQq4C9knWr+U1oNKZOe475YTzitL7IrcvSKKoWiKv0qesbEyhmzU1czM5GMOUEob+6h54X7BUKQlw4JXHhasysa5vCcmu494Th31PizA1PjMNye7zvkZUOmh9f+mCA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d469264-3bd6-420a-898f-08df1f4e7e58
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 23:56:49.7279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V5J4YN0EF5gS2Y2Cn33Wt7FhImLYdoCd06cW2xOf6Q1KSi6Vdz2TAs6U9pzST/5k0TpV79Lgjl8WV1UnD+GUjjheOnpMM9+srPWeSgRhlQx1lJfK8T7/FkO7s2M9xiQb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9228
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

DQoNCk9uIFdlZCwgMjAyNi0wOS0zMCBhdCAxMToyNSArMDIwMCwgS2FtaWwgS29uaWVjem55IHdy
b3RlOg0KPiBIaSBBbGFuLA0KPiBPbiAyMDI2LTA5LTI5IGF0IDExOjQ3OjQ1IC0wNzAwLCBBbGFu
IFByZXZpbiB3cm90ZToNCj4gPiBXZSBwbGFuIHRvIGFkZGVkIEdTQyBGVyB3aXRoIFBYUCBzdXBw
b3J0IGZvciBOVkwtUyBub3cuDQo+ID4gSG93ZXZlciwgaXQgd2FzIHN0aWxsIGluIHRoZSBibG9j
ayBsaXN0IHNvIGxldCdzIHJlbW92ZSB0aGlzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEFs
YW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiANCj4gQWNr
ZWQtYnk6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4N
Cj4gDQo+IEJlZm9yZSBtZXJnZSBwbGVhc2Ugd2FpdCBmb3IgZnVsbCBYZSByZXN1bHRzIGFuZCBy
ZXBseSB0byBDSSBmYWlscywNCj4gaWYgYW55Lg0KPiANCg0KVGhhbmtzIEthbWlsLiBCZWNhdXNl
IHRoaXMgaXMgbnZsLCB3ZSBoYXZlIHRvIGdvIHRvIHRoZSBvdGhlciBVUkwgZm9yIHJlc3VsdHM6
DQpodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RfOTExNi9maWxl
bGlzdC5odG1sDQpJIGxvb2tlZCBhdCByYXcgcmVzdWx0LWpzb25zIGZvciBOVkwtUyBvbmx5IChh
cyBwZXIgdGhpcyBwYXRjaCkuLi4NCmFuZCBweHAgdGVzdHMgYXJlIHBhc3NpbmcuDQoNCkhvd2V2
ZXIgd2UgaGF2ZSBhIGNoaWNrZW4gYW5kIGVnZyBwcm9ibGVtIGhlcmU6DQpUaGVyZSBpcyBhIHNl
cGFyYXRlIHhlLWttZCBzZXJpZXMgaGVyZSB0byBhZGQgUFhQIHN1cHBvcnQgaW50byBOVkwtUzoN
Cmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTc0ODM3LyAtIHRoYXQg
anVzdCBnb3QgbWVyZ2VkIGludG8gZHJtLXhlLW5leHQuDQoNCkkgYmVsaWV2ZSB0aGUgYWJvdmUg
aWd0IHJlc3VsdHMgd2VyZSBvbmx5IGdvaW5nIHRocnUgdGhlIG5lZ2F0aXZlLXB4cC1zdWJ0ZXN0
cy4NCkkgd2lsbCB0cnkgdG8ga2ljayBhbm90aGVyIHRlc3Qgb2YgdGhpcyBwYXRjaCB0byBlbnN1
cmUgaXRzIHBhc3Npbmcgd2l0aCByYXcganNvbg0KaG9waW5nIGZvciBmdWxsIHB4cCBzdWJ0ZXN0
cyBsb2dzLg0KDQpOT1RFOiBhYm92ZSBmbG93IGlzIG5vIGRpZmZlcmVudCBmcm9tIFBUTCBiZWZv
cmUgd2hlcmUgd2UgYWRkZWQgc3VwcG9ydCBpbiB0aGUgS01EDQpmaXJzdCBhbmQgdGhlbiB1bmxv
Y2tlZCBweHAgZnJvbSB0aGUgYmxvY2tsaXN0IGFmdGVyIHRoYXQuIFRoYXQgd2FzIG15IGludGVu
dGlvbi4NCg0KSG9wZWZ1bGx5IGknbGwgc2VlIHJlcnVuIHdpdGggYWxsIHRoZSBzdWJzdGVzdHMg
cnVubmluZyBzdWNjZXNzZnVsbHkuDQooanVzdCBsaWtlIGhvdyBpdHMgcmVwb3J0ZWQgdG9kYXkg
Zm9yIFBUTCBvbiB0aGlzIHBhdGNoIHJlc3VsdHM6DQpodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xNTkyMy9zaGFyZHMtYWxsLmh0bWw/dGVzdGZpbHRlcj1w
eHApDQoNCnRoYW5rcyBhZ2Fpbi4NCg0KDQo=
