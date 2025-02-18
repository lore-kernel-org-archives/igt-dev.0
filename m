Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929DFC02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 10:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D31F10E660;
	Tue, 18 Feb 2025 10:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0fJxKfc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142FA10E662
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739873585; x=1771409585;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VnZcEvBCbSudtrOf/dVNE1k7wKkNGCSdX+c3Gf/JA5w=;
 b=Y0fJxKfcmrjfwnS5pBoTY4TVTvvA/dtYBbqW3MEPRUdl2hSXI03Qmn/4
 ojwHgBunkav8wmjAUSykmw41R9wGIYy4fSbAxynscJ/h7v8e3j5nkN7o8
 4pS2eDp/+FFI41uWda9NIaU8qD7++i2NTg74dNZUfAXOfuI0W+eCyQFyC
 8NqrVTLKse0RGaeN8B1KenF+35qeRHZ0vJD/e/0EwIFloT4b3ts3QZkWr
 6+mudRD1BGpb62HjkLAKvq3TK0Fh16FYyQk46WNxz+n0Iz2NNnM9mbk8m
 F6QcpUzhAic7KeaJwQ3T85q4MDZDSfU9bKcpIG3Nkeq/9aCw1Tit419vM g==;
X-CSE-ConnectionGUID: d8xvUIr1RPCPbh4ikL6PFg==
X-CSE-MsgGUID: EPiupr8hQzeRLIEPlvT4sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40755921"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40755921"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 02:12:59 -0800
X-CSE-ConnectionGUID: qp5OWO0oTASBjZZdnj1lrg==
X-CSE-MsgGUID: qLxP6SZqTFCbcSiHWqggAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="114278987"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 02:12:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 02:12:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 02:12:57 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 02:12:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BW+lv+EGBvc7oQRKffOIIXZiYVLaKUZ3kCN23LdRQm8UZa67yM/XKBg0MqQ5dKLfpuFX1SnNRZyRr7NKyhvHZp4+1OSlWzUaGXxGFApvg2oR2BafaK3RYQbGKIu3+yXusfjWQo6VCyfI0xuCcML5YgYDapfakOsWXhaaqhyqEotBIiZ+mD+V/IyyXBsajKA/Zp5n2DLeGuUDPn4ac4MhbmP6AsCg46fx/Yi/1samp1xPsdjsRsdtwEskS7lw0mE6QI6X+CsWBul/7nuiI2FjUdSrdEV/u95RFhn6ITUCpxMwUWV24ZS9Acl1ZhCz4SpYXylTmuoCO0pNCkvmXuH4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5Gk31W5ITI5S7tNsVRTQyuWnM4YcjixEm9XGc3vGLY=;
 b=dQkRMLPUfjLCtJEjsyhqWw8lN0vHH9ruDwQ0vQDaDWxpOZeqrPdx62uszjv9+uCt7EjaVhx/cz91BDVUV//YraCe5fbgaYRThnJahvGm+GeJiCFpr7pTaTxxA86hMNWf7ypK1oxeZXRpEjQHFxGKzCDdz3du9lyGpgceahKhMu6/b9rk5DJTJQXmNbccHVOLNqEjSGdXFDB9l9H5iUbI61dYgQNTGRluVqORJepOf+IRhz+acs/7EvoMCQpUXHjhmUk8JrrfIQHYY8hOvkaaRRNSG276nMNfEokeG0/TzBcR6cHyMG1bbW/rzyOR6U/8JqUSNHbi9v07fi453UslFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 10:12:28 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 10:12:28 +0000
Message-ID: <759e29fa-c977-484e-a492-65bf550ac703@intel.com>
Date: Tue, 18 Feb 2025 15:42:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Ensure eDP detection before
 skipping test
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250210103619.1235820-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250210103619.1235820-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::15) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH0PR11MB4998:EE_
X-MS-Office365-Filtering-Correlation-Id: c2031055-c225-42b7-581c-08dd5004bf73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1FUYW1NSnpUaEFFN2UxMGZ2MkpnQnp2emNjM3E2N2lnbTJxck5XdFRXZXds?=
 =?utf-8?B?SzNsTHhDN0dUQ1VBSGtkNHUzejV4d1doa0lNNXAzYzNoZFBjclpsNk9BWnRY?=
 =?utf-8?B?dlFxQU94MVR1T0QxejlNZmE3YU9VUHBJM2ozeVdEaGFnL1h0VENwR21CaVdU?=
 =?utf-8?B?L2VmOE9UUTZZSXltYXF1bllIYWZ6OXJmTWM3SnIrYU9lN0hURlZDREN0RHp2?=
 =?utf-8?B?QVo0Zjd2Yks5dXlBM1E3LzRuSkUzbk9WQTQ2MDZjV0NXZzZhT24yN2cwcnJ1?=
 =?utf-8?B?YTRtVmUwZStZOTFvcnY1ZXNrTDYyZHorOVlXQTRDa0VpanJFZ1hWNys0L3V4?=
 =?utf-8?B?Ti95SktWbW4rQ3hyNU5DdVlGeWJFdGtpZG1mN29EWnlXcDczb3o4clhRangr?=
 =?utf-8?B?UEJqYW5KZUFjTUlpUWxWODkwQ3Vjd05UcFpRaStCQUFCRDRSRDd0MFB4VEgw?=
 =?utf-8?B?cW9iNnFTY3dNN1piOFAyWUZVcUwzRUJ3bGp3TlVGY3ZjamdXS0FNN0dWaDVx?=
 =?utf-8?B?TWIrVVB6MWxGRXFCRlIydVg3V0ZkeFhVcFQxTWdQTmxzSlJxR25lQ0ZhSUIy?=
 =?utf-8?B?SmxkaVpMcVJGOFhZT3M0cUxxM1BlL1VmZDVOZk9CSFFsSEhpVFlyNk1KV1BR?=
 =?utf-8?B?OWxEclBsL2JDbHRIVGJtVzlrVWFyeHFVd1Y2K2dhQlNwVStMRFBvUVFEeWxq?=
 =?utf-8?B?T3RFbVVUK3ovYnorT2MybHRNa3VMaGx4RWpZU1JRdldSMXVzMkNwN1g1eFlZ?=
 =?utf-8?B?cW9ubDVWd2x3YzB2TzJaZVBId0xzRFdKRFRCZGRWVGJiRnNMVU85YW5vWS9J?=
 =?utf-8?B?V1hLbHErRVR6N2EvWWhVQThreE1LcU55VXNmMDVFbTFaczQzQkViQk9oVFV3?=
 =?utf-8?B?NUxIZFp1SXZodVRCVHF4Z0NzL0dCYWJ6L2t1R3BuY3VFYmcwSm5Pd0UzVC9l?=
 =?utf-8?B?dzNJdzhjZkNwblNlSnVTampKeElZWW1RNkZOVklpVmphazJaa1dXbm5tLzND?=
 =?utf-8?B?MFkveDg3aUVDR3NibFRQZ0FtUC9NcjFCVytpZE1Dd3VYMUV6bUNObXpDZXJ4?=
 =?utf-8?B?WTNQSG16WVBtQUFVRkswQzFNUEZPdGFjcFlrbEtwalVjMnBvR3AvY0tjUTJa?=
 =?utf-8?B?YnY3QnBUWWtRaFVaMDZ5aWZTZTFMVVNYbU11ZUZqVU82N1hHbkJ1My9kOWU5?=
 =?utf-8?B?QXRSekF0a2Mrbmgwc3N1TmF6RkNNUnBaQXRkcy9vS2xkeVVQSlNWbzRQK1Fl?=
 =?utf-8?B?UEZibk1COVFoa2lNZVNPRVIvd3ZKaFFnalhMWFNsYVgzTUgzeHRDK2o4UDd1?=
 =?utf-8?B?YlBUTFJVZ3EzV3dvTjZQaDA0eGk2NFdZdG95bTFWT0Q2UUk5dHhldzVoR2NU?=
 =?utf-8?B?YW9PVkRZcUJldS9ySUh2VUplRXVWU1k0U3R5dFd4LzZyV3NYUk5SSW1KY1RS?=
 =?utf-8?B?RDhzQXV1Mzl1dkQzblRqV2s4bXJDNDZMNGxkNzZTZVVhVjZGMjVocWQvMzJJ?=
 =?utf-8?B?a0ZjNm5LWUhONlBjaGp0S3JKaCtMa09EOG1tMGZUWDFjeHI0SnNxTGx6L1RB?=
 =?utf-8?B?TUV4SytFcWRoR2M3Qi93cnNKSGkwMElKNHNoWmRHSEFpVElDdzZJUDY5Uks1?=
 =?utf-8?B?MWRIczNFQ0dNSlhVTmxEZmFKVmFaam9SV0grY1MrVWdPUDY2S2ZHSUc2VkVK?=
 =?utf-8?B?bWtpMGhMN3BNdzJvU1o3UmtHMS9XdjcvV0pGSjJFWks1WXJCZ3BjRGE5WXVX?=
 =?utf-8?B?czBEeFBEcTBhdis5dGtwNnBMQjIwYlc3YXAybUFjaFR2UHlpb3FTYm9KbFda?=
 =?utf-8?B?VExTOGxVWmJKZ09mdXhsWitOUW5zbFNRa1J2Z1BSNjRrM0dhSGxwNnVyTXVx?=
 =?utf-8?Q?DjMGlfrIXK22G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkIvcGV4WDNkNVp3Q2RRT2dKWkZZWEJTdTd4Y3gvWk0zOUt6MjBrZEhtTWtI?=
 =?utf-8?B?a3BLV3J3QlJXOG55YXE4UThoMVNiS1Q4Q2ZVT2ZkT1RmTHFuQ2lPbGFmRFlI?=
 =?utf-8?B?aldObkdMUk1RV2JrUXNmY0ZwZFVtVHJ6N2ViTmI3ZkpuL25XS3JiZmYxRUl3?=
 =?utf-8?B?a1dXSk4xUklwWjRsNFNTdXUzNmlpdWYyM0QzdWRMWGhILy9lZVU3SWpMbUd1?=
 =?utf-8?B?YTg2SGtFWlpLR2NxajF4ZnY1NjZyYm5hYU4wbjgva1dRM0hyQ3BTWGNQOWND?=
 =?utf-8?B?dzhBOXVWR1dMVmNZMFgzTHlZMmtCL25uVGFZTitQVlh4VUpYakNKZGVHMmJB?=
 =?utf-8?B?c0hBQVQ3di9EUFRKdjg3Y2xLaTV3blRkdTgydDBNZ3k3bE9iWU5wTWo1ZzIy?=
 =?utf-8?B?QXgxU1c4NDVlUFZFS2loMksvblRWWEVYczZvQ2JvZnA0bk40NTl3eGFEL2M3?=
 =?utf-8?B?OFBybDhHblMrQzloTGxITUttN3hvMkMrZGlYTkRLQ0l1ejNqaVJmdXQ4Q0Jl?=
 =?utf-8?B?eXRnclA2Q1JJRmxCUkd6UXNzRGoyRHlRK1VXYnZLQWs0S29TdEY2cjN0RU51?=
 =?utf-8?B?RGg2ay82WWlSV1Z2N0NhWWxodzloaloyVEVaSmFMMGtJdWNCQWdSV3dCSVE3?=
 =?utf-8?B?bURtQ2xYOXBmU1p1ekFxcytMTjcza0o3YWhFeW4xMm1CM3BuL3RIYVdFV1A2?=
 =?utf-8?B?N2syT1hXRzdtUDlKUm9NVE9hMHJlYnRmR1U4aCtSWnhxZlo4bFNCUE9Rc09E?=
 =?utf-8?B?Mzg2ZS90bm50TmJpb3dWWm1Yc3ZFNllZM2g1L0ZkTTE1enczQnRML0FBc0xS?=
 =?utf-8?B?VkUwWEtabWhseUdJWlB1M29uRHJZQ2Z1dkVQSXJYVW1vWGR2YUdLTW1TQytZ?=
 =?utf-8?B?Z3NCa1V3VUhVWjZZcjRESVprZ1pvUEsxRHdTMUJ2MFRBMkFtQkM0cXdpYzlj?=
 =?utf-8?B?cUM4Zk1Pc0lJOVVQQUg4NE44ZHNjSXM3UEtIRHIvQXdqaGhWNTl5dm1QeE5P?=
 =?utf-8?B?Q3JzTGt6dUErdHBkeDVucEpsNHA1YXV6bVc3dzdaNmVIdW9XaGVyTzlaam1Y?=
 =?utf-8?B?N21HUEVjNk04WlpQMTc0RWRtYjk2TmpQaWQrK0YzUlQ2VytlSUlzZjlNb2xH?=
 =?utf-8?B?engrOE0vM3Q3Qmt0MS9DSDk4S1crNkdxWlAwR00zazE4Zm83MXdPVUkxMU9H?=
 =?utf-8?B?djNoZVNxRUhtcHZIbVFOTkE5V0kzNFczdFZDazJmdFZuTjdnOTRCN0VZaVlr?=
 =?utf-8?B?Wi9qN2JiQWdzc2ZuWmdVSmdqRXBOQnVYZGdpNWxmVFh1MWVFcEZJMytZamVw?=
 =?utf-8?B?SG9sRllBTUhoNnNiRkR1dXdqY1pZRGozR2FUMUpsMzZaWkZHT3RFRUVNTWxk?=
 =?utf-8?B?ZlRFb1VOQ1U2OUgzMXlHV2lQUEl0elJGWEVPSDE0b3BlVWFIMUhnRCtkYllU?=
 =?utf-8?B?SVRvSU9jSTVTeEt5RUVIUzRlZnR5bUFVNlJwcm1WN2JSZ1BqS1ZMd2xEdFZz?=
 =?utf-8?B?dUpmbENXU2Z2bHZEeTB2bjl2cysyYjlPVk5ONlErYzNweWpHQmExUTUxZFV4?=
 =?utf-8?B?b09YMmlrUEZsVWlQcVBiSXdQZVdaMnRpTjV2dVNpSmJQSUl5NVN0a3FIQ0Rm?=
 =?utf-8?B?WWVuR2wxSjU5Nmdncm4xNWVmenJvdmttRDVuODhuSDBjSG83SUlQeGlUUjZ4?=
 =?utf-8?B?M3dzKzdDS0prdVNtZUkveU12MjYxWHorN295dVh1QllzTWNHOWZCTVZJQTVN?=
 =?utf-8?B?b0ZvZDJZUmptUjZFaCswSy8zTEFzWmtNNW52VkV2R05FcTJvNmt5aldMSnJI?=
 =?utf-8?B?NXJnZlVxMzJZK3BhSEdEUEkrRGtDd3FiL3U0eHNjZW4yUWI2OTFsR3Q3MkUv?=
 =?utf-8?B?TEdONTFzWjAzSHkwaGxJaVMwaHoweHlQZnlYeWpBSFFIUUs4cWhVTElYTFMz?=
 =?utf-8?B?MDJHTk1STlFEbWZFSjNPbmw1NmFiSDFvVlBQS3RDYnA2VEI2Vkh2QnUyazVO?=
 =?utf-8?B?a1cvbzloZ3l4OXREWHRSYW1XUEt3Zno3Sm0yVS9NcXlaTDFLMG8xcWUvSDk3?=
 =?utf-8?B?YlN5Q21oRnhBYzRXdFZlM0pnZGNCMlFRMFg5Z2NjMENlNVNkZ0NiVVBtVTZE?=
 =?utf-8?B?TzRkMTVkVkF3RVVjSFFSYkpNR3c2WHY4MFFWYnpHaHpPUmNBY3VUVDFXUFFC?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2031055-c225-42b7-581c-08dd5004bf73
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 10:12:28.2326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ND9lNIb1+RIRCoaFZQxmleeFXMUYCFUilpG6xCMslts2oVPImYel7t0qzON0EQjFA24U3TiC0m7j/b6VG02Plg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4998
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

Hi Jeevan

On 10-02-2025 04:06 pm, Jeevan B wrote:
> Ensure all outputs are checked before skipping the test, preventing
> premature exits when an eDP is available later.
>
> v2: Optimized eDP detection by merging loops.
Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

If this patch is fixing some existing bug, please add "closes" tag.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 40 ++++++++++++++++++++++++----------------
>   1 file changed, 24 insertions(+), 16 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 9551cc6b9..bbb29d7d9 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -640,30 +640,38 @@ static void test_deep_pkgc_state(data_t *data)
>   	time_t delay;
>   	enum pipe pipe;
>   	bool pkgc_flag = false;
> -	bool flip = true;
> +	bool flip = true, edp_found = false;
>   
>   	igt_display_t *display = &data->display;
>   	igt_plane_t *primary;
>   	igt_output_t *output = NULL;
>   
>   	for_each_pipe_with_valid_output(display, pipe, output) {
> -		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> -			igt_skip("No eDP output found, skipping the test.\n");
> -		/* Check VRR capabilities before setting up */
> -		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
> -		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
> -			/*
> -			 * TODO: Add check for vmin = vmax = flipline if VRR enabled
> -			 * when KMD allows for such capability.
> -			 */
> -			igt_pipe_set_prop_value(display, pipe,
> -						IGT_CRTC_VRR_ENABLED, false);
> -			igt_assert(igt_display_try_commit_atomic(display,
> -								 DRM_MODE_ATOMIC_ALLOW_MODESET,
> -								 NULL) == 0);
> -			break;
> +		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +
> +			edp_found = true;
> +			/* Check VRR capabilities before setting up */
> +			if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
> +			    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
> +				/*
> +				 * TODO: Add check for vmin = vmax = flipline if VRR enabled
> +				 * when KMD allows for such capability.
> +				 */
> +				igt_pipe_set_prop_value(display, pipe,
> +							IGT_CRTC_VRR_ENABLED, false);
> +				igt_assert(igt_display_try_commit_atomic(display,
> +									 DRM_MODE_ATOMIC_ALLOW_MODESET,
> +									 NULL) == 0);
> +			}
> +		break;
>   		}
>   	}
> +
> +	if (!edp_found) {
> +		igt_skip("No eDP output found, skipping the test.\n");
> +		return;
> +	}
> +
>   	igt_display_reset(display);
>   
>   	igt_output_set_pipe(output, pipe);

