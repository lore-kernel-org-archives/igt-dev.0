Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9559DCED25D
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 03:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5602F10E178;
	Tue,  8 Oct 2024 03:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCGdI3uK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C8710E178
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 03:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728357232; x=1759893232;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U8vBwVWj9LA5Xsi1WxIggW/brxCWSqPykOHZ/QWYYFQ=;
 b=GCGdI3uKg50p8KP9uCyfB25ERjIoFY6xWxptacqHZThG13Vb5xjxC7/M
 2ZHKOZSFY1+9dm74FamkaOrDrNRtP70SCPAWhk0Xaoif/WPNNBS1bWHI8
 s65nDipIl+JQh2K2kffEFk8wgJjWFbHJ3t1AO9Il0kykRENTEmvJ8+dgM
 /4gZw6JdJUxlR1aNrA+wK+WrX7+n4zJk6MXBEgzdqMlDJztgz+YjTcSsS
 b2tbbAzQQIUlyhplDDnJ1WuGyjgN4lSjXjYOdInV8C37Z1SlGxKkZEuaP
 Jg/ojylugwzz6ufVhfGYbXs5oXardXvZ07qdBt0PxpXMstk7M4Vb7bN01 w==;
X-CSE-ConnectionGUID: hqS5I+mrQaahgJcHlo7fRA==
X-CSE-MsgGUID: nifEqEWbRlSRT/9DfQHevg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="45052986"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="45052986"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 20:13:52 -0700
X-CSE-ConnectionGUID: mV6Zsyu+QtWK049XJaPL+g==
X-CSE-MsgGUID: BkV7zq1gR/a+Pcp7olR10Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="113143170"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 20:13:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 20:13:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 20:13:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 20:13:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 20:13:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5wxhmJSTrMaLSCFZ4gTMviJYlcvFFCaHMereD8NI94wXOkiMLf44cAzQxjZUeNF+I0E7Q+6korWLRTQ+9SqwiOMcBpZvhzTkEjakDmCyQmjYLPFjg/tQHRyrjM9yOBYkN4lmPlb/KWnewIgQA35/ICCS3Cjy4gdtLjHXyWRO4Nuv8muVoigk2UNmsAHpcwl48FMZoOt9erDVL0FgH5bWh/kh9hfeQnbKriuqJMiR7XUKa6wZCaMNejHwKyXX3x0GaaL9C2cdBZ3pNxPsnuKwB5pjnT+MnVOVcpIDx7FafvdcRXqzSHrTf+buUko8PN7Gnl5rl//QTj9//OFGGJmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMsJfiMF1UYEc5HPm02Ep1XAc/fcOXKVXtTWLUBEar0=;
 b=RMMXmU5El2z9cDKhYzezbyRGmr+mBm1n5K9CByBlRHN1R9HmrHzP2hH9tvrlFRlFLAKp+SPQyHtnN4IQx+rl/mZIL/AYYobBxdo0FS104mqCGRUeuguRsgnvjgyTrnSfxL4LZRRe8y7+bNEzodo0jbjfajLVmwE+VkVPHYt23+0YBwQsyksJjl5cveccUbsAn0a1oRUZnX++yGX+WfJZ4w6pz5VwnAaP3CCLKq7gd3+0QXgyVioVM9Gx1zUEb+v/ehHzqu70hNT2up9AnZcO35oX1otQm7od9GgujSypFFTfe/s5My9mGxuuJlbMF2wSd6rO+LV76NzTkHgU9qXwJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 03:13:48 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 03:13:48 +0000
Message-ID: <cc7c6fab-6310-438d-90aa-d7509f06192f@intel.com>
Date: Tue, 8 Oct 2024 08:43:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Poosa,
 Karthik" <karthik.poosa@intel.com>
References: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
 <CY5PR11MB62119CD942646EABA7CA5D91957E2@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <CY5PR11MB62119CD942646EABA7CA5D91957E2@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV3PR11MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e21a018-aca5-4b5e-f2d0-08dce74739fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWZmb1lLdnV6MVFtRUo1ekxuNUJoWkVycVVIWVpGUXlZaENEVWFKZmNpNmRW?=
 =?utf-8?B?YlR2YVIvYjdyc3lYMG9Yd05vSUJYaFRjbkx0MDFLSXhXbkFVSWErN1c3b2tL?=
 =?utf-8?B?QUVWbHFkQ2w3NUpzdy9SSjB0U2xUOHdERzdTYWhkd3c2d1NveGZjb2krM2d3?=
 =?utf-8?B?dlhUUzJjRjRpU0dJcXJ1dkdiTmNFUFJ2aHJqTnloUTZvNmp3bG1MTXJtV3I4?=
 =?utf-8?B?WHNvVlVYUnBtczRHSXBQT1ovSmZpclExdE9aWnBNSktQNVczZC84TUJjNEIx?=
 =?utf-8?B?S1B0eS90VEsyRldLcUdHWUg0d0VPSFFHaHdYTlJraUZzQlJOSkFzVmovWFVq?=
 =?utf-8?B?UjNRdXZPazNTYnFMQ3hZVmFYRkdHd2ZGUDFId2ROd3F0VnZUS0FYZXZsQkZF?=
 =?utf-8?B?N0J5elp0Tm11YVF1dkQzYUdmcjI4TGxaYkdyY3Q5MDd3RFF4OUlmdXArYU5P?=
 =?utf-8?B?OGkzdk1LYnRvTjduTjQ2M0xhM2s0K3FTNHd4TUJzNzd5Y1BpL3lRT2s2OWJk?=
 =?utf-8?B?Tk1GRXR5dnVVS1ZwMjUyZXNmVStmazExTm16NFZaVDNIQVpBWjdCZHhCRFJp?=
 =?utf-8?B?c2xLVGxyVVhoejZWVU9Oam9SN0RubVJMdlRxR0N1V0JHMmhESC96QisrTXBC?=
 =?utf-8?B?emRWd3hWVmtta0lnajRDLzVpcXRyTWtGOS9WZ08xNHpHQk1Cd1dZRlM0VmdT?=
 =?utf-8?B?TFFQNnI0bFQ4OUZCaTkvT1p0c0RaQlNIYm5Yc1BiVWNqL1NWejdsL0d2aTc3?=
 =?utf-8?B?bzFoK0RPbDE2SUJnVGt1anRUYjdnL2Z2THhma1VjYnhlVFZBSTlNdFFrUlBz?=
 =?utf-8?B?ZkE1dGtoSUxaby9uc05xdldnczVXYm9vOE55RGVEaHpYek4vR2F2U0o2VkpQ?=
 =?utf-8?B?OE9uYVo4WlRsTEpGYXU2YnN2UVI5eVhYMzRRYWpxSUhzcGJjaFd0bVJvaWtl?=
 =?utf-8?B?bWtCdzFwck9DeTJ1VFhvd2I0VWJqbXpoMjkxcS92WlZ5TnM3eVp5UFdqYkM2?=
 =?utf-8?B?TFM5elUyWEtpYkdVYXpUL3dhT0RMRlhsczkvS0UrSCtSTHhhWVBCMjBOaFYr?=
 =?utf-8?B?V0VWWTlvT0IxUzhod3o2aGJlcWZPYnZnaFRib09uMzRSTGVESmVaUGpQWVIy?=
 =?utf-8?B?NGkwNlErNG83OHZPZzllY0N1YVJZZVYwL3ZxdlRyVER5T0VvKzhWNDhDdEll?=
 =?utf-8?B?WXlYQjUzS1A5SUxRU2VkUzZzcGpOci83Z2trWE5wUjRwMUY3M1NUK1h0YUhh?=
 =?utf-8?B?SjJaVlpweVNHSi9Kb3JEaXExOGFQQVB4UmduSDFvMUUyK05xU3VlSmdmeE1K?=
 =?utf-8?B?NlpzQzlma0NPNy9lRzJzS3EyM2tjWG8vMHQ5a21XWThpS3kzT01LTFdxNWFz?=
 =?utf-8?B?OXdpZUlvTERuUktDL21VZktsTWlzRkIyZkdDbXM4a20xaFRvMUJCWHp3SGQr?=
 =?utf-8?B?VjQxcVBibUlsM3d5L0o5OWhkWG1aZDFIeEdUeXczZFZZYVk4UVNmS2VCRVh6?=
 =?utf-8?B?L05uQWU0Q3N1enpMQ1l0WmN0cEhzMTFxVnVqYjdRN3pkWFc5bWFKM292QzJE?=
 =?utf-8?B?NVgyc3ZoTzFDcmhjQjhoQk5rN29XYmIwc2dBNFBxd096Uno4ZmhERlVNamhN?=
 =?utf-8?B?NFFnTzFVMUZqNlp1Ry9wNHdzWHZzMzQzZTJjNjJYVzkxNzg5a0tWclE3Vm5m?=
 =?utf-8?B?MEZRamx6WmRVUnlDUjJHS0pFTHViUHRFQVlFUURHanFTaVNpejM4c0xBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akEwU3RVa1d3NHRLZzQ0YXNZNkV6MXBxdldHdWpGNW11ZFhEUDR1V2ZkeDJ3?=
 =?utf-8?B?bW1TU2c1ZjV3Qk5EV3Z4ME5aV3FJWk4rVEpnQmdiZWsxa0hrMVhOSCtNMVlY?=
 =?utf-8?B?Slo2dDAzU2ZNYU1ZZEtFcEI2dGt1MUsxMWlQSCtFQVBsVURQNURSQ2k5RGxa?=
 =?utf-8?B?dFR5ZjlYSjZRZ3kyK0xSS2lQNUlEbXVJQnVnZ2pFN2gxTWpOeUx2a3BWUnZm?=
 =?utf-8?B?ZG1ueTM0RFRrOHFpZ2hlRkV3SlRQWVA4UU9WUGVPcVVxM0gvR3p5ZjhCYzF2?=
 =?utf-8?B?aGt3cHdRUTNtakQ5bzJRenEzRzRyMHZPd1NYOU9yZWljSUxKUlEwa2dtei80?=
 =?utf-8?B?aGxyRnVDRStVK2Nrd1dqRmplT1hncVVqSjhvSW01Q1V2cmp6N1JSamxhMTBV?=
 =?utf-8?B?QVFGM1I2aXZQd2l1TklIQ3RIR3ZNTTU1Z2pKSzFJU2h0L21FZjFVUEFwNk54?=
 =?utf-8?B?akpzeUFTSEVkVDMyeHRrNzFBTUxIcDJtc3Bhb1p2WUNMZUtJVWpwQVJuZTB6?=
 =?utf-8?B?WmZ2VTl5UGZ1TS8vNjJQdGFjR1VCamRTSGh6b1V2SUZtNUVBNmdiWWx2empi?=
 =?utf-8?B?eWx1eGIrR0UycjF5V1ROdHlkNWJKcVl6VVNnWksyWm94MzNlYnRSNEhFZkhN?=
 =?utf-8?B?Q2xqdCtrWWpWQTF2ZzJZSkg1OW1RblZDRkxSRkFKU2V0Ty9oc25hbFBmaXh5?=
 =?utf-8?B?aVp3R0p1QU1oUURyTVhCVmx5NTlJa2xEMmxYS3pQdlBBSGJ6SjRVeFR3dExh?=
 =?utf-8?B?V1UwNjNRTEJaRjJNWndRcnp5UVdLbXNYTm5sMDlkbSsrRUZkby94MXV3RGJn?=
 =?utf-8?B?R2ZPNU1uTDBRQVhtenZrdlFRbUNJajZ5UTNtQnFsWjZuaGZuNk0xeDBjNzZ0?=
 =?utf-8?B?aWhoVW41L0VRTVZGcDVuWGFDZWwxbTMrOStBUGVMRmZ3MytXMDFUcm0wTVV6?=
 =?utf-8?B?d092STByWjA4TTYwRjY2VTM4cXd5NmU4NFVwQnlGZHpqb0paMHEyQ012SWkw?=
 =?utf-8?B?WVU5VDArVnNGTzgrdVpRYXdYM3RuM0Y4VzJpSWFFdjNxdGZyVit3QjR4UFBr?=
 =?utf-8?B?RUxHK2grMmx4TmFlOFNGRTU1WUlxYjk5SVVqWmwzTnlrUS9vb1FNaVIvdXVt?=
 =?utf-8?B?bjlFcWFWOUdWaEZGV3lxWmN3bWkvUm4xamgyWnh5RW5QYW1aejNpWXE5TXRu?=
 =?utf-8?B?OXZLSjlEWGhaaUZOUkxjRXlpUkd1b3dtSEhobWlmQWpweFZtUkJXR2lzT3ky?=
 =?utf-8?B?ODlSUTA1c1lkVGluQURJaTdyLzNjSmhYOWhKeW13MlNMdEFmMGk0WjByR09z?=
 =?utf-8?B?eFlncit5ai9Mb0ZBYjlsekRKbzlNejRPUlJIUXZwSUdHVVFReWdJQWpvZVds?=
 =?utf-8?B?MUl3a3Q2bjl4a1BsSWNKMHFaeG1DVkVjN1g1SmJiZm0xWVUyd0ZZQi9nTU5y?=
 =?utf-8?B?dXJidVFqcXpMaW5LdXplNldOT3M1U2lja2pzd0hZNUlBditPTzdrUUduQ3Ro?=
 =?utf-8?B?U3pPbGlCVkQ3RGM2cG1WTUNmSTcwUzZsNjJRN2NEdkZsUStJTC9VVUxlMzFi?=
 =?utf-8?B?N2tFeFlqMVFTMWNUTXhKOTgwTzFoWXd0dlVWZ1NyN1NJTW1RSjhWYnBMUVlm?=
 =?utf-8?B?TlRyOFY4MHlJcW9yQVRsY1lvYVZJeXIxMW5zRXVYdis1RUczVmk3dUhwMzZa?=
 =?utf-8?B?d0VaczVpa1FCQ2tvci9Xck4wbVl1Ti9lODcvZ3c1ak8zRFlLenFDUzd1RzZt?=
 =?utf-8?B?NHpKbG5KTXZXbEtrTForR3FobVBYZlFSZEFESXJ5YUhTZ09HVEpFbHU3TlpH?=
 =?utf-8?B?cTV0blBGTWR4UXpMdUh0Qmd3UU10T0I1aEVBS3ltVWhqMXJLam15T1g2aTBs?=
 =?utf-8?B?b2crMWFaYVlLWkt1emhDV1B4a0JnWEZYZEM0dDh4TC9SVzFZWGhsTjVKZDV2?=
 =?utf-8?B?RXllaU5MejRTQXpCcWVRcFcvZzJJbFlqSU9RWlAyQUpaVWdhNWdQUjRodnFX?=
 =?utf-8?B?WnRxVERKcVlIZzh1Yld2ZldYV0RBMGNiK0xzamRZSFhwbXpGbGpRU2RzbmFO?=
 =?utf-8?B?OWNVdWhhdmp0cjBndHdhYTE5Q3h6ZGRnOThmMUVXS2ppYlRET0pGZ0tJcGpK?=
 =?utf-8?B?NU5GZlpvRU9saU9sL1ZyV2ZEdThxTlZOUEJiekpNaUtOU2pzR0ljL09xYzc1?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e21a018-aca5-4b5e-f2d0-08dce74739fc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 03:13:48.4182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIWWRzyLmbTGX2RneVCrLUGxHrTCAVdKlfnwqL3IGBE0Cfru0cadcSe18o8NE2x2ionsbdmGwZdlXYisErivCeKap/wiAkLXMCJLM/LlMTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8532
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



On 08-10-2024 07:31, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>> Sent: Monday, October 7, 2024 10:54 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
>> Matthew <matthew.brost@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Gupta,
>> Anshuman <anshuman.gupta@intel.com>; Poosa, Karthik
>> <karthik.poosa@intel.com>
>> Subject: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an assertion
>> on MI_STORE execution time"
>>
>> The reported time does not reflect the completion time of MI_STORE_DWORD;
>> instead, it accounts for the delay in the scheduler.
>> Therefore, it represents the time taken between xe_exec and syncobj_wait.
>   igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> elapsed = igt_nsec_elapsed(&tv);
> elapsed is taken right after the syncobj_wait() therefore it represent the time taken by xe_exec + syncobj_wait, total time taken for completion of job.
> Thanks,
> Anshuman.


That's true, while writing "time taken between xe_exec and syncobj_wait" 
, I meant to convey in between start of xe_exec and syncobj_wait 
completion. Will rephrase commit message before pushing.

Thanks for pointing this.

Himal


>>
>> This reverts commit 92825ed72be61c5419d95db944fef1c9dda2215a.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Cc: Karthik Poosa <karthik.poosa@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c index
>> 772fe9b57..f4d05889c 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -144,15 +144,6 @@ static void exec_load(int fd, struct
>> drm_xe_engine_class_instance *hwe, unsigned
>>   			  1e-3 * submit,
>>   			  1e-3 * (elapsed - submit));
>>
>> -		/*
>> -		 * MI_STORE_DWORD generally completes within couple of
>> ms.
>> -		 * Assert if it takes more than 1.2 seconds, as it will cause
>> -		 * IGT test to timeout due to sleep of 120 seconds which is
>> -		 * the current per test timeout. Currently there is no way to
>> -		 * read this timeout from IGT test.
>> -		 */
>> -		igt_assert((uint64_t)elapsed < (uint64_t)(1.2 *
>> NSEC_PER_SEC));
>> -
>>   		syncobj_reset(fd, &syncobj, 1);
>>
>>   		/*
>> --
>> 2.34.1
> 

