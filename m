Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FED6FB5192
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 05:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D313610E030;
	Tue,  7 Apr 2026 05:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPAkQoTQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E33410E030
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 05:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775538584; x=1807074584;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7I9ff/JfzdmGflspf8wA59UkaxTUPbJIQ2mhxcG8PrI=;
 b=lPAkQoTQb0dwCucfhgkMTjt4DyoSpe3hR9HrYafawyJNtODPZI4nWTQp
 s8cTwiErCtNGZv2jT5Y1+c/3fXE9d0frzwwP9T3jVvYXLliAO4SKauTTI
 9YSw92uctN3rGDrIl/mH5R3QHZSQyehi3Iq80KIzY1JvG6fC9+OooMA4x
 9eiXmETWqagbkcBUf222jNoqrag9qBzB9FGdQV4XPGWZzZUQD1LDHQQrb
 /8aE5JgLR8pwwP81piOaS56AFlwDs980pqQPbvSa5nW+UEDyQ4Sj6OQ9r
 IVKiOtVMzYvH1r2pmflmhB7TyJVhqQMe0kW8YPRvobg5BuPeBqMVXYiqg w==;
X-CSE-ConnectionGUID: 6kco05KuSjaMC+EBe3dRoA==
X-CSE-MsgGUID: HS4zxwBDScisY+Gtomicww==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87117999"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87117999"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:09:43 -0700
X-CSE-ConnectionGUID: sz1IgE+oTMWDZJLuSUHMGg==
X-CSE-MsgGUID: QhbnV/C8TzKxRBM3FTOOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="232468792"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:09:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 22:09:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 22:09:43 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 22:09:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9nwBb7ylpVaHGaw0kTKDlKjqA7x7rNipyPmCYD6w7tV0GR8zPdPg1GBruAveMge3nU6Wh3PtufYPtyddfWPzoLcTZ0tUkb8e7QQ+OToZGcQb/mZlMrB9Yo6w3SeBZKWb6ffyra9PkqZ+3//7G3bewgrIWTc9dpw2IcpEsjvBD7dwMk9ZynjQnGukEd1biIRa7q5BSCIWSh7u7CXHTOwD2LgvmvV9UdssoN44o2ALW07yZOWbP82oUWGXMDprjMvQ/PyH6oO4egRvtY48BPCaWsKo6xdOCXZMjdyNTi4GjD8qe2sgw88W2BP6CdBfe4kzuR9s7rzHvJzFgt5vJ1Irw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LvrFMhDuzs9JstJMMGuNkRlrT2rB7oOPPTp80Hv5bA=;
 b=gh+VaEjiTzELsHasL4h6P9G+DC7Tti+SQaTOMB/vV3xcjCxo32iiYg6TnXgAX9+0CWKKLdHFalJQTz2MycvUSBEvkv4MtZSFo2gFPyKDu+ysHhwzYPG5SLYaIc2wZkJDtXlwYO/VwN1rXJ8IS7YwMgQh0qrc8Y55sZhYQo/g/SXsaTyHpb4sp3p+buQ3Ko5mSHMtIh/YQRo/NMsHckxfGkio6azz+Dj8IHOxOEq4WEywPekeN0w+PXZAoWYo0nW0WDtbT+OokzpCnHd6y1/TOxrMLH1m3pC0930oRx6eFSux2E/9BEHnYlr478dor3W2MI5sKpbJu5KwB4T++S5OnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by IA1PR11MB6220.namprd11.prod.outlook.com (2603:10b6:208:3e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Tue, 7 Apr
 2026 05:09:39 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 05:09:38 +0000
Message-ID: <d004c9a4-94a5-464f-86c1-6eab9dafc3d9@intel.com>
Date: Tue, 7 Apr 2026 10:39:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 4/9] tests/intel/xe_madvise: Add
 purged-mmap-blocked subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-5-arvind.yadav@intel.com>
 <41012de6-8a70-49ed-9332-1746598c8e51@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <41012de6-8a70-49ed-9332-1746598c8e51@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::24) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|IA1PR11MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 1547eebb-068c-4b89-4b05-08de9463de4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Qrjzwys6fNtnFGwafTEXBWeO5gFPhxLrRLXB7l9uBsn+163Cenj+nJnkUmpf957gPcbG04Zr3MYTS3ov/IgBfy0BdlwFVCqR7EV4rS1hA1hSAbYx0OVAZS1lfEROIPNmPhT46lqQdQn4iNFQGm6BFZmED3gedDL0k1sENqQ58kwWVY4mMy/Kby+wCBBTm9NbpEh0izQfkpjgBUhuCWF8M11xCv5pv+bamUNvoEgWimJJZG4rb6wJth+MGxuzKW05T3nAjNAASnevhRdG0dikrKNsH1kVe6VtCWNHZGs1OHkgIF4+SccE2+b/eYmudKbXJip859ByNGojG8ZNRBs9H4HQUV37iGD8RSfZE0fpxBIUxpTrkjrhWDflhkbrQ+9gU0Zgs5ciNfl436SqAd10LgUu7fz73myJHBn60cP0q/kgqF/sbpqWrGDFF0qUZ0I/Y1SnLECbKGxF/mflPVJBqpR1JXEncB2bngoJ+eJMrz0i11h8nboN7kmhBY3wY5sdzZVpkJt5t6sphOujLw28fUooJuUlox9ED9x936uRnr5aPEOJL7MLgmaiyY14eD6nmzdidPOsbitBR5IptEllQ7ooO1bFRjwStWym2TekZtCm3mM4XUKVMYE+lZuREE/KYpegu3yx7536YPK2JSViX8Zjqk92UVNZeE7TP+w22DYBAquaYYyN6UlX6/+cWbds4HeZqO8LFjb4Jkl85vVFj8LETOYHnyGkwGyoq4JUh+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkxWdjhncFN3MTVaajNLTVBQc3VvT1prUmhZdmJWbXNDTG5pVEFTRHBxTDl0?=
 =?utf-8?B?TVJlQVY0Y1hycUNLSTU1R0Uva3ovdEVDODErS2YxRVZEUjQzWnBwWXRDZ05a?=
 =?utf-8?B?bW54QXFGTnpVYVJyTHhReFN1d1FsRWFtVTNXL2huazYzZytTMlljd2d6MG9z?=
 =?utf-8?B?RFF6YTRwVlB5U1kxTHFiZmdDbHc0NDROTk9pczgwUmpiNjF1MXkveWRkU0F2?=
 =?utf-8?B?YzBOVXV4clhhV28yL3dlQ1lEb0VhS1llUWc1WU9KTFp0ZUs0VjlxUWZCbmwr?=
 =?utf-8?B?Smd0RVJJWm01Q2hZSHFPNDcvcU1MMHFoUzVjc2IyNmpIUDA0cmhseGs2cnJa?=
 =?utf-8?B?RjNrUnFib1Z6Q2hPT2lhbGlBY2tMUkV2M2hKajFiNTlHS0VqOUUvSVhCWjUr?=
 =?utf-8?B?cHFoWjh4TktSalBVQ3haUkZ2dVoySEorbnA0VER5VEZXMlNRbWpXaVZIMnE0?=
 =?utf-8?B?blkxUkJlRlZvTWcyUHF2ZkV3YUV3SUlRMW5BRGh3WnRUN0IrK1ZYdGJFVjJk?=
 =?utf-8?B?OGlkOEk4L0d0TE53WlphRXNSc3djb0JrZlJUYnRCSXEwY3I2ZzlEdkU0bU4y?=
 =?utf-8?B?Y24ySTZubW16dVlnNUkvRVUxT0hmMjBJS0dOSkxDOGVNblpwa25OME5oL0tR?=
 =?utf-8?B?cGZ3Yzd3N1BteHdaRFp1S0M5K1l4bmc5bDVEc2ZyQlRrYWQveGk4cXJ2Vk1X?=
 =?utf-8?B?djlNaGd6STVSYmtKeFpobW5CNnA1dHNjYjZvcHJJdTZDN0JLZWlsRW1mZ0pK?=
 =?utf-8?B?Mk0rWFkyaWtKc0JwcEZINy9GYUx2ajg2cHREb2xmQXRZYnUzRHorTkJMZjcx?=
 =?utf-8?B?K21xSkwyNTlmV1JMK2xtbDRDZVhKN093WXNaZE9ZbTBsTmFVampCUDhBSjQ2?=
 =?utf-8?B?RWZtMExvMTIvY05lUEozZFZXMC9hKzhsTzRXSmFlcFNUaEYxeFA3aERTZ2JU?=
 =?utf-8?B?Uk9JRzJFOWxrd0tUTGp6UHJtTEFKUzBYaGQ4QU1DcG9HTjVycEdxSnZ5d2U3?=
 =?utf-8?B?ZktveHNCVHV1U1pPQlN5d0lDeVJ2RFRWb3ZVWGVDcDd1Q3RwajlickNqWFlz?=
 =?utf-8?B?V0V6bkpIWWNaK3RhbGRuUTNLdStiV0dxTlREWXc1ZGpvZHpBVzFnenkwR3NG?=
 =?utf-8?B?TXduYlJBWXFzRFFtVTJIb2QrS0FYelBOTnh0N3pKQlc3eThkZDFPTWJUYmVM?=
 =?utf-8?B?RkV1Qisxb20xa3N4ejJGQjFzWDhhMkZFRTBiUWNkYkVBVjlBbHVCaU1kTnEx?=
 =?utf-8?B?TkJBYytWV0dEbklzV2NKWk1FTWlOblNwQTJWSThlL1FSeDJzM0U2cEVta0hR?=
 =?utf-8?B?N0wzNzhrYmw0d2ljSXZySGRkdDNleUZwa0xuam9yWTlrZ1RibE04R3lxcVcr?=
 =?utf-8?B?WTZSVnd5WjhJeFozR01veUptTVR4UXF4R1FvUkR4ZjNGS05DVVBlRGpmTVM1?=
 =?utf-8?B?RExoWWd5cVp0VG5UaHpWYjU4d2cvU0x6NEJUaUU4d0xqQmtnQVdzSnZYajRY?=
 =?utf-8?B?b01KL21UV3RvbThoUDJuZEUwWmlWSnJpb0VmYlRsck9PWWpORzVlWW1mQXlV?=
 =?utf-8?B?KzdvckJ6MFRlaVo4KzJRQmRwSzgyYlNNbTV0cVdOZ0tEa1VmYVpjYk5ST2py?=
 =?utf-8?B?NmhRalhmOGVYc2tDNkhDYXk5eHlSaXI4QmFPMVVxam1wNzJMbVVDMzdKVlBr?=
 =?utf-8?B?dzE1YTI2YzNCQ2o2eEhKbEV1cEo2L2RQbks2bUQyNDI2M1AzYmd0aG0zY1lk?=
 =?utf-8?B?cHRaSG1ES3VKaDNHTkxaLzRSWno2aWZYd0k0eFpSK2sraHRxZmU2RU5ZRVFW?=
 =?utf-8?B?bjVxVlFZaFp3N1VMQTZMYUR6K0tXN1FyTjArS2FtVzVnQWVPT3RkTXNtZmJq?=
 =?utf-8?B?WUpOWVNxWkxvcUpJWTFHdHByYTh3Mi9MK2xGaERsT2laRFJXR3FFNGxUTk1I?=
 =?utf-8?B?Q3JadWtid2ljM09hZkIyTldXTk96OEFEK3gvWWJnbVh6RWlGdGxpOXc1YXRx?=
 =?utf-8?B?NzFDam1ocUpqSHFMZmw4dkJVcGxkdnZ6ZG9NOXlGczFsYzFrQ1p1ZENpMGNW?=
 =?utf-8?B?YmQ1SXpkSzNnZGNSTkdkTHdsWm13bHRKeDJvK0dVYS9XV2Mrb0hBajV4SGps?=
 =?utf-8?B?RDNsV014MXc1RE8zdlRSYUZuRmFaRXdXN0xVMzE2Lzlkb2I0S2ZuSFJuZSt4?=
 =?utf-8?B?SUlrM1orNFJhT0ZoYzlMY2FJcUc2VXZPbm9VTDNCNmZLcjVvcjFEYXVxcGlS?=
 =?utf-8?B?K2ZrK2hYTWpuNjdoWEVZMXhkWjZGYlhKb2RJU2JqMytnemVrU2d6MEd4UnFk?=
 =?utf-8?B?MGJia0kwV1FlN0FEbjR2MWxtRWI3aDMxSWtDdFNnazMwVUtWOEdDZz09?=
X-Exchange-RoutingPolicyChecked: u+d2x6pR7dSZm5cyZY8GPxPiZus4Iyx5fAZsCLUI0RwEjb6FOuXjFvwwaPN34Zg9WrY1EZEewe6120Vi7A/s5a06xJ7W+9XjFcuASWywq4Jg6vfFLIMp8aogc/B3OVbnbE2Hrm/DPSXfCboWlytx0mwEcjpXj8OzwbzL/HGK63K6BtoG5s96VnRjgpprCCWftRKdJPS5lGj6LcVyY5s+qHSdyaajXv9JXGL5DksFRA9+ietQgq6xFo23gQYbjp/P3xrhbO4aGynd+EoIwlsCJZxqCBiD5wZW7AR0cgGDihCJDIf5cVHvVAryudTgWth8fTLjlplp4v/L6GLYuP6bNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1547eebb-068c-4b89-4b05-08de9463de4e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 05:09:38.8143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKKzKgSqnOnLTuoVcoZ/OVkS31eepE6hgK6DATuoOlOpDQOp3U7pCHET3mYWDNRZCi67pSFPxhr7yoe4FwP2ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6220
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


On 06-04-2026 18:04, Sharma, Nishit wrote:
>
> On 3/25/2026 6:14 PM, Arvind Yadav wrote:
>> Add a new purged-mmap-blocked subtest that triggers an actual purge
>> via memory pressure and verifies that mmap() fails with -EINVAL once
>> the BO backing store has been permanently discarded.
>>
>> The purgeable check moved from xe_gem_mmap_offset_ioctl()
>> into a new xe_gem_object_mmap() callback, so the blocking point is now
>> mmap() itself rather than the mmap offset ioctl:
>>
>>    - DRM_IOCTL_XE_GEM_MMAP_OFFSET: always succeeds regardless of
>>      purgeable state (just returns the pre-allocated offset)
>>    - mmap() on DONTNEED BO: fails with -EBUSY (temporary state)
>>    - mmap() on purged BO: fails with -EINVAL (permanent, no backing 
>> store)
>>
>> v5:
>>    - Add purged-mmap-blocked subtest to verify mmap is blocked after
>>      BO backing store is permanently purged.
>>
>> v6:
>>    - DRM_IOCTL_XE_GEM_MMAP_OFFSET always succeeds; the purgeable check
>>      now happens in xe_gem_object_mmap() at mmap() time. For purged BOs,
>>      assert mmap() fails with -EINVAL.
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 42 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
>> index de4a6e34c..81e05b6d4 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -170,6 +170,42 @@ static void purgeable_setup_simple_bo(int fd, 
>> uint32_t *vm, uint32_t *bo,
>>       xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>>   }
>>   +/**
>> + * SUBTEST: purged-mmap-blocked
>> + * Description: After BO is purged, verify mmap() fails with -EINVAL
>> + * Test category: functionality test
>> + */
>> +static void test_purged_mmap_blocked(int fd)
>> +{
>> +    uint32_t bo, vm;
>> +    uint64_t addr = PURGEABLE_ADDR;
>> +    size_t bo_size = PURGEABLE_BO_SIZE;
>> +    struct drm_xe_gem_mmap_offset mmo = {};
>> +    void *ptr;
>> +
>> +    purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
>> +    if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size)) {
>
> This function should be defined in this patch. Going through 
> implementation available in Patch-3/9. In that below code used
>
>     vram_size = xe_visible_vram_size(fd, 0);
>
> What it returns in igfx platforms? Instead we can use
>
> /* Purgeable BO either in VRAM or SMEM */
> mem_size = xe_has_vram(pf_fd)?xe_visible_vram_size(fd, 
> 0):igt_get_total_ram_mb() << 20;


Agreed — using xe_has_vram() is more explicit. Will switch to this.


> if (vram_size > 0) {
>                 /* dGPU: pressure VRAM to trigger purgeable reclaim */
>                 mem_size = vram_size;
>         } else {
>                 /*
>                  * iGPU: purgeable BOs reside in system memory. Use 
> *total*
>                  * RAM (not just available) as the baseline so that we 
> always
>                  * over-commit regardless of how much is already in use.
>                  */
>                 mem_size = igt_get_total_ram_mb() << 20;
>         }
>
>> +        gem_close(fd, bo);
>> +        xe_vm_destroy(fd, vm);
>> +        igt_skip("Unable to induce purge on this platform/config");
>> +    }
> static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm, 
> uint64_t addr, size_t size) --> this should be part of this patch
> {
>         uint32_t retained;
>
>         /* Mark as DONTNEED */
>         retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>  DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>
>         if (retained != 1)
>
> So here if BO was purged after above call it'll return 0, so if (0 != 
> 1) will be true and it'll return false.


You're right — if the BO is already purged when we mark DONTNEED 
(retained == 0), the function incorrectly returns false, causing the 
test to skip. Will fix to treat retained == 0 from DONTNEED as already 
purged and return true.


>
>                 return false;
>
>         /* Trigger memory pressure */
>         trigger_memory_pressure(fd, vm);
>
>         /* Verify purged */
>         retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>  DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>         return retained == 0;
>
> }
>
> static void test_purged_mmap_blocked(int fd)
> {
>         uint32_t bo, vm;
>         uint64_t addr = PURGEABLE_ADDR;
>         size_t bo_size = PURGEABLE_BO_SIZE;
>         struct drm_xe_gem_mmap_offset mmo = {};
>         void *ptr;
>
>         purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
>         if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size)) {
>
> Here if returned false from above which is basically if BO was purged 
> retained  = 0 then skip is called which is not the intention


Noted,

Thanks,
Arvind

>         gem_close(fd, bo);
>                 xe_vm_destroy(fd, vm);
>                 igt_skip("Unable to induce purge on this 
> platform/config");
>         }
>
>         /*
>          * Getting the mmap offset is always allowed regardless of 
> purgeable
>          * state - the blocking happens at mmap() time 
> (xe_gem_object_mmap).
>          * For a purged BO, mmap() must fail with -EINVAL (no backing 
> store).
>          */
>         mmo.handle = bo;
>         igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, 
> &mmo), 0);
>
>         ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, 
> fd, mmo.offset);
>         igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
>         igt_assert_eq(errno, EINVAL);
>
>         gem_close(fd, bo);
>         xe_vm_destroy(fd, vm);
> }
>
>
>> +
>> +    /*
>> +     * Getting the mmap offset is always allowed regardless of 
>> purgeable
>> +     * state - the blocking happens at mmap() time 
>> (xe_gem_object_mmap).
>> +     * For a purged BO, mmap() must fail with -EINVAL (no backing 
>> store).
>> +     */
>> +    mmo.handle = bo;
>> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 
>> 0);
>> +
>> +    ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, 
>> fd, mmo.offset);
>> +    igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
>> +    igt_assert_eq(errno, EINVAL);
>> +
>> +    gem_close(fd, bo);
>> +    xe_vm_destroy(fd, vm);
>> +}
>> +
>>   /**
>>    * SUBTEST: dontneed-before-mmap
>>    * Description: Mark BO as DONTNEED before mmap, verify mmap() 
>> fails with -EBUSY
>> @@ -226,6 +262,12 @@ int igt_main()
>>               break;
>>           }
>>   +    igt_subtest("purged-mmap-blocked")
>> +        xe_for_each_engine(fd, hwe) {
>> +            test_purged_mmap_blocked(fd);
>> +            break;
>> +        }
>> +
>>       igt_fixture() {
>>           xe_device_put(fd);
>>           drm_close_driver(fd);
