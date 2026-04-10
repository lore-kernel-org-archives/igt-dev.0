Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49105E99059
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 09:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA39910E8F5;
	Fri, 10 Apr 2026 09:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjj5kM8P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557F310E8F5
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 08:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775811594; x=1807347594;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TdfUj6Ug9A09PaiM70tDyrwbCf4MNaWNXoPkSOmgL/o=;
 b=kjj5kM8PooingrsandmQJLsU5iiOqkJGm55JC2hauxnHSVB+njQ28+tI
 bVbck0yW4xqutv/D+w7itMBw97r2JJnlX28EoCdzhnAhBwy1tIUFuWsEj
 UJjSWwxxispFaFXa0bl0O/v+2YE3tSF+uM0FJQ03HKu00OKFqsABGIHxH
 5RsWLeJh3yHIou6P8lljyQ7JFdRvru7GUmkzYo2piCI5z1npzGHT67lbi
 4elCCVvQX8s+1zpDBQ3UJ/1aBjlIfuOTW9Xx1utHdHxMjQAIjLsswW285
 bOprW8xMWkrZUx06biKq8WlzbH9BIoFvRV9/tOKMsdyNoogVPQudZrENC w==;
X-CSE-ConnectionGUID: gTSMFSP2QBiFM899NDSe0Q==
X-CSE-MsgGUID: Zg5Tyi6nQQqx0EhNVtmv0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76847549"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76847549"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:59:54 -0700
X-CSE-ConnectionGUID: VTh4aBscSZe4tiQ96zEWHw==
X-CSE-MsgGUID: uIqrWY/nTfCRvlcmcRazXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="228917557"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:59:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 01:59:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 01:59:53 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 01:59:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asAndoyMOXOBiKI8O1qE+A5Q903OS8ej4ZAVGgdKdLaX5NudZoS5h+GxeBoqH0Cn9Ne7FZ/IpKNeacZhbp79CFvktrgSR4yj/xMfytNxrg+G+3iCQZXU0EirVec+RXgJGduAZRPbKafmZKwn+hJR4eYnH/qDXbkkGjzQXY4/2kmsnyTYQqc/v3pXA1C3fnEmAu8LwugL1pFgj+UNsfcoFvdy7sYfpxnUA8CrgCBcy2L1aWKlVFn1UIpKdUKWuk/SfIGtnwsUi67N+lsN9l/YD7/yBAwst6GyrrLVGbBz98iQkrY/Yi2ssXDh2PHeUVyLfgyC7/ewgU/IPsWxmcQ3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kjM0XXjNr2RDnh1P4eH8JiVAy3d4EICXEKHS9AZA7Y=;
 b=oNA/QZWAVDB1/DpIXR0druEsZu9ZxKrRmcysBbmN9Ef55GFUO10Rifb8iCpeJ25Vv/+0nMUS0Zy3ICulyj+Cfgag6aPDe5KIWuJmWhYFsElkuxeVLEolnw9vyMBVo0790SttEZmT8dmlAAUY6SSXbSCW/rGmEHIFyNI8b4dGrTC/Nuape/KxiEWOmC7x4S+ZRsg+sqRZ7VX9u0ad0wU00DxKoJYEhD0AVB5GueMzQi705ERsT0+uRGFKVgKeV+WT8xYpCF75vRlICxl7xcNieRpG4SjEGtyo5RpyzIK+1mMUJ1zLa43WuH8qbtSsjPDpBxYJ61fTF+o7pW/WtrXTXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 08:59:50 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9769.020; Fri, 10 Apr 2026
 08:59:50 +0000
Message-ID: <2ac85b15-8e18-49fd-a33f-e420f6d7b046@intel.com>
Date: Fri, 10 Apr 2026 14:29:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 5/9] tests/intel/xe_madvise: Add
 dontneed-after-mmap subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260409070118.2211602-1-arvind.yadav@intel.com>
 <20260409070118.2211602-6-arvind.yadav@intel.com>
 <958dbd9c-cbaf-48aa-8375-16e7b8f304d3@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <958dbd9c-cbaf-48aa-8375-16e7b8f304d3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::19) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH0PR11MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 248bf5a8-53f1-49bf-70fd-08de96df8604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: +aNGb5oQpqRCfsW5x0DWd7kyrZSf0S1+eZtikPehdU6RI4zOCAEBCoTS62xTDYk+z4y7Am9biJRb6j81iJC4G944h2W46PujXSnZfuFnOnPwwKVwicG7Y2fMIAKaniN4GI4LCw2bfrPzdSGvB+uqjjwQSckL9Lq7Ii5HVELoe1AGJDEYwBCXJJWgy5V2dKB1jBL3fnLdzIRwFQzQvDYahJzpUZ70z8zfIRn5r4NnxuUzynP2/Voe90ypDUtxXIITJhN3NmvT3o86MGuVD+w0FAbm8iImVZu1m+A3gfpuia1RWkW+zUP0rocB8SCRvf2gWzFlf7pdaCbdh52PH/sL3EBVcI38X1IYtTnIbiZUeWBOFp2k1OCrZKEP2oVVWFo//eTF18IH5bN/i6hqNkFLEX2xG952TQfe0ooOkWfCS1ccl1itiF/ncQWEsYNkCb4m+OdIlZqHQt4TFJUo+v/RpeXfw0eaVEgdoy3fVORLL/7chug3udvTISvb0neujTIU9EPOr/MBu+oWUBCazl2tK9vrhpkCbHFRra1YGKn8IFh491bJvqrYrhsTWP+iBhyZPd/kClGu88zGrAY5TSjbGYbnn8oZUVH9O1CAurI2/NHbk0eZvR5yOjD3v56GOMAd5uyeXiOxBQbXjzHnxbNCUlsBSgvTG7KmRJ5NekhVjibTDsQcF+NEo9IkNViBEArMZpsPC76/nl/xaQ9p/nmk3zBX8IXDQo2GcWHJgOed33s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlpsLzhpTHNXL1ZzL0ZoakE4TnhQVi9NanB2MERmdWVOUjFpbHZhWlBvNjlV?=
 =?utf-8?B?WEtlMGgrOFU3WjBwTlZWaHF6WXB4UkcwUDd4TW5lNER0WnNqSE8yNWhWUzlP?=
 =?utf-8?B?dDAwRmJPVmdoNDhQcDZyMmpaQ3RtUHBTcVFIYUp4MWVURjRzN2pQNDhpaGZy?=
 =?utf-8?B?R0Rla2VaL2FyNi9CSE80NHVMaGFOUHlvOVFFbHNwMzNESExabFZPbHRvZDVi?=
 =?utf-8?B?MWF4Z0VrRDFEWkR0THRhYmppM05vU25YZENXVmZzQ1lJb2lCTVVTOGZ1andJ?=
 =?utf-8?B?SVZGalVTL0JOejg3N0ZGN0lteDI0emdxYTNLMFJlSU9kZ3ZDenI5VmYvRlps?=
 =?utf-8?B?bDBPdmNEVlVYVXcrdHlKeU50TWxod3RZbHdhRTZoczJUWGlCZTRzRE9YK0lQ?=
 =?utf-8?B?SU1HZzhmbjVOQnpNS29SL3BlNlE4ZUcvNVF5WEhJQUtpdTFqU1hWN3Z3ekdv?=
 =?utf-8?B?b01VTlBaV1Fqbm4xejBGRnJzSjN3b1lsU2hRK0xlTEFJeFZYMzRSOFVoQVhH?=
 =?utf-8?B?UFY0eWk2OC83QlNBNSs3Zk0wOEl3RzY5aW9xUXROdjRZVThoTjBzczFjd1Ar?=
 =?utf-8?B?V0cza2ZHaEd3UGdVc2xtWE9vb255T2hjbmpRYTVldEpMbmgvNDZ6TWRHTE85?=
 =?utf-8?B?aDJVZjd5QVgwQnZzeUc0aEs3SXhET20wMDVCMmNLWm9wc2JBTjFaSjE5bldQ?=
 =?utf-8?B?WWMyTUtwQWdaV2pWeDNwcElWMmNTVU1KSGRQajYrWnhMNis2M0V2aFFjK1Yx?=
 =?utf-8?B?NEFEMzFXZjROVC9nR2dqUmU4dmxITmxGMDREb3BVN0JoMk9LRXp6UGZFaHRl?=
 =?utf-8?B?WkFGQ01ZSzYrL0UxSGc5ZGxVRkR5YmhXY25pcDdZZEgxOVlsNGtmNS9VUGVL?=
 =?utf-8?B?OW0vUGF4ejhUZkxjY2RudnhsbHNkWHBkcG5oUUpjZ291QjJjc0RFN2t2Zk5u?=
 =?utf-8?B?OUc3c3dDWTd6di93VDlMUFlUWVFvbHg1U3A0WWh5N0NYdSs1dkxML1ZtbzY4?=
 =?utf-8?B?ZGZXTmh2KzRQbWtxaEdOY2pVbFgxTThpeS9naHdtdHFrdlQvOEUrWEJUaHh6?=
 =?utf-8?B?M25LTVA1dUNUZGZtOHg4bWdVQ1lIczd5Y3dOaTlqM09JZ05ROVh4MjZNN2E4?=
 =?utf-8?B?YTdDTjY5Nm1lTUtJN0N4UnFrb0xZZ0pud3dubE1keWVnR1dVQXdtc0FSMita?=
 =?utf-8?B?cEJyM0lvNU9udjY2RUwwaEJlbnUxM3kxbkEweHVvVmhpMnVKTVowekZnQnlU?=
 =?utf-8?B?bVNDVGhEbjVaaWFlMHhRdUpIbVZMWERyaUYyZXFUckRTdFRrQzJiMDFrRGps?=
 =?utf-8?B?cGg5UHlUR1RIY2FUSzdvbU9XUHRPYkplWWxuNkpvOXN6VTd3Vk96L2xidk5X?=
 =?utf-8?B?ejRuWXgrT2RpbFU5R3FsUE1LZStLdDhxRHg4dTdpVkdONkYxTHJDbm14b1lF?=
 =?utf-8?B?ejFYYnRkZ2pJWDloYkJRL2VuOXc4UFJ3TGlsdHZKVWZPcGFnVS9CbVRJYmFF?=
 =?utf-8?B?N0RhcTg3SG5sTXpyTkN6ZmxKc2NIaGFhUEdsM3hOdXlJMUh4YlJ0WkVpZ2JQ?=
 =?utf-8?B?M2ZLdmFDSHpBS1FBOENBODdiQW83ZElmcGxZSVBoT09wZjJpOUptR2F2cTVx?=
 =?utf-8?B?VENKTGZ1d01wM3ZsNkxlVS8rQVJBSlFCWG45ak5BMXZDcDNWZXBoS3lndTFY?=
 =?utf-8?B?WGplbXVxdFFoUFRIOFpJbTNyWmhOU1pVR2FVV0VhQUFOQVVNR3dFMFk2RnE1?=
 =?utf-8?B?Y2JuNnBjSkFpd3NvQXlVakt0LzFIRVRWd2FrTU5IRFAxRVliVUY4RTRWc3lT?=
 =?utf-8?B?Sndjbnl4NlNGczV2SzEzWTRQb0d5WXQ0YmRTMUJnZFJFZEorQkdteVdSOFZw?=
 =?utf-8?B?b3Jic0s2VWpad2l0V3BRVmxZalF4Mm4yc29zZmlBRDEvN0R6d01kaGYrZnAv?=
 =?utf-8?B?VkJ6RS91ekNNY3JBc1p4TkNRZW00K1JiOUdJdjl4dGNtUTh3NjJBbTA4UDda?=
 =?utf-8?B?NkUvaHVFRjkzMDltdTJ1Z2JsSXc5ZmdicXMvclRya3JWUzFHQTlaa3VaSEZx?=
 =?utf-8?B?SkF6MFBOVmRNOG15cVlsb3dpcW41RTVLNVRvZHdLbVNTb28vTjB5dEU1RUp0?=
 =?utf-8?B?OGRjc0l0RzR4VWVWM1phQnVXMGxaaGNKNUIxY1hZTzVHL1o1S3ViTVVwSVZ1?=
 =?utf-8?B?Y2twNzZwckNLbXhSbjl3cVNkUUxmL2xvRmtpbW5SRDkwYmZBY0RZQzNNMEdC?=
 =?utf-8?B?SFBoTjBNdHpVb2hLdmhpVVFrbGRTRjNxNENMY0UyYlRacGdDTWk3c1N4WDMr?=
 =?utf-8?B?MmptQ3dubncxK0M5cVB3bkNPVVFJdnlhenV1OVk2MTBpMUVBQzRMQT09?=
X-Exchange-RoutingPolicyChecked: ZHSgVIafMJwcsqGbZUoUx4I7+xT+hL1lZ1D4b8taZm6nepHBXTzpdeO9C/z4QFK2XqkvbqMK9Iv/Xg6rr4aQqNBjchQg+ngBdXp/ZBkQz2kTkNaFa2Jw9hNuKpAwvtrZlhaLB9FdEtyg3ZT0Wt+/sokhRD45Ea5zWfhS4cIPWQOvtndcFnApHPilYSF8xNnxadLYTy7JcnaR6nsJpXO/U5EkxkBNCufAXlJBnGvl3TRZ6RKe5vMCw4atNzxqpNNWcy6jxSDvlH3GDZC38mt9AKD1S/oJl2a9TKSCP7D2r++nyO4c+m/kQ61Z2J2hjkFaRgqclq298EqTg6UywlohWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 248bf5a8-53f1-49bf-70fd-08de96df8604
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:59:50.7874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyyJrpODT43X1S/UCqo32gq5FtNyHlgnIIgfZYDL98NBPDwa0+brvNjU89Q+pHc6XfVPTwTYYcPREdpREKSHwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
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


On 10-04-2026 13:52, Sharma, Nishit wrote:
>
> On 4/9/2026 12:31 PM, Arvind Yadav wrote:
>> This test verifies that an existing mmap becomes invalid after the BO
>> is marked as purgeable and purged. The test creates a BO, maps it,
>> writes data, then marks it DONTNEED and triggers memory pressure.
>> Accessing the previously valid mapping should now trigger SIGBUS or
>> SIGSEGV, confirming that existing mappings are correctly invalidated
>> when the backing store is purged.
>>
>> v4:
>>    - Added proper resource cleanup before calling igt_skip(). (Nishit)
>>    - Added assertion for xe_bo_map. (Nishit)
>>
>> v6:
>>    - Fix sigsetjmp(jmp, SIGBUS | SIGSEGV) to sigsetjmp(jmp, 1). The
>>      second argument is a plain boolean savemask, not a signal set.
>>
>> v7:
>>    - Move sigtrap/jmp_buf in this patch. (Nishit)
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 71 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
>> index 619d64b46..2d5acc347 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -153,6 +153,13 @@ static bool purgeable_mark_and_verify_purged(int 
>> fd, uint32_t vm, uint64_t addr,
>>       return retained == 0;
>>   }
>>   +static jmp_buf jmp;
>> +
>> +__noreturn static void sigtrap(int sig)
>> +{
>> +    siglongjmp(jmp, sig);
>> +}
>> +
>>   /**
>>    * SUBTEST: purged-mmap-blocked
>>    * Description: After BO is purged, verify mmap() fails with -EINVAL
>> @@ -227,6 +234,64 @@ static void test_dontneed_before_mmap(int fd)
>>       xe_vm_destroy(fd, vm);
>>   }
>>   +/**
>> + * SUBTEST: dontneed-after-mmap
>> + * Description: Mark BO as DONTNEED after mmap, verify SIGBUS on 
>> accessing purged mapping
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_mmap(int fd)
>> +{
>> +    uint32_t bo, vm;
>> +    uint64_t addr = PURGEABLE_ADDR;
>> +    size_t bo_size = PURGEABLE_BO_SIZE;
>> +    void *map;
>> +
>> +    purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
>> +
>> +    map = xe_bo_map(fd, bo, bo_size);
>> +    igt_assert(map != MAP_FAILED);
>> +    memset(map, 0xAB, bo_size);
>> +
>> +    if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size)) {
>> +        munmap(map, bo_size);
>> +        gem_close(fd, bo);
>> +        xe_vm_destroy(fd, vm);
>> +        igt_skip("Unable to induce purge on this platform/config");
> Same Nit as in Patch-4/9.
>> +    }
>> +
>> +    /* Access purged mapping - should trigger SIGBUS/SIGSEGV */
>> +    {
>> +        sighandler_t old_sigsegv, old_sigbus;
>> +        char *ptr = (char *)map;
>> +        int sig;
>> +
>> +        old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
>> +        old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
>> +
>> +        sig = sigsetjmp(jmp, 1); /* savemask=1: save/restore signal 
>> mask */
>> +        switch (sig) {
>> +        case SIGBUS:
>> +        case SIGSEGV:
>> +            /* Expected - purged mapping access failed */
>> +            break;
>> +        case 0:
>> +            *ptr = 0;
>
> Here if suppose SIGBUS/SIGSEGV is not hit but mapping is invalidated, 
> here you'll get segfault. Remove *ptr = 0 and club case 0: and default 
> and
>
> let it assert as available


If we remove *ptr = 0, we never actually access the purged mapping, so 
SIGBUS is never triggered and the test would always fail on the assert - 
defeating its purpose.
we can say without *ptr = 0, we  never touch the purged mapping at all, 
so no signal would fire and the test would always hit the assert.


Thanks,
Arvind

>
>> +        default:
>> +            igt_assert_f(false,
>> +                     "Access to purged mapping should trigger 
>> SIGBUS, got sig=%d\n",
>> +                     sig);
>> +            break;
>> +        }
>> +
>> +        signal(SIGBUS, old_sigbus);
>> +        signal(SIGSEGV, old_sigsegv);
>> +    }
>> +
>> +    munmap(map, bo_size);
>> +    gem_close(fd, bo);
>> +    xe_vm_destroy(fd, vm);
>> +}
>> +
>>   int igt_main()
>>   {
>>       struct drm_xe_engine_class_instance *hwe;
>> @@ -251,6 +316,12 @@ int igt_main()
>>               break;
>>           }
>>   +    igt_subtest("dontneed-after-mmap")
>> +        xe_for_each_engine(fd, hwe) {
>> +            test_dontneed_after_mmap(fd);
>> +            break;
>> +        }
>> +
>>       igt_fixture() {
>>           xe_device_put(fd);
>>           drm_close_driver(fd);
>
> With above changes LGTM:
>
> Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
>
