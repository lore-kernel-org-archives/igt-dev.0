Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB712C3ABC5
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 22:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878AA10E218;
	Thu,  8 May 2025 22:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kecntMhe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F9210E218
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 22:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746744080; x=1778280080;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FQXmPSKUyHEmQ/BkmmXTeMaHS5IQuQKQiqGJAJ7336Y=;
 b=kecntMheLTiu5dWGTXa55wJN+z9NOLRQn3/C2QoLn5onARxYhu/auHEL
 aM5ETmDZlnY6al7FDGBhIzG6RtVOUtjPsCosFm+edu8wCAP9+Be+ZmOV9
 fjoeZWsAEsE07wLHZ5gBqdNeVBGBNLSozHe1JiuYQegy3I5Yxgud/9XoT
 9mW8zepnhfBhxrVooshvSdrEGfk8pViyFfsAxP7AvF/HOgNyaffoZsy2z
 SDvpCpjmEafyiFTNPLW8zm1Suj0caTSbOVPjsR0biuMlJPLy7XvOrIPZM
 qo3Z/mMFvx5EMPCeaPiNIMO7f68B/dRestP5PaVUL//rSqMFGLziVTRGc Q==;
X-CSE-ConnectionGUID: bLu6qCm+RkS9Cv1hhJlCtg==
X-CSE-MsgGUID: eL1+ILHkScSLeK95SInPeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52206506"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="52206506"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 15:41:17 -0700
X-CSE-ConnectionGUID: ut1VMP2gRKCN+s+ik4W+Mg==
X-CSE-MsgGUID: fECIXmvETHuDIrL0tguyiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="167507677"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 15:41:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 15:41:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 15:41:16 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 15:41:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6CqXKot7bX6+lvNeqzTVYqUNlHqxd7FhB94363AYcuMOeNOHCpyOFvdad083POdJlFNx0XsFOgn5CN8CsBi+K1ZRihb1KcmP5/F1YzI4TbjJETN0UDygFQT9CyC3kPsM4TGSOfF7rxBJvk9RikAaPfwv3o2Wpcy2suwfraunNrJmcZtnNAaX34gTRRE0tQRww1sA3tSyupK2KDkgwep04rnC/xtEeFdtoih+R+E989CenmkAdkHThqM9EfnLWN4kMo1j3LmLS8bL8apnc2tpBSUXI5a9p3+NgTFXX0EvkEgKdfimMx0mqS8Fk/mCjdZRw+wGnVI8MekDkhd+PRKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh6Stsjm/GG0warTiZiiLE3F/ZUI/dw5G2r4I6AlhZw=;
 b=cUAjYn3+yR5uMxtlHTSogKOLCBvwuVEto27lA60e2r7yfcvyiCagu5gep3gx4g19/2Kny6W1rbZTbjAUw/deyQUaJ8hViFOpI/Pakz1jK3jxOq82fBHCflkykUY0fUgNFPhdrCa2zFkL5h/4o3XOB0nduO2bwPxOoyLeZXSc7vgLTqfc+jq86S9/PXvzaC5M7F41bCrmKpmbKJSkn0SVuj9RGjxpoI7+TkcTCKj8jXls4S5BSL+5T9b+p1rFV5uPNcDVqpFQ9o8VsKEblxbGNu1m9X/P6pLYcMNSLGUUBT1BE3NLo2V3USl021znDGun1YTi2b9+9sbCPr0hOdbxqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Thu, 8 May
 2025 22:40:45 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 22:40:45 +0000
Date: Thu, 8 May 2025 15:40:36 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 1/5] tests/intel/xe_pmu: Add a helper function
 to check and end cork
Message-ID: <aB0y5KtmXKqRtptT@unerlige-desk.amr.corp.intel.com>
References: <20250508055006.734259-1-riana.tauro@intel.com>
 <20250508055006.734259-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250508055006.734259-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0172.namprd04.prod.outlook.com
 (2603:10b6:303:85::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 87824c34-2b30-4e3f-825a-08dd8e815efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjJZWHU1bXdmNmFDK0tNYlBHTWEvVnN5emFEVlpqUko2U0lmR2RrcUxzMWRh?=
 =?utf-8?B?eW1iYXozcDZacTVPcHBIUW5HZjlNK1ppZEI2OVQzSGlvR2EyMlVUYTM0TGVR?=
 =?utf-8?B?WjlCSDJCOU8rRWVXTko0WXpISUNqTGVJTXZoZ09mL3Q0ZlFpcHY5REQ3eFJM?=
 =?utf-8?B?R215b3U0T2ZJc3ZlL1FwSXFRSTlPSWFYSzNJa3V3SmY5dHI4SmFuZmtQbVR0?=
 =?utf-8?B?TU42bmJFaXRpbk85cy9sN2h4RkFnUnQ3bHcvZ1FIYVRNbzYvTVRyY3JsdWhr?=
 =?utf-8?B?Q2NwNy9XamRHblJySEN2RUEyMk5oRFJoOVh1amtGQitWQUxWbW4zUm9wL1JW?=
 =?utf-8?B?VnZ4bEtLbHJBc1JJNVp6Q1NaZFFaWXVNRE5BQTNpbDh3RDY1Wnk0N25xMVV4?=
 =?utf-8?B?QnZoWElhL3VEd1FHMFd4Wmhya2tXd1RLbC84QUtpTFkvRUJlVGFtWXRob2F2?=
 =?utf-8?B?USt1cTlSZ216ckl4Y2dMM1dGYVZqMCtSVFJqWmFQbHdkQTRhVnhuYzJHZFZD?=
 =?utf-8?B?R052SUJreHJBc1piblVuVjhXSDZPMDl0VGFDQlpIb25BVnZ6bTJ0M1Vnek1U?=
 =?utf-8?B?bTNoUU9NMG5zSGxHSjlsL1BQa0thNmlzSjQvVmh2Smk1TFlmaTJZd001M0Uy?=
 =?utf-8?B?S2NjTTRHZldQR3kyWGM2YmZRQkNhVXFqdkZCc0pUWVRkZzc0a3FpOGNuUmMy?=
 =?utf-8?B?aG05MVZBcHZCdnJtR21HUnJJNTlnZHVjZW4yZXJlN2RRLzBMZjA1VjBQYTR0?=
 =?utf-8?B?ckEvN1hwMlk0SkxmQXdpL0Q5NnpqQzZta2pCd3NKOFlYZjZSZEtzNlFVMVFX?=
 =?utf-8?B?QmdIWjMzeUJ1Tmp0Qzc5VG0wYVFYNm4xYVc3VkY0aUc1clF6NnlRWEE5Z2Rp?=
 =?utf-8?B?TkZKRUI1UHkwRnNNbHk5c29OTzcrbkFEdHIrNlpocWdkZ21DdzlXRFNPMjR4?=
 =?utf-8?B?Zm9nWGxsTUQxakVBMlZRMkNlS3dwNVV5S0RFclZyTGptSC8rbTBvQ3VIWmQv?=
 =?utf-8?B?b0p1MUMxREVRd3VORGtGMTgxU2tsRWxlditteEhrblU0VFdGTndGM0RmQkJY?=
 =?utf-8?B?cUF2emFjV0pDczl0MTF6OFBpMHVYQW5YNHlMTVh1SjRpR1pKejZZTkFuZmZy?=
 =?utf-8?B?cy9ZcHRIRU9Tcnp6YUMyQ1l4ejdxT3ViWERUK3R2UVdPSlJxaVRqckJnVXhX?=
 =?utf-8?B?MkFQWVB0eGZ6dXpCQW1TTE01RGRUR0NjNlN0UlBidUVkbEp3aTIxMW9DbTdX?=
 =?utf-8?B?Q0o1SllkNmVmNit5eUNkNVN5Z0lSVXJMeTV4NXBVbnNiMTZQZkROTHhtVVNK?=
 =?utf-8?B?cFBkOGtRUlphWnZpRkpLYmpGVlRQQzFBOU01d05aM2QrVjA5dk9hQ0tqQWM1?=
 =?utf-8?B?cUoxbmdKb09jQWxGNGYxNkUrczQ2VElhbmNsKzFKS0xKemw3d1lLMmw3OXFX?=
 =?utf-8?B?WjF3WVdBRGFOcTBpOWNmOGlXT0ZkelJnaStlU3E4QlhQQ0gvak13blZNWjYw?=
 =?utf-8?B?YkM3eGpqUmZUbTJPZ3hiOXI3Nko3QlpjK3VHNis4OG9qcU41K25KMDFyYnUy?=
 =?utf-8?B?V3g4S2ZGWEJBc2l4bG81TVRCR045ODRPTmxFVyt2WlpDQnlNUktXeUltaHFT?=
 =?utf-8?B?bWRLNnF6c09xU2ZnSXhpRzB1SVF2b3NCdS9IV1ZzR0diUzIvbEFBY3gvSHVU?=
 =?utf-8?B?djRXendUOHBKSWZvbkxmbVpITXNKaTkzNnZqNTdidU5jSUtJb3J2REZlcWdS?=
 =?utf-8?B?Z002VWhOaHQ4OHpXSW9aT1djb0hQbU5zb0lyaGNSK0xMRmRseVJYS3p0V2p4?=
 =?utf-8?B?a0VJR3Qyb0dWSkh1MWc0dnMvejF5UG93b2pRSWtKUUNFenorYlZBejFOVzFB?=
 =?utf-8?B?TGJCNXg4bFJNc3BaeFdieWlkK05uTk9jYk1oektHMFMzTDBZMlhncTNIcDEv?=
 =?utf-8?Q?PuB0ETcEjzY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1JQQlV5b1BocGx3K0RLM2pmNytpM1ZDMjVkOE04OUVrQTZlbzdqT3hKQzZ3?=
 =?utf-8?B?YkNuaFV2ZmxyNWY5Q2taYXhwWWxsWlR5elU3djZPSjhPRStCM0g3SVd4MkNO?=
 =?utf-8?B?aUM3QTlsRzEzZE1VTE5zbldhUUJwckQwcWJyQjZTRTVoK212YUVxS0FTUjdH?=
 =?utf-8?B?ZGtIbEVicUtHZFcrMGlqTzR0RDNDaXBOVTBKdXI2RktVclhQS1R5U3FadHEw?=
 =?utf-8?B?L1R2R01UMXJ6eGlabENOdXh1OU9wc29iTFZWRVV2SUxudG8yRk9PWHZFN3FM?=
 =?utf-8?B?b2RteldWTGN1NTZGUEN4eWlzYTdWcjVQRE42U3hzbTl2SHF1V2xWWndhQnlu?=
 =?utf-8?B?bVpEV2piS1Y4dy9qbFBHSTlncWVXQkxJQzlzWHNaVFRBREVsQzFEY1JWK0FI?=
 =?utf-8?B?ZjZDcHFIS21BS1NSZGI3ZEdaaVpLaXZ3SUVQZFMxbWVTcURjbFNYckFaMVFk?=
 =?utf-8?B?N2c0QWRjQ3JmSEkrR3RobWJmMjhpNU5BT0JzVmlqMGd2QnVmSGM0OSs5OHZG?=
 =?utf-8?B?YUpWVXVRNVRDeGdQRm5jeklWNlFSNDA0UGNDWmF4SWJjWXhyaHM2Y0VjcnV5?=
 =?utf-8?B?QVV5dDNnNkhnRVEvUTdWaE4yVFUzMXY1YlBjWjVwdTVjRThvZG9FUzZ0VURx?=
 =?utf-8?B?a0dtNmJRSmpUUVAzODRwbjJCZnpCbC9DbDFZa2NuQURFV0ZpU3JmTzZkRks1?=
 =?utf-8?B?V2ZiQ0lOSHhyQU1CWWYwYkdUdCthSlhreHZCa2pnaFZ1Wk01d0hjUlJDU3da?=
 =?utf-8?B?dm1DY2FRcVJ4NTZDc1VNcGsybVZNR3FiWWFZNzRpK1pxV2RLMGdVZzJmRHc0?=
 =?utf-8?B?Nm13ZWVpUFlJMnJkczM4eUd6ZkhLOG9Cd0o4aXFQVTdhTHVHNEtFS3RmQ0Fq?=
 =?utf-8?B?bm80U2VqRFRCMGNEQUNUQlA3OGwwc0h6RDNGQXpESGxXUDJWREVoZFJRQXhR?=
 =?utf-8?B?TkZ4NEx6Vk5pZnNmdCtRcEZBclJ1cE12Q2wvMmRMcWV2MHVla1lQRWcxU3Ev?=
 =?utf-8?B?UTJiZHdNZWtPOVB0TG5pZzlPNkpTbzNFdjBDSS85QWJTSnVKV2h0L3ZrNk5o?=
 =?utf-8?B?TjZNNDdwZFFvSlBMZVpWaUliOHpPY3FHTXdGRFFGcDUxVGl6L1hkUTQwV01i?=
 =?utf-8?B?Z002Zmg5WjVLQlFlelE0MjJWQXlTd0tLSDhBbDl3c3gvVVpqTC9mK0tZVnZI?=
 =?utf-8?B?WHlFanlROWlzOVF3UDBhYUVTU1BWUXdYbHo2R2Z6N3RUdTZhY2dONDFDTjNw?=
 =?utf-8?B?MXpTajIybCtRZW83NWwzckgvU1dySlh6VmJ0V0F6WUhReTYxL1dKT3F5UERm?=
 =?utf-8?B?R081bWhleENYT1ErOVZXRWNwaHNkQTZJTC91R2xHSjBDc2JEQlNudytpbld4?=
 =?utf-8?B?MXgvdk1SeEJKT3M0TENBRkZCNTczeFdMTVl1UmNrbXZtOFQ1Z3ovQ0YxeWpk?=
 =?utf-8?B?SE9RNGxhZ0NjeXJZQms5RXo0dG1tcFQyZm1hTEh3Z0ZPRHh4SlcrZEM1Q1Vz?=
 =?utf-8?B?UjZDeUJEdkUrODdUNG1jWFpBRjdIOURaYnNDdWVNME1jZkJMRFRLemRmdEoy?=
 =?utf-8?B?SVMrMXErcUhKcVlVM1RUd295aGhRaVhwQ1R2WkpRUU5wUEtSZlMyelhxSnk0?=
 =?utf-8?B?SkkrcWJNYXBtRWQ5dzI4VXZvSURFMnVEVjR3d3JhNisxTWt3Z1EyOUVUZytR?=
 =?utf-8?B?eDBzcEVSZjBNNi9Da2JHU3h2b0FGL05zenpnNUNqaktTdStWa0J2bG1vaUIy?=
 =?utf-8?B?dlhDTkRTdGNML1dyTDM0Qm9INHpOVkVkVmpCQ2V5cDdTQ2ZEbktoZ2w0UXl6?=
 =?utf-8?B?RzIyRnI2dmZ0WHhwOHR6SU1XSTJ2a3JSOEhnbGVRVTAxSW1iN2k1NVNsVWxB?=
 =?utf-8?B?ZzVJSlYrMlJBYnRqaHc4R3d1TStnK2dRQm1QZlMwZWVxUjRJbUdhMHF2cHhF?=
 =?utf-8?B?cU5IZEFwS01mdERBRURzeGF0TWNIYW5zUTFBSXR0VUFLaThzY256Qm90Z0cv?=
 =?utf-8?B?a01XZ0pxRmEwWEhSSHQvRzZJcVdXc3dMK2tvQkdSQk82ODVFbFRWUEl2bVJl?=
 =?utf-8?B?eW9mazRuRytsN2VENjFqWWs1WEZoaFR5NnJ4cFEwWXFsd08wcmN2Y296OFdM?=
 =?utf-8?B?bGtOV0xpU1hoeGQycU5XSTlzdzZyUGVoZmxESXUxaDQxSVluSEhlMzQ1d1Rh?=
 =?utf-8?Q?AQbjW9mo2JwUH53xPzGQJ/c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87824c34-2b30-4e3f-825a-08dd8e815efe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 22:40:45.4186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsI3pCl3UFaj67CsR6Ka3DOKmuZMfLnHbmc3tWS4+P5duQNP9HwHX0ACNw526dcfT6C5B98IshBob501AzSh6mnPf7wxpAN7ufVbJnUQAg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
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

On Thu, May 08, 2025 at 11:20:02AM +0530, Riana Tauro wrote:
>Add a helper function to check if cork is active and
>end cork
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 10 ++++++++--
> 1 file changed, 8 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 094dc0c6c..03a966708 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -134,6 +134,12 @@ static uint64_t get_event_config_fn(unsigned int gt, int function,
> 	return get_event_config(gt, eci, event) | add_format_config("function", function);
> }
>
>+static void check_and_end_cork(int fd, struct xe_cork *cork)

I thought xe_cork_sync_end was handling this internally, but I see a log 
message now and not sure why that was added.

You could just call this end_cork() and use it everywhere in this file 
rather than calling 2 different flavors - xe_cork_sync_end and 
check_and_end_cork.

Regards,
Umesh

>+{
>+	if (cork && !cork->ended)
>+		xe_cork_sync_end(fd, cork);
>+}
>+
> /**
>  * SUBTEST: engine-activity-idle
>  * Description: Test to validate engine activity shows no load when idle
>@@ -172,8 +178,8 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 		xe_cork_sync_end(fd, cork);
> 	pmu_read_multi(pmu_fd[0], 2, after);
>
>-	if ((flags & TEST_LOAD) && !cork->ended)
>-		xe_cork_sync_end(fd, cork);
>+	if (flags & TEST_LOAD)
>+		check_and_end_cork(fd, cork);
>
> 	engine_active_ticks = after[0] - before[0];
> 	engine_total_ticks = after[1] - before[1];
>-- 
>2.47.1
>
