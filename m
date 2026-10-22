Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E89606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 17:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WMADnltP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B07E10E44B;
	Thu, 22 Oct 2026 17:42:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F09311285D
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 17:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792690890; x=1824226890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AxI4B5gnnc9jXZmflUPpZ/ke6U8CfDGlH/+7hn142JE=;
 b=WMADnltP2tA7ZBHeobMzBKtQtBGxE0DSMV0zZaQ6TaDZA3t6xIqWDpKI
 Rpw8OCPo7WWm/OoFJx53dcVE1kkWVXIYAZ2YFrK4boUaz6l18OuyII++O
 5nnMSwzBZrowsmcflsUCW44GOdnnTwgW+JNfF4bljwvyoVINJxoFprXpt
 TdMDmY8kRNdqylu9+lVWJKCH/xuBDor4sbGXU4wBWCeB6bTAD71NKaPD/
 /W0CHl4LfswHntf3dbpIjYEMaOS2Y/Sf8FkpWGeIjlO9Qmry/FSki5mgA
 rHDCAJ6B+vyvEZAdEs/XTqZtUEbKdEv0znDvWC+PTgUMs3nOhXHOPryZk A==;
X-CSE-ConnectionGUID: K54tk2zISTm9YnHoooV7/Q==
X-CSE-MsgGUID: JwqvsXK+Q520EASRRcWLzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1328546"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1328546"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:41:27 -0700
X-CSE-ConnectionGUID: 4nk7AGcQQo6aZU2xkiBkSg==
X-CSE-MsgGUID: 5pX1fr88QKm2lJMhBEOocw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3421497"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:41:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 10:41:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 10:41:26 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 10:41:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDMmYGKEhBcMZpFXYafHkD1EO8bB+0P8+s81tBdYcCzOkFi7pQMKrlsbhy6ZGsPz1cwxowionhTMI4Mgj/yM2LqjilxEUqGKGjWY7pOVF77Gvw1w5Z9c18Q1fYZYnd/XfuFmcfX4PGpmCjG6i1YbTrzzrb6gnyGsRJDYEgyz5QvLy4l/Rwket220W06QXQmiv9H8GoEUnjDBFijHaqlJvBPQBJ7kp/SG6Wx4A64okkzsEWYI6tuc6ECU65QK779idc49atRegr62T+jlfkG93lR/glRcmtA3LJx1rr+dT1iCmepbBMIcHpWgT9qMNWHc/waCkK3ijqPgWB6DnL0GpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nirQIK6xL2nL3vBtP989APrHDW0tJMHGY0vZrFIZzAs=;
 b=ikCLqBEva3/ppGwms4XJ+M6RMMD+x5LRYB0z5ghMuAgIItwlLYAesk2/3PZ16HvtL+L/mF6yDVv4TtVrEUIK9FOxO751YkaYWYSMyoOZiOdPKHkmoJpWv8zGlF/+eLdfXxH4aQmKXgwDnTWgAF7+FMGq5PV8FLuG+gAtCUHdrdBNClkSJg9aL5w21zt0LjHBJgqM6BsmG+LcbNN1yI2pBh8O/rC5p1zWNFB2QBK4aBhu491ebt2ThiX4T6g+mMZy3nJSEiK4+2akODoa1ZLzRxgu96ZE7XfhlG0mrJ9dva6m/S/ZU9GYoiaL+YS8SGf+GCQJQRHWlztwZM6MXDmstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by DM4PR11MB7325.namprd11.prod.outlook.com (2603:10b6:8:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 17:41:19 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 17:41:17 +0000
Message-ID: <cc5cd803-906f-4bca-928d-c31f3f7e0ff6@intel.com>
Date: Thu, 22 Oct 2026 23:11:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
 <20261013190651.897241-8-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261013190651.897241-8-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0309.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::13) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|DM4PR11MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: fe98413c-b0b8-410b-4706-08df3063ad14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|261022105027099003|56012099006|4143699003|11063799006|261009223027099003|18002099003|10067099003|261022113327099002|6133799003|261021135927099003|261021121427099003|22082099003;
X-Microsoft-Antispam-Message-Info: mwxXxVdGKWn2F8PDBr2Nyxa35uGyM4eaTThgZQU1CWXqJDzq3oGl4KiqFaogi/wG1FGCj/+5g2B5NgTcONJGEi31lwfPBrHtKbgEISzOiBDQm7mIUCdvPnwX6eFKrN0RKJQFAXHINw9oAeCvuvtae+FKDZap6G+2JsOimLAjQC0aZICS1wpykQpKc6Nu/h51CHMfKvVgZwz6xRCadGp1tbYDMDK5ljYWTIs3bF6LppCa+vhoe3F3LcLKgxk2UOxZZxqjEbetidUrkvmpbGlKyycCOKto1Ni3NJvoq7Wx/9oucx7Gjlh0NGaIQjr5o85MPBKLDj2nySv2eUkE+F3WeL1BatKCGW3w8ukQptLs++S47vLPpEeJ7mMEsTk88zUECypUMJboFtEPTVeCELY4ZO5tEad0q5J7c7J6WBkF7tdJRX5qAOJRUpGiMDC3DmZjSuJIosAC2ktDE5+anKcjPEdv51VhcBdv/iUi9XXpoG0pegusAheDXFGPif0qbi94P1MPOXbM0Bn5XG4+U8fDhoyTbB2SVeGT6uujFTj2U2er9lZRK9JZmdtiQ0ZVyoCXUf6YeVA18wQzKU7lAqqLGRqzglhjT9A4c2Rv7uFkshHbV3CGi1vsx94OQ1IY0d3tlbEePerbM2yDIJedVArobOfO6o2knDmKtt1DTbjScjY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261022105027099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(18002099003)(10067099003)(261022113327099002)(6133799003)(261021135927099003)(261021121427099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUllTlNWYW9sRGkwem5FcXBHSVI3YUwyQ3hFdzllL28rVmt3TnJWMFUyQmlv?=
 =?utf-8?B?bXVja0U2NWJOU1dJL2JBSFJUaCtYUXZ0aVN5SnNYRktLQnFCWFFFem83bjZC?=
 =?utf-8?B?RzJUeFJRcm1WZ1JndjVKSFlZSDlVNlkvd1JDeHFnVUxkNzVGaFk2N2NkU2ZY?=
 =?utf-8?B?cW5nV2R6VWVNWVhueHdjM0s2Z3RGWDZjcEpUTGlaMDlxMUxuYkVrd3ZOZEp0?=
 =?utf-8?B?MVVDWVgwNVNaWnFjbWVFeHZkTWFzZXNFczN0SVExZlQyK1J5b2JZWE9GdS9w?=
 =?utf-8?B?aXFaNy9GVVZJUHBab01manp0cEVWa1VNemgzcFhzTUJvL1lhdzZMRERyVzFq?=
 =?utf-8?B?YTJXSCtOakJQUWcxNFJhblV4WWNQbytPRS9NbzRPNFVMRGptNnpMZ3ZKYjlP?=
 =?utf-8?B?TkFNMFcyM1pwblFmVjZCd25YWGhZR0FtS0JSSUNMWFR0VzZDbXhWNmFJSnZw?=
 =?utf-8?B?bCtFeVh2ZEMwOWRGUzVnMXZtVGxwdHBtR3NvZDJPc1RER1VOUUQ1RGJnc3c2?=
 =?utf-8?B?NW1QQkcxRmR5YlEzTDdPeGJwMm5JTUJRemtiNFk4UFdxVXJMT20xc05kQ1NL?=
 =?utf-8?B?N0J1eFZSUDRFRmJYQW5hTWhpRGVhTnRLMGRjN2sxSUhRdDdHYVpJL3pqUkRx?=
 =?utf-8?B?bXpibVh5YWN3QWtvak9QZ0lIUFBWRndreU5rMzN2RzFMbG5ELzhzQnhseXFj?=
 =?utf-8?B?amtmc1dGay9HcmhEelBmTWVOTzlEMzl5NXdWaFhCeWRhWWsrT3VIYXNBUTBY?=
 =?utf-8?B?Smx0Mnk4ZTBFdHRYZ2hEVVBWZG01cmFzTkhOa2YrTnZPMUFKQXNrQTh6a0c3?=
 =?utf-8?B?dE5sNE8xZGJBTXBEbitwSiszdGxrQTM2Z0FGWkN3UHJYOHZCNEt0QVY3dkRX?=
 =?utf-8?B?UEVIZlk0THlBQzZjc2dxL0E2Q1V5OXUxVnF3RHBkaElFWnJTaW1STzB0M1NK?=
 =?utf-8?B?QVRtQlFVSmRzajNJQXljK0MyNy84TWdVSjRsTkFIbTEybjZ3UWR3WXFmN0lR?=
 =?utf-8?B?RkRkNG1zQjZ0Yjd5V2h6Vmh2UHlQcFlsUW15cE83UEJ5S085bTVkQ0w5ZUE4?=
 =?utf-8?B?UE15TGVOamIwYmk1NU40M056UmdHeUhOMElnMkxWeDdMcXNwU1NTUEdPZ0VE?=
 =?utf-8?B?M3h5dTRKN2VCUDBEUCtxR2J0RXduWVlmbERPRjBVNnJzSHJrUlJST0l0K1Bi?=
 =?utf-8?B?ZmpDbWlVSzBrL203aSt3R0tTSzBiTFVXLzMwTlFWNnhEM1lNaWdwdlE4bFRK?=
 =?utf-8?B?alpFaXhXYm1KVXc2NVJxNTdCL0NNWTI0UDUwWjdWVmZFc20wREJwNzVwdUpR?=
 =?utf-8?B?bjJzcENKdFN3UWFRc3k2TU5zMzB2c0dmRTVoa2I1c1dseEZxK0Y1dXU0RFBl?=
 =?utf-8?B?Z0VZUmZYRExxZzBmcDl4eXdmR3ovdld4TWlQaDdpS3NSWVMyOE5JWjY2ckk4?=
 =?utf-8?B?NUlYSzg0QmZVS3BqdkVLMUlwUEd1REVjRHdQRzIveGRnc2pIbXF5OVVBV1RO?=
 =?utf-8?B?UlRYYTBnMG91QkRDRDZPK2pXelFmQ3YzZTU3dG8yMVB4SjdhSk4wVW4xaXJ2?=
 =?utf-8?B?Y2RsYy9SUDByWDN0c3pjR0ZNWEVuK21rMmxFODIvRG5XT3lKYWYrdExuVDNG?=
 =?utf-8?B?ek9HeHVoWFBuSFpFeDJ5SEVld0JNcGQvaVJjRjBEMjk3REdGVnFrRi9UL1V6?=
 =?utf-8?B?SmlXVElQYXVCYXpDbnFYN0RSYm1ubGx6WjBEUzRieTE1OEZhSDNVWG9wTUNG?=
 =?utf-8?B?OTVqb01UTURGN0tQTk13NEZTblhKVjQ3YlMzN2tRRnYvRDBTS1E1M0V4WmUz?=
 =?utf-8?B?OXd0MWxuajRSNlFtaUpuZmNWRzV2Q3J0TlAvODN6bkIrRE4zQTBGQnBueFhK?=
 =?utf-8?B?WG1ETGpkSGI0OVJhVklqaE90VStlYnJrOWg4SXRrbkxGTGxiQXN3dUgzU1pw?=
 =?utf-8?B?WHVrOXVpK1k5NGExV3ZuNFY3a0pUM005dm9LckxqeTVWUWRreUNYUkE1U1BP?=
 =?utf-8?B?dUtBa3MwT3VQSkYzV0tWQ013OHliMDBwcEdlUjF0ZTJiaXV6TUdsZWxsSHRz?=
 =?utf-8?B?T2RnWDUyWVlnMHJ5T1dZWStwYk1rMm1tbFVscjAyUkFUYms2TUFLM1ZWM1Z5?=
 =?utf-8?B?cDlUN0p1bU5mekRaTmxOM1RiZzgwa01KOGwxamZBblN6eHlyZGdJK0xyaXF5?=
 =?utf-8?B?N1BvLzdyOWNkK05pOVBvY20vcytkcTRvM1dTOFhwV0d2WThYcTJkQ1l0UG1t?=
 =?utf-8?B?a1VCdHp2UTV4b2UxMVRubHhCOXB1WVJqN0ZKdUgxK0JUSXVmc3ppZkVxSlJz?=
 =?utf-8?B?VDJxcG5RRitDRW0xc0twUWVrM21lUWZBRE5DV1phL1ZxMDFWVWtBaXBWaW1S?=
 =?utf-8?Q?JVNwI6zmuZi1dIQ4=3D?=
X-Exchange-RoutingPolicyChecked: U2Ffkdzghn5sl3Qgp1HmIbQRoLHThq5Vb+nUtBFcoDkLTlt3Z3g2ucvlacv6bSjlUizAWLOKyGo6LCDSSB/c5eJvMGHrzHeudRgVd3GmLuJ6RqxFvMI8BYuLAQemHrRJOMjEgp6zWZ9iaJ2uQy8iTIsbSuP01yPrJbN1+zwiY4DaY+6szX7Hvewy4E1vJj4NfL5LhdWd9RUosX+lOC8MtBNFYiAJzX6pkN6rNMaN9d3Lv2yhDqrh2vd+IrqsovA3sn/Pch5PoudOfJyFmGlp9af/EDObiEqurpzeDuKJaYlFcSLvBY08vlSg3NBXbPH8l5Nk5CtqalfQnlJImOsngw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe98413c-b0b8-410b-4706-08df3063ad14
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 17:41:17.4582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycPSzTrRnFoo2cB9QM5NZT6JXadvJy8qe9x+Sg/8RVpJUT4lD94j75eo6XxJCBmI7GjYaQREMAKhF/0SG2HM8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7325
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,

On 14-10-2026 00:36, Ravi Kishore Koppuravuri wrote:
> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
> injection to verify the Xe driver error handling and recovery flows with
> the help of DRM Netlink API suite
>
> Cc: Soham Purkait <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v5:
>    - Removed xe_err_injection.h and moved its contents into the .c file (Riana)
>    - Prefixed all register address and bit value names with "XE_" (Riana)
>    - Updated AER recovery dmesg strings to use enum-indexed arrays (Soham)
>    - Added error handling logic for function calls
>    - Changed test name comparisons from strings to enums (Riana)
>    - Added UC test and post-recovery workload tests as dynamic subtests (Riana)
> v4:
>    - Added Steer Semaphore for disabling and enabling multicast
>      operation(soham)
>    - Increased device recovery check timeout from 5secs to 10secs
>    - Used updated library names with igt_drm_netlink_* prefix (Nikula
>      Jani & Kamil)
> ---
>   tests/intel/xe_err_injection.c | 372 +++++++++++++++++++++++++++++++++
>   tests/meson.build              |   1 +
>   2 files changed, 373 insertions(+)
>   create mode 100644 tests/intel/xe_err_injection.c
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> new file mode 100644
> index 000000000..332b2cae0
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.c
> @@ -0,0 +1,372 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: MMIO based Error Injection
> + * Category: RAS
> + * Mega feature: Telemetry
> + * Sub-category: Driver
> + * Test category: Error Injection
> + */
> +
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "lib/igt_drm_ras_nl.h"
> +#include "lib/intel_reg.h"
> +#include "lib/intel_compute.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +
> +/* Steering Control Register (MC_PKT_CTRL) */
> +#define XE_MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
> +#define XE_MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
> +
> +/* GT Uncorrectable worker command parity error injection */
> +#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
> +#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
> +
> +#define POST_RECOVERY_WL 1
> +#define POST_ARMING_INJECTION_WL 0
> +
> +/* STEER_SEMAPHORE_MGSR_3D */
> +#define XE_STEER_SEMAPHORE_MGSR_3D 0x00FD0
> +#define XE_STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
> +
> +/* Node types for error counters*/
> +#define NODE_ID_UNCORRECTABLE_ERROR 1
> +
> +/* Error types for error counter */
> +#define ERROR_ID_CORE_COMPUTE 1
> +
> +enum {
> +	RECOVERY_SUCCESS = 1,
> +	RECOVERY_FAILED,
> +	RECOVERY_TIMEOUT,
> +};
> +
> +static bool run_xe_compute_on_all_engines(int fd, bool state)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	bool ret = false;
> +
> +	igt_info("Running compute-square on all engines post %s\n",
> +		 state == POST_ARMING_INJECTION_WL ? "injection" : "recovery");
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +			continue;
> +
> +		ret = xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL, EXECENV_PREF_SYSTEM);
> +	}
> +	return ret;
> +}
> +
> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
> +			   uint32_t bit_mask, bool set)
> +{
> +	uint32_t regval;
> +
> +	regval = xe_mmio_read32(mmio, reg_addr);
> +	if (set)
> +		regval |= bit_mask;
> +	else
> +		regval &= ~bit_mask;
> +
> +	xe_mmio_write32(mmio, reg_addr, regval);
> +}
> +
> +static void acquire_steering_semaphore(struct xe_mmio *mmio)
> +{
> +	uint32_t regval;
> +
> +	while (true) {
Should this loop be bounded with a timeout?
> +		regval = xe_mmio_read32(mmio, XE_STEER_SEMAPHORE_MGSR_3D);
> +		if (regval == XE_STEER_SEMAPHORE_MGSR_3D_VALUE) {
> +			xe_mmio_write32(mmio, XE_STEER_SEMAPHORE_MGSR_3D, 0x0);
why ? Shouldn't the semaphore automatically get acquired while read 
returns 1 ?

Regards,
Soham
> +			return;
> +		}
> +	}
> +}
> +
> +static void release_steering_semaphore(struct xe_mmio *mmio)
> +{
> +	xe_mmio_write32(mmio, XE_STEER_SEMAPHORE_MGSR_3D,
> +			XE_STEER_SEMAPHORE_MGSR_3D_VALUE);
> +}
> +
> +static int acquire_forcewake(int fd)
> +{
> +	int fw_handle;
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +	return fw_handle;
> +}
> +
> +static void release_forcewake(int fw_handle)
> +{
> +	if (fw_handle >= 0)
> +		close(fw_handle);
> +}
> +
> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
> +{
> +	struct igt_drm_ras_nl_context ctx;
> +	int ret;
> +	uint32_t error_value = UINT32_MAX;
> +
> +	ret = igt_drm_ras_nl_init(&ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to initialize socket for get_error command (ret=%d)\n", ret);
> +		return error_value;
> +	}
> +
> +	ctx.node_id = node_id;
> +	ctx.error_id = error_id;
> +
> +	ret = igt_drm_ras_nl_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
> +		igt_drm_ras_nl_cleanup(&ctx);
> +		return -1;
> +	} else {
> +		error_value = ctx.error_value;
> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
> +			 ctx.node_id, ctx.error_id, ctx.error_value);
> +	}
> +
> +	igt_drm_ras_nl_cleanup(&ctx);
> +
> +	return error_value;
> +}
> +
> +static int check_dmesg(const char *marker, int elapsed_secs)
> +{
> +	static const char * const recovery_messages[] = {
> +		[RECOVERY_SUCCESS] = "AER: device recovery successful",
> +		[RECOVERY_FAILED] = "AER: device recovery failed",
> +	};
> +	char *buff = NULL;
> +	size_t buff_size = 0;
> +	size_t i;
> +	ssize_t line_len;
> +	FILE *fp;
> +	bool marker_seen = false;
> +
> +	fp = popen("dmesg", "r");
> +	if (!fp) {
> +		igt_warn("Unable to open dmesg to check recovery status\n");
> +		return -1;
> +	}
> +
> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
> +		if (!marker_seen) {
> +			if (strstr(buff, marker))
> +				marker_seen = true;
> +			continue;
> +		}
> +
> +		for (i = RECOVERY_SUCCESS; i < ARRAY_SIZE(recovery_messages); i++) {
> +			if (!recovery_messages[i] || !strstr(buff, recovery_messages[i]))
> +				continue;
> +
> +			igt_debug("Found \"%s\" in dmesg after %d secs\n",
> +				  recovery_messages[i], elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return i;
> +		}
> +	}
> +
> +	free(buff);
> +	pclose(fp);
> +	return RECOVERY_TIMEOUT;
> +}
> +
> +static int check_err_recovery(void)
> +{
> +	time_t start_time = time(NULL);
> +	time_t timeout = 10 * 60; /* 10 secs */
> +	int time_interval = 30;
> +	time_t elapsed_time;
> +	int status;
> +	char marker[128];
> +
> +	snprintf(marker, sizeof(marker),
> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
> +		 getpid(), (long long)start_time);
> +	igt_kmsg(KMSG_INFO "%s\n", marker);
> +
> +	while (1) {
> +		elapsed_time = time(NULL) - start_time;
> +		status = check_dmesg(marker, elapsed_time);
> +		if (status < 0) {
> +			igt_warn("Failed to query dmesg for recovery status\n");
> +			return RECOVERY_FAILED;
> +		}
> +		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
> +			return status;
> +
> +		if (elapsed_time >= timeout) {
> +			igt_warn("Timed out while waiting for error recovery\n");
> +			return RECOVERY_TIMEOUT;
> +		}
> +
> +		sleep(time_interval);
> +	}
> +}
> +
> +static void print_aer_recovery_status(void)
> +{
> +	int recovery_ret;
> +
> +	recovery_ret = check_err_recovery();
> +	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
> +		     "AER error recovery timed out\n");
> +	igt_assert_f(recovery_ret != RECOVERY_FAILED,
> +		     "AER device recovery failed\n");
> +	if (recovery_ret == RECOVERY_SUCCESS)
> +		igt_info("AER device recovery successful\n");
> +}
> +
> +static bool gt_uc_wkr_parity_recovered;
> +
> +/**
> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
> + * Description: GT Uncorrectable Unicast Walker Command parity error injection
> + * Functionality: error injection
> + */
> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	bool ret;
> +	uint32_t counter_before;
> +	uint32_t counter_after;
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=1 (uncorrectable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
> +	uint32_t error_id = ERROR_ID_CORE_COMPUTE;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	counter_before = get_counter(node_id, error_id);
> +	if (counter_before < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to read error counter before injection\n");
> +	}
> +
> +	acquire_steering_semaphore(mmio);
> +	/* Arm the injection sequence. */
> +	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> +	modify_reg_bit(mmio,
> +		       XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
> +		       XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
> +		       true);
> +	modify_reg_bit(mmio,
> +		       XE_MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       XE_MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);
> +	release_steering_semaphore(mmio);
> +	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
> +
> +	ret = run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
> +	if (!ret) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to run Xe compute on all engines post injection\n");
> +	}
> +
> +	release_forcewake(fw_handle);
> +	print_aer_recovery_status();
> +
> +	counter_after = get_counter(node_id, error_id);
> +	igt_assert_f(counter_after < 0, "Failed to read error counter after injection\n");
> +
> +	igt_assert_f(counter_before != UINT32_MAX &&
> +		     counter_after != UINT32_MAX,
> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
> +		     counter_before, counter_after);
> +
> +	igt_info("error counter: before injection=%u after injection=%u\n",
> +		 counter_before, counter_after);
> +
> +	igt_assert_f(counter_after > counter_before,
> +		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
> +		     "failed: before injection=%u after injection=%u\n",
> +		     counter_before, counter_after);
> +	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
> +	gt_uc_wkr_parity_recovered = true;
> +}
> +
> +enum xe_err_injection_type {
> +	XE_ERR_INJ_GT_UC_WKR_CMD_PARITY,
> +	XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL,
> +};
> +
> +static const char * const xe_err_injection_names[] = {
> +	[XE_ERR_INJ_GT_UC_WKR_CMD_PARITY] = "test_GT-UC-unicast-wkr-cmd-parity-err",
> +	[XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL] =
> +		"test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl",
> +};
> +
> +static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *mmio, int fd)
> +{
> +	igt_info("Starting Error Injection test: %s\n", xe_err_injection_names[injection]);
> +	switch (injection) {
> +	case XE_ERR_INJ_GT_UC_WKR_CMD_PARITY:
> +		wkr_cmd_parity_err_injection(mmio, fd);
> +		break;
> +	case XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL:
> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
> +		break;
> +	default:
> +		igt_info("Invalid Error Injection specified\n");
> +	}
> +}
> +
> +int igt_main()
> +{
> +	int fd;
> +	struct xe_mmio mmio;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require_f(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY),
> +			      "forcewake_all is not available in debugfs\n");
> +		xe_mmio_access_init(fd, &mmio);
> +		igt_require_f(xe_mmio_is_initialized(&mmio),
> +			      "Failed to initialize Xe MMIO access\n");
> +	}
> +
> +	igt_describe("Inject GT uncorrectable unicast worker command parity error,"
> +		     " and run post-recovery workload after injection.");
> +	igt_subtest_with_dynamic("test_GT-UC-unicast-wkr-cmd-parity-err") {
> +		igt_dynamic("inject")
> +			inject_error(XE_ERR_INJ_GT_UC_WKR_CMD_PARITY, &mmio, fd);
> +
> +		igt_dynamic("post-recovery-wl") {
> +			igt_require_f(gt_uc_wkr_parity_recovered,
> +				      "Run the \"inject\" dynamic subtest first\n");
> +			inject_error(XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL, &mmio, fd);
> +		}
> +	}
> +
> +	igt_fixture() {
> +		xe_mmio_access_fini(&mmio);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index a62f447df..0f090dcee 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -292,6 +292,7 @@ intel_xe_progs = [
>   	'xe_debugfs',
>   	'xe_dma_buf_sync',
>   	'xe_drm_fdinfo',
> +	'xe_err_injection',
>   	'xe_eu_stall',
>   	'xe_evict',
>   	'xe_evict_ccs',
