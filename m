Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0196CFF8875
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 04:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A6C10E08B;
	Thu, 30 Apr 2026 04:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9I6X7Lf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FA510E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 04:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777522206; x=1809058206;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eDiqQ6v9POPmP6QKRU9Aq2uvnTpGhklDG4UulWPQRI8=;
 b=j9I6X7LfS19QpdvCH8o3QliDysHiDTU2owdWiXGODh/RHJDnRKeILzVx
 eqVeD1YTfGtt1X5t7xfndWhrPbv1mRIuJN03QuVxddPKTRcTapKCckGCG
 rgaO61Er+XQLOt3LGydJkHI6C4dDFnGt/XZd2BgQuWuhIbvuRaDcFDUWI
 oCedBr5Jg21sh9gW481QT6XLtglfPcQJRNLywfFw8U1/YH7Zd+0Ih/utu
 k1Iduhb6yu49dzC11Gcp4OlNkQT88ep6MQcqgzSP62RULfkFc4WxWOabm
 PU29FbhDPvJBry1D2EloDEuat3GevefEgZgGc3XM9mVTDHIpFCd+ioJ7V w==;
X-CSE-ConnectionGUID: kNRD2DPbRWG2cKvK0xW6Hw==
X-CSE-MsgGUID: CruwqJ63QOCdvT2fnjn0ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81037116"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="81037116"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:10:01 -0700
X-CSE-ConnectionGUID: sW6kW4FSRCqNaDHWDQK3Tg==
X-CSE-MsgGUID: clP1gWqUSmObEFiGnopxkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="231323216"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:09:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:09:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 21:09:59 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:09:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbgWvQozlb42m/aICWp/ARvPGcD2JF6HY5Zxncr9ZaFbvK9UJpNiruJ/tyQQytgvbksitTHuIyV8yitL4jTTB3BH3vWMlm96e9s2f/pcAYv0VE4BA5imuIcc0UVg/oTBBnDNF/rQgR6+mEO6sUsFrKG/MnpDKvJljdbjU3K4KU3f4W/k4K32uAo0zsiTJ7fEZZR9C3DgIQUHNLms0CuLXFncLJSqDniUb2cJlb7e/ydhfqksEnQPtx+aaVBhWUdefUF8En66bw1R8DFyrKthNl0dloZn7M2LsGGR6mcqq2WTN6tvHJqCeKyN9Gv3a/FBdxqBk0/gxmRB4InokgEXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpABSSmqRyBl9BNjOLP8E+XzBi7nZAykQrfQEUQv5eQ=;
 b=O0HJK/idY+IVwN3Hvw91J6MR2xm5J00JhVovpHHR+9nOfXO2neouJRWv/45V5cGzrLZhDSRNYcoQNoH7OXvLM/bWgYFM9IIU1N7enNyQ9dDWVe5vD9/hqwSf6VOM7mrEQN8oBfL4eNl2JGsIOKJuIHZIOsgNVofO0ft/aKMXCzQpX72pP0iHY38C/ZJ6ssPfJVRvxr+cBHYlLrPNNQ8OpdHgJcgtUhBnpNz0PK33+1GalAPpNY5nmhFoHA7Wl5Rm6LT4PyjmLi9SVQMNgJPinfDNNp//hsshXe4aKXey/QEl9WwbeNb4Dk4TnDdloun1RmzmHin9JjxT9oJ6qauV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB6722.namprd11.prod.outlook.com (2603:10b6:510:1ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 04:09:51 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 04:09:51 +0000
Date: Wed, 29 Apr 2026 21:09:48 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] tests/intel/xe_exec_multi_queue: replace sleep with
 barrier queue
Message-ID: <afLWDMb8S-4XJGTo@nvishwa1-desk>
References: <20260429020856.1857656-4-niranjana.vishwanathapura@intel.com>
 <20260429020856.1857656-6-niranjana.vishwanathapura@intel.com>
 <f0bc0c401df059314353ab61d6139416933c9600.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0bc0c401df059314353ab61d6139416933c9600.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ad73b9-39a4-41a6-30e4-08dea66e5319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Lfu7ozNYmdO3Up6qB9NsJcCn+VRYKMzBmH3IGu27EeFMw02GFMtpH4CScDfHOacMkMYVUF/09y6L2ex97ebJeVpFzJcntJAyFaJC0nyJsUzP+Kj2Js0jtUEI34g5APs4cMqlW3UukZTVxswCJY/OKritwEAX7NCmeZdqjvrOOou5DgRmmWSmNbONN5jrIldaw3wWJBL687PycELwHYglnBEZSLKsuHSj1B4kaBOBdzVUOWtr/H9LMyxzi+PA2yY+cDXN/kN2pcPp3MZ3HkhUSoKIvyA8S1h973knMQoL9JIAx5yAEkmz6Pg8rJU3K7sxJL5aPFcWBPpyqrF0DyxrsDyj044veBi1vi19uxbdz9rPnXSRUWB8kcFagtGaOGR3e69M7JxLF67nExPmXLMiF0YdVP4lFKlXKx4pl7Q7vqmXtc5ZmFizrIVCb3HeC2H0unkX2KYmBWt2+BIUnlYJNswSx9qpuyumkKwJgKsyIV4KgEulubDQwR4WZoxsuMHGR4MUNr2j/oNSKN0UpOp3vDfLLXr5TbsUeHFgSu2uHKXV7k9MIVg2l828mq+a278cT5czLN8n93qdwk526MggGpiRydqj3hbAoLG4V+5dGMLU1Vf7l6U6STQQUZEx4i5S5e/2DwrcZNjHRjtK03Og8QdjcpLDbftg0YSYrg4zFw4fbxQlruS1svTUnVagFlg5f8uMqhiP1heAzYKInpDPdl1NVZjTbxTcOkIALTXqkfk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dClmU19vq6h7X0MlUX68TYOWG4itGNZDuGSL7ZKVOu8q2LneF3fJvTaPqK?=
 =?iso-8859-1?Q?Z2vCYy6SQ4dKDmTb8vZUZmJ3FOHQHLC18azI0S5hD5b3YzpRTx4IZcHZOR?=
 =?iso-8859-1?Q?Xo8bOg8pdztneHPCnHTmmLqPXWxwqANa4IzWlLVUv5HV6VSW3njojVdkNA?=
 =?iso-8859-1?Q?SHg0g4f3nuQAUWJw1lyg7cMc3vOWr32y4Pbw43kUUEEPi/DIngFKVVc427?=
 =?iso-8859-1?Q?RQuXYPzAMWcDcngQ2iXYOTO7Rh59F+EZFtle+DPLZ63bfwqaASRE7ICVb1?=
 =?iso-8859-1?Q?U8kd4Q4Bco1Lr5bRnu9OM2V1TGpJU9kNMkGvQK3Aglyf6F0NPIuRuOmyx2?=
 =?iso-8859-1?Q?xyaU51eLTunxiwEWAetQ7qPp6P0t2VdGp1duZjfJ0XIBL0Z8bnq5Y5YPR0?=
 =?iso-8859-1?Q?Z5sPw3gTRfLy6cSoBFD0kxiaKI9xLvLsWqLiItL4WmcJmqBCeWtW2Rx45C?=
 =?iso-8859-1?Q?nLlR4auJW7G56d8+jWxNELwu2mh8RK0S4renjuW44fGq7lyuWIjznF3x5Q?=
 =?iso-8859-1?Q?t329+pVAS3y4jvtF0UHxspoGi5c+LGicUMISIoAmecKNPFUc1NvIchLudo?=
 =?iso-8859-1?Q?t3X9oENxj3We1YHL1M0hH9nK1EB0PlwDczQbkDaYUEcMIjUwC7APuJKOyo?=
 =?iso-8859-1?Q?UzOgCNui7CiADDgQ+Wts8LyLydBBf+i7z9FGphBEgYgaEqiINel3giF5O/?=
 =?iso-8859-1?Q?RENIbRg2vcZNVsNy7C+4q71zq16Wd3MhyDL4T4xASysDIZicxB9poV/IMv?=
 =?iso-8859-1?Q?n3yDRPO39JM3A2DUNwsY7BCvvMngHyJoECvW1d1z47zS1f+6c9vj6jQIjn?=
 =?iso-8859-1?Q?FIC+Mutt+II0h/BhHG8pOrHm9yX11bHGJZ4AzDFravFugmzEtqkQRMifgm?=
 =?iso-8859-1?Q?HN2LzkgR57djWpRYSIp/i5DnCKUSCtVy16CXgz3/5LUVzJvvE2ollRA+Kw?=
 =?iso-8859-1?Q?hztCqcFkvBkiK/EvqrfPurArUJCdnJzYOSa4NV4hrgyDWYNftD2dPXbP4+?=
 =?iso-8859-1?Q?H204Xx0jR1o9HhucoHm3/1Jgm01fm+FBrDUqXFkLwiWBTQTsPEzglE3BhI?=
 =?iso-8859-1?Q?PAYDM8GDrDISWMgXxZGMZ8ZIbwFUOK2RIb+kueWtaoguelm8wMinNE1MjY?=
 =?iso-8859-1?Q?5lahkspNnJgPjVk1fnr6GDfm0e+C1wabWs4Z9GetW8EjlP6UpGnSDsKhry?=
 =?iso-8859-1?Q?8dC4r7btMuWqDkdF5USxAW4rLTZlLAYErBzFJHUi/ISCKeeGFJIBsp7Zg6?=
 =?iso-8859-1?Q?5JhAflP5Ceb2jzL3yUN/wthl/u/d8KmvgDmT0m9QMAjyCCgVbNjd0kDA3N?=
 =?iso-8859-1?Q?fXHaSG8bjPFyUFl1vGlY9JfVSEftXRXw/LoYPD0wVsyk/SqDXunNEgOBpI?=
 =?iso-8859-1?Q?p44thhRDETQ/yZmVIVmFLVMIkrzN6M5piXW0+52TjKultsWXnVAwYl358o?=
 =?iso-8859-1?Q?UEj9EGxqklIKp577Ok+yKJfPGkOHS3VnvWEUz6zT+gOaEMulrl/ET6FfdI?=
 =?iso-8859-1?Q?eAxkcoh27OWJ6Ls89vtu/UaIkVi1eChBmt8hfZ1ZXUq2xZwIKrplz5vTcB?=
 =?iso-8859-1?Q?M2jYCnzdrgOYS6Yla5T82IvQvGe8MSc29scFyouXGbhHLG5jr/d7R/WGyi?=
 =?iso-8859-1?Q?9FVwPfgXxCVGQKtyzfiZhveihn0Z9Js6F2JsZx+AGR+qhkgTglRKYkSOnh?=
 =?iso-8859-1?Q?4K7opEp4btRtBg8cvwEqK0+90iSd5Piv/rSGuMMG3Cf5SURJQrIMWw46NU?=
 =?iso-8859-1?Q?Fvt1f7+VqUc/HS/YaLrVrlqItd5CA8BH9PvzVpxpEBsL3sj3rwJPbBHAhx?=
 =?iso-8859-1?Q?B+EeUzaxxy7Tp/NUDcLXDveAeMIgSnU/Pb7R5ay/UFCpdVrN0Ms/?=
X-Exchange-RoutingPolicyChecked: TxE6m82iR/YVU/j8nq+TnLqHsT6ENw4PXCrb9/UJ7jpjjO09Bpz3wLMiJzy7RWnN8y4PYb0eQGbgou/AyPwQQ2kOOrcGmz9CWNqrMUzXBBxOSujVBaq1KzLNy0/nDyytfTX+zO8+napzXPUJbIEdNzE2ZSHDTHnUYvP1Kp+Ppq+IRJGCsshemz1zkmpLAXEiUC6Br5TLOe+5AtyUlLAJ5vW+aiE6JrHCauJKt7Wm7mNZCExWdYqErqwXrOS9B1IXo6GE+Px4vmaT5tcdLfd5ZC5C46csMcvaHzfIZEP4wRAXOnNIASjZBZqy0uB/9/k59mbKZTCcPPWL+O4Qog1QUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ad73b9-39a4-41a6-30e4-08dea66e5319
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 04:09:50.5461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmaW5XrM0VwJ/qICpfsMl32KN30qXKgORFXDpvyNTq/Ge5jRqjzIk6WN9neOC/l++TetsMATpdpT2ywokfqw5LbEZKCoIcjtCNydnyzrorrOfBHJC4yTUj5G3psduXOc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6722
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

On Wed, Apr 29, 2026 at 12:28:09PM -0700, Summers, Stuart wrote:
>On Tue, 2026-04-28 at 19:08 -0700, Niranjana Vishwanathapura wrote:
>> In __test_priority() DYN_PRIORITY case, replace sleep() with a
>> deterministic barrier using an extra queue in the same multi-queue
>> group. After assigning priorities, submit a spinner to the extra
>> queue, end it immediately and wait for its user fence to signal.
>> This guarantees a full scheduler round-trip confirming the priority
>> updates have taken effect before releasing the other queues.
>>
>> Increase exec_queues[] and spin[] array sizes by 1 to accommodate
>> the extra barrier queue slot at index num_queues.
>>
>> Assisted-by: GitHub Copilot:claude-sonnet-4.6
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  tests/intel/xe_exec_multi_queue.c | 37 +++++++++++++++++++++++++----
>> --
>>  1 file changed, 30 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> index 382705d065..8c6fbb2d18 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -381,8 +381,8 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>                 .syncs = to_user_pointer(&sync),
>>         };
>>         uint64_t vm_sync = 0, addr = BASE_ADDRESS;
>> -       uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
>> -       struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
>> +       uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N + 1];
>> +       struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N + 1];
>>         uint32_t vm, num_queues, num_queue_priorities, bo = 0;
>>         uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] = { 0 };
>>         int64_t fence_timeout = NSEC_PER_SEC;
>> @@ -403,7 +403,7 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>                 .value = DRM_XE_MULTI_GROUP_CREATE,
>>         };
>>         uint64_t ext = to_user_pointer(&multi_queue);
>> -       int i, j, sleep_duration = 1;
>> +       int i, j;
>>         void *bo_map;
>>  
>>         num_queue_priorities = XE_EXEC_QUEUE_NUM_PRIORITIES;
>> @@ -415,12 +415,12 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>                  eci[0].engine_class, eci[0].engine_instance);
>>  
>>         vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> -       bo_size = xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
>> +       bo_size = xe_bb_size(fd, sizeof(*spin[0]) * (num_queues +
>> 1));
>>  
>>         bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>> eci[0].gt_id),
>>                           DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>         bo_map = xe_bo_map(fd, bo, bo_size);
>> -       for (i = 0; i < num_queues; i++)
>> +       for (i = 0; i < num_queues + 1; i++)
>>                 spin[i] = bo_map + i * sizeof(*spin[0]);
>>  
>>         /* Use the default priority for Q0 because we are explicitly
>> waiting for it below */
>> @@ -430,6 +430,11 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>         if (flags & DYN_PRIORITY) {
>>                 for (i = 1; i < num_queues; i++)
>>                         exec_queues[i] = xe_exec_queue_create(fd, vm,
>> eci, ext);
>> +               /*
>> +                * Create an extra queue in the same multi-queue
>> group, used as
>> +                * a barrier to confirm priority updates have taken
>> effect.
>> +                */
>> +               exec_queues[num_queues] = xe_exec_queue_create(fd,
>> vm, eci, ext);
>
>Sorry for the multiple responses here...
>
>I realize you're doing this separate line explicitly so it's clear what
>and why, etc, but we're really just duplicating code here when we could
>have a num_queues + 1 in the for loop here. The comment here is the
>interesting part that will let us know in the future why we have that
>extra one (in addition to the commit message of course).
>
>Not a blocker, but I'd prefer to not change the inner portion of the
>for loop and just add the + 1 plus the comment above the loop...

Claude genreated this way and I kind of like it as it has required
comment above and a matching xe_exec_queue_destroy() below.

>
>>         } else {
>>                 struct drm_xe_ext_set_property mq_priority = {
>>                         .base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> @@ -474,14 +479,28 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>                 xe_spin_wait_started(spin[i]);
>>  
>>         if (flags & DYN_PRIORITY) {
>> +               uint64_t barrier_spin_addr = addr + num_queues *
>> sizeof(struct xe_spin);
>> +
>>                 /* Assign increasing order of priority for secondary
>> queues */
>>                 for (i = 1; i < num_queues; i++)
>>                         xe_exec_queue_set_property(fd,
>> exec_queues[i],
>>                                                   
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>>                                                    i %
>> num_queue_priorities);
>>  
>> -               /* Wait for priorities to take effect */
>> -               sleep(sleep_duration);
>> +               /*
>> +                * Submit a barrier job on the extra queue to ensure
>> priority
>> +                * updates have taken effect before releasing the
>> other queues.
>> +                */
>> +               xe_spin_init_opts(spin[num_queues], .addr =
>> barrier_spin_addr,
>> +                                 .preempt = true);
>
>Why are you setting preempt mode here?
>

Claude added it and I thought I removed it, but obviously I did not.
Let me remove it.

Niranjana

>-Stuart
>
>> +               sync.addr = barrier_spin_addr +
>> +                       ((char *)&spin[num_queues]->exec_sync - (char
>> *)spin[num_queues]);
>> +               exec.exec_queue_id = exec_queues[num_queues];
>> +               exec.address = barrier_spin_addr;
>> +               xe_exec(fd, &exec);
>> +               xe_spin_end(spin[num_queues]);
>> +               xe_wait_ufence(fd, &spin[num_queues]->exec_sync,
>> USER_FENCE_VALUE,
>> +                              exec_queues[num_queues],
>> fence_timeout);
>>         }
>>  
>>         /*
>> @@ -566,6 +585,10 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>         for (i = 0; i < num_queues; i++)
>>                 xe_exec_queue_destroy(fd, exec_queues[i]);
>>  
>> +       /* Destroy the extra queue */
>> +       if (flags & DYN_PRIORITY)
>> +               xe_exec_queue_destroy(fd, exec_queues[num_queues]);
>> +
>>         munmap(bo_map, bo_size);
>>         gem_close(fd, bo);
>>  
>
