Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A1EE99046
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 07:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486FB10E8B9;
	Fri, 10 Apr 2026 07:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HipCyFJB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A2210E8B9
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 07:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775805051; x=1807341051;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nVc/LX5yUIaKW7DOGGfoed/rPW7DyoKi6gUFFt8bm0M=;
 b=HipCyFJBElVsi55R/NVwaTn5A4QFhvSWhxtavq8+qb/g6yAZMD5lONoA
 Xb78Nj/N17pUhPfm8oaDhHnt6fKXyLqfZmwR7909nd3wCOgLOb+aRr7sz
 /7R4isKbX8i1oQgwshtaArlWwmIEgqM5ojPetyasbJWJmpYLxu+nx8TIE
 bHVC+xwTSSkaokIyQEY0eSrdSK9MZFBCbGbaoSAqnz70Ob87bEWfwZsif
 PHmyHih+gCGB8/FuxfEtU+8fBd1lVVNA5dp10K8nq4D0NKqrcnuISa+8u
 3/xlOmEl0lAyiAFJcYcVBpIgeXEDQ1DtvZDpTN6fJ2CxFpWAZUC8tTr5l Q==;
X-CSE-ConnectionGUID: VM61cYm8R+6y+p6BH9RErg==
X-CSE-MsgGUID: O2xY7nxJSESJJFHbg1eHkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="99452334"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="99452334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 00:10:50 -0700
X-CSE-ConnectionGUID: SLxKhHogThCdH+uRBr0Z3Q==
X-CSE-MsgGUID: c/p6Ea/KTmKIf1cBAN7SYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="224709117"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 00:10:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 00:10:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 00:10:49 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 00:10:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=On1LtkS7fNP35RC6mtMnufGjPGb+Wh/UwdEVRRXQZ6TrmTPGknfZW9A2YnhTfC7mUcMzZ6IdwBqn+/eufUYa8Gagrvtpk08aUUgId14WG7cKSbjoRWFFqvt0n9wHAUzQvgW4wXMDOUUJ2Yo0xfOLQokuIjgV/3w1SENOq0nsWWNpcs2RADrpRHnJQBb8RDK+FfNPJi21fSLBFZv5gr+mfCOWN2YupLpD0BTrPZyUDmqfynfIHzNiRUTqmDHTdM59H2IKQpaABnEymSsvhw3ExDc1mf8iyi5z42BENzU+qHYuJGbfvxaNBqY9af7RZKnsKSvIOPt5V85oGTzEGTAXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ+bgJL08cugOg8Hm4V1GnCQwHtk6HfaLxkYfHwBT78=;
 b=oN3c6CuUfMXoPpvo1tQdZspe4aZPUzjWEEOXc5Mj3LG0bEPhKP2ZAuTbQC8RVTVC/WQYVo9RWLCt6qoTLKLtTW1HgbXH0XkUYPQh0AuHhoRvcYMFuaB2fypXys3EbMi0snvpneWtVVegVct1Y02LE4ytPuDE8yB+j3TnVsOJNXTrsUjwS2ghUXOm9ksMA9uPa9wWiQDaGCXqWXu0tmkSh54FwCwSV1OYwcekTXM3MXwz18n1SXhQkt/LoOmBFuivZdvaB+Y57Jh8KVsKvR+RUgkHHoOHQxts66edhqdHQyL1Wh65UjspO2uDIOSadEz2jE9G7tH/49gFDqpFDxY80w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CH3PR11MB7299.namprd11.prod.outlook.com (2603:10b6:610:14b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 07:10:47 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 07:10:46 +0000
Message-ID: <a46aa6ce-4b64-47ae-993e-e2fc03e70871@intel.com>
Date: Fri, 10 Apr 2026 12:40:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 3/9] tests/intel/xe_madvise: Add
 dontneed-before-mmap subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260409070118.2211602-1-arvind.yadav@intel.com>
 <20260409070118.2211602-4-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260409070118.2211602-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::9) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|CH3PR11MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: b52cc3ac-8d5e-4922-07dc-08de96d04969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 9o8atMTOUlt++vmS5GH4ZP0hUde4YwecNPj3hmZRT8b5111U3NBvGIUmcJBr3w+Kq+d4KdyyVj9UmbeAVui4e9hPKP+wIIKuvNtSWlxwQgUvqEqn161rFf2T7IVmJt4iMrZ42NwFnh9be+1Dxvorj2fZaAUuAUMcrKvAh/5dGqlMIGPqDRNJNpUYE3UYmJMK2KAd6sND6agALH5ZE79cgaU5NSXuhB/TnhBcKB4tM/GCqpo2JNhWwKqTz8y1UKAu+Qgd2QUl7VX3og1SxmPvkHHM0y7M0Jqe44EjOtMKwDo6oK+xWqqU2nyOt8eAMAxrhKS6xjZEa+W0Ev9sia0+YODAChKSow28AuEOQGR8MRaYiisWG8qc5iZgh6or8aVKI5q34+4IH8e3x7e6q8WsuclMsFrwaZzwj5S97lygahzUYcP1oeryueNYnKBXTAmm1x6QK6bswLOrW26InBxx5sVGzKWZx2AmR7NmDGS11J7pQvZ+tbXiDqu4HkzGdyfedjcNhYH30dCEbp1tnvFUFBn09BhrriyDUCVUkd00mzxvivuRWa+BstlI70dLElz+ePywsLLcpF7vY+Gu0Zc7OAWe4gCfdtQj4PtKra8TV7Cpr0BAiITKJMVIv0r6i5H7j0E300+Q9L6RTtwU+HZNSqHfEN12az6MT4K1ZVOYkbw3DKe4reY/Cv+gSgg6JN2av6zEe6xz44hQIu3KNAsn/AyzfXsy8qI7mP0A1MabW08=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1NtdDNRZU9sa1hERi9PZ2k4U01UaVcvVnU0SktIWUV2bThZNHl4bWVobkN5?=
 =?utf-8?B?c21DNFhVYnNPZ29ac1dZV3VIbzR6Q0FqU29ZWW9tSzFQQnowRFJyYXp3ei9P?=
 =?utf-8?B?WXE4TzlTSXhzTXZHMmg0L3JxMFByVzVGdjNNSjRKNHFjdVNmam1henJETDNq?=
 =?utf-8?B?UnQrVFFETG9pbE4rZkQyZWJDOVNKY1c1Rnd6VnkzNTR0UUV5cnNlWUNXclhu?=
 =?utf-8?B?dFc1U2d6ZjhreDhaUWw2aVFONW9wQWtJZmRwbVc5SzlhZ1lwVWphcVlXcGYw?=
 =?utf-8?B?aWZ5Q2EwOXBqTktwRkVHWE1kT3JSTlhNT1ZKOUI4eVNCM1luUnhadE9TeVBu?=
 =?utf-8?B?V0V2c2VONlVMN3k1K2txZGNWVDlNcWxLY1ZkazgzSlkyOHZwc1R4S1RaTzd6?=
 =?utf-8?B?WTRTekp0U2dQcTgyUTY0djhsOTZDSkFyU2RocDcxVkpJVDZLN29DODJ6ZW0x?=
 =?utf-8?B?WENLZi9Iek1SRHRuNTU5TXFTNFdQb3VOak4xTXIrSE1jU1hSWUZ0bEFWL25E?=
 =?utf-8?B?dTRyS1Z2RVVPdHJOcStZclRteHl4WGUwM3FrMnpZYVRINkp4N0prS1hRakQ1?=
 =?utf-8?B?WWVCbG9pZDkwSlVmMDNXRUR4NVBtVzFhaVZ2bi95OTc3c2RBRGNMMTg5QStW?=
 =?utf-8?B?NStRRVVtMWRiZlBYWTd3MU5xbFhOWHRETDZJd1ZCNTRnV2J1Zm1TcWtJYlBZ?=
 =?utf-8?B?MXg2MTVRZEdVSXZnV09sL1hCYVF6YWltbS9iWnZXdG5xdlFrK09xWEdjWkVn?=
 =?utf-8?B?WElNS1k0SG4yVER4eGovUTk0TFRZMGVMOXhOZ0ZxOGMrK2JjdzhCL1dScjFM?=
 =?utf-8?B?bGIrL1VMNi9XdEp1MzRHY1pURGJ5a0RhaFUxMnZnZXZYQWJYSEdUWDFoclZG?=
 =?utf-8?B?bEJRTGs0bWE4bm5lOFJiMm9FOXVrNTVVM1JuNUQ4cE1iQjQrSnpWNW9XMnJ6?=
 =?utf-8?B?cm0vVVJ6TCsrckNCTkVsV0EwR0V5SWFPUHNvUTdXdU02K3p1ZmlVRUxDNnQ0?=
 =?utf-8?B?SmxQOTBNa3MrMGM0cEZWNmtvaFJzRnd0MmpUNFdtbE55dnRPVVpTM3Vja3ln?=
 =?utf-8?B?bjRVb0d0RXNFL21ha1VqeTVSLy9SeDNzZlFXYm9ueXRXNEJSTEVhTDFmKzlW?=
 =?utf-8?B?N28zMjdyNG80WUxaMStIQzkrVGxBWDVBZTRLanU3UmRvMGZsWktwL2pMcXAx?=
 =?utf-8?B?M3pEdyt4MlY0UUp1Y0NKdXU5ODhVMW5BY1M3Z1dHOVZxb3JFZXl4a2ZxMllj?=
 =?utf-8?B?WWJoTnUrSzdSNHh5cXBWMmhwS2Rpakc4aXdiQ1paRDVkekVVRldXRlNuVVdM?=
 =?utf-8?B?b0k2L3FqaVRFOCsyaXNuUE5xbnlXRHdhbWdtZVdvY1hSSzFjU3JhalBrby8v?=
 =?utf-8?B?TkZLbDZaYWYrYmY4dkZqLzJacDBSampzQWIvdEJCV1ZvUkozNnByK2VlZ0k1?=
 =?utf-8?B?TmFsQlZLaFVyVE9Mb1JpdHNjYWxQYjkwaWdKN1RnSXdRT3BwdEdjaEpLQ0t1?=
 =?utf-8?B?NWJoME1NTjdvQTRCYWhDWXZEQ3h4UEZCYlJodkVmcHE4cFV0aUdnUmxVRWR5?=
 =?utf-8?B?QnZ5eFJtQ2E0WWxWSXFVbXA1NXdQamF6MTBnR1BNK2pvaHZ0VzVhV1dvaEpm?=
 =?utf-8?B?aEVib2pOR25uVzlEdWRSN0NIakdPWGQwVGVsUExtS1hoY0NxK1lSWHFBWGYy?=
 =?utf-8?B?Y2F2dk5XZnhsdC9kUnRSdStKalJISnJ0cmJkTng3V3FOeU8rUVI5aUdCelpq?=
 =?utf-8?B?L0Rkdm80aGJGd1RhVk9tVGwxNEtVVUxYWVdUZjBPa0tFM2k1ZmVjUnNHM0RN?=
 =?utf-8?B?YWlKVGtmL2lWTXNKK0d4a3BCUGE0VkJKYllnalEydUd6LzMwOUtmMUdlUWpa?=
 =?utf-8?B?L0hjTkhkd21BVXZMaTZ2a0FqSGRRVzJRc0srRzFBamMzUDJTTkZvOTF5UzlD?=
 =?utf-8?B?VTI5emNzN0Zsb2hKbzcydklGUXNrU0s5d0gvdlRwaFFBaUJMUjJyRUdycndV?=
 =?utf-8?B?T2pUbGs3WDNhcktVY0JZNXFCajVwU21MdElPMUZianZuRzdpKzd0cGM3K3BG?=
 =?utf-8?B?aUowTEZYQ2g0ekc0cGRHdGl0UXlZNDlxOEtvVm4rLzJaSlJNY0VuSlJzWnNy?=
 =?utf-8?B?UGpmWVE3Y1RycTlXdVRZZXpoOWduTGl2ZE1xQXpjY3d1Ky9DNWZqOUo0djla?=
 =?utf-8?B?d0dVaWQ3UHlMY09EMzVYYUs3KzArcnhxallFRkZCOStHaVhTZWh6SGZzalFR?=
 =?utf-8?B?b29sSTNmREhHTGxRS2FocGNEdGh1N2U0TWZiNC80KzZ5N25veHZqcTJnL2tt?=
 =?utf-8?B?TGdlR3BoOWZnYVpwbVFDeDRqaWdHelNwdmF5b1Avc21aSllZV3VLZz09?=
X-Exchange-RoutingPolicyChecked: ZvbGje43h7dpIWz387OACvh/NEUpXv/o5XZbTgbNrI5M6o3Ndg6TOQFQG+jwT2zA263+4ZNkiu7a6MtI8Npnsk5JGDVib3GrIg5cEfMU0jikZ55Wrp89LDZalJfqGQVecbVG9hPVkJJn2O8LQNi4FNpruwQt1lZFT3z4rzG3VdXaRHZ5Gs389USDgBlVoEwWpXKoIUhhoIaOsI7e3HjoqwsWdoibc6Yyjt5+FV1BFqDhegXMjP4lMgl6+e5rS7fNPxAqZfnkbo5ArPABZkeobJHK1arOK95U/BaxkfycHkw18E18ynVSKZOeKasIcDsx9zQ1wplh6wtBtPSRof6quQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b52cc3ac-8d5e-4922-07dc-08de96d04969
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 07:10:46.6741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nu+E24eA5UCeFzHIFU9bPJ9iJBCoSL7Ia0gpVs8XRR4dUy5XOfGVQJ0cHlCXTwMefGU6Irl3Tn9q99fYCBMK3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7299
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


On 4/9/2026 12:31 PM, Arvind Yadav wrote:
> This test validates that mmap() fails with -EBUSY when attempting to
> map a BO marked DONTNEED. The mmap offset ioctl succeeds (it just
> returns the pre-allocated offset); the purgeable check happens in
> xe_gem_object_mmap() at mmap() time.
>
>    - DONTNEED BOs: return -EBUSY (temporary purgeable state, BO still
>      has backing store but can be purged at any time)
>    - Purged BOs: return -EINVAL (permanent, backing store discarded)
>
> v4:
>    - Move unmap outside the block. (Pravalika)
>    - Added proper resource cleanup before calling igt_skip(). (Nishit)
>    - Added assertion for xe_bo_map. (Nishit)
>
> v5:
>    - Add kernel capability check *_FLAG_HAS_PURGING_SUPPORT for
>      purgeable support. (Jose)
>    - Drop memory pressure trigger path; mark DONTNEED directly and
>      assert -EBUSY from mmap offset ioctl; restore WILLNEED before
>      cleanup.
>
> v6:
>    - Support iGPU by using total system RAM as the pressure baseline
>      instead of VRAM size (which is 0 on iGPU).
>    - Raise overpressure from 25% to 50% of the baseline to ensure the
>      kernel shrinker is forced to reclaim on systems with large free RAM.
>    - The DONTNEED enforcement point is mmap() itself, not the
>      DRM_IOCTL_XE_GEM_MMAP_OFFSET ioctl. Update the test to mark DONTNEED
>      first, then verify DRM_IOCTL_XE_GEM_MMAP_OFFSET still succeeds, and
>      finally verify that mmap() fails with -EBUSY
>
> v7:
>    - Move unused functions: trigger_memory_pressure(), sigtrap and
>      purgeable_mark_and_verify_purged. (Nishit)
>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 122 +++++++++++++++++++++++++++++++++++++++
>   tests/meson.build        |   1 +
>   2 files changed, 123 insertions(+)
>   create mode 100644 tests/intel/xe_madvise.c
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> new file mode 100644
> index 000000000..2c8c27fa9
> --- /dev/null
> +++ b/tests/intel/xe_madvise.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: Validate purgeable BO madvise functionality
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: Memory management tests
> + * Functionality: madvise, purgeable
> + */
> +
> +#include "igt.h"
> +#include "xe_drm.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +/* Purgeable test constants */
> +#define PURGEABLE_ADDR		0x1a0000
> +#define PURGEABLE_BO_SIZE	4096
> +
> +static bool xe_has_purgeable_support(int fd)
> +{
> +	struct drm_xe_query_config *config = xe_config(fd);
> +
> +	return config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT;
> +}
> +
> +/**
> + * purgeable_setup_simple_bo - Setup VM and bind a single BO
> + * @fd: DRM file descriptor
> + * @vm: Output VM handle
> + * @bo: Output BO handle
> + * @addr: Virtual address to bind at
> + * @size: Size of the BO
> + * @use_scratch: Whether to use scratch page flag
> + *
> + * Helper to create VM, BO, and bind it at the specified address.
> + */
> +static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
> +				      uint64_t addr, size_t size, bool use_scratch)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value = 1,
> +	};
> +	uint64_t sync_val = 0;
> +
> +	*vm = xe_vm_create(fd, use_scratch ? DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
> +	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
> +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	sync.addr = to_user_pointer(&sync_val);
> +	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
> +}
> +
> +/**
> + * SUBTEST: dontneed-before-mmap
> + * Description: Mark BO as DONTNEED before mmap, verify mmap() fails with -EBUSY
> + * Test category: functionality test
> + */
> +static void test_dontneed_before_mmap(int fd)
> +{
> +	uint32_t bo, vm;
> +	uint64_t addr = PURGEABLE_ADDR;
> +	size_t bo_size = PURGEABLE_BO_SIZE;
> +	struct drm_xe_gem_mmap_offset mmo = {};
> +	uint32_t retained;
> +	void *ptr;
> +
> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
> +
> +	/* Mark BO as DONTNEED - new mmap operations must be blocked */
> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
> +	igt_assert_eq(retained, 1);
> +
> +	/* Ioctl succeeds even for DONTNEED BO; blocking happens at mmap() time. */
> +	mmo.handle = bo;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
> +
> +	/* mmap() on a DONTNEED BO must fail with EBUSY. */
> +	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> +	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
> +	igt_assert_eq(errno, EBUSY);
> +
> +	/* Restore to WILLNEED before cleanup */
> +	xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
> +				DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +int igt_main()
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	int fd;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);
> +		igt_require_f(xe_has_purgeable_support(fd),
> +			      "Kernel does not support purgeable buffer objects\n");
> +	}
> +
> +	igt_subtest("dontneed-before-mmap")
> +		xe_for_each_engine(fd, hwe) {
> +			test_dontneed_before_mmap(fd);
> +			break;
> +		}
> +
> +	igt_fixture() {
> +		xe_device_put(fd);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index cecb4a8ae..a6370b685 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -314,6 +314,7 @@ intel_xe_progs = [
>   	'xe_huc_copy',
>   	'xe_intel_bb',
>   	'xe_live_ktest',
> +	'xe_madvise',
>   	'xe_media_fill',
>   	'xe_mmap',
>           'xe_module_load',

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

