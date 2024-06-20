Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2E8C2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E8B10E2FE;
	Thu, 20 Jun 2024 23:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJ1kf+dZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD4910E2FE
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718925656; x=1750461656;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=omtRwDJ6QZe+ZiMPUa1XUGGymfYP0NBF204aP6cIC8E=;
 b=mJ1kf+dZ0DXeT3FW3qdcPmt+nTIRiszIYeLOZZpHWMuNkfNIwQS2hV9A
 HXTzgsXV+bLx9axCx+mbXfSzNPP9W6rt5vbmXLPFNHuIIDYsRR+jGopqo
 TZj72ni2hQ1F+9aCSeDTZ6qAtA112ozxSdW811xv8cOQqUSpy5Qj7RyNJ
 nK1ufZLIjoRSVBJ4xyjZTcJfZe3BGtLu1Yc78Ha7W3fN2V6x2xjnOIBgW
 5py8J+rOW878i8zdIHsFfq/t9ntGM46FS4zwPhJEUyBb+RRRVNZhswsD/
 uqcirzCwJ4Is5T3w7mGqUuF+cXVm7YkREZuO69igoA8a0qxTwR1pQSkTP g==;
X-CSE-ConnectionGUID: ON2u190xT0+8l8kRobpa+Q==
X-CSE-MsgGUID: l/kbPLycTBevFCcLY2CRjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="26628436"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="26628436"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:20:55 -0700
X-CSE-ConnectionGUID: PdJIvgSzQDy1o0ZGihVFZQ==
X-CSE-MsgGUID: rrftxHVuQqelRquIQJu+aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="42223918"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:20:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:20:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:20:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:20:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V38Le5T5vOaEwdBaMZdtx1/E2MU+vZdB6gNcPreuatijR3z66GanFaZJqFfsqjBbjT6zxOP/0SUefCPV0YAjknxqv0KQbfKWsWTB/FXcQTGlgEywOG9lcZqqCy/xbVgBiLtHRDft+vfHYOtO9GprgZUsZqA0A2ubOYJ3FZ1kZrkK+bVhGAW0oHD0glkT+fGvKLMgCLgyTfgi3dhYjD+r127m+0QnEYgqHuCkc2tpcXXBH6iAIebo/icw5/3c9Oas+W/Uv8T8ZOVyo3qvujMZYp3RgTC3zG3FnUjcwK+3xhJDHyg61db2U3y5sIycdCJlQgjdrUFKmbXlx4K+huXSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnyx4EOcziS7Lta53AEVtQ/Iy3/JCHTfaxtx2rG2hW4=;
 b=Q2s9RCMLwrzM2Pdos3s2iLKVWZ0mBSNN7U5k7qVdPZRrK6DePNgcjhB6CYx/EmY3wV3HbKmwOFkycubvDBMDTJC37yIs6oJ9ik9FJwCqtnyJo0uVf/l7fWvGYomN9xQ/OU9xdsYxz8K83weE/Yx98fCQUxGaQPZXGLhnrPzR5rdnqJxi6Hd7XLtx2Uz+MlC59r56hf8w1eNtMu6OBfoHiBptyEFKPr3git2vr55sGSB+sBOc4ImEnBYVIJEtgEJA83snTK/L6UxqeqGJPaBfL1gz1Zh9XcPDrcvk2Txrx9BxseuMKZ4QN/slU4KE6IYFvermDP8xXx7aSlg9Isy0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW5PR11MB5858.namprd11.prod.outlook.com (2603:10b6:303:193::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 23:20:49 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:20:48 +0000
Date: Thu, 20 Jun 2024 16:20:47 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 15/28] tests/intel/xe_oa: blocking and polling tests
Message-ID: <ZnS5T5C4NvbsLlxG@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-16-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-16-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:303:2a::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW5PR11MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: b4492d59-73e6-4d14-069e-08dc917f9e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3VsSHY0U3dIdytoc3lvdzVCb0MwblBDc3ZiaUhDZ2FLT2diMFcvR1c0Y3ZX?=
 =?utf-8?B?RlozMHRsMzhZNjllMG1hamtSVndrd013VDVHYVdTc1VJbjJGZ3NpMkNuMjMy?=
 =?utf-8?B?L1luNEVYTVhPOTJSOWMvM3FML055TjF5cGdmTkhZOE13MStHbGVkWmg2QkV1?=
 =?utf-8?B?bWtpMnFBZGpJQkdQNnRKMVdCeDZ0WDlnWlRJb0V6dE1GcDlERGFYdUdNTGc2?=
 =?utf-8?B?MU1IZk8vN1hIWGF5ZlVqSExEOFV4QlVMN3RVcWZ0a0JZanFscmxrVXRLMlB1?=
 =?utf-8?B?VjY2NExmQkd2SHRjd3U0aDkzMHM3eE04UVB6MnhBdUE3bkZVOWltckowdkY0?=
 =?utf-8?B?TzNTdDBIRnBnK1lvKzUzWVhMOGxrN0c0Z0R0NjQ5U0ZPK0NDZytEaXdhcHhX?=
 =?utf-8?B?d2hUaXRtMTF4akpYN3ZiZURQOHFFdTJHVXZrQXoycEZ4R3R1VEdwYjRFdmIy?=
 =?utf-8?B?anZpNTdpR1grZnRpMlUzU2pwTkh3dE92UmRnYzViYTZyQ05TZkFyK0hGaGpK?=
 =?utf-8?B?WDdFeXhkdlEzYzRHYXVtaTBDNlV1NFJMKzQ3Y1dsNzlKeUlnM1JZTU1teWhC?=
 =?utf-8?B?Y01CR20zeVZwSStiVGZqM21XT1FGN1ZPZTV6cVlLNjVYdk00SmJ4V1JiS3kv?=
 =?utf-8?B?RjJMMi9ZZ1hTUllzMGhaak4vUGpzRVhMN2pPU1k2d2JZbTlNRzR1WG9JWGdl?=
 =?utf-8?B?UTRIR3ljUTcrc0xTSjY5M2JxdHRhVWUwa1RoQ3pSSEoxUExmYWhwWkN3dW45?=
 =?utf-8?B?NWRqSW9tQzA1YjNTZGlqZ0F4ZHhkU0RRdWVCN1JlV3BJcG1yRDF4WkNKMXhI?=
 =?utf-8?B?a0tGSmY2T3hMS0QyZTdHayt1TUFBd3FJTGVLUldDRTcvM2s3aUtBanZwN0Mz?=
 =?utf-8?B?clg1bDcxYThaNEFUcFJZbTMvRlc3b285bnBoeWFPZE42WEQ1cjJOa3BJa1A0?=
 =?utf-8?B?djl3M1NYYy94ZkN6OEhoeVBzNW12QTNrOGFBcHRFY0ZOWWZkdEc3R3FrR3Vq?=
 =?utf-8?B?eklkQk9tNzN1WDZMUEphb2w1aDNSSGk5QWJ1K2VqN21MODloQW1uOWhtV0dJ?=
 =?utf-8?B?Zmo3Vk9ZSXJham1JSlVjUUttbGRsY28zdmQ5QUZ0VjkxYUFrNDVpYTdXb0Rw?=
 =?utf-8?B?RDhxcGVWaVBPWmYvRmNKbGNCSGp2dlRpb3pjclpEYUI2azNKc3RDemJvbnBx?=
 =?utf-8?B?TGFITjhvOFJZY2hzN2EwaU0rTHRtN2ptZWUvcE1nVC9GaVlRWEhpdUcyQ0Zu?=
 =?utf-8?B?Z1FrS3E4MTBhZFFqM2pGSkdqZ3ZKeFd2a09mU0pjQ0xYVk8wK0V4ajN0RDIw?=
 =?utf-8?B?RlphVmRTT3FYajdwMVRkSXZNdFhFcWNqS0xQN0hjNzJaTWN0eE5LaExKUFND?=
 =?utf-8?B?ZDU5ejh1cit1RXRDTGdJRGl5NHZEZW5DTDA3eE1YR3ZBbm1VMVJGNjJTbXFr?=
 =?utf-8?B?bTVjR3pobkpodkJJYUFhUzFqa3hocGg1Vlp3RTJaZStvU2JjMi9Oa0kwWXlq?=
 =?utf-8?B?WHJsQlcvd0hvV0V0dUUxSXdQK0dVY295TDlvWHVQNEhPS2ZhZHJWSHFYdU5H?=
 =?utf-8?B?bEpVYWwyNHhnZVNjYjFlU21iMEVnSWEvR0VYdEt3S3JsOVBZT0JFbVNrRTlp?=
 =?utf-8?B?SnlGdU5GYnNVUENqU25xcFYxcUdqSDVNK2VaZjdCZkU5Q09hTGVEMHRBaXJ3?=
 =?utf-8?B?NGFnYkVJVGxlZjFaOE52OEllZUU4U1YxaXZOSmc2TEkzMEVMQzd6UGVoWlc0?=
 =?utf-8?Q?1VCbp9mZFOJO5csCoSROBLfsJwtnGs+uDuumJx2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWNFd2tLL0ZrZk1yRDZUN0tEWnpiYXNPSXZIWkp6UXZocWlaRnFXdE5HYks4?=
 =?utf-8?B?SU52VS82UVlDcGZNWGo0M1Y2TllvUGo5b2s2RnAvS0ZyVDN4QlMyQmNTNDEw?=
 =?utf-8?B?STJCeXdCbUlFcHQwVUM4Q1JyZmFNa2hVc1RnV2Iyd1BSaS9yQVVZSUxvZ0RH?=
 =?utf-8?B?R2x4SWc5UXN3WVpTVnBjVWpSR2xjbWZqTnZCSlFSZk5Ob0NkeGxhWThDTXgw?=
 =?utf-8?B?YkVZSVJRR2VObVFzTDNXMEVvSWdIcmZXZTc4Qm03d1lWMWtGazAydE1aQ0ln?=
 =?utf-8?B?dmtWUVBrVnlEOWRqNm43TldacmR1d2JVYldhUThHVUZnbXBvZXJYQ0N1cXMy?=
 =?utf-8?B?UU84UHB6VzNLQWlES1lMbkE2c2hMMlhpcTNsSHBjUHFlK01qOU9JaEZyaGM0?=
 =?utf-8?B?VVpYM25CdjBQRDY5WElnSVpDdzArYmRQS1J1NGx1T2I2ZjRSdGRFV3BBQ2xy?=
 =?utf-8?B?Ukp6R2F0aTRmOGlRSGZ2anE0ek5FZHhDbTNXU3pqbzhGZHk5YWNoUmVpZ3Fx?=
 =?utf-8?B?SitxZkFyeVBWeGg3WGIrcXdPODVYd1hiT0tGRldlRHBCWUhGeGNiZEVYUGR4?=
 =?utf-8?B?Sit5RnQ0ZTNOeEU2Vk11SjlRK294ZWtydGZxVG0wWHFRUXFVbzdSVUtJTFZR?=
 =?utf-8?B?NHk1VXpWbmcvdnlnM1pOMkFQNXQ3WWhXUThVbzdDd1p1UThxTTBueXY5ekV5?=
 =?utf-8?B?emVzMWYrMmZqMHl3cDNqNDh1RE9wZXlNQW16N0cxU3RxV2VNZ0dia2hNam5W?=
 =?utf-8?B?bHpOVzFEVkRQaEtxVWljTnh6TEFEWTRBSlVUVCtuS2ExRTIzT1gwZWJNTjJs?=
 =?utf-8?B?L3VCUmtrQURabUo4cHNkaFhqMmVLTElvRmk4T2o5VDhKakl1VGNLVHNOT2lj?=
 =?utf-8?B?YmRnMXV6ekdWTWdnYmZhTEkwR1J6MHlidk85Y3lsMnBHVzNLYTZRS1hMbXY0?=
 =?utf-8?B?cDdSR1Y5OFlrdDNRajRzanc5SkNjZ0o4bE0zYXpJdGVmS3VqbExKNmFyU0JC?=
 =?utf-8?B?WWwyS0JsUTNCNXg2WjJrY0VPM0VCWjZhNEZESkZCMlNhTk5yZk9PaG1ZSUV6?=
 =?utf-8?B?WnBxeW4vOURYbURwK0tKRUVQSklGaEExcGpMOUVSeHYyOEo2NVV6em5BRW1j?=
 =?utf-8?B?UHVpS0dpTHRFbzh0SkNFZWo0TEtnVHdhRXowbFBISnFRQzRYTkJUYTF6S0R1?=
 =?utf-8?B?QVhpWEtUNlRZa3JsS2YxM2xBbGFBOTRJbDNMaThidm42MmhLL0FZVWdxQ01t?=
 =?utf-8?B?TnhkRXV5VTBBQks2MHV6ZWJPa21kayt3TkJ6bUtHOCt2V3cxbFJtMlVNeGlG?=
 =?utf-8?B?SVIvbUUrc2VsUzZDclFmU0Z1Tk9NU3Erdi8vaVVVNFF1bmNZOW4xK3hROEFq?=
 =?utf-8?B?alZncU5vUExJclFJTzhmUmFTYnpseDhFQmdXR3prVGJjaE1JcktURDQ1Mit1?=
 =?utf-8?B?ZnhNNDdNS1NEam9XZ2pIUEpLWFFIOFpROVJLQnBBSEtPdkNaMDJuNmsyMkRv?=
 =?utf-8?B?RUg5UEVycytZc0xRbGkvM29WRWdJRGRDQUJWa3BMMEpiRmZRS0Z5Ynh2S1Q0?=
 =?utf-8?B?cEdTd0lOVVh0emFtZWtFcmljaGdNdTM3U0MvaHFqOGtjZmZDWS92dUNaTEl1?=
 =?utf-8?B?UmR2ODRPb25QM1ZxQ3IvN2I1eEF4cWFzTVRrZTdVZ0JtaUVXRFpqS1IwNVY2?=
 =?utf-8?B?Uk5RL0xzYnRmOFJuV2c1eVlJOTkzZDcvcE1hY09mTHJxalZmbU1IMmYzaG9l?=
 =?utf-8?B?TWR0N0RRUHUzMzFMZGIwU3dDYk5DbWpuTCtNYlFhaDdPdWlMMzFrMC8vUEhl?=
 =?utf-8?B?a21ZTXFTVEZ3TFlteGc5b0JMaE9SYXFTQUJrYWY1WndqYnJwMUQvUGg0WExm?=
 =?utf-8?B?NGdQMjQ4Z28ySkF0S3MwYTlRR3ltWU00bVhlQkRzd29rREhvMkJIdXNvd0Vl?=
 =?utf-8?B?OGFOSEhYOTZDUy9DTXMzYlRBQkRtMWhBQjlONjkvcEMxWlJJVSsyMS9KanUw?=
 =?utf-8?B?ei83dXhHbGtxcmpqbHpxK3NpTUV5bStnd2hLUTlic2JzQXlQdzlTNENQQlJG?=
 =?utf-8?B?Z2JPMDF5bkMyMlUwQjRCWnIzVW1IZjdOc2F5cmdnMTl4Z2VTQm9vWDJranln?=
 =?utf-8?B?V1JFZ1YvcEVVNFJjdFZ0cHBrYWYyVjVZY0ZpV0w4MEFrSS82MlNycnJXdWRI?=
 =?utf-8?Q?FX566UQnkCQIDcopfUUEiFQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4492d59-73e6-4d14-069e-08dc917f9e9d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:20:48.8835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPpDeUBptyCNi2yd+Vik16rSQMqJS1EKRJZly7tco4o5/P9QqO/pSBRh/PE7rzOs+cLjtDL7lD4S7dKFKQ0Icxoo+QALELBgEXgRX8TlnRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5858
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

On Thu, Jun 20, 2024 at 01:00:40PM -0700, Ashutosh Dixit wrote:
>"blocking", "polling" and "polling-small-buf".
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 463 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 463 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 50f6d14670..d7f00e78b9 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -431,6 +431,24 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
> 	return hwe;
> }
>
>+static char *
>+pretty_print_oa_period(uint64_t oa_period_ns)
>+{
>+	static char result[100];
>+	static const char *units[4] = { "ns", "us", "ms", "s" };
>+	double val = oa_period_ns;
>+	int iter = 0;
>+
>+	while (iter < (ARRAY_SIZE(units) - 1) &&
>+	       val >= 1000.0f) {
>+		val /= 1000.0f;
>+		iter++;
>+	}
>+
>+	snprintf(result, sizeof(result), "%.3f%s", val, units[iter]);
>+	return result;
>+}
>+
> static void
> __perf_close(int fd)
> {
>@@ -1721,6 +1739,432 @@ static void test_invalid_oa_exponent(void)
> 	}
> }
>
>+static int64_t
>+get_time(void)
>+{
>+	struct timespec ts;
>+
>+	clock_gettime(CLOCK_MONOTONIC, &ts);
>+
>+	return ts.tv_sec * 1000000000 + ts.tv_nsec;
>+}
>+
>+/**
>+ * SUBTEST: blocking
>+ * Description: Test blocking reads
>+ */
>+/* Note: The interface doesn't currently provide strict guarantees or control
>+ * over the upper bound for how long it might take for a POLLIN event after
>+ * some OA report is written by the OA unit.
>+ *
>+ * The plan is to add a property later that gives some control over the maximum
>+ * latency, but for now we expect it is tuned for a fairly low latency
>+ * suitable for applications wanting to provide live feedback for captured
>+ * metrics.
>+ *
>+ * At the time of writing this test the driver was using a fixed 200Hz hrtimer
>+ * regardless of the OA sampling exponent.
>+ *
>+ * There is no lower bound since a stream configured for periodic sampling may
>+ * still contain other automatically triggered reports.
>+ *
>+ * What we try and check for here is that blocking reads don't return EAGAIN
>+ * and that we aren't spending any significant time burning the cpu in
>+ * kernelspace.
>+ */
>+static void test_blocking(uint64_t requested_oa_period,
>+			  bool set_kernel_hrtimer,
>+			  uint64_t kernel_hrtimer,
>+			  const struct drm_xe_engine_class_instance *hwe)
>+{
>+	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
>+	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
>+	uint64_t props[DRM_XE_OA_PROPERTY_MAX * 2];
>+	uint64_t *idx = props;
>+	struct intel_xe_oa_open_prop param;
>+	uint8_t buf[1024 * 1024];
>+	struct tms start_times;
>+	struct tms end_times;
>+	int64_t user_ns, kernel_ns;
>+	int64_t tick_ns = 1000000000 / sysconf(_SC_CLK_TCK);
>+	int64_t test_duration_ns = tick_ns * 100;
>+	int max_iterations = (test_duration_ns / oa_period) + 2;
>+	int n_extra_iterations = 0;
>+	int perf_fd;
>+
>+	/* It's a bit tricky to put a lower limit here, but we expect a
>+	 * relatively low latency for seeing reports, while we don't currently
>+	 * give any control over this in the api.
>+	 *
>+	 * We assume a maximum latency of 6 millisecond to deliver a POLLIN and
>+	 * read() after a new sample is written (46ms per iteration) considering
>+	 * the knowledge that that the driver uses a 200Hz hrtimer (5ms period)
>+	 * to check for data and giving some time to read().
>+	 */
>+	int min_iterations = (test_duration_ns / (oa_period + kernel_hrtimer + kernel_hrtimer / 5));
>+	int64_t start, end;
>+	int n = 0;
>+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
>+
>+	ADD_PROPS(props, idx, SAMPLE_OA, true);
>+	ADD_PROPS(props, idx, OA_METRIC_SET, test_set->perf_oa_metrics_set);
>+	ADD_PROPS(props, idx, OA_FORMAT, __ff(test_set->perf_oa_format));
>+	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
>+	ADD_PROPS(props, idx, OA_DISABLED, true);
>+	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
>+	ADD_PROPS(props, idx, OA_ENGINE_INSTANCE, hwe->engine_instance);
>+
>+	param.num_properties = (idx - props) / 2;
>+	param.properties_ptr = to_user_pointer(props);
>+
>+	perf_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>+        set_fd_flags(perf_fd, O_CLOEXEC);
>+
>+	times(&start_times);
>+
>+	igt_debug("tick length = %dns, test duration = %"PRIu64"ns, min iter. = %d,"
>+		  " estimated max iter. = %d, oa_period = %s\n",
>+		  (int)tick_ns, test_duration_ns,
>+		  min_iterations, max_iterations,
>+		  pretty_print_oa_period(oa_period));
>+
>+	/* In the loop we perform blocking polls while the HW is sampling at
>+	 * ~25Hz, with the expectation that we spend most of our time blocked
>+	 * in the kernel, and shouldn't be burning cpu cycles in the kernel in
>+	 * association with this process (verified by looking at stime before
>+	 * and after loop).
>+	 *
>+	 * We're looking to assert that less than 1% of the test duration is
>+	 * spent in the kernel dealing with polling and read()ing.
>+	 *
>+	 * The test runs for a relatively long time considering the very low
>+	 * resolution of stime in ticks of typically 10 milliseconds. Since we
>+	 * don't know the fractional part of tick values we read from userspace
>+	 * so our minimum threshold needs to be >= one tick since any
>+	 * measurement might really be +- tick_ns (assuming we effectively get
>+	 * floor(real_stime)).
>+	 *
>+	 * We Loop for 1000 x tick_ns so one tick corresponds to 0.1%
>+	 *
>+	 * Also enable the stream just before poll/read to minimize
>+	 * the error delta.
>+	 */
>+	start = get_time();
>+	do_ioctl(perf_fd, DRM_XE_PERF_IOCTL_ENABLE, 0);
>+	for (/* nop */; ((end = get_time()) - start) < test_duration_ns; /* nop */) {
>+		bool timer_report_read = false;
>+		bool non_timer_report_read = false;
>+		int ret;
>+
>+		while ((ret = read(perf_fd, buf, sizeof(buf))) < 0 &&
>+		       (errno == EINTR || errno == EIO))
>+			;
>+		igt_assert(ret > 0);
>+
>+		for (int offset = 0; offset < ret; offset += format_size) {
>+			uint32_t *report = (void *)(buf + offset);
>+
>+			if (oa_report_is_periodic(oa_exponent, report))
>+				timer_report_read = true;
>+			else
>+				non_timer_report_read = true;
>+		}
>+
>+		if (non_timer_report_read && !timer_report_read)
>+			n_extra_iterations++;
>+
>+		n++;
>+	}
>+
>+	times(&end_times);
>+
>+	/* Using nanosecond units is fairly silly here, given the tick in-
>+	 * precision - ah well, it's consistent with the get_time() units.
>+	 */
>+	user_ns = (end_times.tms_utime - start_times.tms_utime) * tick_ns;
>+	kernel_ns = (end_times.tms_stime - start_times.tms_stime) * tick_ns;
>+
>+	igt_debug("%d blocking reads during test with %"PRIu64" Hz OA sampling (expect no more than %d)\n",
>+		  n, NSEC_PER_SEC / oa_period, max_iterations);
>+	igt_debug("%d extra iterations seen, not related to periodic sampling (e.g. context switches)\n",
>+		  n_extra_iterations);
>+	igt_debug("time in userspace = %"PRIu64"ns (+-%dns) (start utime = %d, end = %d)\n",
>+		  user_ns, (int)tick_ns,
>+		  (int)start_times.tms_utime, (int)end_times.tms_utime);
>+	igt_debug("time in kernelspace = %"PRIu64"ns (+-%dns) (start stime = %d, end = %d)\n",
>+		  kernel_ns, (int)tick_ns,
>+		  (int)start_times.tms_stime, (int)end_times.tms_stime);
>+
>+	/* With completely broken blocking (but also not returning an error) we
>+	 * could end up with an open loop,
>+	 */
>+	igt_assert(n <= (max_iterations + n_extra_iterations));
>+
>+	/* Make sure the driver is reporting new samples with a reasonably
>+	 * low latency...
>+	 */
>+	igt_assert(n > (min_iterations + n_extra_iterations));
>+
>+	if (!set_kernel_hrtimer)
>+		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
>+
>+	__perf_close(perf_fd);
>+}
>+
>+/**
>+ * SUBTEST: polling
>+ * Description: Test polled reads
>+ */
>+static void test_polling(uint64_t requested_oa_period,
>+			 bool set_kernel_hrtimer,
>+			 uint64_t kernel_hrtimer,
>+			 const struct drm_xe_engine_class_instance *hwe)
>+{
>+	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
>+	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
>+	uint64_t props[DRM_XE_OA_PROPERTY_MAX * 2];
>+	uint64_t *idx = props;
>+	struct intel_xe_oa_open_prop param;
>+	uint8_t buf[1024 * 1024];
>+	struct tms start_times;
>+	struct tms end_times;
>+	int64_t user_ns, kernel_ns;
>+	int64_t tick_ns = 1000000000 / sysconf(_SC_CLK_TCK);
>+	int64_t test_duration_ns = tick_ns * 100;
>+
>+	int max_iterations = (test_duration_ns / oa_period) + 2;
>+	int n_extra_iterations = 0;
>+
>+	/* It's a bit tricky to put a lower limit here, but we expect a
>+	 * relatively low latency for seeing reports.
>+	 *
>+	 * We assume a maximum latency of kernel_hrtimer + some margin
>+	 * to deliver a POLLIN and read() after a new sample is
>+	 * written (40ms + hrtimer + margin per iteration) considering
>+	 * the knowledge that that the driver uses a 200Hz hrtimer
>+	 * (5ms period) to check for data and giving some time to
>+	 * read().
>+	 */
>+	int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
>+	int64_t start, end;
>+	int n = 0;
>+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
>+
>+	ADD_PROPS(props, idx, SAMPLE_OA, true);
>+	ADD_PROPS(props, idx, OA_METRIC_SET, test_set->perf_oa_metrics_set);
>+	ADD_PROPS(props, idx, OA_FORMAT, __ff(test_set->perf_oa_format));
>+	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
>+	ADD_PROPS(props, idx, OA_DISABLED, true);
>+	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
>+	ADD_PROPS(props, idx, OA_ENGINE_INSTANCE, hwe->engine_instance);
>+
>+	param.num_properties = (idx - props) / 2;
>+	param.properties_ptr = to_user_pointer(props);
>+
>+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>+	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
>+
>+	times(&start_times);
>+
>+	igt_debug("tick length = %dns, oa period = %s, "
>+		  "test duration = %"PRIu64"ns, min iter. = %d, max iter. = %d\n",
>+		  (int)tick_ns, pretty_print_oa_period(oa_period), test_duration_ns,
>+		  min_iterations, max_iterations);
>+
>+	/* In the loop we perform blocking polls while the HW is sampling at
>+	 * ~25Hz, with the expectation that we spend most of our time blocked
>+	 * in the kernel, and shouldn't be burning cpu cycles in the kernel in
>+	 * association with this process (verified by looking at stime before
>+	 * and after loop).
>+	 *
>+	 * We're looking to assert that less than 1% of the test duration is
>+	 * spent in the kernel dealing with polling and read()ing.
>+	 *
>+	 * The test runs for a relatively long time considering the very low
>+	 * resolution of stime in ticks of typically 10 milliseconds. Since we
>+	 * don't know the fractional part of tick values we read from userspace
>+	 * so our minimum threshold needs to be >= one tick since any
>+	 * measurement might really be +- tick_ns (assuming we effectively get
>+	 * floor(real_stime)).
>+	 *
>+	 * We Loop for 1000 x tick_ns so one tick corresponds to 0.1%
>+	 *
>+	 * Also enable the stream just before poll/read to minimize
>+	 * the error delta.
>+	 */
>+	start = get_time();
>+	do_ioctl(stream_fd, DRM_XE_PERF_IOCTL_ENABLE, 0);
>+	for (/* nop */; ((end = get_time()) - start) < test_duration_ns; /* nop */) {
>+		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
>+		bool timer_report_read = false;
>+		bool non_timer_report_read = false;
>+		int ret;
>+
>+		while ((ret = poll(&pollfd, 1, -1)) < 0 && errno == EINTR)
>+			;
>+		igt_assert_eq(ret, 1);
>+		igt_assert(pollfd.revents & POLLIN);
>+
>+		while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 &&
>+		       (errno == EINTR || errno == EIO))
>+			;
>+
>+		/* Don't expect to see EAGAIN if we've had a POLLIN event
>+		 *
>+		 * XXX: actually this is technically overly strict since we do
>+		 * knowingly allow false positive POLLIN events. At least in
>+		 * the future when supporting context filtering of metrics for
>+		 * Gen8+ handled in the kernel then POLLIN events may be
>+		 * delivered when we know there are pending reports to process
>+		 * but before we've done any filtering to know for certain that
>+		 * any reports are destined to be copied to userspace.
>+		 *
>+		 * Still, for now it's a reasonable sanity check.
>+		 */
>+		if (ret < 0)
>+			igt_debug("Unexpected error when reading after poll = %d\n", errno);
>+		igt_assert_neq(ret, -1);
>+
>+		/* For Haswell reports don't contain a well defined reason
>+		 * field we so assume all reports to be 'periodic'. For gen8+
>+		 * we want to to consider that the HW automatically writes some
>+		 * non periodic reports (e.g. on context switch) which might
>+		 * lead to more successful read()s than expected due to
>+		 * periodic sampling and we don't want these extra reads to
>+		 * cause the test to fail...
>+		 */
>+		for (int offset = 0; offset < ret; offset += format_size) {
>+			uint32_t *report = (void *)(buf + offset);
>+
>+			if (oa_report_is_periodic(oa_exponent, report))
>+				timer_report_read = true;
>+			else
>+				non_timer_report_read = true;
>+		}
>+
>+		if (non_timer_report_read && !timer_report_read)
>+			n_extra_iterations++;
>+
>+		/* At this point, after consuming pending reports (and hoping
>+		 * the scheduler hasn't stopped us for too long) we now expect
>+		 * EAGAIN on read. While this works most of the times, there are
>+		 * some rare failures when the OA period passed to this test is
>+		 * very small (say 500 us) and that results in some valid
>+		 * reports here. To weed out those rare occurences we assert
>+		 * only if the OA period is >= 40 ms because 40 ms has withstood
>+		 * the test of time on most platforms (ref: subtest: polling).
>+		 */
>+		while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 &&
>+		       (errno == EINTR || errno == EIO))
>+			;
>+
>+		if (requested_oa_period >= 40000000) {
>+			igt_assert_eq(ret, -1);
>+			igt_assert_eq(errno, EAGAIN);
>+		}
>+
>+		n++;
>+	}
>+
>+	times(&end_times);
>+
>+	/* Using nanosecond units is fairly silly here, given the tick in-
>+	 * precision - ah well, it's consistent with the get_time() units.
>+	 */
>+	user_ns = (end_times.tms_utime - start_times.tms_utime) * tick_ns;
>+	kernel_ns = (end_times.tms_stime - start_times.tms_stime) * tick_ns;
>+
>+	igt_debug("%d non-blocking reads during test with %"PRIu64" Hz OA sampling (expect no more than %d)\n",
>+		  n, NSEC_PER_SEC / oa_period, max_iterations);
>+	igt_debug("%d extra iterations seen, not related to periodic sampling (e.g. context switches)\n",
>+		  n_extra_iterations);
>+	igt_debug("time in userspace = %"PRIu64"ns (+-%dns) (start utime = %d, end = %d)\n",
>+		  user_ns, (int)tick_ns,
>+		  (int)start_times.tms_utime, (int)end_times.tms_utime);
>+	igt_debug("time in kernelspace = %"PRIu64"ns (+-%dns) (start stime = %d, end = %d)\n",
>+		  kernel_ns, (int)tick_ns,
>+		  (int)start_times.tms_stime, (int)end_times.tms_stime);
>+
>+	/* With completely broken blocking while polling (but still somehow
>+	 * reporting a POLLIN event) we could end up with an open loop.
>+	 */
>+	igt_assert(n <= (max_iterations + n_extra_iterations));
>+
>+	/* Make sure the driver is reporting new samples with a reasonably
>+	 * low latency...
>+	 */
>+	igt_assert(n > (min_iterations + n_extra_iterations));
>+
>+	if (!set_kernel_hrtimer)
>+		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
>+
>+	__perf_close(stream_fd);
>+}
>+
>+/**
>+ * SUBTEST: polling-small-buf
>+ * Description: Test polled read with buffer size smaller than available data
>+ */
>+static void test_polling_small_buf(void)
>+{
>+	int oa_exponent = max_oa_exponent_for_period_lte(40 * 1000); /* 40us */
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* Include OA reports in samples */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	uint32_t test_duration = 80 * 1000 * 1000;
>+	int sample_size = get_oa_format(default_test_set->perf_oa_format).size;
>+	int n_expected_reports = test_duration / oa_exponent_to_ns(oa_exponent);
>+	int n_expect_read_bytes = n_expected_reports * sample_size;
>+	struct timespec ts = {};
>+	int n_bytes_read = 0;
>+	uint32_t n_polls = 0;
>+
>+	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>+	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
>+	do_ioctl(stream_fd, DRM_XE_PERF_IOCTL_ENABLE, 0);
>+
>+	while (igt_nsec_elapsed(&ts) < test_duration) {
>+		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
>+
>+		ppoll(&pollfd, 1, NULL, NULL);
>+		if (pollfd.revents & POLLIN) {
>+			uint8_t buf[1024];
>+			int ret;
>+
>+			ret = read(stream_fd, buf, sizeof(buf));
>+			if (ret >= 0)
>+				n_bytes_read += ret;
>+		}
>+
>+		n_polls++;
>+	}
>+
>+	igt_info("Read %d expected %d (%.2f%% of the expected number), polls=%u\n",
>+		 n_bytes_read, n_expect_read_bytes,
>+		 n_bytes_read * 100.0f / n_expect_read_bytes,
>+		 n_polls);
>+
>+	__perf_close(stream_fd);
>+
>+	igt_assert(abs(n_expect_read_bytes - n_bytes_read) <
>+		   0.20 * n_expect_read_bytes);
>+}
>+
> /**
>  * SUBTEST: buffer-fill
>  * Description: Test filling, wraparound and overflow of OA buffer
>@@ -2551,6 +2995,25 @@ igt_main
> 		__for_one_hwe_in_oag(hwe)
> 			test_enable_disable(hwe);
>
>+	igt_subtest_with_dynamic("blocking") {
>+		__for_one_hwe_in_oag(hwe)
>+			test_blocking(40 * 1000 * 1000 /* 40ms oa period */,
>+				      false /* set_kernel_hrtimer */,
>+				      5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
>+				      hwe);
>+	}
>+
>+	igt_subtest_with_dynamic("polling") {
>+		__for_one_hwe_in_oag(hwe)
>+			test_polling(40 * 1000 * 1000 /* 40ms oa period */,
>+				     false /* set_kernel_hrtimer */,
>+				     5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
>+				     hwe);
>+	}
>+
>+	igt_subtest("polling-small-buf")
>+		test_polling_small_buf();
>+
> 	igt_subtest("short-reads")
> 		test_short_reads();
>
>-- 
>2.41.0
>
