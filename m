Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3767CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 09:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3812010E6C9;
	Wed, 24 Sep 2025 09:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lei4sZzg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6210E6C9
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758705861; x=1790241861;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VZleCmyy3FS/h8aE1r/jwa9v0joy3gTWNIjUcCRx7gY=;
 b=Lei4sZzgR94ivx9mp3Se5aw7Do5yLIEGTynSgXd5zePhPAVBbimwRFkE
 4L1Z9HpkkdOcjFV1gu3aLU3Pozd9Q4mnUQzLmjslKrTkdU+FI4xXmuamK
 2ypUAVGlrZXm9evozEn8Yi914wGu2n4nhaumk/eXbb4/9fFzqmv9FJY+7
 qZOSm7QTbrl6eEHRp6Ilz8+5w1KIWVlBS2xq+tAkdNs0Y9hZNfcX5iaUH
 IXHMcAnhjG0mQWb6BS5QJaeqaXKp4C6nWzyKHs8+F36esV/H6/lOm7Vha
 YxD/xCsmuO6lO682+XMIjV7F1sUNNqxu+GRCy207hRof8YvTU+f7Qfo0c Q==;
X-CSE-ConnectionGUID: xbMD5QVuQwK/V9Mym7mdSA==
X-CSE-MsgGUID: djghn8U9StmrEOECA8e10Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63624081"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="63624081"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:24:21 -0700
X-CSE-ConnectionGUID: 9dLcOvVeQEKo9qrC60c8Ng==
X-CSE-MsgGUID: Mgccq/J3QYiRh7PoLLqt2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181003877"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:24:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 02:24:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 02:24:20 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 02:24:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPeD9cPkD9NPoYSLFejaOUUBWTnyUKoEu/Iz6CaEyBhFHFrLEaANMfAsc42+fR/CaXB+IlBm0IypgjYdHlO8qYZKVL/5B98RYRVPzTuZahqihbp5DdO5+ZgJGY2kLQQK+FTYnmFr4pL5HZadVz3LDW1YCMPN1WDaRlk1F8pjlnFbvOWs2PWE+a1drIdoOZi+HUDxT0jrjlko2QKzDQY+y9QeYKj7Ixsx+RNXJmf3JdxUmPfDtKQleIB2GxmYoUiTDdr4R6Wv3hR17fYO9v1XqSQ2k9vgS2AfsZq5WIaORFEO7wC9nZ9mE7l/dc62u9CuxyI6/mTc/uUhAKd/fixRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZxgoAIOhWSV0gWW7qXrUTBwTcRV+WS94Zrye98YM20=;
 b=pWfxoCfjdjwrP/CAV8sjav2YIqFaLWr1H3YDeqOIFXK8nQRfZXoPLoEkrPPAVO0ZSpm0bcNsf9NcyPDUFSMIh6zX7vAT7BZ6RTiElRr+EbGc/ldl6MPHuaebDPQWxycqPiUo7OEE3ZsGiG8sSaG0G+M30SxPwwYxsrqt0zHW7bfRnnTdrgM+wxfZpHtirvWos3g+0oLsWr9BUagHxmJY/7qrf5NFY0wR+83c0Lq5SEYoC0+eKq0r/7KXTmBOEnyRvhRsDY435PG2t/tmUbcfV9L8xv1/1jXzLlvtbeXWTUcbBTv8uliiU/DI2RREeWL9ubhQGye/sUR0kDSBQCRDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8578.namprd11.prod.outlook.com (2603:10b6:408:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 09:24:12 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 09:24:12 +0000
Message-ID: <6a7cd7bb-d2d6-4968-8341-bc66620a6672@intel.com>
Date: Wed, 24 Sep 2025 14:54:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v5,
 2/3] tests/intel/xe_survivability: Add new test runtime survivability
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20250912122541.2238004-5-sk.anirban@intel.com>
 <20250912122541.2238004-7-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250912122541.2238004-7-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f8bd91-9961-4187-104a-08ddfb4c1fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2pHRTM1ZWRrSVMweXFTdFMyRzBEeDB2alUyTkJCRGRhQ0VkelJvNUU3azFC?=
 =?utf-8?B?M2svTVhPY3FlZXBzVU5adnhtclZScTlvR1pSTjh5V01lZHU3ZVVha1p1SHli?=
 =?utf-8?B?TFdkTUVZUWh2bXpWTklYZC9ER2lHaTJDcm12Q2pWODRCUGRCSGs4U1ZMQjJa?=
 =?utf-8?B?SnJkclprUDBrM29RM1l0TmFsdXRqRWkrT2I1dkhBdExJejhTWmJtQ2tQdEla?=
 =?utf-8?B?cmRvdi9sdkpvN2hwOFBwOHBwb2JabXFuZU9tV0RHK09WSXB3RU1zSUw4WWha?=
 =?utf-8?B?d2kzcmQyV2hnamdBN2xuL1AvZVBVU0NWRU9ONnM4ZHNCbTd4NU1ueUUvT2d0?=
 =?utf-8?B?blpnV0JkQnpGME9DMEZOTnZnSk9lTmRoL1NrMExyQmxVSEE2TjkwTjBrOHU1?=
 =?utf-8?B?S2E5M0NuYW16VkxNTkt6ZkVyNWpVSmhYN01GMHRhbm5iU2NkOE9rYWlMQTZp?=
 =?utf-8?B?d2h3enk5VmUzOExkbnh3TFNCVlRjdU9XY0hUVmIyRHAwa09jVTNZSE5QRk82?=
 =?utf-8?B?MUgvZDNOT2ZObWlyRnQ3TC9COEVwK0hPQmNMRUprbnBKSGRaVVNyV2ZlNXVh?=
 =?utf-8?B?TmFmSVZvcVNvMlBINkF0dUozbHU4WGRkYlJpZWZhKzJhSWR1S2M5d2FKR3Fv?=
 =?utf-8?B?NTB3UTVPdG9wMCs3Q3pVYm0wV29qNS9qNDVib1N6OUQxaXgxUVVWUHlpRTVp?=
 =?utf-8?B?cCtXZXBuQnJjNHdGYTh6VFBxNUFDakFjcUtjV0hNOENPUWlhOERiV2dTUVc4?=
 =?utf-8?B?bHZyeGV6MTNUMGJ1WkJnaEcxMFV5MTlSb21vZmhST0F0UmtQREZnUlhlbGw4?=
 =?utf-8?B?OWJXTzBkSE50ZGhqT0VQU2syZ094dWkzNlVrUGRYYUlwOG5FZXFwZTFyK2ly?=
 =?utf-8?B?dFBHclk2RDFHa2NZVjlWWW9JT0pGQTAzSjdzUFpaNXN6Vm5KbGl6K0hvOURO?=
 =?utf-8?B?VjRGSi9HYzZKMGM0cTUvUGZXeWdGREtVWXFOWmNHbVJleXAzZ09KaS9ZY0Fx?=
 =?utf-8?B?UVcwelU4dk83MktycUFlVUZSQU9zMDQwZmQ2eTBsMVdPVXNGSHdNS0NhRWhs?=
 =?utf-8?B?alhSdjdhTlZMNVBlM1ordVBMU1QxWTJvQm9aaHRkdTREc2dxWEpQNnczcUpr?=
 =?utf-8?B?RjVyOTg5TDZWL2lxTVFWZEQ2a2ZtR3hPTTUvb2JkMk5QOTkrbTJUc0dkSVg3?=
 =?utf-8?B?ek9GQTk4MVBhTGRNeFVPejhtZTJRaUpycmRZL1IvcjBjNnBuTFpIbGJ1TDc1?=
 =?utf-8?B?amlzN3lBVys1d0JpaHZSSWM5L2d1SFhZZ1gydW1LMWQ4SHB3WlJwTkxlNjhZ?=
 =?utf-8?B?TVpiRGFqMVNPYTlrSnNiSVZPbUFtSFVDTUhpcENtbUlMTEhXdTE2YUhhZldE?=
 =?utf-8?B?MXdDNURnMjBzSmIxNGJhb0x5ZDAxa0djbmZoT09LbHVyYUlPZjBtY2RnSlIv?=
 =?utf-8?B?Q0VjSDhybHUyMFFFeUlSMGtKL3ZVUHFjV2FqV0dlci9Xb3ZESGpxYlNmUU1a?=
 =?utf-8?B?VlpPb09HMlM4eGNQRi9LMVhNUmJ4SzdrRHhpZWE2RTZxaFBSUFByeHF3V1BS?=
 =?utf-8?B?UE4zblZHbTlwOXJ1TXZTYkhKOWVZejl6aXBmTjZtdHlYNGVGSndwWGZWNzkv?=
 =?utf-8?B?ZS81SkgxWUZsL2tDdXlyTE03SEpYYXRTdHlDTlVqSTNXZUhOMlZYc1dmUi95?=
 =?utf-8?B?QVNpZy9sWEIrZWtiTTIzMlc4Q3hZaWkySUtqaE1MMUtlMGJmd0dDS2VmZ0hU?=
 =?utf-8?B?M3VUMUFuNXpDWXdIdXFtUVFoQXRVU3B1TEVaK29FQWNXMldhYkx6TVFSbkVO?=
 =?utf-8?B?UDlwM3k3dFpaUnZxcWU2ZlRCdFBpZkNQYzVWbzdiMTZtZTE2cTdNNWVFaDBy?=
 =?utf-8?B?YXNPY0tTUGxBcjhDTlRYY1RVbEJaTWlFOWpzd25KZmp6V3g3TkFsdzh3eEo1?=
 =?utf-8?Q?7Wyyt0a70Ew=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlJkUitFOEtPeTA2TUZZOXhMMndaSVZvbWhHQ2pXTC9uTkVxeWhtVDRwNzdu?=
 =?utf-8?B?TmRoYVgyV1FYa3RVbzJPWXlZbEtJME9XTHF1aVpwY1pKYzZycnpNM3JhMlVX?=
 =?utf-8?B?WlRTSzA0cG9sU3FWaloyU2JKazFVcE9jL3RBbnMwbFVUcXo5eU05MVNiWEdX?=
 =?utf-8?B?ajkrTFFnL1g2cGVMOWc2bUNBc1NGcE5IaGFySUY3b0kvbmtLaGJpQzNQSllX?=
 =?utf-8?B?TVc1ZlJzaUhxNFUxME1RejhtTEtNdXJoWXpGZVhnVjUvMHpCV3pSL3lWSisr?=
 =?utf-8?B?R2h2UDE4V2dJRHZyYS9LNjgzTHJoSEpvSDEvbTJFMTQ0ZzZrTEl2VFVMMXNJ?=
 =?utf-8?B?OUpPZnJ6T29Xbm81aUxSL1RTK0lVcHBkK3Y5bnFhRU9tQm1HZGowZlM4MUVx?=
 =?utf-8?B?dVhnYlFwZ0lWRTRveHcxTnZzS0lzalNJZTNma2xGNEFMQ2lDUmE5VEZDdVhx?=
 =?utf-8?B?SlVTTkMvSy9zazVoL0xndG5HV0RJRjRKSzRMc1RLd2ZQRDIrTHZIcTkzSXJh?=
 =?utf-8?B?Y2dUUWJONnMzUkRnK0pwanFWd2pPZFdZbk1tVm1IZkI4UHIwd0tjUE01RWhU?=
 =?utf-8?B?cjkzMUlyY25SVTZiMkUvRkU4NWdJWXhGbHlzNFpqcHpkeDdIQmZ5R0EvZXdz?=
 =?utf-8?B?R2ozT1BuS29yR05FR2w0aWJRZEEyRmhNUVI0K0FzQm4xTXM4MjN2U1BqaFRL?=
 =?utf-8?B?ekQrdmJLT3lSWTdzbUlnU0JlWGVFMzJ0Qk95YnJLOGtUWG03eSt2VDhLQVVR?=
 =?utf-8?B?QTNmNXloU2hRbm11NDluUXRYTUNUVDhQdlV1ajI0VE1WVlpIRnl3V2F6N2pt?=
 =?utf-8?B?a0prUWNYTjVDeXZtRXAwcEdoSzlsR0Z6YTQ5Wkk1a1c5NisxRzk1ZmVGaFQ2?=
 =?utf-8?B?dG9vTkgxV1lMaWxQdnNKTmtTMGEvZnFKR2cxNjNuK1pRN1ZKNzNXQzVhUXhV?=
 =?utf-8?B?dWg5RnlHb3l4M3BYRldsN0YvVE1xM1BmTVFXalRyckxSdWxpV1B0SCt0WkdW?=
 =?utf-8?B?VG9SaWNIRi9OVFpGdXNZeVRNRWw1aVJiZHUyTEpYYmpLOXphWW9TVW5XS3JF?=
 =?utf-8?B?U1BZNHQ5RHY4UnYyYmE1aVFqVmNqdzA3Mkd6d1kvS3g2NCtGdWhZMmp4ZkRV?=
 =?utf-8?B?SHB5U1RCc2RmRzFseWx5TmlyZVBkb0V5TzRpR25JRlpKYmUwYVRjc3lCM1FI?=
 =?utf-8?B?YTgxT2Y1U3ZnWGthS1J5TUhIVzNqdXIxNnJJc2IwVUV4SWtaQ0U4Qy9GNDZp?=
 =?utf-8?B?MWlCTlRKeXFQMUJINjBrOFd0dk8yLzJ6UW5xL0hjNkpnNmNENWZUMC8zSnF3?=
 =?utf-8?B?UXNCb09NbnpaYW9KYU1XK1BrMlR2WmtSNXN1RVM4U21MdkM5Y1JYT0lIKzBa?=
 =?utf-8?B?d3RTempLTUlPSXFPT0dBWHpEcEhsOGhjVWJjd3YxdzcrbDVxT3pvL0N1TXJy?=
 =?utf-8?B?b0xRVG42R05xT002QnRDWWR3ZlBaUWdib3owblFMcmFvclUwbFZOcWZnY3FH?=
 =?utf-8?B?WDZtNUpaMFNnSGFXREV1cVFCalVyaldaNTVRQU9vVkZ3T3dxWjZGZmN1L0xT?=
 =?utf-8?B?YWxDMWJ6OHNBaXRHTGFkZ2VTOHJSTDc3YXozMXpQb3JiQnh3akYzL255SXJ2?=
 =?utf-8?B?aUVRelI4T3kxSWRLbXp5RlR3QkR3ZXhxd3BFSitrbXozZ0gzTDhNZUFMMFU3?=
 =?utf-8?B?TDFHWWxwNmNTbnh1Z25SZFRXOEN0Y2c3eVZuVlplLzZBRWttZE94eklXcTJF?=
 =?utf-8?B?b2pIbTFJcDVaWUM1UUhaTlJGOGVoSHRrekhaMWpPVnBBcXBDREZVOHJ3anpM?=
 =?utf-8?B?ZlV2RDBpQjk5Rk56TUlsZzl5cGdaZXlmV2hhODRrdzc0NmdXMWhzcHNxVkNJ?=
 =?utf-8?B?SDBTOHRBMEhza0xiU2V2alJRWTd1V2tQY1VoWWlzY0x1WjJSUHV1ZjdPbllY?=
 =?utf-8?B?aGI5NnJ4Wlgvb1FQM1hKcThIT3lud1RzeDVUaGhwaTBaMCsyNDJaUWp0cDFC?=
 =?utf-8?B?NEJ1djBOaEhYZEMvTmV4cHh2WXJ5RWhJSWg3alNRNnpxOWlJYlEwaDRxOXNH?=
 =?utf-8?B?ZDhDcmQ3SDh4MmNKWVZWQ2hTR283R2Q3WWN3U054VlA5YXVGRlIrTjlPYTNR?=
 =?utf-8?Q?jwJ0U9KDG5OSyt+/Sm6ji1bqa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f8bd91-9961-4187-104a-08ddfb4c1fa0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 09:24:12.4593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVM2WZyTAmgugPcKLTnJ1q2mbwxp5uzMcREFSvaAEdJ2Hk6Sm5e8xLUi+mKdK5VO2gc3HJZ+vyaHdvXIFVb7nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8578
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

Hi Anirban

On 9/12/2025 5:55 PM, Sk Anirban wrote:
> Inject a CSC error through uevent to cause the Xe device to enter a wedged
> state. To return the device to a normal state, reload the driver, as
> the wedged state can only be resolved by rebinding/reprobing the driver.
> 
> Check survivability mode to validate that CSC error injection correctly
> triggers the survivability state transition.
> 
> v3: Update commit message (Riana)
>      Modify the uevents interrupt handling (Riana)
> v4: Move test to xe_survivability (Riana)
> v5: Use separate function for sysfs (Riana)
>      Cosmetic changes (Riana)
>      Use basic spinner (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_survivability.c | 93 ++++++++++++++++++++++++++++++++++
>   1 file changed, 93 insertions(+)
> 
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index 72bc9e0a2..7b27bbb25 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -4,6 +4,7 @@
>    */
>   #include <dirent.h>
>   #include <fcntl.h>
> +#include <libudev.h>
>   #include <limits.h>
>   
>   #include "igt.h"
> @@ -12,7 +13,11 @@
>   #include "igt_fs.h"
>   #include "igt_kmod.h"
>   #include "igt_sysfs.h"
> +#include "intel_allocator.h"
> +#include "xe/xe_gt.h"
> +#include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
> +#include "xe/xe_spin.h"
>   
>   /**
>    * TEST: Comprehensive survivability mode testing
> @@ -25,10 +30,24 @@
>    *
>    * SUBTEST: i2c-functionality
>    * Description: Validate i2c adapter functionality in survivability mode
> + *
> + * SUBTEST: runtime-survivability
> + * Description: Force Xe device wedged after injecting a failure in CSC
> + * to test runtime survivability mode
>    */
>   
>   static char bus_addr[NAME_MAX];
>   
> +static void ignore_wedged_in_dmesg(void)
> +{
> +	/* this is needed for igt_runner so it will ignore it */
> +	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> +				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> +				    "|GT[0-9A-Fa-f]*: Failed to submit"
> +				    "|Modules linked in:"
> +				    "|__pfx___drm_");
> +}
> +
>   static int check_survivability_mode_sysfs(void)
>   {
>   	char path[PATH_MAX];
> @@ -42,6 +61,39 @@ static int check_survivability_mode_sysfs(void)
>   	return fd;
>   }
>   
> +static int check_survivability_and_uevents(int fd, struct udev_monitor *mon)
> +{
> +	struct udev_device *device;
> +	const char *dev_path;
> +	const char *wedged;
> +	int dirfd;
> +
> +	dirfd = check_survivability_mode_sysfs();

Patch looks good. fix this as mentioned in previous patch

Thanks
Riana

> +	device = udev_monitor_receive_device(mon);
> +	dev_path = udev_device_get_property_value(device, "DEVPATH");
> +	wedged = udev_device_get_property_value(device, "WEDGED");
> +	igt_cleanup_uevents(mon);
> +
> +	igt_assert_f(wedged && !strcmp(wedged, "vendor-specific"),
> +		     "Expected WEDGED property to be 'vendor-specific', got '%s'",
> +		     wedged);
> +
> +	igt_assert_f(dev_path && strstr(dev_path, bus_addr),
> +		     "Expected bus address '%s' to be part of DEVPATH '%s'",
> +		     bus_addr, dev_path);
> +
> +	return dirfd;
> +}
> +
> +static void force_wedged_csc_error(int fd)
> +{
> +	igt_debugfs_write(fd, "inject_csc_hw_error/probability", "100");
> +	igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +
> +	xe_force_gt_reset_sync(fd, 0);
> +	sleep(1);
> +}
> +
>   static int find_i2c_adapter(struct pci_device *pci_xe)
>   {
>   	char device_path[PATH_MAX];
> @@ -137,10 +189,23 @@ static void set_bus_addr(int fd)
>   		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>   }
>   
> +static void test_spinner_after_recovery(int fd)
> +{
> +	uint64_t ahnd;
> +	igt_spin_t *spin;
> +
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	spin = igt_spin_new(fd, .ahnd = ahnd);
> +
> +	igt_spin_free(fd, spin);
> +	put_ahnd(ahnd);
> +}
> +
>   igt_main
>   {
>   	int fd, configfs_fd, configfs_device_fd;
>   	struct pci_device *pci_xe;
> +	char pci_slot[NAME_MAX];
>   
>   	igt_fixture {
>   		fd = drm_open_driver(DRIVER_XE);
> @@ -148,6 +213,7 @@ igt_main
>   		set_bus_addr(fd);
>   		configfs_fd = igt_configfs_open("xe");
>   		igt_require(configfs_fd != -1);
> +		igt_device_get_pci_slot_name(fd, pci_slot);
>   		configfs_device_fd = create_device_configfs_group(configfs_fd);
>   		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
>   		igt_install_exit_handler(restore);
> @@ -158,7 +224,34 @@ igt_main
>   		test_i2c_functionality(configfs_device_fd, pci_xe);
>   	}
>   
> +	igt_subtest("runtime-survivability") {
> +		struct udev_monitor *mon;
> +
> +		igt_require(igt_debugfs_exists(fd, "inject_csc_hw_error/probability",
> +					       O_RDWR));
> +
> +		igt_debugfs_write(fd, "inject_csc_hw_error/verbose", "1");
> +
> +		ignore_wedged_in_dmesg();
> +		mon = igt_watch_uevents();
> +		force_wedged_csc_error(fd);
> +
> +		igt_assert_f(check_survivability_and_uevents(fd, mon) >= 0,
> +			     "survivability_mode sysfs not available");
> +
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
> +		fd = drm_open_driver(DRIVER_XE);
> +
> +		test_spinner_after_recovery(fd);
> +	}
> +
>   	igt_fixture {
> +		if (igt_debugfs_exists(fd, "inject_csc_hw_error/probability", O_RDWR)) {
> +			igt_debugfs_write(fd, "inject_csc_hw_error/probability", "0");
> +			igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +		}
> +
>   		igt_fs_remove_dir(configfs_fd, bus_addr);
>   		close(configfs_device_fd);
>   		close(configfs_fd);

