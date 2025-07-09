Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0122DC83F03
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 13:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA03610E7D6;
	Wed,  9 Jul 2025 13:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMurNiHf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E12610E7D6
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jul 2025 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752066056; x=1783602056;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d76yLCb4sujCz1SaRcc8CoK02RfGcPUmKbs/6Sl8BXw=;
 b=SMurNiHflAzyvU/Zd+MZGl6D6JKPVq4uM1CvSNvjOWCIqObIhWlmHnXH
 9PmbTdhXER8GN2CvFWSFEy5FhrBYY19cj+bo+EMkW1QnLgw86cgr4bpE7
 4eNHoBgF0etu8vh3wbROYF2Wlo6j0CzkPuxk5hoMt/TBckRkr6StWn/HL
 xGjfG4DHyFPOCo8gJfqhwahDOzDpGhtyHpXwyPUgQRXPjyVG/MPKPora+
 4GNzObnCgVkVjk51UO0KujYUbQBOv9RLUG4CfxIRXVgjmPYFNyUUEZZVz
 sVe+CwS8anf5rFWLhzfcUBszI71MMQaC2aNxiLm+wNhbvqjXudMWx0oJz Q==;
X-CSE-ConnectionGUID: 3R8SNvifT7+qg2urbP142g==
X-CSE-MsgGUID: 57loDlpMRPqIQ4aTzEIe1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="57991958"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="57991958"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:00:56 -0700
X-CSE-ConnectionGUID: uKL6sPlVQ9uAFnqZpLG6gw==
X-CSE-MsgGUID: UrE1R/8hQ2SlU451blFppg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155856124"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:00:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:00:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 06:00:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.64)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:00:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ej4cIVEG4UgOWg/wO6X/MVoY7xie8Ya8naoUAZSb7k3wx/xMyY9cS7rrN1THm5Mpr+vjZJEnBvIOgYJwjJy3IPaDxBweDjrOJLppo06z4q+/nE6KvEAu0o5wwC4SLegwrxt4jMdrcpXkLc7WtvGyf/Ph17EaY/Sc9Dd9nZI/fgyGHLZbiJycKeKcsbaIjjgubbi2roGzWR8kGRz3pIKKY3+kS4WD6sZNFpIpjzCFMfxxrYrh85n+V/zVsO0G8Mb1C/u88zcXV3ZlPJsnb4VrQ3f/YeftKvEBzTpOt/ehO4qkyGuMUkRtfqBBAoEtnUdjmLK49/wmGpnSPRSThFtOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sor4oKFsIbKNyH+Kro1AOQzwhYMCrTk67Ptt/QcUNZI=;
 b=lk+T8FKp5IQ1AoPl7sgvbiUXI2S6dI9u8x4y0hQLcJcwJLXnpCtDiAFu8E68YDpryKViEvRpVc8U8uwDwuRPPhTocmqj2Fi5xq3UyhAfOnC1gYu5ApLW9WLnxu9LGnKx09nwaSeQdKT5rGmMgdLj2/9bryZ3Dj1KyLI36LuXXah+/mh0MykxgKkoiU9WfPIWUfRlggwPTwLbooCG9REAUWANMFNtXGzA2R+CAlUrwOb6gwvdICskEIpzGX1si/EF20IoPRNYpKgs3hGDzgYFHWrLXXY6lrKdJT7eQe9EDqs/zNSA+mKNKwAsDvbjMru7nbK3KBcRjq7m/0nnCUAaYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by BL3PR11MB6459.namprd11.prod.outlook.com
 (2603:10b6:208:3be::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 9 Jul
 2025 13:00:52 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%7]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 13:00:50 +0000
Message-ID: <8dbb8dc1-2954-460e-a572-f5708ceca549@intel.com>
Date: Wed, 9 Jul 2025 15:00:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 3/5] intel-ci: Add symlinks for old i915
 blocklists
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Michal Czaplinski <michal.czaplinski@intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>
References: <20250708152808.59977-1-kamil.konieczny@linux.intel.com>
 <20250708152808.59977-4-kamil.konieczny@linux.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250708152808.59977-4-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::26) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 48424e95-36c2-43c0-580b-08ddbee8a14f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2JERWh5L2xDSnBVcENNbkhCSWg4Vkk2b2tKSzNRcVhobU1HRTRxa2RVaXd5?=
 =?utf-8?B?eXp6UTM0SEZUWndxcitxcGVheGZCaXlUMUZ3OGgzWGJPeTdXZTdkbTA4OEZW?=
 =?utf-8?B?TUMxTWU2SHpZajVZN29rT3RibkZUR2IwWm52ZCs5YXNWam9UVWdsdkVrVjZH?=
 =?utf-8?B?aWY2TFBGdU4vZFFrZ090OEtvRm1CQ2lsTlRtMHRFSmVQUmdiai81NXVFWnNp?=
 =?utf-8?B?dHEyenA3dEVHWWJyVGw5V1k4SVl1M0FWaGJKMW9HWEdxbWVNdDVnTE42YkVj?=
 =?utf-8?B?bnJUMXdQZENDZ2xyTEsrNTVXbkk1R0liOWk0RjFsQVNhWmdhcXYrSStNT0pj?=
 =?utf-8?B?Zm5mWFg3M2lhQmFXck9pVnNwTjQxM1MwNDQrYU1kWkdRbGx4V3djUUptaFpZ?=
 =?utf-8?B?WnR2TVRPWTREUTA0b3NGMWtlN2NhL1htbWk2bktFcW05YXBldlQrbTdBYU9l?=
 =?utf-8?B?QmxzRk5NT285LzdnNTBwb0NQd3p5b2YvRjRQcmh2SHJZY0lqNnBpN3l0R2N2?=
 =?utf-8?B?TGp3ZXp0UFBOZVBscnRqNDNEOXRObGMrbTNvakxlemZuTHc5dWpGMDR6Mmdj?=
 =?utf-8?B?bWFsWHJvZXdkc0xZZXRMREJvbE5weDQ2V3NVbXdLaFdXTHBzZFFCRDJ2VmU2?=
 =?utf-8?B?UW56elBVMGRKUy9aeTFlcngvckRGc0lzTFc3Rk5NT2dnZGV0eWZDK1pReTRJ?=
 =?utf-8?B?emUxNDVqNVp0ZmMxNUJMTnRkUGR2aGJmWTk1dGVFYm52UE1yd1lsK2hqNWZE?=
 =?utf-8?B?OGJGdjk0OE53QVBEbTJ0QVNDTkJaSnFpZFZ1N2t4ZWVDOW5UMXQwSkRXMWtL?=
 =?utf-8?B?d0grZFdTaGlTTDB5bDVodkNIMGxkOG5HaFV2dDRDVUFvbit3V2pOeUc1KzlY?=
 =?utf-8?B?Y2t0WUdaN3o0bDhiZFc0eEVpZ0szWlFiMUNCV0tkRGRER2tlTXp5aDZQc3E0?=
 =?utf-8?B?cGJ6NUY3dlF5OW9iRnY3bzd4cEtNSWRPMUcxdk9FM2ZGT2NvdnNwU21ZakZD?=
 =?utf-8?B?djdGYy8rc3hnMzN3bnZRYXRBQm9taTE3clozZkcydVNSQVpoeGpRRmMxTW9G?=
 =?utf-8?B?c2UxRzJKZ1A0eUpxaXBpQnowdWR0VE55QTJDUDcwa1ZFVCtiZDlxLzIzMDZB?=
 =?utf-8?B?STk2ZExKSFVpbFo0RVJydUZHckNrNjF2cC9FTG9PUG5lK2lQRms5K1BmNFpq?=
 =?utf-8?B?bmdQcG5EbGJvclVQaU5nMjRkeDlBbldjdXl5cVZEbkhXQ1d6cVVvNEtzZDMv?=
 =?utf-8?B?RDRwcm15Y0o1SVlWL0h2RXcvMVpUMEM1MDNRcGw2UnJOSDVhaVZWRXlyMTBm?=
 =?utf-8?B?d1ZOVXFmZEszTFIyQmowMTI1UVZSUXJsZUpYMzYwQ09SMjlxQzhiTkpjYzZT?=
 =?utf-8?B?MXRmYnBMOHhkMFdJUHQrOTN6TVNuaUxiVHBlN2hNRVNQUER3R0dUTjV1a0Fs?=
 =?utf-8?B?T1BnUzZCaHN4UzJqZ2pQSWRJYzh6SWRzdVdsL3djNHpHbU5KWFR5dnhmRk1z?=
 =?utf-8?B?aGZvTUtVdURkZnpMZlBYdWxBR2UvZ2Zxcld3MURkeXNubnBaNGt4N3A5aVZQ?=
 =?utf-8?B?RjdSRWhlTjlzcjZtNWtKZytEQkd6QzBtRXZnSkkyZnNsdmgxTlFqTm9JTmRV?=
 =?utf-8?B?a0lYb2hsaDZmRXlRVENLRi9ic3lEUUJ2cDAxN21FQU1oSm9OR0YyUHJqeGdG?=
 =?utf-8?B?ZjJHQ0g1UXBwQi9VM3hJR3l0RzdlZEE3YmFsZkhKMWZLUXVQSlpjVm5oYXUz?=
 =?utf-8?B?eWxobzRONnloa0N2M1FKVjhMd3ExUTB2aGMrQm9INS9CZjcvMTdyQ0k3NDN5?=
 =?utf-8?B?bTBDOEJCVXhpTFRKU052M1FpaHpFUzlmL2lDWFRTdTlRZGp5bSt4UHBBa0hm?=
 =?utf-8?B?SzZ5UDZpVHppZVNUTTF6UTh3L0EycXR4VGc0UkZ2Sjkzdzc3eVJZM05UQ2lj?=
 =?utf-8?Q?JvW+dKSOOF4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUJ3bFpBUE1mOFdnRThVV2JYYnBhbUwwOVZmT2ZxTTN6aEN0S204U2JKcnQr?=
 =?utf-8?B?VkdsV3E3eHdram1aYTk0MHlPMVcxTkY2L1lOekVTcHlmcVE1dHhxSmxKclc1?=
 =?utf-8?B?RTJVNmxCbEhMc1I0bnZOUE9SS2pCNzhUYk1zVjdiUEdlM1plbkFpMFZabHRE?=
 =?utf-8?B?UlBaR1RGSytEVW1OY0xPVzI5Ky9JaFdEZENTU2dlSzhBaVZTS0xyd3NDSWZS?=
 =?utf-8?B?cEpVeTFyZnd6cGgxZGQrbFZpblUzNHpuS2wzVElYQ3BEYmtPZE5lSzJUV2pF?=
 =?utf-8?B?azdYZTNtek5kOWd1UW5wN3lUVjIzaWdaTXBIVnJXN0hReWhnREQvUlNtRHhW?=
 =?utf-8?B?M1dpRkRQUmFEQjRqWVVlOW9Kd3ZRWmhIbzFqMGFkOHRKR0t0N2hPYkxZQXhw?=
 =?utf-8?B?a29TM21Pb21LL0djS3dIaG94YUptWnROUWJPdzBjTGQ2WjNXNWlVbWtwRFRt?=
 =?utf-8?B?K0JBaHBnek5sWUQ5U3RBSXZVcEJIdTNuWG82aWkwR0w4bTZqb0prSFRaZWN1?=
 =?utf-8?B?UEdiSDcyQ1lEb3pvdW1lU2xQS0dQaHFvVWZaR1p4QVhJWjVTSzF4ZGZHeTY0?=
 =?utf-8?B?Uy9OTEtkVmI5dDgvL1ZvWUJyRmJLNXNXdVNwUVpYUm8zVWNpMzNoUlJOM2pp?=
 =?utf-8?B?bmJiTWo0QUo5cWhxNW9ReDM4UTRxR2RDSVBXUWJqQUo5Z29pcktUekJsZWM4?=
 =?utf-8?B?R1dvMTBZQmUyZ2tBYndaN1V5QUdqblJ3bWhtc2pmZHhUL2hIY2xLdHQ5Uk05?=
 =?utf-8?B?cDlrTkdEK1VTRm1WcEQyOFZ2VWRvZFc2cnpCdEJDejJXcWZxdUxYTHhkekVM?=
 =?utf-8?B?b3k4eGdkc3Z1SU5EbkEyVk1rQzMrdmhnSUlaMDl1OHhZdFU4M0ZDQlN2blVP?=
 =?utf-8?B?UCtPdTNkWGw2NHRsQmttYy8yWk1VS0cvTnUxaTZtNnlWSHRMN3lPYkVuUnRW?=
 =?utf-8?B?THpJcjlpL0hxZnF4S24yVmZWVlIvdzI1TGZ6WGFVYjJZcjBhUUZ0am5JV0Zu?=
 =?utf-8?B?dW1Kd25GRWpJTXJKcVlKRmRic2hkcGRYM0F4VWtSTmV1VEREOGJpYS9HYkdU?=
 =?utf-8?B?a0RXUHhtR0NPYVY3TFRzTjk1TmpRR2pDOEEwK25OOGcySk5vNStoRDd2dEJ5?=
 =?utf-8?B?QXg5ZzBOU2p6SzlPSUNETE1TWGRNd3MvMHArZ0tsWTVsWGV5ZWtXSmpaMi9n?=
 =?utf-8?B?eFhWcVNFN3RUOUN1UHB3Y1BLaEVRYXFxTFJqSlc4OHBJMFpFYnpQb2RWZUFj?=
 =?utf-8?B?U2EvZE9ubHhXZFoxU29sT3V2MEtna0lSU0Z6bGhQZTN6YlVVWUtLOVVJYXZt?=
 =?utf-8?B?ZDlvSGswWlhpbndDY0lEektic21MWlVIdmFZVS9JcUVXNUtrMHVhUGR0aFli?=
 =?utf-8?B?WHFxV1ZpL2FKVU5PNzhWaHRBYXovRUpUeEpZTC9Wa3RtL1lYaCtCbkxvZjNt?=
 =?utf-8?B?RVhEY2xjakF6bjdpQ1hRbHhYZDU0VmxQd1psaXN6NU1yNkxrRE5EbUMwRkZt?=
 =?utf-8?B?YkwyRFYzbUxtZzdsejlPVHFwY0Vxd0hyZXJpQXBnellIUWU1bWMwL2xpTnhP?=
 =?utf-8?B?K0hnMG1veG1rdm50WG9ibnBBOU00K3NBVXNFWlRJZS9Db2NWL1JvQ2hETWJS?=
 =?utf-8?B?VEUrL29WZkQ0dzFQaVlYSVVxeE03cHNtYjF3MjNEQlFKdFd0L0tXaTNKRXQw?=
 =?utf-8?B?RTdBV0pWcXVJQmkyb3VROTVjZmF6aDF0cmpPUndLVmpPYU03cEZlNHZLZ0kw?=
 =?utf-8?B?L2JFYk85ZlJKNUhJQ01TZHlPL2xHbE1OYVdCRkZuMVk2S2gwd213eDVtNUFt?=
 =?utf-8?B?K3RHbktZUEFMSHFFS0JXM3o4aHJEcUVxVlVodWJEZGF1Nm1IRWRhdlA4MTdn?=
 =?utf-8?B?TXpvNmM4aWVVcG5GS0pPWHZKYk54eml3WEhWRzZ0R1JhWUZPOURGS3FrZHdB?=
 =?utf-8?B?Wm1zOTlxYUhQVnI5cW4zWENhbU1MaCt1d3gveDNKSGt5QmxuTCtlbXB2elA2?=
 =?utf-8?B?WlU1VG9qZ1BkNE5seENTNWNlY240UzVOVVBpUDJyc29LOHZscTlHN016UEM3?=
 =?utf-8?B?ckpvZ21UOGhWRHI4TUV1eXNXRVE5dEI5aHBJMDVsd3RURlpLTzRnZUdyV1lK?=
 =?utf-8?Q?GGAhDo82X0FJlCVaQHAHzJaoK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48424e95-36c2-43c0-580b-08ddbee8a14f
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 13:00:50.7880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/09TaX1UFZYQdZWvtfsyqwEd42ZdRS6F76YJQ0P2Ik+F7zP4ytRNt23C7IXPCuaZMQr9Gnsy8Gt3mNKZY8icA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
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


W dniu 08.07.2025 o 17:28, Kamil Konieczny pisze:
> Add symlinks to make a transition easier for CI.
>
> Cc: Michal Czaplinski <michal.czaplinski@intel.com>
> Suggested-by: Ryszard Knop <ryszard.knop@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards

Andrzej


> ---
>   tests/intel-ci/blacklist-pre-merge.txt | 1 +
>   tests/intel-ci/blacklist.txt           | 1 +
>   2 files changed, 2 insertions(+)
>   create mode 120000 tests/intel-ci/blacklist-pre-merge.txt
>   create mode 120000 tests/intel-ci/blacklist.txt
>
> diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
> new file mode 120000
> index 000000000..124a31dbf
> --- /dev/null
> +++ b/tests/intel-ci/blacklist-pre-merge.txt
> @@ -0,0 +1 @@
> +i915.blocklist-pre-merge.txt
> \ No newline at end of file
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> new file mode 120000
> index 000000000..ffa658927
> --- /dev/null
> +++ b/tests/intel-ci/blacklist.txt
> @@ -0,0 +1 @@
> +i915.blocklist.txt
> \ No newline at end of file
