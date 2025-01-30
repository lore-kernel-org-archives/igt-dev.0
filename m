Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EAEC0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFC410E9B5;
	Thu, 30 Jan 2025 17:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+Ya2Uxa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9669B10E9B6
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738256597; x=1769792597;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O60c1ZaoaonuLRFj+mlziyLxLgbgYJtqe6oOTj3eC5M=;
 b=Z+Ya2UxaFs0jQaAnB5i8ZdkOG+UGwiQdSkbq4SdFgTDZmGdfjEYia7Gy
 9fIIh+xGm87Fsn1IM6FBlaXvCMPyRgtrgLN+KNwmuChKn3X/jI2Ue8uxR
 Ov1q7bi3rEw0sFDh6xudWXbOFA9qmgVfSHlhlhU2CMQIFWtDbR7zzwgcF
 fISNY3a0YwiLuAJrIvp7UlBAOsRUodxHVYo1kIF4Ne500VPATEjFt5mnk
 eD3lESKfIMuWtOGUW/RSQxGwv/UHX9y7UC7A7nc1b0MFgd6DCOnayB8JP
 skvsqn9wGWJX21/ZdDtA2/QnsZS2Hm4Oc6iGzJynV6oGoWyUzi25hawI4 w==;
X-CSE-ConnectionGUID: rg7hTp6AQcmpIMx6YUZqMA==
X-CSE-MsgGUID: j+Sf2wNOSLGfzvG5GW5bVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49468414"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="49468414"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:02:35 -0800
X-CSE-ConnectionGUID: 9bieW5tVTPizN0shGSLk4g==
X-CSE-MsgGUID: 9eR36/mkTG6qJ+lJQRg3tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110280401"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 09:02:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 09:02:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 09:02:27 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 09:02:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FaGc2Sz4pryNX2vs+738gLaRGq3ItgtmNabgcroHv62zgt5imQghhZGh/VkjHGm9EzNcb76qSOhsMxZRMweXKw1uZw8tdKnwICDh7mfGxEWpTOHxwCPTpcQorzN2m1rRFN9xRyu+B2eE26Zxm+/VmIhP0IM5cy8WZvgiNEdK9owsfU7oDYqQLcsHZ72wKvoKApBI1X1tRPck9HFXzNwy8L6g2PR4jmvx5jGlAzXXYz2dpdpu+pXG9D/gSBpsEdHUcHRZa/+tWrVtX/oY2VSFXVsE9kxfG8tMxPdsNmR52n4a25xh5wZWyi0s/N8gZkzTJ9drHCHLZ4qrjxozRt6zXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UipW6DPpgdLEdUrBmiD+iRJFsuKFYJFW4UD23rwda5I=;
 b=VhXViDyLKr57/c3Maq3l/ke7kQP6Blh4BGZoRPiAEHfuOkZ9KUe2zl0p/K4xEuHqOkgyBdSZ7WV6S6w7JSN1EISj5LYVDC3LYBa0ut396hRw2b87teUUiVMxaj6CAvAuzKaHfQr3VdC+j3TkBZde4cq58Sn8YpMlr/OwrIIgt4BH3w5sRx6z9QEQ9+OeYi4yvLIR3TxctBeJa5t1nLS7xCSSm0j0GCABhZVVhXUUv6zFn0NH1fUuy4jEKwqdcTF0nTSQxY/1IfNeroBzkoOlkwhxmkgImJR5yT44/a0qJYiU+g/NF0zWgI2Dji6/vg/Qq+J/82abxJSExCmfufL4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB7683.namprd11.prod.outlook.com (2603:10b6:8:df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 17:02:16 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 17:02:16 +0000
Message-ID: <032feab0-9a32-4c4a-97fd-73f0fe3999ab@intel.com>
Date: Thu, 30 Jan 2025 18:02:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/xe_sriov_scheduling:
 nonpreempt-engine-resets subtest
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20250120203445.16285-1-marcin.bernatowicz@linux.intel.com>
 <20250120203445.16285-5-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20250120203445.16285-5-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0301.eurprd07.prod.outlook.com
 (2603:10a6:800:130::29) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a6ff1cc-d709-4fa1-0d7d-08dd414fd944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFVndzlEYk52cEVWMDh0MDRZVFlvcytKcEZhSmhTK2dQS2gxNkZRNlh1VzV0?=
 =?utf-8?B?SXpqNGZCTDhGM0c1bnRaam1oZTkwVEFsdFpwYmZjUUM4OWZ0OGxVSDJHOC9I?=
 =?utf-8?B?RHd3Kzc3RmZNVkhHMEp3Y3FWalo2ZHRORXNRU29uUU9WVjJjd2U1L2ErVDBR?=
 =?utf-8?B?d0h1OGlEajdRY3BHQnNHOW1NUHh4eG5XRlNLVVZqVkFDeFZpME95WDZpOHVZ?=
 =?utf-8?B?SVExQjV3RlE4SVdiUkU3V25nS0hJSlNaSm5hV1dLRFlCSUZaTzN4bjhjc2xR?=
 =?utf-8?B?RGxkQkdHd0wycDhPZGcwWjk1N0E4ZnhMR2xQaTY0d2RBSEdCYmNvSG9CRXJZ?=
 =?utf-8?B?dkhVbXdLZytxbkZTZVBMNm82K1BhbW1mT0ROdkhsSTdoajJ3ZDdEN3R6ODEx?=
 =?utf-8?B?eTZjaXZ1UXd4WUMxU2xrTGNtclIxdWhiYWFGaFB6djA3bWpxV1VEVm1mdVM2?=
 =?utf-8?B?ekxrV2hDdXl2emVOTXlFcWljOUlzQUJWVTRqTXdBWXpOVmxJOEZOZEptK0Uv?=
 =?utf-8?B?dUJLZU1uTmdFb0c4VTZRL0Y4U0NhWTVuSjE4YWJMeFg0SmREZ0ZmbnhzNUwr?=
 =?utf-8?B?cmR5M3NpdmlZVTJMb1VzV1FkUnlubGduQlUwWDdDUkxQUk5mMllINmluZ1NM?=
 =?utf-8?B?V201Z216eE5Kb1lDV01tZUJCQSt0NVFYS0dWZXQ3ZE9nK01SREt3dFdtZTBR?=
 =?utf-8?B?d2dNcHdpUUF2ZFIyOU5LWVFnek8zQTZHSjNkUUJla051UWFrVXhMaDN5bStL?=
 =?utf-8?B?dE51cG41M3E1MVVFRHpMRzRpSW9zSGFWNkp4dlNBM2toY2FuSXpFZ2Z2UUth?=
 =?utf-8?B?ZThsUTNxaXY4TzJjSjZjUVdyeEU5NzlBNkdNZWpscExIUmk5SFlqOFkxVWpv?=
 =?utf-8?B?aHpuU1VISTJ1UC9hcGNhYStmdzlhTGZodFk1M28vbm5maE53d0JkK0JSY3Iw?=
 =?utf-8?B?RFRUN2lWbmdIc1I5WjR3bmhlYjNVTTUwT1Q5cnNZdCsxUUJ0dSt0UldrcEZC?=
 =?utf-8?B?Vm8xTEVSMHZ1UGJjem95bnBZU2tuVTFtVklvVkoyOXpucWQ2bElmOG9FeUdJ?=
 =?utf-8?B?d0NtWDFwL05YdlVPZmNCcnUzRVRLMUdiNlJ1VmNtYWtyOW5Lb3ZJZWcxNGYx?=
 =?utf-8?B?OWpHdW9vYTNZbUk1UDNPcVdCRHlkbmRVUU0rZ3JPQlJjM0RMMEh5bkpMMktC?=
 =?utf-8?B?cDFiU2JYd002aFdiTjhiTTJnUzdPZEZmT0JZM1dsOG5hTXpCVm1henhHdmZI?=
 =?utf-8?B?T1ZBRW9wOUZHZlpsekZuR25lZ3FiUGtXSzhUMHM0c0xJTnU4OGY4Z3Y4OFE4?=
 =?utf-8?B?RWQrWUVDVk1MYStTcHo0WXk2VGk3Y1lKcEZZT0d6ZDFpREZRYXQzWmUxNENv?=
 =?utf-8?B?dmxvWnZyNjA1dlBpbFdoT3pleFE4UGVlYXo1cnFYMFE1MEpRODZpRGhHQ3pC?=
 =?utf-8?B?b252bjR1bDlZOWdLclZFdkVHdDE0c0xaSnBSWVlPVE9KVXMrUnFwZEJ1b244?=
 =?utf-8?B?MlNhcmgxM2Z0ZE5CbE9XRzFhQXFsWmFLNEJORGpuRmQ3ckJQT01vUWZTcC9K?=
 =?utf-8?B?ZFZscmVJc0tmcCtremJpT2ZyZXNsWHg5S3RZVllCUVFxWVdBWTBlQ2l5NnFx?=
 =?utf-8?B?TmhNWkUwMXBpWktGTmk1Y254MENIUGdwL2VFcDFpcEl2QjFja3pUaFBkMUph?=
 =?utf-8?B?TEl5L1pTQ0I4UjBUMWNSY2pHMUpwd0dST21hNFRMellUQTh3aXNiRGdVenpS?=
 =?utf-8?B?ZWN4WFdaUGcrQ1REcHpxZk40SEIxTExnbDYwRFZ3WXRDMmtpN2hub2dzK1lm?=
 =?utf-8?B?WnN0b2hTeG5VVG1MWVhNU1VocnhSaGQ0TU5FaTFMT1MzV3ZOTUtDWE03ak5Z?=
 =?utf-8?Q?XpxiJeC+xy+Zs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUwzSDdOTlZqdTRaVDJXc0Q5QmVkSXJ3L2hKR1Nrdk96TCtTc0JoWFJsTGRq?=
 =?utf-8?B?NkdLcDlKN0xwVTZoeThiVlZ5bk9HdGVvL3FiMEVqcnRnc0dXcGRMRGtOeGxQ?=
 =?utf-8?B?RXo3elpNWWUxRUZVWUhLd0NCWGVVNno3NkNiZVR6Q2dUMG9NZzFpTVg5MVBx?=
 =?utf-8?B?YUNtOGprYmNKYUFPdnBUREdKUUlHM0dPMTBmclViVUpjMUM5WjFvQjdDL3ox?=
 =?utf-8?B?emFsVnNucUcyWnhzOUhGbDh5bjc4emtGUVRTZDFrQUVzNDdJSm90QVAyNmE2?=
 =?utf-8?B?eUhyWVc0NGEwM1ArU1E3NGViZnBIQXZCRitWdXBnZGRyQjB5NkJKRzk2R2Yz?=
 =?utf-8?B?blNKNVhvanJxNU5OekZmTU9YRFJ4TmpHMGNRbm11MThCMWxTeWdMakFnTm1Z?=
 =?utf-8?B?UVpXYnJhVGo5VDBKUnV5NllvWHlLYXVpSmVSQ2thUDRzYlViczM2UUJIRnVl?=
 =?utf-8?B?RlFQTFdFSFFNVXRHSFVTTFh6RE9vN1N5WVkrRHpuSTArMkx5cGYxU3EvQURV?=
 =?utf-8?B?cEozekI0bG96NmNLNk95U0VJaC91OC9jTUxCelVvaExJbUp1azAvY3ZqTUpY?=
 =?utf-8?B?UnZRb2VUb1FSREQxY2w0QTdLVUVzelM5Mm9jb3BDdnN1Yytocy9MeEN0bEFT?=
 =?utf-8?B?WWZDZjg1eTFHZWk1RWtyN2p1cnZvZFkxRmdQS3pBdzNONmYxaWFRNkE4WWF6?=
 =?utf-8?B?M0orMEZRUVExeWJ3UGFPaGh3UWw5VnFYTE0yRzB6UGZ5SlBHcmpTbnJHS0pT?=
 =?utf-8?B?Z1RIZC8yU3NNaEZPYnFQbXJwdzBFN0MxMDRmdko3MFdGQTI0dytEZSthSGZW?=
 =?utf-8?B?cmV1cEcyNFBDRWRGZ2V4TmhYUmNQaTJXS3BsRWNBcDk5Y0lJWjRpQ0tnOU4z?=
 =?utf-8?B?cmlxbklKYVlUYzhRZnpWQUo5eDFxK1I0djN0UU9ZZU9aSXlWcEZ1TmtLSHdv?=
 =?utf-8?B?eUVmUVFKeWxselpuQ3creXJDQ0QzTnhUdnZ5KzBPU0ZDK0tzTHkxbDR2RFFS?=
 =?utf-8?B?SkhFSlVyNHRIQTNCM2Yva3l0b1B5WG1sZHYxaWhXN0EwOFFkY3o4aHo2M2l1?=
 =?utf-8?B?NzNvR2RyQWNGMGZWUEltc0NjeUVQWFNMNjRpSS82dVVXeHQ1TDJWV1I4ZHg5?=
 =?utf-8?B?ckxNaVNrOXJ2cnVQWmx5RVhpM2dBSmIwcVpLUGRaVEZVWm5nUG1aOEtEY1FL?=
 =?utf-8?B?akRmMitZM1MyR1ZhU25qS21nV3hadFlWeHIxYk5iVWEzN3Q4V3p0ZitTd2dt?=
 =?utf-8?B?L2NKYVhQcE1wblF4NjF0TWlCVzhWbkg0WStLSUp5cmFjdmpPN200UldhYjRU?=
 =?utf-8?B?TUhIeXhxaWg1aVh0TnZOMDBJaDdwWXJITitITmtySHNPMXhLcmJyczdIK0U5?=
 =?utf-8?B?bkdZeVJPdjh3UUtVZHIzczdmMTNhWVZNS3hVbzhoWlJBU0VSN05tMTdRQlB5?=
 =?utf-8?B?VmtTMkYyalBnQlBqWWhNMmNsRDMrZjljY0JRczFrTndBSnlDNjh6aldmV3Bt?=
 =?utf-8?B?dmoyTnRuTFRCWmsxRE9UTWhiU09obGM5RXlsY2RsRU9lMW5tZUtyVEl4SUlV?=
 =?utf-8?B?Ri9DR2lFc2tnbkk2eWtocFBNTUFnSjBodldDa0VKUkVLdCt2TlQxT3JCTzZq?=
 =?utf-8?B?QzdJMWtja0JQbmtBMWxmVzNYYjRVNEkrN3NLVlR2SHRuZGVzakhsU1cxVlI5?=
 =?utf-8?B?Wmorek15eDlEK1pvWkVqZTdGbzNSRi9uT2tSUy9STjNSWVQ1MDFya1Jma2xE?=
 =?utf-8?B?eUhBK0ZNNGVWcFZaMjV3N2NDWnVoL1hmUzQ5SFErdmlXNTM3cjkwVjFiOFhB?=
 =?utf-8?B?R1loeVdPWVV3c3ZEUVlJeFZGNlZ4OUVGeHRBUlhJYURtckJNSUYzZEtYTjNt?=
 =?utf-8?B?OWZmWFlQNEVGMHVKWEhObWU2d1JpRDNCQ0dXdVNoZWdrVW5YQlNTelhCcnN3?=
 =?utf-8?B?YkNUV3pFNlcveHBoUWc1NThBTUNTWVRocWNSbEdWU2h5VWVhOGlCa0FtOVhD?=
 =?utf-8?B?bVlLUndoaTY4YWpieFArYWI4VHg2ZUh3VTQ2ZmF0V1FCSjlTbjMxYktybjMx?=
 =?utf-8?B?SFJrcGIwWHhwTHNXMjJjelJBNUlsaXZqM095RnJONTJKQzkyRFhDejE0UG5K?=
 =?utf-8?B?eVdWTG04QXA0WU5QRmFZM1F0WHA0eldLUkVLeTM2REprRnA3Y09HQjFJOE1o?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6ff1cc-d709-4fa1-0d7d-08dd414fd944
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 17:02:16.2154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebmmaf5YpO1ztUsL3pO8+wf6dz5BK4jGHu0+x7bFVyOXoZg317cyyh2719bQUcNZqqbttHe873P53Xxq/yA2DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7683
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


On 1/20/2025 21:34, Marcin Bernatowicz wrote:
> Verify the occurrence of engine resets
> when non-preemptible workloads surpass the combined
> duration of execution quantum and preemption timeout.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 126 ++++++++++++++++++++++++++++++
>   1 file changed, 126 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 20ec15b22..5999c3f98 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -605,6 +605,119 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   	igt_sriov_disable_vfs(pf_fd);
>   }
>   
> +static unsigned int select_random_exec_quantum_value(unsigned int min,
> +						     unsigned int num_vfs,
> +						     unsigned int job_timeout)
> +{
> +	int max = min(64u, job_timeout / (3 * (num_vfs + 1)));
> +
> +	igt_skip_on(max <= min);
> +	/* random between min (inclusive) and max (exclusive) */
> +	return rand() % (max - min) + min;
> +}
> +
> +static struct vf_sched_params prepare_vf_sched_params(int num_vfs,
> +						      const struct subm_opts *opts)
> +{
> +	struct vf_sched_params params = {};
> +
> +	if (opts->exec_quantum_ms || opts->preempt_timeout_us) {
> +		if (opts->exec_quantum_ms)
> +			params.exec_quantum_ms = opts->exec_quantum_ms;
> +		if (opts->preempt_timeout_us)
> +			params.preempt_timeout_us = opts->preempt_timeout_us;
> +	} else {
> +		params.exec_quantum_ms =
> +			select_random_exec_quantum_value(8, num_vfs, 5000);


Looks like existing macros can be used.


> +		params.preempt_timeout_us = 2 * params.exec_quantum_ms * 1000;
> +	}
> +
> +	return params;
> +}
> +
> +/**
> + * SUBTEST: nonpreempt-engine-resets
> + * Description:
> + *   Check all VFs running a non-preemptible workload with a duration
> + *   exceeding the sum of its execution quantum and preemption timeout,
> + *   will experience engine reset due to preemption timeout.
> + */
> +static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
> +				     const struct subm_opts *opts)
> +{
> +	struct subm_set set_ = {}, *set = &set_;
> +	struct vf_sched_params vf_sched_params =
> +		prepare_vf_sched_params(num_vfs, opts);
> +	uint64_t duration_ms = 2 * vf_sched_params.exec_quantum_ms +
> +			       vf_sched_params.preempt_timeout_us / 1000;
> +	int preemptible_end = 1;
> +	uint8_t vf_ids[num_vfs + 1 /*PF*/];
> +
> +	igt_info("eq=%ums pt=%uus duration=%lums num_vfs=%d\n",
> +		 vf_sched_params.exec_quantum_ms,
> +		 vf_sched_params.preempt_timeout_us, duration_ms, num_vfs);
> +	igt_assert(duration_ms);
> +	igt_assert_lt(duration_ms, 2000);


Can we use some macro instead of "2000"?


> +
> +	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
> +		    &(struct init_vf_ids_opts){ .shuffle = true,
> +						.shuffle_pf = true });
> +	xe_sriov_require_default_scheduling_attributes(pf_fd);
> +	/* enable VFs */
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +	/* set scheduling params (PF and VFs) */
> +	set_vfs_scheduling_params(pf_fd, num_vfs, &vf_sched_params);
> +	/* probe VFs */
> +	igt_sriov_enable_driver_autoprobe(pf_fd);
> +	for (int vf = 1; vf <= num_vfs; ++vf)
> +		igt_sriov_bind_vf_drm_driver(pf_fd, vf);
> +
> +	/* init subm_set */
> +	subm_set_alloc_data(set, num_vfs + 1 /*PF*/);
> +	subm_set_init_sync_method(set, opts->sync_method);
> +
> +	for (int n = 0; n < set->ndata; ++n) {
> +		int vf_fd =
> +			vf_ids[n] ?
> +				igt_sriov_open_vf_drm_device(pf_fd, vf_ids[n]) :
> +				drm_reopen_driver(pf_fd);
> +
> +		igt_assert_fd(vf_fd);
> +		set->data[n].opts = opts;
> +		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> +			  xe_engine(vf_fd, 0)->instance);
> +		subm_workload_init(&set->data[n].subm,
> +				   &(struct subm_work_desc){
> +					.duration_ms = duration_ms,
> +					.preempt = (n < preemptible_end),
> +					.repeats = 2000 / duration_ms });
> +		igt_stats_init_with_size(&set->data[n].stats.samples,
> +					 set->data[n].subm.work.repeats);
> +		if (set->sync_method == SYNC_BARRIER)
> +			set->data[n].barrier = &set->barrier;
> +	}
> +
> +	/* dispatch spinners, wait for results */
> +	subm_set_dispatch_and_wait_threads(set);
> +
> +	/* verify results */
> +	for (int n = 0; n < set->ndata; ++n) {
> +		if (n < preemptible_end) {
> +			igt_assert_eq(0, set->data[n].stats.num_early_finish);
> +			igt_assert_eq(set->data[n].subm.work.repeats,
> +				      set->data[n].stats.samples.n_values);
> +		} else {
> +			igt_assert_eq(1, set->data[n].stats.num_early_finish);
> +		}
> +	}
> +
> +	/* cleanup */
> +	subm_set_fini(set);
> +	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
> +	igt_sriov_disable_vfs(pf_fd);
> +}
> +
>   static struct subm_opts subm_opts = {
>   	.sync_method = SYNC_BARRIER,
>   	.outlier_treshold = 0.1,
> @@ -682,6 +795,19 @@ igt_main_args("s:e:p:", long_opts, help_str, subm_opts_handler, NULL)
>   				throughput_ratio(pf_fd, vf, &subm_opts);
>   	}
>   
> +	igt_describe("Check VFs experience engine reset due to preemption timeout");
> +	igt_subtest_with_dynamic("nonpreempt-engine-resets") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, vf)
> +				igt_dynamic_f("numvfs-%d", vf)
> +					nonpreempt_engine_resets(pf_fd, vf,
> +								 &subm_opts);
> +
> +		for_random_sriov_vf(pf_fd, vf)
> +			igt_dynamic("numvfs-random")
> +				nonpreempt_engine_resets(pf_fd, vf, &subm_opts);
> +	}
> +
>   	igt_fixture {
>   		set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
>   					  &(struct vf_sched_params){});
