Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6733EC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 22:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FDA10E9E6;
	Thu,  6 Mar 2025 22:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OksuIi/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E38B10E9E6
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 22:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741301644; x=1772837644;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=dckOyrVYfaFkVci6fVULE6GxoOwWg1yn6zddj6Hnysk=;
 b=OksuIi/C6jponaI1ioZci39NNmpCUpuxtMStmXA5Onhx66oWU9vT/fpF
 InKqyNBiVa1D20oxR3TeHw2u5HtPG6MPDAmNgvo6Bsa9ecGHkppZbU2Xt
 aSB2emKnVJ4kCIDvc3+g1OzWAm/SmErDpeDmxMj2fK6Fg0KEOCSxbbtmP
 62spB/2NVqv3Rv2v2JlNEVgPNTK/5vMz8t8NoJbaracFcEjoxNZSxmt86
 Ufp0wOreS+p9RyVJbGK5qQkitqHlH2tFRYFx6keHjYv48jgYAQRcsWc+0
 ddb7OhcehWe/g+W8gz5EbVKFbGlO3kScqqT2AIdOwMUzVVzvbIjbW2z3i w==;
X-CSE-ConnectionGUID: nFkKrBKISdagiKyPWrqBKw==
X-CSE-MsgGUID: I5afqzdnSDWhsIDr36dbrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59895519"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="59895519"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:54:04 -0800
X-CSE-ConnectionGUID: 5KcoNrGQQu6S6qTsDqUD9g==
X-CSE-MsgGUID: 6jbhfdz3QqezpT2cuaOKfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="119333560"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 14:54:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 14:54:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 14:54:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 14:54:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrhCbsZApyYvdKH08xcjxoUZuOt8nJFTtNBuNy2XeSaEZtMb1OywcDiUw3YqH/wlDyFjJ2zG71ixkDfryxNfvi08wXp2ybnXsbJpqq0u9hrMm/68InjiEk8hzVPUM/p3JQ+VV4SWWj2yz2JRkviUmv7Jt3SVSMuAn7z0D69Gm6mUFSxo/zF8j/FZQF7r8RQuMOg0m14st7OM41aHZOwIHI6CSnHlcueMn2UXrnOxjqhx/A69blxi//0euRH4gr9k9j/5uCePgrHgQQDyb7BSWIc0fBDDCv3Bzfg1hiX6kecQfy5HKkMXtvmbnMd9C7zGqfAVk+mxI+hs0gjSQuivOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dckOyrVYfaFkVci6fVULE6GxoOwWg1yn6zddj6Hnysk=;
 b=t+Z2WqJ/SQImnL1WZ4uqhpE+WR0tId06g9x+gJL89+h2Y8DzX7OvZdWrEfNvlwBXrr0rYZf1sukazHCTR0oY1kCwDD1g61V7fz/o0q6FUmB9u6knBsqIh/2Z1g+tVf6pDbgmHr3GZn6/sv9AAk9Jx/B4d4RapLZGvhSQsxmi5LsI8yheGMHQ4yQ30nzP0uT+yrAyXone7Z9LPVAu4UK9w5RwkopF99QUT2+NpS4lZdLRaNZ0WFL2F9a6ApidyeOo0zrOXu6NpToz/XqtNBjCT1hrnc3ApLNr7BzDPRbv3e+QpFOdzot4/hT5dEAahPBdMRl0f36VSpQ7Iz1vbe8cIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB5895.namprd11.prod.outlook.com (2603:10b6:a03:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 22:54:01 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 22:54:01 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_query: Add test for PXP status query
Thread-Topic: [PATCH i-g-t] tests/intel/xe_query: Add test for PXP status query
Thread-Index: AQHbjt9lb8VKIeNWBEayZmdsNK7GF7Nmt4gA
Date: Thu, 6 Mar 2025 22:54:00 +0000
Message-ID: <9ab5c579eb09cfc24a14f37ec0e71aabdceca0d3.camel@intel.com>
References: <20250305233951.3488609-3-daniele.ceraolospurio@intel.com>
 <20250306213309.3546278-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250306213309.3546278-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB5895:EE_
x-ms-office365-filtering-correlation-id: 125ade0f-219b-49f7-e701-08dd5d01c947
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TUFvcnU3d0lvd2RBR3FybmZKZG9HRzR3WlJuVGxXWU5iT1plUzNxQW5HZDkw?=
 =?utf-8?B?N2s0blk1NWdldGpreThHYjB4WWV6MlRONS9EWjFsclBGQllVcFFoc3FhQW1w?=
 =?utf-8?B?YmIrdmZScjZINnNPWmhBWXp2SXNHVUY1VndCbEFBWEZNblRDaUxiYlZrVWZL?=
 =?utf-8?B?N3Y1b2VCNUlWelJvUFZldEx2ZDkxK0JlSlJmS2N0Q1Z1eEczQkJTdTZwdWE1?=
 =?utf-8?B?ZUpSeXpKL2o4eU5yZm53U3BVRVJCVHNWMnEvemRsTkpqU3gyVmdXRFlDWEEx?=
 =?utf-8?B?RGpRRGh0bW51L1hnYmxkZ2pWVGd5bEs2c3pvQ1dvdXM0QTBuQ21PYUt2VTB3?=
 =?utf-8?B?VDlFWkp6ZnFjY00wWU00MGFEUktnYUFibkthV0ZGWVhzQVNSVGVTSWhmM1dD?=
 =?utf-8?B?VC9VaEdNNFhBNmRGYzRSN2RpcEF4ZkhGNG5JKzBCM3BKdHdGYkgxMDNIQ3VU?=
 =?utf-8?B?eDAwOHlwd0ZNYm9GZU1TQytHOEg3eklWOEowR3FoY2Q5L0pPYXNCWk1wY1BB?=
 =?utf-8?B?MHhxTVgwMlNoQndJZnlxUEdZSTFqZGhpcXMzaUJNbHdnaE82ajNZUUMwL0RB?=
 =?utf-8?B?U2RTVUc2SmdyZzRTL0pHVGRDZGZQdE0rbnBnRnVnd3NlTjUya3pyTzFldkFa?=
 =?utf-8?B?cTNhRUhEa1dFZ0hsVmliOXF3MUFad2lMK1I1aVNMOTU4dUl2VUJ1cmxJVCtL?=
 =?utf-8?B?VGtrTVQ1clZWWUNueE5hc05uTWtuOElCVHdTdUgvcm1RZEwycXNaRVFzRitB?=
 =?utf-8?B?RlhxSDZ5MDFVZU80UVFSOW5UMUVST3FCTlVoS3R4WFZvL1hRSXdXc2IzdjVp?=
 =?utf-8?B?OVQ5ck9UeHdMb1ZwN2NMdi9OdDUvR0w1dnZuOWhUSVNxV2RVOUxNVXVuNmtB?=
 =?utf-8?B?Q1BtUTg1Nk1uRERZV3BicnRoN3FucjZlUEwzZnJEM21WTTl2WFd4aVVsajZ0?=
 =?utf-8?B?QUNTUjV0QkxIbzJaU0hheWJsNFk4WTIvZXhVNDFoa3Fub3RuaHRQRmk3cjJz?=
 =?utf-8?B?d005VXY2TFNDYzQzVUtXZjB0ZzMyaGREMWh4dDgvcW9wREM5V05OZ2t4NlA2?=
 =?utf-8?B?bUFHRHRQaE9lL1BQckI1cnd5bG1CU2NqZStKL2RNbkFlRm8yWUtXU2VRbUp1?=
 =?utf-8?B?WHl4Mm5wMjlwdGtrSHlrZ2VGV0xERHRlSFpaVHVqZHZwMkJHRmo0bWRPVzFJ?=
 =?utf-8?B?cEZkOWliZnowNmhKYU1oVkpXRk9SNVBTeWJoU2RyTWd1V0d1SG5Uem1hQmJo?=
 =?utf-8?B?Z0o1QktTTis3aUtHbTkzTk94SFc3YWxqTythaGQ2Y1BIeFAxT3pEQjVQUlVi?=
 =?utf-8?B?TXhoQWNHbWVtQWc2RzlhQ283ZjQyN09NbE5UQnh3c3gveDlFY04xd0xSbno5?=
 =?utf-8?B?cTVWTHJneTMzV2QwWjFRaitNSHBMTitnTVlZUGZzUTFxejZnOG9lMHdac3gx?=
 =?utf-8?B?NnBDaE9oQ01jNEF6anQ5ZkozVlZMZm9OUTZ6YzlaZ3dMMmowQ0dnUm5Fbkts?=
 =?utf-8?B?SVRYQWFXUGk1R2ZCNkFCQytzUURibWFiUnFQZUtYUkd5ZlRDNFhiSjk3TzBT?=
 =?utf-8?B?RTZJWUpXb3dxT0xOck9wbFRuakh0ZmROSm8xR0tZTlVScWljbFdmMlFCSFpq?=
 =?utf-8?B?VkNsbHpTZXlSL0lUSnlVeTVtTGFQem0wQzVRZFFsL3FPVGNwdUlLMU5BOWVi?=
 =?utf-8?B?b2FURndjWWsra1hGSXl0bmd2N2lBOFBtOTZseGQ4Q2U3N1orUldINEZoclJE?=
 =?utf-8?B?WmtjRGNPYlRVYlBkWXhHbGlzNTNWVUJFdnJLZVh2elplUFdwczFnenpjM2Nt?=
 =?utf-8?B?UFh1WUF2ZFovaDBnUHdCWVN6bDgyN0Vqc3JzTThkaW9NVXlvSlRTbGF5VHBj?=
 =?utf-8?B?QlI5ZHVGaWRiVXVJdTNHTVc4NExFUElIR1UzSU9KQ0hDOEtVWnBnWVRPeDU0?=
 =?utf-8?Q?71q1lH39vbuq/q9PaRqcpMtCN/hZgJGc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUs3YlVWNGtmZXlmR3hFWjZQKzVrblhWV0M5dzBCQnVaY0Zya1p4THNOeXBl?=
 =?utf-8?B?UFdSbVdmSWpGdHhNc0dkcGd6VHRybUJXZHJxWmtSM0ZucWIva3ZvZkdFZ2ts?=
 =?utf-8?B?RnZJYTBjTCtZVUkxSDl2Zmw0dEpJUWFxZXZ6YWdkSDZaU0kxUzNhRUtIN3pH?=
 =?utf-8?B?Tk9GK2krWXlrZUFSVzZ1aXNVd01pKzN3WjFJR09vd0ozR2h2QmhrMWtXTThO?=
 =?utf-8?B?MjkvcmExOERtdlFpQmNNMHRKMWxBNkJ3b0xoV2gwRklUUmIwTG5EMk9ObWxF?=
 =?utf-8?B?L1JLM1NWSXZUNmVYUkpLYUFaa3NpR1VTZCtuTUQ0VklLVWhmSGFzbDU1Njdn?=
 =?utf-8?B?M1grS2RtNjRSME5QaitRNm5oOFVERDdNZ0dZTkFnbHI1TmZsdXJmczJMTFNI?=
 =?utf-8?B?NlpORmNCcGtSUkg0SGtnaU5XdHorMTFSMFRhMWoyRnVwUlZUUUNGa3BFMGtG?=
 =?utf-8?B?T1dKRmlQNXpOaHZ3TEFDM3dNUGpudHRBbWxzNXBDYk5hZkhSTVROZzhoQUFv?=
 =?utf-8?B?bHVzYVVLV2N6WE1MNEZVN2R3WXhzeVhTY1Q4c3RnVW9jbFNIbVJScFd0bVVC?=
 =?utf-8?B?aGNJOVVOZzBGbk1DSnV3eDhndXhseWwzTXlrdW4yeGdFSjZUUlN3cjYxMVhQ?=
 =?utf-8?B?aFdOSEZ1SWpYUERwRkhDT01jOUMyZW9uQmhUdTFlYmFSR211OUVNTlBybDBw?=
 =?utf-8?B?Um9jU2U2VDNBNzA4YXdPVU11aWNneFhoUFF1MStMV3VweGU1akZUbFdrdDI4?=
 =?utf-8?B?VFVvUVNDUFdxT0tjUnhaYzJMYUpROGNSZElmby9xbnprKzZpU1E2bUFBV05M?=
 =?utf-8?B?UEFkRlJhcnZZaXZLUy9rdjY2VTBBV3ppU2VmSy8xM0JiRFFZWGVkd0RheTJV?=
 =?utf-8?B?bDFPZG9jd2NsaVF3NktrYnR4VjE4b2hIY3lPU0Nmb2trMkc2TWtvTGFBbkFt?=
 =?utf-8?B?K1Z2L3ErZmpJemw3eXlSQnF1V2lGKzZaYksxOWFCSzRramJJYWE3ZUJxR0tF?=
 =?utf-8?B?eWFTSmtaVUpQWTArZ09oVytleXlEb2QwK2szOFNoaHhrYkJZTkJ0STF6VGxa?=
 =?utf-8?B?QkdENzZwMzRuVWRrTyswZjdaYlpnczhkMW5hOUJncDhibFpHKzRhdVo4OGdh?=
 =?utf-8?B?Y1JVYnFsN2ljb1M3RThLTEVoV1dWY2VUN3dUSnZadFIvbFVHMkppSVU0bXVX?=
 =?utf-8?B?M3lrZ1RSLytOMGlQMHVzMFB0c0tLTnhET2IreHhUQWlqRkZUQzZObDg4ODFI?=
 =?utf-8?B?RFVsR1BvWkt1cnQwZmV1RTFyVGI2dVVvdWJxS2YzZHNlMjhMd2laWmVYY2RN?=
 =?utf-8?B?ZHhRWUhROXFFV2dzblpkcEI3eDZCb1ZhN3N4NVNnZmlIWlJFenNGZDdLRFdQ?=
 =?utf-8?B?TDZVV1kwR0dKcGdiRkxBYjBwekErK2U5dUFZQjRiSGs3b1VycHllQ3dkMTZ6?=
 =?utf-8?B?K2s1OUwyZ1BndzNUclVCbytxZWdjWnJVUWNKbDl0TWNzVEs4blFtaDlJRmpN?=
 =?utf-8?B?QUJLdjdhN2R6OGJKSldWN3dmeURPaWtqdFVLcFR0cU9LWExGQlV4OTVYcE1m?=
 =?utf-8?B?Q1Qxek4xT2NpQ1lxd2E4djdMeFFvSUd2bkxvWVdINHltSHEwWnI5UVpDOEt6?=
 =?utf-8?B?VkZnazY4NTBmT3ZpSDEreS9vM05jQlBIa09RbFV2RGtzTndGWWRDeEZPNU8v?=
 =?utf-8?B?ODlSdjdZMTN0Z2p5MTZ2Tml4cVpwSlRFSmlUQm1VNTNjT3NmMGVoMEJ6OXk4?=
 =?utf-8?B?bjQzeWRBVmxGU0Z1SVVrUG5hczdaMUlpSDVZaXIzNXBXZVk0Vy9FTW1XUUNU?=
 =?utf-8?B?bTQvSFBLbHdKVlB6TFd5endDNk1pc2NvQVA4T3FDYzN3V0hLKzVkMVBQYzJk?=
 =?utf-8?B?alYvekRCVld0ODJxWk1teTVtRkpZa01sSTc3N01YR3lVZisreS9aVEtpazBr?=
 =?utf-8?B?WnBqN0k4VUdwcVBWYWZtc3FWbDUyYmpjdzB2YVdIb1Nnd2p4aEVEdXVQaHdj?=
 =?utf-8?B?WmNEMVZiaHRoYnQ1SXF6Nnc4RjdXQUk0VkNPQ1V2ZE1USmFoZXgrclgrY01R?=
 =?utf-8?B?eVp1VkFHZFZ3bGROTTk1aGw1V1dzYndMdHdQL2p3dElEZ1dkQmFoKzc4VHo2?=
 =?utf-8?B?V2QwRTV1Vy80ZHBDdjVWditUQ291TFc0SmhEQ3dUK21qZjZNa1AwY25lelJv?=
 =?utf-8?Q?saqShoLYqr4yZl1+KhN5Dtk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE0EC830281B9C4190CB8CF371C75D4C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125ade0f-219b-49f7-e701-08dd5d01c947
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 22:54:00.9168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: io+g7G2RpaxXX8MqisBDyhuuCW7ITsPmGQrFBoWOOmgV4pjaEUBAEMysvPIkvU/y12C54/AIvDUv7TbUWTuj3TDo12IOYK38TeB3SH/qC4Gcl0gkXFL4Y53xHrMmRg+K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5895
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

VGhhbmtzIGZvciBjYXRjaGluZyB0aGF0IGlvY3RsIHJldHVybiB2cyBlcnJubyBidWcgYW5kIHRo
ZSBtaXNzaW5nIG1lbW9yeSBmcmVlIC0gbXkgYmFkIGZvciBtaXNzaW5nIHRoYXQ6ClJldmlld2Vk
LWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4KCgoK
T24gVGh1LCAyMDI1LTAzLTA2IGF0IDEzOjMzIC0wODAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToKPiBBZGQgYSBuZXcgdGVzdCB0byBleGVyY2lzZSB0aGUgUFhQIHN0YXR1cyBxdWVy
eS4KPiAKPiB2MjogZml4IGlvY3RsIGVycm9yIGNoZWNraW5nLCBmcmVlIGFsbG9jYXRlZCBtZW0K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFv
bG9zcHVyaW9AaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2
aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4gI3YxCj4gLS0tCj4gwqB0ZXN0cy9pbnRlbC94ZV9x
dWVyeS5jIHwgNjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
wqAxIGZpbGUgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0
cy9pbnRlbC94ZV9xdWVyeS5jIGIvdGVzdHMvaW50ZWwveGVfcXVlcnkuYwo+IGluZGV4IGY1YWE0
YTU3Mi4uOWM3YmYxZDZmIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3F1ZXJ5LmMKPiAr
KysgYi90ZXN0cy9pbnRlbC94ZV9xdWVyeS5jCj4gQEAgLTEwNjIsNiArMTA2Miw3MCBAQCBzdGF0
aWMgdm9pZCB0ZXN0X3F1ZXJ5X29hX3VuaXRzKGludCBmZCkKPiDCoMKgwqDCoMKgwqDCoMKgfQo+
IMKgfQo+IMKgCj4gKy8qKgo+ICsgKiBTVUJURVNUOiBxdWVyeS1weHAtc3RhdHVzCj4gKyAqIERl
c2NyaXB0aW9uOiBEaXNwbGF5IFBYUCBzdXBwb3J0ZWQgdHlwZXMgYW5kIGN1cnJlbnQgc3RhdHVz
Cj4gKyAqCj4gKyAqIFNVQlRFU1Q6IG11bHRpZ3B1LXF1ZXJ5LXB4cC1zdGF0dXMKPiArICogRGVz
Y3JpcHRpb246IERpc3BsYXkgZmllbGRzIGZvciBQWFAgdW5pdCBxdWVyeSBmb3IgYWxsIFhlIGRl
dmljZXMKPiArICogU3ViLWNhdGVnb3J5OiBNdWx0aUdQVQo+ICsgKi8KPiArc3RhdGljIHZvaWQg
dGVzdF9xdWVyeV9weHBfc3RhdHVzKGludCBmZCkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVj
dCBkcm1feGVfcXVlcnlfcHhwX3N0YXR1cyAqcXB4cDsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
ZHJtX3hlX2RldmljZV9xdWVyeSBxdWVyeSA9IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgLmV4dGVuc2lvbnMgPSAwLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAu
cXVlcnkgPSBEUk1fWEVfREVWSUNFX1FVRVJZX1BYUF9TVEFUVVMsCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoC5zaXplID0gMCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgLmRhdGEgPSAwLAo+ICvCoMKgwqDCoMKgwqDCoH07Cj4gK8KgwqDCoMKgwqDCoMKgaW50IHJl
dDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgLyoKPiArwqDCoMKgwqDCoMKgwqAgKiBpZiB3ZSBydW4g
dGhpcyB0ZXN0IG9uIGFuIG9sZGVyIGtlcm5lbCB0aGF0IGRvZXNuJ3QgaGF2ZSB0aGUgUFhQCj4g
K8KgwqDCoMKgwqDCoMKgICogcXVlcnksIHRoZSBpb2N0bCB3aWxsIHJldHVybiAtRUlOVkFMLgo+
ICvCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKgwqDCoGVycm5vID0gMDsKPiArwqDCoMKg
wqDCoMKgwqByZXQgPSBpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9YRV9ERVZJQ0VfUVVFUlksICZx
dWVyeSk7Cj4gK8KgwqDCoMKgwqDCoMKgaWd0X3JlcXVpcmUoZXJybm8gIT0gRUlOVkFMKTsKPiAr
wqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0X2VxKHJldCwgMCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDC
oC8qIG1ha2Ugc3VyZSB0aGUgcmV0dXJuZWQgc2l6ZSBpcyBiaWcgZW5vdWdoICovCj4gK8KgwqDC
oMKgwqDCoMKgaWd0X2Fzc2VydChxdWVyeS5zaXplID49IHNpemVvZigqcXB4cCkpOwo+ICsKPiAr
wqDCoMKgwqDCoMKgwqBxcHhwID0gbWFsbG9jKHF1ZXJ5LnNpemUpOwo+ICvCoMKgwqDCoMKgwqDC
oGlndF9hc3NlcnQocXB4cCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoG1lbXNldChxcHhwLCAwLCBx
dWVyeS5zaXplKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgcXVlcnkuZGF0YSA9IHRvX3VzZXJfcG9p
bnRlcihxcHhwKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgZXJybm8gPSAwOwo+ICvCoMKgwqDCoMKg
wqDCoHJldCA9IGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX0RFVklDRV9RVUVSWSwgJnF1ZXJ5
KTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoZXJybm8gPT0gRU5PREVWKSB7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlndF9pbmZvKCJQWFAgbm90IHN1cHBvcnRlZFxuIik7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZyZWUocXB4cCk7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDC
oMKgwqDCoGlndF9hc3NlcnRfZXEocmV0LCAwKTsKPiArwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0
X25lcShxcHhwLT5zdXBwb3J0ZWRfc2Vzc2lvbl90eXBlcywgMCk7Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoHN3aXRjaCAocXB4cC0+c3RhdHVzKSB7Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSAwOgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfaW5mbygiUFhQIGluaXRpYWxpemF0aW9u
IHN0aWxsIGluIHByb2dyZXNzXG4iKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
YnJlYWs7Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSAxOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpZ3RfaW5mbygiUFhQIGluaXRpYWxpemF0aW9uIGNvbXBsZXRlXG4iKTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gK8KgwqDCoMKgwqDCoMKgZGVmYXVs
dDoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydF9mKDAsICJ1bmV4
cGVjdGVkIFBYUCBzdGF0dXMgJXVcbiIsIHFweHAtPnN0YXR1cyk7Cj4gK8KgwqDCoMKgwqDCoMKg
fQo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZ3RfaW5mbygiUFhQIHN1cHBvcnRlZCB0eXBlcyBtYXNr
IDB4JXhcbiIsIHFweHAtPnN1cHBvcnRlZF9zZXNzaW9uX3R5cGVzKTsKPiArwqDCoMKgwqDCoMKg
wqBmcmVlKHFweHApOwo+ICt9Cj4gKwo+IMKgaWd0X21haW4KPiDCoHsKPiDCoMKgwqDCoMKgwqDC
oMKgY29uc3Qgc3RydWN0IHsKPiBAQCAtMTA3OSw2ICsxMTQzLDcgQEAgaWd0X21haW4KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInF1ZXJ5LXVjLWZ3LXZlcnNpb24tZ3VjIiwg
dGVzdF9xdWVyeV91Y19md192ZXJzaW9uX2d1YyB9LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeyAicXVlcnktdWMtZnctdmVyc2lvbi1odWMiLCB0ZXN0X3F1ZXJ5X3VjX2Z3X3Zl
cnNpb25faHVjIH0sCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJxdWVyeS1v
YS11bml0cyIsIHRlc3RfcXVlcnlfb2FfdW5pdHMgfSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeyAicXVlcnktcHhwLXN0YXR1cyIsIHRlc3RfcXVlcnlfcHhwX3N0YXR1cyB9LAo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeyAicXVlcnktaW52YWxpZC1jcy1jeWNs
ZXMiLCB0ZXN0X2VuZ2luZV9jeWNsZXNfaW52YWxpZCB9LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgeyAicXVlcnktaW52YWxpZC1xdWVyeSIsIHRlc3RfcXVlcnlfaW52YWxpZF9x
dWVyeSB9LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeyAicXVlcnktaW52YWxp
ZC1zaXplIiwgdGVzdF9xdWVyeV9pbnZhbGlkX3NpemUgfSwKCg==
