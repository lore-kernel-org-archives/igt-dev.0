Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD65CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 04:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A30110EED9;
	Wed, 20 May 2026 04:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwIkvNiX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9981B10EED9
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 04:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779252332; x=1810788332;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ymyq2Zv68OJQP+r5doeQ6Lt572xEqtmCmOu48a+Hkt8=;
 b=PwIkvNiXOi/oUi5fwgNZa8pi/cf6WqIUeU2qGDx2oonf17/+7xpm7jFq
 wDqhoSwK1qkSKWMeAXJQd0TMLclggHtYZxQezoC4RvwmDXWqjEujC/dzl
 lFidThCupocLChQxJIOggIsjAJ/Kxk5dol/UJ+++/FsaKh/V3T0aVWJOZ
 Wux2IPr8818ckHGf1G5Q3iio3NCwvRPqSQ3HIqmpkE/utSR4BcPdtj1B+
 5t3AJj9YfYYLasXV/ev44pFj+5iOkmdMEdYoOYgPlLnazt89MeIASXP2q
 i7QCVRY73Sa3pIwar/SrbiYVnULfSpZLmw+4btR+1kVVTuVxWYw3+IsTP g==;
X-CSE-ConnectionGUID: JMMg46eXQ+mNnGfgxNPOVQ==
X-CSE-MsgGUID: DqWTFi+RSViCOYxKJa9H5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="105600470"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="105600470"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 21:45:32 -0700
X-CSE-ConnectionGUID: q50uKOz0SRatWmucgFoyfw==
X-CSE-MsgGUID: aUzAA6DDQqKdAnAL0ksGpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="240066670"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 21:45:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 21:45:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 21:45:31 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 21:45:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0AWwDchjAw3R62ea7grp/DONbhsARHNMEOlEH2jfv5ERGv2P6qhqqOaQiimepvWku5qvA2pdyLSPxQ5aKAmfnP8a6CLIdPeJvH0bBJlJZOmGgfaYITmBQ9nzwTeupDtvMqZ0Gsohck+MEgS9vdAb8VHx+jjciM6ZLRCJuiYXjeg+ZM6EWz7Y4FwggZQWdRq3y9qAp/ItePe1EY+wfTduw24JdXlUAGoKA6++3x8hjCWKwXjpodeISGOObG9Po3gz1YW1g3iRMpuCYVt1RYMsos4V4sDKqWJqkSZOCLOx/t1whs97x3jw/IBHjjX+5KOPehns9wfXrPRztTPTKDiCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSJylMq9ILoV3qHZ1u4fvmjxRMZHanCwwtwuJm/MxC4=;
 b=RJuJkBIT1A+hEpws99TwBZawbQ7klVd3439CnLNDlCt8gc72DrsSyokaK4d9Gd04b04s/hJt5oiSf9d0oMznVXSaVF3K+oPJ2SbyRfZq+C3n2d1sprfBhfG7ievjFWMUDrYMhuZFNHVORP5j94gujQHUW50u9sYTAHYz2azS7k+ditT5oVoqllArqIsRfgf9z1nOnW4kX/JHQUxV4LsrxYFiJlA7f+1+2JaOgZwT34tXEOv7v0q5E82VZy131aL8u8YFCk0XxXy/Tn6LTNewpkCBq60Y3EgED+wJ5apss+PRvZ6KgD9GIV0bkZfvjYDHYYyzjjK5g1eUlICcJ14XEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 04:45:23 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 04:45:23 +0000
Message-ID: <7d48d3e1-fcc0-4448-8c01-f99b2b972dd7@intel.com>
Date: Wed, 20 May 2026 10:15:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pm_residency: skip cpg-gt-toggle if GT not
 in C6
To: "Tauro, Riana" <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20260504202840.2572025-2-sk.anirban@intel.com>
 <b1fbe526-8898-4b54-8bf8-b6f72db818b0@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <b1fbe526-8898-4b54-8bf8-b6f72db818b0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::15) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CY8PR11MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: da46ea60-199f-4750-314c-08deb62a9a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|4143699003|22082099003|18002099003|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info: xrDVXVp+4vqxollwF+0iN/j/ex0GiIe5C/mOq2N8MYNNjywLwITKvu0htnfo8QHvcRwnT3UUG9+dW7GC04NSXCKSQ7DgUtqI3eLo9xu/R2PtIt8pOSMXd6R46odX5eFXLkhNRJQXboolvdXuMr+5D0d06Gxcwhj9CaDdnK01koRaaD/6yUTUnCYz5pqc7srUt8rpo7pnOqvK7ivBj5xzl1fmZXpZu+3/RzT6OEfM91ZfT+XggHJQ0pOwdRFOMR71qQUCq6sgqUo1nfgo7CpwHAcS0wG2vJnQ98S8uHzD64UPSBfL5pINbmzQB5hY+TOWDKOUfymTTOMxVpiGY+NYJ549il6+IRBJqG3pHLsGws34n/GfDeWpFDev/DZbMADhqafQtfTAyMsqr63IhFr+hypT+CMl7E+GZXS3+cPJo663+voyfnfDRrD8okJbdcyCtstRfyy/5X3zY67BigMuXdkMzuQPNbd3C0IdesQ6ZhXXWvszmaLP/1nbD9bhu+uFUbdZYUwk74ElyJao9YpKiXdsiG0dPpwVG9laCB8JmsjwybFsIAwLOsctf11wzv8C6YLkv5m0KgOsf4x8x53pJ3ttvI+/Nu15RVIzvYSTlfZ5ZEAYPhLNmSJhywunyyl+BGaWrrJ1ODTh2IfQuqpZ6dgjb2iMci3LqHEaNsiEDnXxY/FR5l24km/brJVgoAyI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(22082099003)(18002099003)(11063799006)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MktNYWZjMnQ5TXEzbFl2SW1YTnQvZ09rVktPVGRkaG92RmozeW9Ha2hneGE1?=
 =?utf-8?B?U0V4VlZ2UnRra1AvSUt2UFk5ZCtGOVhzaitYS1JvSkVaa3NpMm1xKzFQWXBm?=
 =?utf-8?B?L3hscTFSQjJqZ2UrQ1N6MXpUaXp3TGNmd1FHWC9yQk5TbFJHQmliTFFZYkps?=
 =?utf-8?B?dmJ3dTQweStmWTVIQ1FZbXE4d0xFYzVCYUJBcTdXREJWMDdZcGI3ODV1Y0Fj?=
 =?utf-8?B?RDdHNVl0dEc3c2V6cWJzS3MrTU9INGRDSGw1RlRyR0RPa290dVpCbUVCcGFq?=
 =?utf-8?B?Nm1ZNmNTa2hNZk94M043My9rK291Mmlld2lIWUwvVFd0QzVzNkl1RTRpS0VN?=
 =?utf-8?B?ZmlxZEd3eC9ndE9WSkhrZTB2enN6amF0NDNIWXBPM0s1cmVVMmIzK214MjJl?=
 =?utf-8?B?UW1icFBDNFRCOVB0djRRQWo5dmg1ZFpUc0dOclI5LzJDYi9KRHJZanczZ2py?=
 =?utf-8?B?eWR0QkdHZktGSEQyRW54YUNVbUljTjMybTU0VTlsZU51STE2RVhXWWxtMmJO?=
 =?utf-8?B?QWVuWm5xdWg3OWVwN3YvVlBxcXRmc2x1Q2RRSEF5cU1ycHY0am1PR1luZHF5?=
 =?utf-8?B?cmhEMkI0SUg4elNlNTZseXZXald5T0wzWStZN1RpYnNwdklZeEhHVDhjZndN?=
 =?utf-8?B?ciszaXlvK3M0b0tyOUtyc1drWE9JK0NaL05tVXBUTnluZUZMdzd1UGdLNFFv?=
 =?utf-8?B?V0R6YnRDOGhSY2sxY08rdldKTlV6RlBBVlQ0a3RQZW1uTEdPaXdidHo1V0Vr?=
 =?utf-8?B?ZGR1MDR3cWZ1MGtUREtXZHBLUlhEY0ovRkEzLzVVbmdzODVnU2w2NFFzb3Zl?=
 =?utf-8?B?WklURVFtc0ozWHUxRTJiczl4SDFaQ0Zza01PcmhNSGRlM1Z3a3kzMVB6Tk5P?=
 =?utf-8?B?bGlsSk12RjFLbmlnUGJHNlNCK0dtbXJHckVJcXpsNzJ6dmNHS2kyM0ZGWDAx?=
 =?utf-8?B?ZVBWcTF6NnlGYmZrYVZpK1kvQzJqM0xoVktsemtDV2VZOGNERVc2WlpoZzRC?=
 =?utf-8?B?MHFzRlZvVGZYN00rYXRKdjFzZG10R0hFYjNUYUJsLzdCTkFPUTEwMVh4WTlV?=
 =?utf-8?B?YUtiTC92VzEwZE01QWdhZ2RmbUk0TEpxdTB5dWVPQXYvL1FGY2ZYU1FtZkNE?=
 =?utf-8?B?bGpGbmZyV1ovei9SYW5wQUw3bkY5aFJpbWhlZ1BEV3B3N2hiM3ZlZjYrb3lx?=
 =?utf-8?B?UWxISVloMlMrK2xCZTEvTWRUcG5FbEtQTERkSnpoU3ZHWjFRem1JU3ZsRTFz?=
 =?utf-8?B?VDhYa2ZPdy8yeEtTOG5vMlhxdUpXZWhjNGxrN2VmS0c2NlN5dVo0RTI4cktv?=
 =?utf-8?B?eGpQM01tTjIwT21sS3M5SDNpRWNwUTNXWnorNm4xTUZVbXAwZWJWYVZqM244?=
 =?utf-8?B?RlNodk05NUxCKzJyKy9UTlZ4Z1ZwcEwxZGs0Z2w1NnNneGVxTXdLQVBSS3BI?=
 =?utf-8?B?YlQrNEU5MW9DcE8wZDFDbEVIQVlDYllzbzhUNGZZMFZVZ0dZTmkrNi9kUkhk?=
 =?utf-8?B?NDc4RVJEMDNRL2RVK0s0N1VUSHZ2NGR1czdCR1IyZ2piV3FYU05OOWpEcDRp?=
 =?utf-8?B?RkpxM2Z5ZjJ1bXdNU3pDKy9tY21PRDhWNjFubkNMUlpQNVdsQitXVURZU2Fv?=
 =?utf-8?B?TXJNOXVMUm9xTHFRdFNDUlpOLzdHb1ZJd0U2K3JFVUpHMm5nUEdHZ0I0MDhB?=
 =?utf-8?B?eTJtYlZGclEzNXE5TE0vSk8wVUduM2xVY2JQdFdxWkM3Wm1CamJrL1lld09Q?=
 =?utf-8?B?ZGpWZFU1c3FkUnNUY1lZZnlvZWlOeGVkQU9YY3hKYWVXcmtNRWtuRWhEVy9U?=
 =?utf-8?B?cE1HK2R1N0JjWENFekxWUVUwdm9qamMzU0g4cXhodW13L2tVVGUyWGF5QllD?=
 =?utf-8?B?blovcTRTNk4wU3NsckluOWx6SGhxMlJxKzhFRmZUTVFZWGNHaWVWUDF6c3RP?=
 =?utf-8?B?QUxPeHBmc0xsQUFSWmJQNUY2R3cvNkx2TnE0ZkRSRXhNU3FBTWtLUTJ5TWtu?=
 =?utf-8?B?dW5XR1pkRHJxWkdHdUxvcXlUenIwTGlndVVSTndJdzRtdElCRml4ZlJDYzUx?=
 =?utf-8?B?YzZtQ3Z6c1NRTDhWV2crOE5Za0FjanFNaThTOXBpWndpaGxyeTVGdWtFSTdD?=
 =?utf-8?B?YndYNVFvQ1lGYk94WUhQNlhPSm00NUh1cy9ia2VQd3pEa1U5OERMbnBhS3l4?=
 =?utf-8?B?eHRlbXlpVFlIbzVFZk1GWkJxVkFYSHRKYlYrTktNTlJWUmoxQTFKVUY0dzlS?=
 =?utf-8?B?ZS94ZmFhckNXVFlmalJZS0JOSGluRFlybUVMaTRIQlJId3luWnpSc1Y0ZXB5?=
 =?utf-8?B?NDIwQ3FJSDEzQWhldWNqUnVNNVFkU0JkR24wWUFJeU1FUE5BYWI2dz09?=
X-Exchange-RoutingPolicyChecked: D5GH5998iw+ivtQmrl/drsTAg8MM2srmRKO17yjXLnx8WJb8J8cYQe7gYjrweXwu2z2gesW48omYFpeKFkKdaUipqfQjOTNXZzO5VIo06BfKuhFhAZpu/xuVCdeTQK77xkDzr7YpLchBz4ZxZ+KnxXyADoJaUTUJQeYmcd3NbZ3TkrAc/Zski+ne6RueGdoJIkobKDoFMm5TH6Z0GxkRfJ9FCbuqhBLvgv/d9So1rj9PXveAs6XlHrve5pX2L9fsILwkSO1Qixe28dECnrDORWiLXCrDLqkQMZq+gygcdq8bsuYJXo45dgTohrWlKyCagMdZjleyBy17/HPqcIsPOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: da46ea60-199f-4750-314c-08deb62a9a49
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 04:45:23.1543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvU5tehTdSGlFMn0spHBlZT+Q/B2kKVVG0BAxbr08YOMkdjKH4taTJiqXlcG0SmYEsOvmK8o1MrrMElQaTuZgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7010
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

Hi Riana,

On 19-05-2026 01:33 pm, Tauro, Riana wrote:
>
> On 5/5/2026 1:58 AM, Sk Anirban wrote:
>> The test assumes GTs are idle before forcewake is acquired and 
>> power-gate
> The test requires GT to be idle?
>> status is validated. If a prior subtest leaves a GT in C0 (GT stays 
>> active
>> for any reason), the final power-gate checks can fail for the wrong 
>> reason.
>> Add an skip so that inability to enter C6 is treated as a missing
>> prerequisite.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_pm_residency.c 
>> b/tests/intel/xe_pm_residency.c
>> index 1eeabd509..bfae1f844 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -392,8 +392,8 @@ static void cpg_gt_toggle(int fd)
>>       int gt;
>>         xe_for_each_gt(fd, gt)
>> -        igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
>> -                 "GT %d should be in C6\n", gt);
>> +        igt_skip_on_f(!igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
>> +                  "GT %d is not in C6\n", gt);
>
> Do we need wait on here? Can't you just check if gt is in c6?
>
> Thanks
> Riana
Previous tests may occasionally introduce delays in entering C6, and in 
my opinion, there is no downside to retaining the timeout to handle such 
scenarios.

Thanks,

Anirban

>
>>         fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>>       igt_assert_lte(0, fw_handle);
