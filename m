Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C31F9EDD9
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 14:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A3E10EA0C;
	Wed, 22 Apr 2026 14:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGdYhjam";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E913310EA0C
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776866583; x=1808402583;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=3HegxBTc6NIuBNh51ZpyIICuTajAdVMMMzkKbqvjHTc=;
 b=KGdYhjamJqocUtA8Ll3wW5oIZZ5k1YyQQTeqSzR1C/tB0xI1Ibjwax8O
 SnyAOM86yd+ndUyxfcQgS0L6Yam9n0SxwcIrOd7PohP/htvMFQTWyca5B
 +kQD8njEWT1SnQ8RpNhRyv66mwI5ZPDypOXgqr9hwTihkUYTi0FroAMGG
 cmesbOBLZyvLF9RK5Qo+6wVHNXT5V9JbhDd1iEHzs+6yKOziprUyN/FKM
 lqC8AU3lpS8HADRn26LXnyJqykYu9GRL1XRMrxfRDlmg8fnvPPfFsqOqz
 x7FB6NNCIzOgL008/QpKwT6v4zDXl4VHvFmPK1OaCNnEc9uVNSp378ZOB A==;
X-CSE-ConnectionGUID: SXQGEF0ESum5cjiwmGmBHQ==
X-CSE-MsgGUID: tc5aZu4hSe6iUHvoVzTFzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="76980518"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208,217";a="76980518"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 07:03:02 -0700
X-CSE-ConnectionGUID: 9AmMeSQ4TCiNjgeV3cy6pg==
X-CSE-MsgGUID: mPnNzwiEQcCNp77MOU6x0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
 d="scan'208,217";a="236358839"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 07:03:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 07:03:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 07:03:01 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 07:03:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLW2Q8RdDta2u2/3vMYPAOpK1kUtQmWDQ3md28aAN5cPasyZPTJL369yXCwAtSwpLc6nmQmjONScuIFmk1otySN3bPqNnlQRaf5EzkuMNElYP7RmaQi68PZ+MqwDDCdz2MtRbnh+jKtrX2F8HVKBEk0WnFOfeUzDt2VL1uPMh7ibcJNxeRh3NoixmiQMaaLUeIOow/+eHZXAIWyHOQZWZ57ZKmdBPuoKtwIAvDQHimvDPqM1wafgOdpVoxZCVbcAoShp60P9XxfvoZo0PCDqX3dAX9ADBFe+iV/6PbMRcRqWlqYxwTRPHR21rt+HH2C2kKSbzpltP6QbfQL7Lwxl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZXwEVjKum2+qm6MVFREv1Zu2DpEP3W3CKz7qR59nd4=;
 b=ag5hxMrURSCewD+smypNxkvAVpqBAbIP3uBBsbwvlZAwaK963UKZWtEME04eAff+t99g5OUAqOMH0thBF0j3EoWHh7JcgdcPXLbbJI3Pf5rmYQmd8y0kcUdyoNPOZfgHCoasSBes0YC1fhhuXOlkN9t1HeAz96auepqR2AlxDPV4a+f8lIsFAXh39JXccQEps2tbroMzM/0a3zv31H1hrlUg8IovFO0g18QzqsnU75YvelVJ51I23NJpTTuJyjmIZf+4pbnCsu4PkzXBj29ztTgH9OH28128AR0uBuhdn27hnTuoRWWJguFqg08B9yeIfiHv+KPD1JWrfbyrStkv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 14:02:55 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece%4]) with mapi id 15.20.9818.017; Wed, 22 Apr 2026
 14:02:55 +0000
Content-Type: multipart/alternative;
 boundary="------------gFXv7ODDlybx30446zUs6PpI"
Message-ID: <2d118a24-614a-4f8f-8609-f603e2d4122f@intel.com>
Date: Wed, 22 Apr 2026 16:02:51 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBpbnRlbC1jaTog?=
 =?UTF-8?Q?Block_SR-IOV_tests_on_i915?=
To: <igt-dev@lists.freedesktop.org>
References: <20260413112013.102762-1-jakub1.kolakowski@intel.com>
 <177613185587.459820.5905134405971508130@a3b018990fe9>
Content-Language: pl
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
In-Reply-To: <177613185587.459820.5905134405971508130@a3b018990fe9>
X-ClientProxiedBy: VI4PEPF00000164.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::873) To IA3PR11MB9304.namprd11.prod.outlook.com
 (2603:10b6:208:57d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9304:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 4437e82b-f6c5-4395-d26d-08dea077d9c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|56012099003|18002099003|22082099003|8096899003;
X-Microsoft-Antispam-Message-Info: qNV/cfTircUtVMrgYpNEQbnjlOUeMwxuQBJHuDDdmgm3WlQAhUmwe5DIh32SNUN7btYa0LCl8145BmszjhwhaHg8UTx8eEEX2PCQlIXAGOjgUcoJKLaDfGUtShvM4halkyHguga0nxzFWL7d+cjtljcN6bqQqhMIj7gBiLgydJIRcYJhZh/s1Zo+i0coo69VKthRyOLh5/S2To6J06x23HmahCeyh72pcSQYDJUXrv1S7Q5iGxt01jkPv92wHYx0amfPaa9VLP2re/A45kbMRW7/skXpMnxXp2PP2osXoXtnjVVzPFJwHAQY2lFHyA8vQU5BIN8zaFsnxduH+o5U2oTfoz1+j968M5b0bIApIIfXPnAR65CHGNWCRm6J2uBg2fsEp/mHDWeBLOxFS8BFNpZV+UcJvIRMcMv75ih7LcWAPm5FCZspGJQ4Rrs1cfg3i+BYZpb/bH2aLmTInlm8qYf+THZmQfbPT8ixF/TKzADGCpzrqXp29eMVLQwrqtpz9mXlvYRjWWRBYfcsDlp5DaS8gSQJFST0dsjoS+vUAcOChVM9BPhiBiugoHEGWKCUxHBngmV44dnz+BRvp7wWeqI/QLE1IfN8egbCxTS9Kt2POYBM9SeGM06choaO7i03Ci7/zOmwe8YVa5OQhzlii4kNlwgqzj44L/tLjWG+NEL8+zT8Zbjn4Cdd5wpLAgcE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(56012099003)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzg1bVNlVm5TN0JvczZHdGxyRVdpMW9rajhNZndTM284ZGtKZnhyTDI3MWdu?=
 =?utf-8?B?YkRxYVVqWVM5UHlXMDJVTVNzZll5aWxxWjJSRVAwSTV4Z01zRmt3NTJwZXdF?=
 =?utf-8?B?b0ZhekhzbTlWNEUxQURROXhXVzNjU0Z1RnBjZkFZZlFEVlB3dGpIRWhweDI4?=
 =?utf-8?B?Ti9xMjJnaWFPUEV4alZZMktRcVl3RkRHcGUzMHBaWlQ1aTkydFkvTWFuTk1w?=
 =?utf-8?B?dzFPWE0yMHNNS2tyTDhiUkhTN1M2d1REM3dWVWt3T0tZZkZpK0Z2Zm5uNGZt?=
 =?utf-8?B?N2NhRld4TlpzTzhqQWdHZDhrUHM3ZVY1ZzViTEhkVmNYV1gxSXFZZXZNT2lG?=
 =?utf-8?B?Y0xUaXR2NzJoa25BMUpZVEEvb1JsNnpqL1NWY0Z0Nk1QMnV2bWtSL1Urem5n?=
 =?utf-8?B?NXBPZHp3Y1hRS2JKNE9SeFBTZ01namt2QkM3SzdDbHpsdjVjcnBTV2tVTzJT?=
 =?utf-8?B?ajVkeEk4UUpLSE1LSlhjUWxPajAreFNwMURVa3RHY0FIZTdLNWlXTElQSE56?=
 =?utf-8?B?VGhVai9ZOWNsUEVXUlladjRWM1cyakZQb0RhaXhzM3lsYXI2ZnU0Zk5QcTBS?=
 =?utf-8?B?QTY0em1lTDNQQk1GdS95cS9KUXFpQjlXRTlpRmlveEozN3VEdTVkZ0hCUm9u?=
 =?utf-8?B?UytYeUU4K2JLYVRyVVRucXVxZUlGbXRIT056enVOSmp3TTYydk5CN3R6VDdt?=
 =?utf-8?B?RHNWUVh3UmkyVCtxVENPS0JuVXEwL0VRaTV5YW5nKzJpaWtHK1dLN0Z2QUF0?=
 =?utf-8?B?Qk11aGRabTg4anpEaWg5cms2Qnhqb2lLbHB2RTRmVmptUVdjTDRHbm9VM25h?=
 =?utf-8?B?bzI1ZHBna3lXNUIrQVdmR080OWltWHZ1R2ZiQUdHSkc1MGJzbVBPSVRnVXJ4?=
 =?utf-8?B?aXBmVUwwbU1zMkpFeU5JWTZYd3NsdHVSWVZBd09vVEJjVWwzUjRtUmI4UklG?=
 =?utf-8?B?UURNRkdyRXJ6VnVpdXdVaFVXdXBQZkI0UHA3TjRadktSZWdEQWxiMVBYN0hr?=
 =?utf-8?B?K04vSTVDckZlZnBYa2k4WmU1SUN6b0xBYVdwQkg3aGltYkIyQVpnS0UvVGlR?=
 =?utf-8?B?Z3VNclcxWk9Ham0wRXVCN3pGY1c3eTh4eUtiQlhKR3JLNndIcGtPdU9KWEln?=
 =?utf-8?B?TFArUklvTWp1eUVYYyt3VWtBcFMzcExrQ0JmZ3dnNk9kY2FQcUpPUzNaWTcw?=
 =?utf-8?B?QWNjU1lWMGlaVHhvQVMvOTlrViswQ3c0c1VlMGpLTHVvU2tCblY4a2JEQThw?=
 =?utf-8?B?a2pkZnZkU1VhQmJTcDh2UHJ5WWJUUWFsSjBKZGRJN2c4WFdGYXVvNHcrbHB2?=
 =?utf-8?B?VFhyWXBmL3NsZ2ZhR21wdUVURndQTHFXbVNxT2ZHU1oxR205eVZiSUUzSmZ5?=
 =?utf-8?B?ZUw1dmdVK20yRFU5Q2dEOG5pMGhWbE1XQm1mdnlvejJOUHdNS0tDcW9CclBK?=
 =?utf-8?B?SHRJUDQveXFiUjE5aU1NM0dNU3hLSW5YSUlBTVdzRWtNS0doSHNJR29wZzNz?=
 =?utf-8?B?MW9lSi9Xc1BRbE5GRDVKMWZEVHVBOEpvc2djd2JwWWtqc3kwNUdiTkJid3JV?=
 =?utf-8?B?OVR6dlpKM1RKUUw1a0hTMEREWXRRanJ3eXlGc3ZiY0RzTzBhanNqaUlLcE9n?=
 =?utf-8?B?QlV0M2hCREZnUWRiWGgwUEtabzFSYW5JdVdYZ0pVdnlJcjMvSHM0c0dWdHR3?=
 =?utf-8?B?eDErcDRKbzNndWVBZzVicTNrNitPM3A3aWlvSlkrYWh0MklBaE80TUhvdGZC?=
 =?utf-8?B?eDJOaVhDMlU4T1ZRM0lxYnlpQm1PNTZ3NVFZdHhuOWZ3bVhVYmRRSGk2aysw?=
 =?utf-8?B?S3VUUVNZTFRXdFVTbmJ0U21nTFVyaU5WWVJ5UldrTnFnelVkOEttTFpGSUpD?=
 =?utf-8?B?NzlWOWd0MVg4Nmc3cDJqUlBISFVVelBnSVVnY2hJWUJvaysxTGh6c09qZjdD?=
 =?utf-8?B?dk5odjBmSWVvVkJZYWdBcEhsbVVmajhYYldNMWR5WWJVOHFwV1Z2NkdQWUlS?=
 =?utf-8?B?QVErZml6dDJWVVBSRlE4bjg0NU81eHlxTE9yaEJtUjA4VzFyY2FkaHVUUVJn?=
 =?utf-8?B?UU00ZlNHZEN2ZmY1bVdIMnNzbHRJdTZVdzN3NHRqSkp0U3pXOWRVZEMyNkho?=
 =?utf-8?B?Mms5Q3F6WFIvRVpnbHVNZEJQaTJEU1kwaHZHdlYxaXVDVmtJYjFta0Vodllj?=
 =?utf-8?B?VUdCMFlMR0lNd0xCbVJDUk4vTnRzdmlaclZCeHBCQzl2cDdFQkF2dVRwdkFK?=
 =?utf-8?B?cUNNdVVBWVI0d09lUk4xVnJaMGhQbVRmZUU5L3laUXJadWRma0JVcjNEMnRj?=
 =?utf-8?B?MjIxM21DeVpDNk92ZUMzL2pBWUtnbS84Y2RTRDN4d2FhUngvMG5QdXgzNmN3?=
 =?utf-8?Q?Mecwxb5mLXEQiueU=3D?=
X-Exchange-RoutingPolicyChecked: AzXXYIlo/bseoR5MEi7qXBRbFe7Gtf93Bex0OiPi9kR0JP1lMrJMDHR2D103F7goPY1+EqiJUdSU5Zr0Z0ASiAxNlegs4G4SoXbyBhVfxeWwFCKFvjvpitVVtOGEPFqw30p/b//EMF7FOD29VJi5bKAqNsIr29EQw2F++3+4e0BUlshGKCR+X3LcL2zGhCU6EROVrqQMX8p1Q3RJ2SgGczhSX3zLCL+nsuEn2iAFx1K+PLz4DBvOt1z2CjzNOczVLm2iIyM1d3K8C5VI4V1x9QloBnu6VGxnrYS4xznqdtHhQS+4xUVbirtDzJB5mkAOOjrzJuJdn9eeNimbCM5CaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4437e82b-f6c5-4395-d26d-08dea077d9c2
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 14:02:55.1984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ai7U0wlDtl7cEa+hV/mTZBS3D74dCyKhyM+ASiZAVe8a0Z5q0+FFK/WkTS2SwBcDnPwwHY04uxIN+QStK4t+rJ4tpXcE+lSP/3uAAe8LUWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
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

--------------gFXv7ODDlybx30446zUs6PpI
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 4/14/2026 3:57 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	intel-ci: Block SR-IOV tests on i915
> *URL:* 	https://patchwork.freedesktop.org/series/164787/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/index.html
>
>
>   CI Bug Log - changes from XEIGT_8854_FULL -> XEIGTPW_14970_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_14970_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14970_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14970_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html>
>
unrelated - patch blocks SR-IOV tests on i915 blocklist
>
>  *
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_14970_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658> /
>         Intel XE#7360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#7679
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (Intel XE#7659
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7659>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-green-to-red:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-5/igt@kms_chamelium_color@ctm-green-to-red.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306> /
>         Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-256x85:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309> /
>         Intel XE#7343
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1
>         other test skip
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html>
>         (Intel XE#7179
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +3
>         other tests skip
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#6911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911> /
>         Intel XE#7378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378>)
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#6900
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900> /
>         Intel XE#7362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#7591
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#7340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340>)
>  *
>
>     igt@kms_psr@fbc-psr-sprite-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@kms_psr@fbc-psr-sprite-render.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>  *
>
>     igt@kms_psr@pr-sprite-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@kms_psr@pr-sprite-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_rotation_crc@bad-tiling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-8/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904> /
>         Intel XE#7342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342>)
>  *
>
>     igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-lnl-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874> /
>         Intel XE#7305
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> /
>         Intel XE#5813
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813>)
>  *
>
>     igt@kms_sharpness_filter@filter-scaler-upscale:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-upscale.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>  *
>
>     igt@xe_compute@ccs-mode-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html>
>         (Intel XE#1447
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447> /
>         Intel XE#7471
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7471>)
>  *
>
>     igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-8/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>)
>  *
>
>     igt@xe_evict@evict-beng-cm-threads-small:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-2/igt@xe_evict@evict-beng-cm-threads-small.html>
>         (Intel XE#6540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2
>         other tests skip
>  *
>
>     igt@xe_evict@evict-small-external-multi-queue-cm:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@xe_evict@evict-small-external-multi-queue-cm.html>
>         (Intel XE#7140
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140>)
>  *
>
>     igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-4/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind.html>
>         (Intel XE#7482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>)
>  *
>
>     igt@xe_exec_multi_queue@many-queues-close-fd:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-8/igt@xe_exec_multi_queue@many-queues-close-fd.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>  *
>
>     igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-6/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>         (Intel XE#5625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +1
>         other test skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>)
>  *
>
>     igt@xe_prefetch_fault@prefetch-fault-svm:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@xe_prefetch_fault@prefetch-fault-svm.html>
>         (Intel XE#7599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599>)
>  *
>
>     igt@xe_query@multigpu-query-topology-l3-bank-mask:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130> /
>         Intel XE#7366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#7571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>  *
>
>     igt@kms_vrr@max-min@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-lnl-1/igt@kms_vrr@max-min@pipe-a-edp-1.html>
>         (Intel XE#4227
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@xe_configfs@engines-allowed:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-6/igt@xe_configfs@engines-allowed.html>
>         (Intel XE#7725
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@xe_configfs@engines-allowed.html>
>         +3 other tests pass
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html>
>         (Intel XE#5625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html>
>  *
>
>     igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html>
>         (Intel XE#5937
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-1/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html>
>         +1 other test pass
>  *
>
>     igt@xe_sriov_flr@flr-twice:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html>
>         (Intel XE#6569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729> /
>         Intel XE#7424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424>)
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-7/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-9/igt@xe_module_load@load.html>)
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457> /
>         Intel XE#7405
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405>) ->
>         (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-2/igt@xe_module_load@load.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-6/igt@xe_module_load@load.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-6/igt@xe_module_load@load.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-6/igt@xe_module_load@load.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-6/igt@xe_module_load@load.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-8/igt@xe_module_load@load.html>)
>         (Intel XE#7725
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725>)
>
>
>     Build changes
>
>   * IGT: IGT_8854 -> IGTPW_14970
>   * Linux: xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5 ->
>     xe-4897-c8bad7becc008716c8475847328c549e178c813c
>
> IGTPW_14970: be03cd284c36013396122d682b5e5d2377cedf60 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5: 
> 3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5
> xe-4897-c8bad7becc008716c8475847328c549e178c813c: 
> c8bad7becc008716c8475847328c549e178c813c
>
--------------gFXv7ODDlybx30446zUs6PpI
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/14/2026 3:57 AM, Patchwork wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:177613185587.459820.5905134405971=
508130@a3b018990fe9">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>intel-ci: Block SR-IOV tests on i915</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/164787/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/164787/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14970/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8854_FULL -&gt;
        XEIGTPW_14970_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_14970_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_14970_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_14970_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3=
:
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@p=
ipe-b-hdmi-a-3.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html" moz-do-not-send=
=3D"true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    unrelated - patch blocks SR-IOV tests on i915 blocklist
    <blockquote type=3D"cite" cite=3D"mid:177613185587.459820.5905134405971=
508130@a3b018990fe9">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_14970_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-asyn=
c-flip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658" moz-=
do-not-send=3D"true">Intel XE#3658</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7360" moz-do-not-send=3D"true">Intel XE#7360</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-10/igt@kms_bw@connected-linear-tili=
ng-4-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679" moz-do-not-se=
nd=3D"true">Intel XE#7679</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.h=
tml" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-2/igt@kms_ccs@crc-primary-susp=
end-4-tiled-bmg-ccs.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7659" moz-do-not-send=3D"t=
rue">Intel XE#7659</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"tru=
e">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-bas=
ic-yf-tiled-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true"=
>Intel XE#2887</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-green-to-red:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-5/igt@kms_chamelium_color@ctm-green=
-to-red.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE=
#306</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
358" moz-do-not-send=3D"true">Intel XE#7358</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Intel=
 XE#2252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@kms_cursor_crc@cursor-offscre=
en-256x85.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Intel=
 XE#2320</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-at=
omic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@kms_cursor_legacy@2x-long-non=
blocking-modeset-vs-cursor-atomic.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-=
not-send=3D"true">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7343" moz-do-not-send=3D"true">Intel XE#7343</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1508" moz-do-not-send=3D"true">Intel XE#1508=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@kms_flip@2x-blocking-absolute=
-wf_vblank.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send=3D"true">Inte=
l XE#1421</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible=
.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-2/igt@kms_flip@flip-vs-expir=
ed-vblank-interruptible.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send=
=3D"true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflec=
t-x:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@kms_flip_scaled_crc@flip-p016=
-linear-to-p016-linear-reflect-x.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179" moz-do-=
not-send=3D"true">Intel XE#7179</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-=
mmap-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
-1p-offscreen-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz=
-do-not-send=3D"true">Intel XE#6312</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-bl=
t:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-no=
t-send=3D"true">Intel XE#4141</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-ful=
lscreen:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz=
-do-not-send=3D"true">Intel XE#2311</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-b=
lt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-n=
ot-send=3D"true">Intel XE#2313</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:=
</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-s=
end=3D"true">Intel XE#656</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6911" moz-do-not-send=3D"true">Intel XE#6911<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378" =
moz-do-not-send=3D"true">Intel XE#7378</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-4/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6900" moz-do-not-send=3D"true">Inte=
l XE#6900</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7362" moz-do-not-send=3D"true">Intel XE#7362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-6/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7591" moz-do-not-send=3D"tru=
e">Intel XE#7591</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-3/igt@kms_plane@pixel-format-4-tile=
d-dg2-rc-ccs-modifier.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-not-send=3D=
"true">Intel XE#7283</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-9/igt@kms_plane@pixel-format-4-tile=
d-lnl-ccs-modifier.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-not-send=3D"tr=
ue">Intel XE#7283</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send=3D"tr=
ue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14970/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send=3D"true">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/734=
0" moz-do-not-send=3D"true">Intel XE#7340</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@kms_psr@fbc-psr-sprite-render=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2234" moz-do-not-send=3D"true">Intel XE#2234<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" =
moz-do-not-send=3D"true">Intel XE#2850</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@kms_psr@pr-sprite-render.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-tiling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-8/igt@kms_rotation_crc@bad-tiling.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">Intel XE#3414</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" mo=
z-do-not-send=3D"true">Intel XE#3904</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7342" moz-do-not-send=3D"true">Intel XE#7342=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-lnl-4/igt@kms_rotation_crc@multiplane-rotation-cropping=
-top.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@kms_rotation_crc@m=
ultiplane-rotation-cropping-top.html" moz-do-not-send=3D"true">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-n=
ot-send=3D"true">Intel XE#1874</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7305" moz-do-not-send=3D"true">Intel XE#7305</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-1/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send=3D"true=
">Intel XE#1127</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5813" moz-do-not-send=3D"true">Intel XE#5813</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-scaler-upscale:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-7/igt@kms_sharpness_filter@filter-s=
caler-upscale.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send=3D"true">I=
ntel XE#6503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-5/igt@xe_compute@ccs-mode-basic.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1447" moz-do-not-send=3D"true">Intel XE#1447</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7471" moz-=
do-not-send=3D"true">Intel XE#7471</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:=
</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-8/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-vram-target-sram.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636" moz-do-not-=
send=3D"true">Intel XE#7636</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-cm-threads-small:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-2/igt@xe_evict@evict-beng-cm-thread=
s-small.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6540" moz-do-not-send=3D"true">Intel X=
E#6540</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/688" moz-do-not-send=3D"true">Intel XE#688</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@xe_evict@evict-small-external=
-multi-queue-cm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7140" moz-do-not-send=3D"true"=
>Intel XE#7140</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebin=
d:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-4/igt@xe_exec_balancer@many-execque=
ues-cm-parallel-userptr-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482" moz-do-no=
t-send=3D"true">Intel XE#7482</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer=
-mmap:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-8/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-basic-defer-mmap.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-d=
o-not-send=3D"true">Intel XE#2322</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7372" moz-do-not-send=3D"true">Intel XE#7372</a=
>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"=
true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-2/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-imm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-do-not-send=3D=
"true">Intel XE#7136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@many-queues-close-fd:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-8/igt@xe_exec_multi_queue@many-queu=
es-close-fd.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send=3D"true">Int=
el XE#6874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-basic:</p=
>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-6/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-se=
nd=3D"true">Intel XE#6874</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-sing=
le-vma:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pa=
t-idx-uc-single-vma.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-2/igt@x=
e_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html" moz-d=
o-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5625" moz-do-not-send=3D"true">Intel XE#5625</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:=
</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-7/igt@xe_exec_threads@threads-multi=
-queue-fd-userptr-invalidate.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not-=
send=3D"true">Intel XE#7138</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind=
:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-9/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not=
-send=3D"true">Intel XE#7138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@xe_prefetch_fault@prefetch-fa=
ult-svm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7599" moz-do-not-send=3D"true">Intel X=
E#7599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-8/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true"=
>Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-n=
umvfs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-lnl-8/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-reduce-numvfs.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-d=
o-not-send=3D"true">Intel XE#4130</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7366" moz-do-not-send=3D"true">Intel XE#7366</a=
>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"=
 moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7571" moz-do-not-send=3D"true">Intel XE#7571</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard=
-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html" moz-do-not-send=3D=
"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-lnl-1/igt@kms_vrr@max-min@pipe-a-edp-1.html" moz-do-not=
-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4227" moz-do-not-send=3D"true">Intel XE#4227</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-lnl-4/igt@=
kms_vrr@max-min@pipe-a-edp-1.html" moz-do-not-send=3D"true">PASS</a> +1 oth=
er test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_configfs@engines-allowed:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-bmg-6/igt@xe_configfs@engines-allowed.html" moz-do-not-=
send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7725" moz-do-not-send=3D"true">Intel XE#7725</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3=
/igt@xe_configfs@engines-allowed.html" moz-do-not-send=3D"true">PASS</a> +3=
 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.=
html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6321" moz-do-not-send=3D"true">Intel XE#=
6321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14970/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html" mo=
z-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-mult=
i-vma:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pa=
t-idx-uc-multi-vma.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5625" moz-do-not-send=3D"tr=
ue">Intel XE#5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14970/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvi=
se-pat-idx-uc-multi-vma.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disab=
ling@numvfs-random:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released=
-on-vfs-disabling@numvfs-random.html" moz-do-not-send=3D"true">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937" moz-do-n=
ot-send=3D"true">Intel XE#5937</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14970/shard-bmg-1/igt@xe_sriov_auto_provisioning@=
resources-released-on-vfs-disabling@numvfs-random.html" moz-do-not-send=3D"=
true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-twice:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html" moz-do-not-send=
=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6569" moz-do-not-send=3D"true">Intel XE#6569</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-8/igt@xe_sr=
iov_flr@flr-twice.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</=
p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-=
indfb-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Inte=
l XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14970/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-ind=
fb-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">Intel X=
E#2313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8854/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2426" moz-do-not-send=3D"true">Intel XE#2426</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848" moz-do-no=
t-send=3D"true">Intel XE#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14970/shard-bmg-10/igt@kms_tiled_display@basic-tes=
t-pattern.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729" moz-do-not-send=3D"true">Intel=
 XE#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7424" moz-do-not-send=3D"true">Intel XE#7424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-bmg: (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8854/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
854/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-b=
mg-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-6/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-9/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-2/igt@xe_module_load@load.html=
" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_8854/shard-bmg-2/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8854/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_885=
4/shard-bmg-10/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bm=
g-10/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-7/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-3/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-8/igt@xe_module_load@load.html=
" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_8854/shard-bmg-5/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8854/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_885=
4/shard-bmg-9/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg=
-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-5/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-5/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-7/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8854/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8854/shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/=
shard-bmg-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-1=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-1/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8854/shard-bmg-9/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2457" moz-do-not-send=3D"true">Intel XE#=
2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
405" moz-do-not-send=3D"true">Intel XE#7405</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-9/igt@xe_module_load@load.h=
tml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14970/shard-bmg-5/igt@xe_module_load@load.html" moz=
-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14970/shard-bmg-9/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14970/shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"=
true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14970/shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/sh=
ard-bmg-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-=
8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-1/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-10/igt@xe_modul=
e_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-2/igt@xe_module_load@l=
oad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-10/igt@xe_module_load@load.htm=
l" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14970/shard-bmg-2/igt@xe_module_load@load.html" moz-d=
o-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14970/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-se=
nd=3D"true">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14970/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14970/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14970/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14970/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14970/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14970/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1497=
0/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-=
bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-8/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-3/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14970/shard-bmg-8/igt@xe_module_load=
@load.html" moz-do-not-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7725" moz-do-not-send=3D"true">Intel XE=
#7725</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8854 -&gt; IGTPW_14970</li>
        <li>Linux: xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5
          -&gt; xe-4897-c8bad7becc008716c8475847328c549e178c813c</li>
      </ul>
      <p>IGTPW_14970: be03cd284c36013396122d682b5e5d2377cedf60 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5:
        3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5<br>
        xe-4897-c8bad7becc008716c8475847328c549e178c813c:
        c8bad7becc008716c8475847328c549e178c813c</p>
    </blockquote>
  </body>
</html>

--------------gFXv7ODDlybx30446zUs6PpI--
