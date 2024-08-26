Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8A1C5472D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 08:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058BF10E4C9;
	Wed, 28 Aug 2024 08:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUjKfhMB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5EC10E1FE;
 Mon, 26 Aug 2024 13:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724679931; x=1756215931;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=Q93Ws+3CCdNcGZ+8lcqqmZrfUqfkE5ecIFuUxZVdukU=;
 b=PUjKfhMBLo6ibQN29xkj01tby0NEX+LCtswi38pINNAWCRchzbCwx+8q
 80Ok7NLvhxwbJ/Jl8vYiK/k0fnqwvMWT67y/N9Ru+diB1uKwP9i4J/pJy
 HeQhiUV68Bt+J6Rz/fhwGj6B1fQpTQtJn0I4B4XySV/c5MoybxcHMCdna
 kwaUqISur1L8onAkweAvUQLQul3YrUvXYWAx0EkKDRrKu2dxUIqgar7mV
 JA/+MMMWHMGtuIS4SLLb1jOIqScvo9m0Jhr9iSEgF/VlO8eDUKq8/sv/W
 5LW2cEX4MlIBemIN+uyKgxRpzNSM11slXsR/goexl1NphwYqDEOE5grQc Q==;
X-CSE-ConnectionGUID: l5Mn3IKgS8iZiEXesG1ZGA==
X-CSE-MsgGUID: mtq6d3MJRiyUpnwyRAsYBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26983472"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26983472"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 06:45:31 -0700
X-CSE-ConnectionGUID: lieZB/MnRw6+e5F4Zk+l6Q==
X-CSE-MsgGUID: vwaRl96aTliIzot+F66d1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="63049927"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 06:45:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 06:45:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 06:45:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 06:45:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdxtaGMDK8aPg7RMfZ3vAlfnJrmlTGxXmX+TKJ2Ro5h9rc3/sFHo4sJmC903j9s4Hol3I88gwmZDEcNNVhVhX7lR9lisnvOPNNB8YB7vFI16rzNGIbBX+enfc/HzLU7+g2cMlZm1UFKlvHHvz5C7ofLKBMfMAqguvq7ONfLWtwEBjN7T+wdTLp+4dj6wMCjBUXyrqJkW/hFqEGq/tSlpoISj1ZAwagaeGElqg+wiqQ31g06KhQGPXg7TR8QBc/oEXwNHMSVk3TOMxz4M1FPGuyB9wHVqy2lYryMUqvHzUfWV+jRiEgDSrR0VuyuW3EJU1a7ubssXqfosZ2n/Cp6yuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q93Ws+3CCdNcGZ+8lcqqmZrfUqfkE5ecIFuUxZVdukU=;
 b=IKi0epuGlTs7xCAHYBzg6U5BtJaDuhRKdY8ysWfdSbHVXyz9k5g3NoUw1j76ceiQXDVWwLq3KndUYZytNnICCWDQVWv+T/C8DFZj9Xt5QUeYGCpZYw0Fuc1xkHivWgCZnlv5CxU2BJRTlGEGtwCf0LuicRCx62genkcP48Qk9WDvkyR52a2rLc8ugXzVE+zmow8d+i3mqoP55Sc7j+9s5eCgkuaVA6PfPPM1VPkWuO6tVhKeQVvv2fESDmQ5tAwo8zYeVk4LRhEXmWIAqZcxyRXWmvsDaErAJuchFHBn/njTSKtD4ZIrLZn5BJV/rGYRSTtGvRTqNU8GoThBLLH9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by MW4PR11MB7101.namprd11.prod.outlook.com (2603:10b6:303:219::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 13:45:27 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 13:45:27 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: LGCI Ubuntu 24.04 Upgrade Notice
Thread-Topic: LGCI Ubuntu 24.04 Upgrade Notice
Thread-Index: AQHa9741StLU+PsErEiGjpf42aDohg==
Date: Mon, 26 Aug 2024 13:45:27 +0000
Message-ID: <50e68389802664375db12eeeb0f5b2c79713d1ef.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|MW4PR11MB7101:EE_
x-ms-office365-filtering-correlation-id: 76b3d3e7-d725-43a6-e046-08dcc5d557fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZnM4Nysvek1XSS8yVGJlb0sveHFsUU4wV2s3clZJQTJkSmxSaHlCbTNsQytU?=
 =?utf-8?B?NUJwaCtZN0NSZFdkY28yYTZkOWN1Wk10R3ZmQ0R3Z00zbnlDOEJ1Rk5SZXhC?=
 =?utf-8?B?ejNXWldiU2cvOS9Na0FxZ21IQnJtN2xDR3JRN1NpLzBOMS80YVFRS0VoWXZG?=
 =?utf-8?B?dnJwQzA2VFB6T1lFNE1xQXVJR2ZGZDl2VVNHN0w5YldwVEVsaXhEa3pZd04x?=
 =?utf-8?B?dWJuM1MzU0RrUmNjaXhMZzVhUnJyUzFOY2M0Mmw4ZjNhOW0wd0VmaHROdng2?=
 =?utf-8?B?eXVqTHJXeGlBVklQKy8wZFRpZ3FIKzBsTUV4UnhQdFpZRzhjR2tiU1JVMGZo?=
 =?utf-8?B?bWtuVE5GS0tLaE1wMVp4OE5hMjZodXlrU2x1NlpsVFVDa3UzNGpzbFFOUGVV?=
 =?utf-8?B?YXE0SkR6ZGIvdkQ2a0R0SVc5T2pld2g3MkFkNHk4ZGFoa2pzdG5mU3NuNzQ2?=
 =?utf-8?B?OFdjNWFNUTBjdSsrR2sxbG5nVUhqUVpPUUJWWUdNTzAyOVowZWhmS2M0S0Iw?=
 =?utf-8?B?eUF0c3lmQ0pGNTMwbHhKYktOME12Rm02WGZwTFFJRHpQSklXS0xtZ3o2NVFY?=
 =?utf-8?B?eFhiUzBza0swVHk3UlhrQkJXTlI4YXhkeFNidHpjZ0lIWEVUTHZrdS9pQlpH?=
 =?utf-8?B?ZFpBdnQ4U1lxNzZZcnBkcjl2Z0dkbzMxNUNkWjJBSEtXQmdZSkUyb2s5ZVc2?=
 =?utf-8?B?cVdhZS9YL0p3M3cySlc1WTRLUzBmMXd1NDJUZjhkZFRibWU2aDV1bkpiQ1hw?=
 =?utf-8?B?K2FSR0Jrb29JUk5ZRkhkY2ZUNFZLcm5LZ0Z3NFdTRlR2aHRLdndreVVuMU1k?=
 =?utf-8?B?aWZXOFpSaUR1WW9CYXl2eGdwb0hQbzlKeGM0MG8yTzVOb2E1eEZYWExqU3pE?=
 =?utf-8?B?VGpjTmt1SmVkR2dkMU5KVVMvWjJIM0tkeHd2UEFodDlKWitZSHNnV3N1aEhl?=
 =?utf-8?B?OENIZ0d0N29LRGNPZmZsMXVQOXVzdUxHVkhhZnYvWC8yUHhMOHVzMUdubU1I?=
 =?utf-8?B?cTFBQ3ZTUFkwVDFReGxkd09ERG5pMTVQU0N5b3VzRDVud3B1a0t5MnlMMG5R?=
 =?utf-8?B?bENKUFpKekZxdC90TTJkbCtLREkxSWxtMDdNSzZScDJZbDVtb2RIQTRpdVY1?=
 =?utf-8?B?MjEyM0w4REFsYlYrTXNETHhUejQzbXU0amRxNnNHOFZBWHFueXBQTGcrSkc1?=
 =?utf-8?B?YTUrb3lzc0hUWHpVMEZNMWtrZlVwT2ZxWk9EMU1RQTZDaFhTUmVORFprdDBG?=
 =?utf-8?B?YmdIaERaMEl3RU1sQ1hDNXdWRUloWTlMZDNnT1RmNkdmdEpKQlBMNmg4bTBL?=
 =?utf-8?B?ZWJIUnV6elFEaVdzSlNJSFFnalN4VitvazgvOGVmZGx2S042SmVGOThNaUZn?=
 =?utf-8?B?OFRPYjRoQkVPU2RVTlhnZjZGQjNDRkFDZm5qYVFnY25DekkxcjNlQzMzTlNF?=
 =?utf-8?B?THhpaXJEdVZrc3ZRek9FMmF5UllSYUtDaTQxcFNzeWhzTjNTYVNhU1YzTG9m?=
 =?utf-8?B?aXordC9oUUJKelpQSXpvMnlGVkE2VDJkcHFZYW9pb1pwQVlONzlza3ArcVFF?=
 =?utf-8?B?VjdPL0E4QlVKWmJiOVRFMkM5TDlvamdxc2RuV3RzRUxVeVhtMXBsS0pyMUlD?=
 =?utf-8?B?NVZWSkZ1MStoNHVudksrcFA3SVBRSUVSNGdCdytBOXJYRGgvVlBBQUoxN3hv?=
 =?utf-8?B?bis1bWxYRjNWNFIxL2F5NEI3NWxtaGdIdVRlbWZaQzhkUWQ3UHY4UlJRRkwy?=
 =?utf-8?B?ZmZFdjZCRnpqUnErTWtVcmw5amNGbS95SjBTd0pjTkg2ZnM2eGpWVmxqeDV6?=
 =?utf-8?B?VGxybzRUZGhIMmtnL0JjMlJXWldyWDVqbnRpY0dJd0c0aDVZMXhRRW9uN2d1?=
 =?utf-8?B?eUFLSzZsNjF4RHRpTXVyRzZFczhZZHV5WSsxTFR5dkY4YlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlFCNzFNcEJEM0s0UmhQVXlpTk5vOURtcUp1RE9Sb0ttemxWR0xTaXpwajFu?=
 =?utf-8?B?U05obGhSdEN4VWM2MGtsbTJid1RlTHpSZG12dXlVbGFnTmRERUwyZTc5U3B5?=
 =?utf-8?B?QktDRGZnQVBGRE9VWndOdHlMZjFqQk5MRnkyZkNKNUhRemo0VzNFcFRveUhW?=
 =?utf-8?B?Uks2UWQ0VWpLWStjbUNNQkhWU2FBaXZYdlgzSVMxMzA4OFlJa2ZTdXRBa3ZD?=
 =?utf-8?B?WFIzR2gxd1hjMjQ4UXVCcld2a0FIeVJGR3RIcFk0dTNpQmJsN2FmSE5WVmRS?=
 =?utf-8?B?Z2JvZW52UlhReHNiVm9tVWo4US9ndWl6dEhZMEw1WnFQcjlUcGkyU05lSHVh?=
 =?utf-8?B?SEFzTEF3WlJPTzhiR05Hd21mSXo5bXlIVDlNQk4zS1d0bkhtTGJUSHE0ZWVC?=
 =?utf-8?B?c3l0SDIwOWVOVngwd3A4bURTWk56TUk0L1Yzb281WHhWcS9QbnVFMXI5SUsy?=
 =?utf-8?B?TXNybVVqWk5EWjQrdWhQeFJNTjBnUGd0TWlwRjhuaXl3dE5jUTF1MXVHVGd2?=
 =?utf-8?B?NjZuaWV1dW5iZDVGd0U1NG1SUnk0UXFRMitZR215ZWRVeURveDkrcU5tU3lN?=
 =?utf-8?B?dldwWTRLZ2VVWUs0SER4OFpDRHcyNk1qa3dCcTBQci9oUjRqQUhVQmNmSnZE?=
 =?utf-8?B?TWdhc0IwbUxTcXQ0TStrRDlUVmdVUWhLTE1zZjR0a0VCMUVJWnA1dHhjSUw3?=
 =?utf-8?B?KzBzalBXU0xNTlo5V2VXWmVCUFZhNHJMN2pCeXhpVVlTU3lzMHA3aUZiZGls?=
 =?utf-8?B?OHRiQzE3ZW14aGNmQlRsbHJqc3NoNHpNWW9UZGozR09GSDk2cE5NYUY5eWs3?=
 =?utf-8?B?czl6aDV4enpwbTVGKzQ4YzFQRWVhRjg4OGhjMURUeG5ieU12MkFiejMwRXp2?=
 =?utf-8?B?SDQ5dCtCR2UwTGpYR20wbW1Camd6T0hBVjlqOTd2ZUhsblcwd1Mxd0l2bk9Z?=
 =?utf-8?B?SGRCYXUwUjMwWmNtaTh6VUFnMTlaUGViRzRIVGJFN3pIRmx0OGFHR2RsSkFC?=
 =?utf-8?B?S2VkQldUQWkyWGowWnJ5N1lraE0rL2hPTjkySC9vejVtMk5xWWNqcEllTUNL?=
 =?utf-8?B?MjE3V0ZZRU0zZm8wSHFjSGxBdU51WWRmL1ptR1EvU2w2aFp1ckp0SWtReGVB?=
 =?utf-8?B?akJiZ2xOM003U0pwRTdHVjFnTlRuNVhNT1BlL3JrM0tBNkJPTE9Za3hrNncy?=
 =?utf-8?B?MDFjaldmQnlKK1oxT3A3M2laYTNQdk5SdW9wVkJqY3BVSnRsUDdXQUc0aC9u?=
 =?utf-8?B?WE5OdnE4VGNVWFFoNStyTzJnSDRLc1lTUHlxbmRZdHNVT3A0Ni84RDJKMjFD?=
 =?utf-8?B?L2Q0NjBpUU05MFVaTDNXcHMzdjdBczk2SzFNcGhGWHZQY2VnNjNicS9NR2ZD?=
 =?utf-8?B?Z09UTDgxWEZaQkpPanVNWXJ3bTNDUHhQVytHdlVWZ0p6bloybG43bEFCdVJL?=
 =?utf-8?B?VWhtMWxsdFFGM2VTZ085NzM2RDhUTDNBZDBVSVl6SGJGR0RHZGtnMkpoaE5S?=
 =?utf-8?B?UmFHUmg2TnZSYm5sQUE5Sm5RYXUvV05mbGx5UTBRSGRwZ2ZaWm5jTkxRRitt?=
 =?utf-8?B?d0ltdlJDZjRvZEpzMld2MjJOeUR5L3l4TzROTWY4WmpmblQrNEpsQ1lFRlRr?=
 =?utf-8?B?VjdaNnhwOUs1TC85aTNBMTFVRWYwb3VoZmhub3NnK2tzR2tIckJYZFc3aHdF?=
 =?utf-8?B?Zm5oWE5yY01TajdqRnR5L0kwbzNmLzNwbWRjcjRESTV5MCtFbFpUSzdWemg0?=
 =?utf-8?B?QXQycndaMnJ3NWd4ZU9FRnViUVk1dlNpcjBPRFUrU0ZqVDB1THFQMG16Y1Zr?=
 =?utf-8?B?RWFkYU1RUmxzb2hhUklEellJSkdNeXNGUm1WWlVnZFRBMEpZa2FxMzMzSkRo?=
 =?utf-8?B?VGk0dVdHWGI3akEvTllwdlNldlVycDdNdkM5bkRadS9lS3drVUUxVHVBWGJ3?=
 =?utf-8?B?S0dnbnNpYjJWM2N1ZjhJWDdtd0RiSU14Z3RCRHdQYmtiNmRFNFFjdElqZnRM?=
 =?utf-8?B?WDR4U0doK2lGdjhXcEpXUmFXRHNwMHRVQm1xOGh5TUw3Znl1eXcrM2lDazh4?=
 =?utf-8?B?LzZzWDJKMlU3ZHZEZk1XZ296d0dlY1NQRURmUDBUSFN5KzllQ3dPTXU0M0hO?=
 =?utf-8?B?UndWTjZ3WW1lZU1oVUhBL0FrOGsycUJyWFBteEpNYUNaZjRUMlFOTmh6WUxM?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD67FABE3F0CA2448B63033A5ADA5BCC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b3d3e7-d725-43a6-e046-08dcc5d557fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 13:45:27.4027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U7xI3c38PeEv7CU2inSs17x/oxaccAee3lk1dFGMHmvWNNKci6a/cjLJOg1uMSzXXyPaAB5XtM0cYbvcwjEYZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7101
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 28 Aug 2024 08:01:28 +0000
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

SGVsbG8gZXZlcnlvbmUsDQoNClRoZSBrZXJuZWwgZ3JhcGhpY3MgQ0kgc3lzdGVtIGlzIGN1cnJl
bnRseSBydW5uaW5nIHByaW1hcmlseSBvbiBVYnVudHUNCjIwLjA0LCB3aXRoIHNvbWUgbGlicmFy
aWVzIGhlbGQgb24gMTguMDQgZm9yIGNvbXBhdGliaWxpdHkgcmVhc29ucy4NClRoaXMgbWVhbnMg
b3V0ZGF0ZWQgdG9vbGNoYWlucywgbWlzc2luZyBmZWF0dXJlcyByZXF1aXJlZCBieSBzb21lIElH
VA0KdGVzdHMgKG1haW5seSBhcm91bmQgSERSKSBhbmQgZ2VuZXJhbGx5IGEgbWlzbWF0Y2ggYmV0
d2VlbiB3aGF0IHdlJ3JlDQp0ZXN0aW5nIGFuZCB3aGVyZSB0aGUgTGludXggZWNvc3lzdGVtIGN1
cnJlbnRseSBpcy4gVG8gYW1lbmQgYWxsIHRoaXMsDQp3ZSBhcmUgcGxhbm5pbmcgdG8gdXBncmFk
ZSB0aGUgZW50aXJlIENJIHN5c3RlbSB0byBVYnVudHUgMjQuMDQgdGhpcw0KcXVhcnRlciwgb24g
MjMuMDkuMjAyNC4NCg0KLSBPbiAyMy4wOSAoTW9uZGF5KSwgdGhlIENJIHN5c3RlbSB3aWxsIHN0
b3AgYWNjZXB0aW5nIGpvYnMgZm9yIGFib3V0IGENCmRheS4gQWxsIERVVHMgd2lsbCBiZSB3aXBl
ZCBjbGVhbiDigJMgVWJ1bnR1IFNlcnZlciAyNC4wNCB3aWxsIGJlDQpyZWluc3RhbGxlZCBmcm9t
IHNjcmF0Y2guIChJZiB5b3UgaGF2ZSBhbnkgaGFuZHkgc2NyaXB0cyBvciB0b29scyBsZWZ0DQpv
biB0aG9zZSBtYWNoaW5lcyBmb3IgZGVidWdnaW5nLCBub3cgd291bGQgYmUgYSBnb29kIHRpbWUg
dG8gY29udGFjdA0KdGhlIENJIHRlYW0gdG8gZmV0Y2ggdGhlbSBiZWZvcmUgdGhleeKAmXJlIGdv
bmUuKQ0KLSBBbGwgaW5mcmEgc2VydmVycyBydW5uaW5nIGJ1aWxkcywgc2VydmljZXMgYW5kIGRl
dmVsb3BlciB0ZXJtaW5hbHMNCndpbGwgYmUgdXBncmFkZWQgdG8gMjQuMDQuIEFsbCBMR0NJIHNl
cnZpY2VzIHdpbGwgYmUgYXZhaWxhYmxlDQppbnRlcm1pdHRlbnRseSB1bnRpbCBhbGwgdXBncmFk
ZSBpc3N1ZXMgYXJlIHJlc29sdmVkLg0KLSBPdXIgc3lzdGVtcyBhcmUgbm90IHByZXBhcmVkIGZv
ciBhIHBhcnRpYWwgbWlncmF0aW9uIHdpdGggMjAuMDQvMjQuMDQNCmJ1aWxkcyBhbmQgdGVzdGlu
ZyBiZWluZyBydW4gc2lkZSBieSBzaWRlLiBBbGwgdGVzdGluZyB3aWxsIGJlIHN3aXRjaGVkDQp0
byAyNC4wNCBhdCBvbmNlLg0KLSBXaGlsZSB3ZSBleHBlY3QgdG8gcmVzb2x2ZSBtb3N0IGlzc3Vl
cyBvbiBNb25kYXksIHRoaXMgaXMgdGhlIGxhcmdlc3QNCk9TIGJ1bXAgd2UgaGF2ZSBoYWQgaW4g
YSBsb25nIHRpbWUg4oCTIGJlIGF3YXJlIHRoYXQgdGhlIENJIHN5c3RlbSBtYXkNCm1pc2JlaGF2
ZSBmb3IgdGhlIGVudGlyZSB3ZWVrIGFmdGVyIHRoZSB1cGdyYWRlLg0KDQpJZiB5b3UgaGF2ZSBh
bnkgcXVlc3Rpb25zLCByZXNwb25kIHRvIHRoaXMgZW1haWwuDQoNClRoYW5rcywgUnlzemFyZA0K
