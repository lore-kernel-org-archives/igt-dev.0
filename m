Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66020C021A4
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 22:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4BF10E06B;
	Mon, 24 Feb 2025 22:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPtML7e3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B459410E06B
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 22:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740437818; x=1771973818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jyzSBfCOShC08vCoxxCeFLx6s0CV94nUqfpT1lG9VF0=;
 b=KPtML7e3PDmhxRSq36Hc3f0aVMTqDl2h2w75t+eucvNNIAXTgUG91eye
 uyfS196DmqW/Z1npsWz1sXnVpqQ1oh6veYnCHJeRWpMJfEB7pkdG+2pYB
 7FV2CmlHDwM3wuAbcKi/1pZLPJ9F2kiRMQhLBLZNsahGJizbtYHnZAXMN
 gnoOvrb+RLyZBQ8+vlEn+pGxJJs8W+o4kYjbnJ0F2WV/BR4uyEM7oHVRi
 /mZeuqpjmCTmF6Wpe1EBl/nY3/NyuZaS63QL8e6nFxkFIuZSr+79H4E0g
 2UpICQERf0W32WYNB0MgteWjSmma7GLfIBdrVYby3aHK8qqtGeeCy5ZUl g==;
X-CSE-ConnectionGUID: 1ngawJwuQkKl85N66Mn1Kw==
X-CSE-MsgGUID: 8jGo62IXSbOqqf+5GdHNwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41129374"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="41129374"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 14:56:57 -0800
X-CSE-ConnectionGUID: vQk4U3NTR+mzbYpkF2NYtA==
X-CSE-MsgGUID: XXkRAjmoR8ucZxgjT7u7Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="116174817"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 14:56:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 14:56:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 14:56:55 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 14:56:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhKrt1w749MAa9/hM1Z+vnAlDVw4FKF5Mp2LUBgCJFZFZh/++nWUwZbmK7XFXjbVx7q4rHZlk0Ls3JBNVnS21qISlfG4/uFg4xWRBHYTCgLzDAFH1j5Lk7hYdr4Fvqg+PxsAZCOvpih7tb+yqjOrzOTWWoU7CimitusJa892f3qnWRqpYDRoMkOzKDsx2kqPzKpXQ72egh9NgPokPPFTpCVRnI0XW0UTNYg0UD11xrw0wQDGNxy14uaRFnUCLoWc0n93DlhW/JCtmNL1fja1JXYgZpVz33N8Z1HrNB0GZ3Zz41oOq100omAYM4MXqCk6QCRr41lvekbNsBZ6uJSpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k95S4IUYtAyl3r+Dcub7fRtSYemjhv2Orr3pYxGDQX8=;
 b=qe+Bk+lqO/PT198YrJfUQezQlz9ELBBiX+VqYOvRi0ftO6/aWNBDAH6c09xZZpcjUQM8Xsl7/sauzcIeoHweI/9HVSXQRs53k+PSr54/KggEjQQwaISXBLBiMUepEj16/lP0WjSCyBRoL6XZmU1lrEsjQ3Cwwz4rXyeJlFXQEDN4hufLSS3XTjre6nQZ7xjNLTz1+M95UabX57OySTavtgdO3tYIjVlR9yYOEz0Ik+dJc5Isoo/HLPbxp82i+hvrGWR7uNKxqNBMi4jRVVt+jjEKm1EwkUC1ynMZdvQuPGyu2qG4iZwkatNLbXDgd/oc6iEF7eukpK2/sHiObRB+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 22:56:07 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 22:56:07 +0000
Date: Mon, 24 Feb 2025 14:56:05 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t CI run 06/14] tests/intel/xe_oa: Rewrite the
 polling small buf test
Message-ID: <Z7z5BV5HbeWP9+CV@orsosgc001>
References: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
 <20250218202812.1679653-7-umesh.nerlige.ramappa@intel.com>
 <85seo3je6e.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85seo3je6e.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:303:8f::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4622:EE_
X-MS-Office365-Filtering-Correlation-Id: 5267f7f4-d3dc-4099-4bf0-08dd55266c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tjk1M0lpcVpQa0VFc0NZRUh1d1JDeGFpQlFkRjZxN3ZFRDhTbmxFUDRLMEVU?=
 =?utf-8?B?NStxZlFaUVFNcDdYa0taaDcvdy9LckFMQ2N3QTF1WXppdzdLczdaRCtwb1c0?=
 =?utf-8?B?M0dFb000R0hDMFFhTXNCZTZ2dW1SNitubkxMK1Bva0t0NnZBOThBSWlZdlJV?=
 =?utf-8?B?OGUzSlZhZ0pzUnJ5eXczZDMyaTRMaDN4UEVrdTRlNzdzOFhkWGp3V1NLWk9l?=
 =?utf-8?B?SDVkK0liMXlVdlFDQkM4VnBJOEd0Nkw4N1NwVCtGZGd5NTlFVlh1cEMxcDcy?=
 =?utf-8?B?NDA2WEZkbFdJaFVwVURvQnkxcUJGc01YQ2NlYmhjZjlFVTFEMlpCMFVBaytG?=
 =?utf-8?B?eTVlNEUrVXdxUS96YVFudytPQ0lJUXJONEpEdXM1ekc2YTBEMW1LcnBKVHl0?=
 =?utf-8?B?Q1U5YjVCTG1VWWhBN0NsZytIOExyYWRDZ05CUGFUTzhJOGVMZ0lQWkZDeHU4?=
 =?utf-8?B?TDBodGp1blZZYkg3QVIrRVc0UFpDUlpnQUtxYW9OZmdyOVpPYWVrbndFSG1q?=
 =?utf-8?B?NnViRWNQY2o2WjZJb3pDOXJjZVRxb2RWQ0dCR3kyUFJxSzcvQ0QvaXpUL253?=
 =?utf-8?B?VU5OaVgxdzdodTFwcGdhNFlVb2lOTTZhcmRBdU5QaHFvV3VPZUxEWVJLaU82?=
 =?utf-8?B?MzhYbjRadDZHUWJPY0ZnYmxyZXQ4UEdKTlJYSDVwR2Fsck9oWjZ6dmZ5T2Ex?=
 =?utf-8?B?dWVhWkJKa2JvYkdVRkcyK1FicmplTituUFJTQ3J1ZXdLeG8wZy8wK3RQbkl3?=
 =?utf-8?B?RmJsWlJWN09YeUJudEttdVp0aTMwRVFqalpmTHhKSCtMQ015TExmd2k5cnBH?=
 =?utf-8?B?dnlkd2o4emRNcy9RMTg1ZlpXbDIxQzlsVWVZWVBUK0tuYXNNYll5TFA1aG5x?=
 =?utf-8?B?b2ZENE0xYkM3UmxuOGYvVVFDYmV2c2JUQTRweXp6QlR2ZHFzUDIrSkZCaDVo?=
 =?utf-8?B?K3dCT0U1bnV2dWxDZTdiRGpUdFRVZHh5TnJIVmxJaGNwRXNocG9ncGdabk1q?=
 =?utf-8?B?dzQ3OEk3SndaczlDcnppZm1pKzJxclNuU2N2c1VYOUdJdHNWWmJXTlNJWFZH?=
 =?utf-8?B?N3djcFUrZTVJcGNlZURiOFlmVVh4WDBCNEN2OHAwTmpLMGI1TldGNmw0dFdV?=
 =?utf-8?B?MERzSEdvaDhScTNkNzArWjZzcFNXMTRMMVp4NlBXbjlHdFp4VG91UFhRQTl3?=
 =?utf-8?B?T1djakdUb0FydUdFMjgwWFQ1OS9nRTN3cVV0OE9yQXJ4UkVXdXgwT3dmUDlx?=
 =?utf-8?B?NllwbUdSNENLeklPcFQvVnljeHBuTFVmNzJxMXpYSXFQcGY4SkdCWnQ3Mk5V?=
 =?utf-8?B?SDBMR1I3K2FEQjYra290Y24ydEFtUm1KU3M0WFNpbXIyRnl5bllHaGFuQ2VG?=
 =?utf-8?B?aVVmcDNyTVNQYUtuU0paeEtvNW41OXNZRkJ3bnB3OTJWM3YzMW1wSDUwdDFk?=
 =?utf-8?B?MjgxSGNadFg3VlNjb21rRVRza3hiZFVETkdPYXQ4VEFaRksxZHJsZnhxMFNi?=
 =?utf-8?B?Um9sOEhORTd3RDl4c2NycmxPWHUvdEhFb1dlMHZKQU45UWlBRFRXSFVBVSsr?=
 =?utf-8?B?M1VscW1ZY09OaVNGUWIrakdvTGxNM2xvRmh5TTZDSm9zMVRKRDZlSHBUdUpH?=
 =?utf-8?B?c3ltSnM2N0UxRk5EMy8yb3FwcE1oYjlYbGdiOXlLUVN6RlJVcTRtbmtzc2Ft?=
 =?utf-8?B?bTcvSHB5eG12aXJHajdjaUhlUU9GbXNLMGVTczdaa0Q3NUtxWEVIR1ZnT1NQ?=
 =?utf-8?B?TFkzaG9KWGx1c2ExbmY1bkxaZFhkeGhld3I3eVJ0M1FzVXpPMjRBY0ZjZlAr?=
 =?utf-8?B?dUJRSnJuQnh0MUJIMllhZVFyM0k3bStYRDJ4NDlJNjRPK1IwMGU5OStsUm43?=
 =?utf-8?Q?JTYY3IMZNhZSN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajQyUURGeG82QWR3WVpqeG9Ca0hSdEtyR3huTFArVmpLempUcm1Zd0FkSTdS?=
 =?utf-8?B?YnpLeXI3aWk0UEptZXJUTEo0ek9WcE1yWXozZnNvcFdESXlkQ1BvS0hVYlBT?=
 =?utf-8?B?NWhYeU1PWThMUEVnV0l5ODJUUFJLejdGUDlEaWZ5SDJNYVJJd2E4WEVYYkI0?=
 =?utf-8?B?VG9CZlY2TlQrblZKNXNrOXJ2Um5FQzRkTlFJNTBGWS9VK3FibVpxeXUxWFlT?=
 =?utf-8?B?NDB0bEVYMXFoaFZocGd2OGFHdHFUbFo0UDBqTWVlZmdtcmNPMXV6N3AwdzY3?=
 =?utf-8?B?MWlURS9aZlgrRUx3TUIwWFdXNHcwUVlzblRlTlJ2cXB3amkrMVJjdlBSZXZp?=
 =?utf-8?B?eDRjWlhLN2VNNXFCckgwdnl5K3c4K1VPeFRTV0NUQlhkTHNiTWNzcUpvL0dS?=
 =?utf-8?B?N0Q5TndGL21jRG03YlZZdXVmNjJXd0dGV25QL29sUUdlc1d5SXNlaHpwQWhq?=
 =?utf-8?B?K095aUdjSmhFSFlCcS9Fb2NyNmlVa2RQaVE0NW5nQjJKYkxkN3ZoeWFxOFNk?=
 =?utf-8?B?djFiSUxpY1FneVFtUTdWWlE3cTF2dVBURmQza0J6QkNUeE5WcWltTlArUE9z?=
 =?utf-8?B?dXJGcnFDUVc2c0xsM2RDcDZiME5HMXhCU1Npb291SG1aRmY5VkNLS25lMHR6?=
 =?utf-8?B?V3duVDJLVXZ0K2pBNEtuY3pRM0p1QkdodG92NmpNZVZOZkVmTGE2OXczYmFz?=
 =?utf-8?B?VWJxZTFLSXRRcGhaelM4S1RadUhDZDlFVUpRREVKZWVadENvOEkvdGE4bjcy?=
 =?utf-8?B?R2FpUDltTTUxb3R5L0p5UTUyZTlKRHJLUGZ2Q0gxRW96cExnUFdhcTFhUnN5?=
 =?utf-8?B?Q1pQRFB0YUxHYkd2aFdnRDE0V1I5anRDNDQwOUhKR3N5cEJTRkxoREFYaDRN?=
 =?utf-8?B?TFJ1VVBlend6ZUtaR3JWMHhLOXl4SzRvTlNFYUQrUkJ6TmowbitZNHg1U0JD?=
 =?utf-8?B?bm0vTnR5UEhCTmFzRHdNZ0ZnUG9TbW82SkF4Q2xBZlgyVkIzbm1nL3VSSzZU?=
 =?utf-8?B?WGM1QkhPOURoTTduUGlVVmp4eDJWNlNtcGlHN09TREF5cXRaLy9DOGhGZFVG?=
 =?utf-8?B?K2NiSE9jUHMxeWo2OEZXdE0zOC90YVBpTE9raW1zTnl6dk5jNFRGYitydEt0?=
 =?utf-8?B?U3JJc3BudlcwZllpbGovcUwrWlo5UjhuZ01iSnhrOVdhQ05qRi9zckpxaUI2?=
 =?utf-8?B?RDg0K1oydHJLUWZ5KzZMUjVRS1ZvcUgycWplZXI4aXFtSmtOQlB1Z2hLTi9Y?=
 =?utf-8?B?NU9DS1k3dTMxWVVJbFZQeDNjcmVnSCtJWWloU2RjQ291cjBiVG5DNVExYk10?=
 =?utf-8?B?SHJUaE5xRVBUcHE3ZU93MzAvMXNKKy9IS3B6cU5wS3k1bkE5SVdTTlJxdzJw?=
 =?utf-8?B?Y1QvSGpvRmJSTjVhRkJYM1V4M3I0bHc4cnRuMU54WWNxS1h2OS9uaFVwUHFi?=
 =?utf-8?B?SmJmTkM5eDUxbVh1RTBmN2wzM3A1SmZxaEpmaDRvV3JzblcvdEQ4ZE9jb0tl?=
 =?utf-8?B?YnpjcEZraEtDcGd1MmFNR1FPQmYxT0FDVWk3SGovQnNPbE5vbmxzR3E1c1VP?=
 =?utf-8?B?ZzRVODk4NW5DQlpBeUc3cUtCSWFrdHVrYzJGaWlTWnlMbGNOdjM4a3ZUNi8r?=
 =?utf-8?B?RkFXTGtWS2s1U3FGSmtOcytWWmpQeEVSMm1wR2FFcXZaVURIVHhXckVtUlB1?=
 =?utf-8?B?aEFDeFB5b3JETXpHdDcwTWQwdHBucVRKakZSYmRFL2xJMFRPNkovbC9PUUdT?=
 =?utf-8?B?YkZPYkE2NzloTC9DdnJxVjhDcFpKakJxNHdyL05XTmgrNEI0TU85WUhBaWEv?=
 =?utf-8?B?dWpuVUJ2ZnNyRDZRbi9IcGhQRk0raFY3SjY2dTZIdUZGanY2b09pK25EUytr?=
 =?utf-8?B?UE9yZDliNW5CODJtdVU5MnRHNVlOUTNRN2VET3VSZ0RUQk0zQmpZNFV4MVdT?=
 =?utf-8?B?ZVpjaGMwWVRJRXVqbVZVVzVqL09QQ0RKS2R0TEFWR2tobUl6N0pEdHlMQm0x?=
 =?utf-8?B?azNMQUE1VzdBUU9pSmQvTGxpU210L1RzUlhBTW5NRkVHVVR4Rkk5M0JUdVN1?=
 =?utf-8?B?V1hRSlhmUTZVT0I2aUVXZWJVbTVma2lzNGdRQjN4SDN1eTlFSkx4d0UrS0FI?=
 =?utf-8?B?OGZpZTB1SmZ1My9QaGhkWnNNdGxMSGJkeSs2aERGZEczV3FBNEpIaVR0enNV?=
 =?utf-8?Q?OkUTDV7AiZ3ZbwQODhVkx14=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5267f7f4-d3dc-4099-4bf0-08dd55266c6d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 22:56:07.4170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lGeCUJ6YJYdtf+TV6hI6ncrLuzoNrK/KveGKBvPK4llEhP9FGc66Y1Cj8shZwR3jPvkrkX5u1Ln7Y1x8/cI5gHYa9D73kS6KdAl4VySPCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
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

On Mon, Feb 24, 2025 at 12:11:37PM -0800, Dixit, Ashutosh wrote:
>On Tue, 18 Feb 2025 12:28:04 -0800, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> Use mmio reads as a side-channel to determine if reports are available
>> and ensure that poll will return with POLLIN set. Then provide a small
>> buffer to force ENOSPC error. Then poll with a timeout of 0 to check if
>> POLLIN is still set.
>
>Will need a reason for doing this here. But see below.
>
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 64 +++++++++++++++++++++++++--------------------
>>  1 file changed, 35 insertions(+), 29 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index aaf92308a..5792ffec2 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -2216,7 +2216,6 @@ static void test_polling(uint64_t requested_oa_period,
>>   */
>>  static void test_polling_small_buf(void)
>>  {
>> -	int oa_exponent = max_oa_exponent_for_period_lte(40 * 1000); /* 40us */
>>	uint64_t properties[] = {
>>		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>>
>> @@ -2226,50 +2225,57 @@ static void test_polling_small_buf(void)
>>		/* OA unit configuration */
>>		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>>		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>> -		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>> +		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
>>		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>>	};
>>	struct intel_xe_oa_open_prop param = {
>>		.num_properties = ARRAY_SIZE(properties) / 2,
>>		.properties_ptr = to_user_pointer(properties),
>>	};
>> -	uint32_t test_duration = 80 * 1000 * 1000;
>> -	int sample_size = get_oa_format(default_test_set->perf_oa_format).size;
>> -	int n_expected_reports = test_duration / oa_exponent_to_ns(oa_exponent);
>> -	int n_expect_read_bytes = n_expected_reports * sample_size;
>> -	struct timespec ts = {};
>> -	int n_bytes_read = 0;
>> -	uint32_t n_polls = 0;
>> +	int report_size = get_oa_format(default_test_set->perf_oa_format).size;
>> +	u32 oa_tail, prev_tail;
>> +	struct pollfd pollfd;
>> +	uint8_t buf[10];
>> +	int ret, i = 0;
>> +
>> +	intel_register_access_init(&mmio_data,
>> +				   igt_device_get_pci_device(drm_fd), 0);
>>
>>	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>>	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
>> -	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> -
>> -	while (igt_nsec_elapsed(&ts) < test_duration) {
>> -		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
>>
>> -		ppoll(&pollfd, 1, NULL, NULL);
>> -		if (pollfd.revents & POLLIN) {
>> -			uint8_t buf[1024];
>> -			int ret;
>> +#define OAG_OATAILPTR	(0xdb04)
>> +	/* Save the current tail */
>> +	prev_tail = oa_tail = intel_register_read(&mmio_data, OAG_OATAILPTR);
>>
>> -			ret = read(stream_fd, buf, sizeof(buf));
>> -			if (ret >= 0)
>> -				n_bytes_read += ret;
>> -		}
>> +	/* Kickstart the capture */
>> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>>
>> -		n_polls++;
>> +	/* Wait for 5 reports */
>
>Wait for 5 reports or 10 ms ?
>
>
>> +	while ((oa_tail - prev_tail) < (5 * report_size)) {
>> +		usleep(1000);
>> +		oa_tail = intel_register_read(&mmio_data, OAG_OATAILPTR);
>> +		if (i++ > 10)
>
>So on slow platforms we might not get any reports in 10 ms? The idea here
>should be to not have any timing dependence? So if we want to wait for 5
>reports, just wait for 5 reports?

Oh, I think the loop was stuck while debugging something, so had added a 
counter to bail out in 10 iterations. I will remove that. We only need 
to wait for 5 reports.

>
>We tried doing this for the mmap OA buffer: see
>mmap_wait_for_periodic_reports(), the function waits indefinitely.

You mean this:

while (num_periodic_reports < n) {
	usleep(4 * n * period_us);
	num_periodic_reports = 0;
	for (reports = (uint32_t *)oa_vaddr;
	     reports[0] && oa_timestamp(reports, fmt) && oa_report_is_periodic(reports);
	     reports += get_oa_format(fmt).size) {
		num_periodic_reports++;
	}
}

Well.. if your reports start coming in fast enough, then you would just 
spin in the inner for loop. Maybe break the inner for loop when 
num_periodic_reports >= n;

>
>So if this is done I am not sure if the intel_register_read() approach is
>needed (but I didn't think of doing that :). But I guess we can use it to
>see when there are N reports available.
>
>Longer term it would be nice to have a centralized function
>wait_for_n_reports(int n) or something like that which different tests can
>use.

Agree, except that some tests will read the actual reports, while others 
just want to take a peek at how many reports are available without 
reading them. Since mmap is also a feature under test, I took the easier 
approach. We can always refine it if we find something better.

>
>> +			break;
>>	}
>>
>> -	igt_info("Read %d expected %d (%.2f%% of the expected number), polls=%u\n",
>> -		 n_bytes_read, n_expect_read_bytes,
>> -		 n_bytes_read * 100.0f / n_expect_read_bytes,
>> -		 n_polls);
>> +	intel_register_access_fini(&mmio_data);
>>
>> -	__perf_close(stream_fd);
>> +	/* Just read one report and expect ENOSPC */
>> +	pollfd.fd = stream_fd;
>> +	pollfd.events = POLLIN;
>> +	poll(&pollfd, 1, 1000);
>> +	igt_assert(pollfd.revents & POLLIN);
>
>Is the assumption here that the kernel timer is firing every 5 ms (so if
>we've waited for 10 ms POLLIN must be set since the timer is firing every 5
>ms)? I am not sure if that 5 ms is uapi. Or is it? Actually I was thinking
>of changing that 5 ms time or changing the timer to a delayed work.

But here I am waiting 1000ms in the poll above. That should be 
sufficient for POLLIN  to be set. If not, we could set the timeout to a 
large value (a few seconds).

>
>> +	errno = 0;
>> +	ret = read(stream_fd, buf, sizeof(buf));
>> +	igt_assert_eq(ret, -1);
>> +	igt_assert_eq(errno, ENOSPC);
>
>This part looks ok, it's uapi.
>

Note:
ENOSPC is returned only if the buffer is small enough that not even one 
report will fit in. Initially I had a 600 byte buffer, but I did not get 
ENOSPC. Instead I got 576 in ret which I think is the correct behavior.

>>
>> -	igt_assert(abs(n_expect_read_bytes - n_bytes_read) <
>> -		   0.20 * n_expect_read_bytes);
>> +	/* Poll with 0 timeout and expect POLLIN flag to be set */
>> +	poll(&pollfd, 1, 0);
>> +	igt_assert(pollfd.revents & POLLIN);
>> +
>> +	__perf_close(stream_fd);
>
>How about just reading N reports using a small buffer for this test,
>however long it takes? N can 5 or 10.

Not sure I understand. You mean at this stage of the test, read 5/10 
reports? OR just alter the entire test somehow to do something 
different?

I thought the test was specifically testing that POLLIN is still set 
after an ENOSPC error, so I have written it for that case alone. The 0 
timeout will bypass the wait in the poll so that we only get the state 
of POLLIN.

Thanks,
Umesh


>
>Thanks.
>--
>Ashutosh
>
>PS: how about separating out the patches which currently have R-b into a
>separate series and merging them first?
