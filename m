Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F42CD8CA8
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 10:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E90510E252;
	Tue,  9 Jun 2026 10:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxUoCsOT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0999910E257
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 10:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781002518; x=1812538518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=j0WCvmBixU5L6irziVSTcq7SeRu62ITvOaZCpDAz3mw=;
 b=TxUoCsOTnmbCjEX8YMivxKcaZ+VeGcRZyhjy5XHbqtsX6AK6ooTVRxPI
 u6hYIAjhxkbgr6nQr7sPfziuNUmB0q1S3wNIoLd6UiXx/p7SIk7O6Z0Lw
 YeZwkXp2HyguQQmbQdQdFZXUuOAu/0blajWqFgp83qtL0xYcDO5omV2lq
 kwetzt+vX3S+M7JLc6AusCSdULT+gS5S63vA4ICrM0e5IsmdL4FwTOs4B
 ba8O3DP1q9XyQXncIRHO7lStTGnxmh3ZJhkx1CzQL/If9rPDV+87FLyvO
 V9rJvInUUI+V7OgsGyvyt/Iy3iDA3KEe1FUWes51ynswt4ibkK1haEbeY Q==;
X-CSE-ConnectionGUID: X7eGuuC7TxuxeWbpl6LCBg==
X-CSE-MsgGUID: /mCCADSYSw2Gt7bu2gpjqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81944664"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208,217";a="81944664"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 03:55:18 -0700
X-CSE-ConnectionGUID: gQ7HLdohTFKv55YKuF2IAA==
X-CSE-MsgGUID: 7zu+2P8XRFyJ4VwPgtRkbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
 d="scan'208,217";a="276017495"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 03:55:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 03:55:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 03:55:17 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 03:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+94R1R4Z5jO0ddBrc0f6zd6C3tVSiqmFnZdUYkBxugQfCUBaZXZljcrnpfjOJnREaulT9SsMqYUNFbOc0EVsN/xMlp4jpSQ90iiC6ZNWyMi9cJy3zCFjiRctM1E3aWATvS0kEa94l9MNNZm+fcIgc5F0SAgQRiqBFyjL6Da5pnGjsODnFgLNoi88ryvgFaCGDFelkDhc4rZ6i4UKSjwWxntRMRAwg7BUXFwnFat9iVReANGrnV90rWyGNsiWnV1KUlTwieVtqMEYMyGIVg/ENCmaYS74t72hnGjcgAwEbo+FAqk0/syGkt9kDXhbITS2a7oGXvtHoUXMWyQC4oAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=169JcMvYOFgCHxNeBNcNIKRIJiU7NdMM58BGDF1ESrc=;
 b=Tt4A8CQXjHAQL49duERpUtaLJsgAnUi9k9k4US8PRJpNXhxQvcC5nSAVp+a5xxY6Sip0MkRVv1evIQ+2LiTWzySJqmsRJetHKdkqPqHQK8XQxV58+Ic5eaJ7H6Zo/Jiq4xDQBSuD0VKqyPDk2z2+ax6oFotp1fFsu7xUYtADaCTz2z55Ic+VxnvMgSfxPrERQ871/UmleaNR6bniGdPaRn31WVpOOD5ltm4fS8ponO+8hLj9zUxB2Rqe9GsGb2xqhTNU5zPaptrQmnbDNkDku4W2VL79aasjcP9xmV6Dp7S+/2qdXI1VdD39oo+FUcd2Eq2TrhKP9SCzcvr/4JcG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by CYXPR11MB8689.namprd11.prod.outlook.com (2603:10b6:930:d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 10:55:02 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%7]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 10:55:02 +0000
Content-Type: multipart/alternative;
 boundary="------------F03JixEijGHGB08puxiXo9zO"
Message-ID: <a41c1b2b-3778-4063-a3e0-c1a61613b0d8@intel.com>
Date: Tue, 9 Jun 2026 16:24:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 5/7] tests/intel/kms_pm_dc: Add dc3co framedrop
 validation test
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>
References: <20260609034650.2281712-1-jeevan.b@intel.com>
 <20260609034650.2281712-6-jeevan.b@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260609034650.2281712-6-jeevan.b@intel.com>
X-ClientProxiedBy: MA5PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::8) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|CYXPR11MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: f26f269b-c131-4cc4-58ca-08dec6158e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006|8096899003|4143699003;
X-Microsoft-Antispam-Message-Info: +kPL6k6V7H7yBVVy2xEZOETe63EEfiVHQaKVvsKF1gEmx+BDVa/pDzXPnYbmMQp/P8C7iBTs8aCPWsrqnNKo6y2Mz2AJ0xfUT5muD79nJ6eTESkKXDR+4FTwLBNxYd2lwkFbPLEOzMMng63roS2h0Je7uYkk3xVvCoUvOOE8AariHusDeudmRyc5lY3LXavdrlMDodFSmLnlYIzJ7CUk0q587JljEBXhvmnFOEHS8glxWCpQEywivgJhaGzfYjCBH2CqR5uhkGKPKSFpOmNWNDGVFb/+OJSm4aAGyk8EeKtFXzokaelWtV81YugiGNIfqwntKNii9NXdUax6Fxhzh0m0BwTmqGS15Kdy8uzNGS1HWm6Gf4joNAc7dZRT9EdUnE87XgZl9q8l+iLZkvBkTNcn+XlBqptfTy0ETu1sdaDYrFPB7yLeFZ0I36ygivQv0FIY0FvpnPnJz/kMrSYQltCNHT9B9ZnIsLR4d1sxlFEyxj+f3riDAPMClIuh1zCWSLwxVFzcW7isUxyUXwh4t6cjfX+M3D9aOS/VvPfI00vc9y1NqIqQk2+gU/NKS4tidzgdz6nd7sgMUkQiWkZS2sqW0izA3CQfb5zeEOlbPuC4lGVvXBK1AeqwRUEGlpBgg/N+lhGO+i0jGtFV8eaxLLCQ+43dOSS6CPETtNdyYkwxhzlZQPjS9ZbjK0M2N0V3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(8096899003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1JjK1RvOHlzWkJZQVRTSlNPV05XVFlpUG4xeHpEQzdoaytVdXA3NVVFbXRX?=
 =?utf-8?B?OFh6bVBZRUJpOFZTUGhlNU40YWxHc1U5dU9zZUxhdVpkRXpEWmdMZFRGOVBk?=
 =?utf-8?B?dzl6anVrN0N2dlFqbzdJZG5jRGxCdUo0LzJ6aDFsVWRiUnZZR0ltOHJCbUlK?=
 =?utf-8?B?SHpGMWxCdmZSM2xRc1RseXNQYkRCcmpWTWxRK2sxVmw3a0hOcVBMeEc5eldt?=
 =?utf-8?B?MVBiYisrNzhjeDVDMXJTZTErb0RRSVc0ZGwyNHVLN1k2dnMrRHFMRmswWjdt?=
 =?utf-8?B?MlVtZFN3cC90M25RSGNqb1NWdUpUSkVOSVFiNk94OXNGdk5mTFVHU251Mzg0?=
 =?utf-8?B?NW5Eb3RxSG5DQ3BTSmI3b2p1ejRwM29VVlRWZjBkVFMvWDd5OTBoSXRjZ2RG?=
 =?utf-8?B?aHlrRGhPTXF4WFQ5akRNTVBQQ213Tk83bW1hNWo4NlJVODBNRGs2UWFERHlY?=
 =?utf-8?B?S2pZdlB2MTBOZ1JlVHQydE1LYVQ1L2RDd3hoY0RMcWVSQmROM0ZXOUo5cVNw?=
 =?utf-8?B?Kzh0dTV5TmxocnJvNjBIQUVKU1IzZDU0ZElEdHAvL3UrcTF3djZhOEFWTWJL?=
 =?utf-8?B?MllvenkzRVNpRnA1dEdpK0s3bzc0cWhDdlFmU1Y0MC91QTJXdk52cWdYMUgx?=
 =?utf-8?B?L05HMHNsRlhEUVkxdHdJc0dRWGE3YWxsY3Z6ZVJSQnRvZnc1R3BpU3kydWEw?=
 =?utf-8?B?WG9MQ2pTWnM4R1pieFRjZVVyV0xlRFZremdzS3o2bjRMZmNWZ0ZuUjNuZ3F2?=
 =?utf-8?B?dnhnK2F2QldlQlVleFJYZ2ZIUUg5bisxQ2xlSmhUdFlQODMyekRDbGdkdlNw?=
 =?utf-8?B?VHoyaWFKWTFMYjNGTW1LeGdWdy90WjNzWE5vZVMwYmczTklEMEhRMEtoVHJC?=
 =?utf-8?B?czQvT2FZb3Z6bjNRcmM5SXZiemU2M0tnQ0tJNE1yaGpvMEtmdVk2dmo2eCtD?=
 =?utf-8?B?ZWhiOGUxM0ZtcjBZRE0waWRUUkpNRmpINEJDa2VmT0FEcm9YSlZBRG43Zmhi?=
 =?utf-8?B?ZkJrSHJqb3lyUUJpWlFVSlFXVEJzU3BDMXVqK09Ib0JCT0lCRWhOTDlJYk5M?=
 =?utf-8?B?WmZKTnlyK2E1WFg2YUNwTS9PKzZ0RmxVdVArc1RyV0c4VzF0WUFOY0pQWWcy?=
 =?utf-8?B?TWdaa0Zyc1p3Z3JuVTN6UkdWTmU2QW4wWlZnaWxybjBjc2JrWWkwV0lSekU5?=
 =?utf-8?B?RFVlbXNUQVNNU3hyOHRlbjFxaTNlTU0rVzBtcHJoQ3RFck5vS2pTWnpNczVD?=
 =?utf-8?B?THNyWkRjZ1ZXcE9sWVZ4NEgyL3VRK3pYaFZERTVhTFkzbkdXcVNLbnFZaVk2?=
 =?utf-8?B?QTByOExHcW1rSEJ0QVVQYnJIc05FbGlRRk9YN280bGs4Qjhta3hBYXp6VjFX?=
 =?utf-8?B?OGUyblNhSmNOeHJ6aVFFeDFFKzJGUEhqSWdBMG9CZlAxdTJHOXM1WFFLOGtY?=
 =?utf-8?B?aTM5MGhWQ1dSK3RtaTB0dHVpSno2YTR2VXV3OTJwc1JuWVVuZkI3S0pnUTZj?=
 =?utf-8?B?NDl5azlPSCttT2dEallaaFF1ZlJFSVpXZVRWWi9iSmFPUVpsUGNza0c2SUNs?=
 =?utf-8?B?YkZONVpJb0c3ZHBYRFYzZzNHc0l2WGxTQTBTanh2SXFWblZiL1JScnB6TmpT?=
 =?utf-8?B?TzlWMXh0Y1pVTU5wbjBRN1dGNnVnckZlL0RwS0hsdzFBUVFpOThaS0Zhc0Ro?=
 =?utf-8?B?MFF3ZUVXNFZWZWN1SnVZb1UzL3BiblhTYzNOSlkvTElqakZCMjAvL0JUdGVT?=
 =?utf-8?B?bGduNjZPQ0E5ODMyWXBOTFFScVV6cU1kNGVUVk1pSCswSWhsRTlFVWtyNUZL?=
 =?utf-8?B?dWw3dXRBMjIxWWtCeHQ3Tkdud3M2Ti9VYXBFOWFwQ2FueEpVc0pKUzRveXMr?=
 =?utf-8?B?WmVtUzE4NU45SnFncDJIU0FMZkFpRnc0U1J6RzNZK2loYUN2TDR6eFFldnpk?=
 =?utf-8?B?QStoQktyeUNha1M0cUVocGtJWVZremdNODRNdVUyTHZXWVJKOHg3RkZuOGk5?=
 =?utf-8?B?N2Erd0Y5NC9jckNaMUxudkwyRE0zVWFhNkExSFhPWVdYNFM0UlFKdHVHMG9r?=
 =?utf-8?B?MTVsMWtBUVh4ZUJ5RXM1aHBPNkdxdWNyUExIVmEwMnppenBDOFFmYnRDcFk0?=
 =?utf-8?B?NldBa1JlMVVNTjZETWJzb2pEcXdoYXp0UUE5THpLdDMvVVNwNWhHYVFPUUJD?=
 =?utf-8?B?S1hBUHRzZUJrL3YyVUVTV2NmekRndUlnM3JTYVNHVDl1ekovc1ppdjMwclVP?=
 =?utf-8?B?bFdBQStDYkxaU3MyU2F1blZxc3NJRDYvZkh6c2lsWlFjVENmclBRR1lCb1dB?=
 =?utf-8?B?L2FpNkVwdGcxYUxLSWpVaHlCZ3hhekNpdldSc1ZLdnQrYzNLNkV4VkNaQlYx?=
 =?utf-8?Q?njuBToEsZsfp+pSs=3D?=
X-Exchange-RoutingPolicyChecked: aWcaViWIdvl97sCGQynIq2ggnWTJi2oN+5U+Y3PVZzqgjkii6WEM0SqrrBesHSNSX1V/EbuJEECGxd30fw11sUS4z8XgDrSqJIVYwkE4jnJ5Bv/j+kXUe67lQm0Sx/DElLZXSwqR48c893dU7MomujwxGhM+zuufdwKaj/Cdw21VsQsU3Pqz+9gpOqGujG/xVzRczwqeVXKFdVID0gkBAlAimLNq4E1Q13GseuQzvUpgql0cROlN2rpBQzoPeQ3gA5ZJ6uOlTXx7wvih5p8gLg2ICB6+2PuvQa6UIFok+NGvYgF+nl6q1xMscvKR+d3bnNKcsWRsa2mdKnes/KgyZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f26f269b-c131-4cc4-58ca-08dec6158e40
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:55:02.0183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzAYH05/totDp6zs18PU+KQrieHzPrzVYBT8DKkYTpVOPbT3T88jOgaTQaITfLtUiaQu0FQk4HszDd7oBnr0yXJ4WHi/d5ldAFf/0duOfBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8689
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

--------------F03JixEijGHGB08puxiXo9zO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 09-06-2026 09:16 am, Jeevan B wrote:
> Add a subtest to verify that DC3CO entry does not introduce frame
> drops. The test alternates commits and waits for a kernel vblank
> after each commit, ensuring the vblank sequence continues to
> advance without stalls or dropped frames. Also verify that the
> DC3CO counter increments, confirming that DC3CO is entered
> successfully during the test.
>
> v2: Replaced hardcoded DC3CO framedrop values with named global constants.
>      Relaxed vblank validation to allow a 1–2 frame gap, and made DC3CO
>      counter reads conditional after the target flip threshold.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>

LGTM:

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> ---
>   tests/intel/kms_pm_dc.c | 118 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 118 insertions(+)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 57dade47d..48b2e87a3 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -51,6 +51,10 @@
>    * Description: Make sure that system enters DC3CO when PSR2 or PR is active and
>    *              system is in SLEEP state
>    *
> + * SUBTEST: dc3co-framedrop-check
> + * Description: Verify that DC3CO entry does not cause frame drops and successfully
> + *              enters the power state
> + *
>    * SUBTEST: dc5-dpms
>    * Description: Validate display engine entry to DC5 state while all connectors's
>    *              DPMS property set to OFF
> @@ -86,6 +90,10 @@
>   #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || intel_display_ver(devid) >= 14))
>   #define SEC 1
>   #define MSEC (SEC * 1000)
> +#define DC3CO_FRAME_DELAY_FACTOR 1.5
> +#define DC3CO_TARGET_FLIPS 200
> +#define DC3CO_VERIFY_COMMITS 300
> +#define DC3CO_MAX_VBLANK_GAP 2
>   
>   IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
>   
> @@ -342,6 +350,86 @@ static void test_dc3co_vpb_simulation(data_t *data)
>   	cleanup_dc3co_fbs(data);
>   }
>   
> +static uint32_t wait_for_next_vblank_seq(data_t *data)
> +{
> +	drmVBlank wait = {};
> +	igt_crtc_t *crtc = data->output->pending_crtc;
> +
> +	igt_assert_f(crtc, "No CRTC bound to output for vblank wait\n");
> +
> +	wait.request.type = kmstest_get_vbl_flag(crtc->crtc_index) |
> +						 DRM_VBLANK_RELATIVE |
> +						 DRM_VBLANK_NEXTONMISS;
> +	wait.request.sequence = 1;
> +	igt_assert_eq(drmWaitVBlank(data->drm_fd, &wait), 0);
> +
> +	return wait.reply.sequence;
> +}
> +
> +static void detect_dc3co_framedrop(data_t *data)
> +{
> +	igt_plane_t *primary;
> +	uint32_t dc3co_prev_cnt;
> +	uint32_t dc3co_cur_cnt;
> +	uint32_t prev_vblank_seq = 0;
> +	uint32_t vblank_seq;
> +	uint32_t vblank_gap;
> +	int delay;
> +	int committed = 0;
> +	bool dc3co_after_target = false;
> +	bool front = false;
> +
> +	igt_require_f(data->mode->vrefresh != 0, "Invalid vrefresh rate of 0\n");
> +
> +	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_display_commit(&data->display);
> +
> +	dc3co_prev_cnt = igt_read_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +
> +	delay = (int)(DC3CO_FRAME_DELAY_FACTOR * (1000000 / data->mode->vrefresh));
> +
> +	while (committed < DC3CO_VERIFY_COMMITS) {
> +		front = !front;
> +		igt_plane_set_fb(primary, front ? &data->fb_rgr : &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +
> +		vblank_seq = wait_for_next_vblank_seq(data);
> +		if (prev_vblank_seq) {
> +			vblank_gap = vblank_seq - prev_vblank_seq;
> +			igt_assert_f(igt_vblank_after(vblank_seq, prev_vblank_seq) &&
> +				     vblank_gap <= DC3CO_MAX_VBLANK_GAP,
> +				     "Unexpected vblank gap %u after commit %d (prev=%u, cur=%u)\n",
> +				     vblank_gap, committed + 1, prev_vblank_seq, vblank_seq);
> +		}
> +		prev_vblank_seq = vblank_seq;
> +		committed++;
> +		usleep(delay);
> +
> +		if (committed >= DC3CO_TARGET_FLIPS) {
> +			dc3co_cur_cnt = igt_read_dc_counter(data->debugfs_fd,
> +						    IGT_INTEL_CHECK_DC3CO);
> +			if (dc3co_cur_cnt > dc3co_prev_cnt)
> +				dc3co_after_target = true;
> +		}
> +	}
> +
> +	igt_assert_eq(committed, DC3CO_VERIFY_COMMITS);
> +	igt_assert_f(dc3co_after_target,
> +		     "DC3CO did not increment after %d flips while validating %d commits\n",
> +		     DC3CO_TARGET_FLIPS, DC3CO_VERIFY_COMMITS);
> +}
> +
> +static void test_dc3co_framedrop(data_t *data)
> +{
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +	setup_output(data);
> +	setup_dc3co(data);
> +	setup_videoplayback(data);
> +	detect_dc3co_framedrop(data);
> +	cleanup_dc3co_fbs(data);
> +}
> +
>   static void test_dc5_retention_flops(data_t *data, int dc_flag)
>   {
>   	uint32_t dc_counter_before_psr;
> @@ -693,6 +781,36 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Validate that no frame drops occur during DC3CO entry "
> +			     "while alternating framebuffers with PSR2 or Panel Replay active");
> +	igt_subtest_with_dynamic("dc3co-framedrop-check") {
> +		static const struct dc3co_test_mode dc3co_modes[] = {
> +			{ PSR_MODE_2, "psr2" },
> +			{ PR_MODE,    "pr"   },
> +		};
> +
> +		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> +			const char *name = dc3co_modes[i].name;
> +			data.op_psr_mode = dc3co_modes[i].mode;
> +
> +			igt_dynamic_f("%s", name) {
> +				igt_require(psr_sink_support(data.drm_fd,
> +						     data.debugfs_fd,
> +						     data.op_psr_mode, NULL));
> +
> +				if (data.op_psr_mode == PSR_MODE_2)
> +					igt_require_f(IS_TIGERLAKE(data.devid) ||
> +						      intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with PSR2\n");
> +				else
> +					igt_require_f(intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with Panel Replay\n");
> +
> +				test_dc3co_framedrop(&data);
> +			}
> +		}
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while PSR is active");
>   	igt_subtest("dc5-psr") {
--------------F03JixEijGHGB08puxiXo9zO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-06-2026 09:16 am, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260609034650.2281712-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">Add a subtest to verify that DC3CO entry does not introduce frame
drops. The test alternates commits and waits for a kernel vblank
after each commit, ensuring the vblank sequence continues to
advance without stalls or dropped frames. Also verify that the
DC3CO counter increments, confirming that DC3CO is entered
successfully during the test.

v2: Replaced hardcoded DC3CO framedrop values with named global constants.
    Relaxed vblank validation to allow a 1–2 frame gap, and made DC3CO
    counter reads conditional after the target flip threshold.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a></pre>
    </blockquote>
    <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ascii-font-family:Aptos;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Aptos;
	mso-hansi-theme-font:minor-latin;
	mso-font-kerning:1.0pt;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
</style>
<![endif]-->
    <p class="MsoPlainText">LGTM:</p>
    <p class="MsoPlainText">Reviewed-by: Mohammed Thasleem &lt;<a href="mailto:mohammed.thasleem@intel.com" class="moz-txt-link-freetext">mohammed.thasleem@intel.com</a>&gt;</p>
    <blockquote type="cite" cite="mid:20260609034650.2281712-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 tests/intel/kms_pm_dc.c | 118 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 57dade47d..48b2e87a3 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -51,6 +51,10 @@
  * Description: Make sure that system enters DC3CO when PSR2 or PR is active and
  *              system is in SLEEP state
  *
+ * SUBTEST: dc3co-framedrop-check
+ * Description: Verify that DC3CO entry does not cause frame drops and successfully
+ *              enters the power state
+ *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
@@ -86,6 +90,10 @@
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || intel_display_ver(devid) &gt;= 14))
 #define SEC 1
 #define MSEC (SEC * 1000)
+#define DC3CO_FRAME_DELAY_FACTOR 1.5
+#define DC3CO_TARGET_FLIPS 200
+#define DC3CO_VERIFY_COMMITS 300
+#define DC3CO_MAX_VBLANK_GAP 2
 
 IGT_TEST_DESCRIPTION(&quot;Tests to validate display power DC states.&quot;);
 
@@ -342,6 +350,86 @@ static void test_dc3co_vpb_simulation(data_t *data)
 	cleanup_dc3co_fbs(data);
 }
 
+static uint32_t wait_for_next_vblank_seq(data_t *data)
+{
+	drmVBlank wait = {};
+	igt_crtc_t *crtc = data-&gt;output-&gt;pending_crtc;
+
+	igt_assert_f(crtc, &quot;No CRTC bound to output for vblank wait\n&quot;);
+
+	wait.request.type = kmstest_get_vbl_flag(crtc-&gt;crtc_index) |
+						 DRM_VBLANK_RELATIVE |
+						 DRM_VBLANK_NEXTONMISS;
+	wait.request.sequence = 1;
+	igt_assert_eq(drmWaitVBlank(data-&gt;drm_fd, &amp;wait), 0);
+
+	return wait.reply.sequence;
+}
+
+static void detect_dc3co_framedrop(data_t *data)
+{
+	igt_plane_t *primary;
+	uint32_t dc3co_prev_cnt;
+	uint32_t dc3co_cur_cnt;
+	uint32_t prev_vblank_seq = 0;
+	uint32_t vblank_seq;
+	uint32_t vblank_gap;
+	int delay;
+	int committed = 0;
+	bool dc3co_after_target = false;
+	bool front = false;
+
+	igt_require_f(data-&gt;mode-&gt;vrefresh != 0, &quot;Invalid vrefresh rate of 0\n&quot;);
+
+	primary = igt_output_get_plane_type(data-&gt;output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit(&amp;data-&gt;display);
+
+	dc3co_prev_cnt = igt_read_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+
+	delay = (int)(DC3CO_FRAME_DELAY_FACTOR * (1000000 / data-&gt;mode-&gt;vrefresh));
+
+	while (committed &lt; DC3CO_VERIFY_COMMITS) {
+		front = !front;
+		igt_plane_set_fb(primary, front ? &amp;data-&gt;fb_rgr : &amp;data-&gt;fb_rgb);
+		igt_display_commit(&amp;data-&gt;display);
+
+		vblank_seq = wait_for_next_vblank_seq(data);
+		if (prev_vblank_seq) {
+			vblank_gap = vblank_seq - prev_vblank_seq;
+			igt_assert_f(igt_vblank_after(vblank_seq, prev_vblank_seq) &amp;&amp;
+				     vblank_gap &lt;= DC3CO_MAX_VBLANK_GAP,
+				     &quot;Unexpected vblank gap %u after commit %d (prev=%u, cur=%u)\n&quot;,
+				     vblank_gap, committed + 1, prev_vblank_seq, vblank_seq);
+		}
+		prev_vblank_seq = vblank_seq;
+		committed++;
+		usleep(delay);
+
+		if (committed &gt;= DC3CO_TARGET_FLIPS) {
+			dc3co_cur_cnt = igt_read_dc_counter(data-&gt;debugfs_fd,
+						    IGT_INTEL_CHECK_DC3CO);
+			if (dc3co_cur_cnt &gt; dc3co_prev_cnt)
+				dc3co_after_target = true;
+		}
+	}
+
+	igt_assert_eq(committed, DC3CO_VERIFY_COMMITS);
+	igt_assert_f(dc3co_after_target,
+		     &quot;DC3CO did not increment after %d flips while validating %d commits\n&quot;,
+		     DC3CO_TARGET_FLIPS, DC3CO_VERIFY_COMMITS);
+}
+
+static void test_dc3co_framedrop(data_t *data)
+{
+	igt_require_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	setup_output(data);
+	setup_dc3co(data);
+	setup_videoplayback(data);
+	detect_dc3co_framedrop(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_dc5_retention_flops(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -693,6 +781,36 @@ int igt_main()
 		}
 	}
 
+	igt_describe(&quot;Validate that no frame drops occur during DC3CO entry &quot;
+			     &quot;while alternating framebuffers with PSR2 or Panel Replay active&quot;);
+	igt_subtest_with_dynamic(&quot;dc3co-framedrop-check&quot;) {
+		static const struct dc3co_test_mode dc3co_modes[] = {
+			{ PSR_MODE_2, &quot;psr2&quot; },
+			{ PR_MODE,    &quot;pr&quot;   },
+		};
+
+		for (int i = 0; i &lt; ARRAY_SIZE(dc3co_modes); i++) {
+			const char *name = dc3co_modes[i].name;
+			data.op_psr_mode = dc3co_modes[i].mode;
+
+			igt_dynamic_f(&quot;%s&quot;, name) {
+				igt_require(psr_sink_support(data.drm_fd,
+						     data.debugfs_fd,
+						     data.op_psr_mode, NULL));
+
+				if (data.op_psr_mode == PSR_MODE_2)
+					igt_require_f(IS_TIGERLAKE(data.devid) ||
+						      intel_display_ver(data.devid) &gt;= 35,
+						      &quot;Platform does not support DC3CO with PSR2\n&quot;);
+				else
+					igt_require_f(intel_display_ver(data.devid) &gt;= 35,
+						      &quot;Platform does not support DC3CO with Panel Replay\n&quot;);
+
+				test_dc3co_framedrop(&amp;data);
+			}
+		}
+	}
+
 	igt_describe(&quot;This test validates display engine entry to DC5 state &quot;
 		     &quot;while PSR is active&quot;);
 	igt_subtest(&quot;dc5-psr&quot;) {
</pre>
    </blockquote>
  </body>
</html>

--------------F03JixEijGHGB08puxiXo9zO--
