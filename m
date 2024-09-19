Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923BECF3962
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 17:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5176F10E735;
	Thu, 19 Sep 2024 17:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2az2LSj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F5110E735
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726767389; x=1758303389;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kgmNwxZ3PXqEAlckFpdGNnrF1zldYrJOP/ESo2sQqkQ=;
 b=e2az2LSjVJRpWFS3aydxUYlg4fCImvdrwXmyYvXeguu0J8RKULKYQxKZ
 VGvl6H5QpYxlR9HmOGyPvC6ZlklEhD8v2oAeAJDuzY0r5tJstHIs3PVON
 RCPc/xrHE6u35Eqt9pX2FvTeUfxMzhaIeJBrWVCK7yIfsu1r2z4a0h7IZ
 ScM8dZDr5suZ9c31IBtb4/ytHbtV6c0PEbycba1gh+bHWaTBPr5zNl0Nu
 czspcTxMEAL3A4WfGT9o2dg8W4R9+K5qFFMTY3EGMEpBkSIx1W6vCu071
 2vRBhJcnRfhCIltfqafEHGA75uahZqJhm6JacHwEEAYTmxd+MtrVwepax Q==;
X-CSE-ConnectionGUID: bYBs4cVfS7KRzit+mtHFxw==
X-CSE-MsgGUID: F0qww+4CQAyjLo6CN5RSPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25896567"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="25896567"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 10:35:41 -0700
X-CSE-ConnectionGUID: PHLioqHjTL+lDaQhaPOHlQ==
X-CSE-MsgGUID: F0UPgHuKQn+F84dLby/1Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="74368947"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 10:35:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 10:35:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 10:35:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 10:35:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqeYCmLfWdyucdrXB4OH20MXdXw5pmB4pnBI9SCbDCTsYckDWQPUnqRWg21zcT59BpyQVaYEkhLnO8JFiT0xxKv8QS1F7fk8eACjc2jAtngJfX/RqzpMcFrDDMdQ2jS/wI++HCvA1KBvWE8EX2k5YryOc9SvBpBmXvGKTErqZT0Y9cUN2xnC4EjK6wlW8G02RJdVqB4SQeeWj48bBH2PbYUlmNJP7wy8XB1q9eW+clrIKQKDo+YFak9qKP3mCm3mdoY9NY0G/V54MdVJp0X5VHHLvTzcfihozkzB8dxYfjnIuNqLaHZ0U4BA8E7PkvZhkH3+m7SwXL70Q9T7t493Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3wq/Pmc1hESOzI0NZWFPNvdy2uueOT2rxEWGXENIH4=;
 b=A4lJhpfbrGy9e6H8aumh2wm/3jmhXgXViyZO1MOp3La7uu65I0O17NXxKT6VTRKWKlFhcKp+ULhLwouhzwIDV9PQye3wedrLVNcGIrF5N4WHjojVtDvLMM52llCxfD8Hx/z6D8jtvIe7q9Piq+n8hdM96xeGHuMPFrwSS4aqESjiEhOa/521dzGUJdaeyM/Ow8AF9trZd6Uc7ojeut7Q+fFXrmPEvKeP/uc4h7i0CZrl2mfiaW/P+xhd9qhoIclwa91Wy27yunksgpi70tqIboVjDDWcw/zVMkpm8WjFe/y8XB+Wf+hVY3Bp8Pn88PLA9xrM2z8vFePufVh33DVU9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by LV3PR11MB8484.namprd11.prod.outlook.com (2603:10b6:408:1b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 17:35:38 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 17:35:37 +0000
Message-ID: <c46d382b-094a-455d-b186-30d3e56b40ef@intel.com>
Date: Thu, 19 Sep 2024 23:05:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_psr2_sf: Add eDP check for Early
 Transport
To: <igt-dev@lists.freedesktop.org>
References: <20240919172425.1154937-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <20240919172425.1154937-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|LV3PR11MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: cc160681-b23f-4258-5dca-08dcd8d1795b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFlFUXB2a0ZBeUN4ZWd0RGt2dDJ3dVR5ZTltWEJ6a3RFWGtIbnJaVjBlSzF3?=
 =?utf-8?B?REpZL25vd0M2R3F0YjlTMU8rOTJSZ0hmZDFYRmpOaUd1M3V1eEIzQ1NYZC9r?=
 =?utf-8?B?UmJXQURIbmoza2RaQ01BRnEzTjdsdDJiVjJJRHlLS1FUcmJ3VDl3TXVDTk1j?=
 =?utf-8?B?WDFZY0wzOVZkeDJHdzBBVDdzRW1sWE90OFRDajhwellxSVVuVnFHb1ZDWDZS?=
 =?utf-8?B?UTdRUEd0T1U4czJuUVdHcVJ5b1NzSFVXQjBRMHR1MDhud0xTck12ZXNMYXhw?=
 =?utf-8?B?RnFoUlQ2Rzk4MHZJNC96ZWMyZ3YrYXRFZU5PeFpDNDRvVDNkNTZEd1RHTXpC?=
 =?utf-8?B?Ry9NYU9BTG1sUWJlYy9iYy9GNTlwdDJJRmpERjhUVm5aU2RJVTJrQmllR3V5?=
 =?utf-8?B?NGxCSEVoZzh4TW9GQzBueUhBdkpJL2xIbWpiSHhVVThoSndsa2VFL0tEdTNY?=
 =?utf-8?B?RDhkbncwSHlSd3E3emJVQi9GYUUyem9wOTgxaHlKUzl5U3Nna1h1VVNDU2Ex?=
 =?utf-8?B?OElGQ09DMzloWnZLQ2FvdDdhQ0lYZzlQVnl1UnhzTWt2ajN1WHlOZmJTaHFw?=
 =?utf-8?B?aEY0SGk0bi9lMWRUTEZmblpzNVpUbHc1VTViRVZ0ZGRmTGE2MW9NVnlFbTlQ?=
 =?utf-8?B?NEs4RWN1NmpXbFVLZzh2UlhVRmhyZTg3STV5akZxa21uS0U5WURMZWRscDZB?=
 =?utf-8?B?ZDFjM0l3QWdmeldIMlFoQXp5c1JsUEpJVzVpWlBRN2pESHJ2azMveFNKdTdv?=
 =?utf-8?B?WUdXZVR6YlRnakg5K3RSN2gyaldqSk9lRjAvYjd1OERDRWgxcEZiSGZTR09C?=
 =?utf-8?B?OGxKWUFmekdMV3FwejJzTHlFdi84TnJiS3lzUWF2Y1lYeERTNUhjNmNPenVK?=
 =?utf-8?B?dW54TFlXMk1MRkZVN2lvNnZ5SVlGS2xsT1YxSGovcFNKRzFRVHpUeWYxRGQx?=
 =?utf-8?B?VkJkaWVPVkQxWHRTV0UvakpsWDJBOFUyZ3YxVk94dVRRYmZONkcrTUlhTkVJ?=
 =?utf-8?B?TVJPdmpjVDFGOFhiMmc3eE10SDhvS1FNdlV6bE8vUi8zUnAwelJ5blA3bWdP?=
 =?utf-8?B?N3lQdi9welE4R3liVG5OWUl0Q2cwNDZXT2dPTm1LYzN1WWZ4aDJ2c3UrN0lG?=
 =?utf-8?B?QjJuWGVhREpNZlhMSGZKZXpSdzI5U3ZocnJWZ290d2FwNmRQbUJXUENmL1VZ?=
 =?utf-8?B?bGxKa1ovZ2ZoQ3pKclZOOGJ3NHZKckxESjA2VVRua1RzRVJxdHhOU05KWTk5?=
 =?utf-8?B?ZTBFc2RlRzROc0pRSGZUK2ptQVlML05hMHE4NW4vaHVrcHlzNThJM3MzMUY5?=
 =?utf-8?B?L2JuYWxQeHp0TEhYaVgzZU9FdENROXBnSlJHWi9pbmUySDN6Y3UyaWp0ZFo3?=
 =?utf-8?B?TzhNUGhUc3huaUk4cEZRTHNKMkZRdUwwUlpoeUwzY2VaYUh6WUprZTdLNytk?=
 =?utf-8?B?cFNDQ2lpbmFNdkUzay9iVUg0OGU2MjNYMUxINE5oNWUzbytINnZkRDYzNDV1?=
 =?utf-8?B?cWp4SDhSZHpsT0FWN0tVU3gyNjhxdGNNQzNLdG1xK0h4dDU1WEhib1VQMjlw?=
 =?utf-8?B?UnVUUDZBSVVuaU5FOE1zTGpnQ2dsMlV4cWVQd2ZUUlVwK0h6clVPVFgzZWM1?=
 =?utf-8?B?b1V0NjJjMlJUU1ErcVkxaDRKWjJ3S3AwM1oxYUp6NUpUdGhQeDcrdnZMZlFQ?=
 =?utf-8?B?UVZ1YVhYeEhjdW05dmpIa3FMTDRBcG5hOEVvWElMd1FWdUM3aUdiZU5IZ25q?=
 =?utf-8?B?TWd5eEJXNDZBWG5EY0VOOHNVdXAzdDlCa2JzRWNsMlZoZ0dYeWp1ZnJBdllw?=
 =?utf-8?B?L3Vwekxicjl6OVhrcStsQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnlMcGhPcitYNWtVeFVIdjQ0bmNRUS9vVVBTS1JQdmQ0THQwdFRRNlZEOHFO?=
 =?utf-8?B?Mzh3dE5GWFFEM0duYS8xSU5OM3JqWWpiQXRrVWwwdTdVb0VDTzBJMnJKaXBr?=
 =?utf-8?B?bHZ0cHBFZlVMa3ZUamczR0JwYjFpemxXMlhJZEppY3NMdnd6STlTMFgyWUtD?=
 =?utf-8?B?ekZMTFhxQ2dTRFgvcWxlY1NwdTJTRVZoYVJTeEpIdFljbTJod3hQZW9nWHhH?=
 =?utf-8?B?akltRzFTL0VYVHpSVW1rQVJ2amdGZEZBcExOa3VtQUlxMmhwN1AvdzNJcWU1?=
 =?utf-8?B?bThKbGsrYjRpZVRzMWtOMG50VU9xbVNacnV2QjZ2dkdaaXJ1SkZ2RnpBYWgw?=
 =?utf-8?B?NFVNN1Q3OXoyZ1JWa3JsQjRpS2wvM1dzWHVrTkFOTXMrZ0lQazBmb0hEQzJ0?=
 =?utf-8?B?QURZK0tCRWRVODRnTUV4OUtuamp4VU1xdHg0ZDdzSjZwd1lCK3FFKzRpSHh0?=
 =?utf-8?B?MmhOekI0VEFjT04yVlBtMU5BUU14bi9JREZzSDcvbXpYRE9MZEpudmRDZEo0?=
 =?utf-8?B?dnhQUHMvWThqc0pia2hMd01aRGNmSFRxWExmRjZFTS9iRzIxMTd3aGhyYWxj?=
 =?utf-8?B?SmIxbWtBL2FNRmJaZjBNdURoTDdvcXcrZllkTGlJTVZOVG1hN3VGWFNlaWg4?=
 =?utf-8?B?TXpDQitrVUlpT1BnQ3NGUUV0TUh2MWd0TVNLQnk3TXVvaHFCcjM0cmNJY1pD?=
 =?utf-8?B?V3AwKzczRnJaMU5ocHNWSVpYKzA0MFZBUHFsSTF1VDFnVVF4R2FKNGg2Qm9a?=
 =?utf-8?B?YUxTY1ZDUUEydnc2YTlneDhEQmdYR0w3WXBRRnh1QzhyUkFxN3hjRWR5K0VT?=
 =?utf-8?B?MzNuelQvdmVtLzZHN3hFdFZPNUlaWU5MVHJiSkhLZmZkMkpmbFBVSEp2YnNW?=
 =?utf-8?B?YnFScjJVK01lenJNbmJGMytGOFdJQ2RUYjc5S1o1WXNqR0ZXeit5UU9Oc0xH?=
 =?utf-8?B?NWlXdmdndGdCVmRENTdDbjU4NmsrZ1dnd2tsYkxxYTVFazhheUxqcGZYZXNG?=
 =?utf-8?B?Q0l1K0RFUlBHZVJuNGc4UkFJS0g5LzNRS283Q2hlMDM0RVVlSnpXZjNhT1hF?=
 =?utf-8?B?VnYzT2lmWXcxdjJQbUZXYnJodjNZVWdVemFTa3Zsb0FsUVc2Z09jdEZzQURs?=
 =?utf-8?B?RWVvajR6SlIxL1dyTk81akdyUVlXVm9mZDRkT05iTHJjR3BSOFJEQ3RsT09J?=
 =?utf-8?B?VjBKNDloVnQ0djFidFB1VXpyeExHLzJRTXBaK1dURHE3bUpnVDlINmFZS2dO?=
 =?utf-8?B?c0FVRGNjUG1Tb0Q0Nzh5dS93cy85QkpESTRTTFJMOHhySHRkWEN2RVpLeWlW?=
 =?utf-8?B?cG41dmJmREZyZFlXbjFtdFN5enRXd0ZwYU1wU1NMUnBpQTZxL2crbC96Qm8y?=
 =?utf-8?B?UDRDRWNtSzFIWmJzclZmOFVWZHRGQmJjVmJkQ1BJNzRLZmdsaFl4eWFJdENX?=
 =?utf-8?B?N3pPOVBVbFZxOW54KzFhMDFScC9CSUlSOXlSZTY3cUtSQ09FQ3NyVjhsb0Er?=
 =?utf-8?B?SFgwa1REbitYU0pIaVYrSUdTd2c2TWFIN2VjbmpzRU50N2RkOEVnWmQ0enBY?=
 =?utf-8?B?THN2OHRrME1HbTFPbjdYYzArMWhrSDNZVnpkam9aYkNpQWxwbGU2V0NOOFhx?=
 =?utf-8?B?RHBjMk1RbWhUNTNSSGJ5bitiV3JaOHh0bVhLYjgxRkZoZjY1MmRwaVBtZUM4?=
 =?utf-8?B?YXc1Vkk2di9jQVFKRVZ3YitTOGZSeXlPME4waU91dnpXQzRoNkUzdEdGckZJ?=
 =?utf-8?B?T21YTjVPUkdjemZkOTd5WnRPa1lFUTIwZTVjbldWeVZqNjA3ZmtvMlh2NTJ2?=
 =?utf-8?B?QWZzVlVLZElXL1Q4bkJ2ajNoamMzNVlCSS85dk12dVJRaG1uTXBtRUdEV2VD?=
 =?utf-8?B?RWJyTHJMSkYxTzIxc0J2RVlGVDFZcG0yVDdQSDhnL3M4UE5iamM2ekNweXNE?=
 =?utf-8?B?VEJIZGRyQWZUTGZIYUZpUTJ2V013TXoxWHR0TnEzRXA0Y3U0K1NsSVVEMVRF?=
 =?utf-8?B?NVZUb2I1aXU3SitjSGxQZ0lRT3FYbllVdXdzZ2RnNThwREFMdFlTcml6Rzl0?=
 =?utf-8?B?NDFQS0o3Q1NDRElkQXhGNytNZHA2cm8rWFhkd0ZlNCtGWklwVlZUY3pwU1pJ?=
 =?utf-8?B?b3RTaGxodFpEZm8vVStpaGNKNnprTmo1VXd0QVRvQzRzdlluZDkwQWowMnFT?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc160681-b23f-4258-5dca-08dcd8d1795b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 17:35:37.9055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxqCVrJY3DbF2qgLkligBEoQc4Il6iMSSsKwIWG2bIuqtylE+KbCo3eH+qpBSoaIbBGD3FZszxmOplDKANOOUsNUzHRTnNHEO08GUV4R0W0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8484
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

Hi Jeeavn,


On 9/19/2024 10:54 PM, Jeevan B wrote:
> On current platforms early transport is supported on eDP only
> so avoiding assert for other connector.
> 
> v2: Add checks to handle crashes and fix typo.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_psr2_sf.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index a9be1a1ec..ca729d558 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -935,7 +935,9 @@ static void run(data_t *data)
>   							  data->pipe),
>   							  "FBC still disabled\n");
>   
> -	if (data->et_flag)
> +	/* TODO: Enable this check if other connectors support Early Transport */
> +	if (data->et_flag && data->output != NULL &&
> +	    data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
>   		igt_assert_f(early_transport_check(data->debugfs_fd),
>   			     "Early Trasport Disbaled\n");
> 

LGTM,
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>


