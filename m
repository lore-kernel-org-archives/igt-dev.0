Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D241C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 22:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B5610EA42;
	Thu, 11 Jul 2024 22:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cC2KXas8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CEE10EA42
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 22:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720737963; x=1752273963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ri4u4m01Q5ARZnd0YwplYDw1GC2n+2+w8gyhz3lQSQ4=;
 b=cC2KXas8MgfYGxrN0yLajH5QfHo0x5qVgpo8ZsUtUHNPu5aI/XHwpLhy
 ECTnHPZzB5sP58N7HnGz9uo+PRBA3zBV9xkFjEWOMp3Nbl8PewV+2IG36
 BDvFFaADMWBGk6pjnTWzA6QOUanKQQVowjsUD/Mwvp8FVnY239oc/zkTf
 y+YrtYX8EiTX0wJaeiqyKFiMmOgZilMC895KGtq2DMv+vZmrM2LfU3RWI
 O3Utw5gjeBTP47IVAuqSQhabuoKuVMhEMgUyU3xFzeeLJ+SDXTDe4ug4j
 whCdT7N2TrBG6X3vy2pZXe35FF4nnSE+A4qb+7nx4zlr7O9a57bzr7qEH Q==;
X-CSE-ConnectionGUID: WCpr5nIOQSKEpQhoAtFLQA==
X-CSE-MsgGUID: ePZEPP8tSSeAWUHfzxK+CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18276447"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18276447"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 15:46:02 -0700
X-CSE-ConnectionGUID: g4mcNQXPTQCOWeABIGa0bg==
X-CSE-MsgGUID: qC/6yCEjTRSiHqCwOYjvEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="79835814"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 15:46:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 15:46:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 15:46:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 15:46:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+8MbwPur3/eHLy4prW9y1AOBhjINymfZVtfNwQqfFyyIfEpBMqGLzrfO3kOKfTo+NxXCrkcuoB0G8lw7e0qLT4H0UeJSA8MzOOpjJfdQbgKcjoQAjQ0zWNE/VtlYQIk4CfX6tRKiTWFylUSsUbiUwKfOCuJkgxxqupKBGXaLPKQ3d/RkvHRmLl0k0Cb8xOrSaBXqEI5VGD1HCQHSaWGkumXteqJWe7uDa9L3a5Ek7bm9QjyiKHojvQVs16LZHJfjt6aBH/TdHzAW7DhzzhZEOcOq2w0xuEC0czJxL0igJV44jQpQUTkjMZl8nHqQH7sINi1EKTf6JnhmyYOoepDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JRjP/hHkyzTxfOEuHxXFv56tghHhy2HvYQqVg5kqVA=;
 b=HQdS7dTKj6CaQ0UC08EF2Og9dgsSmm3Kpx2a5784XPELD7lT1K+0LD8tb+/jKmOyEa7IlJjk01PLyOpvhi6OjV2Qwp0HrK5HHv8mVUJfDj7e7po7G4xylE411zSK1m+deKHWjJ3nibDzzrX09s9ergHaqtE7CzELXCklZI2D+DTtbb1zQCiAHPlRs4YGbo7RdqStPOQPLD6cVyut225watycKfUzA07Y5KwcK9/sTXsuDhpGBSVn/IrinXlMU7/9DULd73lSjfG9pjkCF+1TrD51nnpCgU2IKW5zrMwsJyZ0khCbWr2qkCbcoy/OBAF/sfWmkNWfpEvjUORJ0CE8cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 22:45:58 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 22:45:58 +0000
Date: Thu, 11 Jul 2024 15:45:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 05/10] tests/intel/xe_drm_fdinfo: Add single
 engine tests
Message-ID: <ZpBgoFhaW9HwicOy@orsosgc001>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-6-umesh.nerlige.ramappa@intel.com>
 <fjpk7jck3tv5vz63n2n4c4jayo4gt5folbfrnncrpdrblb6kgf@hg3exp46jfx6>
 <ZpAu0p+1DX5Yn7wA@orsosgc001>
 <noettlh7nsb3cpnlrgd3qjocjrnhd5gxbfzqdvvrlmfvg2bufn@4t3diblziurw>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <noettlh7nsb3cpnlrgd3qjocjrnhd5gxbfzqdvvrlmfvg2bufn@4t3diblziurw>
X-ClientProxiedBy: BYAPR06CA0043.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA2PR11MB4812:EE_
X-MS-Office365-Filtering-Correlation-Id: a19c4230-36c7-47d8-71b4-08dca1fb3b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUczVURJNlBZNVQ3TmVvUTF4N0FsOUt3aTdyMlJ1M1A1aG50SVNrSEVQQ0FB?=
 =?utf-8?B?b2NDd1NMZmI0NUQzVUFERm5RbTRTSlVRSHR1ZmJTeUEybEhzTnRBbHpKVTdC?=
 =?utf-8?B?NlJka2tnbzNwS2JtdnlVTHJmSXVSRG9wTmFWdUhLOXo2OVNTRnNia0VZR01N?=
 =?utf-8?B?RU0zT2crOExxOUNRYjV5VEdLSkM3ZExaU1NRc2lERWNsd2FEaUFQRlZYWTVV?=
 =?utf-8?B?aFZvbG9KK1lxOEJVMmFFaEFzYVZwQ0VhQjRrYlFBbmdoN1VLTlZUYWx4RG9E?=
 =?utf-8?B?M1NZYm80VmVoazRpY1R6TFpSVW1PR2FMWmZPdlN4UkM1aWhhQ2cyMjFBQjFP?=
 =?utf-8?B?UGhQeEtjZDl2TGZhV3RPbWMxK1l5RHpLZHJweVREbkxYQ09naVJNdzdmQTNF?=
 =?utf-8?B?K0NWVWNmekp3YmFUTUZPVzR0ZnhQbHRMOHozcTNScmdGOWhESkpOUVp4S2hP?=
 =?utf-8?B?SnFDMlVDNzZBLytEZzM1eHF3NDNNL01LMjdLbTYrd3k4NWd4SnhJd2lTYTUw?=
 =?utf-8?B?eE5sdVhlb083dkEyUjA5b3cyZEZObEc5amkvdXhSL3VEaVVOSWFMUmgwQ1I1?=
 =?utf-8?B?Z1dwbUFDWXhnM3JnWmNlU29EaTdoWGdyVVdFVHFxWHZOQkQzbkZVRnJTYk1y?=
 =?utf-8?B?R1UzblBoZGV6eXZiRzdENy93djJaQ0ZyODhhaUlFeDUyYWV1cVdIdk5uS3gr?=
 =?utf-8?B?cnpWd2VlMXJiN2RRZjRSeG8rcHROME94ZGVQaWpHUlpCRG1MazR2eEp6bGNO?=
 =?utf-8?B?cjBheFZ6YURXaTQ5Sk1ENGNPSFQya3l1bFFMWFcvUG0vd2didGxTSzRBR1pD?=
 =?utf-8?B?NFo3dHE1M2tWSE12Vm5SUWJlSzVCbVgrT2xrWUVsc1ZoV3ZZMVE1MWdIcDhI?=
 =?utf-8?B?RkZtZFQ1SFA1UGswR1ZsRE9WdHFVU3BtckVWeEN1a2l0Q1dIOW1ta3pJWmIv?=
 =?utf-8?B?bWZpMGJxNzRZTHdxYWtBcTBKcnhIMGZMaGU1d0N5d0Y1WGMva0w2K25aN3k0?=
 =?utf-8?B?cG1qYnlHQXpUSzdOWVM1WnlHOHdFaW9DTHVIRXI4MEdpQjgzNjFTYUNlbENs?=
 =?utf-8?B?ZWZ4VjNkN2ZXYW1sOENEQ0doRnBhemUvUzdUaVd6c0l0YXpGK0FrcVBrc1hQ?=
 =?utf-8?B?WHdaKzdkWFBsaUZGK01WelNKYTZuc3pVc05NZnVNdVZsVFp6dGRzSGE0eURM?=
 =?utf-8?B?b0ROeDFQbnhyZUMra1hKSWZ6bUk5ZnBjOUhlVGZQRjVUMjhCbkhCOHhybE5Q?=
 =?utf-8?B?Wm95UXE3YVZESHpSdjdwcGM0ZzlWYkVjbFFGc1BUeUIvWHdocklLM0wvUEc4?=
 =?utf-8?B?STRjYldMR0x6a28zSTI4dnVzT25iQklZTXBoeEs5T0J0VEJDblk2UElIR2Rl?=
 =?utf-8?B?UGdsaklhQjFEOHdMM1ZPd3FtVEhyYWR5WTJ2dnovOUp4S050VWVqMWJBNmNX?=
 =?utf-8?B?VXNxSnhmK2NxNkVVVFBRTkUrVGpReXB2bzJLeXV2aVE1STgvbnVvT016RHJq?=
 =?utf-8?B?U3FObFVhcDBFRU4yWkFzdnJtV0wvNkVMRFJ4MFNyemNpTVhRei96WEw3K1pk?=
 =?utf-8?B?VWRNQlMwS2xOd3k3R25NODRBZHJSN1IrL2NSZGpaSUN4M3liUWJCRHZBdkhj?=
 =?utf-8?B?cDZDQzlPK1pBTndIQ0QzZ3RTVmxUYlZPU3R6ejlESFNkazFWSTFoK2hHMFJ5?=
 =?utf-8?B?bnA4R1ZUUjF5Tlo1WTA4SWs5NmJkL1VCUG9qZHloNElQLzFrTmQrUFFmSVNj?=
 =?utf-8?B?LzFEbXNFNnMxa1lMZEpwOEpYeXNkeXUxcklGU2hOZno2SmxyQXJ4M0FuekQx?=
 =?utf-8?B?ejdLUXpnc3ErYUhPNkhQdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkdsWGlDZ1ozZkpvVW1QdXVFbndXWGxHMDlWUk9sK01mNTNQbTV0aWdNcnN1?=
 =?utf-8?B?VjRwNzNOb09kbG80OWdKY1E2aUs0WStWY29JaW1nVDl1K0N3TTBNMXE0dDFK?=
 =?utf-8?B?WmtaWEJYeFlVM1h5VmhTWlI5cWplZmVMNUJNd1lHKytsT1REcXlkUlE5bUJx?=
 =?utf-8?B?TisvMldxRGxZU1BDcjg1bjNvbUtEMmFjSXh6MnlBVDZsTCtaWmNUY2YrZ1RN?=
 =?utf-8?B?eW1JZXNMSE8wZUF6YStzL3VZWFZCb0dxQi8yNGRtMjlyWFRLMGllekpZYm4w?=
 =?utf-8?B?WUlrZW5qMEZsL3gvTTZBbnlFWVZjeTViNnpFU2xQbm5wQnFyZmFVdDNjWHlD?=
 =?utf-8?B?MytDYkRQYVhpK1ZOWVUwZk1rMlVpaFl4ckRMY3llUnRGZ3J1dE54UzBhUTBS?=
 =?utf-8?B?eHFWejl1K21IalVab3loVlFkS0sra1pwUTJQOXVTdHZ6aTlnNGtNSEVpQzlH?=
 =?utf-8?B?dVFiRlV5cm85RU5CclFPMjZGTVRSUmRVZFU0SWYxRGU4M0VRMnVNUUU2bXZN?=
 =?utf-8?B?YVorYTdvZWF2R1BrM3pWRkFTYWVPUk5RZjNOaHJWTXJKdXR1VjZoZ3M3VGts?=
 =?utf-8?B?Q081aExmV0tVQzF5YTVudmVpMzVBMUdUWUlITXYxRVlxNGh0RVdtQVppUWlx?=
 =?utf-8?B?R2VpdU1MSW4wNlpaUTVzellLY3kzeHFFdzhxa0JRTkE0K0ZDc1dveUxudmQx?=
 =?utf-8?B?cmJDNlVpa2wyZmovVnBmNW1tUzNXZEdRdlJhM1J0cElqYUVJclFMYVdIdlJC?=
 =?utf-8?B?UGFYdWN4ZEFvdVNrM0VZNEtTbFZjcHRpTUhUQlFmY2VIM3dqc01Jd0dXR2V5?=
 =?utf-8?B?ZXFRUHhxcDcxTGw0eXEyajdyWXJnUUVLWkFFV1UxeXlFRno3NlVSdjdKNGYv?=
 =?utf-8?B?cVpiZGs2WGE2TTBOUFJLV3l5QitQMDJFZDZJRU5FMkRMSmpWcW10TDRidmxh?=
 =?utf-8?B?aDNIWkl2R1FzcUVOSlg3SE8wQ0lBS2dtc0o3YmxOZHptQ2FsYmVmSm9tdmx4?=
 =?utf-8?B?K3A1RDQ2bWpQbGZMS0dTZUJ2a3MzVUhhejJVWjQwWVR2ZTIvR3Zuc1F4ZFM4?=
 =?utf-8?B?VmFFYW9ySGpzUFRyR2ZjZU5ScloyemVmbERwRmhVTVVSREZqS2U4OTJLSnIx?=
 =?utf-8?B?aUdmOFRGSmdEQnhiOGJKTzFsZ0M3RVA4bTgzWXZoVXFwRTJJeDVmalVQdG0z?=
 =?utf-8?B?QTNCRU1zTkRIYXRDZ0s5YlFrNS9zbm5lWlYzVzg4Y1FvcjljWjB0cTBLS3FU?=
 =?utf-8?B?WWRlaHJkMWc1b1NSU251VkppMTE4blFZMkF4R3B5ZU9FRDZQQm5NU00zbEJT?=
 =?utf-8?B?Z3VzTGpiSDh6SmV6WjAwV3VRRnkzYU1nOVZWMllOaTFkVld1MHZrTHZxeHR0?=
 =?utf-8?B?T0V5NXZnb1F1SUZzRk5KODU5L2hPdTVvN0VCSUF3Mk1OSllmV0NRdlNtTGZt?=
 =?utf-8?B?c2QvSjBsWU03QWZidnVpRXVKY2ZnSGQ1dlIvWWd6Rmc0SldsVjAyL25SaFRX?=
 =?utf-8?B?OXVWZnhjUXhUYVRYV205WmhLWktJcG5IM1hadnZxU1VqNFgwMEdTU2lVNEVL?=
 =?utf-8?B?TzJENC9hZEEzWXNWcVZ4dFJNa0xTWEl2U3gwZ0MxS3loemlrd2k4Wm0zcWR2?=
 =?utf-8?B?WW1yNUE2QTJMK1g4S0dmNUNVaFluZWdWaG5VTStBMEJxblF0eG1nODdaMjNZ?=
 =?utf-8?B?eUpWT1huV0g4MHp1cjh3Q2dBUk91TjZ2bHU0MUZzTTdYYzJnQ0VNUFN2TFJH?=
 =?utf-8?B?cnZXSE1FcGwrSzAxQ1I2eHNqVStHc1J4NWRkM2hBbkpZUGhEZUxRd1BhYnQ5?=
 =?utf-8?B?MWZBaVQvV015T2xRRkFVbmFjbG9YLzkxWk1aTGJxdkZ5ZG52bVUzUEVCOVJz?=
 =?utf-8?B?YU0zWXY4YU1GZ2ExN04xaGJ5bzJrNkJkL2FINVp2bWwyclo5OEhDeUI5bGVr?=
 =?utf-8?B?bFlDVzdvcEdhdlBCNEZCZmlNK25JMG5NRlZvejNhUThESmtjcjN1K2hNczhk?=
 =?utf-8?B?UVBJMGJydUtUTFE0RHdyUzhDNTZEbVZ3UDI4SGx1QnRPUXhodnczOGJoNS85?=
 =?utf-8?B?d2w3cUxVTUEyTG9aN0xONWlVNmtyMVFWVHFmN2lIKzlybVVrOUNQRXhDSGVt?=
 =?utf-8?B?cndoSlNPWE5rd1UxY1Ryd0NaL096aWQ2UmFPYTRLKzRLcmJ6Y1RLa3VHQmEw?=
 =?utf-8?Q?vZDWqmMv4aLjIcBtrSsXqBw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a19c4230-36c7-47d8-71b4-08dca1fb3b23
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 22:45:58.2554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g284xIpB829YfeDPLh5wyQOJvcfLJ8krrgB2Oro3NvER7oTxej5fVpcfHxzAX8q99xJnkNLNn7RUjlRn4BYRZKKG5bxwAoeE+c6ag6zJLp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
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

On Thu, Jul 11, 2024 at 04:34:53PM -0500, Lucas De Marchi wrote:
>On Thu, Jul 11, 2024 at 12:13:22PM GMT, Umesh Nerlige Ramappa wrote:
>>On Thu, Jul 11, 2024 at 08:20:17AM -0500, Lucas De Marchi wrote:
>>>On Tue, Jul 02, 2024 at 05:25:27PM GMT, Umesh Nerlige Ramappa wrote:
>>>>Add simple tests that submit work to one engine and measure utilization
>>>>per class.
>>>>
>>>>v2:
>>>>- Drop measured_usleep since return value is not used
>>>>- s/parallel engines/parallel submission/ in comment
>>>>- Use NSEC_PER_SEC for batch_duration_ns
>>>>- Percent should not be > 100
>>>
>>>but as we chatted later in the review, it's actually possible to have it
>>>greater than 100, so I think we need to leave some room
>>>
>>>>- Check utilization for both clients for isolation case
>>>>
>>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>---
>>>>tests/intel/xe_drm_fdinfo.c | 97 +++++++++++++++++++++++++++++++++++++
>>>>1 file changed, 97 insertions(+)
>>>>
>>>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>>>index 037f25e53..410c885e7 100644
>>>>--- a/tests/intel/xe_drm_fdinfo.c
>>>>+++ b/tests/intel/xe_drm_fdinfo.c
>>>>@@ -28,6 +28,15 @@
>>>>* SUBTEST: basic-engine-utilization
>>>>* Description: Check if basic fdinfo content is present for engine utilization
>>>>*
>>>>+ * SUBTEST: drm-idle
>>>>+ * Description: Check that engines show no load when idle
>>>>+ *
>>>>+ * SUBTEST: drm-busy-idle
>>>>+ * Description: Check that engines show load when idle after busy
>>>>+ *
>>>>+ * SUBTEST: drm-busy-idle-isolation
>>>>+ * Description: Check that engine load does not spill over to other drm clients
>>>>+ *
>>>>* SUBTEST: drm-total-resident
>>>>* Description: Create and compare total and resident memory consumption by client
>>>>*
>>>>@@ -42,11 +51,18 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>>>>
>>>>#define BO_SIZE (65536)
>>>>
>>>>+/* flag masks */
>>>>+#define TEST_BUSY		(1 << 0)
>>>>+#define TEST_TRAILING_IDLE	(1 << 1)
>>>>+#define TEST_ISOLATION		(1 << 2)
>>>>+
>>>>struct pceu_cycles {
>>>>	uint64_t cycles;
>>>>	uint64_t total_cycles;
>>>>};
>>>>
>>>>+const unsigned long batch_duration_ns = (1 * NSEC_PER_SEC) / 2;
>>>>+
>>>>static const char *engine_map[] = {
>>>>	"rcs",
>>>>	"bcs",
>>>>@@ -464,8 +480,77 @@ spin_ctx_destroy(int fd, struct spin_ctx *ctx)
>>>>	free(ctx);
>>>>}
>>>>
>>>>+static void
>>>>+check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>>>>+	      int class, int width, unsigned int flags)
>>>>+{
>>>>+	double percent;
>>>>+
>>>>+	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
>>>>+		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
>>>>+	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
>>>>+		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
>>>>+
>>>>+	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
>>>>+		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
>>>>+
>>>>+	/* for parallel submission scale the busyness with width */
>>>>+	percent = percent / width;
>>>>+
>>>>+	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>>>>+
>>>>+	if (flags & TEST_BUSY)
>>>>+		igt_assert(percent >= 95 && percent <= 100);
>>>
>>><= 105 like you had before seems good, otherwise we may have too much
>>>noise in CI.  What are the typical numbers you're seeing?
>>
>>I see 101 whenever it fails. Also I see it only when I run batches 
>>on all classes (all_busy_all/most_busy_all etc.). The difference in 
>>numerator and denominator deltas is close to 5ms though. Not 
>>convinced that we should see 100 still because we are ending the 
>>spinners (and waiting for fences and all) before taking sample 2. 
>>Still debugging a little more on this one.
>>
>>>
>>>>+	else
>>>>+		igt_assert(!percent);
>>>>+}
>>>>+
>>>>+static void
>>>>+single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
>>>>+       unsigned int flags)
>>>>+{
>>>>+	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>>>+	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>>
>>>nit: either name it pceu_start/pceu_end:
>>>
>>>pceu_start[0] is the pceu for client0 on start
>>>pceu_start[1] is the pceu for client1 on start
>>>pceu_end[0] is the pceu for client0 on end
>>>pceu_end[1] is the pceu for client1 on end
>>>
>>>or pceu_client0/pceu_client1 if grouping by client
>>>
>>>pceu_client0[0] is the pceu for client0 on start
>>>pceu_client0[1] is the pceu for client0 on end
>>>pceu_client1[1] is the pceu for client1 on start
>>>pceu_client1[2] is the pceu for client1 on end
>>>
>>>... this makes it less prone to typos.
>>>
>>>But see below as I think 2 samples are not sufficient.
>>>
>>>>+	struct spin_ctx *ctx = NULL;
>>>>+	uint32_t vm;
>>>>+	int new_fd;
>>>>+
>>>>+	if (flags & TEST_ISOLATION)
>>>>+		new_fd = drm_reopen_driver(fd);
>>>>+
>>>>+	vm = xe_vm_create(fd, 0, 0);
>>>>+	if (flags & TEST_BUSY) {
>>>>+		ctx = spin_ctx_init(fd, hwe, vm, width, count);
>>>>+		spin_sync_start(fd, ctx);
>>>>+	}
>>>>+
>>>>+	read_engine_cycles(fd, pceu1[0]);
>>>>+	if (flags & TEST_ISOLATION)
>>>>+		read_engine_cycles(new_fd, pceu1[1]);
>>>>+
>>>>+	usleep(batch_duration_ns / 1000);
>>>
>>>NSEC_PER_USEC
>>>
>>>>+	if (flags & TEST_TRAILING_IDLE)
>>>>+		spin_sync_end(fd, ctx);
>>>>+
>>>>+	read_engine_cycles(fd, pceu2[0]);
>>>
>>>... and here we have another source of noise.... when doing
>>>TEST_TRAILING_IDLE, should we read the first sample after the spin
>>>ended, sleep, and read the second sample?
>>
>>That would always make utilization = 0% (numerator delta is 0). We 
>>should take sample 1 when the spinner has started and sample 2 when 
>>it has ended (for PCEU).
>>
>>TEST_TRAILING_IDLE is only valid when TEST_BUSY is also specified.  
>>Maybe I should enforce that in the test. This is the flow for common 
>>flag configs:
>>
>>1) flag = TEST_BUSY | TEST_TRAILING_IDLE
>>- wait till spinner starts
>>- take sample 1
>>- usleep
>>- end the batch
>>- take sample 2.
>>- check_results (expected 100% util)
>
>I think the way the test is written, the expectation is wrong.
>By absurd:
>
>1) flag = TEST_BUSY | TEST_TRAILING_IDLE
>- wait till spinner starts
>- take sample 1
>- usleep
>- end the batch
>		<--- long preempt here emulated with
>		     usleep(500000)
>- take sample 2.
>- check_results
>
>So we'd still expect the same ballpark number of delta ticks, but
>utilization overall would go down as now you are ending the batch
>and sleeping a little more before taking another sample. In the example
>above I'd expect utilization to be 50%

Indeed. if preempted after ending batch, then the numbers will be off, 
but that would be for this test. In other words, the test will not be 
able to verify this accurately. In reality, user will see the correct 
utilization - 50%.

>
>>
>>2) flag = TEST_BUSY
>>- wait till spinner starts
>>- take sample 1
>>- usleep
>>- take sample 2.
>>- end the batch
>>- check_results (expected 100% util)
>>
>>3) flag = 0 means truly IDLE since there is no spinner.
>>
>>>
>>>but then how are we testing all at the same time here? I can't see any
>>>igt_assert() for the trailing idle test and it will actually impact the
>>>busy test since it will wait the spin to end.... Am I missing anything
>>>here?
>>
>>Case (2) above does not exist for PCEU tests because CTX_TIMESTAMP 
>>is only updates when the context switches out, which means we must 
>>end the spinner before taking the second sample (or preempt it, but 
>>ending is simpler). This series only has tests for case (1) and (3) 
>>implemented.
>
>true, we are only reading the value from the context image, but does the
>hardware update it only on context switch? What I had understood was
>that the value was updated while the context was running. Otherwise I
>think it's utterly broken:

CTX_TIMESTAMP in the context image is only updated on a context switch.  

>
>Considering
>	s* are the samples
>	c* are the context timestamps
>	g* are the gpu timestamps
>
>	- not running
>	| running
>
>
>         g0 g1                    g2        g3   g4
>         c0 c1                    c2        c3   c4
>ctx0 ----||||||||||||||||||||||||||||||||||||-------
>            ^                     ^              ^
>            s0                    s1             s3
>
>For simplicity, assuming g0 == c0 == 0
>
>in s0: g1 == 3
>       c1 == 0
>
>in s1: g2 == 25
>       c2 == 0
>
>-> utilization returns 0%
>
>in s3: g4 == 40
>       c4 == c3 == 35
>
>
>-> utilization returns 35 / (40 - 25) == 233%

well... I think that's the issue with > 100% utilization that I see with 
tests!! If sample 1 is delayed, then calculations are off.

>
>how can we get this right if the value is not updated for running
>contexts?

I don't think we can. This is an inherent limitation of the HW counter 
that we are exposing. It is updated only when context switches happen 
and can be reliable only for frequently switching contexts. Tools would 
have to use some sort of averaging algorithm over a period of time to 
make sense of the data.

I think this sort of sampling affects any counters that we export that 
are updated infrequently. You will run into internediate values that are 
larger than 100%. Results may need to be averaged out.

Although, for this specific case, we should try to support getting c2 as 
well since that would be required for long-running contexts anyways. GuC 
had some level of support for this but with some limitations. I would 
have to dig that up and consult GuC if we can use/extend that.

I would probably not merge the IGTs, but would appreciate it if they can 
still be reviewed. I would still use the same tests once the above 
support is added.

Thanks,
Umesh

>
>Lucas De Marchi
>
>>
>>Case (2) is applicable for a completely different feature which is 
>>still wip - per engine utilization via kernel perf framework.
>>
>>>I think we need to add a third sample when testing trailing idle
>>>and ensure:
>>>
>>>considering the indexing as sample[client][idx]
>>>
>>>	sample[0][1] - sample[0][0] == 100% if BUSY else 0%
>>>	sample[0][2] - sample[0][1] == 0%  -> idle on trailing test
>>>
>>>and for isolation:
>>>
>>>	sample[1][1] - sample[0][0] == 0%
>>>	sample[1][2] - sample[1][1] == 0%
>>>
>>>>+	if (flags & TEST_ISOLATION)
>>>>+		read_engine_cycles(new_fd, pceu2[1]);
>>>>+
>>>>+	check_results(pceu1[0], pceu2[0], hwe->engine_class, width, flags);
>>
>>This check_results will check for TEST_BUSY case.
>>
>>>>+
>>>>+	if (flags & TEST_ISOLATION) {
>>>>+		check_results(pceu1[1], pceu2[1], hwe->engine_class, width, 0);
>>
>>This check_results will check for idle case (flags = 0).
>>
>>>>+		close(new_fd);
>>>>+	}
>>>>+
>>>>+	spin_sync_end(fd, ctx);
>>>>+	spin_ctx_destroy(fd, ctx);
>>>
>>>if !BUSY you are not even calling spin_ctx_init()
>>
>>:) yeah, sorry about the readability here. The spin_sync_end and 
>>spin_ctx_destroy bail out if the ctx is NULL which is the case for 
>>!BUSY. I can add and explicit check to not call these instead.
>>
>>Thanks,
>>Umesh
>>>
>>>Lucas De Marchi
>>>
>>>>+	xe_vm_destroy(fd, vm);
>>>>+}
>>>>+
>>>>igt_main
>>>>{
>>>>+	struct drm_xe_engine_class_instance *hwe;
>>>>	int xe;
>>>>
>>>>	igt_fixture {
>>>>@@ -484,6 +569,18 @@ igt_main
>>>>	igt_subtest("basic-engine-utilization")
>>>>		basic_engine_utilization(xe);
>>>>
>>>>+	igt_subtest("drm-idle")
>>>>+		xe_for_each_engine(xe, hwe)
>>>>+			single(xe, hwe, 1, 1, 0);
>>>>+
>>>>+	igt_subtest("drm-busy-idle")
>>>>+		xe_for_each_engine(xe, hwe)
>>>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
>>>>+
>>>>+	igt_subtest("drm-busy-idle-isolation")
>>>>+		xe_for_each_engine(xe, hwe)
>>>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
>>>>+
>>>>	igt_describe("Create and compare total and resident memory consumption by client");
>>>>	igt_subtest("drm-total-resident")
>>>>		test_total_resident(xe);
>>>>-- 
>>>>2.38.1
>>>>
