Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C1DC61DE2
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 11:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BE110E234;
	Mon, 31 Aug 2026 11:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V0EOVawi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15CB10E27C
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 11:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788175847; x=1819711847;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4J0AcfsdKyWMsg3Hb/vMCOUHgovMAV+wIocL6FQaTyU=;
 b=V0EOVawiIvDkhi5KixaY6DsCjZ1R/nuRoQ+N9MtgQZAjfzQ78xrQ4HAb
 ahwN7HZpBkMJljVhbDrHRRG2Wq1Xb0VFw7BRXQyPos3kju67KIW6wOvt4
 zxANM7IOPqfFVKoBf0u1P/JovQtSSqD0k3NSor3iUdmp9vJ6yVuBCmGje
 4G+Kd/Y8tLUBLjHjce0TA6Y8kixlta3WtElbTw/neffYhIMzXQltszqFM
 4J5nGuof0HI/xiToATdCok6zeL5PAZaCcic+zrVE6PZwtvRWLWCEPOqHJ
 pPJW07xfPNSYED2l5paKaQ7kTeMfGyVMenkul1KFB0GBk2/WD4MyvF5SA A==;
X-CSE-ConnectionGUID: 52v0LZteQ2GJXPmoign/eQ==
X-CSE-MsgGUID: LL+aHM1VR1af1ZzpxWs/5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99181860"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="99181860"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 04:30:46 -0700
X-CSE-ConnectionGUID: GqeC91sETFKyUW5+rUQdwQ==
X-CSE-MsgGUID: mt4MaB9PSd+yYDzfHfClXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="266971866"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 04:30:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 04:30:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 04:30:45 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 04:30:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bF9ixBy5NIhZ3gtRayk5uGct+7ABmWHyHyP4BN1ymrN3krjJcC0FiSaBBtIEMeThs6+qqsQBIIVcA4/dUo1Hqs4cUsRxTbLef5sSf/0HAxcym6jUv1jFIlKerHKsEozEBqk0ykDOPsT6lri1qTnFw4NkZVc/xOxFrO5mQTixSX1cyuLcdvzoZG27+Uza/pr2KOAxsqvlAXbkK50MltUB/Y/EQVFJcippQueqkgLzvbfR82TTSBBu8wrInl4uvT5VN5o60CUvknn8pyhKZFWSjEXUPhpqkhx/RiDz4i8Y3K933+AsL7J7dmAOuzD+kmZkTxljXODOKtJWSUp/tcGHfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/w3MXtHngXaZWwDE6yEOjGjZoooY+MLdCvpq+/N8YwU=;
 b=x86GtXT/dmIg+n61ZnQlJGMmQv52516a7rq7qAls3fTmsQVsMhK98JwZgnTH0a+AEzLCP6S/XLNY7qu5Ccnw1KPJKZX9fZMkjaz5z5rKKHAAfPodNlT701a7CF6e78KUZ3+1b40vI/AIBEb8cStqqdeXTARDc3Evu4nMXiNYFdZQ8PnUm2SwcXa77IqJ+mIpZfI3GkOqWAUGfYr236+VDyU0nr98nSWBp/kFRn9gTCeAblhJ+5RFKzbIunO2ZFctMOIlbTzf7Vj+whZAF4LF8SRZgs5YWUWLUZDV1eG2R9yNNgxTzdIBHZCIPFm8fp5QtgV2Bo6u1Ow0MxkOgXALTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 11:30:42 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 11:30:42 +0000
Message-ID: <19d17250-946f-46dc-a640-44ed08aa6dde@intel.com>
Date: Mon, 31 Aug 2026 17:00:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] lib/igt_drm_netlink: Introduce DRM RAS Netlink
 interface library
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-4-ravi.kishore.koppuravuri@intel.com>
 <c9b431c59949a9499d79e166886413591de113e4@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <c9b431c59949a9499d79e166886413591de113e4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df7a3da-98f1-486e-42db-08df07534a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|11063799006|5023799004|10067099003|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: j1F1aWYPvJEd1WLkh3uXoCRY0roedTspvLIxtVTqcxFSbKz7bIMFssnvrkZJa4+6UV8LnX26n0uXUldsu9cybNl0nNJC9foMhqnQTRT7NxoHJ+TvcRgPjqIgtiEqhj/vwK2QHgleRphxhpMpmdgpGLhPOQCrfTBtSWPLG94Xcuna5MThovLN0pjkgvbEcCHiQ8gU1nOgaixvZVoW36n+HKHavzpg3e4yq8FirRmSf1WaJseKQ8qx7/3NOTVz/bY+i6eqT9MhHND2iumOBkZgtNfRk13s/3zbJNwsDFNZzh92HbLciXKzC5l9NONGqGqWfIYGPLvCoNd3qLUT8bYBOFSitWr8tVpjIy727KpMTHE05O3+pMlJI4RTCItP4VNly4hSjjfnGBLNqKsB7LnSgvw3gQrL7LzOjabDrk2jbq8Y52ezmSL5/dmOhhb6G51Vjeukcuy14GKZdepCqM/hJP18TDTYUv2WZ6794HRVtwZSALSzpBMyW9YYwgoQw4Tm/xBtAUeui6VPXP35My/yUI9cEeW5oG1/ADsgUlyok+zS8tI7vvnYC6JtqsslGqd9fRsO3HoxnuGQd87N8i9nVM/0d6K+B208UxghW6T8qKlFRVv3e4GTPLsKv5F57gZaClEvMv+5IHNRuplByE2B4SMmamyb/K4FD6v+VTxonjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(5023799004)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzQ4Sk1QbDNGVEk2Nzd0Zkh2RnNVTFM3ZnhlUldqVERuczg3ZFRHamVzaWJ2?=
 =?utf-8?B?QXBrcEFBSEtrZ205R1pzN2hyK2ZYd1ZHV2t1ZkphTHR4TjhvT3RZVjU0RzJu?=
 =?utf-8?B?STFMWi9PYVdobU0wV1N0T3VRcmxzK1liNFBVL3RvdXNUV0I4OVRuYklLdUhN?=
 =?utf-8?B?WnRyZmlwT29vYlNjbHBJYVFXanB5NW9UMDlNRzFuM3lOTTdlbmtmM1V1cmF0?=
 =?utf-8?B?MytJZ0RGdHZWbDlSaXZOdHBDem10ZUFhdzd1cnpZWUtHUWRybVFJR01UUzdk?=
 =?utf-8?B?UTh5d3VaUkdDZzQrTmpoWTVFRmE0M0JTZklPVFVvWGFIaWtYZzR5MVFMQUhB?=
 =?utf-8?B?VE0wNHNWWDVWSm8rOUlRa0FJT0hubDlTcTF1eHoveVhjSVpQMUx1UXJyTGpY?=
 =?utf-8?B?eUtPMnNoWnhWVmkreUw0U1VSZlYyZVRweEU0QmZJaGJCazFsM0JuMzVOZDlW?=
 =?utf-8?B?cis2dmYrTXRDclRQcU1xbjdJTmVXdTJwNHdsNGVpb0VDbmFkOWM3ZURPcUor?=
 =?utf-8?B?VWNMcUlNRTg3VWtTOXd6c1pXb0xUdy9OZVlJR3lsRVhGU2l5My8xZXYzL1Rz?=
 =?utf-8?B?V0JtWTYvcVBUa3JVZkVBc2R4b3BXNzRZaHJ4MzFIWFNWUU8xSjluUGJLZSth?=
 =?utf-8?B?UEgvYnJBRjNNejBPa3JxNFZTckhBWDRLbENOMTlrNWZPcHVHZmhUWHVYT0I2?=
 =?utf-8?B?YTVCcEVPNW9hQWwxLzdTZzRsZjB2WDcyQnR1SmhHcG5pZlZISWJUZU5GR0Ex?=
 =?utf-8?B?OWwxRUltS3ZRaWR5Nm5pbmJUZmRyblhkandvR2J4Y05yRmJTQThVOVdEVkNP?=
 =?utf-8?B?RjNjc0VmcW1FN3kwL25wTTlHbE9lOFBTZi9pc05WUDBncHpPblFDU0JBbFlT?=
 =?utf-8?B?TUluOWREL08ycDBCQm5mOEE4ZVN1UURqVDh0ZE9TcWowRE0zenptbEZKcXVt?=
 =?utf-8?B?NnhvUEFrNkpYUHozbnZpVHdwVVREV1k2c2Z5cnNZbThaSVg4UjVORUoyaUEv?=
 =?utf-8?B?U3FuVEVVc0pvQzVIczZ2c2VMR1VGT0l1cnVjUmp1bEY5K2t4WDFRbDFxTlZw?=
 =?utf-8?B?cERZTVRzZ254YkhzMFlCOWVmYk5OUzBmVHYzaFlzU09TeXM2N1ZuRnN5L2dy?=
 =?utf-8?B?VnVVMWxaMUg2V1NBMkJ0TjZKOVAxb0VNdURXNW8zbEZiNkNrS1RZYkxZYkV5?=
 =?utf-8?B?eFRtOE4wUGlldmJxNVVWQXh3aTBHWTh3N1czdFpRV2JCVkh3YktNb1F0NWVI?=
 =?utf-8?B?Vjk1V0FjMjlCd0g3Z3gvbmRPMlFvaFlncVNyM3p5VHFXOTRzNXFYU0J5Rng5?=
 =?utf-8?B?VThqYmZrekUzRHRkdlExSlpXTkczTGd0bXJFZEplOWhhUktibVlTbC9GSGlP?=
 =?utf-8?B?N3ZWVFA1QWpxUUhhRkZ3Z1ozeVNEYlpVMGk2Ry9ubThNbDY0UUQyYWhSWWVC?=
 =?utf-8?B?SEE0ZnNjSVdIcE9qME9PTXk0T0s1eVlqalV0NWVKdGt6VVZnZmo2OWdTSktx?=
 =?utf-8?B?MklLM1Zyd2V3VGg3TnZpY1ZDbEJLdGliRnlpbmoyOG5WeEU1M0d3SUZiOFNG?=
 =?utf-8?B?UXVyWXVabDlhNHUzNERDb2lCRXJqV0pDVG9ET1VwZlhLanNqcURsMStaQkdY?=
 =?utf-8?B?aVdYb3JISVJwTzRISGhCUEFoQzRDc2dodXRSbGtkb1h5K2hoZDNRM2JjVFpv?=
 =?utf-8?B?L0N0R0c0R2gvbnAxbWlNYnE2dHkzSnJpczFEMFVpRlpUOEh6OTVPK3JndzJ1?=
 =?utf-8?B?bVBwSWl3VTN6ZnVCM2tHbzhYTm54NHp6My81Y0piOFRSQ1ZRTEp2N1JmWnNy?=
 =?utf-8?B?UEQrZXcybFRWS2xMamEwQ2o2UWx1NkRaWjZiekY3aE8vUXA2aDROUWJ2N0xz?=
 =?utf-8?B?bFFMNzBzNWFIT2NZYSsyeEVySmw3VzB4eHlqd2Q2YmhzRVd0eGNieG1BQzJ6?=
 =?utf-8?B?NVV4RmFVYVRvQ01YVkpyQTNXZ1Fwckg0N0k2eVFta0ZoaGhuek5xem9MNTB3?=
 =?utf-8?B?aGxQTnVMQlgwOWEvWmhIVTdkYnBvMHA1Q291QkxWaVh1bXU1S2RGQlhxelVT?=
 =?utf-8?B?NTZCdDZmdlFSWXlNaGVueXhFcVlmSjQzdWtjRjJmUWN6WmRXM1BMRFdjaGNs?=
 =?utf-8?B?VWozNTNoZlBvLzFDb04yc1hZMWtXZ0xmdXV5d1RvRjR3aDdqV20raU9URWk3?=
 =?utf-8?B?bjZxVFU4VFVtRWswempGcWlGakJ4clpYaU9QcndxcDQ3WkRMRFJJVXA3NVd6?=
 =?utf-8?B?bVNydE9hYzVGdkVxaGYxVnVxVGNRWnFhMWl1NVJkTG1iUnBpcmhKTk9ZUnFN?=
 =?utf-8?B?L0VQZG9UR0V1QmZFc25nMEhEck1ua0ltcWFmWEhSSUlsejdpTW0xcEZEcUtH?=
 =?utf-8?Q?3IZntl9aTmsgWpeBTG65G0ilWfchJJyTu7IAR?=
X-Exchange-RoutingPolicyChecked: bYF4yam6xqk0k0C1DAfpSgD5SkSfmGDQdmRtjaTK148Mvgw8y3Yv4tOXwvspX16d8yZKQJBB5DWYLcFLzj3jBraCgA9uLO6vwV5wqi2JIz0IuvaVymc7d2jd66eid3Nq80fDrBpoFAudE0ggzEzbV0Ki3OccnKun1VIOQOLR80M4yLSDzjSl+C/U2aCN3obCIeX7KVQhQgrMuU7t9quQ0SJNrZEr6UYgysENPf7BwXOOXYvfbjEVwj7jkCyi6oVv2kQGEIXfYEyxeGY1ruIjB8scneDu3yAuHhte/skDNPkFZznSsoEHry3T/+a32ViB94MOCFgRyNMeAcpjlyHasg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df7a3da-98f1-486e-42db-08df07534a9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:30:42.6640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYFW/ENRumMJWp3mo4ptAe9NjXoImmL51LmMHZ5CNOj3WeeziRReAxvl1sdkuFo76Ds04SAano7l1Ny/V6Xl1EEht68c4QuWnLw6x+RIDCNTGEcSh+A/+gweNfA6eHZH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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


On 31-08-2026 14:16, Jani Nikula wrote:
> On Mon, 24 Aug 2026, Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com> wrote:
>> Introduce an IGT library for communicating with DRM RAS Generic Netlink
>> interface. Add helpers for Generic Netlink socket initialization and
>> cleanup.
>>
>> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
>> ---
>>   lib/igt_drm_netlink.c | 60 +++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_drm_netlink.h | 25 ++++++++++++++++++
>>   lib/meson.build       |  1 +
>>   3 files changed, 86 insertions(+)
>>   create mode 100644 lib/igt_drm_netlink.c
>>   create mode 100644 lib/igt_drm_netlink.h
>>
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> new file mode 100644
>> index 000000000..fec1639b4
>> --- /dev/null
>> +++ b/lib/igt_drm_netlink.c
>> @@ -0,0 +1,60 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +
>> +#include <netlink/errno.h>
>> +#include <netlink/genl/ctrl.h>
>> +#include <netlink/genl/genl.h>
>> +#include <netlink/netlink.h>
>> +
>> +#include "igt_core.h"
>> +#include "igt_drm_netlink.h"
>> +
>> +void igt_cleanup_nl_socket(struct app_context *ctx)
>> +{
>> +	if (!ctx || !ctx->sock)
>> +		return;
>> +
>> +	nl_close(ctx->sock);
>> +	nl_socket_free(ctx->sock);
>> +	ctx->sock = NULL;
>> +	ctx->family_id = -1;
>> +
>> +	igt_debug("Cleaned up netlink socket.\n");
>> +}
>> +
>> +int igt_init_nl_socket(struct app_context *ctx)
>> +{
>> +	ctx->sock = nl_socket_alloc();
>> +	if (!ctx->sock)
>> +		return -1;
>> +
>> +	igt_debug("Socket allocation successful. Connecting to Generic Netlink...\n");
>> +	if (genl_connect(ctx->sock) < 0) {
>> +		igt_cleanup_nl_socket(ctx);
>> +		return -1;
>> +	}
>> +
>> +	igt_debug("Resolving Generic Netlink family '%s'...\n", DRM_RAS_FAMILY_NAME);
>> +	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
>> +	if (ctx->family_id < 0) {
>> +		fprintf(stderr,
>> +			"Failed to resolve Generic Netlink family '%s': %s. "
>> +			"This may mean the running kernel does not expose DRM RAS support.\n",
>> +			DRM_RAS_FAMILY_NAME,
>> +			nl_geterror(ctx->family_id));
>> +		igt_cleanup_nl_socket(ctx);
>> +		return -1;
>> +	}
>> +
>> +	igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
>> +		  DRM_RAS_FAMILY_NAME, ctx->family_id);
>> +	return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> new file mode 100644
>> index 000000000..f681a3a81
>> --- /dev/null
>> +++ b/lib/igt_drm_netlink.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef IGT_DRM_NETLINK_H
>> +#define IGT_DRM_NETLINK_H
>> +
>> +#include <stdbool.h>
> There are no bools here?
I will update it accordingly. Thanks
>
>> +#include <stdint.h>
> There are no stdints here?
I will update it accordingly. Thanks
>
>> +
>> +#include <netlink/netlink.h>
> You could get away with a forward declaration.
I will update it accordingly. Thanks
>
>> +
>> +#include <drm-uapi/drm_ras.h>
> You're not using that here.
I will update it accordingly. Thanks
>
>> +
>> +struct app_context {
> Why doesn't the name indicate netlink in any way?z
I am using this structure to maintain the context of request received 
for the library functions and responses received from netlink functions. 
So I have not included netlink or nl for this structure name.
>
>> +	struct nl_sock *sock;
>> +	int family_id;
>> +};
>> +
>> +void igt_cleanup_nl_socket(struct app_context *ctx);
>> +int igt_init_nl_socket(struct app_context *ctx);
> IMO "nl" is the wrong place to abbreviate.
libnl is the user space library used to communicate with DRM netlink 
socket in the kernel. All libnl API references have the word "nl" for 
netlink. So, I have followed the same in my library functions as well. 
Could you pls elaborate your suggestion, if am missing anything here.
>
>> +
>> +#endif /* IGT_DRM_NETLINK_H */
>> +
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 7248bbc2d..70da9a4a0 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -27,6 +27,7 @@ lib_sources = [
>>   	'igt_device_scan.c',
>>   	'igt_drm_clients.h',
>>   	'igt_drm_fdinfo.c',
>> +	'igt_drm_netlink.c',
>>           'igt_fs.c',
>>   	'igt_aux.c',
>>   	'igt_dp.c',
