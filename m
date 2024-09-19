Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6A3CE8D4C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 05:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBEC10E679;
	Thu, 19 Sep 2024 05:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cul/PgQT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B052A10E679
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 05:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726723747; x=1758259747;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gTzD3Q3Ec+cT3is0jBJkgPcD834qcTeubL4wo/Uajgk=;
 b=cul/PgQTYNI8Ch7rLRDVooiPF09Ki1Zumdf5kRKaHx+noOjUFHJkIPFn
 7XGWG6CLwhzWAO+FiFBU1DhqFopYP37fzOh/4NnDEgKEN5biOOI7wmMB7
 uKB2ys0YSPQQIQ0oYTPW67Je4IE587W16Fj95UgBWr3mUtwZUpbkXE7Vh
 CMSBD93QJOH09r8+ZrFzCoJLKWWIDhD79sVr2TR6VBhXtMoTZKj6YFuJD
 X1JoyVTWEnw6q63poTo6m6lRgZzBdKIp8jBGWkJMjJjWUfQDunQqlwc7w
 a5e/F6OaWkMwPmlz34wuLF00AQ91OVzR+4asX4vdxY8vKQJUTnejjOIFA A==;
X-CSE-ConnectionGUID: VdQSf1g+QF+u4eETBlxhpQ==
X-CSE-MsgGUID: f9tt8ucMSy2EeZ+uQqRxVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36252134"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="36252134"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 22:29:06 -0700
X-CSE-ConnectionGUID: wkEA6ZizQeemfyaVkvomSQ==
X-CSE-MsgGUID: YNsdoWWLTz6EWQ6bue2vgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="93088358"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 22:29:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 22:29:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 22:29:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 22:29:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 22:29:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoV04uK7PkvfdMbyulEcqWelKWvnBbLwI5/giZgN8mL+QDC7RE/SC5n/YTlIuccZ7qLzNXGAl5BBPssYmdLm1nmM1cbE44t1QuoKKvThJPX1w/oCjUoQmSkEnL7OK2afmCXh6ncpZoyzSwTHqSS2t2tOtQ88mK44gm1AOdLX3cIQcwLHR9tVNiy8KiyMuL1lLsaJZx36WvHnTl8MOY+YYKfY25+PLMYlBmgdEo4G7bRnhn/7PN8bAuBz76cHAAi9scMrlNH2XJJWOH9Srt4IbnU3ccseHmJQCXhbKN8g2QWx+1O1Q4AYempSLSAWGKWT155zLNk4vNPmflE238BiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUclpx34XV8yJpe8E3Z03vJobyBhZSJdw0HnU3XXGHA=;
 b=CeDxqUMafJuFWzAneWl99DQwlfkYopTnpfQ1zd0jAEEDPUgKOKloElS5IEcqrRQ02aWX5Fu7Qc7dTyzIAY4mKOLObXAL6uUjQg7t8ceDjfKyrME7Z0Oyl8+KAGCGi54FLgM2HLt5uryjay4RIwuM7fK+g5lOXjNO3fSk2rSeRMUph8orHCNpekNmI5jJrJ4bA5BelmGlcPoPlM1JRyBDWc4X0mYh6sTpydEvLEzyM6CEkjHQR3sUyOC6sCEQtdtKmVsNxLdSuYM8qEvu64UsdQAirR3A64Dpw2TsS1uxgxaKVvCLEIWRpUy19JwcjVutBmumfcedFi546bRv1NEEFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CO1PR11MB5156.namprd11.prod.outlook.com (2603:10b6:303:94::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.21; Thu, 19 Sep 2024 05:28:56 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.7962.027; Thu, 19 Sep 2024
 05:28:56 +0000
Message-ID: <b6851211-9a7a-45e8-b652-d01eee193a93@intel.com>
Date: Thu, 19 Sep 2024 10:58:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_universal_plane: Use COMMIT_ATOMIC flag
 when doing commit
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <jeevan.b@intel.com>
References: <20240918082918.792033-1-suraj.kandpal@intel.com>
 <20240918103359.792577-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240918103359.792577-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::18) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CO1PR11MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: 05430be1-a40f-435e-230f-08dcd86bf4f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0ZYUmswa21GM1lYb3ZldmRMTExqbnB1NXZGNUxzV3RtWVd3WnhjeTI5dlBi?=
 =?utf-8?B?bjgyZnFqV0ZzQVJCcEdmTmFDc3NVWURwd3J1YXNoY2QxUTdONitDTlZ3cTdr?=
 =?utf-8?B?aUYxTElQeE5LVWF2TENFN1VQTC9wVkFPOVdYZXNuODkreG1lV0Rva1FVZGp4?=
 =?utf-8?B?RUI5MGJxWnlmRWt2alQ2THVwSTd1UVdibzBSYXhYWFNiMnhINnh5clFpTjVs?=
 =?utf-8?B?TkJNRUtEN20xYnN6MHBwVFFTazlSMlZ0RXpxQVY0V2FKQ21rTDJINld6TFA5?=
 =?utf-8?B?Smx1aXlDWXQ0TDNNYWNsVFVlRW1BUXRTWFZVdGlUNlNGRms1c0JUN1hqTGdo?=
 =?utf-8?B?K1VCaU1GMGxwMVRIY0Nid1QvU3N3MTNpWldod2RUR2NIdjFwYnlNMVhteGEv?=
 =?utf-8?B?cERrZVpjN1ZpMUQ1ano5UWt1dWVRRnRUU2plZnV2MjVoYUlZY3FtOTJPWjUz?=
 =?utf-8?B?dEllaGhyMHFrd0tuYzNIYndaTGVaNEdiYkRZU2dFQjNjTGNrV1dBUjl3ZTJi?=
 =?utf-8?B?eFVmU0E0RVJ3dEIybjVtYTV5TjI1YUhIcUFvRFRGeC93anlpT0pieEZhWGpU?=
 =?utf-8?B?YUJvQVIydExvTWZIbWdKb3ZGSzJsc2UwdkFFdURJWnlvL2E2cmp5RldSYUtX?=
 =?utf-8?B?cWIyRFk4aFVyTnV4Y1BDeHJNd0I1Y0t5UGNwcTl0NzdVMUdodXV6cW0rVWVw?=
 =?utf-8?B?NE1TZlNrYkhrcStSR2JaejM4VlNsVlVRZTZpaWpOS1BjMy9JaGI1em9PY1Y5?=
 =?utf-8?B?azBQVnNjMExwZDN4Z0h0cXNLTWxvQzd5MEZxT2xORU10eFhnVVFFbFRKUWlZ?=
 =?utf-8?B?Q2tsbHkveXFyaWtURjkrNnMwaHFpL1Q3SEpYdUQ4ZjRvYlEyTHRKc29vSWhz?=
 =?utf-8?B?SU9VbTN6UmxoNmQ2UWJKUEk5bjBpRDR2Z3IrUTIyd0QvUyt0cjdwYWx6eURE?=
 =?utf-8?B?QWR6RlpRWHN4cVlzL25VdVRpZ1QvUFRocFpVWmp5Njl5czAwMm54NThYQ2ZX?=
 =?utf-8?B?WCs3VGh5eFRFb1crYjlnR1VEcVdOczJ1THlnS21nS1VJdkpHdE0rNi9UNmdH?=
 =?utf-8?B?b2I3ZHdDamtsVGVlcnU5UG8ybWErTGl5Rm92L3VMdTdIdFgxQXhSaFl2Z0ZZ?=
 =?utf-8?B?V2RGVnNtc0ZHMk9XaXJxMjg3L3pTQlpYZXpqOEZTNXMwc29PMWU5ZkRUZkxq?=
 =?utf-8?B?WmRBcHFrVjRnMGZ1VEFyRUFhaWswQ1NmMmtkcGVkMEdtVnh4WHpUUkdXeUNO?=
 =?utf-8?B?Z2VsT2RCTTg4eG1WLzFEQ2tINGwrQnRoMzZzZWxpcXc1VEo5SkdzY2JBcEgx?=
 =?utf-8?B?WVZTVXBodkhjSkRCNVZLUzJ2bGRmRkYzQVRXVlhGMVpvLzBJT0VjZGZBSU1M?=
 =?utf-8?B?OCtibWhiWHdDMGo2K1FjYmpGaDhZWXJCRElHdUE5VlZPTStDYmM1ZHN6Qk9x?=
 =?utf-8?B?NTR1K1pSZDNuSldxVGk0ZlNCSVlWSDJIcTVKd3crZ2g0cUdaN0JWT0g2YW81?=
 =?utf-8?B?NFRvMTdjTXlJSUV2dlZsbzFiUmxBRWZYSXE1QitNaDBIS2xJWUhIUVhRWklY?=
 =?utf-8?B?ZWRoYWtKYlpwYmp3Q1B3c1hGUTJtQ2xUamVMVlBGTXE4WExPNzFDZE9uTmZi?=
 =?utf-8?B?Ym9LR0xlMHRqY0Q2ZUtNOURhc2FXMjd6MmlqdTJSSDVZVXh4dnJmNVlaQmVW?=
 =?utf-8?B?TzBudCtzb2tiY3ExUVFNUU1DYlQwZG1FbDUzREowNUY3dHVVNkgyVzAxQVh2?=
 =?utf-8?B?K05CbnVUZUlmcTVXd01WVWZRU0lRL01DSWo4ZjkyQzdqSkhWZ0tCZVdyaUND?=
 =?utf-8?B?NUQvS2ZhaVplR1JZMVdUdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0M3UzdvM0FvRUZFV3VJYVdzV054VFFSQnFpamp2bUpvYzd3bUh6Z0RxSHZN?=
 =?utf-8?B?NEU4S2FmVnZvLytpMmkxVkhBVDNTbTNuR2VrZEV6UUVuekw2OHJ0TTUvZHB0?=
 =?utf-8?B?VlVWcFVPK3RqYXAyUGxvMHFIZ1k2ZUowZjV0UG1vZGJwbmdXYjloaXM0ZnA1?=
 =?utf-8?B?OXpyckRxc0tMWWRnZDFIWDJTeXU3NGdtYlRPQTBmeWZkU1NXcFp3QVFSNEdo?=
 =?utf-8?B?aXBJc2lKWDZzTkk1Y3VXWjdWRDlEQU1zRkRtaXFBNjFpMmsyU3Y0cGoyZVNa?=
 =?utf-8?B?NTJQWkxibkJHRk56NW5nczZtdFhLZFp5ZDRYUzRpdHRWZ2FzcC81Z3hFRTZE?=
 =?utf-8?B?bytDejFmbzkwV3h4ck0yS1NiQVFwenM3VnJMWUFnWHJTekhibjVEVERIaE0r?=
 =?utf-8?B?Uzdwd3VuUlMwbkF1KzRvRU1pUXNoT3c3U1pGMWZkbVlmclVoTU1MeUhrdEJP?=
 =?utf-8?B?MVZSTVBsY0tPSi9vSUJaamlWNE9YazBicEhGRW1uRlV3Rkl2dDl2UFFGSFIx?=
 =?utf-8?B?TGpzVGdvQ214WjdPdUFKNkF2Z0JTc3RrbmZQc1B5QkxWRVdOVVovWWVTOHFt?=
 =?utf-8?B?Uk1BWStoWnlFVm50MjJQeHpXc2cxdVFRYkUxWVJLWmc0N0d0cTBUMHp5emR5?=
 =?utf-8?B?YTAwdHdhK3RLMCs2am1LenRjcm1kS2NldlR2UzIyUDMxV0lJNXNvUEpBaTJW?=
 =?utf-8?B?eUNDNWt6ZFVuM0pRc1YwKzl6YmF4NFpoTkdMY3gxaE9SSzJaM0N4cU9oaGxr?=
 =?utf-8?B?SEJ4dWZJZk0vSkNicTltY1g1U2pOL1doN3lJeE82WTFOTGhFQ0s4SjlvcDI2?=
 =?utf-8?B?Nks5QW02QlNTNStYY2FkWm9TWHpYZCtKeTVpRks0VTgyNWl4TzRYclE3NjRr?=
 =?utf-8?B?cE92eVl6TDVndlF0dUd4UmVNMU02M3l5WTNGU21kWkI0anZpWUJ2elBFUEpp?=
 =?utf-8?B?WjNZMmUwTlVIRExMZnF3bVRsYlJ6OFBwSTJYcEc4WEFnZ2kwVHJqR0YyeXV1?=
 =?utf-8?B?MXNXemdiUlF1akdCNmlSMDZtRFAyV0ZaNjUxSnpOTFlRdW03UmZCZTQ0RVdp?=
 =?utf-8?B?U0RMMGRmdjU1blJaSFM3a0FUSEVPVkRXK09mbW5wa084aysycXdJUFdOby9q?=
 =?utf-8?B?ZzVVODFaYktOZXRGeHZ3MWtZY2U2U3JsOHp3WWNGb0NzaVEwQ2ora1FDZDg5?=
 =?utf-8?B?NzZKMkJrand1ZHhqZHlla0laZmxRa1d1U2hHQmY3bFh5enYyUkdMZlBRRXBF?=
 =?utf-8?B?MVVxY1BuSGE1aHVYWmpNblQwbjdaeDJuaXVSeTYzSGNHN2JIWFNJdU92TzhD?=
 =?utf-8?B?K1lySFNiTFplVUdNOHd3a2ZES1lSSXYzM2YxZ0NCU2pKZjlFQXg0UzdNVEhj?=
 =?utf-8?B?ZXBBNkEwd0F2b0s5SDk1QVBqL05wb3NJUExMaXpMeGgwbHBkY09zYTVPaGU3?=
 =?utf-8?B?bDBGK1VDaFRjSXJBL0FWVlQ5K2xQUUN4OVZzLzVqRmYrN0VqVDhaMjRtdkJv?=
 =?utf-8?B?MVVUQ3dwQWFubHV5UHhKSmZxMUU3V2JSZDBWYlRTT2pWRzA2eXRMZ0VrM0pm?=
 =?utf-8?B?UXU0Z2FzL2UzdHJJQ1FQWFM3TTJLWGdQZFNINS9iZEh5aGtOdUNvay8xSzYw?=
 =?utf-8?B?c0U3eFBwc1NZWlQvMzF5TFJROVZaWkNISFM1RWlMOWxpL2VSK2IwZmtVZHN4?=
 =?utf-8?B?MEF1RHpGWmtqOFFscUhQLzM2YW1rTE02ZElxVHkwZE1BYXl5aUhxSXJkSW90?=
 =?utf-8?B?YWNZdGNRcW1UM1VUSTQ4b0M0UFlVdWJaOUNLb2pJYlI3VTFvWmpCOE9uWlFF?=
 =?utf-8?B?eWNTU1JnaExsU1hTNWw5TVNDYmlrdFovcS9yVDkwVFM1OENJL3p3WmxiVms2?=
 =?utf-8?B?U20wWHFLREFFcm9FbUpLOWtIVXAzY3htMGlYWXBaMndtY1U5V3MyeEltZ1hP?=
 =?utf-8?B?V2I1UHlwMmlDMnFQUHhLKzVEVnZjK2hQVENQN2VyYnVsNU0zdlJuaFJvQ2tu?=
 =?utf-8?B?dmw3QmhMS0UzRVZYMVJzR0N3aFZDOEpURVhsVzJqcXFZdWxaNWMvcmVLbHJM?=
 =?utf-8?B?L2ZXeWtFcGkwQWFNL0c0dWNJd01Tbk5VYzdxUlc5ZmhYRGRVQkZwMWYzT09Y?=
 =?utf-8?B?eVRPZXMzL082RldUYmhLWStjWXhmdHdVSnpUcm4yS3VwLzNPei9mRnMrTFlu?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05430be1-a40f-435e-230f-08dcd86bf4f6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 05:28:56.3844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+9aDhR0Xbr2/TceRm0nngw+qmCbkGowUDsVZAmCZNLlSp3cHoMXpqO9YLHl+rsqWVSoe59iFvRGXzw3F0drOvlUGZMIcuWvVD6Ur1yYmb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5156
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


On 18-09-2024 04:03 pm, Suraj Kandpal wrote:
> Use COMMIT_ATOMIC flag when doing a display commit so that we make
> sure to wait for all the cleanup work to be done before going and
> reading the i915_gem_framebuffer entry otherwise it may end up
> showing an incorrect count sporadically if the cleanup takes
> place after the count is read.
> 
> --v2
> -Use is_atomic variable to decide on the flag [Bhanu]
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/kms_universal_plane.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 8c1ce8143..7e80b1389 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -702,7 +702,8 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	/* Release our framebuffer handles before we take a second count */
>   	igt_plane_set_fb(primary, NULL);
>   	igt_plane_set_fb(cursor, NULL);
> -	igt_display_commit2(display, COMMIT_LEGACY);
> +	igt_display_commit2(display, display->is_atomic ?
> +			    COMMIT_ATOMIC : COMMIT_LEGACY);
>   	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
>   
>   	/* We should be back to the same framebuffer count as when we started */
