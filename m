Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E82606A31D
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I6dsj4VP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCD510E496;
	Fri, 23 Oct 2026 14:43:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A60210E496
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792766561; x=1824302561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qZw/k/xzO0b2AdvsJ0eNWSbZzXCjDL9YT7eCcoykqWA=;
 b=I6dsj4VPhfsmZGbNLxkmwIfVxi12jKramz/V98Mm1q+lXc8/2tAEIVzQ
 MkeYJDKxzGQFzO3wHEVjvG8Buc4rI3s9/Luw0A817JaJws6fYgitFyV8R
 wDRuvhyuVLNJWnpNv0t4i0xQH6tzgy8/QU0h/sjfCObvKVwgAx9+YOTs2
 h4+jvVvhsyXkK/VaH9DdNbTOgHwZi+aTBbDD5hXp0ANPQHRNBRHZyFIjk
 U7WYjGsMmXQYtHEbxojFzu3dq/KsLtK5EhL1vsUPw6zVsReF6J+LWGnM8
 gjiynC5+BFn9vuS2NT78abh3+xHTBzE4UBzjR20qWj6DKxKCd6QCeHBCg Q==;
X-CSE-ConnectionGUID: Bmn0gHTsSSSNj6fkhbht3Q==
X-CSE-MsgGUID: gH8wlTEdR5KgZxMbwoLWAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1632997"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1632997"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 07:42:41 -0700
X-CSE-ConnectionGUID: 5Hw7+FajQUStJdnOJ1MZIQ==
X-CSE-MsgGUID: KglxQyCMQBGRcT9GPTl3yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3597762"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 07:42:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 07:42:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 07:42:40 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 07:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5QSxakBeWgms3dmyeZK0wKmZszCPaaweLAUTT+YhHYy3oonzTO1ummu0FECMzM3rrp3cBRoN04hcsia5ZkxyvHotuBxHifAQ8vREUoGIEwESfnV5O+WsOdVSuJYOmESX3fiktUbHF8CwJADCRxEIfzrY28YpWUQxhfsMqG0IFQrgtlQwczACWs4YEb746DPpKPf5Ni6NXRGXVmkF2kPaeyIPOirYJKI28+BLZoNekBGRLVWw9c0CvhcZz+wj8BuDetH8G56rZxX4tzTBJ0Wwt7orO+ZL/9B4OeAK9laXx5FFrblFCl3ZnNFJoVmmpqAvAzB+Z/SCrRQ49xGHCsXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYq8Vy4EEdOX2Ct/iOmAOSUu5K7Oo8hi2Iiw5Ke3T1o=;
 b=Y2hc2iEKFfXqRYILJgpCbx7Ku1dXAM7CUl9hBC+ddzXujVV76lSrM05BWvoG19OlpzeRePlqIfH4GcSSleGtFTCA5ntLzTk7TGVDa8YpePX3K7EqKFRCW/JeeL49+xdsqSXh63jqWRgmYqhQSwuUBKkRl973rY6FyprdV7F1LzIe/NflHaQvDpJp6VyTT93Do2EmkY017xmu6DYi5n2Ot15/WE5jHMqAqmRoPQ3lCbRHXyS+AzYLmck/T1uOvoKd9I2l7h/DYegC8rllGFQBE/FYFAmRcyoe5EkKeIT1Z9TQHJsKrqnsid262qT7Acehq4YQ9rDrirSWOMSwakX0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SAVPR11MB9549.namprd11.prod.outlook.com (2603:10b6:806:4e9::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15; Fri, 23 Oct 2026 14:42:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 14:42:37 +0000
Message-ID: <eb7097e6-05d4-4a0d-83bf-fa4d2cf58d71@intel.com>
Date: Fri, 23 Oct 2026 20:12:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Soham Purkait <soham.purkait@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
 <20261013190651.897241-8-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261013190651.897241-8-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SAVPR11MB9549:EE_
X-MS-Office365-Filtering-Correlation-Id: 254ff774-e1d6-463b-5b41-08df3113e18a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|261022113327099003|4143699003|11063799006|56012099006|261021135927099003|261021121427099003|261009223027099003|10067099003|18002099003|22082099003|261022105027099003|6133799003;
X-Microsoft-Antispam-Message-Info: YBPcaBkh3GImIQw2sGSyytynR4+0R283DUZN2AxY1ux1bQGIvlQEy+V5PjOONKVrsee4QcRJzrixmvmWJLr8gd1jfalqc497Em6bLBiDhz0JdXucVHXVDOJRrMkVsctJO8sfZK5I5mbXpSq3VXE7vb3+aQquvHsaLgJwyR6LYpVb/ZSA2tRYBvIi2ifJketuVoS3Y/lfocrTZ7zPQ7oxiYEIaGeErxfKz/O/ZHS0qd4E8x8wnIKetWUpiMzbAQ9V4wvSMKLkP+40t7yLsM/5nmC05eG1lXX5lzaNS37ZgM1CE9qj6RuYu9qOUSTzWHl00py8/elrIP+4I+Wd7p43LKc2m2dgCxs2tFhJLWcAJRWeDml82D/kcbvYHqiPHcVckkCfbxqbPnD7Myq+23VxhcFIHbhtZy+wUMGBPR0oP2bz5MsAh+HsrskN8Hb1MWT7fvw5PJ4oWSzC1NXlUXsHajmddKw/MZ7COwAUVXgAwXHkCg7H0eEEVPtR+5hxMhffps2i04EKVBSXfPSIdhK4NST5ioElG2eaE/JBK/yMN+8PfLcawa7C9MJcvpRJIm3mOi8vaT3b+bfvhhEqKBkkpyBrmyD5NZM2R9AaugcqwpT/RYG4PdCHvGtxy9txBpwgxa3TVLItnTinEv4y1dKAV8If8q6vU9aZcCjtzSYJ4j4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261022113327099003)(4143699003)(11063799006)(56012099006)(261021135927099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(261022105027099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0llbGZmYUtCTm1nWHFBM0YxSDNzZHNkQ2JldlF0Q3JlMy9GT2k0elFZYm0v?=
 =?utf-8?B?SmRJVXNEY29SOUEvVHpVT1doLzVHYmZLMDhWK2FrYk5FOStpYVN6MUpKTnU2?=
 =?utf-8?B?UnFYdUdjZ09XS0RoTHBkSXhVSUlMU0Y3UnJkemhBWEZXWEg3eUlnRUtYb1pU?=
 =?utf-8?B?aGpqK2xNNk9lb29TQTdhc1N0SG1UNFNJK096eURPNzVDY0dFYjlad0pOSjhN?=
 =?utf-8?B?RVk5WU5OZmwvOGd0a0duZFlLekdPcTJoUW1UWTIzUUF6YXUxMVpRZ1JBVU55?=
 =?utf-8?B?ZWxtYVZMN0FwWEtHM0M1U1NrV1FqYWk5d1BZb1U1ZFk0TlZIWXhadXNKUEpN?=
 =?utf-8?B?bktuZUZzNkpGbGM3VWh6Y0lncnZyN3kzU0s0aE1rRXFOUWRHV2Z1Y1g3S1BB?=
 =?utf-8?B?UEJvNlZRU2ZQd1NlS3V6bklKaUd5MDBXZWNWcDR4ZzZ6NUpscllndGJLS3Ri?=
 =?utf-8?B?eXp2NnZGWEdpc05uYXdJSkxTL25WMis5VGlId0RwQlp2VGdrdzdKTHI1M3Zj?=
 =?utf-8?B?ZnJ0bzl0ekI3T01kQ0dzTUVhbWFOU1ozUFpnZlRPdkxMUkN0bTFCN1R5SW10?=
 =?utf-8?B?U3VrZUt1WDk0OElZMnFqVS81eFNmYlR1VWdYWTlia2R1Q0dJNmdaV0hqeGtU?=
 =?utf-8?B?WmxqSk54c2dlRlYzYlEzVHdaZkwrRDBSeEFvZ1RhTzlKRlE5WDkwMUE0dWhp?=
 =?utf-8?B?TEg0WmNINWFPQy9UZDVDNmxnTDU4bHFvV1Zjbm96ZGlGdzFIdSttenJRdnpW?=
 =?utf-8?B?UHpsRzR4cldvWlA3UlVQSHRlVEkyQTQxYVJnLy9KRFFyaTVKMEsyOURIeXR0?=
 =?utf-8?B?dllqV2Y2SStRMmtXeDloOVlXR2N2a0R4SDlOWSszb3JMV1B1ZUZoa3FPR1NP?=
 =?utf-8?B?MXNucnhmZDNtZDVzZUJ6OG5ZLzB4TkxnRXM4T0pjTE9FZWZydXpyWnJlK0JD?=
 =?utf-8?B?MGRuMlkzSmxkMm12ZEZrZGRqanMvZ3psZlJOa1BYcFh3a0hXaDZKQTNFdzIv?=
 =?utf-8?B?cUFTYjI5QmRkMWhEM2FhcjhvN2lDMG04OGJRWml2Zkg1TERyMzlxU2Q3ZGtZ?=
 =?utf-8?B?SnZJMWFUd2ZSL2Njd0hZQmhTeFVjRExWNURUZ2VtL1FkTUxkOUVUVU44TUpY?=
 =?utf-8?B?Y3kydk5pSWdVZDJDWjZSYTV6VDZnYjYrVlBpcGgvWGtrQ01zdUtjc1ZqSkI0?=
 =?utf-8?B?T3BGSWxndWs2OVpWajdXZy9aTWxKQ3pYQzNwcWhjL0dRdE1sZ0FSWG82SFp3?=
 =?utf-8?B?NjNaSVFNOGNlSUxIcmNzaUtoU25pRXRiY0ZNcUJ2TXJJYnY1NStFU1RHN0ht?=
 =?utf-8?B?LytOZVcxc2F3Qkg0bEtRdm1YYzdkTXZHUDREME85SSs0U2RaV2YrVnhNTE9C?=
 =?utf-8?B?dXNBQ1RmR0NxT1Rsa0EvcFc4Q1IzN2VOcnlnZ1VGUjEzY2wvdFJhdTFtOE1t?=
 =?utf-8?B?TnFUM3RwSzF1czRQTHl5WXlhZGVUeFVVbThjdzBHMVNXRWk0ZkVjTmh2UGln?=
 =?utf-8?B?RHZOZDNmZnNRZjBzdEgyUHBUeWJTdzVpaUpyWnhHaC9uOGI4TGdJTzBzWFZw?=
 =?utf-8?B?aGRHQXFpSHZkMXpLTGM5M3B1UUZycDZBUXJ0Mnp0NnFHUG43RXgxUXY3cUdP?=
 =?utf-8?B?TTYwQ0wwUmNPRlBMdFdxTTRzVHZWSGNZUFlLOFY2cVQyN0E4MGlSNkRMTEoz?=
 =?utf-8?B?WFZjdmo1enRaQlhndDNFMjBSNk5XZEU4Tk5rT1p3WHlZVnI3Y1cyTHRKeVJt?=
 =?utf-8?B?QkVjSXlsdVlZeTAvL3RWNEVMYmRNUDlJNXI0ZEpTSWhFbXFJSGl1czRTWkp1?=
 =?utf-8?B?YVpFcThNdjZRaHdqenBPdUN4cFYrUTF5QlZ6R3dOdUVVQ29uOUVqZFJUSFpQ?=
 =?utf-8?B?TEFuTi9jZzUzZHliYnFiUkl6YStRL1o0aE5GdHVoeER2VXVEK2tJcGZ4M1hv?=
 =?utf-8?B?SFVRWVNKcC9icjROWmZlbnJTSzk4RHNwc1I5cXd6Y3lubE9HTk1IWHFYV2dM?=
 =?utf-8?B?OGdvZENXNUZMU0pXeE1FbDBTeFRzSDFvbW9KZ2JPVUFUbExJYkFVS2MzaGln?=
 =?utf-8?B?OXZya25TdDkySDVhWi9ydi9uNUR2Mzd4U2x3R01oWDlIaTV2VW91L0oxTFJK?=
 =?utf-8?B?enhCVVJMOVJ2SWVGS3JGZkNxTjdKV0F0OW9mMVVUakkvcUlJeEMrNEkyU09O?=
 =?utf-8?B?NzNJdVZZeks2RUNDYlZGS2h5Nkk1SVFpY3NwOUp4UXdoSVM1a0VPWGI2ek4x?=
 =?utf-8?B?RHIvRzUvTCt2SHd5b3U4RHJ3VjRFc0NZUnZDNWlobEh4VTRQdTkzQXJtWFNp?=
 =?utf-8?B?c29HTnJCcElUaFJqQkpTUTVjSjE0ZkR3aElEazBUNjdJeVlLL1R1UT09?=
X-Exchange-RoutingPolicyChecked: twWzojZxdk2wo95xiE5+jvhzA+IsIhHQ4I8CII7hqCI/AhGAAK0bIk6e3El4FoNRUIdkJU21SzWmBGNQFaAtKOnJYiPS1z8UPI96fVfhgh7EawUs0xjyqSTUKQKGNWAnGDEnStJKZvkvgba3apJNj14cOrvL6t86ILvwDDt0ZEkU3S2ydPORBdr/wa5+CC+1y5KiG/x2s6/tMsJWLsJeobw5C8zBQxTewsZ5JUFmG69UbX7lN54poRRl6o9eemT0GiUH3z3w22WUTLByi0iD37D3e/DuZOOXWxD6ZgEbIUL+rObFwECCxszwLzB0SyBuzZ2H9g1NULj0E8THXTx9fQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 254ff774-e1d6-463b-5b41-08df3113e18a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 14:42:37.0006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/Xi7E3elj+qmbhs+YZwoP5wGb0eEdAxsZ9qIfuMYjALuxKAiplHgPjwZM8xjlVzVErovgI8IczyjoLGWlK5xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR11MB9549
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


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

Please check xe_ras test and use same so all are filtered together

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
> +		regval = xe_mmio_read32(mmio, XE_STEER_SEMAPHORE_MGSR_3D);
> +		if (regval == XE_STEER_SEMAPHORE_MGSR_3D_VALUE) {
> +			xe_mmio_write32(mmio, XE_STEER_SEMAPHORE_MGSR_3D, 0x0);
> +			return;
> +		}
> +	}
> +}
> +

Let's exit the loop after a count. Otherwise there is a risk of infinite 
loop

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
Nit: Why not use success and fail
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

Add a TODO for uevent

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

The test name is already there. Why do we need enum to string?

Thanks
Riana

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
