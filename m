Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC7BC5DF80
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 08:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD8310EA3F;
	Tue, 18 Aug 2026 08:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9gI3kqU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA6810EA6A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787041400; x=1818577400;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=nRfTC2lBv7C3mtMjExN2RxLW45K2k/Ypgw0C1r2Rn54=;
 b=X9gI3kqUmQGmxT+qLB1PV+wdKKQpITalpNDJFFJQqdlLIEOzqJV25//x
 aDyB2XOJroM87XQRmjs0v5HO5mCoWFx8ZdbqpuMyIZLxAGQcqP+YKCfHt
 fdouJCYMuQ5AQpr6pWsS6wgNhPLi93TJjSnoOLSUKIj1GwZtCYsHv8edK
 NxEYDqKRrE4L6NbPUd07tcwxSwVeqzmWKZV0EZdKmy8GwjOMnxv637O/z
 xiBtwGw1pxRyuUBhklVAeHWEszK0gsoxSOuC8bmaJS1yuNosb7C7IKLqd
 TO2qpO8eQTXzA99DkXtgFn49aDKums70uNulGFBf6IpwwNPFXmmkY7L0B g==;
X-CSE-ConnectionGUID: QuN1qBqiTsG9lnJ9B8K+WA==
X-CSE-MsgGUID: tcWJkTXaSquSepW4sZP9sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="99044717"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208,217";a="99044717"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 01:23:20 -0700
X-CSE-ConnectionGUID: pP9AGan2ThaWD4CFZnHqYw==
X-CSE-MsgGUID: fCW0ypHCTTmINzxVPznOfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
 d="scan'208,217";a="269463363"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 01:23:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 01:23:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 01:23:12 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 01:23:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFUorZQryUztF0N9O+OIkwWe8h08GCQ0dQQcx0lokrHNH7cm8BhpWOLuCvArMgLxyj0m/OO+BJO516D+jRaRKLTrAxUX/qNcSBoe76wCYvQhzzEmf+PiUaNkLk6kqmp3UZX0UEu0oo+qKJ13faw+tWwu7vdU48+RKFIC2uBlAgH8AuDhWCcd73fNIsu0lp1sJYI7bHFjOt5hS8guByfHmspMok0tEN5bN6lZbRXMmbIiifvCbyUaNPVA6eQNJ4NiYBgTFRqGitSUj6bTqltreXmiRwRcPBwAEVErKftPbvYgWOOP7/3vKsLYRq8arR2wmxcMiTWZehhECIeojEZLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1T1+Ld34lfvRz+Iz8EB5zlLornGVTt5tJmIjPn3ggg4=;
 b=xdfBo/LO2UzRM4b0DBOODNLqDHziCLdP+IXm6EZpuV7yfdZz6tXneazyxd/FCpzGYjXH+sbZ1L1GRUPf1yGK6ADKSahkL4Ruv31MWC4iHcoA9NRqQ0/vbIZiSb6ATp5G59MwbRbKgg2/9CySlaQYj2WI62IZbpqWUr/CclU9YAzaAGflEIDh508XpO76WpD5wyuhiWvFqswTsCCUwKQ01B/nTNrSXeHEcdbtfjHFN9lGzJCCK/6kPe60XzKUTf/LhDVCvutCxg285fkBDZNYTiXG6iesteNeic997NDRJMwI3qspET0uj8I06eomuJaeOUDyfe6JtTI3+ImP/gls+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 08:23:09 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 08:23:09 +0000
Content-Type: multipart/alternative;
 boundary="------------jsp0mJ4PoHXvsnAdNQq7hkJ1"
Message-ID: <67b43679-7262-4c10-ad18-1a9e2f35f08d@intel.com>
Date: Tue, 18 Aug 2026 13:53:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 06/16] tests/kms_frontbuffer_tracking: remove
 TEST_MODE_ITER_BEGIN() from `fliptrack`
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <nemesa.garg@intel.com>, <karthik.b.s@intel.com>
References: <20260807224746.3554064-1-michal.grzelak@intel.com>
 <20260807224746.3554064-7-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260807224746.3554064-7-michal.grzelak@intel.com>
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|DM3PR11MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4c6e3c-5dde-41bd-0443-08defd01ef98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|5023799004|11063799006|4143699003|56012099006|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: gVwsmZa++Fh2wDDN0nThOtIXCAiDjSPQQIx3cYNiLp3M0PbyJyTGlKaLH6HIjx+pE1PjK8zoZSLvjogGHQY8DXCevlkX/3mWY4hpi5rKxVT/pmIKlqMPtbare4Jjrjnr9xc75cXdAgpscke5BoD1dmISehh02V4WIgz5GVfcpgT8Sn4FbEg/jHMZ4YpBSVm6ouVHpgicfZqT5lEvlHz3qYYc4shDbrPR3nVqL28SeDSKYgdRxBIyd9P+B3IVAKWz8aWQCKro40r0pPNnhj39oHVMmGhclQog9N5ujV42pMvJv1YDgONm5sCGWmEkPk9fDVwMITKUT0T2V/El5es+5N0wnMLchoB7nNEh5p4WWC0LX3Mq3HjIAWtd3S6esPqHHC4zTdt3DKb/eU+nXj3ma3EKWEczdr4+X74WsiohEzCMQsYin9ffVTjaa5sRzHfkcyjoYS+V1iGTzjZownQK1GroJ+/PJKiOfr+Nj36abGE+VPkAfhnmOAdzzOg/d4XNv8iQ7Yoq2pWa/sL6PIpdptMFUklmraXHhfjdfbM2FcUdEGva0eC/Bey3ZuPtjLfOW4QptbT9zkzWDy1YPP3wYvbVd5pScB3F3aTsP9FUr3u4b74ZK/GNOp5M6JvRI1K19PwFMp7h+IjkGDf8MvcwNqEVYvgTKmpTIw+FxF0cHFI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjZUUytLUDJ2L05rMUU1d1VvMlFLZ2h0RHFBSlJGR1dLWDFwam1LTzFsTFB0?=
 =?utf-8?B?N0RiRTQ1aTlMOUFsNFUwcTNXSlF1QWo0NDlrTTlPVHMxTUJTVDhSRjVOd09z?=
 =?utf-8?B?WHdiQm1xVXVFSGFON2ZLY0lIM1dnNFA5TjlSVGM4K09NSHFwWDBGUHF6dkZV?=
 =?utf-8?B?S2t0bDY2SUJHc2xaYlQycDdXeW9uVTRIaTNITHZtTTE2endMREMydE1oeDV2?=
 =?utf-8?B?aHkza2NSUXZKY2VpcU9XYkR0cGdqd1FUcDNLME0zRzRwUmMzT0hrRHhlZ21m?=
 =?utf-8?B?ZUpRQzVNeGcwYWhnLzhna3V5UXoxeVFDNWNaQWZvNE9jcWd1eGNXWTNkbTRI?=
 =?utf-8?B?aGJLUHZpYXZKaVU5azZGOEdTYVZ2anlrbGx6TmV2MTFtbjA5M1BxNE1HSlBF?=
 =?utf-8?B?SjZyYmVOTmgrcndPN1BaNHRlVGpPRVdNT09yMndUYlpHUUxHcGFSb3pjOFNV?=
 =?utf-8?B?WXh2dmNMczBlUWV3SGJsUUNZQTVKd2Q5ZVVTVTJzMGY3RFNkK3pXZWVyU1Nn?=
 =?utf-8?B?RzhLSmFVVVJ3K2lMaDRnandsaERER2NINmtZME55UWdGUUhMeFA0MmNiVzUv?=
 =?utf-8?B?MlZyWExmb2F6ZktjK1NES0FITDA1VDN5d2RSbG1QNU1NVTBzLzhoRjIyenJo?=
 =?utf-8?B?cWI5MEdhK3pGZ1JSN0toaWwyNHhGckcvV0lRbTFUVDhBOVRMemYra3h6ZzNV?=
 =?utf-8?B?WW1iRlh3R2pqK0Y0TzhiblN3a2dQQVJZQnE0WHFaSXQyU0dJWlFodm1iemwy?=
 =?utf-8?B?K0pZNUcwSTkvV3JxTThNZzlSN01kTmprZUxVaVN5eFB5NW5VSzVYV3d1ZUQ2?=
 =?utf-8?B?bjhkUHhaT1JXTTRHemF2M205M1JqM1E2YnhBZ0hPYzIzQlpJMGs1Y3psTmZE?=
 =?utf-8?B?ekcraXdNWUJrN0hJZURXUFpyalZ3Vlc5MVdPR3VqTThxVkdYU1FKNGdMaFgy?=
 =?utf-8?B?QUEyb3B2dzZQMHhMZ1BiS3NleHUxMkJlakhWVTdQTlZQdkZkUldWL21IdEg5?=
 =?utf-8?B?Mm8ySy92Q1ZDdktNZUs2RmhUUzdkVW1mUG9TQXpqV3dYOEFCWmJSb3FZRDFq?=
 =?utf-8?B?VVlqU1pqTWw2djlNM2tiZ2hIQnpScFFZb3l2RVhFVjFyZUlhTHlTNXM5dStO?=
 =?utf-8?B?MTR3eEtEdXN0WGtEOTFiSTgrZldvTUx2K0NIWWdlRWc5K0Zyb295V3BmS3Ir?=
 =?utf-8?B?MEl1cXIyT3dVUy9uYXhLSXc1MU5kQVFNdVYwQzFiM0wrSDR3VDluak1RT0Fw?=
 =?utf-8?B?R1JEQTA1dXBBU3V5WS9Ybk1kenAzbFg3Y1dNVnFHN0s1eEhodjNzS2wvYnI0?=
 =?utf-8?B?VlA2S1lLZ0FpU2RDVzUraWU3L0M0UkpjS0ZkWnZWMjViVE1ZOFNOWGR1U3Ro?=
 =?utf-8?B?VEsxeEpFb2o0b3hmUEVFaWxsR3FDZk5ZSmc2Z1NNK0c4Y0RZcmZPRWNhRkNZ?=
 =?utf-8?B?UFNsZG14SktYZTZ0ZWY0dTNhdDBKamFGMngrS1N3Y25lS0JSMkJXZzhIWWV0?=
 =?utf-8?B?MWt1Wnhya2JCWk5ST0tDbXR4UnF0K3JTM2N5b2liZWVvUmMzODlPdlFDZGNm?=
 =?utf-8?B?TkVJSmxRa29HN014a2EzTGNzQUs0UHg1MC9SeTF5dEFmMUl0UVA3U2VTUmFh?=
 =?utf-8?B?N1NxQXh6SHowYUpRYXRGS0k5eU1yYTF4NzZSL3lsZlp0TU95b0UveEU2cjIz?=
 =?utf-8?B?N2RkakVTK0VDSGx6UUJJWTlnWmZmRHlESXlFZ002ajdYelVrUTFobG9GZ3Bh?=
 =?utf-8?B?by9iZTJIQUkyR3VjdS9YSmhZSzJhcXdTRjQzOEhVR0xxRFh6UDE1S3lFejd6?=
 =?utf-8?B?UTlqcmxTWE1BL0tsenY4UFpVTmV2QytWU2hweDd4SlQ4QWhIU2FDbEdXU1BD?=
 =?utf-8?B?OHd5aVdOSHFLb0xiQUpITXJSWkZUUkxXcDY0NGdHQkJvWHREaFVmRG5lZ002?=
 =?utf-8?B?czUrMjhiTVRMY1ZUTFlsY2ZhQjh2Z2MzVVZuMTlTRWdwZkRVeVQ0MUphK3di?=
 =?utf-8?B?Nng5RHl6V1BwVU91enJ0MHF1SzR5NXM3MWRkQ2NpSnVvRFphVEd6RkZwWmZU?=
 =?utf-8?B?d2wyb3EzYklOa2QxOFlmZldqdXFOeGNENFQ3Sjgwekh2Y3FTaFZnUWV1OVp3?=
 =?utf-8?B?d3I1aWcwcHE2R0t5U3JyWGN6MG1CcWhPbjNIZlVSQWhKN2s3cjhtN25FZFdo?=
 =?utf-8?B?UEd3dWtwWGpJM0l5NzFPeFVvZTFIQ1BLSUNBSTVMSUs3K2dJMFdxQ3lQNVUx?=
 =?utf-8?B?VzJkaUFNZWcrYVBKRitHaFVzRmRaLzJsUUZlbnkxMGRRSW8zN0F5UWY0R1ZP?=
 =?utf-8?B?MzZyTXBldGRwMWpVK2ZQdW1STFdXTjlmWEgrcWUyajVWMkxZWTYwd1BPU1lO?=
 =?utf-8?Q?OE47orrJsZ3H0iks=3D?=
X-Exchange-RoutingPolicyChecked: PJfVyUObBewGRDNYQQrQwqOinQF9P5djnjc35ixYPbgQ01cvQdUoMkPMCREW+v+ppfMPW641PCazwSXxngO6WCQalzmQ+EZpjmPlczNsFeDGlVkg+qsb3SivJYiRI23Lly9kKyMsIDAKXwrzg/ac+TO+cIyVHjEmO/hATpZ82KyLUejwV1DhMiUbe9K4hL5YG10cqaCNbqpuwX+01ISaiYprsr6/LEGlCohl01jqit/0rI8xIlj3v4OjW4Pja5304FKEcPP9Ejf7o590O6AWLxj6AIc/+hylvjhm4xF+nmDp4X+azes8wn4RJnrfkOF7OQYV2dNX3XoaH6G/80bJQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4c6e3c-5dde-41bd-0443-08defd01ef98
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 08:23:09.0607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EcM5spLpqYmC5d3ckbQ4Oxq2bcaHac9aiIIzyLvOaLuSxVMSjSxXdg16/9rLookcG+BPWH12wxQhws4OJf42GoGl+rnl5VgGHkjss9QEuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
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

--------------jsp0mJ4PoHXvsnAdNQq7hkJ1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 08-08-2026 04:17 am, Michał Grzelak wrote:
> igt@kms_frontbuffer_tracking uses TEST_MODE_ITER_BEGIN(t) which consists
> of nested for loops. However many loops can be omitted due to continue
> statements. This obfuscates following the execution of any given
> codepath. Replace TEST_MODE_ITER_BEGIN(t) for fliptrack tests with macro
> definition and remove loops that are skipped.
>
> v1->v2
> - indent for-loops (Mohammed)
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 44 ++++++++++++++++----------
>   1 file changed, 28 insertions(+), 16 deletions(-)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 406018c88a..6266297553 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -4482,23 +4482,35 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			}
>   	TEST_MODE_ITER_END
>   
> -	TEST_MODE_ITER_BEGIN(t)
> -		if (t.plane != PLANE_PRI ||
> -		    t.screen != SCREEN_PRIM ||
> -		    t.method != IGT_DRAW_MMAP_GTT ||
> -		    (t.feature & FEATURE_FBC) == 0)
> -			continue;
> +	t.format = FORMAT_DEFAULT;
> +	t.flip = FLIP_PAGEFLIP;
> +	t.tiling = opt.tiling;
> +	t.plane = PLANE_PRI;
> +	t.screen = SCREEN_PRIM;
> +	t.method = IGT_DRAW_MMAP_GTT;
>   
> -		igt_subtest_f("%s-%s-%s-fliptrack-%s",
> -			      feature_str(t.feature),
> -			      pipes_str(t.pipes),
> -			      fbs_str(t.fbs),
> -			      igt_draw_get_method_name(t.method))
> -		{
> -			igt_require(igt_draw_supports_method(drm.fd, t.method));
> -			fliptrack_subtest(&t, FLIP_PAGEFLIP);
> -		}
> -	TEST_MODE_ITER_END
> +	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
> +		for (t.pipes = 0; t.pipes < PIPE_COUNT; t.pipes++) {
> +			for (t.fbs = 0; t.fbs < FBS_COUNT; t.fbs++) {
> +				if (!opt.show_hidden && t.feature == FEATURE_NONE)
> +					continue;
> +				if ((t.feature & FEATURE_PSR) && (t.feature & FEATURE_DRRS))
> +					continue;
> +				if ((t.feature & FEATURE_FBC) == 0)
> +					continue;
-->can't we pull above "if" conditions to after first for loop? for 
(t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) as we are 
checking the feature count, check once
> +
> +				igt_subtest_f("%s-%s-%s-fliptrack-%s",
> +					      feature_str(t.feature),
> +					      pipes_str(t.pipes),
> +					      fbs_str(t.fbs),
> +					      igt_draw_get_method_name(t.method))
> +				{
> +					igt_require(igt_draw_supports_method(drm.fd, t.method));
> +					fliptrack_subtest(&t, FLIP_PAGEFLIP);
> +				}
> +					}
--> indentation needed here... plz check
> +			}
> +	}
>   
>   	TEST_MODE_ITER_BEGIN(t)
>   		if (t.screen == SCREEN_OFFSCREEN ||
--------------jsp0mJ4PoHXvsnAdNQq7hkJ1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-08-2026 04:17 am, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260807224746.3554064-7-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">igt@kms_frontbuffer_tracking uses TEST_MODE_ITER_BEGIN(t) which consists
of nested for loops. However many loops can be omitted due to continue
statements. This obfuscates following the execution of any given
codepath. Replace TEST_MODE_ITER_BEGIN(t) for fliptrack tests with macro
definition and remove loops that are skipped.

v1-&gt;v2
- indent for-loops (Mohammed)

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a>
---
 tests/intel/kms_frontbuffer_tracking.c | 44 ++++++++++++++++----------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 406018c88a..6266297553 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4482,23 +4482,35 @@ int igt_main_args(&quot;&quot;, long_options, help_str, opt_handler, NULL)
 			}
 	TEST_MODE_ITER_END
 
-	TEST_MODE_ITER_BEGIN(t)
-		if (t.plane != PLANE_PRI ||
-		    t.screen != SCREEN_PRIM ||
-		    t.method != IGT_DRAW_MMAP_GTT ||
-		    (t.feature &amp; FEATURE_FBC) == 0)
-			continue;
+	t.format = FORMAT_DEFAULT;
+	t.flip = FLIP_PAGEFLIP;
+	t.tiling = opt.tiling;
+	t.plane = PLANE_PRI;
+	t.screen = SCREEN_PRIM;
+	t.method = IGT_DRAW_MMAP_GTT;
 
-		igt_subtest_f(&quot;%s-%s-%s-fliptrack-%s&quot;,
-			      feature_str(t.feature),
-			      pipes_str(t.pipes),
-			      fbs_str(t.fbs),
-			      igt_draw_get_method_name(t.method))
-		{
-			igt_require(igt_draw_supports_method(drm.fd, t.method));
-			fliptrack_subtest(&amp;t, FLIP_PAGEFLIP);
-		}
-	TEST_MODE_ITER_END
+	for (t.feature = 0; t.feature &lt; FEATURE_COUNT; t.feature++) {
+		for (t.pipes = 0; t.pipes &lt; PIPE_COUNT; t.pipes++) {
+			for (t.fbs = 0; t.fbs &lt; FBS_COUNT; t.fbs++) {
+				if (!opt.show_hidden &amp;&amp; t.feature == FEATURE_NONE)
+					continue;
+				if ((t.feature &amp; FEATURE_PSR) &amp;&amp; (t.feature &amp; FEATURE_DRRS))
+					continue;
+				if ((t.feature &amp; FEATURE_FBC) == 0)
+					continue;</pre>
    </blockquote>
    --&gt;can't we pull above &quot;if&quot; conditions to after first for loop?&nbsp;&nbsp;<span style="white-space: pre-wrap">for (t.feature = 0; t.feature &lt; FEATURE_COUNT; t.feature++)  
as we are checking the feature count, check once</span>
    <blockquote type="cite" cite="mid:20260807224746.3554064-7-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+				igt_subtest_f(&quot;%s-%s-%s-fliptrack-%s&quot;,
+					      feature_str(t.feature),
+					      pipes_str(t.pipes),
+					      fbs_str(t.fbs),
+					      igt_draw_get_method_name(t.method))
+				{
+					igt_require(igt_draw_supports_method(drm.fd, t.method));
+					fliptrack_subtest(&amp;t, FLIP_PAGEFLIP);
+				}</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20260807224746.3554064-7-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+					}</pre>
    </blockquote>
    --&gt; indentation needed here... plz check&nbsp;
    <blockquote type="cite" cite="mid:20260807224746.3554064-7-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			}
+	}
 
 	TEST_MODE_ITER_BEGIN(t)
 		if (t.screen == SCREEN_OFFSCREEN ||
</pre>
    </blockquote>
  </body>
</html>

--------------jsp0mJ4PoHXvsnAdNQq7hkJ1--
