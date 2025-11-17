Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8761CCEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 15:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF8210E3E6;
	Mon, 17 Nov 2025 15:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjUYAAx2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D8B10E3E6
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763394719; x=1794930719;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1PLKajGkzPQQB2fwYcgZrjc7+Z/jKQulPvHEwoTgix0=;
 b=jjUYAAx2H8+SuLRP5MSlN/fJGtixsaZJ+TLZ2m16/5RKYMFLt31+HHLm
 DwJb8s+nVhbdbsOKnpduVsUWQ5T7kw27HQBjFC4SiHK4xURLjZmDoyIiu
 k0faYfcRRxd8UwUbehqiQ8+F00Ts3hxeaSAZZRiJs1pBc2ktK4NT5kxw6
 HDtO34tOLphkfCfvZfkLdoVgzykX26HxBjtI9eXOtSVmb6vrFiL2svHzQ
 kZ6xkjBjEr5IcL0+Jjf4j3esh2fiaT9AGKMkFvNQ5C6hpkqlgibGXX0lw
 tx8YtWcMdHqvUStCaN2pgwqi+pCwfE6jMN4TZdaAXznV2pAyKGV7h2o0X A==;
X-CSE-ConnectionGUID: iJnMgptaTcibl/z8Nx1a4g==
X-CSE-MsgGUID: J3DW7H0fSO+4If/SiTyHFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75999589"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="75999589"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 07:51:11 -0800
X-CSE-ConnectionGUID: zVPzeyZVTv+9gmDaL2gypQ==
X-CSE-MsgGUID: Se49Fl8nQ72JYJECxl2DaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="221135870"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 07:51:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 07:51:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 07:51:10 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 07:51:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYFFd+6sULwxymZi2bV7GRk9eHm6PTa3frRSshQqMQULng1Zn/tIvWA7f2ba2EPoP4Y/Ewv5Qq9eToVrbcL18dnIKTnvJyyrVwpJ/ADFZteg6fIKuFykgqbTLCReAT+J64j6suUu59czt5uRPzwP/NFrxPpa9r165zUyJ4UP3U9rNcVh1VmEWJVL7w258xvbct0ZqAJ6o1EAj2Y+WFPrpm3yPX89auUbxETOjQUZfPeuQ0IYkxcpwjCcQ/VVSdShJClgJ7meIyTiXNzqymCVlPCRiN30u+TM3M6FiTvQt+/xjM9+HVGgP3y+BiBs1hdCI+5DTyyLj7SgFxolJYJo/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGyCogciTEBBdcmzizpHRixD3RNu+AWCTGfELNuoj2M=;
 b=w2PeiDHsL7UvlQWsUgNQv+plg1fPWtEoji4+9owKaaAovocistnZ0jKOIrU5FTYI9J+sWqNcJTJQxZCZE9Qb3rpBfpWliJhnaDnczpT0SGxVEnROcKJ83ZntjOLYcnQo+K0G+XgkDHmO2q7i7FZqJ9+eYNEapGq7tnSB7IsDUIyC14Dexpk83TTJJovOc1vt0nJ71gT2FiR43WyJ0omGkUe8KEmfrasqrKA6IWmQe6VtTEYOpwj4rrKyY3md2FTx27MVb6o03qE9gnYJ7Whmh3TbbwBYSMAf2Bf1sa6S6txQw0b4Gvj6o8akJowxp/LZDBvBDn89edmtF0Al0VNkUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by MW4PR11MB6691.namprd11.prod.outlook.com (2603:10b6:303:20f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 15:51:06 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 15:51:05 +0000
Message-ID: <4e88d41e-e65e-4fa8-b910-30de1f8a3ce2@intel.com>
Date: Mon, 17 Nov 2025 21:20:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 04/10] tests/intel/xe_multi_gpusvm.c: Add SVM
 multi-GPU atomic operations
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-5-nishit.sharma@intel.com>
 <556b427ab266daec61e90f9f6db863dc5d19a279.camel@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <556b427ab266daec61e90f9f6db863dc5d19a279.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0064.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::13) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|MW4PR11MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: aa731133-30fa-40e5-c66c-08de25f11da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y204bndtbWUzVTNkeDB3RmZBYy9IT1ZTWWNKS0M3SUNncVYxd0RRSW10NEpk?=
 =?utf-8?B?Z2JGc0kxdHRtSXlVWW9GaldNaG1rWTUxMFN6Z01iVFpsY083Zy9COHZReXR3?=
 =?utf-8?B?SnhSZk5QaWVqUkd0WWZHVnAvRDhTMzBmTVN1dk05RWkybVZoZy9nNmZQRmlk?=
 =?utf-8?B?MVdkK1luRm4xQ2NXN3g4ZDFyZlZML21tVHNwZDBFOHNPSmhSdG9xRzY1c2NO?=
 =?utf-8?B?eDlaZjRhUFRzWUsvRGVjQjU5ZDVXemUyYUNZKzB3NERSamZrWElsU05nS2Ft?=
 =?utf-8?B?V0Mwcm1UQ1VTNnNPNkF2NTdnOGF5aWRVRkxYNVB5QjNjTzVTT0tlL2w3VEpa?=
 =?utf-8?B?RkRHMXM4c1k5N0NabXhMSHRaTlVNZTJNeTBsRElheFNGQlVuSHdqM0tGZ3d0?=
 =?utf-8?B?WXlySGI4RkRYQ25BdmY5cTViVnhKTWxiWlFVTUIvZkxZT0tTZzFFK3BiellG?=
 =?utf-8?B?VnhOMEtJNEVReUJ1VkgwWk1jSitycTZqTnBub28zdGo0a3dGTTRVUllMZk9R?=
 =?utf-8?B?UXZLMmVKbUJSMW95alk3a25HU3JPQ2ZlbEJhdm9QdnBTMXczYXVZRktldDBu?=
 =?utf-8?B?ZktaRkREVFhVYytYTk12ZFREb01QNWdZY0xOWnNyTkFaRW5TQlVUS1QzRzd1?=
 =?utf-8?B?eFFrOUZ2NGpTUDhySWI0RFJxTUl2RHRKOTFGUnJSQVVaMjF4VCttTGpFQkQ2?=
 =?utf-8?B?VHcveE13WW9vYldzc3g1ZzN4MXNjOTZ4MWNvZjNubjZCdG14NTlGMERWZUVw?=
 =?utf-8?B?MTlCd2trbjdtQzdKeGZ3dk92YXJOMGtKaysybHdlQmx4ZlVjQW5rcUI5Z1ZO?=
 =?utf-8?B?bG9QMzk2eGVzUDJERkZpdHNwNWJWdC9KRGg5eEpmcVR5dHdsbUJhVyt6blBk?=
 =?utf-8?B?ZWxGVFJZS2ZMWXBCd3hVd2VMUHNxZFkzVGQ5RlRRcHZzejBhUWhCSzlVbzdn?=
 =?utf-8?B?VjF1R3p3VldXcElpc2Z5c0dOZWsyMVRnV2kwRVFPMFp1aWd0SGROM3dNejh6?=
 =?utf-8?B?UlU4akRSTzc3aUxFTis0em5FUjdvU3loZFlCajRIaFdCekw2ZU9xYWpsSU5U?=
 =?utf-8?B?bWNGbTlMMkh5TmpGNFp4ZXc2dUhaYmY0aDk2ZkpTSkl1c0JwTENNdlZic0R4?=
 =?utf-8?B?MS9YQXZhYXN3c3grYTZsSStJazFJS1dFbVgzRjhhVTc3d2ZnWXhVMU05dEUw?=
 =?utf-8?B?SUxSZUdPL2x5VGlPcUVDdytmQnRqb215NUlrRUk4MmlydURKbTJJUXRHN3Jk?=
 =?utf-8?B?QlZreitCa0dLT3dnRWZmVFcvN3N2VjcvZ3doR0FpYVk3R2NtRVBHVHlBaWxS?=
 =?utf-8?B?ZjBCRE5xMnljTzVoWUxxS1RnT1hYV28vRjl4ZENVNGFGVkFwd2hYUVJLY0lU?=
 =?utf-8?B?MWh5RW9ENDdEb2lqZ2sxMW5zRk93SHRzaVVQQ1JPMzZ0WmMwTytvTW9qVm1z?=
 =?utf-8?B?d2pwZlhpMGV1anA0cEoycXd6ckZxMm5RbFlENDgvVk91REx2Zm1kQ3FPTllX?=
 =?utf-8?B?THpIRFpFajNRVWJXdytuVjRoZHNlS2h4ZHpXMTlWTTE5WEwxU1hqKzJKbE9B?=
 =?utf-8?B?RTJYejl1UlV4ZWlzTTZmZGtJM1pYMGxSbW91N1UybGs4NXEvbUxNNnd5ek1t?=
 =?utf-8?B?L1hVOU1JR2lKZ1ZBUVgzMHVMbGNwOE5ldzFvekRPOFA5YUhwM1Y4Uzh3SlNK?=
 =?utf-8?B?M2toUmladzlxNlZVVEJ5KzNHVGV4SEpWWEIrY09kVXBIUkVXVC9la3hpUG0v?=
 =?utf-8?B?TnRlUWFOQm0renNIVStTcUVHVGtaVW03Z2hoYkp1cUVUVHN6amE1VkovMXhx?=
 =?utf-8?B?THNENFFxNXdWYjVOeFk4Mm5ZamQ2QmFXQSt5VGRzNkZiTURQdGppbUdSQ0hl?=
 =?utf-8?B?WngxRDJVQ2JiZm44aXA4VjVkQm1kdWtTbVJyNFNLUW9udW81VVA5VWRNMFBC?=
 =?utf-8?Q?EiJSOqbVHVSwbXv+WnLvNxb2UE//GRmN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjZ2YlBpWHNndUl1WFVuQTAyNHpEVlVMNmUvZzFIUWMrc3FJYmZzbGJhbVFn?=
 =?utf-8?B?MXpVbjhLQWJhaW9lcWV3ekJZbDdzTnZwMTdMN0FQaWs4VXM3TWxJU0xDMDRq?=
 =?utf-8?B?UExMSzRGUnRjVE1TVkJjZElqVHcxVmdQNHRBeWUxVGJiZjd2YTZveWNKcytZ?=
 =?utf-8?B?dUVYSkpnb3dhbUliWkRpOXpBSUwrZ3VQKzN4a2R4SVBlemRYendvUG82SDVL?=
 =?utf-8?B?Q2JremZCOUNRaytUZjM4VTNFdEphQU10MEpjZHZjSjdoK29OY0RTdWwvMlU5?=
 =?utf-8?B?TmVybTVpMDJxTGZPSUo2aU1ibmhMM0JOUFRtWWdmYTV6Rnh0S1lzOE9BYTdH?=
 =?utf-8?B?RDJMMHNSdDE0NmdiK2VWVVJTK1htNDdmT0V5cnFtcXhrd001WmU3UmRHbHFa?=
 =?utf-8?B?SXppVDlOQlR1aWF5eUExcHQzUXloTncvaVNKOGZNR1RIek15WnkzLzZZNXJm?=
 =?utf-8?B?Wm5RWXU2Y3cxSG9RU2ZEWi9YUUxGZFpqWXNqNEI0bHYxL2dhdzN6cjdCUDlq?=
 =?utf-8?B?K09MNEdHTjNzeXJzcHlsbnFkVisxQVh4a29acUVHaUdGeHFmZXVOOE5xR3No?=
 =?utf-8?B?d1IxZUtkc2dydWM2enphYk5nMXl1YUw0SzNPUTJmSVQ4cW01aGFVeHJsRE9x?=
 =?utf-8?B?Q1J2Q3ozR0E1ZmM0c2xEblhrSUFXWmtjR0JYNk5XZktrRk9NVU52SkN0eGt2?=
 =?utf-8?B?SUlWck94czdQajhKZ1hqaU1HS0Vaa1U3SEZSR3U2ampqVm80Wm1NemJqdlJq?=
 =?utf-8?B?ZTVuSHJJaGlFYUh3cGhURHdFTFRIeDdnLzFHZjBNMEQvVXBVWS84NXM3MEJm?=
 =?utf-8?B?bzRxVCs3cXAvc2JURWM1c0xtd0ROMjVUaVFaNWpBUkY1Wm14MmlFWlVhNFA1?=
 =?utf-8?B?L1QxRVpJL2xmQ0lUREZRT0IyS01kcXVKQkNSNXZHQ1NJTTJPQ2RudWxxczZy?=
 =?utf-8?B?R3k2VFVJV25GMWwzeFIvWjF5RVV1UU5zMVR1RTgzUmxKb2hkSTUxd25HVmsx?=
 =?utf-8?B?ZDhBM2ZqT0Fjb2VxOGRIR043aDNEQ2Q3cnVzUTJqeXdGTzFOZWNXMUFKZ1Jp?=
 =?utf-8?B?YUlRNHJWVmxwUEI3eThYYit3ay9NMWljYVlqc2ZkWXkyRVR6RVdQdHFBbko4?=
 =?utf-8?B?T2NOZDZmUmlYTDNHdHducWJSY01Sa2phSnAvQlhJU0ZvMmRKcnYzNkNDUmNi?=
 =?utf-8?B?bjViWm5CYlFmY3FhbUh1eWNPdDl2YVNzM3AwWHBaeUlhZGxwMENvMkRMSjJa?=
 =?utf-8?B?WTRDSTQ3ZUtaSlNobE1NTUtFTWt0dWFzMnRVOTVEMmRGTklJdi9DZ29SbXZE?=
 =?utf-8?B?WmFRRzB3U2dNQkNXd2h2enEzaDVjN0d0dC93em9qVWMxUWdmZzh5NGpqY3BP?=
 =?utf-8?B?UlJrL0NXaCtyNGFNckxjUHpjU3BWbWFhSi9Kc1JNc1dBUHVtTnNsc0NYc2Np?=
 =?utf-8?B?ZTgvTjdLWXhqdVkxVWU4ZU1la2lVNjMxdUZjU0FqQmNsQ1M0aEVrVlVjcktj?=
 =?utf-8?B?d3AvOHZ0VmlQN3JWaDV1L0lEa1ZtK09weUMvNVdCNTdQNk9kMHFhNHV4M0NI?=
 =?utf-8?B?a0JJeTFsMVU3Q0YweGE2ZUpSakppd3U3aDRlMm56enFXSHNleVRiK252NGlD?=
 =?utf-8?B?aW0vRmcvZytnaTNSN08zUld1amkrOTFTL3hBQWYvTjFHMTJkdHpaVUFlMkxG?=
 =?utf-8?B?Y2owQ1FQM1UyUDMvWkJVMmhIZDkyaXZqTWlma0Jqa29ka3g2SGtZaFBhNC82?=
 =?utf-8?B?WDR2N3BvcWVLU0tvQmZaMHNsWXBTcHJva0NHdEMxaDRQVUVrWklWRmRzZ1pC?=
 =?utf-8?B?em5XWHpaTHdpcDdubjdDOG5ZRHVZdVVxWWRCWk5GcGxTWjJUK2tKYVFKMnhj?=
 =?utf-8?B?anpINEgxeUd4dXRYNkpxSDhNR3RZNE03aVNqRnU3S2xJZWFZeUhFeEVtSmIy?=
 =?utf-8?B?V0s4QnZPSm9sOHR5UXd3U0FkSzdXR1lSSHJnMkxGMHo0VzNQbW5BTkljdHdw?=
 =?utf-8?B?bTlXTGp3dC9DNVU4aVNZZUFXSnYvdjJIYmU1VGJwc3c2eExDZmhISlNOUVRI?=
 =?utf-8?B?cWNEdVUzL0tYK2xNbTNOR25PdDBrZHVDYWZwN1pRbkRKWkFPSHRuMWJDdVdt?=
 =?utf-8?B?ZzgrL3BXTUhJbnk1Nks4VkZaNHJaTXdrVWNXSEh3SUhoaXJ2TC9JNlFHNFpN?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa731133-30fa-40e5-c66c-08de25f11da4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:51:05.1526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkRtu7d34FVbzsXf5tszt28zVE3c7MDwTJ+V08S9v49lYc0kZPBxXJO6JkUi/lYdAf8PShuuWC1TIFHKIW1DOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6691
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


On 11/17/2025 6:40 PM, Hellstrom, Thomas wrote:
> On Thu, 2025-11-13 at 16:33 +0000, nishit.sharma@intel.com wrote:
>> From: Nishit Sharma <nishit.sharma@intel.com>
>>
>> This test performs atomic increment operation on a shared SVM buffer
>> from both GPUs and the CPU in a multi-GPU environment. It uses
>> madvise
>> and prefetch to control buffer placement and verifies correctness and
>> ordering of atomic updates across agents.
>>
>> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
>> ---
>>   tests/intel/xe_multi_gpusvm.c | 157
>> +++++++++++++++++++++++++++++++++-
>>   1 file changed, 156 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_multi_gpusvm.c
>> b/tests/intel/xe_multi_gpusvm.c
>> index 6614ea3d1..54e036724 100644
>> --- a/tests/intel/xe_multi_gpusvm.c
>> +++ b/tests/intel/xe_multi_gpusvm.c
>> @@ -31,6 +31,11 @@
>>    *      region both remotely and locally and copies to it. Reads
>> back to
>>    *      system memory and checks the result.
>>    *
>> + * SUBTEST: atomic-inc-gpu-op
>> + * Description:
>> + * 	This test does atomic operation in multi-gpu by executing
>> atomic
>> + *	operation on GPU1 and then atomic operation on GPU2 using
>> same
>> + *	adress
>>    */
>>   
>>   #define MAX_XE_REGIONS	8
>> @@ -40,6 +45,7 @@
>>   #define BIND_SYNC_VAL 0x686868
>>   #define EXEC_SYNC_VAL 0x676767
>>   #define COPY_SIZE SZ_64M
>> +#define	ATOMIC_OP_VAL	56
>>   
>>   struct xe_svm_gpu_info {
>>   	bool supports_faults;
>> @@ -49,6 +55,16 @@ struct xe_svm_gpu_info {
>>   	int fd;
>>   };
>>   
>> +struct test_exec_data {
>> +	uint32_t batch[32];
>> +	uint64_t pad;
>> +	uint64_t vm_sync;
>> +	uint64_t exec_sync;
>> +	uint32_t data;
>> +	uint32_t expected_data;
>> +	uint64_t batch_addr;
>> +};
>> +
>>   struct multigpu_ops_args {
>>   	bool prefetch_req;
>>   	bool op_mod;
>> @@ -72,7 +88,10 @@ static void gpu_mem_access_wrapper(struct
>> xe_svm_gpu_info *src,
>>   				   struct
>> drm_xe_engine_class_instance *eci,
>>   				   void *extra_args);
>>   
>> -static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
>> +static void gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
>> +				   struct xe_svm_gpu_info *dst,
>> +				   struct
>> drm_xe_engine_class_instance *eci,
>> +				   void *extra_args);
>>   
>>   static void
>>   create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct
>> drm_xe_engine_class_instance *eci,
>> @@ -166,6 +185,35 @@ static void for_each_gpu_pair(int num_gpus,
>> struct xe_svm_gpu_info *gpus,
>>   	}
>>   }
>>   
>> +static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
>> +
>> +static void
>> +atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
>> +		  uint32_t *bo, uint64_t *addr)
>> +{
>> +	uint32_t batch_bo_size = BATCH_SIZE(fd);
>> +	uint32_t batch_bo;
>> +	uint64_t batch_addr;
>> +	void *batch;
>> +	uint32_t *cmd;
>> +	int i = 0;
>> +
>> +	batch_bo = xe_bo_create(fd, vm, batch_bo_size,
>> vram_if_possible(fd, 0), 0);
>> +	batch = xe_bo_map(fd, batch_bo, batch_bo_size);
>> +	cmd = (uint32_t *)batch;
>> +
>> +	cmd[i++] = MI_ATOMIC | MI_ATOMIC_INC;
>> +	cmd[i++] = src_addr;
>> +	cmd[i++] = src_addr >> 32;
>> +	cmd[i++] = MI_BATCH_BUFFER_END;
>> +
>> +	batch_addr = to_user_pointer(batch);
>> +	/* Punch a gap in the SVM map where we map the batch_bo */
>> +	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr,
>> batch_bo_size, 0);
>> +	*bo = batch_bo;
>> +	*addr = batch_addr;
>> +}
>> +
>>   static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
>>   		       uint64_t dst_addr, uint64_t copy_size,
>>   		       uint32_t *bo, uint64_t *addr)
>> @@ -325,6 +373,105 @@ gpu_mem_access_wrapper(struct xe_svm_gpu_info
>> *src,
>>   	copy_src_dst(src, dst, eci, args->prefetch_req);
>>   }
>>   
>> +static void
>> +atomic_inc_op(struct xe_svm_gpu_info *gpu0,
>> +	      struct xe_svm_gpu_info *gpu1,
>> +	      struct drm_xe_engine_class_instance *eci,
>> +	      bool prefetch_req)
>> +{
>> +	uint64_t addr;
>> +	uint32_t vm[2];
>> +	uint32_t exec_queue[2];
>> +	uint32_t batch_bo;
>> +	struct test_exec_data *data;
>> +	uint64_t batch_addr;
>> +	struct drm_xe_sync sync = {};
>> +	volatile uint64_t *sync_addr;
>> +	volatile uint32_t *shared_val;
>> +
>> +	create_vm_and_queue(gpu0, eci, &vm[0], &exec_queue[0]);
>> +	create_vm_and_queue(gpu1, eci, &vm[1], &exec_queue[1]);
>> +
>> +	data = aligned_alloc(SZ_2M, SZ_4K);
>> +	igt_assert(data);
>> +	data[0].vm_sync = 0;
>> +	addr = to_user_pointer(data);
>> +
>> +	shared_val = (volatile uint32_t *)addr;
>> +	*shared_val = ATOMIC_OP_VAL - 1;
>> +
>> +	atomic_batch_init(gpu0->fd, vm[0], addr, &batch_bo,
>> &batch_addr);
>> +
>> +	/* Place destination in an optionally remote location to
>> test */
>> +	xe_multigpu_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
>> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>> +			    gpu0->fd, 0, gpu0->vram_regions[0],
>> exec_queue[0],
>> +			    0, 0);
>> +
>> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
>> +	xe_multigpu_prefetch(gpu0->fd, vm[0], addr, SZ_4K, &sync,
>> +			     sync_addr, exec_queue[0],
>> prefetch_req);
>> +
>> +	sync_addr = (void *)((char *)batch_addr + SZ_4K);
>> +	sync.addr = to_user_pointer((uint64_t *)sync_addr);
>> +	sync.timeline_value = EXEC_SYNC_VAL;
>> +	*sync_addr = 0;
>> +
>> +	/* Executing ATOMIC_INC on GPU0. */
>> +	xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
>> +	if (*sync_addr != EXEC_SYNC_VAL)
>> +		xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr,
>> EXEC_SYNC_VAL, exec_queue[0],
>> +			       NSEC_PER_SEC * 10);
>> +
>> +	igt_assert_eq(*shared_val, ATOMIC_OP_VAL);
>> +
>> +	atomic_batch_init(gpu1->fd, vm[1], addr, &batch_bo,
>> &batch_addr);
>> +
>> +	/* Place destination in an optionally remote location to
>> test */
> We're actually never using a remote location here? It's always advised
> to local.
will edit the explanation.
>
>> +	xe_multigpu_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
>> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>> +			    gpu1->fd, 0, gpu1->vram_regions[0],
>> exec_queue[0],
>> +			    0, 0);
>
>
>> +
>> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
>> +	xe_multigpu_prefetch(gpu1->fd, vm[1], addr, SZ_4K, &sync,
>> +			     sync_addr, exec_queue[1],
>> prefetch_req);
>> +
>> +	sync_addr = (void *)((char *)batch_addr + SZ_4K);
>> +	sync.addr = to_user_pointer((uint64_t *)sync_addr);
>> +	sync.timeline_value = EXEC_SYNC_VAL;
>> +	*sync_addr = 0;
>> +
>> +	/* Execute ATOMIC_INC on GPU1 */
>> +	xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr, &sync, 1);
> If gpu1 here doesn't support faults, we shouldn't execute this.
So this condition is applicable for all tests. if fault not supported 
xe_exec_sync(gpxx->fd,.....) shouldn't be called?
>
>
>> +	if (*sync_addr != EXEC_SYNC_VAL)
>> +		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr,
>> EXEC_SYNC_VAL, exec_queue[1],
>> +			       NSEC_PER_SEC * 10);
>> +
>> +	igt_assert_eq(*shared_val, ATOMIC_OP_VAL + 1);
>> +
>> +	munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
>> +	batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
>> +	batch_fini(gpu1->fd, vm[1], batch_bo, batch_addr);
>> +	free(data);
>> +
>> +	cleanup_vm_and_queue(gpu0, vm[0], exec_queue[0]);
>> +	cleanup_vm_and_queue(gpu1, vm[1], exec_queue[1]);
>> +}
>> +
>> +static void
>> +gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
>> +		       struct xe_svm_gpu_info *dst,
>> +		       struct drm_xe_engine_class_instance *eci,
>> +		       void *extra_args)
>> +{
>> +	struct multigpu_ops_args *args = (struct multigpu_ops_args
>> *)extra_args;
>> +	igt_assert(src);
>> +	igt_assert(dst);
>> +
>> +	atomic_inc_op(src, dst, eci, args->prefetch_req);
>> +}
>> +
>>   igt_main
>>   {
>>   	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
>> @@ -364,6 +511,14 @@ igt_main
>>   		for_each_gpu_pair(gpu_cnt, gpus, &eci,
>> gpu_mem_access_wrapper, &op_args);
>>   	}
>>   
>> +	igt_subtest("atomic-inc-gpu-op") {
>> +		struct multigpu_ops_args atomic_args;
>> +		atomic_args.prefetch_req = 1;
>> +		for_each_gpu_pair(gpu_cnt, gpus, &eci,
>> gpu_atomic_inc_wrapper, &atomic_args);
>> +		atomic_args.prefetch_req = 0;
>> +		for_each_gpu_pair(gpu_cnt, gpus, &eci,
>> gpu_atomic_inc_wrapper, &atomic_args);
> Same comment here as for the first test.
>
> /Thomas
>
>
>
>> +	}
>> +
>>   	igt_fixture {
>>   		int cnt;
>>   
