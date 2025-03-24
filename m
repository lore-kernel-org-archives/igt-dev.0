Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68E0C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 17:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B5910E4A4;
	Mon, 24 Mar 2025 17:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8DfRhLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC58E10E4A5
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742837156; x=1774373156;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WtSU8JbXiYtgBBUGRYgzFhkNezb2kw9tBUDwN+XCwzY=;
 b=Q8DfRhLngEPts6uPPIh/oTCP7gbV0M3rS9iWOkSCLSBsvLEcRo9eYtwS
 /FJvuiMWtSbrTolyKAqWpMX7QNPYWgSEkNAae+zFBHKG1vhduVyqESWsk
 NXaS5N3KqfstVQHcw79gDBpGUnqJ8uIlYMt6pZqOc2q/z62vQsQ8hU2xk
 C1DJIT3E+JAy4vMvQSEk9QNEvoaXv63nEmwLppl3OIKwtrhylSl2qj/nq
 FDdEt7duW1bIMfaa1/qb7KC+qUCdc9n3q+jenNsVp5qCQkapp6Mm12wCD
 DWO0WZe9qA+KPCoyswTQSBnhVngdsAyN2Be/PY2kc98PfrKo3fdqE7j/O w==;
X-CSE-ConnectionGUID: jKLR3QtMS6KZ/1HsEbQGIQ==
X-CSE-MsgGUID: dYt/nh+yQVyBLDoYYnCmlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55052692"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="55052692"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 10:25:55 -0700
X-CSE-ConnectionGUID: MG70jwS4RIC0nhfFrnGG0Q==
X-CSE-MsgGUID: +mzKMq5ATayhF0ufA+ea4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="155026129"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 10:25:55 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 24 Mar 2025 10:25:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Mar 2025 10:25:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 10:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZiAFHYUJaMi+2gvArFxkxMR5zbxS4IbXoEHBxPSUT9lp9TMxZGSTsT6Qb0UtAc27fztbKJfqcRglOdZ/DZJrBsWg6UQ+ayPCKMW0cVjv8NTi3lMvEsRnp+6aPZdGKtpqSjW8UkCOC4lM3/E6/e6YxAbMhSIjWQxvXRpGo585XPQUOD4bTwOllKmFwCDv1T+EIezRuYoMqs8KwWDrKw+nYHSEFo8BmP/iVHp4U7qMXYoZAORv7vD4rHonBHccunN7/qFpEnr+zFhoRimnx4XnceyYF9kuGgmwv/3pRyZlJYRYXQ6fe0xMAJD1CgWe/CsLTjUkgFW68iFidXde+vGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYRjqXUWZiINl3trbZK7UUcnPgU+evdOOor63lAsr3k=;
 b=vMghxQzARTdCdhaAjizFTEHv+z0Ydb56bXiDE1n5eKLYXkypbdQBh3JV1ukMi0+yw5fns0x1so6nPFP72C8oEkmk5XBvVzIL3UYduRCWCtPdkC+gtEwY9EGrk1BRfZeYKKgZWS6Lqt9ehs6O0vJx8RsarfW7cbQM6u5Szxzln8ypwSMjZvgN6jFUiZi6GKqLa8Jd7rrK23J+Mrrs0Jzchl5XJQj7cewixW1P60tWBM7t1qT23iXuSY38q7NmWmgLZG4+QNdgVeQhSi5ErUmhCFxrgpJpdPMEsX3w4SV3oRFXcX+ynoIXm62pj1wacQghbA7qRaLyPYlZEWxZTxqHbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 17:25:38 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 17:25:38 +0000
Date: Mon, 24 Mar 2025 10:25:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t v3 2/3] tests/intel/xe_pmu: Add engine activity
 test for all functions
Message-ID: <Z+GVjdX7xWAdq0cw@soc-5CG1426VCC.clients.intel.com>
References: <20250321110958.3557106-1-riana.tauro@intel.com>
 <20250321110958.3557106-3-riana.tauro@intel.com>
 <Z93P87YG8/Naifh2@soc-5CG1426VCC.clients.intel.com>
 <4143dc74-31bf-4e32-9346-ede15aeadb13@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4143dc74-31bf-4e32-9346-ede15aeadb13@intel.com>
X-ClientProxiedBy: MW4P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 2026936c-72ba-4fd7-8400-08dd6af8e513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YW1zRXlxYXY0UW9aWWc1L3VGeGdwQmJnOTNpai9CNnhrUjRPRG45ZWM3bGZC?=
 =?utf-8?B?VHNGK043RFNoZytIdzBsMUJONWQ2NU5HL1pCSGFkcXZFNFZZd3NSMzB5OWgr?=
 =?utf-8?B?bEt5dlI0eDJYVGl6a0lDY0E5VmN3SHQ0M0oybEVLUVlsRGFDNTNOdzJpUnlr?=
 =?utf-8?B?ZW0yZlBHaFA4WHBiL01lNHk2VkkyN1pST1RCdGFuZUltYXBXeWpPZWVpWith?=
 =?utf-8?B?UFNiNk92U0JFc0ppYlIyUm5sdXRDUThGejlUS2NZQkorL2ZKaUhzTXY5bGFS?=
 =?utf-8?B?WDVzS0U3S1E5ZldacG4zZ2MwWFV4dXk0SlA1S3ZPTGo4aklkd3dlYkJSaC9X?=
 =?utf-8?B?RW8rYTNVL0wxUmVPaWNNU1hZTHp6NWZtcU8zOFVYS2FuOGplVGhkUCt4SVgy?=
 =?utf-8?B?QTVsbXZuZWNocTg1WHFhMkQ5aEpuSFBraWJHeEVUUXFTN25CQ0R4aFZ4elBU?=
 =?utf-8?B?L01nRmRXc2xucHh0V2YxRUZQWDBDcWkxak5temxCdHY3cjliR1VlbUVNWHJB?=
 =?utf-8?B?QkVaK0FhSFlpMkNITXp2SG9OclRiNmdiWEduYzdtMTI3N3ZNNTNsbmdNMzFh?=
 =?utf-8?B?eDVhQ0NyMTBmWnRvQXl4RmlZK1N3a2Yxd3hnOWRWWFhocjNzeUhydk9VeGda?=
 =?utf-8?B?cGE2S2c5SnMxSkt6YzFUWno2N3dZSUV2aEZmZmxKYnJGbFhzK2dWYTYvVkhh?=
 =?utf-8?B?OWwyYjg5eHJFbzBGZXF6ckhBRkNMbG94UmpQR3UyUUFhZ21xYVJZRW5vMjg4?=
 =?utf-8?B?MUFRN04yaksxeXcvTHk4WitZSnRPYzNHdmhaUmQ1VklvSlgyUE1aTm1weWRo?=
 =?utf-8?B?WVM3Rmd3ZHdIUkRxV3NvalJ5SEF6L2xpY2s3bGt6b3lEL0R1Z2FIc3F0VVNT?=
 =?utf-8?B?NXdLckpLVTlwK3NEOHYxQUVvUURiM0VJTXQ0cHY1bzJUSnJsejZYMm1Jemxl?=
 =?utf-8?B?UmZpNHUxbTA1ZGdUaDgyWHV2N21sbDVFOWh2aHBUN2dkVlRLT1ZFcUxnU0FK?=
 =?utf-8?B?dGFEUXJWYjJ2NWJsNVh5bGU4WHZvbHQ0UDBuUkhkYnFJSE5rMGtjUktoOGFT?=
 =?utf-8?B?UGtCRUpsRDhSOENHRTZSZUh2TXY1T2lzdmNNOEEwdjBTbEFkcTJLdHN5WGZW?=
 =?utf-8?B?WGoyZVpnMnJreWJCNmlua3I5SDVVQkh2VUhINEpYcncySlVNYXFFUDVZem5s?=
 =?utf-8?B?VkhTaXZZYnZZTDRxOE9BOVNNVHRhbWZIc0VpSDgwWmlhMlMxUHUxYjh3Z3Ba?=
 =?utf-8?B?RzhQRzNEY2JHanBFNFpmQjlqbmRRK1Y3SUhhT1NqdmhQblVGa3JWc3ZZeGxn?=
 =?utf-8?B?dUJsd2VWZ3RUNTBRL2VpL0JzdnNtYjZNVUpHN0Q4S3AzcHdZYnE5djZCK2Y0?=
 =?utf-8?B?MmdxNDFjMGVEdHQxUzEzekxGeW5iQ0M2KzdlWmNwNzhmeTRTN3dRbXorV2dT?=
 =?utf-8?B?KzVOeUVBR3hLeXdZZFpBRktIUEJ2S3UxS21MbExrUW9jRjE5bVJyV09MT3dQ?=
 =?utf-8?B?WUVkeWcwanJnMVkxL0NkS1RGYk5EM3RJdWpCSWxnQ3BVWDRnbWwzT1FEOGFJ?=
 =?utf-8?B?OWE3UTJMa1ltQWNDTnUzV0pjc3VweGt4UjJCUWxJeWp5Q3ltZlFSZ3NiZUxG?=
 =?utf-8?B?VlpGSDY4UERBcGlzcmdqZWJ1THdpczloSVJsK0V5RTBtUnp1T0c0TTNDMmpE?=
 =?utf-8?B?Zk52ZW1TQkt2eUdGdll5Q3lUVGl0RllkNmF4aklKRm9oaG5hQVdxaXV3aWpl?=
 =?utf-8?B?RnIwVHRjYm9senc4dkVteHEwWjVFUjA0dExxVUU1KzViWnVRdEozTTJwUmNZ?=
 =?utf-8?B?ZDhVMlhpb1JCdDBFYzZvL0dwVS94YmtCWGVKTzVDNTBNMFh4Y1RwQnh0WmJo?=
 =?utf-8?Q?odLgWwEqu2Pvh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzVOeWpIN1pDcnR5V05KM1J6NFMvdC9LNVJORmRING03TVBURUQ1enhJNHA4?=
 =?utf-8?B?L3Fsb0ppdE9MNUVXR2ZldnlYMGFYR0FJZytCWk1TMEZWWVpOSkpXM2JLbStJ?=
 =?utf-8?B?Mk04ZmpQV3QrdWpnMXQyNXVvT2F2bGxGMmlweHNqUkpqR1pQV3BFTUJ6S2F3?=
 =?utf-8?B?MWUyTHZzbk1vbTFKZmFPbzRvcUpQU2w1N2dGQUd6dHdnZEs4NHB1YnVudUFz?=
 =?utf-8?B?MDdqVTFtVUpLRnpxSk92a2Z4dnJRZlpqa2U0aSswRGJUU0FNL3FoZDNGVFgw?=
 =?utf-8?B?anpVT3IxTlRsemxmR3hMYWFTWTdudkpzRVpiMXp1QUduaDVvRFhFNWRMSE5w?=
 =?utf-8?B?a0pIcjdaU24wYzVwTGhpZG1hblhWcDk1L0NSR3BvakZCdDFwK2ZnREYvaWFL?=
 =?utf-8?B?b2JPOFpMYXZvTHNLeXVxcGF1S1dEaUFwbnAyQzg2eG5QRmIxRXdkNGhGZm9X?=
 =?utf-8?B?V0tKWHp5Yk5IZHlOeUEzZk5RYXF2K2dveXBFZkNTVGFjS21PNlJaRHdVcHp4?=
 =?utf-8?B?SzZxQ3pEYm5HMlJNWjQ2VVY2UFJ1cy91WmxSVWVJcU5ZQlp5cVNXUXVVQTFu?=
 =?utf-8?B?S2tHOE5YbzJtSmVoSE5Md1pVY1N0dUJqeEdKUGI2MEpiY3lHbjBpRk5Db0Va?=
 =?utf-8?B?YlcxYkJkbEJVV0RRYXZzRklaSDEzWXZOWXFTckg4QW1DaHJrRUk1bVNpQi9R?=
 =?utf-8?B?emZ1NXMvellsSVBQNDFweVdKOW54MnZqUncxanI2RzU3Q3NyM2x0cTZZMHRO?=
 =?utf-8?B?SzRlWGw5bjVsWEpweVRTb3h5bkhvK3N2MFVGMXdBYWxyUFJTV1ZaRm1Kd2JL?=
 =?utf-8?B?NGhsZlQzcDh0NFFOenh5bmpRcHY2NDNYMGZFb25rZVRXSi9ocldJSUdZZkls?=
 =?utf-8?B?TG41Q3lvWDFSTjFHU3VONVR3WDNnVE52M0N1eUdlbDdhSjFUeERwaXM1cStv?=
 =?utf-8?B?NUhtUml6SllpdmpMT3lUQ2sxSUV5eGZDT1RyRmxCbUZOSkNLdXhkTC9NazZt?=
 =?utf-8?B?Qm4yOWhpVGRNMXJmRGNIYUpTclpZVzNzN1RKUWRNNlBCV2tkZzYxM3NSZkMz?=
 =?utf-8?B?OWkxZTlrSEhHcXYzT3pCVVd6QTE5cEFUV0Ntb0ltLzNnQ1JQZXhURmJhdndU?=
 =?utf-8?B?MXcvcGNEbkQzOGsrMFBYYTBRZExwcUdzNXlxTWJtbnVVUUR2Rjd3RHd4SnhZ?=
 =?utf-8?B?UW5KUHNKTnlzU3ZvTkRRSTdQQmdwenR3UGErMUJuOXRHVjJaRlorclpaN1B0?=
 =?utf-8?B?dU9zbG82dDdvOG95L3lNREc2SE5KS1lyMTQvc2ZscjdFeHFETU5LN3JNb2NQ?=
 =?utf-8?B?cVppNWRzOE5PcW52SEdQT0wxNCtKLzgvTkE3ZDdQck0xOHFJcWxIRlVIeWdi?=
 =?utf-8?B?TWt0UUFsRXB0VCtUUU9KT1RHU2srN2VZdzdrZkYvRDl2aWwvb1JxeFpDTktj?=
 =?utf-8?B?UkdnaUxnelBicFNJRUJWdUFmOXI3R3ZyRTlMR0J4WFBjdTViVWM4M0h3Qkgv?=
 =?utf-8?B?RzVwQ21mbktoR3hCL3FYUVFqYU9yZUVxTC8vQXpUYWFmWU42d214TGlUZjB2?=
 =?utf-8?B?SzdIRWRQRVYyMjRNaVgzblVPK3hZUUJ0WngrL0Q1QmhNbE5mejlYMytlVDV3?=
 =?utf-8?B?TUR3UjU3ZlZYTmhBWjQ2dDFCYStpVFBoaU8xcndnd3lTby9HbFZUbWtJMUVJ?=
 =?utf-8?B?T3ZpK3dyRlQxUUc4ZUZrMFd0V09mUUZLd05ucDZaSXJMVWZySGJXYUhWcHBN?=
 =?utf-8?B?R1RGSVdXUlFha3UzbysrQ2p6d0ErY3dydFU3bkp2NXJsVjRlWWs5UHVHbjdk?=
 =?utf-8?B?ckNlMStRNFZXdVlKdzZOOTltYldISVdQWVkzV2h6NnNNZ0NTWk5CV0RiRFJz?=
 =?utf-8?B?aTRMSkpQZHpvZHVLV0dJZCt0NFFQcE9mUFVqS0UxSW15RGR0ZXlSdWZDbWZo?=
 =?utf-8?B?Unc5YzEyV0JYdS9hT2lYVkxFam1IV0lhV0RIYzBpWTBDQUhiUEdJRkRPQU9S?=
 =?utf-8?B?elZENEZIbHlRZ0J6anFQeGpkTG9xdUtEcTg3TUFKU1JxTXMyVmJEcmNTM2t3?=
 =?utf-8?B?WkVwbWxLSGpMUmJ3blphcmRqdFVWdm1HMDVTR2JwR2dWTFh1THhyV1lKS3pD?=
 =?utf-8?B?VVF5aTJzOURQYWU1Wk9pU2htL05VUW1nak5VRmM0RUJsRHI5bHJseXBadXZQ?=
 =?utf-8?Q?mwgu4r8r2AX76aj/Y00YLN8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2026936c-72ba-4fd7-8400-08dd6af8e513
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 17:25:38.5785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNRLC6cMDKjqoaW/7iBrwM5jZE5fiMiOroLNSzgUQOi1UIoLsopiYhIFDj02LtuFEqbisgZVyPtWn6yf5VSgKy1smP/g/3+nvwv9Hjvcs68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
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

On Mon, Mar 24, 2025 at 10:54:33AM +0530, Riana Tauro wrote:
>Hi Umesh
>
>On 3/22/2025 2:15 AM, Umesh Nerlige Ramappa wrote:
>>On Fri, Mar 21, 2025 at 04:39:57PM +0530, Riana Tauro wrote:
>>>Provision and enable 2 VFs with execution quantum and scheduling policy
>>>set. Add a test that runs workload on all functions simultaneously and
>>>validates that all engines are equally and fully loaded for the
>>>entire execution quantum of the function
>>>
>>>v2: add a different function for function config
>>>   add function details to log
>>>   move pmu_fd to struct
>>>   enable and provision VF's (Umesh)
>>>
>>>v3: split patches
>>>   move exec_quantum to variables
>>>   skip test if vfs are already provisioned
>>>   fix assert (Umesh)
>>>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>---
>>>tests/intel/xe_pmu.c | 129 +++++++++++++++++++++++++++++++++++++++++++
>>>1 file changed, 129 insertions(+)
>>>
>>>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>>>index f0959abe2..9a1f9b39e 100644
>>>--- a/tests/intel/xe_pmu.c
>>>+++ b/tests/intel/xe_pmu.c
>>>@@ -14,11 +14,13 @@
>>>
>>>#include "igt.h"
>>>#include "igt_perf.h"
>>>+#include "igt_sriov_device.h"
>>>#include "igt_sysfs.h"
>>>
>>>#include "xe/xe_gt.h"
>>>#include "xe/xe_ioctl.h"
>>>#include "xe/xe_spin.h"
>>>+#include "xe/xe_sriov_provisioning.h"
>>>
>>>#define SLEEP_DURATION 2 /* in seconds */
>>>/* flag masks */
>>>@@ -124,6 +126,12 @@ static uint64_t get_event_config(unsigned int 
>>>gt, struct drm_xe_engine_class_ins
>>>    return pmu_config;
>>>}
>>>
>>>+static uint64_t get_event_config_fn(unsigned int gt, int function,
>>>+                    struct drm_xe_engine_class_instance *eci, 
>>>const char *event)
>>>+{
>>>+    return get_event_config(gt, eci, event) | 
>>>add_format_config("function", function);
>>>+}
>>>+
>>>/**
>>> * SUBTEST: engine-activity-idle
>>> * Description: Test to validate engine activity shows no load when idle
>>>@@ -187,6 +195,73 @@ static void engine_activity(int fd, struct 
>>>drm_xe_engine_class_instance *eci, un
>>>        igt_assert(!engine_active_ticks);
>>>}
>>>
>>>+/**
>>>+ * SUBTEST: all-fn-engine-activity-load
>>>+ * Description: Test to validate engine activity by running load 
>>>on all functions simultaneously
>>>+ */
>>>+static void engine_activity_all_fn(int fd, struct 
>>>drm_xe_engine_class_instance *eci, int num_fns)
>>>+{
>>>+    uint64_t config, engine_active_ticks, engine_total_ticks;
>>>+    uint64_t after[2 * num_fns], before[2 * num_fns];
>>>+    struct pmu_function {
>>>+        struct xe_cork *cork;
>>>+        uint32_t vm;
>>>+        uint64_t pmu_fd[2];
>>>+        int fd;
>>>+    } fn[num_fns];
>>>+    int i;
>>>+
>>>+    fn[0].pmu_fd[0] = -1;
>>>+    for (i = 0; i < num_fns; i++) {
>>
>>nit:
>>In the for loops,
>>struct pmu_function *f = &fn[i];
>>and then you can use f-> below instead of fn[i].
>will add this>
>>>+        config = get_event_config_fn(eci->gt_id, i, eci, "engine- 
>>>active-ticks");
>>>+        fn[i].pmu_fd[0] = open_group(fd, config, fn[0].pmu_fd[0]);
>>>+
>>>+        config = get_event_config_fn(eci->gt_id, i, eci, "engine- 
>>>total-ticks");
>>>+        fn[i].pmu_fd[1] = open_group(fd, config, fn[0].pmu_fd[0]);
>>>+
>>>+        if (i > 0)
>>>+            fn[i].fd = igt_sriov_open_vf_drm_device(fd, i);
>>>+        else
>>>+            fn[i].fd = fd;
>>>+
>>>+        igt_assert_fd(fn[i].fd);
>>>+
>>>+        fn[i].vm = xe_vm_create(fn[i].fd, 0, 0);
>>>+        fn[i].cork = xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 1);
>>>+        xe_cork_sync_start(fn[i].fd, fn[i].cork);
>>>+    }
>>>+
>>>+    pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, before);
>>>+    usleep(SLEEP_DURATION * USEC_PER_SEC);
>>>+    pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, after);
>>>+
>>>+    for (i = 0; i < num_fns; i++) {
>>>+        int idx = i * 2;
>>>+
>>>+        xe_cork_sync_end(fn[i].fd, fn[i].cork);
>>>+        engine_active_ticks = after[idx] - before[idx];
>>>+        engine_total_ticks = after[idx + 1] - before[idx + 1];
>>>+
>>>+        igt_debug("[%d] Engine active ticks: after %ld, before 
>>>%ld delta %ld\n", i,
>>>+              after[idx], before[idx], engine_active_ticks);
>>>+        igt_debug("[%d] Engine total ticks: after %ld, before %ld 
>>>delta %ld\n", i,
>>>+              after[idx + 1], before[idx + 1], engine_total_ticks);
>>>+
>>>+        if (fn[i].cork)
>>>+            xe_cork_destroy(fn[i].fd, fn[i].cork);
>>>+
>>>+        xe_vm_destroy(fn[i].fd, fn[i].vm);
>>>+
>>>+        close(fn[i].pmu_fd[0]);
>>>+        close(fn[i].pmu_fd[1]);
>>>+
>>>+        if (i > 0)
>>>+            close(fn[i].fd);
>>>+
>>>+        assert_within_epsilon(engine_active_ticks, 
>>>engine_total_ticks, tolerance);
>>>+    }
>>>+}
>>>+
>>>/**
>>> * SUBTEST: gt-c6-idle
>>> * Description: Basic residency test to validate idle residency
>>>@@ -225,6 +300,33 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>>>    close(pmu_fd);
>>>}
>>>
>>>+static unsigned int enable_and_provision_vfs(int fd)
>>>+{
>>>+    unsigned int gt, num_vfs;
>>>+    int pf_exec_quantum = 64, vf_exec_quantum = 32, vf;
>>>+
>>>+    /* Enable VF's */
>>>+    igt_sriov_disable_driver_autoprobe(fd);
>>>+    igt_sriov_enable_vfs(fd, 2);
>>>+    num_vfs = igt_sriov_get_enabled_vfs(fd);
>>>+    igt_require(num_vfs == 2);
>>>+
>>>+    /* Set 32ms for VF execution quantum and 64ms for PF 
>>>execution quantum */
>>>+    xe_for_each_gt(fd, gt) {
>>>+        xe_sriov_set_sched_if_idle(fd, gt, 0);
>>
>>Looking at patch 3, for the new test, the sched if idle is set to 
>>true after binding the VFs. That's a slightly different use case 
>>compared to the sched_if_idle = false case where vfs are bound 
>>later.
>>
>Even if sched if idle is set after vfs are bound, test is working as 
>expected. And the test which runs simulatenously on all engines 
>doesn't require the sched-if-idle case as there is no difference wrt 
>to scheduling policy
>
>So added it only for one and set it after provisioning
>
>>I was imagining that the provisioning would be separate for the 2 tests
>>that depend on sched_if_idle. Each test (with different provisioning 
>>params)
>>may need to provision the VFs separately.
>>
>>More details in the next comment.
>>
>>>+        for (int fn = 0; fn <= num_vfs; fn++)
>>>+            xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? 
>>>vf_exec_quantum :
>>>+                             pf_exec_quantum);
>>>+    }
>>>+
>>>+    /* probe VFs */
>>>+    igt_sriov_enable_driver_autoprobe(fd);
>>>+    for (vf = 1; vf <= num_vfs; vf++)
>>>+        igt_sriov_bind_vf_drm_driver(fd, vf);
>>>+
>>>+    return num_vfs;
>>>+}
>>>+
>>>igt_main
>>>{
>>>    int fd, gt;
>>>@@ -254,6 +356,33 @@ igt_main
>>>    test_each_engine("engine-activity-load", fd, eci)
>>>        engine_activity(fd, eci, TEST_LOAD);
>>>
>>>+    igt_subtest_group {
>>>+        bool autoprobe;
>>>+        unsigned int num_fns;
>>>+
>>>+        igt_fixture {
>>>+            igt_require(igt_sriov_is_pf(fd));
>>>+            igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
>>>+            autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
>>>+            num_fns = enable_and_provision_vfs(fd) + 1;
>>
>>0) Move the igt_require lines and autoprobe line to
>>enable_and_provision_vfs(). Maybe autoprobe can be global.
>>
>Will add this> 1) the enable_and_provision_vfs can take params - 
>num_vfs, pf_quanta,
>>vf_quanta and sched_if_idle.
>>
>>2) Since we just want to modify the sched_if_idle param, we could have 2
>>subtest groups.The subtest fixture runs for every non-sriov test from the file in CI.
>So even if i run the native subtest, all the provisioning and 
>disabling VF's will run on sriov supported machines.

ok, I guess the fixtures will run in all subtest groups. That's messy.  
Also, since this is passing, I guess the order of enabling sched_if_idle 
is not critical. You can leave it as is then. This is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh


>
>Will check what difference will it be if we set sched-if-idle after 
>enabling.
>
>Thanks
>Riana>
>>>+        }
>>>+
>>>+        igt_describe("Validate engine activity on all functions");
>>>+        test_each_engine("all-fn-engine-activity-load", fd, eci)
>>>+            engine_activity_all_fn(fd, eci, num_fns);
>>>+
>>>+        igt_fixture {
>>>+            igt_sriov_disable_vfs(fd);
>>>+            /* abort to avoid execution of next tests with 
>>>enabled VFs */
>>>+            igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
>>>+                       "Failed to disable VF(s)");
>>>+            autoprobe ? igt_sriov_enable_driver_autoprobe(fd) :
>>>+                    igt_sriov_disable_driver_autoprobe(fd);
>>>+            igt_abort_on_f(autoprobe != 
>>>igt_sriov_is_driver_autoprobe_enabled(fd),
>>>+                       "Failed to restore sriov_drivers_autoprobe 
>>>value\n");
>>
>>everything in this fixture could just be part of a helper, for 
>>example - disable_provisioned_vfs()
>>I imagine things would look like this:
>>
>>igt_subtest_group { /* sched_if_idle = 0 */
>>     unsigned int num_fns;
>>
>>     igt_fixture num_fns = enable_and_provision_vfs(... sched_if_idle = 0);
>>
>>     igt_describe("Validate engine activity on all functions");
>>     test_each_engine("all-fn-engine-activity-load", fd, eci)
>>         engine_activity_all_fn(fd, eci, num_fns);
>>
>>     igt_describe("Validate per-function engine activity");
>>     test_each_engine("fn-engine-activity-load", fd, eci)
>>         for (int fn = 0; fn < num_fns; fn++)
>>             engine_activity_fn(fd, eci, fn);
>>
>>     igt_fixture disable_provisioned_vfs(...);
>>}
>>
>>igt_subtest_group { /* sched_if_idle = 1 */
>>     unsigned int num_fns;
>>
>>     igt_fixture num_fns = enable_and_provision_vfs(... sched_if_idle = 1);
>>
>>     igt_describe("Validate per-function engine activity when 
>>sched-if- idle is set");
>>     test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
>>         for (int fn = 0; fn < num_fns; fn++)
>>             engine_activity_fn(fd, eci, fn);
>>
>>     igt_fixture disable_provisioned_vfs(...);
>>}
>>
>>Optionally, you could have the 
>>all-fn-engine-activity-load-sched-if-idle in the
>>second group as well.
>>
>>Thanks,
>>Umesh
>>
>>>+        }
>>>+    }
>>>+
>>>    igt_fixture {
>>>        close(fd);
>>>    }
>>>-- 
>>>2.47.1
>>>
>
