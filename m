Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596F2C2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 09:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0486710E13C;
	Fri, 12 Jul 2024 09:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbEoLAhh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3705310E13C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 09:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720775653; x=1752311653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mx3CLPck6meq7nbyZ/9KKKvLo0mlNVzOYML7aEMboYE=;
 b=MbEoLAhhqPXnbNI4JqwyvDP34v2svoSlK0YY1dIlQ92D1tyIFXWdjeDL
 wvFSG0GUNYsJT3b7tNAZNJ4aNv7PEJDz2MY0N9kstDbfUXXJ5fzCXi4Jl
 w/TSWM8YZk5YZR3pXeqfavE8sWBA6PrNju68l26HLCSX+u19Wdb8o9JGG
 hWG1si8zMJfnqMjphVxzceLoCBHjl+Jde0SlpR3XlzT5lrHuAJNjs+rfC
 xtk1a5GvNXh+oRwE/HzGi1UGCoUdxLe2S2Y3Ir5mK9g1CfJiEGyiiQ3FZ
 p6P8u/iHAN7MmPrxliUSqGLYUpO5BxxDxRz4mQzDXxrVSjnpvfob980Zk w==;
X-CSE-ConnectionGUID: gIWM+SBbT8+IhB5GbXbOvg==
X-CSE-MsgGUID: BIckZNJfS+OuFlK3MIMOng==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28797943"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="28797943"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 02:14:13 -0700
X-CSE-ConnectionGUID: moH5zwVrSqCm90CeV7hKdA==
X-CSE-MsgGUID: f8obI9UZRiGsm97XWNIoCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48741296"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 02:14:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 02:14:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 02:14:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 02:14:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 02:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BemDd5y/GbdwAqnfB0hsCcG8Cowpeh6uyiIBzAP5I6cgrJRmKA6KGeEzI3DpMdsK/FSpa/B97n426upnwYkVOyley/cIvuPyLb825R2Vq6WfTW3a05gSbV5gfyp9i8YxYNVIrqvddE2tKU9HaEQMYOOcPLV58TdQPmz4aACD2OHNtIQvTYjHpxExarczHnk+pmlcf0t04P+WK5E1QoaGYT/V4l/WCGBoidDUHvi2osjjN/JH3rw0GspRlUiCW4i7ik1BT9K3ccwv9Tg2x3Pa0enJJbEssHLRPdHKzOrXmiFy6NBZHS1WbArS6KBYwzXWpXBDNYS8zrcQUhDk3/S7ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyTkJ7K9V8WcG10gxv+kv20TDp6VMum4J+fObMfveDY=;
 b=Ye5X0vMWG/iATy2OYWocNV3Are+MWawEIeAA3T8nr5wi7jH8diTrI7rLwFNu0rtLcJFL3pJEyM7f5UjiJv9O06nUl/o+wABDuv3od+giGfmnQ6jQaPIkoNGeVlsnwE1PNZflmr0ERUgcA7edhGRrGKofyZ4WQvZqF6qUNgYa8o+CW91hc4Mlw9dAciwJVsdaTNFdk3Liz6ZII4qAfFoTpRZDcC73ySO2YXWmxgj64se5HsHv83vFBtDK4P5IN9yrJcCqp9nuOC7Voc+JeArOU8ZUqpU+cMxn+3tGOOT8OPpeDQNo3aK9UThBNO2559yTMnWUibj+/tiz+I0NN9GTng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ0PR11MB6576.namprd11.prod.outlook.com (2603:10b6:a03:478::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.36; Fri, 12 Jul 2024 09:14:05 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:14:05 +0000
Message-ID: <eaf06bba-cad4-4206-8655-22c52d4e79ad@intel.com>
Date: Fri, 12 Jul 2024 14:43:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 1/2] lib/igt_sysfs: Implement dynamic adjustment
 of debug log level
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20240712082928.762514-1-pranay.samala@intel.com>
 <20240712082928.762514-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240712082928.762514-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::9) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ0PR11MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ad7a1e-e3f9-4c65-8b6f-08dca252fab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wjg1dFBGWUo5T0JqR21GcDN1VW0rcFkwWFZOalViTExrMFp3ZW50dnpsaUFO?=
 =?utf-8?B?VDZuKzA2RFpoMXhPcFNEcEYrZ3BrVGRReGxGdG1QeDlaMzh0NDFFMDV6ckE4?=
 =?utf-8?B?b1FYOFBKaHJ3eDhJWUFBdHdtbk5tTGsvajIydzRGd0d0Nkx6NTY1NWJKeTZM?=
 =?utf-8?B?M2VBVjZBVDhDcURxVWt6dmN2cmkzeUViV0p2K1VzdS9DbmpLR2VZSWlPbU1h?=
 =?utf-8?B?WkRDOGpPemZXaHRIQ0JCOEErdGlFVHRBai8rN2VxMDRoOXQ5bStZdHRUWWRM?=
 =?utf-8?B?cC9BQ2NQVjROdUhjTEUxVEwzUExnSnJrb1lFQ2loSlhFWmhxTS9jNjJNQ3U4?=
 =?utf-8?B?bTl0YWxJWW9OZmZJYTZhWHNCREdVSjNockx0QkQvbHRJbzNLZHIzOHVNdkJP?=
 =?utf-8?B?OFphSEx0RGhNSWZrM3RSc1JkRFI5U3lTUzFqMFF1UExMajJ3azdINkJ5dHpP?=
 =?utf-8?B?dWVoYUtLdlkxMXRVZHF1K2oxVmhPRzZUNCtOcGZLeC9LVFNBOUZDeU90Rnpi?=
 =?utf-8?B?NXBOQ3ltVi8wd0RjVEFpL1czMnJadTlnb0VBSmRZa1l4dUtlMWtFdGtsRGxF?=
 =?utf-8?B?SjZ0WG1HRWVRRWlMUTQ3a0prMDYrYjFyMDUrUkJTdHdyMTJ1cXRFa200azBC?=
 =?utf-8?B?bDZ1VTVZSkt0WlRRY1c2QytLUWNKc1JIUWpHbGh3NjBtVHdBcndobExISTZJ?=
 =?utf-8?B?TjhqWHYxRHZtNTdOWFp4aGJSNHNKbk0wWEgwSWxmRURFYlJ6ekpvREc3YXhz?=
 =?utf-8?B?aU90d2Mxd3pwNGhybXVLbkFxZkZ3dHd1RXQwMzVJdGNVN2YwL085MnFDaGYr?=
 =?utf-8?B?a2JZc09QTmk2RG9Fd1lYZjlSejNhMXExWTJub0w5UllGdTVSZnVUNWVTY3Va?=
 =?utf-8?B?aW5PTjZmMW53SUVXVWhWckFYZ1FpRzBhUDdzaTFUb3U4N1crTTJLMmNRZGFZ?=
 =?utf-8?B?RkErWVh4NXluNjBtTDZlTk83VndQMEllT25qMllucGdDUWw1SzZLbzRpODlx?=
 =?utf-8?B?aG1aRlZnZFM1RjA2V0thNmxYa0o1aTBOS01Jb3NnZ3pCTURlMDcvaW4xUFlO?=
 =?utf-8?B?OHdmcHZXdnJaTTFvOWV6Y3dZR3FLeExrMCs3cFlKa1R6aXhzN0swMVdSNjdG?=
 =?utf-8?B?eGlyNUk1NUhQc0RpaXJHUDh0d0wyc3NpNEJJTkIvanZPcWlhTnM5Q0xGQ3FL?=
 =?utf-8?B?Q2FiaWtTMWdDTytkaXJnczB1cDVFVURxYjdqMUpCL28vUnIrTldWSUdid1lt?=
 =?utf-8?B?OFpJOE5PNzdEVzVXMnZsVndpckJkQUhVZm43VzVwZEpieXNid09NN0x6eDRO?=
 =?utf-8?B?VlczMnlNRDNRbG1Ud1I4ZnVRTUxwbHU1eVdmQ0tFMFhZL096cko1cnBCZHM1?=
 =?utf-8?B?Ukg1bFZhR09sQnY2N0xnUXdpQVhtd0NjSk9yc0Jzbm45N1czKzRmL2syZzJC?=
 =?utf-8?B?ck5TQ2hKQURLQ243Slp3RUs2MFBTQmREOC8zb1RORkduNCtSRUplbEg3cEVC?=
 =?utf-8?B?amJuRTFacXdmRnphSUZJRnJFc0k3U1pEaU5Fb1pQL1JwcEUwZ1NDWmpha2t2?=
 =?utf-8?B?dkpScHFHVlR0QWpmZU81bDV0aDhjbkZGSGVPZVpUcTR2bWlXejVsMzh3TEFh?=
 =?utf-8?B?Z0tBSkJkc1c2YkJnQnFRVDYzb1BDcmJsWWk5aWVmWG5Tcmt1cjFYVlRxSUNT?=
 =?utf-8?B?cVlEOVpJRUhVWjc0T0RreXpiMStHd2RrYmhTYSt6YzE1c0pSU1hNTVZFdGw4?=
 =?utf-8?B?emNFZkFIUTJsVGgyd2dRcjFYQXVMR2o0em8yU3IxaEJkUmtYZGNlZzJLWUll?=
 =?utf-8?B?TnZGZGNUQitVWEpYZnV6QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkZCckthL0h2ZkN5WE5nRU1Yckp1c1hPMFQ3OG5QSW5yN1laQVFVVmRpb1Ix?=
 =?utf-8?B?Z0VaZ084ekJseFJDQytNUGNndEg4eVIxYW9TQzhNME5aZ1N1V1c2VWRqdXdE?=
 =?utf-8?B?ak9oRUhpTDZFcW5RaWI4MHE4dEZvTEc1UUxHVDQremVZVGhaWXFaUjRjUzh2?=
 =?utf-8?B?UWlWZnhVdDh4STF4dXRtSU44MmFoeUZWVE1uR0F1cm90ZEVUczdoYmV5YkFo?=
 =?utf-8?B?K2hMSWlVRGZ5SXU2MzlTdSthUDkvN3BScjRXbWNsVDlqMXdQM2RMaWdWVDVG?=
 =?utf-8?B?bFR2dTFuV2NKc2xlVTl4dEU1OG4vNWVERkxLRnZYUEVWUStGZ05sTHVsaEpM?=
 =?utf-8?B?K2xwaFpUWHRyUVNNRlFQanVvR1RmUkV3clF6U3pNUkIwWW52Ni9OV25mMGxj?=
 =?utf-8?B?SXFaZ29zZ0pSV3JEbnBVZU1YWGJ2enZFSTB0U1B0VmtqOTBvSXN1SGNLbWVx?=
 =?utf-8?B?WWpYUjBNZ0ZyZTNtN3IwZXpuVkhqUXkyRC80eElLS01YWmVkODQwY3NWNEIv?=
 =?utf-8?B?VEo0a3E3K2FGWC9wdTFGQjFEdXVZN3RxaG9Nc1ZRMm1LVzJCWVdZNnJEUTJr?=
 =?utf-8?B?aUtmVnhuZWZYQ29VdEJHbSs2cy9IT1pRTWJuQ3o2aVR5QkYvVnQ5SDUxd21E?=
 =?utf-8?B?ZS94TFRSSHhwQTJzUGRyRlhodSt4V1R4aVFtNUVwRTFIL0FNUUZ1WjAydlQr?=
 =?utf-8?B?bDN1NjUyaFoxWlNWWXo2MEo5eHd0MWVuMU5qNkRtRmFmd1BEa2V5QVhIYVMv?=
 =?utf-8?B?VU1nVkg1U0w5R0tLSVFUY0FWQjMrS0R4Z2JaSU80eENkdXJGMVY5UEpOamFE?=
 =?utf-8?B?bUI2QXlVV0EybHY4WEJMUkFQUHdid2VUVHRFUXp4OVR6R2l3R2E5QzBTRlBx?=
 =?utf-8?B?VFBuUnhTTkZGZStTa0NnRGFXM0NteHBRbUQrc1M3Kzl0c1I0alg2SUZVZmd5?=
 =?utf-8?B?YUhDanNYUXZwOTA1QzBiaWVtckdVdTMvK2JjR1RvSk9ENE5Xd0Y0SWVMQjZ3?=
 =?utf-8?B?WFN0TU5mUnoxWmJURENrQjRLcDM1cVBrMzlCMHUrOVdSeEx6SUlqTzYranNn?=
 =?utf-8?B?VTExMkZId3RZR2RWSkZXNTIxSFFJRC9pMHp5NFYwNmU5Z3gweVUxODZBcTF5?=
 =?utf-8?B?MVE1czZnTUJNMmJSOG5mRkJHRFNqM3E0b1d2Y2F5TTJDMU1uRHBqUXl6aGF6?=
 =?utf-8?B?b1NmWnpKdVl5SXVmSzAzWmgyWFNaYTBwQ1JUMEx0QjFhRHRUa2dNcndRYXFh?=
 =?utf-8?B?UmIxYzNCRy9tb1pLVTA0VjZ2dHY1UmM4SW93aSs1ZXpTRWZXU3RuMkZlQ1c3?=
 =?utf-8?B?YmdsRTlDOEQzUVJrQi9GbDNTaythTVRXREFLVmRkZWdaMmVmM0lBMWhoaTVN?=
 =?utf-8?B?cTArQWFyRzNncTNFQTRna1g1aVJCT0YwZE9XV2FJSmt3akk4bEh0ZHN0NFIv?=
 =?utf-8?B?QUZMZkp6Qi9FRjAycXp2SFFUSi9rc0VaL1N6VUp2VHI5TVVEam1zY3dMVmgz?=
 =?utf-8?B?cjFCQnpIUDZiU3ZmZWZndTBjTVJ4WkM5SURuUkIydjEzQXZleVFIVi9yYVZs?=
 =?utf-8?B?ZDFLZmlrR2MrR0NPZzh6dlRvaEVxZCtsTndmRkpUSFc1QTIvZUQycXVFOGRZ?=
 =?utf-8?B?QWxuQUZGbGQ5Mkh1d0Q4NW9RNEltQ3pTUVpXODdEZmQ4S3R5elZ6eG9BN0M0?=
 =?utf-8?B?ZHF0RTZxN3k5T1RQZEwwOSs1NjUvSlhNYmtocWQvYlZ2MlA5cmpsMEtsMmZT?=
 =?utf-8?B?N2RyZFRqakpyK3FaT0QvbXU0bDkzUVNrTFl6Z2JDa0hLY3hSNGJuc1pnRGo5?=
 =?utf-8?B?WEFnOGJmcFhPQ0RPUXhXWW11ZDM1RFBJT3lrOU8xWkJRdFRNNVJLbG5NeDdn?=
 =?utf-8?B?TkhSVGZEWHVQalA0dmhwWm9GZGFuRW1tQlNTRnp2VDVrRmwvcWlaMWlaRk9W?=
 =?utf-8?B?U0RvMDhIelVuOEtvSEZtbjdDcENLU1RycGNxREYyY1FJOWRpaWNlZ0NqemI3?=
 =?utf-8?B?ZGJKcWtrS2hCVndjTStlZ29KaFFzYnR4VUl6V0ZTQXhtTmt1S1IxQzlyZllM?=
 =?utf-8?B?ajM5cDZJOXU1MktCU1d3aWs2SlFIU3JVZ2JCeXE5djFIVkdlYXZhSURLd2xQ?=
 =?utf-8?B?bE1EdFd0MmZlODVHKzhNZEJWQ2NzNVRxSFluUVRxL0kzQnQ3MjF1Z1o4QkIw?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ad7a1e-e3f9-4c65-8b6f-08dca252fab9
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:14:05.8209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpyusGQnbSUSJSu473dmX7pnTN6RUfG7m6rAf7IFG0goj0xJ4uk3oSbPZ+YKaH1k/f70AqjPMfL1EUL+/OSfkiGasT+hXqXff1v2n5s2YAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6576
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


On 12-07-2024 01:59 pm, Pranay Samala wrote:
> Adjust debug log levels dynamically to prevent machine
> disk overflow during excessive test debug logs.
> 
> Introduce function to modify log levels as needed,
> with an exit handler restoring default settings post-test.
> 
> v2:
> - Using proper function name to represent its
>    functionality (Bhanu)
> - Added Documentation for each functions (Bhanu)
> - Removed the magic number and instead reading the
>    default value first (Bhanu)
> - Using recommended apis for better handling (Bhanu)
> 
> v3:
> - Adding module drm_open_param function to open
>    the sysfs directory (Bhanu)
> - Reducing the current drm loglevel by step value
>    to make it more robust (Bhanu)
> 
> v4:
> - Remove all the extra new lines (Bhanu)
> - Remove the unused declaration (Bhanu)
> - Edit API to only update the requested drm debug
>    log value from the caller (Bhanu)
> 
> v5:
> - Add TODO for multiple exit handler installation
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   lib/igt_sysfs.c | 108 ++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_sysfs.h |   5 +++
>   2 files changed, 113 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index ffeec1ca2..42b2af41a 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -412,6 +412,114 @@ int igt_sysfs_get_num_gt(int device)
>   	return num_gts;
>   }
>   
> +/**
> + * igt_sysfs_drm_module_params_open:
> + *
> + * This opens the sysfs directory corresponding to drm module
> + * parameters.
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_sysfs_drm_module_params_open(void)
> +{
> +	char path[] = "/sys/module/drm/parameters";
> +
> +	if (access(path, F_OK))
> +		return -1;
> +
> +	return open(path, O_RDONLY);
> +}
> +
> +static int log_level = -1;
> +
> +/**
> + * igt_drm_debug_level_get:
> + *
> + * This reads the current debug log level of the machine on
> + * which the test is currently executing.
> + *
> + * Returns:
> + * The current log level, or -1 on error.
> + */
> +int igt_drm_debug_level_get(int dir)
> +{
> +	char buf[20];
> +
> +	if (log_level >= 0)
> +		return log_level;
> +
> +	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) < 0)
> +		return -1;
> +
> +	return atoi(buf);
> +}
> +
> +/**
> + * igt_drm_debug_level_reset:
> + *
> + * This modifies the current debug log level of the machine
> + * to the default value post-test.
> + *
> + */
> +void igt_drm_debug_level_reset(void)
> +{
> +	char buf[20];
> +	int dir;
> +
> +	if (log_level < 0)
> +		return;
> +
> +	dir = igt_sysfs_drm_module_params_open();
> +	if (dir < 0)
> +		return;
> +
> +	igt_debug("Resetting DRM debug level to %d\n", log_level);
> +	snprintf(buf, sizeof(buf), "%d", log_level);
> +	igt_assert(igt_sysfs_set(dir, "debug", buf));
> +
> +	close(dir);
> +}
> +
> +static void igt_drm_debug_level_reset_exit_handler(int sig)
> +{
> +	igt_drm_debug_level_reset();
> +}
> +
> +/**
> + * igt_drm_debug_level_update:
> + * @debug_level: new debug level to set
> + *
> + * This modifies the current drm debug log level to the new value.
> + */
> +void igt_drm_debug_level_update(unsigned int new_log_level)
> +{
> +	char buf[20];
> +	int dir;
> +
> +	dir = igt_sysfs_drm_module_params_open();
> +	if (dir < 0)
> +		return;
> +
> +	log_level = igt_drm_debug_level_get(dir);
> +	if (log_level < 0) {
> +		close(dir);
> +		return;
> +	}
> +
> +	igt_debug("Setting DRM debug level to %d\n", new_log_level);
> +	snprintf(buf, sizeof(buf), "%d", new_log_level);
> +	igt_assert(igt_sysfs_set(dir, "debug", buf));
> +
> +	close(dir);
> +
> +	/*
> +	 * TODO: Check whether multiple exit handlers will get installed,
> +	 * if we call this api multiple times
> +	 */
> +	igt_install_exit_handler(igt_drm_debug_level_reset_exit_handler);
> +}
> +
>   /**
>    * igt_sysfs_write:
>    * @dir: sysfs directory
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 6c604d939..5d050c786 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -138,6 +138,11 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
>   void bind_fbcon(bool enable);
>   void fbcon_blink_enable(bool enable);
>   
> +void igt_drm_debug_level_update(unsigned int new_log_level);
> +void igt_drm_debug_level_reset(void);
> +int igt_drm_debug_level_get(int dir);
> +int igt_sysfs_drm_module_params_open(void);
> +
>   /**
>    * igt_sysfs_rw_attr:
>    * @dir: file descriptor for parent directory
