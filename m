Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7771DC36005
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 05:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BE610E185;
	Mon, 28 Apr 2025 05:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ws8xY9Ww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A1C10E185
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 05:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745818616; x=1777354616;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xSzhUpCFnVG1c9uq5y1Fv2DTGi9PQaJJNuXnP9QzB2o=;
 b=Ws8xY9WwGCMXs2ROU8uJfD6AOeVhBlDfm46fLQlLbw9F1ZzxCgVet+5a
 5bkEMdbDSnBL84GJauBYjKCfiNc0L0y2m3mhIcWWzqAJ568c+0dQpLakO
 nz+yelnSV5MuyeJGgEFXlyIWqOwQNyO9+AS1izbFVO71KCBTCVa45yBUS
 7XB2tXGN/i8x8y8waQHnC0GWETd5z7h/d0/a9GGthqIVZjsnQAJrc7rpC
 30JnDCSLNQWW5xwDf8wSvrOM6FpRATsjk6rrrgBvmTkEzQQg7qbKssCHU
 ixWeasPf8ULXuuh4TS/TcufDZ0XrDwF1sacpD6ZnXi1WtKr2XceyAGx78 A==;
X-CSE-ConnectionGUID: 97Y0zFOiQXW55xSLElKLZg==
X-CSE-MsgGUID: J4kqAPE0QcSrmxoq4CsppQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58038475"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="58038475"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 22:36:56 -0700
X-CSE-ConnectionGUID: INAoHppcQjK3/ovqzZFtXQ==
X-CSE-MsgGUID: WqRW7WRWSLm05xSvj6Tp9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="137467690"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 22:36:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 22:36:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 22:36:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 22:36:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYg7Zl6Anq1ghLXFdhXe7oaaErwKLWybrL+BiYcLhlNETLrZssu3ggRNuQeyuUv7Zi4RVPEp7FaR7jsSXPIuK5ePkBCroNjkxvA/NuCfpLWICOuhG8XjeZhu+pXgUN6Nvo1pqPdsNONLyvRQoayRO6q2ateZ6cZvDvUIWe6q7+fmrz4mVWzfdcdzS4NBdvoiekk4Ci1NpB9VvV7cwcRnfo/mesoNZc/olKAWJjus8SGIlePBwLGn5Xuj24IhcLXfLPYQwOVE7a5woBl0dmnpJxlnn8HlqgEhaHKp4OM6+KZFUn3lJFzioXBWqs7W2VxQBDhZTgZRHSp8bYe/3r19Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmObcGjv4kxy+FibBtEW0qfu+GWg7Vdyh934rwIBe28=;
 b=k0hV1D8MK1HlTPW57IKuZTyw8sVV/3x1f5hcjvmlqnE9tTwuwgR1mTjDYWDGofTqkJPBXGx1KvLyeU8Jlmc7fU4eZy2D6pf6nNYnS4CLtBfPDOLnVKXL88Tar8C0XC/0BULohwoiqcFW2VhVZqM9U42CpN7AW37fB53dXB8RppRBxQJ3vKa5YE/iDSmSuhxMMgcGhfl031B3E8NG0dr5HHsPhhfuMfyvezA9OoS49gwSUUHEFauT7gE+Uy7Hltsng0TviT3b3sCi7eAtq3c72/L9WEkV8WvblhPQSs+y40so6chlC8TkOySD7/XctUTzUEqgbDbHrDsNKwJXUwAOCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MW4PR11MB6619.namprd11.prod.outlook.com (2603:10b6:303:1eb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 05:36:39 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 05:36:39 +0000
Message-ID: <3f88eb7e-f2e9-4b45-8b6d-61156db5b2e4@intel.com>
Date: Mon, 28 Apr 2025 11:06:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe_pmu: Fix frequency stashing issue
To: <igt-dev@lists.freedesktop.org>
CC: <ravi.kishore.koppuravuri@intel.com>
References: <20250425180658.2533825-1-sk.anirban@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20250425180658.2533825-1-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::7) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MW4PR11MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca83f6f-9676-4e1f-4b68-08dd8616a5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czdTZmZwOUdqam5SZklEVTJYemdwWmJUcG9pTHFoYVBuV3BjMVpQQ0JuQ2ph?=
 =?utf-8?B?N1krU0NIZDhXbVRTRnVWQU84SjhaOTNvcnZ5K05EZW4wdXhYdm1pOGRMNTNi?=
 =?utf-8?B?WDg2V3pRUEFkU2U4akVhUjRmdmJDYStIa1NlV2lDbVk1WnQ5ODNjd2JrcDhC?=
 =?utf-8?B?ZDkwbnhnZ0hWdThXQ0NMbGh3VFN0VEFGVUtmTEUyM3o5dklUYmN4VEsrQjYy?=
 =?utf-8?B?VWtkVEkxYnVPTWp5b3ZjS3ZKNTRiVnZFTUhSYThZMVFvcjJuNnVEa3FsQWhs?=
 =?utf-8?B?U3E1bnIzRFpma0tlVjJtQUF5SWgyVTdDUEd5eTJwUEV6V3VxbnUrNVpLSEk5?=
 =?utf-8?B?RUVNRFJMYlp1UnQ5dEFXanZCQ2NJeTVmUGhKa2V6bU01QTkvNlBMTzI3YjBT?=
 =?utf-8?B?dGs3RktJRVFrK2duYjRWeEx2dERnVnh0N3hHMGJxNENQUkhDS0hxZkxDemly?=
 =?utf-8?B?VDdhSmhzVXNJNGZIQ3RMczRlTkpodGpZVDc1eitWTEMxQkVsMU9Xa0VnQzFZ?=
 =?utf-8?B?Zk1Tb0QxQzdTZ1dqM2EyOWRZSFRwSHNybVB1bVVPQktqdWltbHhTN2lmcm1j?=
 =?utf-8?B?Y1ZRRzJzb3hGNlg0Y3BWZEtFM001MnJFVWFXNm9UMFFyRHVyVTYxd0tQbnJk?=
 =?utf-8?B?QzF0YmZMMTNsS2RwQXhEa1BvYmVFVWVGVW96dVNjUlZlU1hEa3AzSlBxOFYz?=
 =?utf-8?B?SlVLYStUZVoyUkdiOUw2SGZmcGN6YnNpWHF0Z0gxUUovSFQwRUJONjVjeWpR?=
 =?utf-8?B?ei93dmowbXpNZ2ovWTl2SFFxaUhhelozM05nMFhuSDBtTmdmdHdFdWNqdTJ3?=
 =?utf-8?B?WG1ZTU40UHRWaWtCblI2L0UrcXRlR1ZmeENTdnUwTHdUa0x0eGJNcXNRT3Bh?=
 =?utf-8?B?NExxTkwzSldIVlVBcmZidE1oK0diZHNydUdaY3hOWCsxMS9HM1oxelhqQWda?=
 =?utf-8?B?c1pubFFkR1lPelZKY21sNFhwZ09pR0xud1N3SERiUmdTa2JCbEsxNG9IU3Rj?=
 =?utf-8?B?OTlOakNkakQxSm5xZ0ViKzE0TjdMdkdiOTBjeHJPNngxT1FVWDRXS2NuS204?=
 =?utf-8?B?K3VFb3dZSTV2RUpYZEV0VkNhR0RkUmYva2tZcHpGdjZZWk5rRUwyRmlqWmNS?=
 =?utf-8?B?NzU3Mm9aTWhyTWxzcXJ3TzVDUDJTTnN6cWYrQzJsMTV0R1Y0NXRmWERSV2Nw?=
 =?utf-8?B?UGxETDRWQWFUajgwZUJzaWVib3g3MkVTdFlZdUlWRG9HYXRFbE82RGdTa280?=
 =?utf-8?B?RzBlRWdVTjQ2a2wwYWlZbVlUck8wNEZhWWFZS0xsblIxbXlKVCtJcS90cWxQ?=
 =?utf-8?B?dExZVno4WE8yamxhU2lLOU5kS2JVNUNweENRY3FGZk02QmZ5U0pqd3pPdG5v?=
 =?utf-8?B?bU5UT0E4b2ZJUTZOb1BOOTlxWUVrRHZIUXBUMzBYamhLRzI4RzRCSUlSak5O?=
 =?utf-8?B?RDVzMytXWm1lKzM0YVpEZm5iRi8vOHRwRnNZcXI3bFJ1S3BuMDdYNUNxR21J?=
 =?utf-8?B?c05BRE1SSUFVWGhzUUNqYlc2YjhpaE5ZZW5scVdBN1NKWm83ekxLRnZhOVB4?=
 =?utf-8?B?SnRiWUNqOHE0ODRTdHRqWjRoUVAxRTRUQXJuLyt4cDNyMTh0a2Z4T2JEdzZZ?=
 =?utf-8?B?MFVnUXZWQU9jalBLYTJVVVNpZWwyS0FXSUtYRDIwSlFQODZJQ2JtVmR2WitY?=
 =?utf-8?B?eDZJY0pSTGZkY0lVOXZ5NUpOczROdXJTVEhpVW4yRE9VQUFMYXBBREwzR0d4?=
 =?utf-8?B?VWxhaExaeXZLcUIrd2Q5TFVWenkya1lOYmRmOW9xSWp5ZktmWkZSQlFUTFFp?=
 =?utf-8?B?Zy9TeERMYlJMTTNIdTRUN1o3WFdWYjZLakthTXVpaHZFa0syMFVXdXF1cldD?=
 =?utf-8?B?cGVPR01ZTFpYbjZTeUhZYjBUYmJ5NHdBV3lvU2xjN3AzR0llM1N5MmYrNnFw?=
 =?utf-8?Q?SNfCYwvZie4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck51Qk9hUjRqL1VrNHpIODBDTG8yUm81ZmVObjRPY2NuM1RDTmhpNGlXUlE1?=
 =?utf-8?B?THBrRmpYd3ZGYTZlSEVPWkZMQzRHN0pFSktGWGlTb1JVTTNYTkdUcVBQM0RI?=
 =?utf-8?B?bmltV2tDRnNFb3dwVExjZFZ4QUY4NVh5TVpMWnJXQ0UrUmUza1U3SVRrMkx3?=
 =?utf-8?B?THRPbUtxMjZzSU1BT3dNcXVvMSs4TzJNUzlCaTVnSnQ4VHpyNlJYcjdwZjNa?=
 =?utf-8?B?cCtDWlR3V05jcStKbDJhQ25UU1ZvV0tNZVIzWS96eDV0MitlVTg1dWF4K2Z4?=
 =?utf-8?B?dk1wajl5NlorUS8yRXNJVWpUdWJ0dTF5Ri96dHYzclo4Y0dBYkxhUTFHUll2?=
 =?utf-8?B?U29UMFBBODFTOEtoN3VSWkZrblBQOEs5RGdxdmszbmlabDVCazRzL213UVpT?=
 =?utf-8?B?S0M2VTArK1grbHlsY25XTVNZRW9zSERVYnN6cmpDZHZNRHVGSDkxWm42YktU?=
 =?utf-8?B?R3JCVEg0WEoxUjlXb1E2WTEzR3VoNDMrM213VjVlQXBVRHlHL0lRcVM3TWpM?=
 =?utf-8?B?VFFiNy9zV2gvS2FqUzhzQ1kyZWIvWXNBdlp3QTNlR0d0cHI1UXpldUQxT1pH?=
 =?utf-8?B?S3BKenZITmk1Q2ZNR1V3QnNPZjIrU2NXR3JYVXN4OTBzeWtCVGV0cDVkdXRY?=
 =?utf-8?B?UUpROGZsVEVGZHNWZDJBY1AzZ2RRR0RjZUdQdWVwL3l4a3kxVkVSL3ZOL3c0?=
 =?utf-8?B?dElwWnZjWnd0L1pRUkJSTWVnMWRWSSthWGVQcXNTR1BCUTUySmRSWEEyN3lK?=
 =?utf-8?B?TXhPcW5kSzRvQkVBNDljMTR0dkdxLzBPcUNGYmpMMHQzaUVzTzAzWHVwVFFo?=
 =?utf-8?B?NTJsMVBteVhHSzJseUp4aHcvYWRBbFBnZXkwUExSTDJZTjVGY2l3U2FQREww?=
 =?utf-8?B?NkwzaE9WZTB1dXZwWmVlZ3NLa3BleHRZV1RySzQySlU0UHh0emJHczBaWDdF?=
 =?utf-8?B?Rks4cWRSWnpsM2hid1cwdzd0WmNBOFdYLzY1ckl2bGZiOElzSVlWU1d5RzUw?=
 =?utf-8?B?a1Mza2RkMEg0SzNhWm4zaHdQd3hYcDZ3aEdEL1RNTTZQSTFocGRJdWFXek1x?=
 =?utf-8?B?Z1JkSFpWNEdJbHNSdVBOeEtpVDVlMGlWak8vMDZRVWdCVEwwWkNiMk81T2Fn?=
 =?utf-8?B?K2RXM1ZaamNidFFyKzNMVS9LVHhIZVJOMXUzY0Rxbi9ySVJWeUtjdytuL1dP?=
 =?utf-8?B?L0NNbVdLYVZrakhlMTM3akVsdGhjSVBXWThoSlBML1dJR2xmVXdaRDN3eWhl?=
 =?utf-8?B?eTArK1FpUElkcURTUFpERnVJbHpZVFZTc1dsUGhTcU91NXBaUEpQdVV1RGxS?=
 =?utf-8?B?cHA0V2FqRm85clNEc2JpZDRvV1hPc1VpVDJOU3ZqQ2xwUEZpbDNmUi9yY0FH?=
 =?utf-8?B?WWlIbGY0STFjRGpGUktWQXBSNjFNeFBNRXY3OG9STlpOTmtIN0ZQQUdoalZ5?=
 =?utf-8?B?VzBnTVN0eFdNS0hBQmZPTXlZTmhvZytXT2dZRmk5N0RkaW44MXR4aTFGa3FJ?=
 =?utf-8?B?M2g2blVKdUVVODN1Mk1nYzBBYlVhOW80M0dTVmFmUGNNcElkMENSNFVuRHVR?=
 =?utf-8?B?VFdlKzMvWGlHQ05XVndEM0xYbGZSdFdVYmdrNU9peWtDSml5S3FrK3g3ZVRS?=
 =?utf-8?B?UWpHM3NKZ3ZKaVNtNG11S0tpWktvOURoU3pueTNtcXh0bUMxSVo3UHV4SGZ1?=
 =?utf-8?B?RGJPVzk4b1pxdGlQU0c5em0yT0xFb1NDQjRJNlBwNllXTzFwVlpyVjFOTS8w?=
 =?utf-8?B?TTRDdWZWRTBQQVJmM2x4RVpIMnFncUQyWVk5VzhiUkJZVFRaaDBEbkUwSDZn?=
 =?utf-8?B?cGNpc25mdXczMkU0NVg2Q1ArSDR4a3hxNFVWWitXL2VZRkZGQ2hEcEc3NlpN?=
 =?utf-8?B?K1U5VEdoelBHVjBPejBwWUdoTDVPakVMYmRFYUdiV21VZ0ZXMVF4MWVkTUx0?=
 =?utf-8?B?MWRPMkZ4My9HNTJXY05RUFhTV01jNUlyc08vMlVUbVYvWGRadTNhL0xlUzhO?=
 =?utf-8?B?Q3oyS3I1cmFGdWFDY2hXcnZFSTFObXNKR2xuOG9ndGxKaitFaTdKelVEVW96?=
 =?utf-8?B?eDRObmM5Y2ltM2RmSmljME1YRk1wSS93Rm1NK1lHZ0twNklpTEJlbkFmL21x?=
 =?utf-8?Q?/pGoRGhcTIYA+5VebFTaiMnm4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca83f6f-9676-4e1f-4b68-08dd8616a5c0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 05:36:38.9104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QY75HGl2dQMAZF5HujXvj4LPvSahEcWk8XjmHqitt9OTk2loq+bPqFdfRzunDO8BKBDlEE87k4SsRGows0qYBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6619
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



On 25-04-2025 23:36, sk.anirban@intel.com wrote:
> From: Sk Anirban <sk.anirban@intel.com>
>
> Resolved the frequency stashing problem by accurately
> dereferencing the pointers, ensuring the minimum and
> maximum frequencies are correctly restored.
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pmu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 589c7cbde..094dc0c6c 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -527,8 +527,8 @@ static void stash_gt_freq(int fd, uint32_t **stash_min, uint32_t **stash_max)
>   	igt_skip_on(*stash_min == NULL || *stash_max == NULL);
>   
>   	xe_for_each_gt(fd, gt) {
> -		*stash_min[gt] = xe_gt_get_freq(fd, gt, "min");
> -		*stash_max[gt] = xe_gt_get_freq(fd, gt, "max");
> +		(*stash_min)[gt] = xe_gt_get_freq(fd, gt, "min");
> +		(*stash_max)[gt] = xe_gt_get_freq(fd, gt, "max");
>   	}
>   }
>   

