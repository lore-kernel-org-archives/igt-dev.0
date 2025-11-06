Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED36CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 10:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3F310E86D;
	Thu,  6 Nov 2025 10:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUSUD/WX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD4A10E86D
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762423471; x=1793959471;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ebB657LwW0rq5agUdPHFc+de3V+PVMBFGHjHfSe7HVY=;
 b=AUSUD/WXVfGSToDwO0xzlD3mxyaUQsvsjdkiL/8j6GP/6UtpDxAgwcX8
 Fh5nuMKVS5XRJiHgTHmxfK3ecq4sDsA7JGRkScoHusSEvSpM4/MfcGvfJ
 WPkWgUaC8AX+i9BTkAXPg/SfwK0FDuc2Ee5qBqd+xXbyPR/qeeL72+UNK
 iYZzEbprSG1NBvaTjChuN5+aga0Basqgzeo51jO6xShEAG2o/Kupp9K0s
 B/C13Q3zQfFioTTQk+71/UGLdHxMWLk8CGjtfnMY6L7wYqyYK/ifI0R6/
 75KZWonrT5wUP3V8mS/aJbMsrj2GhoFSg6MpxdL6/fVlY7gSVP+iWIm0q A==;
X-CSE-ConnectionGUID: BYzyIZ7YRGCQQRuxsjt2nQ==
X-CSE-MsgGUID: OYd3xAMsRpaYb1H9yyOEgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="74847072"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="74847072"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:04:31 -0800
X-CSE-ConnectionGUID: L47DqnfvQxKYFyOp7zVzyw==
X-CSE-MsgGUID: 9fVzNen0Tw29necAJ6ZE+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="218380232"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:04:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 02:04:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 02:04:30 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 02:04:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7dgJs5f/YKxI5+6TmmB09RDarB//AcstrnAItE7kqBpIs3boF+5gskUxirrDvWwGgDbRJB7WNJYM6txVJGu7pI/adw6DAwKLv8hLcyeNE5/pWrj/keWUFkYQ8+XbaOW/W1emvFsQcu20ORTvWn9izDcVDKTLQWCMYJswQ9DqxMOh7YyS9vpAZU3/jwULHQM9+Ynsrv+KJ7Uvtlf6T82By5FCqQuF0MYFQishc5Z6RwhFbK0PYRh6laOhQk7CMFIMqk5eMJ9YyUV4IcrxXiJK1wUpYnbbZOAnM4UKSXLp3NHYw8CoYJ1oFwGJWqqzuUM1Nd+wf+a6ZT+Dk5pQs80dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii4k21TfbgBhjluHLdC76jta3XgnjUECbYw+Xno+l7M=;
 b=EDz1wxzoKC3lX8LEbloZs4ZNbEXZJwsDV/wORnXFXtuOUAs26N1A5sVVTbOWMXBFadLktBEYWDJJwB87cCn8y1iK6njIIkty2edA2xJZyVm8RiJadXPKJWtxPmUsBi779yxRJrfpz9h3hL9cKXe90UiIEb95N8VDEA8bh1QZ0L6xRZrhSg+OZl5qbLhNCnM8liq8FlpSz4mPuQ+voGacZAeecmd+cFmr3ucJxenocpoV0B5Ub4dbzRupuYnsUSFngy7e+D7AiBe4SUTnePt5LQKBeKZXATMznI3u9I3DYY8Tr9HO5rSy4ZNcWQRNc9yDZIV69WbBQ1T5/D02zbQn/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 10:04:28 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Thu, 6 Nov 2025
 10:04:27 +0000
Message-ID: <c3170d46-ddf1-4128-9d21-9442cb8e4db0@intel.com>
Date: Thu, 6 Nov 2025 11:04:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pmu: Reset sched_if_idle value smartly
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>
References: <20251105184108.161889-2-jonathan.cavitt@intel.com>
 <3766e36a-11b1-4603-b86b-de320a4f110e@intel.com>
 <CH0PR11MB5444270749E2C09B10FD6CFBE5C5A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444270749E2C09B10FD6CFBE5C5A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: adb30d5b-2a11-4526-90d6-08de1d1bdef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VSsvU04yOFhiVlVSRTZORnlZS3NRL2xKRm9wM3plL2UvdDUzZklUcWt3b1k2?=
 =?utf-8?B?NDZwK29UeUZwWnZuNGZNRXhmMDZGMlpkN204WFdYRWNuREs3Z0VlL3IwSTZt?=
 =?utf-8?B?aEk5OUxwSk1hU21FdjlBdXU5WnpJMkdycUVsU0hMR0tldThycldQc3RCREs5?=
 =?utf-8?B?eFNUejdCZTlGcDVYOHVuV0Q0MDArajUrN3FtM3hVYXFtbXQ1cGZXWTJHUEt3?=
 =?utf-8?B?NVg3a09lWXhtL28rRHo1djI5MTJoRUp3M2c1eU81aDV0dkc0OXNvZjE0UGNa?=
 =?utf-8?B?WkV0d3Ixcmd4clJJQ2FjOENLMnFxT2dIQXFVZmNubjRLaGY0OWR2ZlF3NTdC?=
 =?utf-8?B?OGZzS085NUxRYVFYVnYvZEUya284aU9OdTduUEpydVV0Uzg2ak5IaFo2RWxk?=
 =?utf-8?B?MTY0M1hZcDZGdUNybWdacFIxMG93RytjWE1mWlc2MjU1Y1BsQ0ZiWng0SG1l?=
 =?utf-8?B?R3NaN1U1VUVuVEFRN0ZvRWdNdXFhUEtrc016MUs2djRIZWxNeTFmR0orOHBH?=
 =?utf-8?B?Zjd6S1ZpYnduODNDSlF5MzFONENMRy9PSDloMHRMaG9wNGlCS2s1NlJWWkYr?=
 =?utf-8?B?b3ZsU21wY2xXSS9qSXpXVlhqMDhyU045ZW9WQlIzWTRic1NuVUpQQlRoL3Qr?=
 =?utf-8?B?V3cwYjJZQkRhTFR2bFlidlN5QUFBV1o3bzF2Snp3YldUYzlHaFZLUVdIalov?=
 =?utf-8?B?QlFuSlY5anZGSkhZNDhqMlRkQXFsSWdJajEvRy96MmJNZjh3dmxNME05WUVh?=
 =?utf-8?B?SnRtTUFRTHRVZnNIZUpRZjk3YWdmeFVTTDVHQXZ6OHp5OXpnUFFFSm9ZbXBu?=
 =?utf-8?B?UG5RdHB0WnNDSmliZyt0eXBCcDFHTUhmUTVucDlvNlh3dGhMOVRKb3NXQytO?=
 =?utf-8?B?cVM4bzBaTGhzT25wOEdmUUJad2NvR2VpZmlzQTBxVFJJeGNDK1VIL2FxbFkw?=
 =?utf-8?B?cnFmTWtyVmRFSWF3SVdMbjBzR29PMXpBOWJ0bGZSYkFvRXl0RnZuR213ZlQ2?=
 =?utf-8?B?ZVJEOTl1SkNhdGlIQTlqcUphYkF2a3NBZ0VwcXAvb1Y0Q2YxU2xDeVZmekV2?=
 =?utf-8?B?bVdjN2xmbG9VOHJ1WG1hb25WTEZnY0xBWERiMEc3bzhObWprMjJMWmVnbUVU?=
 =?utf-8?B?VzJSWWlxdnhBWmxZVWZpZkRvV2g5WWxtWDhlSGRZdFZ5d2VEbnozYjR5Q0Zt?=
 =?utf-8?B?MXU1aExJMTIyUXVPZm5wY2t1Ym5DaWtlTTRWYmJzejl0T2hSUlpFdXNONDJW?=
 =?utf-8?B?RDA2QXpleC9SLzVFeFV0RWphMDlBbFVWOEJDN1cyR1FYNnFRdG92a0FNWmxX?=
 =?utf-8?B?T3JmbENDcFFFdERoRm9pTTdoQUNPbFNPOS9lamxmZzFidzRQaEpmM0t6MzJt?=
 =?utf-8?B?MFNNYjJUSWdFbGdWeGcxY1JFQ1RvUWFjUVU2QWRENVZ5RnlLU0IwZXVyNHM3?=
 =?utf-8?B?Ym05eG94dEQvcnhJK2lnVS96VjVZTkRjWDdaS3lEajE3TWxqQWpoNUpsbFZz?=
 =?utf-8?B?WDdQNFM1SEpHN2J0Rm1ieU1CYkMzb0tDbUJJZGlUR2toOHhCY3RjV2ZMdUJ5?=
 =?utf-8?B?SXFxUTRlR0QrZWNDaE83VXFDT0pBaWZqeXJndy9wL1lTNXFQZW9FTGg4ZWZO?=
 =?utf-8?B?My92Slp4bmw2Y0QrR25nSnBFNDdDUjdBbGl4amdTdUhJSXFJTEI4Y1F2bThh?=
 =?utf-8?B?bnZWNjh0MVZGbzk1MGJFbnhwQnZENi9PbnZ6UmdUNU14azl2eTBRSDdscHZj?=
 =?utf-8?B?aG4wQVMxS1lhemIwU01XSHBJY09zVmpkUDl0UFB1Q0hIY0Z3cnVjQXlBa21X?=
 =?utf-8?B?eUpqNVFzWmZ0aWZLRUhzd2hhWW5yU2lXRjVjR2JhaDJ2d1RtQURBcXBsY29S?=
 =?utf-8?B?TEw4dEdYRzVNUzdZN2lBV2RsWTdneG9JTjNNbWljOXBHTnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmhUaERXckRRNTFiNHlxVEYraVRDR2JyY2VOU1J4WkloMlVtaEl3ZjlIVjhu?=
 =?utf-8?B?TWhHWFVZcWxkV01peStmc3pGZGJkQnBEWTlsMDZyb3dvd3R0TWdyRmFYbTRR?=
 =?utf-8?B?UXlGY1ZkMGRuNEdKbTg4R2lVc1VsdzBFYStiS0FLYWhTWUZYTTNVci9PQkh1?=
 =?utf-8?B?d3R1OHdZU2Y5bnY4VW50OFRaZlFKRDUxTzBHRUo1azVtR3p1dWZKMXBhb0tD?=
 =?utf-8?B?dFZBMmlDUk95VnRkWUxvWUVnV2R6VmhSUkk4VytUNDJ1bkpEaEpORU5oeit3?=
 =?utf-8?B?RitTenZNMkN2cUd4ck5wUzVoZ2I4dDZpZDRaUWtPWjl6c0IwY3EvYStvaVRX?=
 =?utf-8?B?dlFkV2NPVUpOTlhJZ0RPU0lFK2tqZExOYmo5eUxOVFFkS0tjM2hrTTBJUUFZ?=
 =?utf-8?B?L3ZYaW02T3NiR0xVeXFWMmxoQ3N3c3Q0bVZxNzIrNXVJcUp5WC91ckp4Smpp?=
 =?utf-8?B?dENPeVQ4NDl3dDdJbHpYWTdqc1BrUU4ydFp0ZlZGYkJYSUl1Mk5IWHlwb09M?=
 =?utf-8?B?aURzM2NuWk5mRStIUU9SMm05azM3Y3RvcFBLbjlhTlZpZ1FsaWd1VlJkRm9K?=
 =?utf-8?B?SmZsMGc1VVp6SXc1Smg5a3ljNmRycFJvbFptckJ5L3RaR1NCUWlrV0hkdm1p?=
 =?utf-8?B?aEtadGQzcUdEODFtZkxUR0ZnQ2IxM2daVVdPNUVwbDB3Z3pvaWZnT0NUeS8y?=
 =?utf-8?B?VTVBVFlhWTd6aGFpQXZjOXpPVDBIaG5JOFlPcHZhSHFKNjBqb0hNTGQzQUdh?=
 =?utf-8?B?VS9mK0F3VmR4RngrdGdZU3BkK0hsS1lzNVNZNVJUeEZRQ1ZPcFlYc0U2dUUr?=
 =?utf-8?B?eG9EY3Nid2VrS0ZTeW9WajVaLzFRc2xQQVFFK1NYRXh6V1R1MXU1Y0gzM1JS?=
 =?utf-8?B?aDY5d29SWWV1bFVPcWUvL2NtZi9YbGUzdVdMWk1TWS9CZFhFZFlMNXdxbFVE?=
 =?utf-8?B?M3Voc3ZneU5RbTh0cEhWNzAvNUhpTGg0ald6cnBaYjByK3R2emlLVjRaRlhk?=
 =?utf-8?B?Q0g4TkdkN0J4Rm4yazZVVlBOSEx3VjEyK2VvMVJkZnZHS0pGVnNwSUZEYXBT?=
 =?utf-8?B?dGZQYlFwSDBKYzRoTjZwZFBBTlJJeS84R2ovdjlISnl0TGFDeExja296a281?=
 =?utf-8?B?WXkrQmxISEsrNkdUTUtqd3ZYajk3L2ZxUTd2OEp4WUZXbThVRUYzS09HNWFh?=
 =?utf-8?B?aEgvbXBlbmRUaGJ2UnZNQkVRWU55R3p1UnN6azFGR0I3ZGNuMmtFMVVsL2s0?=
 =?utf-8?B?cnlkRllla3U3am1tU3paV1V0alNuWE9LUVJXVU9kbkhIQXZ6Um9WaGZiODY2?=
 =?utf-8?B?ZWpBWnZuSkhWWWVTNTVqYTVjd1pIVFBRYXZKZXFndlRHeWtBQzBoRnVMQi9k?=
 =?utf-8?B?UE8xUlZZU0VJTXJpenpFNURHNG0vYWJFOG1QT05Ub0ltbDhQVEppcnRNc2ky?=
 =?utf-8?B?SEU4MFZxb29weENqT3d0ZFVtRm9LeHQvM0VBRnh0TTdGT21obnRMK2xqdzlp?=
 =?utf-8?B?WmJPY2c5eUFjazdTVFNjeks4VXFLbklMclMwNnl5eWovV2RQWG5ZeWdqSDBW?=
 =?utf-8?B?bU1CNjVobWg3SUw3bmtpS00xdTlRM2c3ckw5OFVCaG1vaXZHNW9UMXJaQnhp?=
 =?utf-8?B?WkVzNlpjQlJTYXZkVnFMbklNVlErUjByMlJpeDhVTVdzbzZROXJjUllXemhJ?=
 =?utf-8?B?cDNNZlZnS0ZCbElGb3NNWmVtaHA2QW1Tc21yM05TdjY4b3RpL2hmd0pNeG9l?=
 =?utf-8?B?Vko1QXpmclRMYy9JbDV3OFBLN2ZSTmlmUjJnYlhhbytBN2FTK3FqOFcyNEk5?=
 =?utf-8?B?Q096QzRNbDF4aGJaa3ZscDhndC9sWG9Qd3lqdDgxMnBXN2duY3Q0NjA1UFl6?=
 =?utf-8?B?R3ArSTAvWWRpZGxqdzM2VlNtMmV4KzlHVEhqY2wxSE9ZZzgrcVMwNVJmRWNY?=
 =?utf-8?B?Z0pNZ1ZqWjB5cWhZSWs4SUJCb3BRSnBQTEdyNi92ZHpvb29nYkRXRHU4QzJH?=
 =?utf-8?B?UVQwSXZweEU5Ris0LzhncmJ4b3d1cmh1LzRNNVNjQk9kRnp2V2lXcEtUWW9C?=
 =?utf-8?B?MFViSkpKdXltelpxbDJ0WEEzZWcvdVh4TDR6MHlEeXpGRUNBcmM5cDNyNnkx?=
 =?utf-8?B?bitkVHRoaWZvMTBabExwL1FGMXBGNnlsWHllU29wdHNrMXg3emZJL3Fqb0Rj?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adb30d5b-2a11-4526-90d6-08de1d1bdef4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 10:04:27.7365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qS3XbC0m10x/8ADW/RPkIag3LeELIekSKTH3DCRDWGdQyDH5mMQTvUtMTfTwEPOiP59Kv0T7bsVxElT2PzrJhApDaJ/4pyk9nFjxz5Qmy2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
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



On 11/6/2025 12:08 AM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com> 
> Sent: Wednesday, November 5, 2025 2:40 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>
> Subject: Re: [PATCH] tests/intel/xe_pmu: Reset sched_if_idle value smartly
>>
>> On 11/5/2025 7:41 PM, Jonathan Cavitt wrote:
>>> Only reset the sched_if_idle value in unprovision_and_disable_vfs if
>>> doing so is necessary (I.E. if sched_if_idle has been changed).
>>
>> sounds like optimization, is this a goal of the patch?
>>>
>>> Additionally, there may be some delay in processing the value reset
>>> request, so add a short usleep after resetting the value via
>>
>> what kind of delay? what problem it causes?
>>
>>> xe_sriov_set_sched_if_idle.  This will presently only have a performance
>>> impact on the fn-engine-activity-sched-if-idle subtest because of the
>>> first change.
>>>
>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> ---
>>>  tests/intel/xe_pmu.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>>> index 9525655ba2..f3dc85bb1b 100644
>>> --- a/tests/intel/xe_pmu.c
>>> +++ b/tests/intel/xe_pmu.c
>>> @@ -1010,7 +1010,10 @@ static void unprovision_and_disable_vfs(int fd)
>>>  	unsigned int gt, num_vfs = igt_sriov_get_enabled_vfs(fd);
>>>  
>>>  	xe_for_each_gt(fd, gt) {
>>> -		xe_sriov_set_sched_if_idle(fd, gt, 0);
>>
>> changing legacy policy "sched_if_idle=0" is equivalent to resetting all VFs priority to "low" and should be harmless for all cases
>>
>>> +		if (xe_sriov_get_sched_if_idle(fd, gt)) {
>>> +			xe_sriov_set_sched_if_idle(fd, gt, 0);
>>
>> and while we can _optimize_ and skip it, it shouldn't have any impact on tests
>>
>>> +			usleep(100000);
>>
>> and kmd shouldn't need any additional delay,
>> if that solves your problem, then you're rather hide it
>>
>>> +		}
>>>  		for (int fn = 0; fn <= num_vfs; fn++)
>>>  			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
>>
>> what is actually dangerous, and maybe even the root of the undisclosed problem you're trying to solve here,
> 
> To specify, the issue I'm targeting is https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3970 .  It's not listed as a Closes: in the tags
> because some other test issues are being caught by that filter which would not be resolved by this change.
> 
>> is leaving the default PT=infinity while enabling "sched_if_idle=1"
>> so here, in addition to EQ, the PT should also be restored back to 0,
> 
> I'm going to assume that PT=0 and PT=infinity are the same in the context of how it's programmed,
> because otherwise I wouldn't be able to process this request.
> 
>> and we must make sure it's set to relatively small value together with EQ during the test
> 
> That's probably doable... depending on what PT stands for in this context.

I assumed that EQ/PT terms are known, since you're playing here with VFs provisioning

EQ = execution quantum, see GUC_KLV_VF_CFG_EXEC_QUANTUM [1]
PT = preemption timeout, see GUC_KLV_VF_CFG_PREEMPT_TIMEOUT [2]


[1] https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/xe/abi/guc_klvs_abi.h#L257
[2] https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/xe/abi/guc_klvs_abi.h#L277



> -Jonathan Cavitt
> 
>>
>>>  	}
>>
>>

