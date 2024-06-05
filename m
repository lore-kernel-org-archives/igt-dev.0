Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C446C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 08:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D150610E060;
	Wed,  5 Jun 2024 08:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTjcRfp7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D8310E666
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 08:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717575809; x=1749111809;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PqY642nbZePARzfB4Ywk0VmKC6rq7hI+vONxzOUyZUs=;
 b=NTjcRfp7Oqc/ZstRCzI0ePOl2eEyoM65xgFccT3bZ/bmayNi9i3QDi18
 L8hTz0olBiF3mhsGZMPbLVMnYZRX8+zrW2RGS674emZQmt5mkGgtzYPFe
 NJNZBe3B/N+TMlJ3Rq3GPoJVABi9lJclL/G2cBB95IS2cygavdv40kEs6
 D3gk4mojh1fXJpDvBRqP8SMDDjRpUFQrm8PyfL+/TAWlOt+XDyDn9iKd+
 4ljaUTShp4Ef7xEfuwG/8HGgew5sIDPI6w3JEftZDvKvP1NpKwQZhrQ2g
 OKO//pMAnuAkIPimDEWd6qyp4i/CMVla8CVyRlzRvbJNQKlUBVFinC8wT w==;
X-CSE-ConnectionGUID: QQmmDWJ/T12esiPXEeb7iA==
X-CSE-MsgGUID: QG5cVpXJTMOn7NY7Qz5/CA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="31706624"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="31706624"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 01:23:29 -0700
X-CSE-ConnectionGUID: wK/HYuYARRWO/fE1qPpmYw==
X-CSE-MsgGUID: MrZfZYeURROOH4SxN013mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37451933"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 01:23:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 01:23:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 01:23:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 01:23:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 01:23:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9YQY6PP2rcR0VH48OPiOACzYa8lJKTwo/mO95Coqxzy2SwFRVdEYJtcwreZh93Hdsm6f+sIqGQfFLMO0QhYp5IY8PWsAKvAMkXfKc7AIz4/GRNFb2AWHhZp5tIyBqz5qhIbsPEngInFBAEmmKIkDjtIqwpMzEzFuDX7KgDfTWVmRUIe3p76ropcJ9Z4mhGyVZbgCkB2e6jbZ6WQM0iUMVCXDkwwV++EH1VNCErPOA95qLA8tOFbNmzs9YgUPakpnXDmCMvtkTqyBb84jMFqaAWV46iojI06qArzNpOwnleIB2WBif+LsHeIyxNYDVvCLNsTukufNF6S3y6MU4n7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyHmiRObc2+heDAaJtmB6ebLXn6DhlyvKZj33CPwTds=;
 b=SWesE4Tc/VIk+2WUY3Pv8SLUGxk8qU49skf7XzxI3AGIiMwuu9FFYnbZ7JTr5TYsKRfnOZXIdFLwCgw3M9oVC/c5eEWNy69J7l+nLS6uLrbzv6hIxoyfgF2/TN8ITxGLBqRwasyR0HMC8WyWTBc9FfjXRzLOF5tK0jwC34gD1OPUZU80AD9xp/64xl9KTV/Sm4+bgmVrmq97p5F2UXtahzmPnug1YFg6rp8qI1nNlVj1h5l/7JpWUIaLUApDSTtmDcvhRfbKRjOUJRr7LiJO6yuf+k/b7xwO7pr0obQsUPU5IA+FdybX3UMJtECngX6kQK6iK6vlfNC4ONkmVsj9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Wed, 5 Jun
 2024 08:23:25 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.7611.016; Wed, 5 Jun 2024
 08:23:25 +0000
Message-ID: <572905a0-820a-4aa0-8438-06a441dbd67b@intel.com>
Date: Wed, 5 Jun 2024 13:53:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel-ci/xe: Add fbdev tests to XE BAT
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
 <20240528054223.2945356-6-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20240528054223.2945356-6-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ2PR11MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 81434e6b-4ea9-4d3d-e834-08dc8538c504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUZaZUdoc1E4YVpDR3dQS2NpQk56VlhrY3YreGIxTGVUcFU0cURNQzhYUVp2?=
 =?utf-8?B?VDhxd29aREptMDFjNFZHOXBnREpGZi9HYzl5eWJ0ZmtHcmpLek5yWk9IeWs3?=
 =?utf-8?B?M2V5TTZublFkbnRINTM3Q0dXaDBibTdPU2NtSnR5VzBtYWlvays1bWhoTjRv?=
 =?utf-8?B?d0p6ZFhrNmhJQ1FXRmJTYzMyQXExamlaTVV5cnhEZnQxNVZqTnJnRHBvbTlh?=
 =?utf-8?B?UmYyMFBlRkl2TFBtaXQ0a0dpakIxWFcweWVvUlVJQkpVQ2hVaFNmSk1lcUxp?=
 =?utf-8?B?VzFYNTlYN2pHTlM4cWFtZG82anBjUEtuM0cvcm1Ma1h5ZHZrV09NdGNkK0xm?=
 =?utf-8?B?VU5EVDFVQ0VvOE9UZStxam5vblRxTmVlbSs4N3FEWEZmeGJiVmdQcXg1d0g4?=
 =?utf-8?B?K1QvRFdKamtXbW42OVNQRVExN2RPRmxIcjZtbndkYkNtNFZJb2pzb013NWZV?=
 =?utf-8?B?d1ZMZUNacVR6T0VrbExXNXZnNFE3cVFGMCtRcFNzTUVHN3l0Smc4bHNST3RZ?=
 =?utf-8?B?U3UwRE95NVA0SVN3dDlnYkJVL3YwQUVyTWJ1cmswaHlXazc3S1RmOHBubFUr?=
 =?utf-8?B?c1VqUktzOFl1UzRYRzhaeUxlOVJRQjgxYVZNdm14WlhaNmJJakxHYjNvNXlq?=
 =?utf-8?B?b0kybWpVN2taZFk5NzlTMDg5RVd0RHRqWjhaOGxBelhYbEdVemF3OHVvVWJG?=
 =?utf-8?B?Vk1XcWNacjgrT05qdXFHUXVOMStCQTEzU2xyTDI4RTc0dEdlaEZSc2RLaVJC?=
 =?utf-8?B?UFE4NjYwT3VDZmwvRmF1UUZOaEhaVWIvdlZ0ZDdXMkJPR0JGZ3BuZ2FxSno0?=
 =?utf-8?B?clFHY2lLVTFScXBCSnZjSGh5cEJUbHVZYm93KzFUQ2VTckdVbDlneG83K0pz?=
 =?utf-8?B?SlcvVEVOZXVsZHIzaW9iSmNXUmRINXltSUsyMTZtSENVMktGcDdnbEM5RGcx?=
 =?utf-8?B?SFNaUEl2bWhiR2JTbW5xNDlPYW5UR0xsNHpkRWhiWURrb3krVFVRQ0FuenVi?=
 =?utf-8?B?QXp5ZERsVko0eDJvT0NBaGVjQ2poOHRmWHZPSkltcUM5LzNUS3gxOWZ5SzQ2?=
 =?utf-8?B?QnI1dWNCSW5kbGc0RVRCZzJ3RUVIa3Z2NmZ5S09aQlVvUzJQZVhjMDJLY2dW?=
 =?utf-8?B?TkljbU9zNWx3S2tGekZzNWtiRTJ6MDh6NkwxVDJlejlQNW93NDRFeTVLbGVu?=
 =?utf-8?B?UHdnZXFmRGx4R3VGMllFNVNQRzY0MSt5K0tEVlh5RTVyeUVvSjV2WVpYbHRv?=
 =?utf-8?B?Ymc4VTI5V3g4Ym02WnhReHVtVVJrQzhNTVZySGRCK3drbVpDSTJpWlZFOUQ4?=
 =?utf-8?B?YTB4Nk4xMU8zRnhKY0RYbkpVL3lZTmhOQzBlcXVBdmF1SUtCNjM3aThKRmYz?=
 =?utf-8?B?YnVzVUtNaS83dHJ0OGs5YlZMbEQ4UjVQM3ZaZTF3Mm56NmJVaW03b1hPejlC?=
 =?utf-8?B?bTQwVVExcTdFQVdQWHk4dndDYm5OeWJPa1pYOS96dmI2NTc5a21wRktQQmZu?=
 =?utf-8?B?WUJrUTFqeTB4cUpxTUM5cnhCcnRPQmlCaG9VcVhZQU43QTh3K2xCalRPbitL?=
 =?utf-8?B?RCtTUFhJTk5EWVc5NlBHbTNCZEQ0c1pQSGpOeHhac3YxWjdUbmVLaGZDOXlU?=
 =?utf-8?B?WVlhS1p4NnZzQlJnQ3NUY2E2cnV3S0FnbUFFbTFqU0JzMER5Y25xaDM4aDUv?=
 =?utf-8?B?QldxaUpwNnF6NG5CdW1PL0duTmt4cnhtQXg4QUhQTml6R2MwUUZmQWR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXA0bFBWMmhuc0krdVVDbnpJR1loQWRtVUlkNkVNOXFZSVB0M3FNc21HTE40?=
 =?utf-8?B?d042bHVtUmMvYzNkSU9nRSt2UEcwbkd0eEpHNTF2cGN4LzJXSy85YzBsb0J0?=
 =?utf-8?B?RndqYmJWTFM4c3djY1pncFpieE5YZ3RLOWlsZUpNNDJLSE83STMxTnFVTmZt?=
 =?utf-8?B?YXVZdVR5Y29uVDAwUzF0L2crU09Nc0xxVVRYeEJrTzEvM0JnODRGeTlsd2k4?=
 =?utf-8?B?RUdYTS9jZytqYkE0TC9xV29NUVZDL1F4b094bnU0cWkzUjUxSnhiam9nRTMr?=
 =?utf-8?B?QTZycUx2LzdKZnFMbUh0YmZNUms4RGRYNGZncGs3MDc1ZXpWQUswRVBMYWFS?=
 =?utf-8?B?dHVTRnROUEVrenpNTnF1U3k2cEVDaG43THhzTkZlYWFvYUVHQjBhSDdYa1RR?=
 =?utf-8?B?UzVCbERXZ1dCczRwRmpRMmxsVzJVbWlTZktaV0xFUGZOdG9jSmwzZ1RQNXp0?=
 =?utf-8?B?enUrN3B5UFVmREFpZFp1d1d1UU8rWExCM1YwdlpoVjRFKzNxQ0J1eHFpUFhY?=
 =?utf-8?B?STNGWlUvTnRBWkZySzdISXdnbXNMME9qdkMzRy9SbVFreXlZR3NGMjN0R0Jp?=
 =?utf-8?B?bWxSckFieCsyeEhuM0xOQUI5bVI5U01HZ28xY3FBclpJelJtRFJNQXpVQm1S?=
 =?utf-8?B?M2R3UTFHV2doSGJ1WXRQRUwrK1NLQjFEZndrMmtsNGVISmY5SWZOeEl3MFgv?=
 =?utf-8?B?ekVUc0V6WTFWUVNPczNNRWZJbC8xdm0xMHZqb3cyZXk3OXhWUkpYQTJ4aVpw?=
 =?utf-8?B?Ry9mZ3VETWNXa3pTcG9WZ3IvdG9vN0JhbjdHR3BDbDhhbVJnVmxyWHJyQmlL?=
 =?utf-8?B?eDNmaWhOSVhPRys5NTZWMFIyVTZ0QyszbEtCcnZ2VE4zaTFiZzUxRGxnNnhR?=
 =?utf-8?B?NUEzK3NJaWx2QTk5cmVyVzlhbzVrMjFDUGFGT0hWQlZNM21Jakc0UzYxd3Fr?=
 =?utf-8?B?Wlp1K0JKV3M0a3FXd0VaRHZDODhVTmVUUzNvd3hPR0Mxa0oyNk5jdFNtR2Fk?=
 =?utf-8?B?V3hvKzRyQm1McW9SU1grcWxTSXppd24zZ21KSG1HRXlnK1hPNDNwL09rZVla?=
 =?utf-8?B?YXhORjRSY04vWmdJUjl3RkZodjYzRFB5aEVyQS9RbmVTWU4zZlZ4WG1mRUUw?=
 =?utf-8?B?SGl0WGViaGpsdU9RVGZWSXluYXhMSXdkL1dNOE05aU1QUllhVExzN1JMcDlF?=
 =?utf-8?B?bnduVFFCT2FlSzVVRk56aDh4eVZ1Qk9PMG4zbWF0eWZ2b011V0JmcjFoZytU?=
 =?utf-8?B?RTVzK09XQjBIaGZSM3RvK2FsTmlRZXZ0QVEzYzNCdGRWald2TXMzWEF3cjdl?=
 =?utf-8?B?eWJRb0JDRnhwdllrV2xlWlpKL3I2ZVNBa3BmdkZ3L3JQZnFIRGNQcGd4ell5?=
 =?utf-8?B?bHZtSVNxQmZMSG9SL0dvaHZsSHFFOHg1ZVRMMGkwRDRQV3Fic3FlNFBtK2gx?=
 =?utf-8?B?dUsrMnhGZ1J5dFZtdXhnNEo0cGQ0Ui9FZmZEVnJncmVaWThPd1FQZHRFNDND?=
 =?utf-8?B?eGpXN01YRmtrSzI5MzhsV3lrdXdLbnlvRjRBamsycmZkeXlEbyt3VFQ4Z1VQ?=
 =?utf-8?B?QzR4a0VEcDZwaW44ME1qZjc5Ymx1Y3dTOWRZT2pETmlybHdPaHhwREpGWmpP?=
 =?utf-8?B?by9mK0UwYlRuQmJHM2w4K3liYzJLUGRCdFp2Rk5JK0VabWc3N2s2K29vTzlB?=
 =?utf-8?B?dlhMekJya1hRSVV3TTh0MG1STDNOYzhIS1pKL285TTN4L2FtWmx4djY1SjNO?=
 =?utf-8?B?YnBqYi9wYk8zbGkzWHVjWGwxa1BzUzJPNS9rYURVZVhqSGRoS0lQd201NEpR?=
 =?utf-8?B?enFxNGx1Qy96RlhnRlQwbWliNDMxVHNDTEI3bTRGRUFIaTNRWGV4dWJnbW9q?=
 =?utf-8?B?Yy9pOThYTGQyUU5XdDRBbDNLZmREamxGSnpVb3VqM1o5UUFaa3AzWnBrN1lv?=
 =?utf-8?B?ZFhWQi9kdGpMTnlwQmxiQzRHMkovV3VUSE8yNkZJS1dpWWlJWnZZWS9RaGRi?=
 =?utf-8?B?TVkwbVN3SGY4OWVQdXVncDY5RUVIU0orSWJDNjhqc0FJTDZFVmRmNER5TVZ6?=
 =?utf-8?B?UUduYi9xbFJpcmhpY0Ruc2Q2UUJCenNpQndJclJxZmIxeTlPTjNGRTgrSnly?=
 =?utf-8?Q?rAtXgR0orcvySGyMp15UlDeUN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81434e6b-4ea9-4d3d-e834-08dc8538c504
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 08:23:25.3389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwxkJyMYzo1TQ7prPOYeHdNJ9YUmZntvTWpPHnrzX0/rjBpvV/of4iLhuwqdmusiCt3adDU2MSoUutK5z63stQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8370
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


On 5/28/2024 11:12 AM, Bhanuprakash Modem wrote:
> Add few fbdev tests to XE BAT.
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Acked-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe-fast-feedback.testlist | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index c57706f25..aa98b37e6 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -1,6 +1,12 @@
>   # Should be the first test
>   igt@xe_module_load@load
>   
> +igt@fbdev@eof
> +igt@fbdev@info
> +igt@fbdev@nullptr
> +igt@fbdev@read
> +igt@fbdev@write
> +
>   igt@kms_addfb_basic@addfb25-4-tiled
>   igt@kms_addfb_basic@addfb25-bad-modifier
>   igt@kms_addfb_basic@addfb25-modifier-no-flag
