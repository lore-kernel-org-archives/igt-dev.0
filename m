Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A88D0BB63
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 06:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6B610E20D;
	Thu, 24 Oct 2024 06:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNc//Ieq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F051210E20D
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 06:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729751724; x=1761287724;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=01UCDo3jAtbgEQ6HbhGmLNcgzq+FnOTCjWE1JYtRAtY=;
 b=FNc//IeqRJ7JKmNvKZVFRCPJhmDScXCwXS621HI6rk7bzQX+2ldb+IEV
 6lnAZo30c/bNYZuDM1kuvv/RRUu7QPDxVveIO6CxV0Xw05JJuRgC3W+8u
 +JNDiR4WW/ldPnLdZ4kbMg3yNDnNKlkB0PQzvlWeoeSns34VPyYI5GRvb
 0zNGHpGJfxRzkzClvP2iN/dWFzL5zCszsG1i9SrjiqEXhNPDHJrVXqcsO
 ty4RrYU529Zqp5lZciWayG+6ztjxOOEK1Qn7EVIKD8ib4QM4Mi3HrtdMs
 JC/VK8aaRn2gTsBITDLmtV3lbmidE65gYJrs322lnJgTa0lv39RTVtS1o Q==;
X-CSE-ConnectionGUID: A2bblv9IQqCy76LDfsZMfQ==
X-CSE-MsgGUID: ooqDjY05Q4GDDvIgrevQKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29491994"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29491994"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 23:35:24 -0700
X-CSE-ConnectionGUID: qUELl7wfSmOapWmomd7Gkw==
X-CSE-MsgGUID: OVddmeVnRx2Y4wwzAcO+FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80670170"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 23:35:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 23:35:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 23:35:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 23:35:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaQYVF7VqMp2EkuCrr9H9lUUuIiQHUFrQ4tegsiucdobttJYnKNYakp/7bQ4Vv0BH6ScEUlQMIipdjAZvtFHF/ROftDLiMWnQo+n/E0ovjbYBkYpZSTGA9WOgT+uskV/NT+gQP3MiBjMXMLUlnj3Ib2TISYfPZgjAef6vYiiyOo30plffqhmuVUzrzrN2vTwYFsme+t6ajRiVRblSfevfNDDTdc7LAhJuAeBjW6YEeuE78GvkDT2g0XQrpJDoG6zQpDCZ28upmUjeJSNfUBMYRXY2h6PDD/YynVTWvqu1ppi3QnGqmAA0CXpEe0YmOcNchDQijKy3SRyUJAM8g8izA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6qCsFT14NT0QwZlJwFG0RvLCiiU5TF42nHJF/kDFrM=;
 b=WjOcR8KcNzv3ixdPsLK1S0A005rUbM0duFu6kWht9+5pggrVGFBtB5np/bFTDhNARHDKlgZOAO4y3Ox4W1pDWI2zpW02PWscCx5aoexs8fyitHc+6LsrAI2SgAurzIM5yuuHBNaBoLD4Iqb9W3hEEDY0SE6Cx1sWJ+VySFj0W87n+f9DMK9CEn9AHTIGVjKDDjQcvuJuNbWx2j/aqNgw5Svxh4aSMVdHUpZUBZWNSXE+x5j+QIhxudh3dDcioTsWmNb97o3TIH1UVivwcHYWFwYFYHhqfr/4DPifGvFEJwtw1B0/dsA/zCd/jHiNBA79n5UXWWF1XIuREVERcgFT2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Thu, 24 Oct
 2024 06:35:19 +0000
Received: from SA2PR11MB4811.namprd11.prod.outlook.com
 ([fe80::e790:74e2:d7b6:9fe4]) by SA2PR11MB4811.namprd11.prod.outlook.com
 ([fe80::e790:74e2:d7b6:9fe4%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 06:35:19 +0000
Message-ID: <bbc2c90d-814d-44c9-937c-c9125fc25c4c@intel.com>
Date: Thu, 24 Oct 2024 12:05:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/3] lib/igt_kms: Move backlight read and write
 to lib
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <bhanuprakash.modem@intel.com>, <suraj.kandpal@intel.com>,
 <pranay.samala@intel.com>
References: <20241024045212.1697869-1-santhosh.reddy.guddati@intel.com>
 <20241024045212.1697869-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20241024045212.1697869-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::23) To SA2PR11MB4811.namprd11.prod.outlook.com
 (2603:10b6:806:11d::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4811:EE_|CY8PR11MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aab10f4-817a-47c0-f31d-08dcf3f60773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkFKQ3oyL3lsR3dCVE5pZTRjblZUcFNzcTVWdnJrYzJpWnpkVVYwenJDdW9G?=
 =?utf-8?B?anl2L3p4cFVwNDhuNVRieUN3aGJMWitaeTRMN1BlUnQ3ZytVMkhkMHhTTkZQ?=
 =?utf-8?B?NTBSeEpDL2Y3eThRdm1BNlNXNStoQ0NWSitCSnlQdEliNDJNMWlFR0ZEUmcx?=
 =?utf-8?B?a0p5TDFaUGZxaTFySkJFYnhUSElMN2kxUVg4WG9BUTBtWUFPb0d4WUw4b0Z3?=
 =?utf-8?B?MG1nS3FLOEQ0REhRWXBlMjhFbTJvOGN3SFAvVm84eHBuT1BXOGIyMmRkaE5B?=
 =?utf-8?B?T0E1dW51RzlRb1dLdmdUdElGVVcyNVhlcUFVcWJCYmlRb0w5cnB1R1B2Sm5x?=
 =?utf-8?B?cGNLaGtLVExoUEVmU01GN1BLN0dIY281VS83WDFsWW1mbmdKcVdSUXZmbUlK?=
 =?utf-8?B?V0d1ZHF6OWtUSVllV3BZVTIxSGZnUmlOK1NmS0txMEN6Ykg0MGpyVy82RzFR?=
 =?utf-8?B?bG9YclVkeDhmRzU5N2JWU21FQkhjMXovUUdldlNFUklzK3AyL0M4dkVEOTk2?=
 =?utf-8?B?OEpNcmFZVzMxZzlTMDN6dytkSkozUzN1MENCdXJ2M25vMlFFKzhoR3h0Y0E2?=
 =?utf-8?B?N3A3K3lMdWdtV3pQdFVsWWZyVmlmVjEzdzdueno4M3BsK25hODlud2pBZ2hK?=
 =?utf-8?B?Vll4TFpiaDdLNFQrQmJFS3dMVDl3ZGJoWlRZNTZWQTNyVDhHL08yMG01UE5U?=
 =?utf-8?B?WXQ5UG14M2g0eDJQM3RTa1BDKzJuQUh4aDZLNjdEVFVlYWJVQytZOWFFU1Uv?=
 =?utf-8?B?WGQwOXd3RW5NK2tGU2NMOU1lT0w5UFBaL2VZMDNuL0FuVEpvbjBOQ0FhT0xm?=
 =?utf-8?B?RTlLV0ZXelVZbzhHeGZ6QUZUNHozNHZIb3VGTEIxMHd3ZXZHY1A3M0pDTm9N?=
 =?utf-8?B?SDkwYXhMM2R4b0hkenBLby95NUlPQnZYcWRqQm10RjZ4S1dZbElzcG5xS0Ji?=
 =?utf-8?B?TlM0TUZ2NEZxVzQ5MEh6a2JLekV0UGtKaTVFdEdsRktaLzlLWmFqRy9UWHla?=
 =?utf-8?B?UTVMTEU4WktrZXUvRGFsbHlLWDB3Y1FCRko3TnJISEJTeFNvSDdaRllockdJ?=
 =?utf-8?B?TkZKeStmcXlFYks4UENVYU1jL3pvQ2dJamdXSUg3bmVGdmNpTXIxRCtzTDZa?=
 =?utf-8?B?ZkZ6Szk1S08wU1NXdDNRQkdieDl3dFU2djEvSHhUQUI5cW9GU05TRFRuTTJq?=
 =?utf-8?B?WWlObFBCdzVQTVMyVUJKUElUNTlPTU9jUWlrQ1ZOQXd2VHFJL2M0MnJZL2Zh?=
 =?utf-8?B?bVdDMFR5RjdLT2JIQ09VbElSME1NRkZqZVF2ajFabGY2RlgzU3d2dUdiRmkv?=
 =?utf-8?B?MitleEN0c0N5TzZwNmZmbG9FZWN0SmJZRVY5a0dNdDRsS0lSK0p0V0ZHTm5p?=
 =?utf-8?B?UE9TVVlrMmNZZnZ2YkwxdVJIelp1UGRnK29CU2Zhd3lMUVAvZmNYcUZvcmJS?=
 =?utf-8?B?MGx6R1BtUTVKZW9NWmRWdFB3VjRaYjYwN2xzWGYvajNXblovTjBObDY0bndu?=
 =?utf-8?B?alZKR1JTOWo3RlV3eHlmYk5aRUVtUnpwY2RMZUdaK2ZrNExLcDJ2U0NCa1NU?=
 =?utf-8?B?MlJoaUxTSE4vWWFMRTlQN3lBWjdUbDJFSzIvcU5xMmNpajIvYXh2di82eGtj?=
 =?utf-8?B?T09lSmkxelBRZUNzeDM4aFlVejFsNDNwUHhsSkhXMi94bGtVbUd2bTFVcG1t?=
 =?utf-8?B?NG9aZUM5MWpqZVR0aEIzaHo4eXorU3M0Q3lvQkMwTFJiblNOR2ZjUlBQTjBQ?=
 =?utf-8?Q?r8jzZvQdZl3aSccZnYrqr/rGkyw7uZvoN2bYd/Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4811.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2Y2bjlZTFV6dUlFUnlndVlzeFd6TndCdEJtcWJjYUJsK090TXBXNlk3WTJN?=
 =?utf-8?B?SDE3YWZOZlh3SENEKzg2YXU5eGlOdFBuMlZDcVpBVm1zeGUyU0xwUElTSjE0?=
 =?utf-8?B?K1lQYXZIMklQY0RqMEhrTFcvVENnaFNxRno3aEFCL3JYS3RWM05mUE5FVjdy?=
 =?utf-8?B?STB3V050cjVzS1V6SDQvNEhJVEdXK0ZPUG1kaHR5c0V0bnQvUTJPUWpEUGhv?=
 =?utf-8?B?SVA3aWlRdUpxS0p2Vzh1dkdDQWJobGFpd0FWQXBOT21Ca1R6TGl5ZnNMdzky?=
 =?utf-8?B?WmhqUW5xRG5WbGtzNXk3UG1sMVBadmdIZU9ZMzJTbXZWRy9aZXJrR2U3WWRQ?=
 =?utf-8?B?d3hKYTRFcFBOMXdSa0tVK1dLcTFONUJWbkV3eU90SjJBMjVsL2h2em45dDFE?=
 =?utf-8?B?TzBqZkU1N1ptQVlibWtNM1JqRHNicXhSdk5EbVVTTTF6S0lGZHFBcStra0RW?=
 =?utf-8?B?V3A3bjBRbTlzaGdLeTFUdDNHNkNhVFR6QjRBTDgzOXNuV2dFeWR1ZStscGJt?=
 =?utf-8?B?bkUvbU9DY01wL0dtTEJzN0hpcEdxd3NZRzdpNTA0d0IzNlErbVJnRG5YMlgy?=
 =?utf-8?B?N0k5dXhlck50clMxVHhLZzgvMmx2Q1c2Sko3RGRUTUQ2aU5QT3Y0Nk5JOFFO?=
 =?utf-8?B?NWE3bytpZzhzZm80VS9sRjFhUmN2N0ltdlR0RHN1c3ArMWFJdW1OZmVKMVlt?=
 =?utf-8?B?OENrU2tqR2VCMVFQWTJ6SEVhd3Iwb0JyV2ZUeGxPRklWQXhFTmpVZ1NmR0NL?=
 =?utf-8?B?UTNRTWxiYk1RYlQrSlZxWlJvVHErMWtCdHRUVSthOXdWSndkcWpkbWJ4akZW?=
 =?utf-8?B?NjJoWXdqcDZPVEhDVmhKdlB6eHowTVBRbGRuRFFBT0tCR3FGOFZOcW1vWmV4?=
 =?utf-8?B?VGREUlFlNEVFNjNIcHVCSk1wOHBhSCtDQkRCa2kwT2V2OTEyTXhCNXBpeGc3?=
 =?utf-8?B?c1FqbDRLYk1WeDlVWmZqTlBsYm9VWnRQZ3NHODhyRXArb25JUi83U2JWVFN0?=
 =?utf-8?B?OEJqelQxdVdwUTcrSXFyUHM0Z1R0dXlIY0VyU2p3VDV1ZXVtNTZYWVR2R2lE?=
 =?utf-8?B?eFh0alQyS2QwQkE3QkVvY05DWTVkTW5ENlA3Qi9nMGo3ekRONllpT2F0MjVu?=
 =?utf-8?B?UU01dUJOMmFUNGkzbmVpQ1RsMVNTMVlmUyt5UTZmK0kyS21IMVVvcGRmVksr?=
 =?utf-8?B?Nm9tVkozSlVpNkpOeHkydStOZDBYY3h2WmplY0pwOE9sUWRsOWQ1enJQMFNh?=
 =?utf-8?B?bjVQWTIxS09qK2pWeXBrYkVldnU1VUtXc3ZSeUxhcXUzeDZjVjd0TUEwSGVL?=
 =?utf-8?B?ZTRkSlR2aXZZR2xlejFjYUVUNUMyOGdrOFhURTFBMGFKVEk0TjlwdXlLL1pJ?=
 =?utf-8?B?Z3k1MlhDWjFQZ2JLL3BrN1QzSXRBUm5SQkNrTEZEUEVXZlFTTU5ZVFRoVXQr?=
 =?utf-8?B?SjZSRDMxd1VQWkVHNGlIYnRpRDhpRG9MdnFNT09Da2s4R1lOOStyU0JWN1ky?=
 =?utf-8?B?NVNQWGJ5VjVOdVdYV0RBZllmR3pVQ3FNNW9ScnpJWDJVY2RiWnFTa2JjdmV4?=
 =?utf-8?B?eitHRVZqQkIvcjN2MzdqOXJkd2lsMnIvVnZRQlFtR0lRTWJuYzZjUE1aWkpw?=
 =?utf-8?B?T0lONy9NbTFaU1RKMU1ZS3gyQnJ4REFHZEtsdDVXc2xoUTRvR3M3RzhJaU5H?=
 =?utf-8?B?Z3IvaFVQL09CdythWFRNc2JTK2hrUmliNjNWUTFzTXJBOTNySXRxeWM1SlFC?=
 =?utf-8?B?dmxkK3dsalhUZi9aQjJpZ09sUkwydHMyclJaTDNPdHBZeTRJSXNwbURtaHQ1?=
 =?utf-8?B?YWhWc2xFTWRvWDc0REZubU1USVkvZk5oeGZrN1Q5RWRwWGFzMmU0TXBUd3o4?=
 =?utf-8?B?cG83dFVvMFBrcmFiT3NxOUtySDBqb0FhaGdBTTRCQXlkdmFDMkRoUHBwbklR?=
 =?utf-8?B?ZUhBYlcwYnRHNGR6aGZwbytRL3ZVeE9UbEZ4em1VZ0NGSHcrVjZFSUEweEJS?=
 =?utf-8?B?cEdmTXV1d1ZhNXU3NjJOdUFyWVB1RFVsbjkxVEJUaGxQRXU4c1V2eGJxWWJ6?=
 =?utf-8?B?SmV1ME9aV1JOYlVaVnIzayt0QXFkYWZTTGtzV2dBRnRsUzNpOXFhQnhqeHYz?=
 =?utf-8?B?ZC9DMk8xZTE4eEdvWVBSSm5KRlNWZ0xxQmxtRzZKbDZhS0Zsd1EyQUxwL2Mr?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aab10f4-817a-47c0-f31d-08dcf3f60773
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4811.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 06:35:19.3699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJZSVPk3NPYZR8jYuOUy3pGyu+NyyOzu5L3Jeb84ZRDQC5QBFPQ9iRgPqr7IlL/kNmguYC6KYa+za2h5vE8CbKU5ag2j8J/pgqy0wF4DeYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
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


On 10/24/2024 10:22 AM, Santhosh Reddy Guddati wrote:
> move backlight_read and backlight_write functions from
> kms_pm_backlight to library to reuse in other tests.
>
> move and rename struct context to intel_backlight_context_t.
> -->Please format discription correctly and start new line with capital.
> 	
> v2: Rename backlight_read to igt_backlight_read and backlight_write to
> backlight_write (Suraj).
> Add a new member to intel_backlight_context_t to cache vendor specific
> backlight path.
> 	-->please allin above line with v2
>
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   lib/igt_kms.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h | 12 ++++++++++
>   2 files changed, 78 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index bb35d4b82..5d8096a17 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7119,3 +7119,69 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output)
>   	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
>   	drmModeFreeConnector(temp);
>   }
> +
> +/**
> + * igt_backlight_read:
> + * @result:	Pointer to store the result
> + * @fname:	Name of the file to read
> + * @context:	Pointer to the context structure
> + */
> +int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context)
> +{
> +	int fd;
> +	char full[PATH_MAX];
> +	char dst[64];
> +	int r, e;
> +
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
> +			    context->backlight_dir_path,
> +			    context->path,
> +			    fname) < PATH_MAX);
> +
> +	fd = open(full, O_RDONLY);
> +	if (fd == -1)
> +		return -errno;
> +
> +	r = read(fd, dst, sizeof(dst));
> +	e = errno;
> +	close(fd);
> +
> +	if (r < 0)
> +		return -e;
> +
> +	errno = 0;
> +	*result = strtol(dst, NULL, 10);
> +	return errno;
> +}
> +
> +/**
> + * igt_backlight_write:
> + * @value:		Value to write
> + * @fname:		Name of the file to write
> + * @context:	Pointer to the context structure
> + */
> +int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context)
> +{
> +	int fd;
> +	char full[PATH_MAX];
> +	char src[64];
> +	int len;
> +
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
> +			    context->backlight_dir_path,
> +			    context->path,
> +			    fname) < PATH_MAX);
> +
> +	fd = open(full, O_WRONLY);
> +	if (fd == -1)
> +		return -errno;
> +
> +	len = snprintf(src, sizeof(src), "%i", value);
> +	len = write(fd, src, len);
> +	close(fd);
> +
> +	if (len < 0)
> +		return len;
> +
> +	return 0;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 2b26d2bbf..bd154d1c1 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -33,6 +33,7 @@
>   #include <stdint.h>
>   #include <stddef.h>
>   #include <assert.h>
> +#include <limits.h>
>   
>   #include <xf86drmMode.h>
>   
> @@ -513,6 +514,15 @@ typedef struct {
>   	uint16_t tile_h_size, tile_v_size;
>   } igt_tile_info_t;
>   
> +/* Backlight context*/
> +typedef struct {
> +	int max;
> +	int old;
> +	igt_output_t *output;
> +	char path[PATH_MAX];
> +	char backlight_dir_path[PATH_MAX];
> +} igt_backlight_context_t;
> +
>   void igt_display_reset_outputs(igt_display_t *display);
>   void igt_display_require(igt_display_t *display, int drm_fd);
>   void igt_display_fini(igt_display_t *display);
> @@ -1253,5 +1263,7 @@ bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output
>   int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
>   int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
>   void igt_reset_link_params(int drm_fd, igt_output_t *output);
> +int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
> +int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
>   
>   #endif /* __IGT_KMS_H__ */
