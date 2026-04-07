Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B704EDB7C4
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 07:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C891810E33D;
	Tue,  7 Apr 2026 07:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZYIg6ZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9AD10E33D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 07:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775546439; x=1807082439;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jLd9G7a9FZO/YiRy9HBqUlFoe4DiqAumaykI5GlKhzk=;
 b=PZYIg6ZB8K5sg5Bgfrpjan7fpB9v8DffQiTYwPL862/fnQy8zwNTgqki
 wFhZX98aJ7dea1zJFI+FpjG1mS3UKSU6O08/UbKA7femYY0Se/NCy18Fu
 Qib2wgilM/8NehdOfFwX8StyRb/nye/cHewLkepmhiTS8b/K3fryRDVGj
 JoIlTJZpP1IDdL3/zyw38oqc/NZEsmbm5IZpXWEdToZhCCs+rMO/lGTxx
 G1J8DfMgJCqeWh5fDHFkJX21FBV42H4VpVsiqH0kvvPFInz9Re3Yg0HE9
 V+9WFz6sqXmy9WDynL681gb4lOeL4t2v8reJD2mhEBEBBrbfH5jyy5m2t Q==;
X-CSE-ConnectionGUID: EbpQHJlDRHSCacN+AOnZ1Q==
X-CSE-MsgGUID: fuwFn9A+SfGU2JHk/uAhfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87576543"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87576543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 00:20:38 -0700
X-CSE-ConnectionGUID: G/VwfHdYSzyr8SBWxhSRow==
X-CSE-MsgGUID: RrCCq4O5RxuiJfv1+wINww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="251234537"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 00:20:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 00:20:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 00:20:37 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 00:20:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMw3+Q2cQXM68Dp1MO1QuQz5sZ+4TzmFXaW5OfJ1p4OAMDAEbQce6cUKOexZR2F44nHdhhXAWnHgRLTbGsU8hYH5RRkmGxGmGk+oPSL5+DA6bfca9ZY9+PCwnfZ/EXZssVRbuZjAMN/G1E0665I77ByqM5irai2KiWBRBg/iUqjsD3QAT5aokkZGE1KAKvapeydO+BekGKgRXosa1mujewP+1ULUF3VoA4ycKVy8HUHgFwnU/lKiAxrvDMTNEpZIEtCPe2jL07AOGOj7Cu5eu5yiNIi+qHpa+L2BCZl3TjHyQQGBY3fFlPwSnCmTqgMr/SO6NCTNWcdbMGDoDXv+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YK0b/ivTMEr4bBxMnanGKCLz4xaP6zBETklc97UzwgA=;
 b=mldBwFFF7PhkP2kl5UTX7I0FSrE9YXZ4WPElb7VjKnQIBl2LcM3eSyWEVqajASSTjlgxuv8TQarRttM0swUI1cSN0zVJw/e4mQkPcHNoAWvtSArWIWnLSHkGvSqtUH2v/2ZHqGwTdGZmK2F2Br/b6nuAGfIbUYPQ6Ld46FoShUjok345D93UCoMP9fJ5b2922BVvVQwE5ZETmZBhFBN9q+0Ga6HGyvT66Ie2/4rU0JBbhxpnZMbaSFErLj68q8pCb6ShhQeoj+9UvZtKMw5gZy/BvGj9N61G6C2U8xzuBoyKPQN+NtiDQFuApZeUe9dOK0ZDFp2/hFYnpBCdAv5uug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CH2PR11MB8815.namprd11.prod.outlook.com (2603:10b6:610:284::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 07:20:31 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 07:20:30 +0000
Message-ID: <e04eeb95-5d8f-4828-9a4f-f4bd5555f8ef@intel.com>
Date: Tue, 7 Apr 2026 12:50:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 8/9] tests/intel/xe_madvise: Add per-vma-tracking
 subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-9-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325124426.3265234-9-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0112.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::15) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|CH2PR11MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 9864c1cc-47d8-4192-16cd-08de9476266b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: tTmfxcHMbSnNeaC7Tp3K1svqmGhEJjG9kbcu4yOpfyA0eQ/4cjQJ7g3dn9VbVZAupLW1IrpPuFI1IdZ6LPtkvYqSNmN0HQnIyaKQyCP5Yy0KUBHndUaeZ/OdENv1Raxs3exrX44hRPC0+zCKmOFq/RCKTo8Pe5veTfZnrGUGy8aZnCFs2SbUB8f3EhaGinEDA4MMubLYRKrAmkw/GG7nKffEuIswtMjsHcbtFibCe1cZ0TxJvPAJCdNGlkTssvJhSkdj+zmhat4zMgAK5SJt8YP3d6r1pORiq546ZPk8IF/Sjj+72+VU7QVTx01jPGSDaPEKnx4w+axzutpuGBwEehUDAmyDPdvbCTyBbzAWCGAp4dZkvTrVjPFVCix/4TAbJE4h144jNbCDxNczhwt8o22BVnDKfoldPHJvTIPgR7qMk3RjnBnMjvIMmM4jqIr/txGli45CFGM2fSRv2ympdfRpewl4hGfTCksyCzqbG49yMw+zwEioAPVXCG40J/2wPNzV9hnw6E5XUELVIKDRabPPzkh301hyI0IlSI6ZrOXymHudolqV12UAWc6/CETH2T8TIbmWy3re4mn3zkTqX8IVPRQAMtphAuEqelKndN5kYpej1kOvaX5RL9a/5XXaB0eoXgCFtE3CIrwODTrRPE1G9Imk8UTh3r5F3jIubQOJznb5dCJn53VmbXFW423G/nqJTnyxaE7Md183hTdJf3TcIeYBZaSS2hL787M1vr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW51b1RybHgzdjhHcVpnWXFFbVhZM0FPQ1hnOWllMFgrbDdMTk9ocEx0UFNP?=
 =?utf-8?B?RmJNWGdRQlorMDBkV2lNWDRwYkJBMzQ0MFZ4aDd2dFZRVjdNS2s5MlhvZG9r?=
 =?utf-8?B?K1A5SXN0bGJadDdLNkt4VUVjdnplSHluT25rOVRndDJXVzVRV0xXR3cxWDhE?=
 =?utf-8?B?NU5wL0dDZDdiV1lka2xXemFxSzZxdlZDb1UvVGZ3UXMvUkxxZXBOdFlYNjJw?=
 =?utf-8?B?ZnE3OTI0S0dqWlVpaXdSVUFhaGg0bjNxN2t6b2xPV1JaTDVmalJMSVJNUUx2?=
 =?utf-8?B?UU9kUElYZDNTWHpCVHkxQit1eW03RGQzcGxZVW1ROCtyU1FQZG1sQXFlS24x?=
 =?utf-8?B?cmRwQWt6N3hTVDU3NTJYbllURFpnV3BUOE9ZbUNGZHFURUZ1SkxkVzNNOHVl?=
 =?utf-8?B?NUIwaE4reHlmV1FsN2ptUkg5S1ZTMkxyVDBTYjRlWGJKSTlCWGdKd1VIUHBX?=
 =?utf-8?B?a3J4b29wMDBXTzFmanZvKzVBMEdlYW01RzYwdWRKdnVsbjRtTlpFNi9kZnlL?=
 =?utf-8?B?SjI1YXdPU0dFUWVhWUx2VFNyRWV5ODQ2ei95TmlFRFl2U0YveDhiYTNGVmZK?=
 =?utf-8?B?RHZiWFp0SE5jd0UvWGZ1alIyVk5sWHV5VmtvUlRTanJBdkFEazBoZmVYNnV6?=
 =?utf-8?B?ZG9GR2M2T0RZNHY5ZU93OHd2RCtpM1pxbVFwZHVrV2dOdk1rUDJMSUlTUXJ2?=
 =?utf-8?B?NytMUERrQnlrdjhZMUpnUVRJVVRYN09TMWh6S1d6QmNyWUxsWW5GVGZveDgx?=
 =?utf-8?B?VVdKSUtaaTExeGNrMzRic1dWOFpPcG9Pb0FKQU0vSlMvY2Jzd3A3VXlwKy9p?=
 =?utf-8?B?UUlCajNKd00xTlZaZWZLNkFWcG5ya29oS1FhUzB0VmNHN2RudGt4Y0Q2d3hX?=
 =?utf-8?B?emZkdElhcWdXckNNU1p2dUduNzZJVDJMRjZJUlB3VDBvUC8rV243VzJvTnpK?=
 =?utf-8?B?NUFmRFdQaWtlTTl2TXYrUHMrMFVxQllUOVJDWlFXbGlkRXhaM0s0Kzkwa1VD?=
 =?utf-8?B?aUhhK0wyRmNHOHUvNDZDQmpxSjdZdjhTYUlwTmR4eVhxTGlNR2VTS3JEWWhM?=
 =?utf-8?B?eGhoYlV5MjVUWHRiSkRiQkNhZjU5d2tYeUUwempZdEs3K2lCQmY0ejB4R04w?=
 =?utf-8?B?NnBpT25zZVA1NEk5MFRtNWU2YXRScVJaOXlzbGxUS2FqS0d4VVdnbUloQjZV?=
 =?utf-8?B?SmZvbFV1Tm1tUGJhTE9ZU0NzNTc3V0JKNno5WEhlUE1oWDVybXdMUlUydkhq?=
 =?utf-8?B?amxFaGR5RjZiTzJqdjZiMktZSUZDWGI2dXF4N0N2UnkxWDM1YjZoTkVIUTF1?=
 =?utf-8?B?cjJ3UmNyenVUTlRxOUY0ZDF3MUZONTMvU3ZIMU5VdFNNN04vM2s3UkhYdTNS?=
 =?utf-8?B?dkN6UFd0b0FvNk1HU1o4b3FsTU9JVHBOQ0w1K2Z2WklkRWdWY3pNT2VOcXNL?=
 =?utf-8?B?c2swL1htY0Y1dEdra1E4NVU5YU1XQWFqb0VDRnJFa0FMakNkTHpxeUU2bklS?=
 =?utf-8?B?MzIxZnNUVWxLeEN3QWJseWZKTUorTnJHYkxNcFBoWkUvVzQ5YThUakV4MldD?=
 =?utf-8?B?UnIvRnpwNmQyczBJRndxV1o2bkJ1VndyaVJueFptbDJDWm5LN01MNVp5N1N1?=
 =?utf-8?B?OEJFcUpoR2NNYTloQndWQW9KL1U0Vy9hVE15cW9OVGZ1MlMydDArNmdpS1Zj?=
 =?utf-8?B?cm1qSi9qL2hKeDQ4Wk1pd0ZlUGZCc3F6M0p3Mm5maXlBUWhGQU5uY2pHY05L?=
 =?utf-8?B?YlVCUVRXSU0ycGVPZ0tEUnVtMjE4SmtqU2R4RWJGQkprL2VMdW1TUHJqOWFF?=
 =?utf-8?B?TVhveVQ1eVZxb3BnQm5KV2hSRlYxZDIwUWNXUnZvaGwxbjA0aDlYTm80c2Y1?=
 =?utf-8?B?TmdSZ3oyaW1Dajc4L2pmRXhvbnBLTldoaTJ1Wm1iZlB0TzYzdnRRWTNPWEF4?=
 =?utf-8?B?NU8yNnJ5R0o1a0NaRS96cmsxVE5qNUQzZ0NIK1hOV2pIK0JzNkd4WFlZVmYw?=
 =?utf-8?B?NXZVQW1EeVh6MHg2aVAzSTFhOU5uNjN3RDd5T3kyN2x6dEhiVkkwQlptQllB?=
 =?utf-8?B?N1FnL3hUYzQrQjFjMmF0WFR5K0h2S2N3b0g3Qnovb2J4ZlgvOHZpcXZtOUxF?=
 =?utf-8?B?V2RrRlY4UE9XK3pwdTVWVkxYdEJRZ1ZiektBQytlNWlsMnAvRHlneTJvQ1RV?=
 =?utf-8?B?dlo0bEwyaGZKT0l2RnFzN0h1NVd1OExqaWJxWHhqUUwySnlBZG8wV3NFZDM3?=
 =?utf-8?B?ZTVWckRxdktHZk9HV2tuSXhuVklQMWVVcllDeDJhckZyZndVenVzVCtJN0hx?=
 =?utf-8?B?a0lHOUtib1J2UjJ1NXdzbjlYL1B4T1Y1MmREZlB6WkRqc3VSbElNZz09?=
X-Exchange-RoutingPolicyChecked: bZgLX7OQ6g0Xw6AoHCLk0yyqOCRWuxCbewi7x6XPxqS/dZLU0Mb7A4211MV6rCe3owOjj+TIXZPvZLAA84pkJs9SRIt/SEunqs4ndIONy8Uaa+zSK9mkh7nElaBK9zIaeCunry+yY4j1G5JPIzBgmtsMOYQljDXbd7XLz/MqzcHXNdn3hN5ETZokMbnw6QC1aag1QaExEDT27jPNNdqvMsIo1fdKuy6/IhKY+cQrORSZxYMay4RBHx8yxN8BJ37ChIzlXT8Z+sZdWsTL7QxNvnkanIK6MnejUiEYqzC73mKKvsbMItXiFkgcxs5iMBTtPI6ADMLeovctiRKE3OIQ7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9864c1cc-47d8-4192-16cd-08de9476266b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 07:20:30.7981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvXOzWJlMRH0ufp1kAbgwl2qx9/G5iNOc6YcJveznfpoZLME40cf1KMbCTsgP5+URBMoWwIgBME3vhQlWIbjcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8815
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


On 3/25/2026 6:14 PM, Arvind Yadav wrote:
> This test validates that purgeable state is tracked per-VMA when a
> single BO is bound in multiple VMs. The test creates one BO shared
> across two VMs at different virtual addresses. It verifies that marking
> only one VMA as DONTNEED does not make the BO purgeable, but marking
> both VMAs as DONTNEED allows the kernel to purge the shared BO. This
> ensures proper per-VMA tracking for shared memory.
>
> v4:
>    -  The comment now clarifies that triggering pressure. (Nishit)
>
> v6:
>    - Move resource cleanup before igt_skip() to avoid leaking VM and BO
>      handles on platforms where memory pressure cannot be induced; replace
>      igt_assert_eq(retained, 0) with a graceful skip. (Nishit)
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 114 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 114 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 28ea81442..6c0a563d8 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -28,6 +28,7 @@ static bool xe_has_purgeable_support(int fd)
>   
>   /* Purgeable test constants */
>   #define PURGEABLE_ADDR		0x1a0000
> +#define PURGEABLE_ADDR2		0x2b0000
>   #define PURGEABLE_BATCH_ADDR	0x3c0000
>   #define PURGEABLE_BO_SIZE	4096
>   #define PURGEABLE_FENCE_VAL	0xbeef
> @@ -267,6 +268,58 @@ static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
>   	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
>   }
>   
> +/**
> + * purgeable_setup_two_vms_shared_bo - Setup two VMs with one shared BO
> + * @fd: DRM file descriptor
> + * @vm1: Output first VM handle
> + * @vm2: Output second VM handle
> + * @bo: Output shared BO handle
> + * @addr1: Virtual address in VM1
> + * @addr2: Virtual address in VM2
> + * @size: Size of the BO
> + * @use_scratch: Whether to use scratch page flag for VMs
> + *
> + * Helper to create two VMs and bind one shared BO in both VMs.
> + * Returns mapped pointer to the BO.
> + */
> +static void *purgeable_setup_two_vms_shared_bo(int fd, uint32_t *vm1, uint32_t *vm2,
> +					       uint32_t *bo, uint64_t addr1,
> +					       uint64_t addr2, size_t size,
> +					       bool use_scratch)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value = 1,
> +	};
> +	uint64_t sync_val = 0;
> +	void *map;
> +
> +	/* Create two VMs */
> +	*vm1 = xe_vm_create(fd, use_scratch ? DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
> +	*vm2 = xe_vm_create(fd, use_scratch ? DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
> +
> +	/* Create shared BO */
> +	*bo = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
> +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	map = xe_bo_map(fd, *bo, size);
> +	memset(map, 0xAB, size);
> +
> +	/* Bind BO in VM1 */
> +	sync.addr = to_user_pointer(&sync_val);
> +	sync_val = 0;
> +	xe_vm_bind_async(fd, *vm1, 0, *bo, 0, addr1, size, &sync, 1);
> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
> +
> +	/* Bind BO in VM2 */
> +	sync_val = 0;
> +	xe_vm_bind_async(fd, *vm2, 0, *bo, 0, addr2, size, &sync, 1);
> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
> +
> +	return map;
> +}
> +
>   /**
>    * SUBTEST: dontneed-before-mmap
>    * Description: Mark BO as DONTNEED before mmap, verify mmap() fails with -EBUSY
> @@ -546,6 +599,61 @@ static void test_dontneed_after_exec(int fd, struct drm_xe_engine_class_instance
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: per-vma-tracking
> + * Description: One BO in two VMs becomes purgeable only when both VMAs are DONTNEED
> + * Test category: functionality test
> + */
> +static void test_per_vma_tracking(int fd, struct drm_xe_engine_class_instance *hwe)
> +{
> +	uint32_t bo, vm1, vm2;
> +	uint64_t addr1 = PURGEABLE_ADDR;
> +	uint64_t addr2 = PURGEABLE_ADDR2;
> +	size_t bo_size = PURGEABLE_BO_SIZE;
> +	uint32_t retained;
> +	void *map;
> +
> +	map = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
> +						addr1, addr2,
> +						bo_size, false);
> +
> +	/* Mark VMA1 as DONTNEED */
> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
> +	igt_assert_eq(retained, 1);

As per description  if VM1 is set to DONTNEED it'll not purge untill VM2 
also set to DONTNEED. So retained = 1 is expected which also verifies

BO is purged or not, if returned 0, So below VM1 WILLNEED check can be 
dropped.

> +
> +	/* Verify BO NOT purgeable (VMA2 still WILLNEED) */
> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
> +	igt_assert_eq(retained, 1);
> +
> +	/* Mark both VMAs as DONTNEED */
> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
> +	igt_assert_eq(retained, 1);
> +
> +	retained = xe_vm_madvise_purgeable(fd, vm2, addr2, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
> +	igt_assert_eq(retained, 1);
> +
> +	/*
> +	 * Trigger pressure and verify BO was purged.
> +	 * Using vm1 is sufficient since both VMAs are DONTNEED - kernel can purge the BO.
> +	 */
> +	trigger_memory_pressure(fd, vm1);
> +
> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
Expecting 0 (for purge) here, right? Can we put a check over here?
> +	munmap(map, bo_size);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm1);
> +	xe_vm_destroy(fd, vm2);
> +
> +	if (retained != 0)
> +		igt_skip("Unable to induce purge on this platform/config");
> +
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -588,6 +696,12 @@ int igt_main()
>   			break;
>   		}
>   
> +	igt_subtest("per-vma-tracking")
> +		xe_for_each_engine(fd, hwe) {
> +			test_per_vma_tracking(fd, hwe);
> +			break;
> +		}
> +
>   	igt_fixture() {
>   		xe_device_put(fd);
>   		drm_close_driver(fd);
