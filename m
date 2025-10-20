Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DE7CCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 14:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D0010E2A9;
	Mon, 20 Oct 2025 14:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QFK+ykYu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD3610E2A9
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 14:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760972207; x=1792508207;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GL/6/9LJA3qf2BKPivzdSRU6mC9h4CWFQ9HVnllgIck=;
 b=QFK+ykYu9tHgqnPY455OIZDV1wP2WQxtei1pQmHhP/K2xycdmVuMW2oi
 b5CttTBmv/6CM3ePSmyNHSo0+WNU9pHGxDkHvfKRgJ6Z7w5DbJi67qR6H
 X4aVtTkeG94m97vEkdhUZZ8LrNFH164kbi04PC+3YX9Tqw702ieVxy1rC
 S0DMXWjgDkL1uChtS+kGr/GbjAL7I0eGyVojie7vPKnFH9gFXOM7hh0cP
 /3PVojGKpM/HkfxQuf5UZMagLWIllTKH2VnSfohrq0/L0+l5EBgcjtEa6
 Z/03rMwtzJ4Hy3XwhMINfVFd5fXexhfzHo9xnwHN8gHSN5oPViTYm6zC7 w==;
X-CSE-ConnectionGUID: SKfJuXH6QIGopaW/lxO+wg==
X-CSE-MsgGUID: YKm+f96HQ5K+f4CXOTkUsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62788842"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="62788842"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:56:47 -0700
X-CSE-ConnectionGUID: C5hJw7f8SqC2hhi2y3izPg==
X-CSE-MsgGUID: D6+GJsomTBaPJyHBffRuiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="183364210"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:56:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:56:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 07:56:46 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:56:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfPhTApFgtCePqQ6sWMVzvh8bUostvB3Vn82WW3KEGpAZNiUsKMrfTq/Uhwnwz+PQoMLqSPHe+NOgA49Moho6iSwBlj4hE8K3bnXzZgqJHcaS4IpKVh351KZHyP+fzwawSHhV1rdyFE/O0q5xUDfKso83GkCLphcwWn8OHcmOydxVbf4LlzB+USxAvVEHkeMOBN+7Bfq3SZ5iFiXu1ZIL9Kq1fiq8IAMc2r/0qh3rwIbjoraKDQZKs7J4cPdY+TdzNXnwIiEJ9rD7RM89a4zcPJsHc6Slm9V5cz7CPgHBpU7jinQGS5RKazALBvw23Six4cN+kWRz/2/xkR25DmD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TckCZ7Vwj56jiKpLYWAQfV9NsHDP0HwgjcnQnzJp8A=;
 b=HjiwgIIA+vGvTf7vB0U+COeP6L76/K6AhUYG+oBxBouqsZwhldyzKdRKs7g7AcLnu+AlzOlofTs1iJpcKd9TtjkTetgxM+w0llvZZYcOHIa3f2yxsnqKMtYUya4B298z9hf4cX7sbYY2pFunF9ookbX7lI1Ayrk2MZGZjAWM9hRHUTCrzk27DCPlYWq+oiJttxkXsVLLn/dOJgV9TlXeyMm1NLYpTbhQCdgLcx+NlFKdnChRLQigjIfKJEJmANyEadirudmgXlwcfKw8oOXRN/XkqZUEm7HoZI+2Rd4wgjz9nIZC5NmbCMJSMitYxNCoBCyrv/FIBI4GuZL7RTm2fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 14:56:44 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 14:56:44 +0000
Message-ID: <be7f2287-1f2e-4718-862f-e590d01dc3d9@intel.com>
Date: Mon, 20 Oct 2025 16:56:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel: Use
 xe_sriov_disable_vfs_restore_auto_provisioning()
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>
References: <20251018161549.999459-1-marcin.bernatowicz@linux.intel.com>
 <20251018161549.999459-4-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251018161549.999459-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::6) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 862b6ea0-71df-4f2e-093e-08de0fe8e2c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amlHWVRrQWNoVUxiSzRLanQ3TzBRbUJESXdOSUh0UzBONzc3VGFiY1RidmZ4?=
 =?utf-8?B?UjBUUEFuNy8zeG1EY1Bzd3dYcHNncFRPN3ozL1g4OEh1b1JjVmFtbDYzZ2FD?=
 =?utf-8?B?WUkwVTlYV1pHa2Uyd29lU2xEVTFmK2p3Tzg1NVpFQVdmMktGUXlGcWlLaFQ4?=
 =?utf-8?B?dnRYQklBdmllekhlZHRqK0pOY2NQNVhFYUFLWTAvR3ZaUkxRdHlTWXdOTEVm?=
 =?utf-8?B?cGwxMzlKSE8yT1RxbmgycDVOM3labklmdFh1UHkrS1JMY2IvUkpOUWkybVVF?=
 =?utf-8?B?OUlGcjlMZENkbDNwbW9pNUlzKy9kN21kVlA3ck03TXIxWW9jQ2RXK3MxaEdn?=
 =?utf-8?B?eHdvR2UxbzR6a291a2lNV0FpSk1ua2JtVHFEOEVIV0lRZDBqZDBPaFZpQmJ4?=
 =?utf-8?B?VCtFS01kZEdPWTNyZG81NDhtallKa2JCY2tXM2E3S2ZUays4aWJINk5OOVZW?=
 =?utf-8?B?L2I4TzFHWjhabUVYNENkbUVYb0xQMTU2OGYrZjc1T3N5bjJSSm4vdnJwK1U4?=
 =?utf-8?B?dGw0aXkvWDhic2pFc2tLU291V216dExEcFUwOTdrS2Q3Y1Z2VzlCeFgwYm1v?=
 =?utf-8?B?VTNPcHZtNStoKzJBMXZZb09iWk84aEhpWHFYT0thT2ltWGU4QjFEUG04ZHFV?=
 =?utf-8?B?NklIbmNqTW9jdEN6WGRUdzhOOWc0eVB2bzM5Um1keXhlaVhFelBMTWFvelJj?=
 =?utf-8?B?WVUyQ0pyNjVwVzZUcmFnVWtIay8yUFBqVDdMSXVtai9UYXlaY2QvOXBDNmgr?=
 =?utf-8?B?QUhmdHh2a05qUFVsd09IWTkxbjhvdXAwQ0RMNENWczVZcm9uaHhmWEJpWUpP?=
 =?utf-8?B?QzNPQzAwL0Njb2JpT0dvaGVDMXdFZnYzWVdYbWVRRGVPRHdabVcwcHR4TExD?=
 =?utf-8?B?Y3NZS3BTam5hRHh4TklTZFkveUwwOFBHUFZiK3hIdTlsc2JLRVk0cXFnc3R0?=
 =?utf-8?B?d25HdlFZc1ZvY0RBaHNXNnZBOE5RVDEwMkdzaVVXK0VIWWNraWNMVTdsWERj?=
 =?utf-8?B?UXBnNHBSV2txM1kxYlZkQVFyQW9oN1VpLzZvS2k5ZmNuZkEzTmtkZHgrSmFq?=
 =?utf-8?B?cDR1Tm9qVkZ1VGZhSWYvVDQxNmp2T2VWU1llNktxSFRSdjE4TGF4Wi9RN2xE?=
 =?utf-8?B?TGRBemZSd3hFa3daeFlJcFZaay9oU2NCU2pkUm95cDhZRU1mdmFmelY2KzBB?=
 =?utf-8?B?cmpVVnh6OW1jSG1FVHhTb0xVN1lYTTllcUZGNnM4ZjMzOWlDUkhqTlZMbitk?=
 =?utf-8?B?ckdqL3dlNEZEbVM0ZW9DUDBjZndhV0poaDRBMHFBR3FLeUJHQlFzUVRQQzBF?=
 =?utf-8?B?NytoZ0hBMHZVNjA5bW1kd1o2VFNJUXYzdFVPcFYrT09HWFBJcXhXMTFjZzlQ?=
 =?utf-8?B?NTlKczRqbGNrMmlqQW4wM1JaWjVtSWFPMDFWTFNWSmJjM1k4NUdHK1FHRUw2?=
 =?utf-8?B?S3VncmVoU21HSFhmaVZyMlZON1VDVjBWRXo2KzlReEt5WVhENzI4WXY4Rm42?=
 =?utf-8?B?cUFaR3IvNTJZMnEzdjhPT2hKWVBHc3Fwb1c4VVpnTllBSXJCWTBaVERvb0xG?=
 =?utf-8?B?T1lmSUhwSkdjVlRuQUlrSXB0czV2L0w2dk1PNm9rWHQrRVR5ZHRkWDRLQXU2?=
 =?utf-8?B?Zy9BelNldCtKR29nTVB6aVFxZGcya04yM0Q3T2t1d1JNbUI0d09tSVpzSjVL?=
 =?utf-8?B?TXNqcXZTUllzSmhydURYeDk1VFZYN1p5TkJISHRNT1NCeHZNT1ZLNUFFa000?=
 =?utf-8?B?S2FrSE1paHdZOWFVK0RFK0doWC9Mdmc0MXI1dFplZ3BGUnJQN1NxWVpmTUlr?=
 =?utf-8?B?TmdXQy9QcjFQYWFyVnMwbnkvelN3MHZSVFVNTDMvZEVWcDcwcDBRUGc2QzM5?=
 =?utf-8?B?L0Q1aTBFOHBLU3dTcll3Wm5iNDNvdjc3S2k3OFM0NEQ2K0RJUjhtMXFaNUZs?=
 =?utf-8?Q?IAPMYSkkDoW3XwsSTC5wHPYqlSuWa706?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWIxc3dobG43SlduSnNXYktIMnVTM0dVSUU0eHJqRDk0UmhYT29Ud01YRHFi?=
 =?utf-8?B?RTJuS1ArTkRETjhVTThhS1RSb3F3U0d3a0FtYjZLWU9iZ01iaVBDbWxNdkxK?=
 =?utf-8?B?RW04UG9RVXNQL3BnUFV4UjF0OGo5cWR1T01IUGgyODE5U3ZZTDZHakFoVTlm?=
 =?utf-8?B?TlZNSUhOLzZMa2E4b3FpNzNFY3NXb3FSSmd6UjNFNElURm5OUlNOY1ZBTWhj?=
 =?utf-8?B?RGpuelRVbWhGbzBEcFdTREdHQXFVWDdpeXJVSy9MNzdkQkUxVDBlS3dCU092?=
 =?utf-8?B?MllmWEZiM1ZENTgyaC8zOFl1Vm5EbjkybEVScXhKYXNFdE9uMUpuUmNYUjY5?=
 =?utf-8?B?M3FFLzIwUnRDcHRxZVJVR1BTNE5OVXhFNG1RT1FBM3F3UUhWY3BkZGRqalFy?=
 =?utf-8?B?enlxMW1xSmJkVzg2M3RMRDlGVGI3Vm83YTFPcjlWY0NEVGJCcHp5U1VXZEs4?=
 =?utf-8?B?UVc1aS9DUlJMRFdUMXk0SzI5QzBNWU5CaktEc3hiakYxN2NoQSthWmVGc0tE?=
 =?utf-8?B?aW1nalltejhvUE0wT0ZiWVFwZ1o5M0xPd2NVRnFJNEdWa0djOFRhL251WFFn?=
 =?utf-8?B?bGo3M09sR0s1MVA5NzdWQzZZWGRpUU1MWkIwYjNGM01kOVZ2MERlWjJ2OEx1?=
 =?utf-8?B?MVpQQzc3eVEvQXc1Ni9mTEIxZkFLZHZWRmRrakdyQlFUcTZ5eUZJeGdVc3k3?=
 =?utf-8?B?M01hd2Rtc0FxY2x6d1pLbjFNM3VtT0crYWNEemZPNFlCQ1FOV3YxVjBRMklo?=
 =?utf-8?B?RTNHY3FzS2I4dXB5b2RaTUltLzBpV0o0YkJ0Yi83dy9OMWMvMVVpYnJwQmt0?=
 =?utf-8?B?V2FMSzVmcG1pN3pNZGxVYTZGdk13Rk50c0FQdTU2OHlNTHVOT1NkV3lHd1NS?=
 =?utf-8?B?eHZkS2Q3UXllQkwwVkNuWDZoajhibHhZV1grU2l4bjMzVzFLNk5ZQU9HZEF6?=
 =?utf-8?B?dXluTm4rUWU5ZEJpN3F4blVpQmNheWVMTmZ1OStHZm9mSUFjTUEwWDRqYzdh?=
 =?utf-8?B?V2k2SjlSa3p3aHA5b05SeHpjQldDempHV00zRXhtRTZBTHd2UzZqbXVvVmJJ?=
 =?utf-8?B?SDdPc3NLU0F4ZWJldXIvZ003bWxmQWtPem94YTBtV2tnNk5xSjZ4RHB4SVc2?=
 =?utf-8?B?M25SaUtnV3BVM0VIK2NOVVJDZ2JUM3RBV2NIWTQzQkpxL2xqaFM0a2dRQTJC?=
 =?utf-8?B?UzJtSy9MSkRmRFRjTmUvZFdJUE9KUUdiczNEU3NwemRqejJVajdjdjFBOWFK?=
 =?utf-8?B?RmdGQXVyNWIrL0ppbHpNVkxqdmg3UHorS3AzVm1LMmVlYS8yTjJ1Z29IVzB1?=
 =?utf-8?B?WmdHMEN1a2l5bEpXTUlCb1ZRYWFXS21JVUJqd3JJald0c3BzSmZWbzMxYnJP?=
 =?utf-8?B?dVZMeWYveUcrK0tCclcva1hSNmt3TVZoellyUlA0cFAxYnNjbm81ekRBZG9N?=
 =?utf-8?B?N1M5ZVRJVTd5dVQrU3NmQ3JYTHEvRnRIcFY3WnRuYmUrTWpaeitJNm9kK054?=
 =?utf-8?B?b0JCc2ViK3FSa3BwQWU1cXVQK2R4Unpkb2cyYzB3YnZVUGt4UFZNMEo3N2Rn?=
 =?utf-8?B?NWJrYkNHTVU2WlhVUW9aOFFnSUU2dUFkcU5PWE1pVFNjbmU5SjFKZmF2T0U0?=
 =?utf-8?B?SWNmUkFXb2NnUG1Qa3M5TmptaElwQXVTQ2Z0MTIycVBibWFWRTJNNGFnVUdm?=
 =?utf-8?B?VDMrcm5CMjZCTUVncFNVZUcxZG9WL3FHbVhGSkNiL2hBTHN2cXhNWWNyTXdZ?=
 =?utf-8?B?aTMvTHE5KzZSWUVia3d1S01BNzlEQktldEZUZjBIS0RKK3lrUHNEbHZTZEZU?=
 =?utf-8?B?VjNyNGl5ay9rclhsMWNmMUtXaDNOV09ocUNaWHArYTV5ekp4ZjFseWhXQlFB?=
 =?utf-8?B?NTFyRW4vNWtFZVI1S1pjQkkzNm5rS3d6MHExeUJMcnlrdW1NSFVidHQydENO?=
 =?utf-8?B?ajRjMXA5Y1o4QkJUZlkrNytjK0d2SE0zY2NFM1RMK1huMkhudXJTcE1od3RX?=
 =?utf-8?B?MEFXdHJmOG9iRFZYUFRBZVlHOElPbjY5b0MxdGE1bGRUeDE0ekw0cUNIQ3J2?=
 =?utf-8?B?Z094L1p5RUJUTnBuRDhDRjVNMjFRWmFUVmZNMmpmYytUbGl5SGZzcnFJZ1pF?=
 =?utf-8?B?c3A2UVh4VWh3NjZrNzBUWWM5Ym11T1Vka1F0WW50UzU0TjZxNGdNWllDMnY5?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 862b6ea0-71df-4f2e-093e-08de0fe8e2c7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 14:56:44.6694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1tADapacsFX21V7BeeFwhR52lFxLhdOrjk3M+SSCHXi8PpY17NLIN1sXhir0utAB4O5BU235L/ldZnDcI2QmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
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


On 10/18/2025 18:15, Marcin Bernatowicz wrote:
> Replace igt_sriov_disable_vfs() with the wrapper that also requests PF
> restore_auto_provisioning, ensuring a clean provisioning baseline after
> teardown in xe_pmu and xe_sriov_scheduling.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/intel/xe_pmu.c              | 2 +-
>   tests/intel/xe_sriov_scheduling.c | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index d1050ee11..9525655ba 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -1015,7 +1015,7 @@ static void unprovision_and_disable_vfs(int fd)
>   			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
>   	}
>   
> -	igt_sriov_disable_vfs(fd);
> +	xe_sriov_disable_vfs_restore_auto_provisioning(fd);
>   	/* abort to avoid execution of next tests with enabled VFs */
>   	igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
>   		       "Failed to disable VF(s)");
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index f0f2f29e4..5e8c87755 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -730,7 +730,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   	/* cleanup */
>   	subm_set_fini(set);
>   	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
> -	igt_sriov_disable_vfs(pf_fd);
> +	xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   }
>   
>   /**
> @@ -816,7 +816,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   	/* cleanup */
>   	subm_set_fini(set);
>   	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
> -	igt_sriov_disable_vfs(pf_fd);
> +	xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   }
>   
>   static struct subm_opts subm_opts = {
> @@ -925,7 +925,7 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   	igt_fixture {
>   		set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
>   					  &(struct vf_sched_params){});
> -		igt_sriov_disable_vfs(pf_fd);
> +		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   		/* abort to avoid execution of next tests with enabled VFs */
>   		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
>   			       "Failed to disable VF(s)");
