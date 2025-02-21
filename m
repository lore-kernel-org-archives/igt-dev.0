Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC98C021B3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 13:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC50510EA69;
	Fri, 21 Feb 2025 13:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4WHr06K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE3010EA69
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 13:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740145073; x=1771681073;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lAosZCAVyZtJCRT9IdQezKgQTb3gAVVi9d2ifPMhnjc=;
 b=m4WHr06KlKIqFyX6LweEC5jqKJTOCLJMqGWzGtVGS3VM4YylLlIzciR3
 SVONOcNcvqRmEPcvnO/RZG2xbIH+sHRdc9dmkvESk5gydJocNXOlzUWIC
 cw1w3cIm4JD3Cji5sQRVXaf7sNBLSeZnDWdgAT40+Lhi6fM4huuJzqUVN
 aEQxWt+hUpy34fbhalrDQTyA4otipylQHE300gK9KGvbfnrSTLjo0BveY
 6r8LblVhZX/0Usa2t6BiUOyI9ke3XZJGupfhrxFd+lN8B/wOKdbv0dMfN
 AwNGuwmOBJ2DfQJyk6w9ZqAZHchySZCMN4cK0hk4QYMwTF+FKYihjJ73h A==;
X-CSE-ConnectionGUID: Jf78dxeeTXamm8VimpJwTA==
X-CSE-MsgGUID: G9KAg/kaSCyx9F0rJPtONQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51588610"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="51588610"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 05:37:53 -0800
X-CSE-ConnectionGUID: 9/yDMPIzQ6ywARtMSMWdog==
X-CSE-MsgGUID: S+syLgb+SzWVsUtXyRwWLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="115328631"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 05:37:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 05:37:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 05:37:52 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 05:37:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuHzADCiIWt6F7StdRpYT8DClesXNVO4QS6JeryrfBtKbbvIJVA9Hp+KC5oabFYG4HZjkTxDHf4xZiQlxpIh9gs/8E5Q0a4jBV7rBDznV4sLJXgdEs+k9J7+NZAELJ8ZDh2dO5O20POPUBofnBL9dcFN/pls93mmZJ0rRwMx404bwTxVZa0K55k2ffB+47lxUoF3HSkWrBMBeKaaT8un4wVGjdp5vhrqECuBI42MPa1FOlk8Hdv+Yv3VGCi/H8V0dIVUvIsH+Z3FlTi1I+hHVpWFcSEuLuRy2wXFs/EttZj6TYo1o0G6dflsXeLvb3/T6n+uPcZPOJtdkxIn4krcwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqb1eTGvEp25PKZ9oOvzL8hZn4ET/Y2I/Zv6ng5l63E=;
 b=CNwJnUK0n6Huz8X/7JpNeeXt8yrv/E+KkrINTSikd0bz25FZO4DNpjOJYQ3oQUAyFRzF3TFI5EbwfVzqh5zthUKpg0krAq32vp+8cX1K52Omm9EE7psx3EQlL3jKY4sw8gKHstojWeom/TJU1Oty1Y3O8pI5JYhwvqMuuLAtAqV22H+hTB4xCOAwaviybABFAm8MqlBmvnHK3Ye8/KmTWE0O7VvnYjNZFwt+2IJMR5TCQsVoZBgDPsnSIyK5iJyScq3ak/pLPJ/dWJmcA75fRfGIntS+1WtaK38ReJ4lI9UD4leb959JVnK1y3zXapFm0gGwmwlz7pkZtIeQKGlEoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB7890.namprd11.prod.outlook.com (2603:10b6:208:3ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Fri, 21 Feb
 2025 13:37:48 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 13:37:48 +0000
Date: Fri, 21 Feb 2025 14:37:42 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/5] lib/intel_compute: Allow the user to provide a
 custom compute kernel
Message-ID: <Z7iBpt1D-bEZUBJN@fdugast-desk>
References: <20250205101748.1117809-1-francois.dugast@intel.com>
 <20250205101748.1117809-4-francois.dugast@intel.com>
 <20250213070006.szwhib7r3bompjfz@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213070006.szwhib7r3bompjfz@zkempczy-mobl2>
Organization: Intel Corporation
X-ClientProxiedBy: ZRAP278CA0014.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::24) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: f3297ea4-5a39-48ff-20ee-08dd527cedea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZE5lOFBZSGNLYUppNjdIQnN5K2lRK056U25CRWx4WVNVRTJKOTlxN1VxWlJN?=
 =?utf-8?B?UElyaUNSSE9UUEZ0Y3Z3OTRLeEtITlB3MUkralhsamdOUkFIRFovYlZDRUxp?=
 =?utf-8?B?ZEVISk4zS0RIVDh0d2JFZ2NEa1JXZldwNXVKWkZSZkFDdnJ3RWF1d3lsT0JK?=
 =?utf-8?B?VkxhUmZpMm9iWng2NWxBSzVxZmNub3BVSkZZdWR6TkJ2eWc2bVpNMUpLZ3pC?=
 =?utf-8?B?aWgvdDJLaTlGblVEdEZTT1FjR1Vld0k2WHRkdTdWMnVHTmYwYVgvZElmbHdp?=
 =?utf-8?B?SGpBaGp2NWgwWElsblB3UTBqaE1yNFZOZ3Q3OTZ0eWdzWURqTlpRWHJWQlJN?=
 =?utf-8?B?UG8wbzhVV0hDZ1pCUUJrQXFiWDNiT2pjZWQ5ZXZncHdVaEVWOVk0MlZBUzdm?=
 =?utf-8?B?TW1rajVyOUVFRUJZTGJ2Yi84VEZDbkNsZ2JxYXN4amRWdE5QdkgwMXYvamJs?=
 =?utf-8?B?Yk11dEdaSW9zdEFORUJERDE0UzAvM1hkeEJ1SGJ3L3luVlBXdFY3Wm1HMnVs?=
 =?utf-8?B?b2hQenVHVnlncFBEQzZBTlZuK2krWVh2NFBzN0lTZEZIRm0yTXhFQjZUMUtB?=
 =?utf-8?B?ZXZJWVREMjZDZENKVW5meXhwSUlLaVVhdWp3Y0lwNlhXWTlYVlJKamtIN3NB?=
 =?utf-8?B?REtQYzZUcUZiUXI0elhTK2o3ckVxRll5RkYvWk52TFQvNjN2NHIrNGZEd3pw?=
 =?utf-8?B?SmpjbnNBdWtXbDBOWDlTNjdKU3pNNWp3R1cveUYrWGo2WEl5NjFxMHlLdmt2?=
 =?utf-8?B?Nmx1amh2SDU5MEJ0TGFaWitMcG9jdWpSZXlqanFqQndQK0FSaUwwTVRiRmQ1?=
 =?utf-8?B?UkF2T2xGZk9ERVMwU1luQmNManYxTEtzL1ViZWp5RUxEU2ZvRDVJOGRiTHQ3?=
 =?utf-8?B?bGhzdzdVMXZXd29oVENSaGY2d285aGxGelNub1JPODZkQ29lUG14SnZTQmJH?=
 =?utf-8?B?K3l5L3RmOHpPUHdHN3hmZStRclZGT0xubFVmSXdMdHZFU0xiS2hFdnRCdGQ5?=
 =?utf-8?B?Q3kwZnoxM2VDeCtoS3dhbmpjK1R5bDdkeTBPdEtoL0Y3Unh1Q3FhMzhMMndK?=
 =?utf-8?B?aHRaWGdGT2lGOEZyRlhpOHdQVUQxOXd0WW1kbVRnZzBSK2orUUVFdWlVd0Fr?=
 =?utf-8?B?RWxvSUVQUE1MRWlSZjlVZW5mMG50ZVNzVlJadlJCUVdiY2pEVnhtdi9kUm80?=
 =?utf-8?B?eXJKbzBROGxYU2dhT1ZPNXU3Y2NmN2VSU3I3cmtVR3Z5cXlnWDhOYnBWQ2wx?=
 =?utf-8?B?YmltaWJYalJ1MmEwNmFFVkx5TmZ1R2hUeUVVSzJ3YVJvOGlOMk8raHJTQXEz?=
 =?utf-8?B?VTFKRThwaHFiUm5BaDZGZ1dmVFBnOXhqNG8wckVFbHhKT1pSVzJSek1vaXdM?=
 =?utf-8?B?eEhzTWNXeE1NSnhXeWlXM2g4aWpEQVQ0RXkxSkczM2QvOHhtcnJRdWlCQUhs?=
 =?utf-8?B?TzQ0dmZtVm5LdW1Qa0JSQzFrTUoxMUR0Q3BZelZUakNjU2hyVFJBejIvaW4z?=
 =?utf-8?B?aDlrb0N1N3JlWEsxSnQwV1ZkOGc1UGIvSDk3VnNHRTUwOSt4VHpGdHlxMWpJ?=
 =?utf-8?B?b2lSbGdhMFFSOFZzME91MFBsWmkxT3o0SUZ0a1hxcVhLNnhmYXBsRjl5Y29P?=
 =?utf-8?B?SFVaVG9STTRxLzZYWFRSQjRpNFpQUGhyZU9HMldzTnFqVER2VEFuVXpwK3FZ?=
 =?utf-8?B?VjRSeTdHUnR0K1IzdGtRaktrYjB3V2tLR29rRkpDVDVTYVFlaEhSSHk3QkdT?=
 =?utf-8?B?cEFHRXArckFYZ1hNKzlFM1VjS1J3UVp1N2ttdS9HdXZLZDgxQ1lTMGo5MjQy?=
 =?utf-8?B?NTlKZTRla25xcDMwVmVnYm1JdXVMWGMyb1pQSlR1VC9UMENWdFhsV3hoSDls?=
 =?utf-8?Q?Zy4r6hpoFga/j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU4wSzdtSWFET1BuWkFYaWVVejBLVXJCM1BGbmpkTU15VmJyZWh5UW5WcVlS?=
 =?utf-8?B?WHVNcmVkcTZGK3ZPeDhSc0RZM1hZS3I1Z0ozQW9FWi8zQ25OMzJIY2plSjBj?=
 =?utf-8?B?VzgwL0U5SGdsSjlrTWNTSmlIQU1hMzR0cks2ZEJEcjBsUVVIamhCdWk3R0Zn?=
 =?utf-8?B?SGdLWEcyUG1TaVovTjg3ZzRXR1REa1pKaTNQcG82WjNHcHRaTmFoVXBwa25N?=
 =?utf-8?B?VUVvSERYdTVwZ2dHZUZ1Q21HbjRNMUZucUp0S3VvTUQvRzVwdUdSME1rbEhX?=
 =?utf-8?B?Q05RLzFzRHZDckpYaDVGcmpSU09TMUw4RGJCT0Q2YldzVzJPYmE4Um96NWJs?=
 =?utf-8?B?bWEzdE9RY29tV3RtVVNhclUxNDQ3RzJReFBEN3JNMXd4UTNiNEpnRHphRllQ?=
 =?utf-8?B?d3VVVkZ3RU1NRkFYMFB1Ri8rV1M2TUxhU0xHSm1GbTlwQjNmMjhTbmVVK01G?=
 =?utf-8?B?aTNHQmd0UzBTcVNhTDh2cmRBMXlOWWE4Y1lFK3VyYzI4YWRQUml2amtpM1Ny?=
 =?utf-8?B?YnRtUTBqdEEwMzFCWS9kcDh4NUNmNlJmSGVJa3pFcTF0dEp4QlRJWHVVR3o0?=
 =?utf-8?B?eXp3L21OVzNPS3g3dDFkZlgxTHpRNFFyU3hpNkR4ZEdrWDhGc3ZaVVdObGd6?=
 =?utf-8?B?MzNHSTdpMHVvR1QzZXY3TDAyVWdMWDViZ2VScGk4U0FvampjcHNoV0xHalJs?=
 =?utf-8?B?VmRjeXVJWWQzQW9jRnBmcXB1a3M0V2Z1VlVVSmMrdk92ZzFOcEdsRmFOdUVw?=
 =?utf-8?B?UysyaUdjcXBMeDJjWlJqSS9rVnlTcTFoV1Y0Z2U3MTVvck95SWs3dWlLcUp0?=
 =?utf-8?B?eE1rNTllZldGeVZJbG41L2ZBamxkeGJRdWdIaGMzZks3Rm1pTmU0U2FGcWhj?=
 =?utf-8?B?cHNsMzlZK2owMXViVFVLMXJVbDVTSGU4MzhKQTdZQTEreVZ1d0VvTDRNbm9n?=
 =?utf-8?B?SG0wNDQyNHdGK0FqM3crdDFPQS81UEgzWmNSaFFYZElBWG50TEpPQjQ4MnVz?=
 =?utf-8?B?czBWWDlsUHgraURLN0FKZ1R3dExmUGZoNXRIZHdzRzhONllTczE5Q000R0NI?=
 =?utf-8?B?N05qdkpNQUducDlQNjZaK0hhTlp0WU45VG9YQVBqYlRzb0VaVjRRTCtRc0Fx?=
 =?utf-8?B?ZkV3Z1hVTmJDZzk3NnQvb3hMQk9jZHdQTnk4RzIyaGtYOUthTjJxbllUYi92?=
 =?utf-8?B?REtEUVd6WVVmQWh1ZlB1OFhQMy9hZjlNOFBoWGUyZ3BFcEFRVlVMVHVWdDQy?=
 =?utf-8?B?bmdpejZnR2RzUFhJMXB1Tk1Oc05PQUsyU2N2MHExQnpXb0tlWnF2akpPY0lI?=
 =?utf-8?B?RnNOMnhUNTFYU3dtVGNUcXd5YU5Da0dXTWUzU2QwUUplSEVVRGw3TW02aWk1?=
 =?utf-8?B?N1kwUXRwby91MkIyVzhPUHo5MS9SZFFmb0l6RkNVNUJ2eDdiUGVXWWJKeHU5?=
 =?utf-8?B?MzI4ZXVQUmpXQ0hNQTE5aDdpVTdHSDRqVyt6TU02V3ErRUVWeGdROWJRSk5Z?=
 =?utf-8?B?cll3cEVZa2NaMXRxM1FIbWFOeWo2dStScXA2TVIwOHIwQWhZcnZZZU9Icnc1?=
 =?utf-8?B?QlhSbnh0aW82OHJodEJnc1ltUVBrWlZOaG42QTlITWhKZnpUaFFCZ2xLMHl0?=
 =?utf-8?B?VWx4RnJadkdlNXpubUdCTjR5bmpzUEdBdEJHTVgvL2wyUUlJOWRqUXFvUE1p?=
 =?utf-8?B?Um9ldDNLcXVzUXhLWHp2VjNReDFEQmlTTGpsWGFJL0REbzNFMDlMRkMzQlJl?=
 =?utf-8?B?Zlh1NCtUT3RaQkgwbzBrcUdsdUhLWUpTbW05ekRpbzU3SmVLZkpGVitUbm40?=
 =?utf-8?B?OU5oek1JM2NVdU9TZk5sbmMxOEkyNjdMQkxJOEhVbTFNU29WWXNTKzFqUW1W?=
 =?utf-8?B?RlZtZ21KOEl4Z1dBcDZOa3FxS0RadjJGVXl4aEs3YWMrV0xscE1ESUVLd1NL?=
 =?utf-8?B?Zk9MRmZyOGRMNEV5NTJLSFVjVFZYTDNaNE1NVEpqSks5cFVDNzEyOXVuellF?=
 =?utf-8?B?Z3VTZzF5SWNZWkw1V1N2djdWMmVqMGpnYUNITFcxKzloakxaK2V5VTlXTm55?=
 =?utf-8?B?d1ltUTUzenBDQkhkZURSV1hTTFFoWm1iS2dmYUpabGhtWS9SU1NlL29XejNM?=
 =?utf-8?B?SGZoRVhFcURuNzkrUW5UMFlLWFg3aGNVRkFxTXRldUJUdFFVUWJkYVNpQ1B0?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3297ea4-5a39-48ff-20ee-08dd527cedea
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 13:37:47.9239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qqk9K9Lm841dt1XQGntzCz+WpErRBk3UKC8zb5McKmh7ZAXYx7Xx4RDP9XG/7OTEmIDd2h04xWCpMS1h3NXESj9xC3/M6rQHUfOLvRnB2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7890
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

Hi Zbigniew,

On Thu, Feb 13, 2025 at 08:00:06AM +0100, Zbigniew Kempczyński wrote:
> On Wed, Feb 05, 2025 at 11:17:04AM +0100, Francois Dugast wrote:
> > Allow the user to provide a custom compute kernel which will be used
> > instead of the default compute square one. This will be helpful to
> > try out corner cases which require a specific compute kernel.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/intel_compute.c | 26 ++++++++++++++++++--------
> >  lib/intel_compute.h |  2 ++
> >  2 files changed, 20 insertions(+), 8 deletions(-)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index e0776fb6d..a826d58c0 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -1770,6 +1770,8 @@ static bool __run_intel_compute_kernel(int fd,
> >  	unsigned int batch;
> >  	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
> >  	enum intel_driver driver = get_intel_driver(fd);
> > +	const unsigned char *kernel;
> > +	unsigned int kernel_size;
> >  
> >  	for (batch = 0; batch < ARRAY_SIZE(intel_compute_batches); batch++) {
> >  		if (ip_ver == intel_compute_batches[batch].ip_ver)
> > @@ -1787,16 +1789,24 @@ static bool __run_intel_compute_kernel(int fd,
> >  		return false;
> >  	}
> >  
> > -	while (kernels->kernel) {
> > -		if (ip_ver == kernels->ip_ver)
> > -			break;
> > -		kernels++;
> > +	/* If the user provides a kernel, use it */
> > +	if (user && user->kernel) {
> > +		kernel = user->kernel;
> > +		kernel_size = user->kernel_size;
> > +	} else {
> > +		while (kernels->kernel) {
> > +			if (ip_ver == kernels->ip_ver)
> > +				break;
> > +			kernels++;
> > +		}
> > +		if (!kernels->kernel)
> > +			return false;
> > +		kernel = kernels->kernel;
> > +		kernel_size = kernels->size;
> 
> According to how we build pipeline indirect data we're limited to
> three arguments - *input, *output, count. Allowing the user to provide
> a custom kernel won't work unless type constraint will be met.
> I don't like this change, because someone who doesn't know how
> this work will start providing its own kernels will be surprised
> it doesn't work.

The way we statically build the pipeline indirect data is a good
balance of simplicity and flexibility, as we can test a lot even
with the constraint *input, *output, count.

More complex KMD tests will require simple specific kernels which
still comply with this constraint. For example the one below can
trigger a page fault at 0x10000 from the compute kernel context
so that we run other checks in KMD, all from IGT:

    __kernel void square(__global float* input,
                         __global float* output,
                         const unsigned int count) {
        int i = get_global_id(0);
        const __global uint* addr = 0x10000;
        output[i] = *addr;
    }

This is the reason for allowing custom compute kernels. This way
we can leverage the existing lib/intel_compute infrastructure to
test corner cases. I believe having this possibility is far more
important than the risk of a user incorrectly expecting IGT to
provide a full "compute runtime" able to run any kernel.

Would you be fine if the doc of struct user_execenv::kernel would
make the constraint of *input, *output, count explicit?

If not, what about replacing "const unsigned char *kernel" with
an enum which would be used to obtain the right kernel from a
library of "approved" kernels in intel_compute_kernels.c?

Francois

> 
> --
> Zbigniew
> 
> >  	}
> > -	if (!kernels->kernel)
> > -		return false;
> >  
> > -	intel_compute_batches[batch].compute_exec(fd, kernels->kernel,
> > -						  kernels->size, eci, user);
> > +	intel_compute_batches[batch].compute_exec(fd, kernel,
> > +						  kernel_size, eci, user);
> >  
> >  	return true;
> >  }
> > diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> > index c4b4ee5e1..6096bb83a 100644
> > --- a/lib/intel_compute.h
> > +++ b/lib/intel_compute.h
> > @@ -35,6 +35,8 @@ struct intel_compute_kernels {
> >  
> >  struct user_execenv {
> >  	uint32_t vm;
> > +	const unsigned char *kernel;
> > +	unsigned int kernel_size;
> >  };
> >  
> >  extern const struct intel_compute_kernels intel_compute_square_kernels[];
> > -- 
> > 2.43.0
> > 
