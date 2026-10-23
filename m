Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DCA606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MyYc6QCa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCAA112A65;
	Fri, 23 Oct 2026 09:15:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664A11129DA
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 09:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792746867; x=1824282867;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KgLJxWF3rM5mM5JTLxOk7x0+zbWHTzO4FEH1JyuD9Fk=;
 b=MyYc6QCaq5Npnd7fdOZorbhBeYb3yPjLU1uMr5AYUrQBrfB4zoPY9PWf
 1febwJy1UPZCaCaeaBPjfACyrcPZ5qs3smsk2FH59P4Y28ZT4Hox+CdpP
 CiujRhMZfzL9PzSKUQPLADL19stF0usYuSOMA7RzazY2XJ597D+8H2cDZ
 Kfv4UGKDm0UH6FiPa+F3shRlT+jmONuaIP/+uSk+1mx+v+kKxz8RTzTq2
 SbQB1AU5WTSJahR7Tfam9pmvalVSwbEClTwBzFwUF6rytFPOtCw8cSUEu
 KKhsyHylvlnMaDyuG+k9nCYyhWV/5Kdy68BbdlzpnO4PtB9M/VvqxK/R5 Q==;
X-CSE-ConnectionGUID: 5iB/HESmQzOAslVmdcTLow==
X-CSE-MsgGUID: vwMXjPBtRyWpFWHmz/92zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1525363"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1525363"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:14:27 -0700
X-CSE-ConnectionGUID: LsgOWbazQSmN27jDDIIr2g==
X-CSE-MsgGUID: wGFyPRXPQae3ADH1QgYENg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3683254"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:14:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 02:14:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 02:14:23 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 02:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOSf2g43NBsTx2CfVQS32o7i+6AXn3g7XRjS5BETvGI3nHkisGSmupA1ueoFUBBfVH4ZNDp2TmpO8XWTkS+A3wZmy49TRH40IeEfy8ApfSVjDsbwT7AmFvJS8/boXDZXmZoYef2unsDMOG1Y7q4jmtyauxY7hGMBg52/P0SojrOCJ+5QczApJq93lqW4VwptIgCSms//YIWOecw+DQN4K+q6Vf7evwn8sTSHOwLa54se0euBHCh5SVp+/m+2MZEWPVVpo7K6Ug3Zv8tMDX6L70so46VuVaTFCrYBoD8K/PqFRo1YtbBXWo3sPV37GksEf8BHjeVOyjWJO8FFnu9eMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKh1Zs2emB7mNNlYo8sjJk2oNVjtL53nMjcw6P0LAEY=;
 b=UiezF1Q2zEqpvGwLKnHpLJkxBd4RSSbcssmhJZcvDTLWB5cY5sIyN1vivpjDuv+nwHFLHKWxAUIIlsytX1lKEB2lXAu7OkrOVeIKx3JdPsZE91rq5eY0n3DiRNPM/FAawKEollftWcxgg1QgjO5OTuEjhP1MVdfr6YYZBfGM0PtgsgXOgp54PnO5I93XwFpZ5leAw59L32H6XJiQdebpO7BcY2cgK2mg/kE7UA2C97sFUutCfp15DmSPev80QH73FfSJKLLfsnfT2SdsJfgjM7VzMLciVKMmByfAbQXKB2E2eSoIvkTnwxBv8EEv+UV7loyX1cWA2tyvRQtJ8aBrbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by DSSPR11MB9665.namprd11.prod.outlook.com (2603:10b6:8:377::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 09:14:17 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 09:14:17 +0000
Message-ID: <fcdc4d07-ab2b-4d17-a6a5-6594313991f9@intel.com>
Date: Fri, 23 Oct 2026 14:44:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] tests/intel/xe_err_injection: add CRI GPU
 requirement check
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
 <20261013190651.897241-11-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261013190651.897241-11-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::15) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|DSSPR11MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ee4917-d371-45f6-c341-08df30e60361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|4143699003|56012099006|11063799006|261021121427099003|261022113327099003|261022105027099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: EcDA0+HdPl8pdbQ+FBbXP7g55XKhfWv11AbAiNhqJkvrwtBRd5g27Af4T/e3lGHW4mCCYvO5TE7IvvOk+X49W5IUH33A0bcuxD85ZNoBz0jQaDQY412WZ4mQn2Gvfl3QO3h7CCa8ZqvfXhaUus8nPoL0OmX0hD/OZUmWRlalZxrEHjsP+Y/QzcB+GppdinWntuIWOV5VB7z6zFOp4c8ZjY5tzM/HKPVuIzZKTtbWu5i2BkASjAFXPoC0L46x4QDONk6ZIUXSi7sSYN/W5lye5YmIIA8ZCdXlw/ZV7xMfIXQJpntc/BDdnk+3gO+VvXN+v3jOkHCGwQbgpQ/sENKmswv8p05CZpktQawpVLJ0WQiwdwR6s2RcfgpsALj+NJxN0u7THC4gn0EADXHiK8ILEJRsaexxZHXN4eZU2oaSzXESI31M5LqBMoo/HnY3kVBnUNlZOt3+zXE1UJcuuM4PwWm9qL/AdIypmvgBgkspnWEByiiitDBI/K0qJDhMOq2Xsxhkn8k42Z6e77s6n4k8xfw9bzZGI8MjbLCMmE+Mjtdf7Yn8JY8vpvPMgB0nGTI6nDN+iahnNUoZ4J3ifkxTzBVjLtpv/XxvPtwyRwZip74JJdaRh5bfBaIQMhdDPUVPEmwhAZUBxUXyzNuBncabyO7LLlbCeQmIwRi0qfihrpw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(4143699003)(56012099006)(11063799006)(261021121427099003)(261022113327099003)(261022105027099003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk1ocWNEUHdtWEd4dTc5VkZZQ1Vyb3hUeWI5dW9kc25QR1hVT29uZ2d1Vld4?=
 =?utf-8?B?eHVGeDc3OTJJWko4T2dhTitEME44Wk4xQjkzamR4ZnhSUjRQMTErN3ZFdm9R?=
 =?utf-8?B?S3ppZFdqa1RURkxCV05WWUgxSzdpRTdMRVRjNUVIZXM5WWt0WXhFdzIwVnhL?=
 =?utf-8?B?WmRNeklsM2lKamNNL0dpSUdOZFhGM0wrVW00Vzd1dHEvZVFWQ3B1d3pFaDMx?=
 =?utf-8?B?dVRXMDlUR2ppUUZQTnNubU44MlRpWnVRZXVkZVJMcE84RGxjNVU4b3VzQk1Z?=
 =?utf-8?B?dVhtOURTRmFhcG9XRGJZdkZWUzExQ1pocmhGaUY1L29ISlNrQmFzd1NCU2Rt?=
 =?utf-8?B?a0tiNXRsNzBOWENESjl6enE5SUlyNFBrOFRJY1FUVzBIOWxFSXBHQk9pdGRL?=
 =?utf-8?B?dWRRT0Z5SUZUMjFKSVBMZnZSWkVCbkZ0Mk9kS2dsWkVoWmpFN08yeDE0aFVx?=
 =?utf-8?B?SGhYeXRvcjMxRkxIWGJmd25hNTJhZkRyclMyWWJxU1lobUR1MmplbUtvaGI3?=
 =?utf-8?B?RW4rTXlTZFZVbjVCc3ZUN0ZlRHh2ZUFZYzQ2WG9TdlRyRnczbU5mK2FkWHdu?=
 =?utf-8?B?ZlF1aHRmdThPQ052OHNqVDE3bWxIOG54Z2U4OGR1Qng1ZjR6RnZzdldYMUxV?=
 =?utf-8?B?SWgybkgvU3NoREorZE1BdHpLcnJFSFZqVzRidlZDSTlUb2ZISzFxT2JYSUFE?=
 =?utf-8?B?N09GSE4wVXZjMHltK2doenNaSVpCM0E3b0pnWTA0c1FpbkljdFh2dFZZSk4v?=
 =?utf-8?B?cTRuZTBOL3VHTzZneDBJSEhLcDhIbm9rR09VVGlKUkI3S1RRNUgxcXJxbXB0?=
 =?utf-8?B?VlFlaEdIYy95UWZGK2lIRXRVZ0l3M0NLRlpNTk9aS3hkc21lL0t5R2p0S2xK?=
 =?utf-8?B?ei9qazBUd1VLQzl2TEFhSDVzR0k0Q0swd1pscEtnVHRqdVhaWDdDbm8wODll?=
 =?utf-8?B?OHhKdHg1YnBUZUpRNmNlOFljVnY4amNQYW5Jak1nQWtEOVFMR3VrS1F1WjFK?=
 =?utf-8?B?QjRNZVM4dzdWejJlaVVCMWFER0JLKzJSZyt2NmZmcUlubmlwaUFnUmFvREtH?=
 =?utf-8?B?Yk91YzFqWkd1dUF2U0ZpUnVKdVM4MHFoTzErQjVuRE4vdUd5aFk2RURuSEda?=
 =?utf-8?B?YzhNRjlSbjNXbDBHVzY3eHNhWkVrOGp0ckRCRkJhRW1DWmhMYlJjZ1lPU3pq?=
 =?utf-8?B?YzdQZDVrblQxRGVFQ09vRmVrZndyQTltVDFITHpPOVpYT3VZZnNvWXVoTytI?=
 =?utf-8?B?WlFIWTU0anljbTJXcmxjcmVjUVU2L0ZBNjl5cDlKanQ0R3JPaHQzSjdsWUlH?=
 =?utf-8?B?N0gwOU1MeERWVk1vZHJHWUExYUVhMVQwNHZ2L0o1WmxWc0YrdUlXVG1DMll4?=
 =?utf-8?B?VG1ROGp1U2FNQjR2bUM5MzcwNkUrQ29CbEdpak12YTgyS3RGN2RsRkxzZUhi?=
 =?utf-8?B?UG4zRWV5c1l0TEswYU9oS29aSlF0R2ZSTXZEemt2MXQ4bGplWG9RWTVLMjNW?=
 =?utf-8?B?R1JCUWZPNmU0K3g4SEs2RjNuQUpBZEZqdmw5N1FQcU0xSGZiL2VVV1ZuZHFQ?=
 =?utf-8?B?YW1FSkZRVFFCeW5YL1hGYWhZRGR4R2ZnbWNPVHZxR1d0QThSK0VkSFBiL2FU?=
 =?utf-8?B?YnljL2dTTko4Tk5rOWxsS1pzaDFWc0Qza0l0WTFJMkl5SFNBUnpqbHhJVUJx?=
 =?utf-8?B?cG9NamhacHVOUnhvaWlSem9yV2Uza1pRUUJlYU1tTEVCc0JoSzVYR1R5a0sr?=
 =?utf-8?B?cUx2ajhaNFpHbWRveXRTMStFTnlNdnpxeVJlUWduOHhvRzRzTUQ0ZGVoQVdt?=
 =?utf-8?B?N1JUL1RoblVWY2hqemdIdGFoaGJwUzF2bmEzZmJZWitIemd6MzhzTUtJQUdu?=
 =?utf-8?B?NHFLU281c0ErSUdOanNzNVJuMjFuWDZ4dlNOcE9oRnV2WFlyd09JTlBnRGZ6?=
 =?utf-8?B?OVpiWkp0NHFYWHlxREwwZkwvM04rRUdDNjhHWDNrSnlFaFY3dFQvUTdzZ3ps?=
 =?utf-8?B?ZkRmS0cwYWFSL3FIOS9xdXZUUzNhM0Urc0NVNmN4bTdScjJvaTlvSlNnTUoz?=
 =?utf-8?B?T1QrdVd6Y1VOd09hMjFJUzlSN0lxRE9hNUs3U1RGcUlOenQxUWJ6R1NYemV5?=
 =?utf-8?B?amEwczFCRVhyd0ZHK25GM2RwYkFzaFg4d2Vhc0JVQjExV1Mvc3BnYlpMdTRa?=
 =?utf-8?B?Y0xLKytZSnV0dWxUVTl5R1VPRU1HMXBQSXF3eGdETkVNUFNhY1pTbzFUdXJ6?=
 =?utf-8?B?azcvcyt1ZHdqSm5qazQxb3lhcnM3OW10Z1FsaGRQUktDQVE5SFBVaTMydEoz?=
 =?utf-8?B?dnJjUFdGZnlPclo5dFFZSzZNcGhPRFZhZ21PYzlqaUN2akhzOUhpZz09?=
X-Exchange-RoutingPolicyChecked: budvDTDfyYls9FmMj5AIVq3IlOVO9zEclj7QLXV2GiXiF7FmOoSX8WcgCPHCjs/xV8abEoWJWsg/iTDS6+CjFU3e9d51dIpTtkhhXqhunqgXztKW5L9HDhh50kJnMgJJnGqAn/tLHrWmhfzeJqTpyQiMAL1WJFgy9XPSxaV2sHk9W/VOgVvQhSte4XhifGMnQqkxcGUA5GWILrMKMLmn/iAQ0K3tHl8iH0o8qhAtu2GZNjKoryzVrteBH0VdRMAClUxa0DPzYqMUO9Y7He2sJ7rGrkJNPlSjzzNrnCHynz1JtcZBJxryl5k+KbvMGxbjmHG5UFEwgB33MB5hUkKknw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ee4917-d371-45f6-c341-08df30e60361
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:14:17.0557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jw6nQIizX21A6y3aNYk78c2oK7vzDGihdMTdvJGgi/SbA0gOyOdOekDeG1/aYqXZFuq1lHuso6gKZPr+5gMAUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9665
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

Hi Ravi,

On 14-10-2026 00:36, Ravi Kishore Koppuravuri wrote:
> Add support to verify the CRI GPU and skips test gracefully
> on non-cri platforms
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
> v5: Renamed the CRI GPU check function
> ---
>   tests/intel/xe_err_injection.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 796b4d696..46d9f7f42 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -20,6 +20,7 @@
>   
>   #include "igt.h"
>   #include "lib/igt_drm_ras_nl.h"
> +#include "lib/intel_chipset.h"
>   #include "lib/intel_reg.h"
>   #include "lib/intel_compute.h"
>   
> @@ -597,6 +598,14 @@ static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
>   	CLEANUP_ON_ERROR(ctx, fw_handle);
>   }
>   
> +static void require_cri_gpu(int fd)
> +{
> +	uint16_t dev_id = xe_dev_id(fd);
> +
> +	igt_require_f(IS_CRESCENTISLAND(dev_id),
> +		      "This test requires CRI GPU, but found device ID 0x%04x\n", dev_id);
> +}
> +
>   enum xe_err_injection_type {
>   	XE_ERR_INJ_GT_UC_WKR_CMD_PARITY,
>   	XE_ERR_INJ_GT_UC_WKR_CMD_PARITY_POST_RECOVERY_WL,
> @@ -647,6 +656,11 @@ int igt_main()
>   		fd = drm_open_driver(DRIVER_XE);
>   		igt_require_f(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY),
>   			      "forcewake_all is not available in debugfs\n");
> +		require_cri_gpu(fd);
> +		/*
> +		 * TODO: Add firmware query for error injection support.
> +		 * Should check: EOM (End of Manufacturing) status and error injection jumper state.
> +		 */
>   		xe_mmio_access_init(fd, &mmio);
>   		igt_require_f(xe_mmio_is_initialized(&mmio),
>   			      "Failed to initialize Xe MMIO access\n");
LGTM
Reviewed-by: Soham Purkait <soham.purkait@intel.com>

Regards,
Soham
