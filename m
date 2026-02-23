Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEBEE98DE9
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 05:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3F210E230;
	Mon, 23 Feb 2026 05:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moms5Lc3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090FD10E230
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 05:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771825938; x=1803361938;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=84SoVS8ld3JIJm16sgINFHRnx+QCIojkXN8HwHjf2jk=;
 b=moms5Lc3OByhknFMUZ6cKfvArk3oyBpBrGqREmwFwDwfeW0kpcBNml2t
 GegGBqe8wQvARImfzuxtkAdk7ykdSN1GZbhsQvJCO6SXE4fWwSY66NuBh
 WzWSi6Kgxp3Zwqx0RhVOKwcq1adfzEkpjipLOurQZPVltzyzOB8iRMESa
 H9G37j9wVGUYMtEtIKQttI06NAx1wA0Jyzv0ROhkhlDEqMV2/KbVaHQwe
 XhCYfGKUF8RAWh/bj//BsPP1W8H2MJ+Z1n7Ws5eAB5rB7T9XGDSi/7BOk
 34bF35TM1d12/mSHLoSKUXMQjnienJG4xX/jpvUmzyguX7lm+eS5yPKEW A==;
X-CSE-ConnectionGUID: cJPV7Jt6R4avDmPWRgm5sQ==
X-CSE-MsgGUID: n5ffodllSCifXKU6EEBrqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90401167"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="90401167"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:52:18 -0800
X-CSE-ConnectionGUID: W1GW/avaS1STOs41e6L0Ng==
X-CSE-MsgGUID: /hpZKEjYQOK9zuXeEqgddQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215592759"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:52:17 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:52:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 21:52:16 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:52:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ni1X5AYlhMPnmhOHcuhkqrMYHmIa2ktRL75vnMpY8UkeXS//mgNPjSeCNdflRxvKx7GCsqmgKbOAZdR9+YyUgqQyvhgQYr0/RBcGCcecN/IDa1pSQglOgkStwkhqfWN+8ebBhRd57gXQbfKBPW1xit7NptZaYyoacCX0B3XeoWvCfSQQ/S7HGXBZb/M3SS1ImPrN7MlEHZ6rF8BVY3yLr5t82IiFrxjNjXL7c42T1hvTfkJu8xiIEv5iPSSwp50b0INzNDlAOy4Wk7Jgy6GQJtVkKRKKOcM8hb7C5CDUYFbiGN59WQSp0kKuyReLiK4VcRc0pn/iJydwQllZrSGRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V05adOrIrRnDgqZE+aNfRUCgaBRRZ4VAXXYggJdtdzs=;
 b=bxa50dpPYuN4VvgKrqYx3PNoMpHhswOuSCeXPvydLPC9Wr5e2VYqc6dG5p6Sbd2PZQF7/rWQuXkORpBJRtFTdm5NARykznpIuJL0iONfAAKd9Y23f/s9dVpseEDB6dX9M068+sGZYekpIXqiUROry86d5eKP1qv18fScm5fcliSOwd+pVox1ISpKaB6SGUQuHG2mnFCLJMkLBBUQ8gG8fxaentFMwm48cF/QN2IPPkwQwrwBaHj/qUVK+UKu7dSwJnC8R/Rm8fv+BJTXD6q3uLmZVlRzvS5CqBoHegQudMn2+0On1lLhkdXV5A0uag3DIU+uy6SbPsg/M806xSWWbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 05:52:14 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 05:52:14 +0000
Message-ID: <3c923dd6-26c0-427c-bb6f-1941e1bca6a4@intel.com>
Date: Mon, 23 Feb 2026 11:22:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 4/8] tests/intel/xe_madvise: Add
 dontneed-after-mmap subtest
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-5-arvind.yadav@intel.com>
 <BL1PR11MB5525815CFC7A3B5CE8F07CB58477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <BL1PR11MB5525815CFC7A3B5CE8F07CB58477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0165.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::7) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa846db-5386-4f9b-e26f-08de729fb1f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N09HZ05sRTBFSSt4Z3FpUGlaNUdRTVhSdk92WitBeVpQeG9Ba3h6UkV0Y2FZ?=
 =?utf-8?B?NlpMVkVMdGV0RitDNkN6dk93MWczdjZrUDQzNmFQdENheEFSZEpIZUt6ZEFV?=
 =?utf-8?B?L2RQSWsxUk41QXB2d3dpUUdLUVpWbDhaaFpJdi8rZkhqNVY2bzB2N013cmF6?=
 =?utf-8?B?Y2FNeVNGZnlnSGNibTBpaER6L1hURXhUQXdyTGkwQjA2eDdHZVI4a1JtWHdJ?=
 =?utf-8?B?SjdIeTU2YTE5WTl2TkZRV1BheVJhU3pxMitMbnlPQ0hZRmxZMzAzNzhsNTBo?=
 =?utf-8?B?SEZ2eFUxaGlzSGJMQ1FvSGd2SDM2K2F0QS9sM3RUUlhrY09kRHg5bERVTTZa?=
 =?utf-8?B?dWtCLzUwVDZOSWt6WnJkMFBodk9jMmNEVkZ1a1R6TU5DdWs5dXJNQlpMWVpC?=
 =?utf-8?B?UkVaK1Y2MVFBVktaWGNFcm1RSENZVitPVmZVc0lPZ0txSFFUM044em1uWHpZ?=
 =?utf-8?B?Q3BzZ3FpdVM3UkxQWmNsaE5CYkVQUDh2TWZsbzREdkJTOThmTURCNDFzMTk4?=
 =?utf-8?B?cDNjVW96TTlGWThjcG53a1RyMXloQjlMYWxpRWRib3RSYXErcnpNcmdQdkY1?=
 =?utf-8?B?MzNjSk9RV0VsczAyU0Qrdmc2azdnWXBqRDk3YWd5TGVVYnZmUlNLNXY0S1pP?=
 =?utf-8?B?aGNHM2FtTXM3cnMrb3VnUjNoYS9BNkhjendHb0VzSFJCdnlONjM3dllGaDZh?=
 =?utf-8?B?RFlYa1F4alRvMURIc05vTkFWRkIvdENxdUtyVUVGRnRFOXRZay9SSHVEYmlB?=
 =?utf-8?B?WWNmaWZndmNaTmt3b3hqSEZFZDc4bmU0KzIweVp6VzF2dml3clFiTloxN3Jo?=
 =?utf-8?B?OEtsWHdoL2JZRWlCWUxxd1U4RU9OWHRqdng3cUsza2FnbEczWTV1ZXZHOTVY?=
 =?utf-8?B?MVRqRkxYbkUzVFdFeU9tNnRBY2VVS1pybEZUMENCRjlNOWh6Vy9kYW94OHcx?=
 =?utf-8?B?R2xNMTNDQWw5TDgwUVNpbE9UL3dScS9SVlkzWHozSnpHQi9FT3JTSEF0SmN3?=
 =?utf-8?B?STArbEFvSTdGNklVdExHUGRjRzdzTXpicTNtK3N3OGh0bEdSUjNHTzVHYmVa?=
 =?utf-8?B?eUc2aHVwNGtxd3c1Z3pMSFdyNG1WTVJhbk1oamFGQnlkVGpmckY2dFZlTzFn?=
 =?utf-8?B?SWY4a2lUdHJObE1oYXFNWXpVeW8wa2lxUHVuNE0xYjJjM2UybGJaanU2aU5L?=
 =?utf-8?B?WUlHdW4wVGxyK2RpWWt6SUtaWHEycS9rMkVyOVJYRHV4VnBNdTNyZU9CdHRZ?=
 =?utf-8?B?N213QnpwbXNCakIwdlhuQUNzdFZvSk1jVFNseVo1SDR3OVRwTWlDeVJTaS84?=
 =?utf-8?B?M05Ud0RMVHJrUkJjb1FFa0JyOWYyR1FzejBXZEJucS9mRUlGM1p2ODJVd0pI?=
 =?utf-8?B?alJpbThUcktoUjF2YTVxUFV1ME5NMFhpZVpxL0pHenBTcGZwSjM3WHljRzRK?=
 =?utf-8?B?UFBJeklxd2NERGpyWVRGS2FBV0c4dlBxOHZidFE1RVRaTnAyeTFrU0xOeUR5?=
 =?utf-8?B?LzVhUWV0blBFY1lFT0tQQ05kbTZ1cHFuaTFCMDZHNjBjazJUV1hXMXNoU25N?=
 =?utf-8?B?bEczLzBySnQ0aWJvNitnTy9PaTFGUThuWDZaZHVFV3I3Z2pSMUtrVGFXd3RT?=
 =?utf-8?B?cS80YVFWQzJVVm1LdmFIcXhzTzRoQVdKbzJkOE9ZeVNxcHZNZFIxNzZxb0JN?=
 =?utf-8?B?eExTZEErUm95TVo4eEs4UisvSVNnQWpTNkpic2hHYmh1VEZxQWJjOGsxWlYv?=
 =?utf-8?B?VVh4dzJib3Vvb0JjeVExRmZzamNPeFdRRE5DNnRBdkhjVkFNVHVJazNId1g4?=
 =?utf-8?B?UmVheVA5OGpkWmI4d3N5L3lVbUdBby9kV1QzL2tFT1pmZnlPN253SE91anNM?=
 =?utf-8?B?MlRZUkwxbXBlallXUm1KUXpwZEhYblh3UXdRcFcwcVV6RjBPQlVXUVovbFE3?=
 =?utf-8?B?Rk1GUXNkNU5rMWpjZEFHUGtBMlhSRGxGeitRQ1ZmR0NJRzdwcUNMMDBlWHBu?=
 =?utf-8?B?L0M5VmV6dFcwR2V6MnBEN29vWFFld25oQ0Yzcks1OXhIY2k3dmpVMzJlaHE4?=
 =?utf-8?B?OGk5YXFXTE1DZUJ0Yy9TZk95TWFlTHhBajFkVjFrYlBiUjRUOGp2SThGcHVL?=
 =?utf-8?Q?mYKA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlhiU3FVa0pLaEJ0WHM3WDJFbUw5djdpdnNEM0VBNjJGTWlXQWdYaGhRcEM5?=
 =?utf-8?B?OC94ekZJSmpDMFphVkJvSWN5K3FqNlhuMm5KaHNvZ29Md3BPR28xQThaaFV1?=
 =?utf-8?B?OVlCRlA3amxXdFpTQXN6NFZCRUQ4N1I5NHFvZzlEaE1xMG9Fd3QrNnVrdlN5?=
 =?utf-8?B?QWJDaXBQdEU5NHpmUi9xMG9LcENnMmREUWlOMUxLWWM5bDFkV3o1ekN0ZnZL?=
 =?utf-8?B?b0lOeWtRK2Y3T2ZoMGhpRE9pR0pXOTdwelhJZFBVbEJXbEk2b0dCNkRjY1h6?=
 =?utf-8?B?UWgyOTdRSUNzbDlIMlM0eWVyQVY5c0ZFb2ZBQXhxKzAwVUxZc3F6R2VlSjFz?=
 =?utf-8?B?ZlFWUXh5T3dSL05xLzkzVnJodTRBU0piajNDU2taMkM4WHlQRFYyb0h2Ni85?=
 =?utf-8?B?WDc0eDVBOFpMYzUxZElmQ0dPbEhHYVYybkJBeUFIdE8zd1dYWGM2cU43YWZ5?=
 =?utf-8?B?M3h4a3krVVdXVFpmUDFOQ3VvbjJxamtranlpeUJkUEtTa1BmSld2dmF2SDZt?=
 =?utf-8?B?VHIyYXJBN2FsNTRWbTJuaUhZL0RJQ0FUUzladXIwNTNyTUZQRWZvYnlTUHBm?=
 =?utf-8?B?ekZhTUJ0REQwYVJTNDJJZ0JWUHl6UTB2MFN1L2taS3VMdlFlNktrb0lGbzI5?=
 =?utf-8?B?WFd1bnkwdVg0OFpZQi83RWM3MkY3WVJOQWR5a0dYL1lvTFZwZFhiaWYxVlBj?=
 =?utf-8?B?WXRpQ2dpNktUWGhxTy9ROEJ6eVpobzM0RHBteHpjbW5JRDJjbnBtRytucTRJ?=
 =?utf-8?B?anBkZ3ZvMmMyOTZkYnM4MklkVVhIMmlVVXhaRk5jS3hnMlpYblFDNXplSThH?=
 =?utf-8?B?UURMRHZ1SGlmZHRRRVJrbUo2NERwd0U2KytKaWo0RG54cW1CMVc3ajdia0ta?=
 =?utf-8?B?dDNFcUNzSmtNbHBaY1dYNTBHZi9nMDZydXkxdjhmcUkvRHlYclNSZGhzb2Rr?=
 =?utf-8?B?VkdVWmlSbUF0NDZhd2owVnd4Qld0TGVFYkswbWZOc1dydHkyZnpQUlV5dlhn?=
 =?utf-8?B?eTM3Mzl2ZlpMenl0NU5hZ3R4MVFkYkdQSkIyNC8wSjdVQ0RrVXZ2dGZhTHdi?=
 =?utf-8?B?eWNSV21FcHBaRjlCejh0WlRIRkdzcVR0b2M0UzdVWHBtSkpSYXZEa3pGREhO?=
 =?utf-8?B?dDhTSndhc05VUWNadzNwQ2JHb25Gb1hIY2JMbHhlVHFvcU5wYVBNRTZ6WXFF?=
 =?utf-8?B?QVRLb2c1a093Mi8veDd1SVFDTjFrVGNSNnNxYklHSitKY0hEL1NxM0tTK1NQ?=
 =?utf-8?B?RnlYZGhLUmUxeWpuZFBrWHNuYzR0aUhNcHpoV01NOWdPTHAzOERkc0NKbHBi?=
 =?utf-8?B?dXhFdGFEWnJCTFpMbDU4UEFSR2tiZVpnZG9peVdjK0J1ZThraUNhcjhQR1lI?=
 =?utf-8?B?NS9qMUw3NWVLWUV0Z2pFSTA5cTNHM2xLd1BWeEFWNkFCeGhqK2xzVlBqY1BJ?=
 =?utf-8?B?cDJoajVPTWhEUHRjd1YyMFlpOWMweDltSmlUYkNGOEZhT1VEWUc3aDY3dGV6?=
 =?utf-8?B?aTc1Z0xXT0ZoR3FnejNRcE9vMmV4NzdIK25CaXdUNldxa2l3dlRuNXNRclhL?=
 =?utf-8?B?ZXFDb2xMeklKenJPbEJHOForWTNVV0xGeitndGVuS2xpVVFNcWdvWlZTM0FW?=
 =?utf-8?B?OHl0bFAxOS9TOFNyU24rNFhHbm5MY0hJQjd4NFQ1Wm5jSGk1WTZ0WHFmazhx?=
 =?utf-8?B?dFNGOUxkWnVReVcxaDc5WDZYWWhJQTc0RTVRQnRKQThzenRKUDJWem8wTno3?=
 =?utf-8?B?cisycytNSnNNS1RwaUN2YlAxL00ycjZrbm45MU1kcXNPbzJXQlV0MFNKNmRY?=
 =?utf-8?B?aXZUNXdLdUQ3UlM3N3VRYnNBVm85ejhwSk5URUxDZkc0aVVXUlh5QkpLVU82?=
 =?utf-8?B?eGNOOXBnM2FGYjNZYk1HTUxLZHlrNkxCbDEvY1puSzduY1I1YWg0T0ZjTnB0?=
 =?utf-8?B?MmxrWDMrQUZsSkRFd0REUDhYSVFhczBMaWQ0bGFJMGdLb0twRzdsaEZlN2dj?=
 =?utf-8?B?emYvdkI0d3N1QmtxM3pkTGNiR2VBano2V2FtM2N3YnAzZjVOUU1RWlpHeTU5?=
 =?utf-8?B?Z0xIZHNidHliUkd1UjRFRmsyRmdWMm5mZGoyVjJFa0Yranc2WXJ0bzcvOXdw?=
 =?utf-8?B?WS80LzE5eVgxbzdRU2JDcWhaU0ZFaWZGbmFOU0FzQzVDajErb3VURVJzZWov?=
 =?utf-8?B?ZklUeFpCOU4raEw4dGwrL0Uxa1ZIbXdyLzVnRFdzT0hMQkZLZER6M0s1aG5T?=
 =?utf-8?B?Vmx6Y2RaMDJGaFB3Y2oyNzhHQ1h2S056RXJWVDFaMHdkMDVzSW9qWmNLTTls?=
 =?utf-8?B?SmpFMHRhemdIYzZYM1V4UWNRdGc4UzA3Z1BrZE45ZlB1VlEzVUxOeG1oVmt2?=
 =?utf-8?Q?WVsveoB1R20ev8EQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa846db-5386-4f9b-e26f-08de729fb1f0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 05:52:14.6628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RX5afdX/3swv9Z/MHingcfolUuLKES9tESLS5iLSUkv22IbDgdzzoU9qP78Tid5NFSLZODRCBOE4LHKHOIxQOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
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


On 2/23/2026 10:40 AM, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: Tuesday, 17 February, 2026 08:04 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>> <pravalika.gurram@intel.com>
>> Subject: [PATCH i-g-t v3 4/8] tests/intel/xe_madvise: Add dontneed-after-
>> mmap subtest
>>
>> This test verifies that an existing mmap becomes invalid after the BO is marked
>> as purgeable and purged. The test creates a BO, maps it, writes data, then
>> marks it DONTNEED and triggers memory pressure.
>> Accessing the previously valid mapping should now trigger SIGBUS or SIGSEGV,
>> confirming that existing mappings are correctly invalidated when the backing
>> store is purged.
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 54
>> ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c index
>> 7dbe70f42..5c6a24553 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -196,6 +196,54 @@ static void test_dontneed_before_mmap(int fd,
>> struct drm_xe_engine_class_instanc
>>   	xe_vm_destroy(fd, vm);
>>   }
>>
>> +/**
>> + * SUBTEST: dontneed-after-mmap
>> + * Description: Mark BO as DONTNEED after mmap, verify SIGBUS on
>> +accessing purged mapping
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_mmap(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm;
>> +	uint64_t addr = PURGEABLE_ADDR;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	void *map;
>> +
>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
>> +
>> +	map = xe_bo_map(fd, bo, bo_size);
>> +	memset(map, 0xAB, bo_size);
>> +
>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
>> +		igt_skip("Unable to induce purge on this platform/config");
Same comment as in [Patch- 3/8]
>> +
>> +	/* Access purged mapping - should trigger SIGBUS/SIGSEGV */
>> +	{
>> +		sighandler_t old_sigsegv, old_sigbus;
>> +		char *ptr = (char *)map;
>> +		int sig;
>> +
>> +		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
>> +		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
>> +
>> +		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
>> +		if (sig == SIGBUS || sig == SIGSEGV) {
>> +			/* Expected - purged mapping access failed */
>> +		} else if (sig == 0) {
>> +			*ptr = 0;
>> +			igt_assert_f(false, "Access to purged mapping should
>> trigger signal\n");
>> +		} else {
>> +			igt_assert_f(false, "unexpected signal %d\n", sig);
>> +		}
same comment as in [Patch-3/8]
>> +
>> +		signal(SIGBUS, old_sigbus);
>> +		signal(SIGSEGV, old_sigsegv);
>> +	}
>> +
>> +	munmap(map, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>>   int igt_main()
>>   {
>>   	struct drm_xe_engine_class_instance *hwe; @@ -212,6 +260,12 @@
>> int igt_main()
>>   			break;
>>   		}
>>
>> +	igt_subtest("dontneed-after-mmap")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_after_mmap(fd, hwe);
>> +			break;
>> +		}
>> +
>>   	igt_fixture() {
>>   		xe_device_put(fd);
>>   		drm_close_driver(fd);
>> --
>> 2.43.0
