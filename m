Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A61D2CDFE
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 01:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A5510E9ED;
	Fri,  5 Dec 2025 01:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRrrlC9e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9077710E9ED
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 01:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764896944; x=1796432944;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SjsqirAIbht/gheSXDMkvdS6try+Gm50JP9lx2Ki1uc=;
 b=mRrrlC9eLNR3foFdxwVQ8Pa5B1M2x2WaX0rg5l9qmzc0qLdCRfm9WxeU
 ui5nJHFiFDUz2n13+grjcG/GaKtT3pLGBL2GEbF6MJACIRn8d2lUByE+p
 Nvg7rgW9LEItRdPvsf+c6TJ4anOoWsQNxA4VidsW4lglj/oGQ+DFHkvrT
 jfgRMhgZEHtoP8Ees+gD9GgbO9CIOcFjRhydMv+PsjciP9jAzgy0w9w/P
 WfwhwkFUEImlzZU52B+5Ky+z9VqAHNSQFrWkhQP3HAgpl5oGPrDgqzhFm
 X36WVS8Dr2xD6JOUk2N+GSOTUWhPEnwD6sPk5/DQC8U7lMTfUzTaXeINH w==;
X-CSE-ConnectionGUID: 4V3Ktax4TymbFj6owfJRVA==
X-CSE-MsgGUID: 6F4RtTrwSNmOQgrB/5aaJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66864458"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66864458"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 17:08:57 -0800
X-CSE-ConnectionGUID: ShazkykAQX2hAE8Zl1m5mg==
X-CSE-MsgGUID: NDRDU9L8Tlmb1I8oxNlcbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194800682"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 17:08:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 17:08:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 17:08:56 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 17:08:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgjprCvsIO1O9gP8ijIYlg254r2tndOXZnWjWcd7HF+mh2QD1NQ6xKRNKSmxXR4hqfHFf7sUMj1L/Ic+mOCLdAxSOUnCDUkpU5kfYMHUi/aOz79V74mLczZDHYlAqJ4pOu/eSs3M7doV9oSKYhvY7Pi77g5NcLywey54Ocg4iZT1NHWgTdagCwYIqcK4Wv5H/kSBTGe4mhpl+Rr07XmkK6ZRumo9yDlbMis33i4qLCv3ZMDNf+3nn6BGkI0CYhR/ihd3r43aYuw91QOZzi2iW5t4qMmERUuF1h4OCgcWvSzYwLnQqo170r/zBtXRAEaZnTB780GJ0aG7EBANndO8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+y45WWtqmawk/VXa/xqLKK1ShSEaCWmUx7bDeCQFg8=;
 b=hfAsqSCgQ7/gkBLemUZ5FYroHA+13KB1wxbH53o3N+1Es3s5rOuYywAfOAjLaedglnB1H2KB631Nfqy/rXuw2XXqYtSA8eQ8yLCdjQ42fjDDSy/UnslLUlmg+P9xKGR7b9MPIxRP1BBMP6AufgPGP4fU/JemRPf28Q8aAb17K2xReP+KKhOWZmpvuUpXMlUP+DeZdnuY3gLtRp1mbOmP68vYShFxC/YO88UQtuG/RzZDhvDCCg+4er1B+wpuq2/YlMcbELNEdws6ZLwXDHQIiKnQadAcLBf/qa8N0/HShfDy6P1RQj9pKZT4Ov77fF7msZOKTlOwCa0Xt5l+bYvoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Fri, 5 Dec
 2025 01:08:53 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 01:08:53 +0000
Date: Thu, 4 Dec 2025 17:08:48 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/4] tests/intel/xe_oa: Return hwe from same gt
 from oa_unit_engine()
Message-ID: <aTIwoMb5sqYK5T2M@soc-5CG1426VCC.clients.intel.com>
References: <20251205000528.720706-1-ashutosh.dixit@intel.com>
 <20251205000528.720706-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251205000528.720706-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0120.namprd04.prod.outlook.com
 (2603:10b6:303:83::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d02ecf-2ed8-4a49-1ec8-08de339adb8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEU2N0FLaHNKc3VxaTlmTWFod0pmZjBGUHF1SjR5RTFWRVZOK1Y4UUVqbWMx?=
 =?utf-8?B?MHZEUlh5ZjBNdkxGMmo0V3htRENWZU9PRnNsN05WWHRuYk5hRFRGRTQ2MktJ?=
 =?utf-8?B?QnpEWlI2R3dlVnJOTTVON1RjTFJZQTB6aWxXeXN1TXkrbE1kQmdLYzJmNXVo?=
 =?utf-8?B?a2U3RDkrTzVpbnRmeGQxbXJCc29sR3hQazBwRlFuSlUxd3hzcmtaSTVoMTly?=
 =?utf-8?B?OUFpQndxYkxDWTdYUXJnZ0QwaXBCWGJKWVdqQmFTSTNlUDJNbmMrL1hDejhP?=
 =?utf-8?B?YzNaV3BXSXVlcllsZGZJd1BHcjE1V3JhV0hpRjVJM1dNQ2xFdEdzVk5YWk9J?=
 =?utf-8?B?TGJEcm1LSGZYTFU4NTJUWDdtWUNMUDVlMEZGaUNXbW83TlhCcmJvTWUzQXcz?=
 =?utf-8?B?TTgzWVUwK3M3L1FGV1M2cm1TT0ZtWTdxU2hOLzFtbmF6Um1sMWhIV3ZZUHdR?=
 =?utf-8?B?Rnlyc21Ib3BpS0FBZ0dSanByU2s2T3kzU2ErY09aT0FvM2ZWeHFrNmNSTk9C?=
 =?utf-8?B?bEJVcGMyOGNUS2pGNEREWVFUcjM0QVgxVXVBdWhmQkVtc05LUFVOQXVPTTBR?=
 =?utf-8?B?UUpTcW9NdHF1Wkg0bUJMMWVOMElqVjdkTkI1SjRUVThERDI5MGx3L0lIZysy?=
 =?utf-8?B?YnVXdlFnRnRNSnE0Y0U0a3p3eTJQc2h3QzVlRkgyVjJmN2lGeFo4aUk4Rmp5?=
 =?utf-8?B?cWtHVEx2NVZ2RE0zUGhYdjgrUXBmazJSQUpHY0hkTXdnRUdSSGN2emxtckwz?=
 =?utf-8?B?UjBROTdhV3JDR1liTzM4MHEzMTlTdFBCSEhLeXI5Q2lkMm9mbDZWZzVZUHI4?=
 =?utf-8?B?UWZvMXEvTjlLSS9ocy90UlczTWlCV0VEK3VjSEJJUmFhME1xcWpPcVNzZHVs?=
 =?utf-8?B?VUxqUFFSaklRa2hHR2RRNHZqRzdJU2tuazlpOEVheFladnREM3dDYUlOTENs?=
 =?utf-8?B?bVl2WDlXd1Z4Zy9ocFZoZnhLeXFEMTFQNmN6cnJQVnRYQVV3T1E1eXNnd3Zo?=
 =?utf-8?B?N3dRVlJZU3ZYYjh3SE9RRHBjL2R1Q0E3bk1YcUJrUnJuamhPZWZvRDdEbHh2?=
 =?utf-8?B?bkEwcWpEZTIxNHh2ZHBwelZlVG1hemNvbXYwaGtVUFNqOFBDWVNhdSt2UCts?=
 =?utf-8?B?eWtWRkMxcTdvQUFOdjBYMDJtMm1wVkd4dzIyK2hjSkhWTjJnMUtpa0NnU3gx?=
 =?utf-8?B?QW1JMSsrcTZBMzRvdFd2bzQ0RzJWM1g1OVJxa3k3bkRtaSthcjhRb0xFOTFh?=
 =?utf-8?B?aDdoa05CNkFXMWF0R1gxZ0Q4OTAxVmlpWnE1NVpoL3hOVHhOZWR4SFNodTg5?=
 =?utf-8?B?QnJSSm1adnJJVXF6SVptbXpSR0V2Q01xWnRsWlBCQlN0dEdxb0Z6Uk1VN0tu?=
 =?utf-8?B?TU5tMkxtZk56K0FZWmhUU0tHUjEzc29XRFVYTkpzb3hCQmRkOWt3ZkVCbUdK?=
 =?utf-8?B?OENFMHdLRVRMbUtQbUMrWlhPWmJLNVBYckVLUmh5Q1BVMC9XN3hTQS9lYzJu?=
 =?utf-8?B?d1NTUXVjNjFHZzdZdTdtWndpRWVzWkNiQUlaL0FTNEhyRjhnQXJmcng1dEF5?=
 =?utf-8?B?c1B1c2duaG9iZDdtREZ3M29LOU04eDdpTU5NK0IvRkd4Q1ZEck55L3lpVmNH?=
 =?utf-8?B?UXdYQjFZR1FvM3Z2Yko1VFhHSzJkMGRGSldIcVR4dndud1kyL0d5WW5WR3RQ?=
 =?utf-8?B?azU5V2lEK2doWXJHNFpzT2VqTWhpVTNTbGdwb1VUb3hUUC85LzduVTRMd3Av?=
 =?utf-8?B?QUlBdndraGQxKzc0ZGk4UlREZzkvWThOaHZJZHdxVTF2aFJ5YnVNQXFPQUtv?=
 =?utf-8?B?UE84RFVFVUlWeHpnRWZTZllkV1hmNis3SmxlVFhwbWpUbEE1SWxXblEzL1Br?=
 =?utf-8?B?SnkvaXVuQ3M1UnFHMkhBWU96ZWZvMmhncHBnVEZzYnE4dmhES2lPQmpxcmZn?=
 =?utf-8?Q?wd0tKPbfbJdI4AMpRVOhAcLkCkLLKOtt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkFGT3F3MFJtMjhFdWFSQU91eDhRR2lKalVIeGExVGdEb3Zsb29ENEtUR05k?=
 =?utf-8?B?a2tLalpaSEZPVGZxSmI4OVlGMDEydlhPYnd1S2hIMGhXMUJGK05MdWIxYllM?=
 =?utf-8?B?WTJBTnR0ZXNMVG9jOEpISDVaSERkSEdDbXdoeVFIV3htWFYzS1lQQm5PMkFw?=
 =?utf-8?B?V1hlZWhGUXJQOUM1VHhKQ3RqelhrYnBJUlgxL0tBYjZkSk5NSS9BVHZYZS9h?=
 =?utf-8?B?MlRYMVMvSEE2TXowNnJmbUdoeFJud25Ld1lVOFpadDNzajVjbWhGR251dkZz?=
 =?utf-8?B?WlQ4eUZNTENZdEVjVEtqd25MN01KQ1BhbkVtRGFDc0NTMmMxQmNUMVdJU0Rw?=
 =?utf-8?B?WTFybEpWRjU0VnQwNzgyWktPZmNka1d1eGhGSk05Ty9TUURvSi9XeHh5MlU2?=
 =?utf-8?B?NGpZQXZSYzBHd2ZZMXdFdll4ZXVieFlzNFNqUzR4VjhLampsUTNzM1V4MGxJ?=
 =?utf-8?B?Ny9KMCtXSjF1dCt6bnlQTjFNU1M3ZDJmLzZWOWlGRDdPeGhLZmxLSG1abW9S?=
 =?utf-8?B?TDJ3R3p1bWJ0UTZHZFkrRnhCT1BaeTlJd3B5TzhVKzNNWWQ3L1hyVWJldmRT?=
 =?utf-8?B?d1ZhM3RlRXJpSDFlWWFielltQTVuU2pQNWhoaXJmSEJWbTVDR3I0cUIvZ1hS?=
 =?utf-8?B?eTk2Zy9hK2hFRVpBZVFva2toekFzMDZBUGZnWmFETHRIOXVZMDhnUDAvNzF6?=
 =?utf-8?B?Z2NuVWlMWjNPSHU4dEhGZlc2ZHEybVdPbW9qTTBrYWVxalJycEZMQ2E4b0Jx?=
 =?utf-8?B?VkF4MmMrOU93VS9QVFJPTU5lUnhub3praVE3NUxWM1JZT1JoREl3MFUwYm5T?=
 =?utf-8?B?UmhXWHV1WXNickJRUmtvSzZJdlpIVmZIRXdvUEw4T3QwMW5ucS9SVTU5T3c2?=
 =?utf-8?B?OGh5MjkrMjJDWnBoeERGb084cTgxcDdHMUEveGlHMHJOTXJIOVpSMWl0cXV1?=
 =?utf-8?B?Rml2MWFhRDNob1M2UVVrb0tTSGhjcDcrK1BJcmw5RDB2Z0dTMG1mYmtYb3kw?=
 =?utf-8?B?SkcyMWpMWGVQZjF5OUY4WnhPM2xTSS9IUlBWTkJuZVFLTk9IZFFGemdvR3dJ?=
 =?utf-8?B?OVU2YTVRdDcvN2xvWkJFb2pwQmswd1JBQWtkLzVuNjRMdVAzS2N5dWg0aWZa?=
 =?utf-8?B?SFl4b200T20yRDNjcGJsTUJiK2daQmltWkpyWUlJOE9JWDQ1c2xqeHVrblVU?=
 =?utf-8?B?Q0g5MEpXTlduN3VXTHJYMUFVSG41eXl5ZStsYk90anFtcmdaUVlZMUhyamRM?=
 =?utf-8?B?UDQ5bUJ0NVBac0VmZDZ3OWdmcE5vVUZoZE9wREJlV3k4cnNmcGkyR3h3QUh6?=
 =?utf-8?B?ZklVYVovQk1qYjNqaGFhUVRwNHpQZ2RTdXdxZWNNbEpIOWUzWmFvUmhFTlQ0?=
 =?utf-8?B?bWNrK3BNV3l3a1M3RTdJL1krL3cxOWdYMnpJMGwvakhhTXd5dGtyb3pTcnVF?=
 =?utf-8?B?T0FzRE9GV2dBc1A2VXFmVm9pdW0xWGZLZFJnY1NzZ3NFZm9qV0NmWitHQ3p2?=
 =?utf-8?B?VFBlN2hsMEF2TnBMMmtvYkxqVkJ1QnRaR1J5T2xTY1RJYm1NeWxKQnFvNEpp?=
 =?utf-8?B?NGZnZkUrTjRZVUVGcVQ0MGtmK1NISExPOGhkaXh3OUVQZlZXUnpkNnZzdjU3?=
 =?utf-8?B?M1pERUZGcTRpcWlWQm5aSzNOUlhOTTdURkRyci9DUE9zbUxNdm9hTHpEZ24z?=
 =?utf-8?B?dHo1MzV6WEJDZ3BWQUx1NEFPdTFmdDhoMmtZWlFLbmNUMjB0VEZoQkFrWmk4?=
 =?utf-8?B?RGNuRHNUTXJRT0dVMXJZTFJWVUh3NmtDRklWUGdaRXlJMVVhVG9hSWNPTXBI?=
 =?utf-8?B?dzlPUEFzMlVoRjZXdm5HcENEZW5NL0xwOEpGNWMwMzk0WHdUNnFkcVJmS0lN?=
 =?utf-8?B?MmFHeXVBQmRCdXRDR0RjSFhDUHdIRE5Cb0RrRDV2aGw1aGJaeCs3UCtNbFhX?=
 =?utf-8?B?SmQrMlY5Wm81RHVOcGdqRFZzY1VQZ1Ewb0UvblJCL2MxaXE5MmRyZ3h6dllo?=
 =?utf-8?B?K0FocnA2anRFTU5FdHZXS3JWTUpFdXVhMktuVUpBdVVyTXFUWmRRNndzam0w?=
 =?utf-8?B?RHNrM3JJR1Rtem9nb0lScTJaaUs2c0VueUIxODI1M3hieHczK0JIRzh4NHJF?=
 =?utf-8?B?dVVpb0JJNHI4Uk5hejZmbmZ5bFJGNmNBVEZmWjRmSkxlNG5GT0g3Y2lwSHFj?=
 =?utf-8?Q?ZX+3GCjsAOCzBZL2oPPePCE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d02ecf-2ed8-4a49-1ec8-08de339adb8f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 01:08:53.6637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaliyvtorWnwPEeuP8F5Sqtrx6Dh6Qz3+222wtkRfIsDTj4/OSgYy3j/GLhwCUke+jicNRrtMPEJkrUoXmGZyEQe4Aka7PstwoxYMblcCH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
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

On Thu, Dec 04, 2025 at 04:05:26PM -0800, Ashutosh Dixit wrote:
>For some tests (e.g. mmio trigger) a hwe (and exec_queue) is needed for
>batch submissions, even when the OA unit does not have any attached
>hwe's (e.g. OAM SAG). To enable such use cases, return a hwe from the same
>gt when an OA unit has no attached engines.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Assuming the gt->ids are intentionally populated by the KMD, this should 
return an engine from the corresponding gt for units that do not have 
any assigned engines.

LGTM

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 17 ++++++++++++++++-
> 1 file changed, 16 insertions(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 9302d1c83a..c8475720c5 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -486,7 +486,22 @@ static u64 oa_format_fields(u64 name)
>
> static const struct drm_xe_engine_class_instance *oa_unit_engine(const struct drm_xe_oa_unit *oau)
> {
>-	return !oau ? NULL : oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
>+	const struct drm_xe_engine_class_instance *hwe;
>+
>+	igt_assert(oau);
>+
>+	hwe = oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
>+
>+	/* If an OA unit has no hwe's, return a hwe from the same gt */
>+	if (hwe || !(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID))
>+		goto exit;
>+
>+	xe_for_each_engine(drm_fd, hwe)
>+		if (hwe->gt_id == oau->gt_id)
>+			break;
>+	igt_assert(hwe);
>+exit:
>+	return hwe;
> }
>
> static int __first_and_num_oa_units(const struct drm_xe_oa_unit **oau)
>-- 
>2.48.1
>
