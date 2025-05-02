Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C076FC3ABAC
	for <igt-dev@archiver.kernel.org>; Fri,  2 May 2025 22:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8A110E96A;
	Fri,  2 May 2025 22:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iy2/4rQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAD910E970
 for <igt-dev@lists.freedesktop.org>; Fri,  2 May 2025 22:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746223304; x=1777759304;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Kfq0TnLk/y6oKQcG4fBnCvq3ZT7N0S/aGvNZRSKbFkk=;
 b=iy2/4rQ5v0wU4uy78VdmumfrvTMnvy+TPVApbp7DpVdcDX9I2wmmLgPw
 KFY0BOPBpNwDahypfwUVk3tAGxwy9d/yf2ymnWM6JO6R3nPofuOfjUmkU
 9kUG4uKOMx7/KS7qqMPcx7yj5zRRxueYPViVYkxU/zN7VniGgxjbJe7fZ
 pYcThpURQM0ZLJfEs4gZ5RV6bVuJuPj9vOmWOAgda0RnG6nJg3lbkl5er
 C2CqV/FbqNutO2Kw4piY5VHwLIAdqqyVPUBGgXQ259WCcZQ5hw0wwWOsE
 dgRQrkSGUIuAaywp869tJ9ZOoN3+Yo3ghUykwsc1W9YLWHfIvMN8GVlZ0 w==;
X-CSE-ConnectionGUID: O9wrunasTxW2lmOk84yauQ==
X-CSE-MsgGUID: 9cDCD259Qv6sL3moJ5eHyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48056281"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="48056281"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 15:01:44 -0700
X-CSE-ConnectionGUID: Wr4ttMDETwaR2aqDdXj7xQ==
X-CSE-MsgGUID: pTDseRwdR6uCv0OR6oWszw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="134702111"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 15:01:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 15:01:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 15:01:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 15:01:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZ4avELUUYFx06fa4w5EdvdNWoD0Mo3Y1ziOJEXDwlq+ptsXRiflVGlBozpvKhf2fAhowS3mZWjlxwkm/0SVYVBl0N7Jz4VmJbxG0A/64UdtBnhj0FccR+T7833vfhpkxuXtqmBY3AtPbm/M3z8CWIiwgfrc1ucwxp3TGh8+1jeO+pC5vpG8awMJrCGWKmAjZ3lzjcu7wjojU6/k3Di35gF57mBJaPjIZgBAo2Z+ZRGl6YgahX1XU4llWLA57o1XwKyEI+FV6bAl0WPVxFGRf7e7rKKEaJ93mmqBW126uzUonfomgBHzk7ZyH+ocqEqPNfJvUaIc/AIETDjaqeyPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W26oSl7fo7KLi1b5e6FNmnTN/IKosORU6Ernx8AVLAg=;
 b=VOIOWY5FRG2LgiuHmh063XedjchVZr0L5K/Znmn6BwkYKDqanGbC4GXxFyit3L+Rw6irY50KiLS7v2TsQgm/TSVn18OyOxW30AnaO0fk6n7MlKAmtfeAkFncL/rCqnrMrD8RpY3vD7Cp5HdTUy4Tjv26WnoHB1ZiTY4x8biZC83jSUAYuQWRrlfZVVN8t//BEIWPqZYRTO4xYw3Wl+rEC0Jn23PyA+uIVb6ZtEj9N91njWX0082rjHt9Pz7H6w/fdTE5f8EL+IHlOnppTWN3FWWGT3fp6566bL2mbB14j38LmVVy7Haqijqv2lJX7ixfwbozKBjvSZuvmfD/ykUH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 2 May
 2025 22:00:59 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 22:00:59 +0000
Date: Fri, 2 May 2025 15:00:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/6] tests/intel/xe_oa: Sanity check PEC report
 data for TestOa metric set
Message-ID: <aBVAmWZ0wokWmxQZ@unerlige-desk.amr.corp.intel.com>
References: <20250422193458.1467567-1-ashutosh.dixit@intel.com>
 <20250422193458.1467567-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250422193458.1467567-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:303:b4::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CO1PR11MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9457c5-617a-4945-7b1b-08dd89c4d28a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1JtSkkyNFdjSS8xUXh1NmpQMHFUKyt4YlR4eXJkMjJMZ1poODVtZVFFdFFZ?=
 =?utf-8?B?dk5lVFRaei9VcEF5bkNkVDlhVjNTUkFVZDhpUmVQcjJHOXdqdm9TN3RDWFlj?=
 =?utf-8?B?ak9PYWRwK0MvWFJUS1NGcTkzYm13Y2FzRC90Z1JFM3hNN1R6VWVDL3BrU0lN?=
 =?utf-8?B?WStEOGRzdzJrZldtQlFQRW1tYXVHaEJJdTUxK0JRM3B5M1k5L0lUZlJMU1lS?=
 =?utf-8?B?YWtTN1dYeWVNQ2VuQ2tEbURlSy91UlIvbXoyOGdqVVFFSTFaQ3dWdVRDb3Bo?=
 =?utf-8?B?T3UyTHZtZWUxd0hYMUQ5WnprdHA5RlRnK3ZDTG9jdmFiaVV1UThhcXd1L1NZ?=
 =?utf-8?B?SUY1bXBnSDNLKzV3YmpRRlNFc3FhaXVJdDFLeUFlejcycW02VXlPMHc5YUwr?=
 =?utf-8?B?YlBseTFtNFRaUzFVWnEzd0tDd1QxanN1TDVsRUNYM2tDL25jREtxWDRuWXhm?=
 =?utf-8?B?QXB5TXNSNzF5ekcxWDY2QnFIaktZY2dZc0NLU1lRZEJSR3d1Mmd1Q2tSZ05j?=
 =?utf-8?B?ZEJTUE9KSjdvRFc0VDBLQzRTaXQ0d3FiMGVSamJWaUo2cm94cW13VXVxTWJB?=
 =?utf-8?B?N2k4VW1BUDhzMk05VkFBRlFQWUloSHIreHV2NEJ1bmw2eVNOZEtjUWVVeGxn?=
 =?utf-8?B?aGhlSTF6ei9YSjMyVWFiSmhwanZPdnZtZ1dmQlJmcFZGL25XbXN1ZnVKNWdI?=
 =?utf-8?B?VW83MlJRdHM3OG1OcnFaa1BnUXErb1NXSVJtRUxBZDkxYTdBTXppbnBXR0xj?=
 =?utf-8?B?WGUzeWRZam5pclp2cmtQY3JKTGdDWTlONENUT3FWSnJLVjVUOFVnb3ZVakFr?=
 =?utf-8?B?UlpFM215bldUa2lpSzZuSEVseStZaTlVL1ZIYVNVWjd2ejZiM1BObkp2NnlU?=
 =?utf-8?B?ZnV4eVMvYVUwQkVCcnJPcXorMWZPUXZseW1MNVVqNkRSTmZpaWk2U2FGbTJG?=
 =?utf-8?B?c0FaME01NmN4ZU0vQUIxWWV5Y3BPbDJXeXR3Sm93eFRoZFRubEs5eVJuS2lm?=
 =?utf-8?B?S1V4eXgyU3ZSditpWVFDMUtDenpTU0FaT0NhTG9PZTF4Tlc4ZXkrOEN5QnRv?=
 =?utf-8?B?WmZXclA2c3YrN0p4TFJnNjBPT3BoSS82djh2enJCUURWcTFXMWRUUmJac2hM?=
 =?utf-8?B?Zi85UENmYnpDcDBIL0dzU0VWaG4xcXZuSWNxMXFSQXdnSGRCUVY1K2w5VjJq?=
 =?utf-8?B?Q0FzSmFQSjZ5empKTGpDeVBYUmRkWit0WmlCVnp3cWpKNWY1b3piYWd0Ykxo?=
 =?utf-8?B?eHNPdDNNV2h0L0xNSEg5QmZvaGhDMU40UWkzUEI2NmFqNWlwSlNlR0hUdCtV?=
 =?utf-8?B?VTh1TytFQS9zNU5xV1Vhek8rckU2MGE3azRqM0NkT1dNa0NBU1pLeGhSM29T?=
 =?utf-8?B?UXAwc3MydnZNY04ybWVnTEFhNDdGWVhLd0RrSEwvcmx2NEs0dGxVR091L1hk?=
 =?utf-8?B?NUhVWVZxVjlsSVVraHhjelFLbUkxUzhWWVI4NWJzc2NEaS9KYUU5VkpFZWoy?=
 =?utf-8?B?VDZIUGhEL3BFeEhCR1l2T0VObSs0TnkrajdLOXBRQmpqTDl5eEFKaWZxMHha?=
 =?utf-8?B?UmY1ZnBQak5wTjdDeG9PdTg0OVdqTDV5c0dWZGRjbDRldjJ3aEltOWRaUEpl?=
 =?utf-8?B?RG9PUjB0OHdnR245azlRVG5jQ3hXbXJWUnVudCtKTWg0QkFQN25ZVzZIOVA2?=
 =?utf-8?B?aUtEMHFTN29yY2xPa0ZMRFV4cHdiUC92S0xwLzJMUXAyK1lYbmRFMVRqQlNl?=
 =?utf-8?B?Tk1vQnl5RDZPcUhTTXJrVnVxdUFwdkJNZDd2L1VYYUE4UkRncDNJd2dPeXpW?=
 =?utf-8?B?YzFOQWdsMkIxSU9FOElBdWp5TGVPM3VxRVdERjVKMTgvRGEvNTBEZ2I3OHJp?=
 =?utf-8?B?UXdiSHpvbXYwOUVJQ3dQUks1UzV0TmRFWHgvckdpMmtZWjl5bEZGeHJac2lq?=
 =?utf-8?Q?eRqOK09cpTI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWJjNEdwNVprTWZZdU8yWEk0QkRXUmoxVHVSMjd1NkhpM0t6aWdsVmIzeDd5?=
 =?utf-8?B?TkNVNC9pa05nOXlxVGh2UDl3MUFkb3dwV3ZBdHF0Ykp4OEJiWGMrdjYwSVV2?=
 =?utf-8?B?VFJ3R3hrV2V4RVkrZDB3YVZ0ZW5GTDVBYU1xSFlEZ1RMZkUrNVZZdzFQTzI1?=
 =?utf-8?B?ckVoaXVnWWJleExCRDcvNVFhYTdqRXlZOTFVSG41VThHckJwSEZJSmJxTVA5?=
 =?utf-8?B?bm1WNjRENFBoOG1hd25iM2t3aitHUkV4M2dXMXBrTG9uVWRiZUFGTUtzRVJx?=
 =?utf-8?B?djJ4Z0l3ZXd5NUFXcEswcXliU0YxcDZDL0IwTi83Zm9seThtUEJ5U0xaWlRG?=
 =?utf-8?B?SGt6Z2RUVitaeUFHM0ZLMzYxNWVFeW9FblBsY25HeHI1SDFRM0daQTV6RklN?=
 =?utf-8?B?bnJKaFl1aXlJMjFTcEY0WWRoYzZncm1KeFBWMnAxM21SaDUvWkJnalVURHN3?=
 =?utf-8?B?SDh6WGZMTlBaNWNyWDBnRi9telk0eTRydUh2bUhpOWRTSmNNMis4VHZld3lL?=
 =?utf-8?B?VHZkTGN6SnpsQnE4cHU2dmhKQmtkalAwV3FnUlJoeklMWWs4K1NBMUNTVVhQ?=
 =?utf-8?B?d1J6ZTM4Tk1scTgvbDhjWEZXM01DVG9JUWg2NVphOGxNWlVPMi9iT2ZMYng1?=
 =?utf-8?B?eVFQdFZOYjhDU0VHaW1sNk5vUGhHOExNRCs2Q1pKYWorNDNzNFhxSVFZWUI3?=
 =?utf-8?B?Z01BaUVvQ2U1cnlYZ3VHVjRLQi9VZmVaOWxOU0FTZTdJcEphTVpwQWNldzJj?=
 =?utf-8?B?VEkrVFIrN3MrYkRrQVlHUmVGQzVxYm8zU29TSEJROEZ0RlVDYmE1SlFCNFNl?=
 =?utf-8?B?MmJaR2o0TTdlSGZYQ0ZTR3NpSHhlR1d4Wmkwc1JqRzc4N2NvWkZTRDR3S1NH?=
 =?utf-8?B?ZmZBenc1cGFJNHlCUWZaTXFvdlRJTUo3RXQ0YTdocFByRzZVL3ZxOS81OEY2?=
 =?utf-8?B?RlE1cXIzcmx2MDI1clFrcmdEcngzUlJ4bCtkd29RSm9acEtQREtUcG9nYitT?=
 =?utf-8?B?bHJWL1gzU1pmazNQOFhPcVFvTTlDU1ZnckV0M0JxM3phZUZlUFBlYjQwaTlv?=
 =?utf-8?B?RjlnZXJkQVdTNncwcVB6SFJGYmFjMmpMUGtOcmNMYys5Ui92c2doZkhnZVVn?=
 =?utf-8?B?bWtlbzVZaGttaEo5a1RtNGE0eVArbTV1MnFqMkVuMTdNWWNBbzVwRldONlB1?=
 =?utf-8?B?YmtaTU1kcnpqVFlxTzcwdWNMS3NjbEZpeDBhMm10cFFrb3YzUzlnUWtHTjI2?=
 =?utf-8?B?aWJmMElVOVRxUWxYQWpzUzdIS3ZMVGRKY2Z0Qm1ibDZ5cXVZa1kvRmNkSlZv?=
 =?utf-8?B?Q0JPVXdaVVE0RlV3c2JkdytPaGJmbnRWLy9PeEM4UnNVckNEbVJxOE9qTzdF?=
 =?utf-8?B?THBzTSs4Q0FSSFE1VnNjL2dpMlRnZGszbC9MaWtCVWljSFBrek5jc0FWeTQx?=
 =?utf-8?B?VFVBSFJJYUpERy9ScTFndmZsanM0Y1kzYXRRWVF6U285OXkvUnZpTFVFZzBO?=
 =?utf-8?B?aE56SU9VcDdMSUpJTC9MYkE1bTFjYzk4d0dEbTlOOUxuUk5iV0tOaXJmcWJY?=
 =?utf-8?B?dExHbW56MGluWDFLdENPQ2Z6VGcrN3dHR0VBTytNRGNaeW1YZExOR2haRW12?=
 =?utf-8?B?WFZJdVVmN1lyTU9wK2FBM2xrWENsbUZzQUFMNVIyUjBRRCt0blRhbi82OUNu?=
 =?utf-8?B?UHpTOUgrSkJlR3pScGhzSEJxblo2Y3p1Smg4RXU2Q0FPU2RDam00eXFFdU5W?=
 =?utf-8?B?YnBOY3VuSlNPUWRPUXBSNGswRGVSQ09pKytqNmpZMDdsbVBrUVdLSGtiZ3Fp?=
 =?utf-8?B?VFRtdEl1TjhXRjkvTVFiQjR4K3J6ZENXTkFIM1Ntem1PM1R6TUpOOTQzMngw?=
 =?utf-8?B?NkhPTEZTQ2VESUY0WVp5dUJESTZNZmRYemVXMXFLMC9qZFZrVkZCRHRHV3hK?=
 =?utf-8?B?b05nS3M0Z0RFT3RJaHFUblQydGszdHFuNkt5aFBXMTRwcUg1VmxVeUZIeEZO?=
 =?utf-8?B?VUF4b2ZwZTNmWUE4Q0hYYkhvS0tmR2tua2kvdHFkSGRQVzRxRzdTWkg3Rnlt?=
 =?utf-8?B?VW12aUYzQnZhY25iaFV1M1JQU1hqYXEyTFdJRHZ5dFFtRkRDU3dSaHV5cVJG?=
 =?utf-8?B?WVI0UnY1eVFsUHFxSkhNbnduWHBtOS8wckE3R1JxN1U3ZVFCaktRSy90Vkxj?=
 =?utf-8?Q?dZbYLNe3EkmemF059vQpjuY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9457c5-617a-4945-7b1b-08dd89c4d28a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 22:00:59.7739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fs9SNNFB2sc6XACPU/1zMExWVHRPZn8O+brFQHeRH2Zp0C9Rn9vIAdhB32bL81olA3K7Z8q8EqldzKmzy3C8qfecmAiKF9xi9cm64zhMuJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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

On Tue, Apr 22, 2025 at 12:34:55PM -0700, Ashutosh Dixit wrote:
>Implement sanity checking for Xe2 PEC OA reports. Previously there was
>sanity checking only for Xe1 OA reports, but no sanity checking for Xe2 PEC
>OA reports.
>
>v2: Use 'n = xecore_idx[i]' (Umesh)
>    Only check for default OA buffer size
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_oa.c | 127 +++++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 125 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index a774fc289d..07e15943ea 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -968,6 +968,117 @@ accumulator_print(struct accumulator *accumulator, const char *title)
> 		igt_debug("\tC%u = %"PRIu64"\n", i, deltas[idx++]);
> }
>
>+
>+/*
>+ * pec_sanity_check_reports() uses the following properties of the TestOa
>+ * metric set with the "576B_PEC64LL" or XE_OA_FORMAT_PEC64u64 format. See
>+ * e.g. lib/xe/oa-configs/oa-lnl.xml.
>+ *
>+ * If pec[] is the array of pec qwords following the report header (Bspec
>+ * 60942) then we have:
>+ *
>+ *	pec[2]  : test_event1_cycles
>+ *	pec[3]  : test_event1_cycles_xecore0
>+ *	pec[4]  : test_event1_cycles_xecore1
>+ *	pec[5]  : test_event1_cycles_xecore2
>+ *	pec[6]  : test_event1_cycles_xecore3
>+ *	pec[21] : test_event1_cycles_xecore4
>+ *	pec[22] : test_event1_cycles_xecore5
>+ *	pec[23] : test_event1_cycles_xecore6
>+ *	pec[24] : test_event1_cycles_xecore7
>+ *
>+ * test_event1_cycles_xecore* increment with every clock, so they increment
>+ * the same as gpu_ticks in report headers in successive reports. And
>+ * test_event1_cycles increment by 'gpu_ticks * num_xecores'.
>+ *
>+ * These equations are not exact due to fluctuations, but are precise when
>+ * averaged over long periods.
>+ */
>+static void pec_sanity_check_one(const u32 *report)
>+{
>+	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
>+	u64 first, *pec = (u64 *)(report + 8);
>+
>+	igt_debug("\ttest_event1_cycles: %#lx\n", pec[2]);
>+	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++)
>+		igt_debug("\ttest_event1_cycles_xecore %d: %#lx\n", i, pec[xecore_idx[i]]);
>+
>+	/* Compare against the first non-zero test_event1_cycles_xecore* */
>+	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
>+		first = pec[xecore_idx[i]];
>+		if (first)
>+			break;
>+	}
>+
>+	/* test_event1_cycles_xecore* should be within an epsilon of each other */
>+	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
>+		int n = xecore_idx[i];
>+
>+		igt_debug("n %d: pec[n] %#lx, first %#lx\n", n, pec[n], first);
>+		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
>+		if (pec[n])
>+			assert_within_epsilon(pec[n], first, 0.1);
>+	}
>+
>+	igt_debug("first * num_xecores: %#lx, pec[2] %#lx\n",
>+		  first * intel_xe_perf->devinfo.n_eu_sub_slices, pec[2]);
>+	/* test_event1_cycles should be close to (test_event1_cycles_xecore* * num_xecores) */
>+	assert_within_epsilon(first * intel_xe_perf->devinfo.n_eu_sub_slices, pec[2], 0.1);
>+}
>+
>+static void pec_sanity_check_two(const u32 *report0, const u32 *report1,
>+				 struct intel_xe_perf_metric_set *set)
>+{
>+	u64 tick_delta = oa_tick_delta(report1, report0, set->perf_oa_format);
>+	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
>+	u64 *pec0 = (u64 *)(report0 + 8);
>+	u64 *pec1 = (u64 *)(report1 + 8);
>+
>+	igt_debug("tick delta = %#lx\n", tick_delta);
>+
>+	/* Difference in test_event1_cycles_xecore* values should be close to tick_delta */
>+	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
>+		int n = xecore_idx[i];
>+
>+		igt_debug("n %d: pec1[n] - pec0[n] %#lx, tick delta %#lx\n",
>+			  n, pec1[n] - pec0[n], tick_delta);
>+		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
>+		if (pec1[n] && pec0[n])
>+			assert_within_epsilon(pec1[n] - pec0[n], tick_delta, 0.1);
>+		/* Same test_event1_cycles_xecore* should be present in all reports */
>+		if (pec1[n])
>+			igt_assert(pec0[n]);
>+	}
>+
>+	igt_debug("pec1[2] - pec0[2] %#lx, tick_delta * num_xecores: %#lx\n",
>+		  pec1[2] - pec0[2], tick_delta * intel_xe_perf->devinfo.n_eu_sub_slices);
>+	/* Difference in test_event1_cycles should be close to (tick_delta * num_xecores) */
>+	assert_within_epsilon(pec1[2] - pec0[2],
>+			      tick_delta * intel_xe_perf->devinfo.n_eu_sub_slices, 0.1);
>+}
>+
>+/* Sanity check Xe2+ PEC reports. Note: report format must be @set->perf_oa_format */
>+static void pec_sanity_check_reports(const u32 *report0, const u32 *report1,
>+				     struct intel_xe_perf_metric_set *set)
>+{
>+	if (igt_run_in_simulation() || intel_graphics_ver(devid) < IP_VER(20, 0)) {
>+		igt_debug("%s: Skip checking PEC reports in simulation or Xe1\n", __func__);
>+		return;
>+	}
>+
>+	if (strcmp(set->name, "TestOa")) {
>+		igt_debug("%s: Can't check reports for metric set %s\n", __func__, set->name);
>+		return;
>+	}
>+
>+	dump_report(report0, set->perf_raw_size, "pec_report0");
>+	dump_report(report1, set->perf_raw_size, "pec_report1");
>+
>+	pec_sanity_check_one(report0);
>+	pec_sanity_check_one(report1);
>+	pec_sanity_check_two(report0, report1, set);
>+}
>+
> /* The TestOa metric set is designed so */
> static void
> sanity_check_reports(const uint32_t *oa_report0, const uint32_t *oa_report1,
>@@ -1591,6 +1702,9 @@ static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
>
> 		print_reports(oa_report0, oa_report1, i);
> 		sanity_check_reports(oa_report0, oa_report1, i);
>+
>+		if (i == metric_set(hwe)->perf_oa_format)
>+			pec_sanity_check_reports(oa_report0, oa_report1, metric_set(hwe));
> 	}
> }
>
>@@ -2531,8 +2645,14 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
>
> 		igt_assert_neq(reason, 0);
>
>-		if (last_report)
>+		/*
>+		 * Only check for default OA buffer size, since non-default
>+		 * sizes can drop reports due to buffer overrun.
>+		 */
>+		if (!oa_buffer_size && last_report) {
> 			sanity_check_reports(last_report, report, fmt);
>+			pec_sanity_check_reports(last_report, report, metric_set(hwe));
>+		}
>
> 		last_report = report;
> 	}
>@@ -4275,9 +4395,12 @@ static void mmap_check_reports(void *oa_vaddr, uint32_t oa_size,
> 			continue;
>
> 		timer_reports++;
>-		if (timer_reports >= 3)
>+		if (timer_reports >= 3) {
> 			sanity_check_reports(reports - 2 * report_words,
> 					     reports - report_words, fmt);
>+			pec_sanity_check_reports(reports - 2 * report_words,
>+						 reports - report_words, metric_set(hwe));
>+		}
> 	}
>
> 	igt_assert(timer_reports >= 3);
>-- 
>2.48.1
>
