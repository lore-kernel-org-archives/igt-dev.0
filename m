Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6DECCD185
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 22:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E00E10E2BC;
	Fri, 10 Oct 2025 22:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKkCCSop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7174010E2BC
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760135581; x=1791671581;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+ilqoVF5X1K8iQEBF2BcZCi7H3PtA2gDe5ytstMI14c=;
 b=MKkCCSop83Za/LoT1hozJ46jT4fQZ44I+e6weWJdbvgUI2WldnxXBwGj
 N7cku1xd/IHighmcrDRMf4FjkU5XA7zEnxSHLP/mqxq5nD3XtxZzQCutJ
 qdqgmeX+sKOQTdWNRDta1MMSEGNG3EhkBXCR5KMF3rJu5p1CT8PeT0nEU
 jR+wCOsnzxzGn6vAeooI2cqoJL4QCRc3tTeCD6JU0ugyu/Z8FLLp9aTIz
 cjTAYiR5faBJfAdJCg5yMcsHQVzs06qhQKAbgM42Qnt9sXaFeJtAABx1u
 QOwVcUQC8WlQMfTOOHiGwXJDovmM4JXVzKgje5q3mbBinO8qbvKMYpi5N g==;
X-CSE-ConnectionGUID: LugvDzxVTtyus32kpMs1gg==
X-CSE-MsgGUID: svJlWPuASSaI30vREiGq5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62279222"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62279222"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:33:01 -0700
X-CSE-ConnectionGUID: CsG7DV2+RXyntXUQL5/oUw==
X-CSE-MsgGUID: eq34KMDMR82eny1eXWstHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="180666821"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:33:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:32:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 15:32:59 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:32:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJdTV0ddlRpS+L8OmDLdLImslKpkMLiT+un76tkpBYkPqZparuJOYL2i6EvG6yBTaxq23opBR4h1SVfAn3SW/xyR4sLYqf7HitDmCRcgPzlmohIJiE3WRhf2nE6JSEFIwfaA59wt/VF/TBm/n1HC7npTHxdgtddfd0nH1HAhKwRdC/1tOKClPBz+JMh9PAdFIPSy4Sj9BQ74QZuBtFFkIMDpZN99kA3J3gVbxJSIRexLyw5yBDJtV81FW3gvNtL6s5FM6w/QYasl7+WhaNermzrGllvnsuOj8i+xleVQxLBrBFKpuLDVLk4cFv3z1ilgilZWPQvk1FDfnVCCwjva9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7HVP73UTbVPClK57VEsWKmKQLyYHdJkpjnBsjU8fhg=;
 b=oxoIokLXa0SQmjyDIe27Co8nwuCCMjKcH/t8mlgbdi0+mYP6yu6nspziFC4zceGHrxksRXXRo8kEbh7TTL5V6RJRMjwZYtDFjetdp1uyxoIbucKAKNsWz/XhC7NnDVIgiL0ktRiwa5lBz0cVyRdsHWOTvieYQMx111Crm8O3YO7VDCOEjGjDjA8zp354HDUPll7WXTXtmt8uSDsiA7TQNQSOQY0/B/t0NZePMqiVquUiCXiWelxCoze1rOvmOswPr0i8ltX/XiV3v1YyBbz5VJ5aikQX46a+IhnKqvQ63dQFBDpxwgDgXpxfE3+iXpK3qQcpIsxM7G4t+NL5AQLi7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7684.namprd11.prod.outlook.com (2603:10b6:8:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 22:32:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 22:32:57 +0000
Date: Fri, 10 Oct 2025 15:32:55 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 17/18] tests/intel/xe_oa: Add new
 non-zero-reason-all test
Message-ID: <aOmJl2WkdlvCJ1St@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-18-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-18-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0311.namprd04.prod.outlook.com
 (2603:10b6:303:82::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f563a9-87cd-4e3c-d13d-08de084cf616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUxSVllkMmJRQTRucFdIamIyL3kwM2dzdVREL2dySTAwZ2NVMVdwUVRwaVdy?=
 =?utf-8?B?alA4TmNkUmRseXBzdEQ4MmxzL2RENE5qaTdJUW92OUl2QXFuS01QMVI5dkti?=
 =?utf-8?B?dk01elhmQ2gyRnFtOW83MVNOam81dGxDZkgva3lydjdBVFVuS1RjOU45YXdT?=
 =?utf-8?B?WTdUdk80b1VTMiszekRyUnlkQjFxamthUmYvYzVhMVBXMktNd3ZzUk1PZTI3?=
 =?utf-8?B?Z2kzbjYyeWxUaVdFc2V0Y0NxYkNIK2x3b3Mwa3I0V0Q5K3RCWVRuMEJYUENp?=
 =?utf-8?B?Tkh2ZFlYY3FjY0dFWHlOK2RZSEZkQnVMYU5WbVhjbVRzTmVHOUFmSUhQR3g2?=
 =?utf-8?B?ZEVKK3c0RlYrMmQrR2dHZEFyMHdITG90Vk02cDlDSW4zaWZFQ25HQkdWTUVV?=
 =?utf-8?B?Y25jbHJPOXNSWmxSa0xNa3IvTUxZbkwwMHNqQ3dJdS8welg2WENpd2JjREhB?=
 =?utf-8?B?Z2VNWmNFc3RlUmw4NWJxZnlyb0Vmd2xvYmVGTU93V2NkMlh5SDF5bmZERXNz?=
 =?utf-8?B?VmoxdHY0ckxrb2ZhcU9RaGRHV29FTHZJeHFnWU5GdUlTSlVIOEE3WG1PaVpt?=
 =?utf-8?B?M2ZpZEduS01SdDdsWnM4M2Zhdi9CejdpNnNnREpRZXNBdjlIeG5UL05ZUnJQ?=
 =?utf-8?B?U0kyVk5XdXYrS3NtSlJtYXZuNzRoWWZldWNlZXRkcTQxSzE4WUpLNzFBTlVu?=
 =?utf-8?B?ZlJDVWRwYkhiR1VkaFNKc1h3NiswVWpwbmhYajB4cUU0cmc2aTFsVkJOZ0Vy?=
 =?utf-8?B?d1RlbHEvRmZDVkc4U0xBVGh3MHcxLzl5SHRMMDZWU2ZKT05YNzVYWEdkano5?=
 =?utf-8?B?QmV0RitLWGY0NzFGTUxTSDVKc2FpL0dVbTN1VDJWSytISER0MkZ5RjZoYVVp?=
 =?utf-8?B?L2paWE9ob1liSFRtS0wxSk9mRitiMnBwQ3lYTUpZZTJnT1hPcVV4MEFCTmN0?=
 =?utf-8?B?dyt4NUk1MlRIZmxxS0dwcjVjbXVJWlVmZWMzWjJZRkt6a2ovMmQ5M0ZqUmRp?=
 =?utf-8?B?YWJ4em9tbkFqK3o4cHJOeTBZMnYzTkljN3R4cmV1SGxpUFRyNlM5bU43RzFK?=
 =?utf-8?B?YzZwcmxsMWVLU0drMjJwRjl3QnNXMUlWZXkrSGNvcWJkWmppOXhPNGppaGp5?=
 =?utf-8?B?MzJ3T3hLUUVlQmk1VVJlQlFvM2dEOEZ1V2Q3NVArajgzajZIWVEvaXhVTTZB?=
 =?utf-8?B?REx4UWpES0ZoaTZQZUp0cVBNWXdWTE5ZdUh2bGpKYlorcmE3NGpPcXI1M05L?=
 =?utf-8?B?bnRKMTZZdm9HVFhwK0QyL3dORTI2YmVqL1BEeDJYZ1RmY2FnRnp3aGhPeEZh?=
 =?utf-8?B?WFVwamROS3BCQTRZUTV5aVcvVi8xRFZwT3pYRThDK2RaaWNNWXphMFp4T1dS?=
 =?utf-8?B?SUE4QmRlVGtzeEdNdm5nSTBZdTFZUlRxTktTUGRMY3FwSW52R3JsZ1dnREM1?=
 =?utf-8?B?Nm1WR0I4aHBxUlE5UzJWMWRXT1UyNzFXMlBBWE0vNitEVVJxNjVCTkVMaUky?=
 =?utf-8?B?WDA2VFZVSk4xeWVQeUVyeUszQ2NuaTFoRTBUaEJ4RWFnSURRd1UvdHU4YmJT?=
 =?utf-8?B?TWNMbTFoTk5tMTZZZG1uS0p1ak5LSm9NSm1KazJ4OVBML05sVGFja0tSbGFi?=
 =?utf-8?B?dzFxelR6WHNWWkdvVkphZzVtYXVMcnAwMEhOcUJTLzFWcGxNMTZ3M2dtODZw?=
 =?utf-8?B?ODhuMUx0UTNSa1h3UkY2U2x3VnIvZ3VRSERkblJtM2JVU29TcFN4Y1RoTXNq?=
 =?utf-8?B?bHJaYVY0RXlGMmxVR2NSUVNiUWdVbFpwbkZsSERxQmtsdlNmQkNUR0NWWDNl?=
 =?utf-8?B?ZjFUS0wwY0kzK0d4YU1RVDlteXZTOVhMcys4RFNWSTF6Y1RVRVVQaFNhMDlq?=
 =?utf-8?B?cHRMZ3NsaDVnNEJhK3RqSDVXOGt0eUU0U1ZTVXJZay8rV2FVTUhmcmFwUXJt?=
 =?utf-8?Q?CwH/aH7q2fst1lOZqn/1/MFR/tt2nZQ8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1U1S08zKzN6d0FXN2lDa1pZOFdscmZyZEtQTDRpWFRsbGl1elZLV1pzb2c1?=
 =?utf-8?B?aGFXYUlZQkNCT2RGZ2ZDVFAxZkJVSFkrSzRWYmRSTEE4QUpqVTl0TTVHQzU3?=
 =?utf-8?B?VWlDSUNpUklwZUZRZHVNT21PUGo5TDk0M0U1L1Z6Uy9PeVkrNEhjdnptZXJV?=
 =?utf-8?B?ckNEbjQ5Yi9nN3YwZFo1RU1zWlZOU2RhZi9FWGVzbHlzdnpQY25XRng3QVRW?=
 =?utf-8?B?QTM1bWt0VVcySEV2SGJxeFpiU2pBSy9FQlc3ZTBNZzBYc1ppd0pKWElMaTl6?=
 =?utf-8?B?UktxcWtLZ0hzdSttUE1CcEZiR0MvSlgwSmdCWlRSanJseXloV0pUZTQ2RXB2?=
 =?utf-8?B?QUI1K2NKdHAzcUdSZDZwMlFZeUEwNFZNVkRURnpuOFNHOEN2ZVlKRnpjRzFI?=
 =?utf-8?B?dFNOZld6OUhwN1pyRTZHSEx1K3JZSExpdklTRXczU2pHd3pIb0hxd0lxK0cy?=
 =?utf-8?B?NEN5Q3dwMVVvRjZIM1M1KzdoVHhwQzFZUWhsMDVrVFNSWTRZTzVObXdTdDA3?=
 =?utf-8?B?U0QyWXdkVWVpT2ZYUkc0SWUwRTBKY2c2bVhDQmwwTmp6U2ZxOXZPOHRxK05p?=
 =?utf-8?B?RjNkR1Q5Z3JQNVZnMExDU1BJUWsrWkNkUXMxUjN1dHZvd0JybGdrc0NJa2Mw?=
 =?utf-8?B?L2ZCYTN6SkwxL1pHTTY3U2loNEFtU2ZibVBrOTU5eXd5em9HdHdDUG9sNHhK?=
 =?utf-8?B?aUg5SW90bXhtWTZURlUrT0xibk5ENjJnTnk2cDZwcFRES1p1b3hTUVNGWWls?=
 =?utf-8?B?SENPTTRsWkYvVEJaWkhyQkxKa1dqd215THVWd1loSnBuSnJWeHZEMlRaZHhi?=
 =?utf-8?B?SXkrQkhiQk1xSERSSDM2eHRUTlowSStkQ3h6NFBXMWpWMk9HTWhSME9VbXBI?=
 =?utf-8?B?SG1lU09McEpkSnBXQzN5MC9NenBxMmNNVFVIbytxSEd3cGg5eWp0Y0RXdWFi?=
 =?utf-8?B?UmdoTUlqNU93WjNoRG5NTlUwSmdnMm1rWkxpMldXczdWcnJ5aVMwU0Z3ZGpy?=
 =?utf-8?B?eE9tTk15NGJuL09CeFhyS1F6TnRObEEwcXFZVXVvNUJQWFdJMFVsdVRZOW1p?=
 =?utf-8?B?dUFId3d4cXVib01IKzViUkovSUNjLys1c3puOXBBbWo4UGZlUFJSbTVVZXJH?=
 =?utf-8?B?RWhIMUw5d3JWU2p2VGNIR0lYUWhMaU1uTkNraWZ6eWJ1d25XZVg1WnRkL0w1?=
 =?utf-8?B?MlFMRDRuSHFZOEtzTjFtL25WbVllTVJreEcrT0d4MHdaYVBGSDRVWnJjazlD?=
 =?utf-8?B?bWhYZDJGRmg1Z3phdTRreEJJVDlDMzg4N3gyVm1VakVzSGo0YjdMK0ZNL2R3?=
 =?utf-8?B?SXRuN2kzSlVha1RLVkZwc290bkRYM0djWEpRYjRKanpGRWc5bGNQNFJrb0Nr?=
 =?utf-8?B?QlRIWDNuc1ptS21NdVl5Wm9VeHhqenlWWEVlOGUvZzJ6MkVjOWl4YU12MTZr?=
 =?utf-8?B?M29sNmJiM1BmMXVKeG5KQUZRVk9aUWQ1TTdack1FZ0xrVjdMOTJLbVVyMHFB?=
 =?utf-8?B?amRlTi9FRzZYQ1ZHS0RhWXpsREU3TWZJR2xPK0RKQ1NBVFRrTmhsQ3Nod0Ry?=
 =?utf-8?B?aXQrSmpjQVl5cU9vOThGTkJsY1Nhb3pFaHdxSXNEYmk5YlRPM2UxaW1oTmwz?=
 =?utf-8?B?Tldnd0F2VGk5bDRYa3hpYUVhdUtCTW1vME5lU1pCQzRDMjFid3lXUk56TlNH?=
 =?utf-8?B?U3lGUjFaVEJqNWpMNFRab3l3L24xTjVvTFhLWFJzbHp4ZTVQZFVXNHB4enNs?=
 =?utf-8?B?VlFra2RwbTNMZG4waVk1R3J2UzRqN3ROYWJ3cXQxVS9kVDFpQ0pCS1oza0tV?=
 =?utf-8?B?QjRwbjBmS1VPd2w3L1R0YWNONXJYRTBoZk52MDMxSGZTd2JzVE5ZTDF6MzFC?=
 =?utf-8?B?enJiQTZnVUg3UnUyUGJBek5YRTExQkQvMzg1VUUxWWRweUZzamlHNkZ5MGdv?=
 =?utf-8?B?d3cwbmJFZENQTTI1TjFBZnNva0ZlYmpBQWZXVVpCK210TnhzY1BnSWtOMDZh?=
 =?utf-8?B?aFhTZHVaTFppRWk2aFA2ZFNFVzFPWGtzVjd4MkQwVUtnWDlBQ0VYbFp3b0xH?=
 =?utf-8?B?U2VqMXdGT0V3OHFzSUNycVJHWEk2bWJQYTgwQVVkZnBPUHZ0eGJCU2c5allI?=
 =?utf-8?B?SzdBM0NmUXZLTVI5VVU3TWVxdFdrbzBFZUFxRjJDeVRkTFljUEZySGlOdDlM?=
 =?utf-8?Q?pJnwccGCNw5yDhLcNay4FeQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f563a9-87cd-4e3c-d13d-08de084cf616
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 22:32:57.4089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Uvk102tMTL/HnX5FBSgFhwgl05JLESnu+gGkUtUggnu35VnV1ogOx++e7VIu6M2BNf0nVMLanHEqxwFz9p6WdjGuO1UHEp981y+Lb2WuWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7684
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

On Wed, Oct 08, 2025 at 02:18:04PM -0700, Ashutosh Dixit wrote:
>To demonstrate the new infrastructure, add a new non-zero-reason-all test
>which runs the non-zero-reason test on all OA units.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 2d956286d2..36b1785bbd 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -4921,6 +4921,10 @@ exit:
> 	if ((oau = oa_unit_by_type(drm_fd, k))) \
> 		igt_dynamic_f("%s-%d-%s", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id, str)
>
>+#define __for_each_oa_unit(qoa, oau, poau, i) \
>+	for_each_oa_unit(qoa, oau, poau, i) \
>+		igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id)
>+
> static int opt_handler(int opt, int opt_index, void *data)
> {
> 	uint32_t tmp;
>@@ -4971,8 +4975,11 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 		{ "ufence-wait", OA_SYNC_TYPE_UFENCE, WAIT },
> 		{ NULL },
> 	};
>+	struct drm_xe_query_oa_units *qoa;
> 	struct drm_xe_oa_unit *oau;
> 	struct xe_device *xe_dev;
>+	u8 *poau;
>+	int i;
>
> 	igt_fixture {
> 		struct stat sb;
>@@ -5066,6 +5073,16 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 			test_non_zero_reason(oau, 0);
> 	}
>
>+	/**
>+	 * SUBTEST: non-zero-reason-all
>+	 * Description: Non zero reason over all OA units
>+	 */
>+	igt_subtest_with_dynamic("non-zero-reason-all") {
>+		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>+		__for_each_oa_unit(qoa, oau, poau, i)
>+			test_non_zero_reason(oau, SZ_128K);
>+	}
>+
> 	igt_subtest("disabled-read-error")
> 		test_disabled_read_error();
> 	igt_subtest("non-sampling-read-error")
>-- 
>2.48.1
>
