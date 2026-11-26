Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E67E606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ke/q+3Lh;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TqyS4CeT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FF510FEA3;
	Thu, 26 Nov 2026 07:08:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3DA112096
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 07:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795676816; x=1827212816;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2Vyxv++PkU+Gibo+iyYBgWECokEM++zzgOwJZ9kYqpU=;
 b=Ke/q+3LhY8jz6dQ/oSA4BurVToMe0WZQIqHPl68+bfWlRCDac3t7Ov0b
 NZQ+dl+ZGT8zIVVKbsei276Rx34JJYO0/Sd1qOCwsIsCFxzEI29xVNJEv
 mXXpug6h2BHoq6M3Q6ZVNOLKPK1gIvL4b3d0CIuM2AlQ2ETVeQhoO1fHa
 p8CVW66BsTn5cPPt3HqZjx6pmW7TxtpKBV5oLyKuB1Dx78VosDyfHqkrB
 umBzCBlbn48AkGQPDtGQQPuEcTP64CRQRw7n8rLHwixnZ2eK3Kcnlep7V
 qfCCNvzzOvK1cKSCvfegz3j9qu7t/kqPhAcRv8ErEr9PZqaIZvpiuxyBv w==;
X-CSE-ConnectionGUID: AlR14LdeQyu//fFvIEWymg==
X-CSE-MsgGUID: RGoB+NT4Qpiji4X+bPuLBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4478572"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4478572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:06:56 -0800
X-CSE-ConnectionGUID: rhS//oOkTsC5kzOc0xW+XA==
X-CSE-MsgGUID: jONHjCq4RzGHY9wKaBiG9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12131636"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:06:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 23:06:55 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 23:06:55 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 23:06:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrWelWikEc0MKBF1/EW624FlNQVSm0ncpl6llmIyAkUeFwnPa3xudyLjL8L4Xz7iDOZie6g4LWj0zcSR6eR/rAKT0B2lYeMP3cupo2C36lSMoHN0MO57guNFMK/VL8VPN2kx50TdyCRVuu6IB3MoK0tpSqeifLm4IFwkNxW/6CvHhtY39mZ18jSCPLbfRvw0QUbzLR0LPt4K2aN8V56hFj2wDWEY8Is6dNeEAdHBbo54nPL6CkbyZSJGlauldyeJIYw5W/hQIo+FHWzTitQi4/9IZuVG3cm/dx40Sayd+6I5hCh9dvCbfj3mcYtxmBl6Wmu+9054Uv+XCrArntZDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfWkTpQgOPJBeLKtO+zgOBnswHnaUxZ9sR5YghEh+PE=;
 b=ZbY1QIZR14wGHFpkf1NYrmz23hEQOBrIIedni7gO33LE/xSpuMX7GQ3lLD6xbeYr/YkD8LEFjAql0z8HmB3CG8TcyqA8UMmJNA5vSWEVa1cTXX1p93lXHdWb4mv8sTav8NwsLGl+Iaa4gjovf8TTQ3k8L1x3HRer9LdR8VEqiUPh72tMmRIRuqaMhODotItwhU2CWDWrIkrCdDqWm0TyNOow7JamaWGr6qDbG8n4T4q1qghJUjGHUKNTV+pg1upDghbqWNXD9ZuEiH7mmhMBLhlCALufwfidAE8QmPfgLDDsSzy1p9tKyjISEuqjh4QvXeijY8MvELC/ec7WttHNcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfWkTpQgOPJBeLKtO+zgOBnswHnaUxZ9sR5YghEh+PE=;
 b=TqyS4CeTp6g8PoWSnfKZKwqtwJHGSN8DhIMPM82uksDZxmUxRT3EXtMp+V1Ke2gFBlNFUJS/OADOedBsdyd1xs+xuq+kmjK0EJfRVQsOE1E47UzckrsVNDxBYMNev3P/xGhtP+4VvzKCIYKWtOpdb8NAxPELNSzZfokb+3dyYOg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by IA1PR11MB7368.namprd11.prod.outlook.com (2603:10b6:208:420::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 26 Nov
 2026 07:06:46 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 07:06:45 +0000
Message-ID: <23b2c1a7-a359-4e2b-91ea-7e3543f3ee49@intel.com>
Date: Thu, 26 Nov 2026 12:36:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] tests/intel/xe_oa: Add an all OA units variant to
 the unbind/rebind test
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <harish.chegondi@intel.com>
References: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
 <20261104005505.3232485-18-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261104005505.3232485-18-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0325.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::17) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|IA1PR11MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca55c5a-f3df-4282-77d9-08df4b8bd4cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|261009223027099003|22082099003|18002099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261022113327099003|56012099006|4143699003|261026140227099003|11063799006;
X-Microsoft-Antispam-Message-Info: jA4Qdcty8ZFI43xfmvTF5WXmoh5YGLh70w4f6A0dbXZ28kTr/UWZCrLaCiaBBYSJSwErVOgUyw9Hmll9h3Je1MBxNBQDz3/HVSgcF60gfqsgMCGdsaG3hpYAZiUzunPN8Y4h8PtvbhBpWQit6jJ/nBDs72qo8YtQdD8oDcWiIb/AZ1M4xrFtpcndGjImpFZOenUDmjyK2qOr4MIigR4t7bjzvF5A/oIB+q3QGBXA/OC2MY1NzKNas8+brLCS4Tdn4HfBHYnuqswj324HZBYe/a6XwA3sC4tSBxQ/DsE4IILmU3wzm1Q6TSfDlhr0+hwZfRh1cQKpVk2N3bC/S/RKR3TNcy7Vn1Fbj383yvXdzi830fbGEfW3uILvGnScQQRkFNIU0Q1c9BSTnLAWrp2nFEC/mnYNvDCmu00fZ/H182BgUjM43v6n7mj4vK6lTFYgmJ/iXM2jZJ4YssXvKPuYtuVuZPynXF8XMfV4H9hMHKzF/z28JQ96cp8nCVkfz+GnHq9P6fkSvuuP94q5Xo0uHmRtKqiRljQsVc7R55vRT7zGdVMoXxL6RPYOz/Ew0h7CHI7gvcQjlnFg5mJZMmjzNQOrseTRopQJwS5FRo7ENAM/tZViu9CxY/f6TBw2p10c2ruSl3XGljwL54maDdKraikJhrc45rnuZ8wPDtkc/14=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(261009223027099003)(22082099003)(18002099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261022113327099003)(56012099006)(4143699003)(261026140227099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVdmaVdUVmlGKzBweGNrVVI4VncyYkgrOEZVWTlqSXJOVlpmVnhYN1o2VG8w?=
 =?utf-8?B?TWNsWE9CS3pHdC96QUxlSlZpUm93cjRUeDMrbUV1VDFMY2grWFBBN2NvWkpW?=
 =?utf-8?B?Y3poOGNkcmlHUmJrMG4rQkpFU3NsQUM5QmN3eVZRbkQ0NzdsM0xlUXlaa3Ex?=
 =?utf-8?B?Y0tDeUdXWGNPWUNmZU5mOTVCV2lGODlLekxxbDhSdnV3L0NuY2JDRmM0SzZz?=
 =?utf-8?B?UXRNVk9ldlNTT0tYUHBuWnpDcXdJZzFjcjJkcENqOWlxMTJrY0EzTVJhMG9s?=
 =?utf-8?B?R3ZlUkF1Wmx4bGNyZmUxRGV0T202UjNQTGJFc0cwSGNRNUIrUzY2MGU3eitt?=
 =?utf-8?B?MmhlVnd0MG51Z0dlVXRCSkU2TTJueGszU3FJYmNsOFVHeG0yRnNxalZsdEwx?=
 =?utf-8?B?RkhUbFJ1WmJFYnBJTTk1TVpaYXZHRFU2YWJ0RFExb1ZBWVdXZlNsRU9ncGNp?=
 =?utf-8?B?cExpRWk4RThWS2dJRXpabVh3d1VFaXM3cGYyMWlZUEFIYlVaUTFhMjl6S1dX?=
 =?utf-8?B?aFlMY2ZCQ0tESzdWbjBtZFczbEt0WDN4VENDaWtEaVMyU1lWNk42Sk16R0o2?=
 =?utf-8?B?YkZENHNZVG43bG9nNDlGTGkxSXpsV2ZIKzlrNWk4U2tKMG1sNVZGeWoxSVY2?=
 =?utf-8?B?Y20zNWw1cTNpZzNVZVdEZlpFTnpkSmNoUnhlVFY5ZHV0azZSSytCekJ3RnlC?=
 =?utf-8?B?VFNpQzIwZ1U3N0pidHRyMjdQTWIwODZmalRKNWtIYUxQM1A4S2NCSlp1akd3?=
 =?utf-8?B?cUhOdzdwR1VWaE9ma0YvZE1WeE5yb2JQeTV4RlRjVUE3NzBvUHh5akZLb0gx?=
 =?utf-8?B?RjJTQzFvcTJOSVh2bmlLcWpBVGFQSlBPZ1E5aE1oT0p1NUluZ2oxYWsvMjBp?=
 =?utf-8?B?eXJ3a1FUYjNDaHZzN1BUN1hFVWxOTTVpN1BSWlF0a1N4RkxsY3g3MFVvWm0x?=
 =?utf-8?B?S0szQlphVmZFYitmMjF0ZThidHh4cTdsd2svWGlsRFFuM0UzVFFsOVNnaDdr?=
 =?utf-8?B?eVk3OHVNWExzV29CbStkNmpVMnlBLzVaSndKemVoTFNmeFhaTVpkOUE5eDNS?=
 =?utf-8?B?ZmY3Rk5mVkdZMngvQ2FJMGY2aUZDamhMRW1WcFl2Ny90bllNRERrdWhMZmpp?=
 =?utf-8?B?Z2oraUxjR2M1K1FQZjNWd0tLSHdnZTFITTlSVzBIaUh4ekNQdVFkQ3l4c3ky?=
 =?utf-8?B?TTN6VTdCRzdYQnR1bklzMEIzVzZnT05JNHJ2UksyRitLaVFJeHUwbmVuSC9l?=
 =?utf-8?B?RlJTQzU4aDc3ODZtcnBZdUdiK1NtRW1obUtlejAvakNpUHAwbitUTnJDTVBQ?=
 =?utf-8?B?NU13ZFhEL0hUQTBhTkgzQ1o2SzdaTFg2WkdhdWFMVU5GemplT2xTVUllZk9Y?=
 =?utf-8?B?T3dTN1RzSmpYUE85ZktZaGRpNHZkY2JtM3kwMUhpRmwzUFVvaVJBKzQwbnR5?=
 =?utf-8?B?OUd4OGthUXdnRkpJcmhiVGNObzYwVTdoNHhERHRla2ZVYTBRUURWMWgzTm5y?=
 =?utf-8?B?WVpNbGJHN3c0QWZ0T2dwSmRVakovNHlsRWE1N3ZGZFpxRWp5RS84ZDhFcCs1?=
 =?utf-8?B?NGYwZU1oUFA1SlZ6ZXFmTERFcDJaSjFXWFA2Qk42RWZxM3FGK1Z2SkVJcERW?=
 =?utf-8?B?N3dMZU1YcEJzUEtLT3dDT2lsSlE4U1REbkR5TkxQdjBzaWpiTnZXRzBhbHNv?=
 =?utf-8?B?dnJGaWQ0UjlBb0V0TkRRaEg2ZnpaTm9lQUJERmg0SDNwUGNLdjdyeGpGUlA4?=
 =?utf-8?B?bVVsTmJ3c29LeDdUOTJ2alovRldaMXZzcUloUWhiaEpyUEdXc2JMZ3F5UGpR?=
 =?utf-8?B?NHNkVWtpQTBaWElYWjNTVXlYV3FRUXFBNWFEV1FQeWZFWnI0RWtlTDZjdzhP?=
 =?utf-8?B?UUNLbnp1OU03eTh0bVZMeitmK2FiWlBIT2UyRDEzL3hIdWxZRkRwL0VCT2t1?=
 =?utf-8?B?eVdBRzBva2l5bWtha3VMeXloVUoydHJaZmdqN1BHcXJPWnhWRXpKekRuVkVN?=
 =?utf-8?B?K0pza3l2OTUzSEFDVHRiMCtkNkRNZXQrbFk2RVVPMGNWYVUzdkFna2FnVEZQ?=
 =?utf-8?B?aDJUc3p6cnJvL2trNUI0Z05aTFEzNzYzbC9ra1pBbW1Ba09hQXFvNG11NDQ0?=
 =?utf-8?B?Uyt4MnJtM2hHL2RVZTg1T294OElBZWhRZFIybk9EOVM2bEZSQjU5OUpORm5k?=
 =?utf-8?B?S1JCWHgvQ0lvUlZSSXRTeFNaT3lkK2o2Rys4dGx0dUZ5R3locFNtN0J4ZWN3?=
 =?utf-8?B?Tm9xVDFXeUgzbzE3TDgraXVBMi9NYTA1dnRhV2dnOUdzVzJ4SFpqbkN4Nldh?=
 =?utf-8?B?czBUYTVqUkxHMUhXclExSC9EYkNtTWNyUG9yRlBwaHNDdjFaVFB1MXVUNGkw?=
 =?utf-8?Q?TmeyJ2gQmjczCcmM=3D?=
X-Exchange-RoutingPolicyChecked: U3FLRKt3oYvvS0GKfRyvtU784tLtfv/gEwQlDbKBvNT33JFR0c+dImepMUWqFNWKetxGMpJaVfXZQjX86sajtRkAHWgJISZYloWCea7uv6bNkIWkBqwDtP6uyXI37H4RYN6DCz/chpiSsfd3+2Zj1XuRfDRH+6Czd7YcOEHz/cgGLmmI60yqvbThkt51zLGkTfuAVlle8yg8l2gPn8xuPWz1OvwMRYYb9UvHdW5G7Xii9qDAm53dzJyzgd9BfUnMT4b8d0+Ced6HKQvB2C3trbjStu4AqADVIFgWshFmo0X42hyoRuFGUScioyz4GnW9oMV5loK8RNRdh1nAGDrXXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca55c5a-f3df-4282-77d9-08df4b8bd4cc
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 07:06:45.8161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQ/iREVaqFgwezCh8A2aMABTnBRaQrooDFa41yQ4kaPkfwB3yMDP9hhfVEe5WcuMjReIAXBng05NkOxsUuRnUWcjzPkkSxgCJbysziDtkgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7368
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


On 11/4/2026 6:25, Umesh Nerlige Ramappa wrote:
> Open a stream with a mmapped OA buffer on every OA unit, so that unbind
> quiesces streams on all GTs and OA units at once, and run all checks on
> each of them.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tests/intel/xe_oa.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index ffc1971cb361..4eb0b13f00b1 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -2867,6 +2867,7 @@ static bool mem_is_zero(const void *vaddr, size_t len)
>   #define UNBIND_CLOSE_BEFORE_REBIND	(1 << 0)
>   #define UNBIND_STREAM_DISABLED		(1 << 1)
>   #define UNBIND_EXEC_QUEUE		(1 << 2)
> +#define UNBIND_ALL_UNITS		(1 << 3)
>   
>   #define UNBIND_MAX_STREAMS	16
>   
> @@ -3152,6 +3153,7 @@ static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int f
>   	struct unbind_stream *primary = &streams[0];
>   	const struct drm_xe_engine_class_instance *hwe = NULL;
>   	bool disabled = flags & UNBIND_STREAM_DISABLED;
> +	const struct drm_xe_oa_unit *oau;
>   	uint32_t vm, exec_q = 0;
>   	int ret, i;
>   
> @@ -3166,6 +3168,14 @@ static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int f
>   
>   	unbind_num_streams = 0;
>   	unbind_stream_open(&streams[unbind_num_streams++], oau0, flags, exec_q, hwe);
> +	if (flags & UNBIND_ALL_UNITS) {
> +		for_each_oa_unit(oau) {
> +			if (oau->oa_unit_id == oau0->oa_unit_id)
> +				continue;
> +			igt_assert_lt(unbind_num_streams, UNBIND_MAX_STREAMS);
> +			unbind_stream_open(&streams[unbind_num_streams++], oau, flags, 0, NULL);
> +		}
> +	}
>   	igt_debug("Opened %d OA stream(s)\n", unbind_num_streams);
Right after this, from the previous patch, we have:

     if (disabled)
         unbind_waiters_start(primary);
     else
         unbind_stream_check_live(primary);

and, here we only check the primary stream.  In other places in previous 
patches, we have a 'for' loop to traverse over all the streams.  Can we 
have a for loop here as well to traverse all the streams (which is what 
the commit descr and the code here tries to do).

-shekhar

>   
>   	/*
> @@ -5713,6 +5723,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>   			{ "open", 0 },
>   			{ "disabled", UNBIND_STREAM_DISABLED },
>   			{ "exec-queue", UNBIND_EXEC_QUEUE },
> +			{ "all-units", UNBIND_ALL_UNITS },
>   		};
>   
>   		for (int i = 0; i < ARRAY_SIZE(unbind_variants); i++) {

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

