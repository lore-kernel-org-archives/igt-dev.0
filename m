Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFE6CD3427
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 06:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D115310E18B;
	Thu,  7 May 2026 06:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCxMGmxL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B035910E18B
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778133786; x=1809669786;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oz9IgNUwsM57EgEYx4Q2jel6jYsC9Wez+3OMhvBGuIQ=;
 b=lCxMGmxLZq0H9XAyNAkA57blhvL8SZ1xW3pu665jDb1kn25D6tbkr7DW
 guwdH5PQG3smlQBAP1PXu429vrP2zMfdcA0siZQIDNZJdRYWTGjZ5Ra+p
 ZCQeSYkYViULQxcOIa5YIiOnFGVo4xNv3Ctb8OuLqmMaxCv22FI5j423F
 p0ZaEC9NwYNFflCTdqa5IvMnt9Zncfeku5r5uoVCLPD/MxCRpECMXbwb+
 yHjWE9l2uKT0Smxd5kn1Rx63bgL+zYWDumt9HwXCmL9CfnmwggBo2cdKB
 czTr9opLlEdCPX1CLJg6jZvKg3abX1J+qhhkXqPDhlk3H6U0jEFpVY9RK g==;
X-CSE-ConnectionGUID: LZ8B6MfARlONLobN63FsNA==
X-CSE-MsgGUID: 8C9rFDsBS7Gii1tpeu+lOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90452196"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="90452196"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:03:06 -0700
X-CSE-ConnectionGUID: fpJhsEEPSJusW64epMPlCA==
X-CSE-MsgGUID: kYt3t83uQ/y2OvwF1yZuYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="229975843"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:03:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 23:03:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 23:03:06 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 23:03:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRCRL27gcpS75NhYIIIaPlo3+UujsYsYjIMHJNdLGrdTV3V6p7MgNk0QLUKykBKY/T0JVqhA0kAEdlSyjBrn1uR56/JtuyjeY35UcIFm9+puPTlaBRulChhJBhi9vi0yGbPVGVMLQ8+AmKUipZb5z1MKRKWLzlYnQuuXu03g6WABMwAhZ5gy+3FUfKkRQ83OX1yJehI+8dNqafvbxMqSafFa4IzakZkst/HqRtDTLiK6fG8HeTc7kjS3375zJjQXtvVg5OyEte5gI0ghge9zuekTpxCCG6lnF/yopLU5Bz6Zl2qSGbUwZApbMX16darBzx5vI3VmPbZEgB+QkvAgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0t2yBdx2sXI5S+bFhAgLfe6eP6QLnyFmktW67qQYbRM=;
 b=Rw3hDuAXWRw9pMnVMYtp/22uYoSOOrPJN3H2ibJ7munOVBLqL7oXCHOm3/DVKXsxt7197Y20gXjpdduq9k6WMfxxXYWJx+74LGoqfe6EFWz+IZ5XavcNJSm8y2OlKhugEcnWlO2Y3aDU8AB/7PSzN5m7rAo8ZatpgeW5anYCNmiUdHAWy53q2tzRUVjtkC1v8g4cMudzeFn+84vKwCnucR54hOuIlAM4qiyKzlb8MSuJUKxtKROMWw46jbL5d2VOTBKAeTJQ5TVxCrrjEhJLM1ojz6Ki+vDJAqMNrJF/5Z8YkdJIOPONhPeBvTsFVDrfMz1Svxv4PSid0sHfpAA9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Thu, 7 May
 2026 06:02:57 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 06:02:57 +0000
Date: Thu, 7 May 2026 06:02:48 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <pranay.samala@intel.com>, S Sebinraj
 <s.sebinraj@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_explicit_fence: Rescue pending
 IN_FENCE waits on test failures
Message-ID: <3wn6k535gbcoij5ra5zv3gxr4h7k5adpcqnhswsonwkodqb3yz@mxjpntkc5ccy>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260506091442.2241511-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260506091442.2241511-1-karthik.b.s@intel.com>
X-ClientProxiedBy: VI1PR08CA0206.eurprd08.prod.outlook.com
 (2603:10a6:802:15::15) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: f22eab3f-8188-4fa7-ad35-08deabfe4936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: ETNQodQKqC/xXxJyPGm8G9iqZhWJTqEzlAplgGwB6n5+BAPrJeoFmJaL2iWXgchjdVibekmhDw37aPk6XfSfX+bjy8ibX+gPVLRqLkq9HjyUVUY2JffDfHkeh0jeOXG42WTAT1sw1zOd50J3Cx+8HuwZB6lTBxkcVbMvNHNKI//09HD3m3ba7IjT5lEe6tQX8zUJ1JXEYrvKj5YWiqKnTqvmdBQ9AS3S/E5nzWsr23cYG2TZ8bJBIG3bS70JbayWlt8anfjnhEf2BnmhK0nbKqUWyjJ/Cn8Wk7KgdbikHntj4fMCSiKZ3ZnnT/3FBZJkUbNVHs5yVzJjAXNfeb8dSzw3a7IoSGBbGX4TciMjhvu324lnImM6+tUJrErbgKKkKCW2vuys9XeBg+V9D6m4vEIvrQwkQltN0j3AG7eslRL/vkVzCEaMjzhQUH6OG4bw43QgNTX5M/9JCfUB1TywoFdP1TKWRPdwuQhxNozLicWYPFg2JPBshs0IqnqpKOtHgViIGFj0d/vZVR28YtCZdsU89Q2iWBrZUbJ3ry1DshC0RGkiUBl6hwxOgpVk160lvk9Wgk0pHn4YK6b/XV+yF/0wLje3dvgUmMlY+MmJdwTK8YlXi40KYzhn8bLrV//U66SMB98TPmcteU0fvriQ81Y9rNS7NJaDyJeW5tR13my6TZA/65gGpg5OxsX7TGoC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFo3SUlyaXNYdC9COVFxUkZtWHlqOFZ4UVh4WElsdGtLRWtPNFlzcm1GSGZR?=
 =?utf-8?B?ODVMTk1NVnV2aW1RSktWb0FkMjhEbUpPYytzQ2dnTzQ0blpGZHNCTnFlbWxn?=
 =?utf-8?B?YlZoWWRuTVo5YS94ZUVlNC9SNnV4ckVnZjh0M01YdkJhb2FBR0pQeUhOZmJO?=
 =?utf-8?B?aUg0a1ZaandNUE1RQnV6VXIybWlBWm4rMTNVVFFST0RaUGtHc09KMjF4QXVC?=
 =?utf-8?B?SmVDZFJITlAzUjlQNWdpcU5IQnYvdWo0aGM1UWJaMGdpUHZHVFRJVVNOaW1N?=
 =?utf-8?B?R2JaRnNDYTRSVHJ6eGpZT3FEOGJ3c09PcEZlaWZmM0pTZlhqVHQ1ZlJQMkM1?=
 =?utf-8?B?U1ZrQnNRdjYwdm9jSnNKVUpUcll4OWlxektNWW1xSUY2WXdVRFlSaUlCa05p?=
 =?utf-8?B?bzNEK0FyVXVQWWJHNFBWSUNDRmkxbDRGQTZZbHU0VTVHSGdBY1B6OU90N09U?=
 =?utf-8?B?dFIwZmdkckhkcktSTDFqeGoxSEZhdXM0Vlo2eG1CeHRYK0ZwY0FKYkNBeEZH?=
 =?utf-8?B?QlFyaVB2TTFRMmFRVVZ4TlZISTlnVVhIcjRlZXpZMVN2Rm1pMkdFczBOMTVV?=
 =?utf-8?B?eGFNMmJqUmRvdjJQQ1FjNTNtY0QwR1VaYllqeWZ4SU9nMTVnOEFwZlFlU1pT?=
 =?utf-8?B?eHQ4L05hbWg5RFNWRjU4QVg3aTZhbFc2QU5aOW9nZHVQMnBwZ1g5MS9YbjFI?=
 =?utf-8?B?ZWZBellITG5mOXMwb0phVFU2OVljdkp1T21SelA5bUFyK0t3bTJzOUErbmtm?=
 =?utf-8?B?K3ErakQ3ZzJyV0pTTXIxeFJIaXJSdkR0cWFWbnpzRGdDK1VxV0kzcisrc3hy?=
 =?utf-8?B?QU1KUC8rOXY0MkVlRlRpUVUySjhmSmxwYmt5OUNuYVY2VjFpSlhvVWNqelNl?=
 =?utf-8?B?YkdlSVptcHJjMUhkVEZwRWIvSHpXZTlocWVWRkZMM1p5bDFtUThBdlp6TU5P?=
 =?utf-8?B?MkZyTmNlNEhiWnhDQzVhOHBLUnp6WTh1V0NVV3EzR2t4Z2lFSVlPdmFIa2w0?=
 =?utf-8?B?dWhhSG1VUVl6VEpja1VkMXZsVm05OUNuVUpxbGo1RFBRTk5lTDZsc1JLa0pU?=
 =?utf-8?B?QXdNRVJDdFUvK2xMU25sMTVqUWRIUlhQN1I2OEFXVEJwUXN3Q3B5UTlGRUhq?=
 =?utf-8?B?WDhhWTJwajJoTEZXL1dCc1k0RlNwdlpiUDBEa0cxUE1jUGlmRy9taU4yalN5?=
 =?utf-8?B?VWhqaURvQnVXVFdNYm53QmlmdDAybkhGaWtvVHQrTVpJRmVTR21QUWQ5Qy9F?=
 =?utf-8?B?WTQ4TlZ4MGU1QWx4aDdhTVhVeGM1SmdDTGZEQTVYT0tVR2ZxMzl3Ty9JUCtU?=
 =?utf-8?B?b2ZSRXgrRGpkZ2ppekN4dktUdi9DR2JaUmVDNzFDTGtISHpBT2I2SGVMUlAz?=
 =?utf-8?B?VkVBTE9DYlIzdW0vTytGNkYzNW8xdEVRemNIYzY3YTFOMzNiT2x1YnR2OFU5?=
 =?utf-8?B?MFVDTkxQL2dUeW5qU01JSU01K2Zra3ozTzNhdzBvdGhlbTRGY2hSZHdvaGtH?=
 =?utf-8?B?ZU5pVTFnejNJMVNEQzF6QkxCcVdJMytqUElyejBCVmZNTmZObDlFeWRKWWhK?=
 =?utf-8?B?NEg0dlBkYXFSaVNvR3gyaTJ6bzBDSFpHNkRTTUt6OW5WRjFwWkI5VlRlczhj?=
 =?utf-8?B?Y1ByamMyTTBleGJuVWRVcXVzTHlnMzB4UnI0Y2JXSXRvQXdUZ0tJbDArNmVq?=
 =?utf-8?B?OU95Uk9keXBmckJ3NWZDTWJZZGNFOS90bGhiS21zL1JPTFRHaW1SWCtJeUtR?=
 =?utf-8?B?RkpMOWhEei9NMVU2Y092dHdvbGtaOWlYU0JQc2Y0eWtHWmRqMlorMHlOYUU4?=
 =?utf-8?B?aE9vak5neVVPdUoxaUJGSHdHZDB1WFZudnRxOE9VNFlqU1daM3I3TGNXRXJG?=
 =?utf-8?B?TGNKMDN4TldhSzZxY3phU3djejN4R1VzOG1kNHVwM0JJMzY4WDVxM09CbkNy?=
 =?utf-8?B?ZlAyK0tDZ2U2NHlLSnc3SjFSc0lMZTJSL1lOcjM2N2o5Y2RZOVViMzdwZkZy?=
 =?utf-8?B?Wk9zSnF5alB5clVTd1RwQnhtZ3BsVG4ya2VSeVRNSmhKQjY2MDRVUXhsWE9N?=
 =?utf-8?B?R2luUnNpVnBnK010cUJOZE9mMllkN242eE5uVXZJN001MWhHWlg5RVZUdmR3?=
 =?utf-8?B?ajJoT1V0dmM4Y0lXYTJZTWE3SnBodElMMVZXTGRuYUJJZ05iVjBaRmpocWF4?=
 =?utf-8?B?ZysxVXdaTDFlc25qZVpRbjF2OEJiN3A0ODZ3SjFFemsvM3NVNk51a0Q0VkJI?=
 =?utf-8?B?TTBrZWh0RVM1WnA0RklxdWQ4WlpPYVZydDUrQ1VCQ3NldE1zL05xM09kV1ZR?=
 =?utf-8?B?VTlFL3lwYWZnQlZ4cHQ0V2JqL3BmM0lRZDM3eHF6WGlpRVRwMlBQaS9vYkZT?=
 =?utf-8?Q?COKLkcT/7OY4QeJw=3D?=
X-Exchange-RoutingPolicyChecked: wCxSx4pSfg50dpU+MhLIW2wEi5+tnTOozIduwehMcFZHyL28cg9EaUYJJb+p9B08zVcOYG9zfcd4g7ltA1TaWOzO9tfoqPWPROyhy2xWQEUFgnPf71npu+IJBtVAoXsgSlmajSALeGP5OAnFb7W32qrPk9oYXAwCaCQDNfZ00wmAJ8d3VZerTDfswTGivw9Sn6UTmentbBM4qCqcefdt+Emjvjnba2vn1gdVvRw+mKmPsHFcfZDSFAK3QtYbODHocZB8O83oCzoH++WaGDhNMbxMDlu5BQC/tmcjAr+iS2SJ+KXegoDzMXKeDBFkz+YVpMc4PAhNTqjMkI86O1VfpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f22eab3f-8188-4fa7-ad35-08deabfe4936
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:02:57.5620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r089829mGs+CrXp+83ZcZ75tEQ/xi1ogBfEuRQbyzBpJJIfHJtQpV/xnYkUpDmZhBk4faSOT4g9I9Celzc8GoOD/1mUYYj6MUaAGwnxSJmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
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

Hi Karthik,

> Track per-plane timeline/fence state across the in-flight NONBLOCK atomic
> commit and install an exit handler to signal any still-unsignaled fences.
> This prevents cleanup hangs when an assertion fires after commit
> submission but before the test signals the blocking fence.
> 
> V2:
>  - Drop the redundant 'active' variable
>  - Reset timelines[i] to -1 in signal_pending_fences()
> 
> Cc: S Sebinraj <s.sebinraj@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Reviewed-by: S Sebinraj <s.sebinraj@intel.com>
> ---

Thanks for addressing my suggestions.
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
