Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D35C636ED
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 18:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B5610E5A2;
	Wed, 28 Aug 2024 18:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGlUq9qO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8420210E5A2
 for <IGT-Dev@lists.freedesktop.org>; Wed, 28 Aug 2024 18:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724868205; x=1756404205;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=B2Et28wHQ+IzXsONA3rQk/9fSbs0Y3b+AcKLuyt9zs8=;
 b=PGlUq9qOLa4eKquFc86iP7cQ3TFItRf9aF9p5w4OCQoG5PF2BajDTlnY
 xyeA/w5HGXDEW9/GKyDxxyc3s/Qyauc876D8lmhXbMW9sOeP+reoGJQUv
 Ne0ccO2w9lnaBU5/kTJs6vkAE3UoCvE+z3fapNFM9pJrDK0zZYB9j1A9v
 ICg7VCX9URT5cFIskjO0mKR/Rztm7YaD50GHvZmk1CpgC5ePuYw1osslW
 2fOGYTctVVaXeId0HWhLWyU4OeCkcA/8xLEMZ07kngDzk6tNrqH6Zc8x+
 3G+UnMC7chjIBoEJT3X0cJoc98FTzrPrmRp/PMpNH8bCYncY18ZXzSD/T Q==;
X-CSE-ConnectionGUID: 3nK5DhdxTL+dg9qtbw9bMA==
X-CSE-MsgGUID: DuGT2xzzSb6DdM506JAomw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="22941418"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="22941418"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 11:03:24 -0700
X-CSE-ConnectionGUID: m3DtvG8IR8i80YhUhfaECQ==
X-CSE-MsgGUID: zgFJd0KWR7CX1W/BTOqGlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63824871"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 11:03:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 11:03:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 11:03:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 11:03:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWhHABB7sFIpxCatYNL2FyxxRfAFrglK9qjr2VByEUXTJ4a7HFCg8S++MJN6eQt0xVYaMm7uRzKpmXz7kYYOk4gvW2C9Q8lIv5YuiEkQaMORXKfwBugD6Tew1J7IBjhMrrf/I8IaEbDnYYmRIeR6mRgN7qU7joPqV1/mm0A1Qh3/BH8AA3zPEIZYGRUa0klQeZ6uempLk0ybHMv2e/o7DYva6Zhj1NjvZO5KN4L9Vz70Z7fiv0Fom0EqL21+EhAFRzTOwUApJYVIJpjJkJB/ds3KCRoV1phzTBkhgnbgefJdgvOdkBwtSeJE9i5k19X+ifxAfvbBTiRV7QQQZakOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aV0dMAdS5moTFqJ1DhPvZF4RXzVWT/sqh29IH+Z5XI0=;
 b=RHn5JxuthVzw21Zuz/BQ9QAiRXzd0tCptRLgnJsFd9aiOC4aqbhTZVQ/3MrBUaBOnu4dtloabkyVluTAxJSvDSCop7XM84m4GnngAzF1wQX/eyT+GqSr5yhF2hTgOVwvsDFqhsERmN/LeRWuk2yDDcOaiafRo8qWmG9uciN6NSYWsJSlz5dSH/tJJLH200V0oRGygV28i6+6fwZZEW53bsNJWsvL3z3/7D1ZlPkNqbEcEH3XgirIrDeTwX0LmqoEWwPYUK8oae9yKdxD+3jAPkD1HEMWdN3wzwckK4FRSUK6vk9MPXsNOW28jsANkVtXVHfnFHc6Vqy7dHB3VQXvRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB8490.namprd11.prod.outlook.com (2603:10b6:806:3a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 18:03:20 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7875.019; Wed, 28 Aug 2024
 18:03:19 +0000
Message-ID: <78faf589-98a4-4717-80bc-1d8253e3fe79@intel.com>
Date: Wed, 28 Aug 2024 11:03:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC i-g-t] kunit: Remove hard-coded test list from xe_live_ktest
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <IGT-Dev@Lists.FreeDesktop.Org>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>
References: <20240823182418.1771456-1-John.C.Harrison@Intel.com>
 <20240826114645.76jn7mlknpirgoml@kamilkon-DESK.igk.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240826114645.76jn7mlknpirgoml@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::13) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 0687985c-8978-4718-b43e-08dcc78bb2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yk5uZDdGVmxlZnVwYjQ4ZGwyakJKTXo5c2VCazJBckN3eU1wM2NRQkM3MUtC?=
 =?utf-8?B?YlJpd0R2cExWOWUxeFFaWVd4ckJyMHdwb29MZUdNOFgvN3NRN0V2bVV3akx1?=
 =?utf-8?B?YTJhd29ac3ErSTV3M0xZZDRnTndPdGlhZ1NrTVJLSVhTNncwOWg4UEhqY0RB?=
 =?utf-8?B?YVhrTUhuSUNXZ1hMMG1PUGpUTlgxYnRaVnBPQTI2MkVyZ0xDcTV3ZldRQkZE?=
 =?utf-8?B?SWpQZlpYMGZrSTN1WlFxTUo0NER2b21nR2hBdnAwZUU5eGdrZHlSWjhkR0NS?=
 =?utf-8?B?UzVVMndZWTRva1VSc2lRN0lRQk01aUNRaDdUc0RDN1AzM0tzRkVwbWRsdG9K?=
 =?utf-8?B?Y2hGR1FjbkliUnRETnVyajl2UnN2ZTVRSjA1elR6OEJXNit4M0grS3BoOHZH?=
 =?utf-8?B?VXlUaXpXRi83QXFGVnM5dTIwLzV3cmF6N1JyckdQYlVWYkJqeWxmOVZCWC95?=
 =?utf-8?B?SldyRDFJWGVXcWp0V0lSS3hIQkc3QS9rRlJoM0RFeU1yT1k5SDkvTGpWUTdQ?=
 =?utf-8?B?dEZuUWpGQUhYcmJvK1NIR3puYWh0cHZVWTNLWUZKeHVEZGpwOTgybldvemhL?=
 =?utf-8?B?NjhrVDFVNFkraWVEVFo0b1paQjlrcFg4WUE3RnRJSERuL0tHak5IcHZVMllX?=
 =?utf-8?B?QXBZa3RHV2NmdHNLSlpvbHRFRnFic0FodmxBd0hWQ0J1ZkFNNExtL0NOVHVa?=
 =?utf-8?B?VjJIZTJUK2Q0S2h5T1N1ZlRaZWVDR2ZYUC9sUVJUSHBLYVJ0OUVoRmZlNlQy?=
 =?utf-8?B?cDZUcGNXektWK2tGMjVya1Z2YjZ2VnUxaTFIZzh2a0VTS2V2OGpwVGxjdVpS?=
 =?utf-8?B?aGFCMDV5M2RLb3g5QTRXSDZMU3R3WkYyOExJeVBNUS83WkdzQ01FN0tZTHJj?=
 =?utf-8?B?bHVHTGM2VG9wYmVqUGpxcEk2RjJKZWZ4NHVUd3Q1RG5KajduZ0lHb2dlcTQ4?=
 =?utf-8?B?SHBUTGZFeHI0YzEzbktvTFlDM2JqT0dNNUlMZDBXQXNXZUFWc3pxSExQellE?=
 =?utf-8?B?RVg0ZnRGNGNxRzdNMWtTd09RRWtvVXNaMXNucDRLZFI0eE8vVi9ISUxnaGVO?=
 =?utf-8?B?bmx1L3FNK1hWdml6N0IwYXpyQUV2VHNJN1ZDR1loL2l2RU80VS8wVExUeEVn?=
 =?utf-8?B?dC9PWFpqT2tNSG0wTTA1QXhCTExFZHZacFIxbkRsMTB5azRlR29yN0kxSWx3?=
 =?utf-8?B?QzVDN3k2UnNBSnpOMmFsVUpGQTFJUHYxd2U4TkVwUjkvR21SaXhNbGhuV25v?=
 =?utf-8?B?SER1M2dVaVlsSCtRYWlsOTZiSkQwQjVoQ05NbEwvT05jc09MUDV4QVRVTy91?=
 =?utf-8?B?VndaaDFJODl2UVFvc2FHaTQwNm9wM2pseDk4OTVzMmxTdlk3aTltR1JTc0xK?=
 =?utf-8?B?cFdGUUlaMzZrcjR2bU93c3A4MkNjcUhBTEF4NWpmQ2FvendxQk1IZmxYalRC?=
 =?utf-8?B?c2VDb0pvTGF2emlreTdNUUtYSEZzbXQzVHVJNVVjMlZvd2g3Q2podU1JSVZh?=
 =?utf-8?B?K2ozMit1TzE1YlNjK1FUWFBNQkZZQ09NSU55V3VSVHJZSjVQejBnbTB0dXhV?=
 =?utf-8?B?ZGtSL0VzUEZYay9XWXp0VXRiVGpadjZRSWdxK1JyeXM0ZDI4VllZbmZBQ0NG?=
 =?utf-8?B?ZFVvMUphQ3d2ZWZ4UHUvS0d5ZzNFT2xrMGlEQW1OUTh6MW1KZjMycmZIaG9O?=
 =?utf-8?B?Qi9MVmNqQ3ZMRXNITUhhTkJnVHFFWDFYenZyKzVHeXNqbklHOTVzYnFiNWdM?=
 =?utf-8?B?Y3hsNWRuYVU4ZGFURXRkT1RMbXcyRFEwWUgyekxPNmhTV3V6aFo4Nk5OR3Zv?=
 =?utf-8?B?Q3B3QlFEaFV5R2JXYkIwQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1BNeWIwRlNwVllHcFd6WCtITXlERXV3UC9OSENFODhBWmVCVlh6TkRIZ2dx?=
 =?utf-8?B?N1pSTlg2c1JqbGp1Z3BjbDlHZHI5Mk5KNXJpaGgzQkl4c1NoRXQwZ09vMVdL?=
 =?utf-8?B?ZjFGQ0JpMFlUMnIra0ppTnUrc2xWWW05ejhWOGRzN3Vwcko4cWMzb3F4dG1l?=
 =?utf-8?B?TG9BSU9BWW80SElSTTRpcHRCeUxLUkpMMnVhLzZUK0RvRytwSHlxangyYXBh?=
 =?utf-8?B?cElNdGdVYjl1ZGxGcmRiZlVRQTNsdndwMlc5V2t2c3oxeU9kMTFub1BJSWkw?=
 =?utf-8?B?aFNXc2xJckRkbDkxY2JUaWJ6Y2VLQjFEQU5LRjh6OGFhQjdHSzdkZHNZcStk?=
 =?utf-8?B?RXhIOTZHMjdRbDFzNjZPTklwakNKYUh3WXF5WWM4WjVvR2NoN21Ya0NuWCtC?=
 =?utf-8?B?eHhKYS9kOVh6V3NSZTBJQkFrMkJVNFRvZXRnS0pWMzRROFdvMXliTzZCTTFh?=
 =?utf-8?B?ZWliNVdjeFVqQ3V0RXJ3VDloK0JxUzR3UGVwQkN1VTVnSmttamhWQWtmVVJE?=
 =?utf-8?B?L21GbzdESTFXd3VuZENydGxBMHJBRjRUaGtMdDF6U3lQQ2xpdlRaOXMxQ1d5?=
 =?utf-8?B?c0NrZThpb1o0M2xPcWV5eDF3djdjSldjWEcvL0hIZGdpaXo4ZmtSYXVNcktL?=
 =?utf-8?B?eUJpRVM2Wko3YTMxb2JQUjZRQW1CVkNHNVFFdUxtZzFETFAwZFIwU3lVVkZY?=
 =?utf-8?B?MHlHU3JTL3NWUGgrWVdmRW02aXNZeEpuR1laY1RjOGYyYjlEUmZlVGVWT0Nx?=
 =?utf-8?B?WDlzdk5xK2hLdFZ0NCsyeFlzc1FGVGVrYm5MYXdmTFJ4M2NIS1dRMllCb1ZU?=
 =?utf-8?B?LzVxaEhzY25vRXFtNU9uTWJvdG9KVWNoRjNFZDFMTm5PbTh5ZUtLMEFFaVVv?=
 =?utf-8?B?c2U3TW5lSDVlZzllOUd4NHRtTUpHSkc2d2hsR1RGRHN4UmtTSjQ3ZjBhKzk4?=
 =?utf-8?B?VFFWSU9GUzM2cGw5bjR1THlxZ1BPanROcEduMjU3NzNIWGgrMmtnWmpJWE9X?=
 =?utf-8?B?ZlMrZllaUXcxNVpxSUFiOVdZcUpwdk9XK3lpMDVmNFRBOU00clBzUzF0VkRw?=
 =?utf-8?B?WEtRNkZTSVB4OEtJMHVscm95VWUrZlZUQ2hhWTlmaWlFQVoxSjY5Q25GRHY3?=
 =?utf-8?B?TldhWGxYS1kwSVJ4NUpkYU1ZcEtoMTJYSG9MM1EzTWJmS3BydGJrRFNxaUpK?=
 =?utf-8?B?aDVma1FPZ1A2Sk12MDBBa1EwU0xWdyt1M0U0QzJxSTNOWlhpNUYzSXB4cmE5?=
 =?utf-8?B?bk9hdWJvYzJyWEdMNGtwdmpUQ2FPb0lvOHAzSWI2RG1lWGtnclJrTDJ5MTRI?=
 =?utf-8?B?c2cyV3BUV25tNlJ1U3BlYmxUNGVmbEV6V0ZsTEZ4VDZPVm81dXJoM2lCamNw?=
 =?utf-8?B?eUliWnRjYzAzRE5rVHdUVS9CL3FsWWNYUnFnL1dLM2d4WnYyNENUUG9qN2Ju?=
 =?utf-8?B?VllycWw4WllZcWpmTEJSOUQwbFpKUkoyTElTRWFHVFNxSDRYNnpDd3JDUlpU?=
 =?utf-8?B?SVhtRkR4VEI1a0t4c25zRkFDaWcwRStZeEVzckF3TWc1VFl1NHdEK255RE5u?=
 =?utf-8?B?bThNbkNKdDZ6VHhCUzdqZVBUR1dLTXd4Q0pMOGwyS3ZZdHVnQ253Sk1kSm9s?=
 =?utf-8?B?SE9BYVM2SG9lNWR5ZnRsTUN4cEs5WSt5K1NCa0U1c0F5dnVEV0NkeDFtbkxJ?=
 =?utf-8?B?NnB6YklLVUNYYTJTUzdmL0VLL3NLWXdHdlRMbERWa2p6bFRnV1hIWHovTThm?=
 =?utf-8?B?YzZLSGI5QUMzOFU2aWF1dDI0L1ZuL0lkVVEvRGthKzVoZlVOVTluTDZUK1Za?=
 =?utf-8?B?VysrTXBLQWI2WGM4NDNoRFVpTUdualVDSTd3UTJRZEpaSUlqTHR0T0V6VTJK?=
 =?utf-8?B?cEt1WlZZM25GSlpwZDk4a2pmS0lKdmNWdVZOZjRMUkF5cGZ6bzdHMWlhSmRV?=
 =?utf-8?B?WFJ0YWZZcEs4YVdrdmxmbzZkaEFHYlpNSXM2cmQzZUlnSzdqM05ISXBoU0Iy?=
 =?utf-8?B?L1hBYkNHOUZEU3JxbHdPZHppQTQzMUttb2FUdm5FSmVnczFqS2dDV0tVV1NX?=
 =?utf-8?B?dk5jUlZYMG9wbzNjVzlXQkx5Sm9sWUlhYVdMK09mZktzRlQxa0I4NHFkS0lW?=
 =?utf-8?B?UElhcTNOWkhVQ0c5TzZOL0d6NC9HYzlNVTFKTmNWZkgrN3Z2d1JTQzVQQWIw?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0687985c-8978-4718-b43e-08dcc78bb2de
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 18:03:19.6976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q18S79eD4QThPtqb7hPg7vTIJPNHo2V2R0SqRgHR52jkGBTNmLmKOPnOGzrHSNw8NmdPk+qEkow+q9gO57YVUkWNxRoVYVZP4Ms8GZbELDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8490
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

On 8/26/2024 04:46, Kamil Konieczny wrote:
> Hi John.C.Harrison,
> On 2024-08-23 at 11:24:18 -0700, John.C.Harrison@Intel.com wrote:
>> From: johnharr <johnharr@invalid-email.com>
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Again invalid e-mail here.
Hmm. I don't get where this is coming from! Running 'git config --list | 
grep email' gives me a whole bunch of different email settings, aliases, 
target lists, etc. but nothing at all mentions 'invalid'. Creating 
patches from any of my other trees does not have this issue. Doesn't 
make sense!

>
>> The list of supported kunit tests is currently hard coded. Which means
>> that adding a new test to the kernel also requires patches to IGT as
>> well.
>>
>> The list of available kunit tests is already exported by the kernel.
>> So there is no need to bake a list into the IGT source code. So, add
>> support for querying the test list dynamically.
>>
>> NB: Currently, the test list can only be queried by root but the IGT
>> build system queries all tests at compile time. In theory this should
>> not be a problem. However, the kunit helper code is all written to run
>> inside a test and not inside the prep code, which means that when it
>> fails to open the root only interfaces, it calls 'skip'. And skip is
>> not allowed outside of running a test. Hence the build fails with:
>>    skipping is allowed only in fixtures, subtests or igt_simple_main
> Looks like we should fix it, move out skips from kunit libs.
>
>> And of course, putting all the query code inside an igt_fixture block
>> means it doesn't get run as part of --show-testlist or --list-subtests.
>>
>> Reworking the kunit code to fail cleanly rather than skipping
>> everywhere seems much more invasive. It is also not clear why the
>> kunit code is considered 'library' when it is execlusively used from
>> the kunit test alone!? So posting this as an RFC before going too far
>> down the possible rabbit hole.
>>
> As I see this, it is a lib because some other vendor (like amdpgu)
> could use it.
>
> +cc Janusz
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>
> btw could you split this into two patches, one for lib/* and
> one for tests/intel/xe_live_ktest ?
Not really. The library changes re-work the interface. So splitting into 
two patches means that the test would not compile after the first patch 
is applied.

>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   lib/igt_kmod.c              | 68 +++++++++++++++++++++++++++++++++++++
>>   lib/igt_kmod.h              |  6 ++++
>>   tests/intel/xe_live_ktest.c | 60 ++++++++++++++++----------------
>>   3 files changed, 103 insertions(+), 31 deletions(-)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index 464c0dcf484a..69c1254b397c 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -1414,6 +1414,74 @@ static void __igt_kunit(struct igt_ktest *tst,
>>   	}
>>   }
>>   
>> +/**
>> + * igt_kunit:
>> + * @module_name: the name of the module
>> + * @suite: the name of test suite to be executed, also used as subtest name;
>> + *	   if NULL then test cases from all test suites provided by the module
>> + *	   are executed as dynamic sub-subtests of one IGT subtest, which name
>> + *	   is derived from the module name by cutting off its optional trailing
>> + *	   _test or _kunit suffix
>> + * @opts: options to load the module
>> + *
>> + * Loads the test module, parses its (k)tap dmesg output, then unloads it
>> + */
>> +void igt_kunit_get_test_names(const char *module_name, const char *opts, struct igt_list_head *names)
>> +{
>> +	char debugfs_path[PATH_MAX] = { '\0', };
>> +	struct igt_ktest tst = { .kmsg = -1, };
>> +	struct igt_ktap_results *ktap = NULL;
>> +	const char *subtest;
>> +	char *suite_name = NULL, *case_name = NULL;
>> +	DIR *debugfs_dir = NULL;
>> +	IGT_LIST_HEAD(tests);
>> +
>> +	subtest = strdup(module_name);
>> +	if (!igt_debug_on(!subtest)) {
>> +		char *suffix = strstr(subtest, "_test");
>> +
>> +		if (!suffix)
>> +			suffix = strstr(subtest, "_kunit");
>> +
>> +		if (suffix)
>> +			*suffix = '\0';
>> +	}
>> +
>> +	igt_require(subtest);
>> +
>> +	igt_require(!igt_ktest_init(&tst, module_name));
>> +	igt_require(!igt_ktest_begin(&tst));
>> +
>> +	igt_ignore_warn(igt_kmod_load("kunit", NULL));
>> +
>> +	kunit_debugfs_path(debugfs_path);
>> +	igt_info("kunit path: %s\n", debugfs_path);
>> +	if (igt_debug_on(!*debugfs_path) ||
>> +	    !kunit_get_tests(&tests, &tst, NULL, opts, debugfs_path, &debugfs_dir, &ktap)) {
>> +		igt_info("kunit - no tests found!?\n");
>> +	} else {
>> +		struct igt_ktap_result *t;
>> +		igt_info("kunit tests:\n");
>> +		igt_list_for_each_entry(t, &tests, link) {
>> +			struct igt_kunit_names *name = malloc(sizeof(*name));
>> +			name->suite = strdup(t->suite_name);
>> +			name->sub = strdup(t->case_name);
>> +			igt_info("  %s / %s\n", t->suite_name, t->case_name);
>> +			igt_list_add(&name->link, names);
>> +		}
>> +	}
>> +
>> +	igt_ktap_free(&ktap);
>> +
>> +	kunit_results_free(&tests, &suite_name, &case_name);
>> +
>> +	if (debugfs_dir)
>> +		closedir(debugfs_dir);
>> +
>> +	igt_ktest_end(&tst);
>> +	igt_ktest_fini(&tst);
>> +}
>> +
>>   /**
>>    * igt_kunit:
>>    * @module_name: the name of the module
>> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
>> index efb46da128d4..2f608eb69d48 100644
>> --- a/lib/igt_kmod.h
>> +++ b/lib/igt_kmod.h
>> @@ -71,7 +71,13 @@ static inline int igt_xe_driver_unload(void)
>>   int igt_amdgpu_driver_load(const char *opts);
>>   int igt_amdgpu_driver_unload(void);
>>   
>> +struct igt_kunit_names {
>> +	char *suite;
>> +	char *sub;
>> +	struct igt_list_head link;
>> +};
>>   void igt_kunit(const char *module_name, const char *name, const char *opts);
>> +void igt_kunit_get_test_names(const char *module_name, const char *opts, struct igt_list_head *names);
>>   
>>   void igt_kselftests(const char *module_name,
>>   		    const char *module_options,
>> diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
>> index 4376d5df7751..13265e87ba9d 100644
>> --- a/tests/intel/xe_live_ktest.c
>> +++ b/tests/intel/xe_live_ktest.c
>> @@ -9,40 +9,38 @@
>>    * Sub-category: kunit
>>    * Functionality: kunit test
>>    * Test category: functionality test
>> - *
>> - * SUBTEST: xe_bo
>> - * Description:
>> - *	Kernel dynamic selftests to check if GPU buffer objects are
>> - *	being handled properly.
>> - * Functionality: bo
>> - *
>> - * SUBTEST: xe_dma_buf
>> - * Description: Kernel dynamic selftests for dmabuf functionality.
>> - * Functionality: dmabuf test
>> - *
>> - * SUBTEST: xe_migrate
>> - * Description:
>> - *	Kernel dynamic selftests to check if page table migrations
>> - *	are working properly.
>> - * Functionality: migrate
>> - *
>> - * SUBTEST: xe_mocs
>> - * Description:
>> - *	Kernel dynamic selftests to check mocs configuration.
>> - * Functionality: mocs configuration
>>    */
>>   
> Does that mean we will not have any subtests here? The point
> into moving subtests names into documentation was to have a testlist
> generated during compilation, so it will not depend on running
> test with --list option. Adding also Katarzyna to cc.
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
I'm not seeing how else this can be done. Either the test list is hard 
coded in the test or it is dynamically generated from the kernel module 
at run time. And if it is dynamically generated then it can only be 
queried by root not a regular user. So including it as auto-generation 
at compile time is broken. You could move the dynamically generated list 
into a sub-test level and have just one top level test that statically 
created and called 'all_kunit_tests' or something. No idea how to go 
about re-working all the kunit library code to create sub-tests instead 
of top level tests, though.

John.

>
> Regards,
> Kamil
>
>> -static const char *live_tests[] = {
>> -	"xe_bo",
>> -	"xe_dma_buf",
>> -	"xe_migrate",
>> -	"xe_mocs",
>> -};
>> -
>>   igt_main
>>   {
>> -	int i;
>> +	IGT_LIST_HEAD(names);
>> +	IGT_LIST_HEAD(done);
>> +	struct igt_kunit_names *name, *cmp;
>> +
>> +	igt_kunit_get_test_names("xe_live_test", NULL, &names);
>> +
>> +	while (!igt_list_empty(&names)) {
>> +		bool found = false;
>> +
>> +		name = igt_list_first_entry(&names, name, link);
>> +		igt_list_del(&name->link);
>> +
>> +		/*
>> +		 * Retuned list is sub-tests.
>> +		 * So, need filter out duplicated top level names.
>> +		 */
>> +		igt_list_for_each_entry(cmp, &done, link) {
>> +			if (strcmp(name->suite, cmp->suite) != 0)
>> +				continue;
>> +
>> +			found = true;
>> +		}
>> +
>> +		if (found)
>> +			continue;
>> +
>> +		igt_list_add(&name->link, &done);
>>   
>> -	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
>> -		igt_kunit("xe_live_test", live_tests[i], NULL);
>> +		igt_kunit("xe_live_test", name->suite, NULL);
>> +	}
>>   }
>> -- 
>> 2.46.0
>>

