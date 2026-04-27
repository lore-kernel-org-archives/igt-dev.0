Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1317BFF8861
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 08:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A652A10E28C;
	Mon, 27 Apr 2026 08:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcTr7Cmt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D53310E28C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777280048; x=1808816048;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WNDPLFNZtxmEm/k8lQgwTCVxlhGLgcdmj/NF3LS3XYM=;
 b=PcTr7CmtDFbxc4+8pweE3vSniZ0q5B7qDlTmengihlxSf+YqTwPun39o
 1ad5QSv68BfKhOVTMVdciVs1tNiEORvl+o6/XRJd3cxaOWOCRRoYH64mm
 U0JVYn71PS4OsTkhRKjqPstROwtHb4tC4bb/4Z6Umqc6WmTCwB0+tcjO0
 D5Ulcfny6w6niQifvPuGD19HJYaI2onp7CFa7enkJWosFMTo/+aedyh1F
 Z/QLYCj9KxbFPKiqpZuwdCwWElY4gWHFOTB/8V6K1JAv8YSlgJGXM0Qh8
 J+RNludySUBxhr72W2beAY3XJxtkFVhoFXmxqSZBI7T2wjmrEAHe4oQgV w==;
X-CSE-ConnectionGUID: oZkscGl2SfaZDp3l7P/Drg==
X-CSE-MsgGUID: tZPTF7pZTFKxonYKHpRkfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="100817319"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="100817319"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 01:54:07 -0700
X-CSE-ConnectionGUID: ty7jpswpTq+6QdjCgKmLtg==
X-CSE-MsgGUID: 3EiDhG62ReioNSC82cPJwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="238571077"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 01:54:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 01:54:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 01:54:06 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 01:54:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD8Tn5Pbr9+IGg4sXViWYkNtx2118Nwoqgh2tXjfZLYMq4fB+D7hl9UhCqLal8RYccxv6fKI9Klp2mmOYJYWfLHz3YGHoWfYDDSffYB+HjfNvU5SlUKyzHKJhXg9uqfr3UBqpNZD0+OWJYUMtXPOEGBE7VL3qu8ao8gKurqTnIRu7AEAQClS3kUAJvIqIPEREc+Iz6uUaNxzBkH1kuRibXaPhVZ8At0S/mw8Zh6I42YrDU1HfkgDbvTuQNHk4CquxmpTv9R5oEuAwG7Zv+MXE5A+cVo2rHrdFs3oIyLEsRzXRJHTNtbmd5ZZSV0DVeuC4+jJrisM+fKrwLHMXoLU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JrQjKRriQCuYdTw4OtUIyklyyceug06l4pTMmyHqF8=;
 b=F+/1HhHhgUzZyiJzD+WXS3MpzhSpfXtrGB/ZNvlVNfIZpObpe/mrvySPQ5uje3Fuq6QkVZNAuFqvWPEa3UNcvg1moVPQ3FwPPy4RY51VfH0NQ0NhK/79VKpqh063YLXSx4vunCNYGAtZX2tZHK5ffEWwBMJTwiIcLKOFUCc+Z4mPxoSZduGELq/4D7UZU+znZJyiUUnL/V/YHGi+xb6bKC8UICJ1mDFxcvlHqK8Xu9qf4o72Bd2RO9NGPjq21Y8xXjtvdxvpgU8U1pmStxzKLgw92ERcvb3FCiSKSY3tjN+JErPhUnP03wA7iaM06RwegcPXRVQL89iJgVzuqWdzOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 08:54:01 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 08:54:01 +0000
Message-ID: <1dd16be4-0e4b-4241-a373-957684b60300@intel.com>
Date: Mon, 27 Apr 2026 14:23:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_fault_injection: Add fault-injection tests
 for CRI Freq Throttle Reasons
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Tauro Riana <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>
References: <20260316062903.2070445-1-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260316062903.2070445-1-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::12) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DS7PR11MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4894ac-c0ac-41a6-3698-08dea43a86d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: yMQFXnPNF7d2TXC4cwkKp1d9rhnTg/if6SGf5EiofveWV3fc2S6Znk2RqUfFmHOHyaNgv/DPFHavPM+jDjDNtgq7jmZZxNOCfr8GuMgVAutjACx6RLKodM/DALQaSO702JFQWMsksKBJK1zLK5u+cBIAuV/JRT5wd3y1JXzjvpayDwWo7+tVRDJorSjuWq8wMishF0759fyZnJ5wKHKSbDIdwi9gF0n5jL7W4VpkxfvQLMhSZnPrnhbhySM3pNhW4QChJPpQrdjc+h68OVF7l3Zgnq8kj4TKLUkohSfHgbZLBei5FM3EkM3xffhqGAW5eI7AqihLk3+Wm5m+xPfSJLB7+ROxpT6jYdys4RgiTjR6Rn3y709kt1ghHvC6MGQz0EDVY1+nPd6NmiOnSeOvoLdCmaVNk44OhKsYpZXDqNzoF7ocSvG4P/qBNt19CdPs55oyJDgQ/hs/dtRD1WRq8nWIARp2PSpYsEZqzpg6g38UpXdh30Rsub5gzNeTMsMr0/FSxlkgz2/gWIPmXnW9HPtB5Rpj31Jx/0mR2fG6rgZSZZFHJ/2irQviIyeD/OvdbePkfqTP/DF5Yv8BTFz8kPlxcm11nxBZxfmkHcO5skoULRg3ovhPCHTSD13GmJLegZ4b2QbK+brMqG+O2y2bozJ0I7G7plY2v+NrSCaVrd25Ou3EtEwbxASdvh1eMi7R13vyz5q3l0nif5qSYeg9Ln9/rY9V50x6FGSPfcgr+ok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTdpTjU5cXd2UG9ZYXh3TldJQnNrV3ZTZ1l3eXNZa29wSHVRd21RUnAwTFN1?=
 =?utf-8?B?b3lvMHBsTzMrU3VkdVVDQ3FVT0QrbkFWZkRTTkpHVURIRFRFREJuUlI5SDgr?=
 =?utf-8?B?R1dxaGg1bzB6S1NpbmEyT1VicWFOLzBjdVUxekpiWVc4YkkxSXJ3OW9aMVdy?=
 =?utf-8?B?ekwyYWZWN1ptTDZWd3Y1SldyZjE3djU3b1NxM0JLUSswM2lFem5CRFl6Lzg1?=
 =?utf-8?B?VkRpRmVOQzNDZGRiK0VTdTJwK1pRaElPWCtTTlNwYTlzQjU3YjBlbGxuejB1?=
 =?utf-8?B?TVJUZ1VUdkhXWHZ3SFk4aDA0NXY3UDNEZ0d1amphVXpTK0hQaHdKaVc4VnB0?=
 =?utf-8?B?ZnJQUWxTZ3locTFreVBMSkNjN01aMWdsbmViejhWVWtQKzIrYkVZdXo0SDNo?=
 =?utf-8?B?SEV0RitaM0FURDRIYTZRMS80bGk1bDk2T3pYZEdnK2ZnRGlpSUJDT25kMW11?=
 =?utf-8?B?RTRHNGRBcnRpczIvWXlvR3pmb05iOVhHSE0vcjZ0cldMK2NUdEJqc000Wnhr?=
 =?utf-8?B?SXRIZkhjZTB6U1FNWjhhMllFYmxBMUZCMmpmL0RQeGNtT1cyU2lUZ1orYzJI?=
 =?utf-8?B?MmdtU28zTHU4YzdISGtjMEZPRzExSmdqcHIrQ2lpZHV1OTlVa3dwU2dLanYz?=
 =?utf-8?B?cFFFRWx1NEJrbjRRMGFvVnRXSlZkNnRETnhVL2toVkU0TkY1Q2xpOEVwUmFq?=
 =?utf-8?B?eGIrM21ZbDZkS2g5TlRuUHhjT1lhUUVwUDcwNGhOYUtGQ0o4YThZNGlDNkhZ?=
 =?utf-8?B?WVA2dkt5aUMzOTFaUkk5NzdhUEdBU0lhb2dzVmxDWVZ1L040ZUI0a1JLUUxl?=
 =?utf-8?B?U0t2RWpyNktMVHozNVpsOHU5UzQ5bWZ3Q2pRUGI3QjZDU2lyQVQwa2ttMUVZ?=
 =?utf-8?B?UnhQZ0h5RENRYUNJM2thS3JKU3BIb2tZUTJYaS9mRDlUVkFBTmVwTC9rMHZJ?=
 =?utf-8?B?UlovUC8yeVQ5cWR2aWpVbkFCMzZCcExKVlJmcnJ1NGJkUFNvT0YrZW5qNG5E?=
 =?utf-8?B?aDljbjRxRiszdkpVOEI5MDVvLzJpK1g1aUJWcTE5VFlyNWpJVi9ydWg0N3lq?=
 =?utf-8?B?NjlGbWVjdUVYTHBzOHRsUWFFY2tQU2Y1SU16aURON05HK1BWUzJIMjBBVTdN?=
 =?utf-8?B?YzRoU0hFRDhHODNDQ2ZrMHVSVWJMZHNvODZPMW1MMlp6UFlqWnpHKzUxY1NX?=
 =?utf-8?B?VjU1Q21xUHhvbWloQXE2R1RVS0R5dFRoZVFDd3M2KzV3TURTTFF0MFBDcmg2?=
 =?utf-8?B?dTNUclR5eEkrbnN3Y0xQd1ZKSUNMclpZSURPNHQvWVFWc1FzVytZZncyaTZw?=
 =?utf-8?B?cy9ZRDFlbktQd3BPYnNzQUlCTmo2U2dzbzBXSGZYTVg5WDc3MC80dXRFTGVL?=
 =?utf-8?B?RCt2SlF2OTVralRKVHBFSmFtT1hYbnNQdUJWbDFYNFNqMWtCdFB2cXl0Snpr?=
 =?utf-8?B?MGFkTzJlK0dlYm0yWHBaUmIvQ1k0YS9saFZrSHRvdkVBZHBjQnNkdWF6N3Y2?=
 =?utf-8?B?TTJiWTV4SEVqVUdFVEY2UUhLdHBmT2FBc3pjNlQrUGtZdWo0TmZwdVBGOUd4?=
 =?utf-8?B?Y0RGaDA3Zjh4ajF2WXNmZjZ2RW85NTlZNlZKMEhwL0MrNXdlM1lVNVc5Z3hD?=
 =?utf-8?B?OFVkK2ZmckFJclZxelBYM1ZUUVVGUGplMng2YVVhU0svT3hkRmtZY0VCRVUz?=
 =?utf-8?B?cTBhQWF1bWlBb1NIVWFCNyt0NlZFSkVlV2E0a2VQNytyNGd1SkNGMkROYUNt?=
 =?utf-8?B?dTVVUUtra2s2ZDE3UjFNVkhUNXhOeWJSMFN1RTFGdUVyd1hYeTgvYzVpT25Z?=
 =?utf-8?B?Z0tPWTM3Y0ZlWHkyemFTQzFqcW9US2tkVlNZa0NjaTVSOWlVR1lMbC9LOHdu?=
 =?utf-8?B?N2JXeGFLSjlNQXhQOVRXSnVpcTM5dVZWeUJneVEwNXdRVEpsQmV4ajE3clBB?=
 =?utf-8?B?bXIxVUJEeHFodHZXWGFpZ1cvcjh0eFlVR1FrQUppSnFKTkNjVXdFaS9IS3d4?=
 =?utf-8?B?VUxrMUpyRHNEZmtrZExUOGN2cnNJcDcwZ0VwcU95Q3Y0RHY3cVE1OGl3N0tN?=
 =?utf-8?B?R2l3VEZUaGd1bERjNzZVc3RIRFJHeE96aXpjRTBLSDBiT3lvdTFFTU1ZekFT?=
 =?utf-8?B?anRFYmhueEtKMytRa1pwcExKQVFjbE1VZ1dNTGYyUjg0K0lDakl4RDZJNFBX?=
 =?utf-8?B?Q1ZzYkwzWEZ4RjR0WFdOWmx4US9Sek5NMmFzM1FoY0NuNzhCU29XQXlaSDJB?=
 =?utf-8?B?eVlYT0VXR2pLQVZiT0l4dnBoN0gvcmljUjdLTHRwazZESVQwTVVaQTA2aHAv?=
 =?utf-8?B?WFhnb3c2ZVMvNnk3QVcxWmsvc1ZOVnJOQ1JQTVI4dUtrWkU0bTBnUT09?=
X-Exchange-RoutingPolicyChecked: llrFR17hU3YPbsUkExNz84A1gUtNvxb89ahs0DANfPZyQEeiu1lyzjf8/VM2p0TvnghWSD4PXg6OMPYJiAdWr9q5eWGz+dYfjCstm8PqCjwxbyqqG7zNAsr2IRUZ/QX/vsUapDfs5TMCj+QN2XTI8A+HtJeseKTXgdC/svXjfR1FoqZGx5hkYlq9QgLSA0WUZCO03U3eKrSQrn9xDOx/35WfHR09w9krRsO6Q0y1HPyNvMCcxJgumsLMk0YkXl9PrezSYLm0U+bSfINJeKkb04Bd46f4XQ5ERRp/UuzBP5rFH5i4SywkRyOzxHAYbRICVu0FBIxEwZQdV3HXfz79iQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4894ac-c0ac-41a6-3698-08dea43a86d6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:54:01.4158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1g5r1wMkb8wP1OeAMcopiCR6yeIfu5N17Hnk/LC+yOgBjqOIp9WbCvsrW4Suz1cTm+VNPwgbeXHej3dWNdAcdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
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

Hi Ravi

On 16-03-2026 11:59 am, Ravi Kishore Koppuravuri wrote:
> Add IGT test to verify CRI frequency throttling reason reporting with
> the help of kernel's fault-injection framework. This test validates the
> robustness of the throttle reason detection under various failure
> scenarios by injecting faults into xe_gt_throttle_get_limit_reasons()
> function. This test covers all the supported throttling reason types.
>
> Dependencies:
> 	- Requires xe kernel patch from PR-1876
> 	- Kernel fault injection support (CONFIG_FAIL_FUNCTION=y)
>
> This test is verified on BMG platform and below are the results
>
> ---
> Test Execution
>
> $ ./build/tests/xe_fault_injection --run-subtest 'throttle*'
> IGT-Version: 2.3-g06706ff21 (x86_64) (Linux: 7.0.0-rc2-throttle-reason-injection-test x86_64)
> Using IGT_SRANDOM=1773144939 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: throttle-reason-fail-soc_thermal
> Injecting error (-1) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : thermal
> Subtest throttle-reason-fail-soc_thermal: SUCCESS (0.022s)
> Starting subtest: throttle-reason-fail-mem_thermal
> Injecting error (-2) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-mem_thermal: SUCCESS (0.023s)
> Starting subtest: throttle-reason-fail-vr_thermal
> Injecting error (-3) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-vr_thermal: SUCCESS (0.031s)
> Starting subtest: throttle-reason-fail-iccmax
> Injecting error (-4) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-iccmax: SUCCESS (0.034s)
> Starting subtest: throttle-reason-fail-ratl
> Injecting error (-5) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : ratl
> Subtest throttle-reason-fail-ratl: SUCCESS (0.042s)
> Starting subtest: throttle-reason-fail-soc_avg_thermal
> Injecting error (-6) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : vr_thermalert
> Subtest throttle-reason-fail-soc_avg_thermal: SUCCESS (0.042s)
> Starting subtest: throttle-reason-fail-fastvmode
> Injecting error (-7) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : vr_tdc
> Subtest throttle-reason-fail-fastvmode: SUCCESS (0.030s)
> Starting subtest: throttle-reason-fail-pl4_limit
> Injecting error (-8) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : pl4
> Subtest throttle-reason-fail-pl4_limit: SUCCESS (0.030s)
> Starting subtest: throttle-reason-fail-max_vid
> Injecting error (-9) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-max_vid: SUCCESS (0.018s)
> Starting subtest: throttle-reason-fail-pkg_pl1
> Injecting error (-10) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : pl1
> Subtest throttle-reason-fail-pkg_pl1: SUCCESS (0.033s)
> Starting subtest: throttle-reason-fail-pkg_pl2
> Injecting error (-11) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : pl2
> Subtest throttle-reason-fail-pkg_pl2: SUCCESS (0.031s)
> Starting subtest: throttle-reason-fail-psys_pl1
> Injecting error (-12) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-psys_pl1: SUCCESS (0.022s)
> Starting subtest: throttle-reason-fail-psys_pl2
> Injecting error (-13) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-psys_pl2: SUCCESS (0.035s)
> Starting subtest: throttle-reason-fail-p0_freq
> Injecting error (-14) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-p0_freq: SUCCESS (0.030s)
> Starting subtest: throttle-reason-fail-psys_crit
> Injecting error (-15) in function "xe_gt_throttle_inject_errno"
> Reason for Throttling is : none
> Subtest throttle-reason-fail-psys_crit: SUCCESS (0.034s)
> ---
> ---
>
> Cc: Sk Anirban <sk.anirban@intel.com>
> Cc: Tauro Riana <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 172 +++++++++++++++++++++++++++++++
>   1 file changed, 172 insertions(+)
>
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 4f4a7922c..05f5125cf 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -234,6 +234,66 @@ static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
>   	}
>   }
>   
> +static char *prepare_reasons_path(int fd)
> +{
> +	char sysfs_path[PATH_MAX];
> +	char device_link[PATH_MAX];
> +	char pcie_path[PATH_MAX];
> +	char reasons_path[PATH_MAX];
> +	int ret;
> +
> +	igt_assert(igt_sysfs_path(fd, sysfs_path, sizeof(sysfs_path)));
> +
> +	ret = snprintf(device_link, sizeof(device_link), "%s/device", sysfs_path);
> +	igt_assert(ret > 0 && ret < sizeof(device_link));
> +	igt_assert(realpath(device_link, pcie_path));
> +
> +	ret = snprintf(reasons_path, sizeof(reasons_path),
> +		       "%s/tile0/gt0/freq0/throttle/reasons", pcie_path);
> +	igt_assert(ret > 0 && ret < sizeof(reasons_path));
> +
> +	return strdup(reasons_path);
> +}
> +
> +static char *read_throttle_reasons_from_sysfs(int fd)
> +{
> +	char *reasons_path = NULL;
> +	char *reasons = NULL;
> +	int ret = -1;
> +	int reason_fd = -1;
> +
> +	reasons_path = prepare_reasons_path(fd);
> +	if (!reasons_path)
> +		return NULL;
> +
> +	reason_fd = open(reasons_path, O_RDONLY);
> +	if (reason_fd < 0) {
> +		free(reasons_path);
> +		return NULL;
> +	}
> +
> +	free(reasons_path);
> +	reasons = calloc(1, 256);
> +	if (!reasons)
> +		goto err;
> +
> +	ret = read(reason_fd, reasons, 255);
> +	if (ret < 0)
> +		goto err;
> +
> +	reasons[ret] = '\0';
> +
> +	close(reason_fd);
> +	return reasons;
> +
> +err:
> +	if (reason_fd >= 0)
> +		close(reason_fd);
> +	if (reasons)
> +		free(reasons);
> +	return NULL;
> +}
> +
Currently, there is no real failure case covered by this test. Even if 
the driver reports an incorrect throttle reason compared to the value 
read from the register, the test still passes because we are not 
asserting the expected reason obtained from sysfs. The only possible 
failure scenario today is when IGT fails to read from sysfs, which is 
already validated by the throttle-basic-api test.

Therefore, it would be better to compare the expected throttle reason on 
a platform-specific basis in this test.


Additionally, it would be preferable to merge all the subtests into a 
single test, similar to the approach used in throttle-basic-api. Having 
one subtest per bit adds unnecessary overhead to the CI test list.


Thanks,

Anirban

>   /**
>    * SUBTEST: inject-fault-probe-function-%s
>    * Description: inject an error in the injectable function %arg[1] then
> @@ -529,6 +589,90 @@ oa_add_config_fail(int fd, int sysfs, int devid,
>   	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
>   }
>   
> +enum cri_throttle_reason {
> +	THROTTLE_REASON_SOC_THERMAL = -1,
> +	THROTTLE_REASON_MEM_THERMAL = -2,
> +	THROTTLE_REASON_VR_THERMAL = -3,
> +	THROTTLE_REASON_ICCMAX = -4,
> +	THROTTLE_REASON_RATL = -5,
> +	THROTTLE_REASON_SOC_AVG_THERMAL = -6,
> +	THROTTLE_REASON_FASTVMODE = -7,
> +	THROTTLE_REASON_PL4_LIMIT = -8,
> +	THROTTLE_REASON_MAX_VID = -9,
> +	THROTTLE_REASON_PKG_PL1 = -10,
> +	THROTTLE_REASON_PKG_PL2 = -11,
> +	THROTTLE_REASON_PSYS_PL1 = -12,
> +	THROTTLE_REASON_PSYS_PL2 = -13,
> +	THROTTLE_REASON_P0_FREQ = -14,
> +	THROTTLE_REASON_PSYS_CRIT = -15,
> +};
> +
> +static int
> +inject_fault_throttle_reason(int fd, const char pci_slot[], const char function_name[],
> +			     enum cri_throttle_reason reason)
> +{
> +	int err = 0;
> +	char *throttle_reasons;
> +
> +	igt_info("Injecting error (%d) in function \"%s\"\n",
> +		 reason, function_name);
> +
> +	ignore_dmesg_errors_from_dut(pci_slot);
> +	igt_audio_driver_unload(NULL);
> +
> +	injection_list_add(function_name);
> +	set_retval(function_name, reason);
> +
> +	throttle_reasons = read_throttle_reasons_from_sysfs(fd);
> +	if (throttle_reasons) {
> +		igt_info("Reason for Throttling is : %s", throttle_reasons);
> +		free(throttle_reasons);
> +	} else {
> +		igt_warn("Failed to read throttle reasons from sysfs\n");
> +		err = -errno;
> +	}
> +
> +	injection_list_remove(function_name);
> +	ignore_fail_dump_in_dmesg(function_name, false);
> +
> +	return err;
> +}
> +
> +/**
> + * SUBTEST: throttle-reason-fail-%s
> + * Description: inject a throttle reason in the injectable function %arg[1] then
> + * read the reasons from sysfs
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @soc_thermal:     Frequency is clipped because of SOC hotspot temperature
> + * @mem_thermal:     Frequency is clipped because of memory hotspot temperature
> + * @vr_thermal:      Frequency is clipped because of VR hotspot temperature
> + * @iccmax:          Frequency is clipped because of ICCMAX limit
> + * @ratl:       Frequency is clipped because of RATL thermal algorithm
> + * @soc_avg_thermal: Frequency is clipped because of SOC average thermal limit
> + * @fastvmode:       Frequency is clipped because of Fast VMode limit
> + * @pl4_limit:       Frequency is clipped because of PL4 limit
> + * @max_vid:       Frequency is clipped because of MAX VID limit
> + * @pkg_pl1:       Frequency is clipped because of PKG PL1 limit
> + * @pkg_pl2:       Frequency is clipped because of PKG PL2 limit
> + * @psys_pl1:       Frequency is clipped because of PSYS PL1 limit
> + * @psys_pl2:       Frequency is clipped because of PSYS PL2 limit
> + * @p0_freq:       Frequency is clipped because of P0 frequency limit
> + * @psys_crit:       Frequency is clipped because of PSYS critical limit
> + */
> +static void throttle_reason_fail(int fd, const char pci_slot[], const char function_name[],
> +				 struct fault_injection_params *fault_params,
> +				 enum cri_throttle_reason reason)
> +{
> +	int retval = 0;
> +
> +	igt_assert(fault_params);
> +	setup_injection_fault(fault_params);
> +	retval = inject_fault_throttle_reason(fd, pci_slot, function_name, reason);
> +	igt_assert_eq(retval, 0);
> +}
> +
>   static int opt_handler(int opt, int opt_index, void *data)
>   {
>   	int in_param;
> @@ -625,6 +769,26 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>   		{ }
>   	};
>   
> +	const struct section throttle_reason_fail_functions[] = {
> +		{ "soc_thermal", THROTTLE_REASON_SOC_THERMAL },
> +		{ "mem_thermal", THROTTLE_REASON_MEM_THERMAL },
> +		{ "vr_thermal", THROTTLE_REASON_VR_THERMAL },
> +		{ "iccmax", THROTTLE_REASON_ICCMAX },
> +		{ "ratl", THROTTLE_REASON_RATL },
> +		{ "soc_avg_thermal", THROTTLE_REASON_SOC_AVG_THERMAL },
> +		{ "fastvmode", THROTTLE_REASON_FASTVMODE },
> +		{ "pl4_limit", THROTTLE_REASON_PL4_LIMIT },
> +		{ "max_vid", THROTTLE_REASON_MAX_VID },
> +		{ "pkg_pl1", THROTTLE_REASON_PKG_PL1 },
> +		{ "pkg_pl2", THROTTLE_REASON_PKG_PL2 },
> +		{ "psys_pl1", THROTTLE_REASON_PSYS_PL1 },
> +		{ "psys_pl2", THROTTLE_REASON_PSYS_PL2 },
> +		{ "p0_freq", THROTTLE_REASON_P0_FREQ },
> +		{ "psys_crit", THROTTLE_REASON_PSYS_CRIT },
> +		{ }
> +	};
> +	const char *throttle_reason_function_name = "xe_gt_throttle_inject_errno";
> +
>   	igt_fixture() {
>   		igt_require(fail_function_injection_enabled());
>   		fd = drm_open_driver(DRIVER_XE);
> @@ -640,6 +804,14 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>   		igt_subtest_f("vm-create-fail-%s", s->name)
>   			vm_create_fail(fd, pci_slot, s->name, s->flags);
>   
> +	for (const struct section *s = throttle_reason_fail_functions; s->name; s++)
> +		igt_subtest_f("throttle-reason-fail-%s", s->name) {
> +			memcpy(&fault_params, &default_fault_params,
> +			       sizeof(struct fault_injection_params));
> +			throttle_reason_fail(fd, pci_slot, throttle_reason_function_name,
> +					     &fault_params, s->flags);
> +		}
> +
>   	for (const struct section *s = vm_bind_fail_functions; s->name; s++)
>   		igt_subtest_f("vm-bind-fail-%s", s->name)
>   			vm_bind_fail(fd, pci_slot, s->name);
