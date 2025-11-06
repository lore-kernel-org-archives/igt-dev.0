Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CA2CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 13:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D3B10E8E8;
	Thu,  6 Nov 2025 13:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sv1nfKI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6120710E8E0
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 13:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762436938; x=1793972938;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XTaomNWi/Y2ftrwByEweKXdg563aHdED73L+DZq3Rso=;
 b=Sv1nfKI3nO0LEQls5PE0/uemZvOmMxHw8wWE9QkJcYvrb4du1SGxUgTl
 BoIeOo8Lmvrbqoz1RBPw8f+/ooX+zSnwaoc5mvoKrZoexiKlL+61o0Kz+
 o9YYTcwVBHPEB65iStFKTcmG0QNHj95vVAYXbHyzz0oUCSKNa72XbM+XU
 iAFLucGemqyim43ptiQrdCcDqqhohaPN633UJ+r4NVsbgXhsPz7SGetLv
 nUQZo7fTHfQNis1MiN0cwZYToCIBnK6duiQto51zImxhJphOuTHXmyS9b
 LkMC0vOBSujiChcnXRya0YFpfxYUHQQNpMrBQ6ycDtIIKdE+UWhVkja6O A==;
X-CSE-ConnectionGUID: yJpbq7x4T3efznExbAaH/w==
X-CSE-MsgGUID: 9nBrWGNhQ1el3alPo5+3Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75688008"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75688008"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:48:57 -0800
X-CSE-ConnectionGUID: TJs/9CAhRzCXR8DFx2wi/w==
X-CSE-MsgGUID: ZYRZA+q+QXuNvLpl5EEqlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187049645"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:48:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 05:48:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 05:48:56 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 05:48:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RR+sPT2CjFOCKL+uYzVom9xZ7GcSjyu9ms5mZwnSu3Qp3kOPnMZLw0L4oUrYbryZNlIljrG/chq9CNvs6uVq/+l8Hz6FiJ3KfFbHZGTZc9BVu/lbZcn/8InXNWTBBV+pqFi4k+IKrF4SKp038YvcznaY34H9OWbik8zEDy+GiqKj+3Pmdve/AZ5q8WirGT0omeedzEolUAaga15VaAzGsvo/Isf9J8YMrSoAgWfbKBM425/fRnovTfxF0P/t3i5LDj1TdgvgQjIXZ8O5AGoBBXb1/jHb94OChBY9XGQykBKWgwej1ttyO5hrJEqacXrM53jrrp0BOvftbZZBrUjHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLjQnOBmEK7FATccheh8dosAtAm6Bgv3Q7fmP44c4gw=;
 b=y3mOHGGWnobor2CFLYpZNhWTu2920rbXeCAXCYuwb/2271HLUgWkavNDxRV/CkqgrzewSgZoS4lCmgscWwkCffBw1ONY4OFP4KJ+MMY4N7xcnrTtG+fTPIRtiYftZrpjrmEgMc60gGjM9pTiVLDkiLUsMPukj5S07HsNLA3ZwEirue+Gz+MQ63STE+G1GkwCNqFcw7jTPLt6gPyrGAa1a46kKgtnRHj9SBg2/yU9wMH3tn5iHuDQ1hBqoHxxxWMG9fv5RmQG2Td2LI6WwN5YL033m/W+ewG6cW754DB3jwNGBrSI+MRSYmc2IgkoTm9JXE65rWp+rAbIFPwLF33h8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 13:48:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 13:48:54 +0000
Date: Thu, 6 Nov 2025 14:48:51 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <lukasz.laguna@intel.com>,
 <jakub1.kolakowski@intel.com>
Subject: Re: [PATCH i-g-t 6/6] tests/intel/xe_sriov_flr: Do not ignore failed
 prerequisites
Message-ID: <20251106134851.thicjltxi7cxj2bh@intel.com>
References: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
 <20251031125633.1374273-7-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031125633.1374273-7-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: DUZPR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: ca587600-7c04-4f1e-111d-08de1d3b39c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTN5QVNSb1dpZVNyTytYd0NvaGJFNDhBSUgwOWF1SHVDSmZhZFl0NVRpYVdu?=
 =?utf-8?B?NEJMcWRIUWYrTjJUSDdEdE5tZ0ltOWdjMUhxNFV5ZjBwZ01GeDV4QlJMbHpP?=
 =?utf-8?B?UW00WFpOalMvMktHMkpxaTlaZk5BR3lmdkpqZ1l2WStYV0lBYVF6NFBkdWo0?=
 =?utf-8?B?Tng5MWNYVEgycFF6U1M5Qmh0dEJIZXVkR3lzY05nemh0MjZDZkc3NmRLcE5I?=
 =?utf-8?B?cGh1cGxMS2VFdVNUUzV5SE01QlZYUHhWUVpUR282MjVjbjBveUR3TFdQT2Vh?=
 =?utf-8?B?aGNxc1FMRkZxUnR5bnlSVW51Zm1adkpIVWlrVEgzN2lUR1krbnJiRnlVYmtS?=
 =?utf-8?B?RnJ1b2dqRFdpMG9RcFQyT3JHQVlwVUJwUk0rTk9kWjN2amlxL1lYOWlBUy9x?=
 =?utf-8?B?WE1DQ3pRVE83M0E1ZzhnRk44U3VCR0kxSEtiMVdxcDBSMnNEc1RiMitTenJz?=
 =?utf-8?B?dU01VnhLQ285c3VkL1ZUcS9teXMyZDRUY0k4YWdGYmdEOG5TN2xkRTN5ZUZR?=
 =?utf-8?B?enZoZWdUZXZRZ2FaRm1BSWF1U0tlWWtqTVRHWFV5ckt1aVB2QTlDNFhrdXNJ?=
 =?utf-8?B?L1F5SERRVmdNbllVeDZTSDlCMTNLY2Q2ZjgvdUVXdUtuQ3NpWW5ESS9hK2tK?=
 =?utf-8?B?MGlMQVh0NDErWW8rVHZkSXhSVzNRTEFqaWZpaFJqRHQxWUs1aVhiMFY4d2tx?=
 =?utf-8?B?Sm9mN1hHWHFOaDM3OUgxdi9zRDFDVzZFQ05GRmVGS0REbGM2YmEwcm9YbXZE?=
 =?utf-8?B?QmQycWN1QmtwNEdUNVZPZHNqMG5BY2hyQk9iMEtIZmlMMWZuK0E1czFnNlo2?=
 =?utf-8?B?U0RwQm9CREViWDFDQkJmNDhMcTZ2bjdzVkxQaTNmbGVEWk5nS2x0aC9CWVdE?=
 =?utf-8?B?YVZObzBYKzc1NnZONEVWd1dIMWFOZkdJaEJ4d003OWNWUlpHbnNFUlM0MU5M?=
 =?utf-8?B?SUI1cFQwbVlnSEJybytzVnBaejZSVjAwWHhuZzlBdTFCK2VZb1kxQTBkQXhm?=
 =?utf-8?B?aitKaG9mcHBmK0J6SjE5NFVzMkNYa21EaU1lSTFIeXhPVmFMazcxOHZ2MmdZ?=
 =?utf-8?B?RHFUYzhsNWwrYzdVaUdPaVpmM21BYWczNThadURYM2NuT1VZQ0xOdUt3blF3?=
 =?utf-8?B?aWtJdDloRGp1OFB3OHpPN3RUc3lJYStXTTN6RHRZTUJlcThNamdGSVZkY0xj?=
 =?utf-8?B?Qmk0a2ZvaVFVOEk5SEtHSXF5b2VvVmhiTHZ1MXZPbEticHdvVWRhWEE4R1d1?=
 =?utf-8?B?cEZCS2FJMGh0cXBabEV1dGFYMEhXWmJoNXFTOFpERThqK1U2RGxpcHpBVmhs?=
 =?utf-8?B?ak8weWYwUTZPTlRmbUthSk8rblJSMDVUMElmWVFwOHNudXhEOEFrVUpuczNY?=
 =?utf-8?B?OXo2SS9iWGtKdWl0M0V4UXQ3RlpiU1RvaWV5emcycGxZajlBbmFZeXBabWpT?=
 =?utf-8?B?RFduQjF3RFNncjBONDNBbGxEYVBFZDJvWEF3UkV3SzNqckhCOXpVeW4ybmtQ?=
 =?utf-8?B?cW1IZ3MwVWtrbVJKWW1HL2lKLzBPdmVFeE01b3RVVm9CUWFFek1FYnZneFRn?=
 =?utf-8?B?WU1MT1B2VlhpbkNGM2pHRDJUUWVYclkxN2lKSFN4L1BJdTl5YjlFN0ZYT256?=
 =?utf-8?B?VW5XUUtsTzIrQ3lDRzVJdElXUTMwYndpZlRSbkZpcFd6VkxlTHZuK3Nya2tx?=
 =?utf-8?B?S2s2QnhEUGlHQXJWUGhtZ3pDenk5bnp1K2xGMXIyVDg2aU5Tc2UyTytqbVBo?=
 =?utf-8?B?VG93QWRxWFpiai8weTI5OHkwYUNyOUpZdis0d3YrUTgyZmx0OWVRUW04M0Zr?=
 =?utf-8?B?SEErS2VCdFpQV3VWS2hmNnNRUzY2OFdhK1NjQkQzUmdLTWtOUEZuWWxzOGd0?=
 =?utf-8?B?N0JORVBIS2hTZXJWQWlRem5XZHJ4UE9FWlVDd0hlRXhxb2xiejlaSGtQRlpk?=
 =?utf-8?Q?WOpRg25UU5lDTFphGdjVRZpaOZDKXamH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QktHZjZUOFNIWXhuUndocm1jaDBHZGVSZHk4cVJORTNTNVFXb0lzaHczOTVx?=
 =?utf-8?B?KzlydWZ0QSsvanFFcVBVZElGTk9KUzZGR0FGalZZVGFlc2RvOHRmTStQbWw5?=
 =?utf-8?B?WG5Od1FKN1Q4U1lUQ05ENmZFa25takNHL05vTmd2Mkg2YjlycHc1VlVFbEND?=
 =?utf-8?B?L0l1QzZtQWJjcWFiWHVtdDVCcUlJSzJBa3hkK1VrQkxsQ2ZHN1MvcUs5aG1k?=
 =?utf-8?B?TzIwN1RXYkhzWCtZR1hiNEtyRlEvT1A0L1A5WnZjbWJUVVNJT2U2RlEwcGxV?=
 =?utf-8?B?dldzeFZleHZMNTdMMmFKbkhtakNtUmZTbXpqZ1VaWmJ3Q3R3bTE3WGpzZFhL?=
 =?utf-8?B?anNqbzJncmFVMW1NMTRqcHZCM1I0SGhDZmNHZFlMTkxrUE9Na0tUVTI4OEJh?=
 =?utf-8?B?Tko4c2NiUlNiWXNoWTBuRTVjYUJyVWloMzIzVzFoVnlPZENuWHdkR0sycE5j?=
 =?utf-8?B?S2dlQStsQlJSUzMrR1hVcVlBbEU4bWdZRU1wbnNRNzVFOUhtRUYxV1ZtcDN6?=
 =?utf-8?B?MHVxWTZPN1JkTHgwTXVzalVhOFBLaFBTQ3AwMkN1ZDhsTDUvRTV4T0NmRE42?=
 =?utf-8?B?SEJDa0NXYTRlK1dLVno3L2N5M3Jxa0NxYW5YNFUyRExCRzV4WTdhenVnN2lC?=
 =?utf-8?B?NVd0a1lXNTYwM09kM0NkMXBySHpKbUtCUkVzSUVRaGZSTnplbTlXLzNPeUw4?=
 =?utf-8?B?RjVWb3lnTXdLRE11SSthdVUwU2d1SXBvdWlFWnZXdWRSNEg5U1d1eEY5VUhZ?=
 =?utf-8?B?elJVKy9KSG02TDJOZUIrVlhxMXgyanlkYmZXQTdWeThOU2tmVUZyVkYyQjRk?=
 =?utf-8?B?VGN1aUtTK1FWTy9xWVVlb0lxZzRXYUQzMUw2ZWlicExIck5TUDg2Nm5KZTRY?=
 =?utf-8?B?SGVKOE42YmxRc0NLbTFRV1YxVUkydVZlQVhUS2MrczM1K0hCRjM5cEdPd3A0?=
 =?utf-8?B?UHlvZFFlaGVRVjNoSEhVeDZtaFFJd2UwdUExK2ZWN1lzdEdEZFROYWtCRkpP?=
 =?utf-8?B?TFVPTHJkQ2JkU1Bqam1yMFJrcHNOcUx2Wm5NNTMvV2lieUFGdmFIUHhXbEVm?=
 =?utf-8?B?Z3RsaUxTRC91LzFheGJvbDhucmxYT2lZVEI0Z2tBRWxuYVo1S015YjhRY2t1?=
 =?utf-8?B?UDBmZ25icWhqcFFxQ1I5TlhQTG50UzF1OUQvVHdXVEZZKzAwaWhaRlZ2Rlpv?=
 =?utf-8?B?RlBCeHdnWnh1NDlNYnVUTEFoY0MzcnNZQlVRNzBDU3lvcXFINWw3Z3puSjh2?=
 =?utf-8?B?VjJZNkNRMk42RHg2cUxkQkRmMjU1Z0dkNG85cW5wK08zUGZCMVN3WFF4aTRl?=
 =?utf-8?B?MElqTjBWN2x6Y0tUQ3pjdGRwWktrOVhKUzhUR3NFVGppRTg5dFpUcFo1S2hD?=
 =?utf-8?B?R00xUDVXR2RWK1I3eFA1R0g3b1hnb25TZjNsdUU3NUJVenZQbjM5R3ZmMEV6?=
 =?utf-8?B?TnFQRkhuTE8yWHV1U1FxVlZzMU9NbjZDUkl4OHVjMTU4ZlhrWkZOM2QvaWJ1?=
 =?utf-8?B?Nk00M2pJVXBYZXFOQTllWlZ1UHV6T0RtOUpWNXQ3K0I1UDMydUNFRUxIaVBW?=
 =?utf-8?B?Qmw0REtzRTZ5N3pYTWNKaUlxNGYvYVFNYU9uZUo4NjZBK1FuV2xQSVZRbXlU?=
 =?utf-8?B?QnJVZ2tUeDJ2RW9YVWd3WXNKT3hOeGV3TUhXd2I4eXh5TE1MUEVScDVGQW9p?=
 =?utf-8?B?U1lreHE0YnFzSWF4NXlMUncvaXhlYnBmTHlMek1tS1pIMDBHWExDL2NvSmdS?=
 =?utf-8?B?TDdreWlnNmo1SktCVWxkRDRNK3F1eGhOUkdXdVYwejJnSFo2SGNkZEFBcmtF?=
 =?utf-8?B?aE1wUi9pZTFkbElEbTZtRXFMaEYyRnoxUyt6NXA4YkwzR2g2eDF0bTc1dkRw?=
 =?utf-8?B?S214WkYyTXFsMEZpZ3pNWkJ4ZXJBOHZOZkVjTk40WWhNT0E2NnVqcDdvbHdM?=
 =?utf-8?B?TW5VNzJmb2UrWVVsRmNjcFlRREtaTHo3NHllNWZjRzdKcWlJYWtpRnFLNnl4?=
 =?utf-8?B?K2grTVg4N2NkeVhCVmxWejBDNWhhNlZTSm0rMk5lV1lPNCszTjlpT01Ga0xO?=
 =?utf-8?B?eWtONTRXMVhhVkE5MHl2bFV3VEFjYkpsdDN6dm43K0tLd2FvSmJsQWhXRDB4?=
 =?utf-8?B?MmNWWW5ScFhqYXB1QThLNDcwY1pENTR5RHYySkZrdnBGZTUwaXZpV0l3Q0pY?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca587600-7c04-4f1e-111d-08de1d3b39c0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:48:54.4362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcNZG6obkD/H/vTg0XJ/lWbmae7oeGLAgQ2iC2zq9MiGnGreQIfYtL2BMCrRqkorceas/5U+YiytgeuMWtNlxsI3mzMYn4sOYg4FaZFMFfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7312
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

Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com> wrote on pią [2025-paź-31 13:56:33 +0100]:
> Mark failed prerequisites with an abort reason and treat them as test
> failures instead of skips. This ensures that such cases are caught by CI
> rather than silently ignored.
> 
> Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/intel/xe_sriov_flr.c | 59 ++++++++++++++++++++++++--------------
>  1 file changed, 37 insertions(+), 22 deletions(-)
> 
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index a42090744..7c496cf9a 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -53,7 +53,9 @@
>  
>  IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
>  
> -const char *SKIP_REASON = "SKIP";
> +static const char STOP_REASON_ABORT[] = "ABORT";
> +static const char STOP_REASON_FAIL[]  = "FAIL";
> +static const char STOP_REASON_SKIP[]  = "SKIP";
>  
>  static struct g_mmio {
>  	struct xe_mmio *mmio;
> @@ -196,7 +198,7 @@ static void set_skip_reason(struct subcheck_data *data, const char *format, ...)
>  	va_list args;
>  
>  	va_start(args, format);
> -	set_stop_reason_v(data, SKIP_REASON, format, args);
> +	set_stop_reason_v(data, STOP_REASON_SKIP, format, args);
>  	va_end(args);
>  }
>  
> @@ -206,7 +208,17 @@ static void set_fail_reason(struct subcheck_data *data, const char *format, ...)
>  	va_list args;
>  
>  	va_start(args, format);
> -	set_stop_reason_v(data, "FAIL", format, args);
> +	set_stop_reason_v(data, STOP_REASON_FAIL, format, args);
> +	va_end(args);
> +}
> +
> +__attribute__((format(printf, 2, 3)))
> +static void set_abort_reason(struct subcheck_data *data, const char *format, ...)
> +{
> +	va_list args;
> +
> +	va_start(args, format);
> +	set_stop_reason_v(data, STOP_REASON_ABORT, format, args);
>  	va_end(args);
>  }
>  
> @@ -234,7 +246,7 @@ static bool no_subchecks_can_proceed(struct subcheck *checks, int num_checks)
>  static bool is_subcheck_skipped(struct subcheck *subcheck)
>  {
>  	return subcheck->data && subcheck->data->stop_reason &&
> -	       !strncmp(SKIP_REASON, subcheck->data->stop_reason, strlen(SKIP_REASON));
> +	       !strncmp(STOP_REASON_SKIP, subcheck->data->stop_reason, strlen(STOP_REASON_SKIP));
>  }
>  
>  static void subchecks_report_results(struct subcheck *checks, int num_checks)
> @@ -593,8 +605,8 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>  	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, tile, mmio,
>  							 &ranges, &nr_ranges);
>  	if (ret) {
> -		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges (%d)\n",
> -				ret);
> +		set_abort_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges (%d)\n",
> +				 ret);
>  		return -1;
>  	}
>  
> @@ -605,15 +617,17 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>  			continue;
>  
>  		if (vf_id < 1 || vf_id > num_vfs) {
> -			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#" PRIx64 "-%#" PRIx64 "], num_vfs=%u\n",
> -					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
> +			set_abort_reason(&gdata->base,
> +					 "Unexpected VF%u at range entry %u [%#" PRIx64
> +					 "-%#" PRIx64 "], num_vfs=%u\n",
> +					 vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
>  			free(ranges);
>  			return -1;
>  		}
>  
>  		if (gdata->pte_offsets[vf_id].end) {
> -			set_skip_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
> -					vf_id);
> +			set_abort_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
> +					 vf_id);
>  			free(ranges);
>  			return -1;
>  		}
> @@ -626,9 +640,9 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>  
>  	for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
>  		if (!gdata->pte_offsets[vf_id].end) {
> -			set_skip_reason(&gdata->base,
> -					"Failed to find VF%u provisioned GGTT PTE offset range\n",
> -					vf_id);
> +			set_abort_reason(&gdata->base,
> +					 "Failed to find VF%u provisioned GGTT PTE offset range\n",
> +					 vf_id);
>  			return -1;
>  		}
>  
> @@ -668,9 +682,9 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>  	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
>  		if (!set_pte_gpa(&gdata->ggtt, mmio, data->tile, pte_offset,
>  				 (uint8_t)vf_id, &pte)) {
> -			set_skip_reason(data,
> -					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
> -					vf_id, pte, pte_offset);
> +			set_abort_reason(data,
> +					 "Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
> +					 vf_id, pte, pte_offset);
>  			return;
>  		}
>  	}
> @@ -782,9 +796,9 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
>  							  XE_SRIOV_SHARED_RES_LMEM,
>  							  main_gt, &ranges, &nr_ranges);
>  	if (ret) {
> -		set_skip_reason(data, "Failed read %s on main GT (%d)\n",
> -				xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
> -				ret);
> +		set_abort_reason(data, "Failed read %s on main GT (%d)\n",
> +				 xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
> +				 ret);
>  		return -1;
>  	}
>  
> @@ -800,7 +814,7 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
>  
>  	for (int vf_id = 1; vf_id <= data->num_vfs; ++vf_id)
>  		if (!ldata->vf_lmem_size[vf_id]) {
> -			set_skip_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
> +			set_abort_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
>  			return -1;
>  		}
>  
> @@ -833,7 +847,7 @@ static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>  
>  	if (!lmem_mmap_write_munmap(data->pf_fd, vf_id,
>  				    ldata->vf_lmem_size[vf_id], vf_id)) {
> -		set_skip_reason(data, "LMEM write failed on VF%u\n", vf_id);
> +		set_abort_reason(data, "LMEM write failed on VF%u\n", vf_id);
>  	}
>  }
>  
> @@ -897,7 +911,8 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>  
>  		xe_mmio_tile_write32(mmio, tile, reg, vf_id);
>  		if (xe_mmio_tile_read32(mmio, tile, reg) != vf_id) {
> -			set_skip_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
> +			set_abort_reason(data, "Registers write/read check failed on VF%u\n",
> +					 vf_id);
>  			return;
>  		}
>  	}


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
