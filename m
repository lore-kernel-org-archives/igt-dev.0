Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94717C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 21:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C2410E96C;
	Thu, 15 May 2025 21:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7ErL2fH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABAE10E96B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747345828; x=1778881828;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=saxfKqqn7H+H7XRq7Q5Vdg/JWFUC+4dfLAf6tT+2Vyo=;
 b=c7ErL2fHe/M5aqwxFSepgBONrRhyT6Kg+2hmciQnCZqvZfuWwVLFgc9y
 VeRTgSTl9JwJJS51z2tDqCjaN8xEPztZd3YWNRy0yKuGvu32KQGB8UvUx
 JJ3XTpKsucGldNJb63G0UQpItR9GIVFnRMCOM8Tdf7pR47/D79pXocN1r
 8b8GeuDjStde3knppZ8jFTlo+E5AvIDMIUjEqZMnZzrQcKG7YJWZJa0Ng
 MDNnGUqBp7PHNVd5Ps3uNXACpaksEpG0XhNZ6KUkVHijhXbqwO/VEAP3+
 +crioJqtaXU6iEJfQc38hCrRsm+ouVwiijNcrehlJn8R8hIJUWVJwZcEg A==;
X-CSE-ConnectionGUID: ipz+FrcOQHG26XsMtsNXGQ==
X-CSE-MsgGUID: fVv9QWIIRwuSF75YFmp/cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60701301"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="60701301"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 14:50:24 -0700
X-CSE-ConnectionGUID: wbFSr6ZfRYCwPE7ORaUT3w==
X-CSE-MsgGUID: /96pqSk7QXyzkHXdcAWWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="143380757"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 14:50:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 14:50:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 14:50:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 14:50:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yz04I6dnVaPNTLd2Fcil1bh+Tq7ZdnyuBUy/AOv7HGRwbtKPimh+66ajWEW9oQuR/Q9AvLjwXqY99HKMnCe57STpB+iWmRcF63WL+TPBGKyHYW36+vsG3Rwcty4hb3gsc1Pu0lCf2/TXidRPGoPaX9tvxlDR5veNZCh5AiW7/jibehxhzLSrudcy6hQhL1HcAAyVT4XJW3IYMDvJX11WDK0ZBmkFYz473TWVnCTXgB4qHIsGObiJZ4g1mj8R8UkzUmkk4/hCIZ0fFgOHEaPpkTEL363vXsnukoNGbZDRYk+LzleaDC7S7tHWqUY5uvUgXbLpiD+zCYWE6CrRzNi19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLcc40b7fPL5dE8G/dGKyKeFKTuc9DmNNuvtZMMOuEM=;
 b=wvXzwx6CRPuk6NJAtZAJSubKNayj8FJOza0nYD3BvJ3nxguaYpBx8D/zaoV0JVeo6qgjL8uwpjFz8IsOJzxKtHxlr69Hk3aXvf1WX47Iw8QeJOSwcIPWpl1H8ktC7BPAd+lwAGDUv1LXwbMhZK8j/0b88WePy1zIAL62UIPxaD0i3ixEFl4yZDhee7Ls/6b8L0BTbPL2Rzni8/jnqO5RL2GuARf2h/2JSaJPqUWJLcyX0gHmvFYjqJynNalYZ/0oRRPszFqk+oixl+yMTMV/6Wt48i2p/QFhwMuIGJlaxqwdhdtU8Au8btjXfNbQbAJrsaj8UZ37dZOS7O0UjiHBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4752.namprd11.prod.outlook.com (2603:10b6:806:99::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 21:50:06 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 21:50:06 +0000
Date: Thu, 15 May 2025 14:49:46 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Avoid divide by zero SIGFPE
Message-ID: <aCZhegTSDM0_c9GH@unerlige-desk.amr.corp.intel.com>
References: <20250515201804.1631501-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250515201804.1631501-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY1P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4752:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d22c15-91b1-48e3-5f4c-08dd93fa744f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmtZVm9kam8rT011azM5NWRENWU4a1JJZ0xyZ3pNT2pSQ3JlbDFhWXROWHkw?=
 =?utf-8?B?V1dOODRObFRpS1ZqR05jTXZIRGlpS0hlSVZ5cy94QktYc2dzMmltdU40bWNw?=
 =?utf-8?B?OWNRbjIvMzl0M2hUcEFEdThKVlB0UlF4WElIRUFKcDd0YVBFbGlaem9XZTl1?=
 =?utf-8?B?WXg0YUVNZWRQTktDaTVLWlV2Z3B3ME1ZQVhqMG5JYVJza3kvYnZNcXhCUzkz?=
 =?utf-8?B?QmNnNmxJWGovclhmZkFUaDlWVFBCTmZRYzMzZFp4QndqT25JSFpaWWJHbURX?=
 =?utf-8?B?OUg0aFhETUwrbGNab0Q4WDFCWGpncC9PUk13MzM1RTBqTXoyckhYZStkV3VF?=
 =?utf-8?B?RU5YOGNpckZBcG9VcU5mcmhyQWZCTUNVdUNjaXJHbTdNNHBIbWwwd2ZCWnBx?=
 =?utf-8?B?YllHRkJxT2RjR0g4MDVmQ3hwaHBNb2Z1Q3grY01hUEhYS3pPeW53REUvRytr?=
 =?utf-8?B?SUVUYjNsNFp1WnZCaUZYRFltRk1odXFUd1ZsR1ZCY0ZaeEYreVJyNldMcE5K?=
 =?utf-8?B?anRwMTdScWFkdkJYbDNWb1BGTytPZjJDaGtaNE5xWnpmVmRsTkFiQjVtUEVv?=
 =?utf-8?B?dGhuWG83Q3lITTU0ZjRsNldvQTA1RGdBRmFGUG1mbDUxNUZ5Ty9sVGJLelZX?=
 =?utf-8?B?dGJ4MGxUU29wQmJSSnNlUVR4dFZxZmRTblZHbTRiQ0xyenFlbXNaOFhqVldV?=
 =?utf-8?B?TTdxbTQ4YWZZNHJCY2JXQkRQMnlSTWZRSXlqUlFlalNHK09oL2VSQ2VVZ0Ni?=
 =?utf-8?B?WkwwQ3owbTMweU1Jdnd2MUtXSURVMzdWRnJsWXB2Mm8wMVdhbUdwdmdlUjJR?=
 =?utf-8?B?ci8vWS9vL2QwZG5ocjIxWHo0RlYwWFZleTlscmRhc2ZMUkIycE9XZU9EVDI1?=
 =?utf-8?B?Y09iNStTaEl1dWtLNlczcHB4MVY3OTVBUm1GTmJzTjhxckxJQW9vUDJKSXVK?=
 =?utf-8?B?SkFka2ZMd2lJT05YYWs5cGZYc2djSU9OaWpTZjhJUE9JVWNMTmV3bGpjbHd5?=
 =?utf-8?B?TzVDUzB5eXVTMnNJcmRNTW9HbXJTS0RMOGZHbk45OWh2ZHlPRXM5Qkp5T2JP?=
 =?utf-8?B?M3M4RWZKK1JxUkJleE5Vbm5VTjVsa1V0d0htTVZod2lLTXJqRlo1STFNRWNK?=
 =?utf-8?B?Q0JERDJDczdsR1JQbm9ZVjNVOWxrbkg2MU9yeTl2TWorN0Z0VDZ2RFlCYytJ?=
 =?utf-8?B?SDh2b01iM0U1ekNKYm52YVA1YlpBMWRxVlhWaVBkOFlIM3h5bU9VK2s1Z0Yv?=
 =?utf-8?B?bW1yOXZoTk1QUWVSWkVqQlJ0RVAyY3VIKzlVV29nbDB5ZzVLU2E4bHdTbS9V?=
 =?utf-8?B?QU9oZnZHS3BTeUpzR0dlTm93enNhQWx0Rmdsazlqb044d0VPVjAwVkl5dWNR?=
 =?utf-8?B?cFVJZmhON2d0bEJoQWwvWW9qcWQ0TjZjOVFTTjB1U1hVaHVxdDg3SXRPYmhT?=
 =?utf-8?B?Z3Vjbm4xTW5ZaU1rSng3T0xHVUJXQ3BoSll4aWhXQTRZZ2pPbjk3dFdiQzhC?=
 =?utf-8?B?WTdTNHlUbzBmSWVraTRuU3gvNzA3TC9jeldkTkxOeldQeklwT2xmYjNwdWZq?=
 =?utf-8?B?ZmNWVkNFRDVXY2psbkl6SklTWGFmdUVaVkUrVkNmUVZzOVhJVVdFU0VQV0oz?=
 =?utf-8?B?c0pmWTBKNWlJdWRINWVwRS9kbmNFK2JRMFo3U1dQcmVnVXJQTHQvcHRVMXoz?=
 =?utf-8?B?WTZ0T0FJQk9tTkYrVDk0T2Z1alUzTml2WUg0M2RjeGlZSS9Fc2h2Q281TWpy?=
 =?utf-8?B?V1NCclhTMFdsQTN5Q0F2bUZEREhGaXVueG1OeGZKRHdFQVFrMktYNUJNem1n?=
 =?utf-8?B?SklSN3NRbXRDWGtiN0VuZnp2SmZkTVludTVnZTBxcnIvcXA4elBBWWpzaWc0?=
 =?utf-8?B?WVBHL09kdXphZERGbEczaENNRVRrT0dTWkRJN2YwalRSaEZRMzhSMTVqZk9K?=
 =?utf-8?Q?DhTzAS63KE4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWV6RmFuRWNhL0VDMldjcDNhajhFTmVMSGUvMll1UTVEbE1IVXo1bU9vMFJj?=
 =?utf-8?B?Y0NIUlNma0tvZWtDYndOWjU5K21ET1pvUW9TOUp6SU5UZUN1K1ZXNlJyaW9k?=
 =?utf-8?B?N0d0bTZ1WjIzVFg0VkZEc0M1RlJyR1d0NmJxdjJRdFROOHh4a0s3by9YT0l4?=
 =?utf-8?B?V2oveCs1MGEyNm84cmtzejIxOUFicmpJZ0FCSEJsdnBZWE9rYWZWcEtrdXBs?=
 =?utf-8?B?NUZ4VUUzY1VuWUVFSTZ1Wk5wMS9WSmR3ZDE5TG82U1NDbG1Sd2FYVm5YK2Rt?=
 =?utf-8?B?Z1lmbGFGYnA0dmtVMVR3M3AwNCszMUFEbTV3Vm1kMGFBR2syYWRMaTJEWGVO?=
 =?utf-8?B?WFVtV1h3dXYySjM3SnF5Vzc0azE1SnFYTVJIWVJuaXpycTJzTEJMYXBJMVo3?=
 =?utf-8?B?dU9EUWhYbHNiZDFjQ1FWeHBwNlBrUEVxUVcwL01qa0JDaXhwV0dodkJJSmZ1?=
 =?utf-8?B?SzhCL3FQa3lwUTl4UHhoVnZBdzBrai9VdWw3eHZGKzJ0c2hQRk1GQ09wUndm?=
 =?utf-8?B?aXJ1MGYzUzl5aW9GL05DNi9HQzRqYVBmU1RoeHhnYnFwUGFGMW9ma0poY1Iz?=
 =?utf-8?B?TDBndHc0Qkcwd0gxelgrUXI5NlJRQmlFS1BvYVpXNDAyWlYyVUl4dnJXYmU0?=
 =?utf-8?B?S2dYenFRdTd1VWgvYy85VnZHa0lPYmJZem1vM2V0aFdsTUoxM2VVbkI1T3lB?=
 =?utf-8?B?eXdCVkhuS0RGTVB4S3BwNGtMbUJhbkJnSmppSUlQOWRld2RDMStnY3hyTVBC?=
 =?utf-8?B?WTFJeW03YTN1TDdqWXl4RVRrUkJnWk5ESmp3OTdTTWNrMjh2ZjJOWGRBa2Jz?=
 =?utf-8?B?djNkQU9tQ1J6UFBJWVpEdkU2UWh3QldOdm53YVBtU0JFNEZWVjc4TkZxTkZl?=
 =?utf-8?B?V2dLT1pTTEh1TVovd2k0UHNzRWpub1hJakl1elJxdDRUZVBwWGZBUXVsZUpS?=
 =?utf-8?B?SFpjREdyYkt1c0MxemEvMEFqdHcwL29hamZTYTVJUGpiWEFtQmk1REczWlBY?=
 =?utf-8?B?M3ljME12UXgxSGtDa1c1bnh5OE95NStZS20yYy9tVUNDbGcvTjN3OHJQdERl?=
 =?utf-8?B?SXhBb0V0N0g3MGV5TTl5UFlpb3JWTDBOVmkrMkc0M1ZTODNmOEYremdEblps?=
 =?utf-8?B?Qzd2Q09RS28va1dkVlhrb3FYUVZuTlJ3U3JpVEIzc0VVaHI1cmE2UGxCRTJK?=
 =?utf-8?B?cmxGcXF6ZG5PMnRNVk5nMDhNUkRGTjNEWDh5L3pCa0pXRkxLeTBJR1pZUHJK?=
 =?utf-8?B?M0xnbmo0a3QwR0VQOXlacHo3OEVCM1ZudVdleGJTa1hBTFlxTmhqLzhpQ3BW?=
 =?utf-8?B?dTBrblJtQTd4eS9vSE8ydnZhRWZSSkY2WXoycnhteEtxVGY5MExRUVBEelhy?=
 =?utf-8?B?Zk1VTDd3a3FYUHl4RUhhN2M0b2pGNGJLYnJPYzIrektQRDFwNXRBb0VQWVBX?=
 =?utf-8?B?d056NVo5N0JqMVhCZWdXN3FmSzJNUHd3VTh4cC9VdCsrMHJOQ3NyNlNNMjJk?=
 =?utf-8?B?VEFoemJZakk1L3BSTUY5NlNpM3d0R2NLOVZrQjZuVStGbnliTzM4bzR1bEwx?=
 =?utf-8?B?RDRxMVQzOUVoSW94N2dGMFlGVTVSM2EweEFuRlJHSm1WdjBLZnRTTTJPVzJn?=
 =?utf-8?B?RWhNZGVoTCs5WjBHajgzdjBzaFFoVk81TTlJYXc3M21jTzRPcERMbFBHbHRL?=
 =?utf-8?B?VTQxeFp6K1FlWnFEenQ1WW9LT3UrTHNicWhsQ0F1bXlrckRJVVhNeUlGTllC?=
 =?utf-8?B?YTE3ZGhrOEVFbWhEMlE1NGQ2bk4rU01peVBKZ3E4MnlsSEhyWDdySG1rL2U5?=
 =?utf-8?B?eHA2SWZORG5UMWFSSVJKTzFTZm9kME95SHVJZ0ROZXlzTG9kRk1yQkY4RmFP?=
 =?utf-8?B?QzNHK0tBTjJOTHl0Vm9mSk9XdzVmSWM2clVSd3ZIdXBOTENFcUxDd1FZZm1Q?=
 =?utf-8?B?a1FvdFdtK1phVkYrUEV6TjdrRm1pN0Y0bTZoNEowVXVBYytzN1Q1Mmh6T1Zv?=
 =?utf-8?B?cFIzZ3lYUHZVeEszNEZ1WG91djBseGVRY3JSdzhSaG1wdzd1STRMSzg1VVRk?=
 =?utf-8?B?T1lScEdPaTdMRk53dGlBbnZIUFhHUEpHRERFOS8rSDdHQUxCdW41SnJQSElQ?=
 =?utf-8?B?bS9BN0lNNHozWU5LczZOejFuVm51c2pJSG13dWJqRVJ5YkdobDFiTkpHdnht?=
 =?utf-8?Q?dvUxIiqg3OTd5rZtrOcb1QA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d22c15-91b1-48e3-5f4c-08dd93fa744f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 21:50:06.0420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4ApsrZWOF6H6SHZFfyIWsaABYBmO4yznARUNV8dAnYq97J0CBu5EsJf4WBb/gcXT/OBMyMi8MB7LgYZ+eY0GUf8U6ZSouF20IO+F4eNIjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4752
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

On Thu, May 15, 2025 at 01:18:04PM -0700, Ashutosh Dixit wrote:
>It is planned for future OA units to have 0 engines attached to them. Avoid
>divide by zero SIGFPE for these cases.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>---
> tests/intel/xe_oa.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 1576479d98..73841a359d 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -445,7 +445,7 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
> 		oau = (struct drm_xe_oa_unit *)poau;
>
> 		if (i == n) {
>-			hwe = &oau->eci[random() % oau->num_engines];
>+			hwe = oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
> 			break;
> 		}
> 		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>-- 
>2.48.1
>
