Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1580FCFA745
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 05:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A56A10E31C;
	Fri,  4 Oct 2024 05:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ab7pB0EH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404E810E1FA
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 05:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728020675; x=1759556675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=Nvh9LCYY8cPzYe72DwBhIPQdrvGQSU/YU6KiRrf+e5g=;
 b=Ab7pB0EH3CDq/9c1pbfGt4mkFaCGzThzj2A8a0UqlEQVzSuPS7UcCeWn
 AxzfoE1yDRqOkBUBNY9bcaGGWppUnNLqLOiEL05c0KjaKC+fZhh7PWjkK
 YHjWkBP1EUHnomp5kcZNLKmKsS4mvlIE87N2z/UpCbAIC+7UWn7G3PCOE
 wsEhHdl4/lBEMXReiAQB4kS7rpbemvFAgMO7aB44ucVV+wuuxB8kTQzfT
 1n4nZFyjKK2FJawCz6dXtTZmcHAn7KNjtvfKolJvIAVUxhsLQdB3fvCcl
 fP4sfOmGG+FQlMeLuYZhSpdWFw20XGBheRtyq+Lkka8ExNYWKRtwJsw1h Q==;
X-CSE-ConnectionGUID: i10YUhmsTdOWxVx+2O7wgQ==
X-CSE-MsgGUID: G814omAyRqKxp8x9PjAj/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26702467"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208,217";a="26702467"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 22:44:34 -0700
X-CSE-ConnectionGUID: xz/kXSAVRWuYaHjyvIxyHw==
X-CSE-MsgGUID: d2GMxIoSSOC0SiDJsaScdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208,217";a="75413287"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 22:44:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 22:44:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 22:44:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 22:44:33 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 22:44:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOw9Rgx0umjVfiKS6lrgbNe88uhrUFL6wXG3NmqeZRtO61bA5PD9MY7/TGbzG5bAi+jPuMfW48ZGkSERIedn5F3c5rRsNrwrmJWkFC5RcGygcWl3RtFmS9oQ+84uN1f3qVU3ni8cNhHJoRrDCDxDtxpy69sZ9PUlNpOtDwN2fLZnB1I2bBjlJiufYt2oE+D6c8htrbmj0rca4fg0Wt4CPpafwi/sWZks1ddPS5UpAoZkBORSRuWejv0smQP+0PR1BhHngVo3JIBcXtCBpfNpoEyFa/A6ERkVKFbfBR4am/GaZxqBdljvybZKzb2jUnu7seGFXdSugo2gfwHDIgKBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+zMyGEhSadirSR5wlsIPfCqCUrDrkNGzS5nXVe4LII=;
 b=bfCAKUqCZ9v7aeL/bPRGmSUfjaTfZs1ogQdRY9V5XgksuHHOMslAZuv/1ubQKsEmFFzo92zz4K2jMCcrJPb7baizZmagEG0vPcqOkIk89EQDfQ9v+UvrrdZwV0R78GAoGYaQRN9s0p4eiaYt3HHsjGelwbp6t5OuzBMXxFzFWKrdW/RzXir63aFJHr7tJmxwRGD+vArXDj1pS0h4uaKdbFU9YyAjMq9RJgmsg64b5D1iCAoCa6hq5NuaYis4kPBLPCu+h4FA0DdjTnXKZRE0idCfpmoIEB+rbDVzv2QWriMmcWajZaZNSwPqOK5BePeU9Wvp7Ocr61FGsDaTBRoSsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SN7PR11MB7540.namprd11.prod.outlook.com (2603:10b6:806:340::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 05:44:30 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 05:44:30 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Topic: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Index: AQHbFNtF8WL1idnY80qJByEWkXMYLbJ2EE9JgAADoYCAAALWUg==
Date: Fri, 4 Oct 2024 05:44:30 +0000
Message-ID: <SN7PR11MB6750A1BADDB0334F62DA5420E3722@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241002145503.910536-1-santhosh.reddy.guddati@intel.com>
 <20241002145503.910536-2-santhosh.reddy.guddati@intel.com>
 <SN7PR11MB675059F459088B309491341EE3722@SN7PR11MB6750.namprd11.prod.outlook.com>
 <SN6PR11MB27045F424115435C60CC64D9DB722@SN6PR11MB2704.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB27045F424115435C60CC64D9DB722@SN6PR11MB2704.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SN7PR11MB7540:EE_
x-ms-office365-filtering-correlation-id: 83ca0897-f20d-4c51-0526-08dce4379dd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?Windows-1252?Q?68rs8PIB9ZIeuSKVSiz65HsKkWk6iVY5KGGLKNVK9VEl09aIAZUjDFbd?=
 =?Windows-1252?Q?k+2612DOP3FD3iXe4O0eZ2ndPvFJVhOyrtXZMkQgdXaEQwFSy8ngyUlp?=
 =?Windows-1252?Q?KPPEh38mj+7n+OnimzsDKBWfBo1wPMMX+Hhf8aKGYnrYBAlN6d4ovGex?=
 =?Windows-1252?Q?Tl9tj9/5xdYpTaQTFmholnFXVD7JFLKJpviKnpbaMdcaZ2fdiPhUZ2n3?=
 =?Windows-1252?Q?0tn9GRJAnMNSa1/5/ReHWJQVHgXHpZwp0YACkRw4P1Hn/SeFK7HPy6JD?=
 =?Windows-1252?Q?hiAguikf3/ruzfM07Zc3setSpIYhxdl5UXNt2uAFIvXPGzFI9MGiP7Oj?=
 =?Windows-1252?Q?vQxFNpR0mdMd3r6uoDdFW7qsuH4rV9+sxEaBxlb1yNv+TIV3Xd7XrnwZ?=
 =?Windows-1252?Q?uTg1g96e7E1OUwdNminFdiyXzqUP0nPVqGwzXQq+Qkk8cbyE6dnsGObC?=
 =?Windows-1252?Q?qLOE7Kn7cKkpz4bPWpujXGvheB1LKuyCYrlprG+K/pDhQxQkqQk9XNGY?=
 =?Windows-1252?Q?JQ47niVAZaIK0Oo4ywpOP9Fff/cizHrgypJKvxpdioam0Hlbtvdilg53?=
 =?Windows-1252?Q?OJpu5FwtzrtekrWB8T47UmPxxGExAAmGfpTcxJtXD75SWtaLHnQ3JRJy?=
 =?Windows-1252?Q?hvJqO/oKcBJQc+UTBgi+i0LXz3xiMexJqYAg5dG2w5XJq3EAQ5hCXr56?=
 =?Windows-1252?Q?xIXZn5YBOXc/rn9wbEM+0fFJ5BdcyLK5cQJuLUeOli2+ira6MnWS354c?=
 =?Windows-1252?Q?Q2wLr8LXT4O3oI+fUIyNvQK5cNdOhjnnl7E+jsMpBpzgj1QDofx10FCz?=
 =?Windows-1252?Q?OwIBz7LmFle73yifdy4nhj2tHj/CIfNUnEB2DoKxeCgy/k4aJKKfbJyf?=
 =?Windows-1252?Q?eTl2mXdUZnSJ0NDXJZcxUd/y6du7Of3vzTFxM+9JN3UiTv0CAbCWO0N9?=
 =?Windows-1252?Q?iS3051u9RMsuvR3X7JQWZGV0MECy85qsulPTHRnBmWnyocu9sGXS9xd8?=
 =?Windows-1252?Q?n/IdgOEF26cct5/WqmyJfzPG8M6CBE9hvfd/bFz1DPTQLh8t9M5zcoHs?=
 =?Windows-1252?Q?lh3EJaLWe6moq6C9IZ1uOHilRJTcp34JliomP6UYy2EwRX4JinH4ArnL?=
 =?Windows-1252?Q?zThWRNeGN2KaQt6rrXK/oEQGoQJxJUImAyZDIkumSjA3QxswIcU8Cr2w?=
 =?Windows-1252?Q?Q28rm2vvs5/2PrNVGc7u2E/l3h3ua1cnRVtIKYb0whGj63iO24vqYobd?=
 =?Windows-1252?Q?BL2YMJN4XG+sUUKwZaNwUIbXbwu2vmZe/qENVCA5C+yCh40VlCgCDggM?=
 =?Windows-1252?Q?V1WSz7CtZRVcndULDA2SoyRiAha36nv4vq7gmkSiJ7KUjsUQ81HVfxaB?=
 =?Windows-1252?Q?Mc+AR/OQJTglUqVP9c0XVhPvrvagqJSuiFIdAJ5/ifqR1OEI1uZEzgHF?=
 =?Windows-1252?Q?nrNaGeLX5eM9FnhQLtmq/Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?mGtqFg2+nRpNruBB4wRJo7toUQNdSdtjp9C1yTAN1WcrbaBkHIlu15Uy?=
 =?Windows-1252?Q?y+GVGpY9HhzFa8bqiE2/glf5pYFHf8Qyh905KKyunHMAuezDs76XMGCv?=
 =?Windows-1252?Q?40XV/KhqScRx8ma7SwhIQanaGDw0WgwRuT+fine6Gzf676Prl3D3ep22?=
 =?Windows-1252?Q?HRWShu6W2OaTOIGwmHnPX/1hfQXSgPNuhe3TbNMSUlfjaQpjR3h3u4/A?=
 =?Windows-1252?Q?GRsVmhlHf9g4qDoy7lO3XHkOW99L+M4kwSPxDS2qsdQ7XW45GzNVQ2KH?=
 =?Windows-1252?Q?ktOsUZGAa6b8dULXyagqvV+TS931+erxCtTV+TzMcG2/wdMCj9RDmm3u?=
 =?Windows-1252?Q?r0FSanVubLAFhgvxVrDGc+VFeOOo14LcdNIyfQucvFVSI13Rtwq7gJhO?=
 =?Windows-1252?Q?RHRs+JjQ8wX8ZTwmbzTfZdanWFluGoK3CKsq1UmZcRg32kZXOnWWQcr+?=
 =?Windows-1252?Q?1sso3CkpD7Wk/i4IjZzmDAHFFy/htEawdDN+LoJbmC+I8dold34f5+Nr?=
 =?Windows-1252?Q?NMIZjOAGzd7TmtJcVF60u3MMUZ763IycizKp7zQFIncvn+E3lFWM7uOY?=
 =?Windows-1252?Q?wgqAdV8/EBPhsaNspfvyXRM2ed6wBaZZ0maBF7Y5ho6sg7PF9Fgw9FcU?=
 =?Windows-1252?Q?PrTRkxriG82uzAnX/yoR0PzoTkFIr2etzQ5xIyyKj+GidENMjDrx7K/Y?=
 =?Windows-1252?Q?6vvATzSIVs0MkFdbigsZyZjIFHY8N9PyH2eQXTkTacECQWf2zarEytJr?=
 =?Windows-1252?Q?YKXvl6ZBkqh+j1juMiulMGul8NJ+HUiermRoHVqcsPJMcQre7FNUGJk9?=
 =?Windows-1252?Q?epdG980tSMl+K+GhTsI7LcEoyZntpgoNCct32/zY+PaDMjDDlYY90cCa?=
 =?Windows-1252?Q?glotem1duLpIWcVp1zc6d4lbVPAKDanXFkq/MYLULjChJaZUKQyzefWz?=
 =?Windows-1252?Q?QoAUS7MqwikLo3UXmvgViwZdVvrxRXVWDS0ZZ9MrXvlas64oMC5Jx86L?=
 =?Windows-1252?Q?Ja1q3BXH2AHO51jehII1Otgd59hL4ZX2LN3sqlpDh+RTt+L8u/DSKTj0?=
 =?Windows-1252?Q?RdZxQubyr0BSTfKIAly8aGz0CjQzegLLM/EivxsWwSLiHWwj59Ybn0Sl?=
 =?Windows-1252?Q?HtG6gp9UsqYkZjg5gom/Rap8gzYAGfKCCjpUuA0wxFGW2JK4VOnJ/wdG?=
 =?Windows-1252?Q?5Ptkf2WWUA2ZmvWCa1vNHwa4hkC4gNMxx846w38nYsBNu42Ikhb2fnN6?=
 =?Windows-1252?Q?I8MDl/aq4NnNg9tc56ZfmMS2sRI/zP/y02Z9o+F0ImejwyU0NxYUHbMS?=
 =?Windows-1252?Q?VpJldIw4uCCU7gytqLQ/G6H+Xcp1sf7wqw1b6YBbcyONnIw9Kv0tczmN?=
 =?Windows-1252?Q?4DApZ7Rig3D1GA8ezBf5e0gACvUqMTcHMzOV/Blisl4r5tT1pOd1CN64?=
 =?Windows-1252?Q?IvaUWQlNhyfbz+JrMf9I9jpu1gX3LMaMBj7yi/5eGfiKrXCe77RmPGQG?=
 =?Windows-1252?Q?9SeDA3TRD3FsjGXpQm6qQ4BhHrgpkRWGGiCn1/Y+Kz3GeoqONcgQN1eu?=
 =?Windows-1252?Q?a7wbz6T9QTsbO/Ud5vIaUI4oX1pW742WNrm79zmoSL7XctbDcFMmp/7Z?=
 =?Windows-1252?Q?Fs4JIokvlhvyXe+zpLUed0+j3AeMV+9eJjvTdao66Ruh7kUXZgr9eTk8?=
 =?Windows-1252?Q?O/mI4niHl75PWjJAHG/joS4Cgwh33TSwbxzo9LM5SeovHkAq44AQKQ?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN7PR11MB6750A1BADDB0334F62DA5420E3722SN7PR11MB6750namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ca0897-f20d-4c51-0526-08dce4379dd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 05:44:30.1815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QTTXHs2Yb14IN+pFvwyQF+MrBPceaKH4oWJE/q/QqZQNtXYP3OyaQRxsVsqMWNWhrh8sjzdkZEbYXHGEJlmD2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7540
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

--_000_SN7PR11MB6750A1BADDB0334F62DA5420E3722SN7PR11MB6750namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
Sent: Friday, October 4, 2024 11:02:42 am
To: Kandpal, Suraj <suraj.kandpal@intel.com>; igt-dev@lists.freedesktop.org=
 <igt-dev@lists.freedesktop.org>
Cc: Samala, Pranay <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulati=
on in HDR mode

Hi Suraj,

Agreed, we do have similar functionality in kms_brightness, but it requires=
 some adjustments .
I plan to move these functions =93backlight_read=94 , =93backlight_write=94=
 to lib/igt_sysfs and make the necessary modifications at a later stage.

Please provide your thoughts on this approach.
_____________

Why not just some simple code sharing via a header file rather than the who=
le lib/igt_sysfs complexity.

Regards,
Suraj
____________
Regards,
Santhosh

From: Kandpal, Suraj <suraj.kandpal@intel.com>
Sent: Friday, October 4, 2024 10:50 AM
To: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; igt-dev@lis=
ts.freedesktop.org
Cc: Samala, Pranay <pranay.samala@intel.com>; Reddy Guddati, Santhosh <sant=
hosh.reddy.guddati@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulati=
on in HDR mode

From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com<mailto:sant=
hosh.reddy.guddati@intel.com>>
Sent: Wednesday, October 2, 2024 8:26:33 pm
To: igt-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org> <ig=
t-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org>>
Cc: Samala, Pranay <pranay.samala@intel.com<mailto:pranay.samala@intel.com>=
>; Kandpal, Suraj <suraj.kandpal@intel.com<mailto:suraj.kandpal@intel.com>>=
; Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com<mailto:santhosh=
.reddy.guddati@intel.com>>
Subject: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation i=
n HDR mode


Add subtest for backlight control on hdr enabled edp panels
by changing brightness via sysfs.

v2: adjust brightness range, refactor and restore brightness (Pranay)

v3: reuse functions, add flags to avoid duplicate code (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com<mai=
lto:santhosh.reddy.guddati@intel.com>>
---
 tests/kms_hdr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f123c6b36..0f07e770b 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -64,6 +64,10 @@
  * Description: Tests static toggle with suspend
  * Functionality: colorspace, static_hdr, suspend
  *
+ * SUBTEST: brightness-with-hdr
+ * Description: Tests brightness with HDR
+ * Functionality: colorspace, static_hdr
+ *
  * SUBTEST: static-%s
  * Description: Tests %arg[1].
  * Functionality: colorspace, static_hdr
@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bp=
c switch");
 #define HDR_STATIC_METADATA_BLOCK       0x06
 #define USE_EXTENDED_TAG                0x07

+#define INTEL_BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
+
 /* DRM HDR definitions. Not in the UAPI header, unfortunately. */
 enum hdmi_metadata_type {
         HDMI_STATIC_METADATA_TYPE1 =3D 0,
@@ -100,6 +106,7 @@ enum {
         TEST_SWAP =3D 1 << 3,
         TEST_INVALID_METADATA_SIZES =3D 1 << 4,
         TEST_INVALID_HDR =3D 1 << 5,
+       TEST_BRIGHTNESS =3D 1 << 6,
 };

 /* BPC connector state. */
@@ -448,6 +455,72 @@ static void fill_hdr_output_metadata_st2048(struct hdr=
_output_metadata *meta)
         meta->hdmi_metadata_type1.max_cll =3D 500;   /* 500 nits */
 }

+/* TODO: Move adjust_brightness to lib/igt_sysfs to reuse in other tests. =
*/
+static void adjust_brightness(data_t *data, uint32_t flags)

-----------------
 Do we not have a function in kms_brightness to manipulate brightness let's=
 reuse that rather than writing the whole function here

Regards,
Suraj Kandpal

----------------------
+{
+       char brightness_path[1024];
+       int brightness_fd;
+       char brightness_value[64];
+       int current_brightness;
+       int max_brightness;
+       int read_brightness;
+       int fd, i;
+
+       /* Get max brightness */
+       snprintf(brightness_path, sizeof(brightness_path),
+                "%s/%s", INTEL_BACKLIGHT_PATH, "max_brightness");
+       fd =3D open(brightness_path, O_RDONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0=
);
+
+       max_brightness =3D atoi(brightness_value);
+
+       close(fd);
+
+       /* Get current brightness */
+       snprintf(brightness_path, sizeof(brightness_path),
+                "%s/%s", INTEL_BACKLIGHT_PATH, "brightness");
+       fd =3D open(brightness_path, O_RDONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0=
);
+
+       current_brightness =3D atoi(brightness_value);
+
+       close(fd);
+
+       for (i =3D 0; i <=3D max_brightness; i +=3D 50) {
+               fd =3D open(brightness_path, O_WRONLY);
+               igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_p=
ath);
+
+               snprintf(brightness_value, sizeof(brightness_value), "%d", =
i);
+               igt_assert(write(fd, brightness_value, strlen(brightness_va=
lue)) > 0);
+
+               close(fd);
+
+               /* Verify brightness adjustment */
+               fd =3D open(brightness_path, O_RDONLY);
+               igt_assert(fd >=3D 0);
+
+               igt_assert(read(fd, brightness_value, sizeof(brightness_val=
ue)) > 0);
+
+               read_brightness =3D atoi(brightness_value);
+
+               igt_assert_eq(read_brightness, i);
+
+               close(fd);
+       }
+
+       fd =3D open(brightness_path, O_WRONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       snprintf(brightness_value, sizeof(brightness_value), "%d", current_=
brightness);
+       igt_assert(write(brightness_fd, brightness_value, strlen(brightness=
_value)) > 0);
+
+       close(fd);
+}
+
 static void test_static_toggle(data_t *data, enum pipe pipe,
                                igt_output_t *output,
                                uint32_t flags)
@@ -483,6 +556,9 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,
                 igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown=
 EOTF [0-9]+\""), 0);
                 goto cleanup;
         }
+       if (flags & TEST_BRIGHTNESS)
+               adjust_brightness(data, flags);
+
         igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);

         /* Verify that the CRC are equal after DPMS or suspend. */
@@ -685,7 +761,8 @@ static void test_hdr(data_t *data, uint32_t flags)

                         igt_dynamic_f("pipe-%s-%s",
                                       kmstest_pipe_name(pipe), output->nam=
e) {
-                               if (flags & (TEST_NONE | TEST_DPMS | TEST_S=
USPEND | TEST_INVALID_HDR))
+                               if (flags & (TEST_NONE | TEST_DPMS | TEST_S=
USPEND |
+                                            TEST_INVALID_HDR | TEST_BRIGHT=
NESS))
                                         test_static_toggle(data, pipe, out=
put, flags);
                                 if (flags & TEST_SWAP)
                                         test_static_swap(data, pipe, outpu=
t);
@@ -734,6 +811,10 @@ igt_main
         igt_subtest_with_dynamic("static-toggle-suspend")
                 test_hdr(&data, TEST_SUSPEND);

+       igt_describe("Tests brightness while entering and exiting HDR mode"=
);
+       igt_subtest_with_dynamic("brightness-with-hdr")
+               test_hdr(&data, TEST_BRIGHTNESS);
+
         igt_describe("Tests swapping static HDR metadata");
         igt_subtest_with_dynamic("static-swap")
                 test_hdr(&data, TEST_SWAP);
--
2.34.1



--_000_SN7PR11MB6750A1BADDB0334F62DA5420E3722SN7PR11MB6750namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div><br>
</div>
<div id=3D"mail-editor-reference-message-container" dir=3D"auto"><br>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;"><strong>From:</strong>=
 Reddy Guddati, Santhosh &lt;santhosh.reddy.guddati@intel.com&gt;<br>
<strong>Sent:</strong> Friday, October 4, 2024 11:02:42 am<br>
<strong>To:</strong> Kandpal, Suraj &lt;suraj.kandpal@intel.com&gt;; igt-de=
v@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;<br>
<strong>Cc:</strong> Samala, Pranay &lt;pranay.samala@intel.com&gt;<br>
<strong>Subject:</strong> RE: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brig=
htness manipulation in HDR mode<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<div class=3D"WordSection1" dir=3D"auto">
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"">Hi Suraj,<br>
<br>
Agreed, we do have similar functionality in kms_brightness, but it requires=
 some adjustments .<br>
I plan to move these functions =93backlight_read=94 , =93backlight_write=94=
 to lib/igt_sysfs and make the necessary modifications at a later stage.</s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"">&nbsp;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"">Please provide your thoughts on this approach.</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"">_____________</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D""><br>
</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"">Why not just some simple code sharing via a header file ra=
ther than the whole lib/igt_sysfs complexity.</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D""><br>
</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"">Regards<span>,<br>
Suraj</span><br>
____________<br>
Regards,<br>
Santhosh</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"">&nbsp;</span></p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0c=
m 0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<b><span lang=3D"EN-US" style=3D"font-size:11.0pt; font-family:&quot;Calibr=
i&quot;,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"font-size=
:11.0pt; font-family:&quot;Calibri&quot;,sans-serif"> Kandpal, Suraj &lt;su=
raj.kandpal@intel.com&gt;
<br>
<b>Sent:</b> Friday, October 4, 2024 10:50 AM<br>
<b>To:</b> Reddy Guddati, Santhosh &lt;santhosh.reddy.guddati@intel.com&gt;=
; igt-dev@lists.freedesktop.org<br>
<b>Cc:</b> Samala, Pranay &lt;pranay.samala@intel.com&gt;; Reddy Guddati, S=
anthosh &lt;santhosh.reddy.guddati@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness man=
ipulation in HDR mode</span></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
&nbsp;</p>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<strong><span style=3D"font-size:11.0pt; font-family:&quot;Aptos&quot;,sans=
-serif">From:</span></strong><span style=3D"font-size:11.0pt"> Reddy Guddat=
i, Santhosh &lt;<a href=3D"mailto:santhosh.reddy.guddati@intel.com" style=
=3D"text-decoration: underline; color: rgb(70, 120, 134);">santhosh.reddy.g=
uddati@intel.com</a>&gt;</span></p>
</div>
<div id=3D"mail-editor-reference-message-container">
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<strong><span style=3D"font-size:11.0pt; font-family:&quot;Aptos&quot;,sans=
-serif">Sent:</span></strong><span style=3D"font-size:11.0pt"> Wednesday, O=
ctober 2, 2024 8:26:33 pm<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">To:</span>=
</strong> <a href=3D"mailto:igt-dev@lists.freedesktop.org" style=3D"text-de=
coration: underline; color: rgb(70, 120, 134);">
igt-dev@lists.freedesktop.org</a> &lt;<a href=3D"mailto:igt-dev@lists.freed=
esktop.org" style=3D"text-decoration: underline; color: rgb(70, 120, 134);"=
>igt-dev@lists.freedesktop.org</a>&gt;<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">Cc:</span>=
</strong> Samala, Pranay &lt;<a href=3D"mailto:pranay.samala@intel.com" sty=
le=3D"text-decoration: underline; color: rgb(70, 120, 134);">pranay.samala@=
intel.com</a>&gt;; Kandpal, Suraj &lt;<a href=3D"mailto:suraj.kandpal@intel=
.com" style=3D"text-decoration: underline; color: rgb(70, 120, 134);">suraj=
.kandpal@intel.com</a>&gt;;
 Reddy Guddati, Santhosh &lt;<a href=3D"mailto:santhosh.reddy.guddati@intel=
.com" style=3D"text-decoration: underline; color: rgb(70, 120, 134);">santh=
osh.reddy.guddati@intel.com</a>&gt;<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">Subject:</=
span></strong> [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipula=
tion in HDR mode</span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<br>
<br>
<span style=3D"font-size:11.0pt"></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"font-size:11.0pt">Add subtest for backlight control on hdr e=
nabled edp panels<br>
by changing brightness via sysfs.<br>
<br>
v2: adjust brightness range, refactor and restore brightness (Pranay)<br>
<br>
v3: reuse functions, add flags to avoid duplicate code (Suraj)<br>
<br>
Signed-off-by: Santhosh Reddy Guddati &lt;<a href=3D"mailto:santhosh.reddy.=
guddati@intel.com" style=3D"text-decoration: underline; color: rgb(70, 120,=
 134);">santhosh.reddy.guddati@intel.com</a>&gt;<br>
---<br>
&nbsp;tests/kms_hdr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++=
-<br>
&nbsp;1 file changed, 82 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c<br>
index f123c6b36..0f07e770b 100644<br>
--- a/tests/kms_hdr.c<br>
+++ b/tests/kms_hdr.c<br>
@@ -64,6 +64,10 @@<br>
&nbsp; * Description: Tests static toggle with suspend<br>
&nbsp; * Functionality: colorspace, static_hdr, suspend<br>
&nbsp; *<br>
+ * SUBTEST: brightness-with-hdr<br>
+ * Description: Tests brightness with HDR<br>
+ * Functionality: colorspace, static_hdr<br>
+ *<br>
&nbsp; * SUBTEST: static-%s<br>
&nbsp; * Description: Tests %arg[1].<br>
&nbsp; * Functionality: colorspace, static_hdr<br>
@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION(&quot;Test HDR metadata interfaces a=
nd bpc switch&quot;);<br>
&nbsp;#define HDR_STATIC_METADATA_BLOCK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0x06<br>
&nbsp;#define USE_EXTENDED_TAG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x07<br>
&nbsp;<br>
+#define INTEL_BACKLIGHT_PATH &quot;/sys/class/backlight/intel_backlight&qu=
ot;<br>
+<br>
&nbsp;/* DRM HDR definitions. Not in the UAPI header, unfortunately. */<br>
&nbsp;enum hdmi_metadata_type {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HDMI_STATIC_METADATA_TYPE1=
 =3D 0,<br>
@@ -100,6 +106,7 @@ enum {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_SWAP =3D 1 &lt;&lt; 3=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_METADATA_SIZE=
S =3D 1 &lt;&lt; 4,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_HDR =3D 1 &lt=
;&lt; 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_BRIGHTNESS =3D 1 &lt;&lt; 6,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;/* BPC connector state. */<br>
@@ -448,6 +455,72 @@ static void fill_hdr_output_metadata_st2048(struct hdr=
_output_metadata *meta)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-&gt;hdmi_metadata_typ=
e1.max_cll =3D 500;&nbsp;&nbsp; /* 500 nits */<br>
&nbsp;}<br>
&nbsp;<br>
+/* TODO: Move adjust_brightness to lib/igt_sysfs to reuse in other tests. =
*/<br>
+static void adjust_brightness(data_t *data, uint32_t flags)</span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"font-size:11.0pt">&nbsp;</span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"font-size:11.0pt">-----------------</span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"font-size:11.0pt">&nbsp;Do we not have a function in kms_bri=
ghtness to manipulate brightness let's reuse that rather than writing the w=
hole function here</span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"font-size:11.0pt">&nbsp;</span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"font-size:11.0pt">Regards,</span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"font-size:11.0pt">Suraj Kandpal</span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
<span style=3D"font-size:11.0pt">&nbsp;</span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;margin-bottom:12.0pt">
<span style=3D"font-size:11.0pt">----------------------<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char brightness_path[1024];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int brightness_fd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char brightness_value[64];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int current_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int read_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd, i;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get max brightness */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_path, sizeof(brig=
htness_path),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;%s/%s&quot;, INTEL_BACKLIGHT_PATH, &quot;max_brightn=
ess&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_RDONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(read(fd, brightness_value,=
 sizeof(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_brightness =3D atoi(brightness_va=
lue);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get current brightness */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_path, sizeof(brig=
htness_path),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;%s/%s&quot;, INTEL_BACKLIGHT_PATH, &quot;brightness&=
quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_RDONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(read(fd, brightness_value,=
 sizeof(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_brightness =3D atoi(brightnes=
s_value);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt;=3D max_brightnes=
s; i +=3D 50) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fd =3D open(brightness_path, O_WRONLY);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Failed to open %s\n&quot;, brig=
htness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(brightness_value, sizeof(brightness_value), &quot;%d&qu=
ot;, i);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(write(fd, brightness_value, strlen(brightness_value))=
 &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Verify brightness adjustment */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fd =3D open(brightness_path, O_RDONLY);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(fd &gt;=3D 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(read(fd, brightness_value, sizeof(brightness_value)) =
&gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; read_brightness =3D atoi(brightness_value);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert_eq(read_brightness, i);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; close(fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_WRONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_value, sizeof(bri=
ghtness_value), &quot;%d&quot;, current_brightness);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(write(brightness_fd, brigh=
tness_value, strlen(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+}<br>
+<br>
&nbsp;static void test_static_toggle(data_t *data, enum pipe pipe,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t flags)<br>
@@ -483,6 +556,9 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert_eq(system(&quot;dmesg|tail -n 1000|grep -E=
 \&quot;Unknown EOTF [0-9]+\&quot;&quot;), 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto cleanup;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; TEST_BRIGHTNESS)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adjust_brightness(data, flags);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_output_bpc_equa=
l(data-&gt;fd, pipe, output-&gt;name, 10);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Verify that the CRC are=
 equal after DPMS or suspend. */<br>
@@ -685,7 +761,8 @@ static void test_hdr(data_t *data, uint32_t flags)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_d=
ynamic_f(&quot;pipe-%s-%s&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kmstest_pipe_name(pipe), output-&gt;name) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; (TEST_NONE | TEST_DPMS | TE=
ST_SUSPEND | TEST_INVALID_HDR))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; (TEST_NONE | TEST_DPMS | TE=
ST_SUSPEND |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_HDR | TEST_BRIGHTNESS))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; test_static_toggle(data, pipe, output, flags);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; TEST_SWAP)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; test_static_swap(data, pipe, output);<br>
@@ -734,6 +811,10 @@ igt_main<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&=
quot;static-toggle-suspend&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_SUSPEND);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests brightness w=
hile entering and exiting HDR mode&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;bright=
ness-with-hdr&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; test_hdr(&amp;data, TEST_BRIGHTNESS);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests s=
wapping static HDR metadata&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&=
quot;static-swap&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_SWAP);<br>
-- <br>
2.34.1</span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 12pt; font-family: =
Aptos, sans-serif;">
&nbsp;</p>
</div>
</div>
<br>
</div>
</body>
</html>

--_000_SN7PR11MB6750A1BADDB0334F62DA5420E3722SN7PR11MB6750namp_--
