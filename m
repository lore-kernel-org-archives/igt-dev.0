Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35DEE9A04A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 14:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6A010E194;
	Thu, 19 Feb 2026 14:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bvu36avv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425D510E194
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 14:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771510487; x=1803046487;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=3g8LSJbeGRK6ABBJrc+kesEfhLF3yozdt+h1VJrSreM=;
 b=Bvu36avvN/OTTi6vTrPIwx83w61b9n30zOTSdkcOX3PLMZ57immYKV5G
 fv8uJigyNnNbzfr7vu9xPgZ3eM6ythGA1duumBuWJNpF4wMwijTbdNbTx
 cs5UDeqS6GSOql5rvvWFEO+kjeoPNoqBB5X3/C1LqWcdCzesY6dQecE9k
 GQ7gEDlfl5DCoV/3NCuFHU1z+VRmY7TuM5VycLnoy0E0DcEM7HxHqJD2E
 QRIFnGG5obaOP3gQ9/zKp+BNazquT0ncIgExZTbaRD0vtswcsijt3IXfe
 ue4VRsoJXFtIbs1wxqe11mDKjSPOE6cnLhYcC48B37RAaIyGLdG4kSp+s g==;
X-CSE-ConnectionGUID: lfae8mHbRUOLtOBoAs2NMw==
X-CSE-MsgGUID: 7lSqHnmSQ5WX0qngEeqGdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83701321"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="83701321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:14:47 -0800
X-CSE-ConnectionGUID: wSLT17YdQyK9Pg2w3IUrrw==
X-CSE-MsgGUID: ZRTww//dRmWI/B+JvX6xgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="214553530"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:14:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 06:14:46 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 06:14:46 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 06:14:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSwJlkdtU+K02rvWFvvHcRlecHcmJMBzo5Nk7Uf2W5RsAPFLb/CREDk9yP2u9AHf7K2FobuxIO0MdAxBRdH8hu0vrj3FFDrrgi//GUWuBxOrFGcBS/0PLZKUdBRqRA5ZhfMeUm4D5CzdpbyRF42DxNg6IbALp+FiMs8cAdcfVXqSXje0B4cZ1S+6+LK3qfrljyFL3ZV0qI/V6d+eq9nRiOQZraE0jt4YGfb7rYi8KcZlquBNNZJ0BgcxIUGVhNAoB0cv7kn9ixY83AAcG0rNcXxvLKNu0huN/2dKWrOsxjx64Ido0c67Yu4M1wpHx/FWSm1SwC8LOUy72bGS1AZjEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnjtsEuwG+/EOVoqjB7KK5myt7LSLPZJCldM3GpYxI0=;
 b=j/VNEZhjG+pLLpOrxmI+VWexGswxXazipRk1dFHoPm59TMIA3v7tH3TgcAAB8yQatDRtOWjub2NOzH8qRRsp/8fEaFwzFVFkMvRcIVIa0wNHCcRnGkNpzvrpx29XlVRHBoPi493UEShtKhTs07aWrQxsEVoB09M6C38eCxGAUFA2q/NGdtWFX3xczuHzngcb0940+TR5fy6Km2bptzgku1KuFgoFJMjwfN04SQBYGT/xuOg+GrSU4eIzwcXeGba/4DXEGl75NbKMELQyzctlVm6x8XJ+s0//fiA3/7Ff6hiL9VXgXUkCxYbsUYhV8vZI5wKGSx8693xfzMUH3ZYmyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 14:14:43 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:14:43 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v3 i-g-t 0/4] meson/tools: split lightweight igt core and
 reduce tool dependencies
Date: Thu, 19 Feb 2026 15:14:49 +0100
Message-ID: <cover.1771510028.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f55610-4261-4657-0465-08de6fc139f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L050WjNtUStITzhMSDNIVy9rNFlpZXFIZ2xEYm5KL0NweFF2UGRKVXZFUTlo?=
 =?utf-8?B?aXZCR3FLMTBvd2M1a1VpUXlGK2JKend3OEVHUUkxb1dKdVFJV3VOUG9WTUM4?=
 =?utf-8?B?Ukt0d0QzeWUxRU9FOERrdG1yVUxEYnNaVHJ5SCtVL0NUZHNlalRRWExZbEU1?=
 =?utf-8?B?cVF4T2tYbDEzazVVOXpGNFVSZXlSbWxLK09BMHJ0Tkk5QlJYQ09IUVBnMFZD?=
 =?utf-8?B?VVM3VHZDeVFaMWRqNnk4YUhpMDNueTlhc2VXWTI1SUZFek51aVd1dkUvcGZi?=
 =?utf-8?B?eHZ0ZnFOd2ErUjJFUHFscllpZGRyM2hrYlhWZHdUbkoraFJWVWZTb0ZEa2xI?=
 =?utf-8?B?dnJZZkVQaldkUWZXQzRJckhjSFJ2YTAyRUdWa1dmUzNEeHdMa1RIU0RPQ2ZQ?=
 =?utf-8?B?L3VacmpUc2g2VGhUOTI2QW1Pd0EycEM1NGpVR1gycDdrbVYyZkl6cmhpbEgr?=
 =?utf-8?B?MTdjczVCUzVWWUwxd3lRQU82NWRqSm42Ty9EaVh6QWU0dGo2YTFPUHNoUDFR?=
 =?utf-8?B?MHBwQ1hiNDFiWWZYQ2ZsM1owOTg1dExSdXBYRGNhclNQamg1OGJ2TXhtbUJE?=
 =?utf-8?B?a1gybEppR21UbmFtUUhYUHEzMHBhME1vMG9iS3RVdFpOaDBEZ1NoQXQxbXpE?=
 =?utf-8?B?eFArTXpuckNabmZaYlRPTVRjY0ZUMTltQzFsWDhCcVlKMGYvMnppMjAyWGtv?=
 =?utf-8?B?UW8xNWNQMnpiVEc0VWV2UmhXcG1DRDJhb3pYalFvOGRqblJ6LzVGc0NscGc5?=
 =?utf-8?B?Z0duVzU5eVl2dktad3ZWclB6SkRkNDcwQkdycUM1RmxJMW04NzdGS2pyZ3hN?=
 =?utf-8?B?ZW5OUUQ3VnUrYXpoNm9pOGNkWGNNUVozMWJOeHYwUnVWQ3lhY2dKZy9hSGlw?=
 =?utf-8?B?M2pCWlNjOGUxRElFb1U0OGowU3VaS2k1OXZ5T1dxRk5BcjhqY1VwdDU5NmpZ?=
 =?utf-8?B?Y2RtclhQak9weVZuWHhmaWVFSk1JK1NQMHZuMHlYeExURFFFZ3o2UmMzVkIz?=
 =?utf-8?B?MTBpQTV1QURydkY0VHNQcU45d3h1S3ZIS0xZQnc0cEVuZ0dlSjUzdWtBL1k4?=
 =?utf-8?B?bDFvemMwZmZBMUpHTXpya1ZsNnQ2RnUxZmtCbGwyaGJHV2JJaDduY0NxZ3lq?=
 =?utf-8?B?bXZaM2UyRDRlNzRnNDJLUDlIRTZhd1F6RzNyOUFEc01aMFpEQy8ySW9NYVhh?=
 =?utf-8?B?dDk2TUNRTDNNS2dTamowWHYwN3NYdXpTMjVMNFJzV1p5M1pYSzlNUE5CL0g5?=
 =?utf-8?B?ZEhLT29SVlp6MVBScUxQaC9vVVV6SXlzN0pHNjhyWHZrREo5YUJhUlpTNWor?=
 =?utf-8?B?NktlbTZjQXhLUDR0dnpUZzlNOUsyYkQrYjNjY0dJQ1NxMWtsb1Rwa2s5QlJq?=
 =?utf-8?B?RmNUOEdvUnNCSkI2bUpWaDd2TTBqdzdCWGs5NCtSeWdXYkpBQTJNR0gza2Mw?=
 =?utf-8?B?Y0lTN012U0FNR3h2c0o1ME0vMTBwdXNNcVdDTDBDTUY3cWs3Sjc2NVo5ZVV0?=
 =?utf-8?B?UGF2Tnk1TGV5dHJueE9sdnhSdUdIZk5VdGIyMG1lWWYrY2U4cktGRHZYTVlP?=
 =?utf-8?B?bkZqV2U4Vk9MSVFGOWMzd1lsS1ZHc21jaUlCa29LSm5mdXVXL0FmTUUvTS9a?=
 =?utf-8?B?cGh3Mk9zWFcydTdEazJkcEkxOWtvR3pIKzFSMXQ4aExzalpKU25ienlsTnUv?=
 =?utf-8?B?bWprd2dFVnIyZURURXNDRGRQbXZQM241ZUNlZ2ZnY0YzaTg0a3J0cWpETzVz?=
 =?utf-8?B?L0pJNXBTUHFkbStCWUtXYzg5WFRPS1Rndi9wRm82YjBZSWxQZGhBaFdJdDJs?=
 =?utf-8?B?VXg0aE44andXL0pud3hGN1dmQlV5OC83b3YzdkcxTll1OCs3TU5UR1AxVnJV?=
 =?utf-8?B?RmwyTTJwQllYSVJsbkRpVVZ0dDZCQUltL1dQUnBzOSthOFdlaUQvWTZTeHEz?=
 =?utf-8?B?aUEvSUdFRmFjSDkyZE5ubHNmTExlRktGVFFVNnJ3S3I5b3NGVW5YSVozdEVP?=
 =?utf-8?B?WnlleXVvUlEzK0NERVpuQjFKWFE0M2F4RHYzZ1FCYnhZR0RDa3dXa1J0ME1O?=
 =?utf-8?B?WkpqRll6Wm5PT2RCamtMZ0JtSUVZUE9JNi9FRmZVOG1QazVLdVROMUtmUkhP?=
 =?utf-8?Q?eURU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnVCU3VBYlptcWI3dkhNOFBlT3V6elVNMVdBZU4vejF0V3Y0NnNmZ0x3NDFG?=
 =?utf-8?B?Z2RnUXVQc1JoMkpqMW5qWjNCNFhMcjRQRGZVTzhiUzJIQ0pPcVpTT0RBRmho?=
 =?utf-8?B?WHJneEk5VGxNZ0MxUlZnMjZIWk04K241WGJtbWYxOXFwcm5TNGZUMW1rWUZY?=
 =?utf-8?B?eUdERUVoREhqc0lrbmxnRit0U1BvY2c5L08vNzNRUWVBU0tUR3lGRy9ldFhz?=
 =?utf-8?B?UmRRL1d1L3YwVXR1L2RWTXhrc3g3MXhtQkhoWExPUFJWQmdFWW01ekcrNXRT?=
 =?utf-8?B?ZW1IemJCQi8wY0J6VG5FcnVCakJwenJUTVA2NU44UE5VOUZJL3Vpcy9Jd09w?=
 =?utf-8?B?MXlTYVI2U25yQmcwR0pwQUxzZDB5emVFWmc3Wm15Q29UcS9Ma1BpYU5VbTNK?=
 =?utf-8?B?aERDNytqV0ZMM2lVMnY4VG9DRzJMRW5EZW9MMDhNU0xxT2RvVGZIYSsrelBu?=
 =?utf-8?B?dkh2ZDZiOUk1TlQvQXlIWklrOFhGTURYbTk1QmloUk9QdUpkZmRnZU80emd1?=
 =?utf-8?B?ZzZTNWloLzl1TkxHUFBYYUdIbktjS2ZlUTlwY0prSEk0MTFtZzlEWkw1R09L?=
 =?utf-8?B?Uk0zdlB4cStBWG1LNUtCVDBKa2JzdnU4UklzNEpNTVl3dDdXbURYbWROdHF1?=
 =?utf-8?B?N2E0WElOYUN0Y1RWdTgzUE9Hc0h6RnF6YW93SFFibWRoOGdrYjJUUWFvbTZn?=
 =?utf-8?B?NEJHdW5sWEFBV3VrWXNReHAvSzNMZ2t4MW1nb3FmUFkwbE1iYU44UUxFSVZR?=
 =?utf-8?B?eEoyVmtuaHUxYmkyMjFnakRKSUNkSFBoVmNINWp2b2MxMTZzNjloNzdPMDVz?=
 =?utf-8?B?cmdVYjdOTFV1L3V1QUVDcnZXY1QyQ3pQK2VsWWhYeW11Qmx0c0JaMkJLSDJU?=
 =?utf-8?B?TzhCNEJTdXhYUEg4VjVvV3VjRndPeEk2MkQ5Um03UVlVbVVXbExYSmFQUEJV?=
 =?utf-8?B?bWhLbG5tSW9YVlpFNTFmYndGVEttcGNFVmRlOTk1Y1AyWkNyS1RYT3duTmRl?=
 =?utf-8?B?bGpUVmtGUk1lMGV2OExMWGtKZzRnQW5jeEFmRnVjRkRLS0hHcENqbVYwb1V5?=
 =?utf-8?B?VlJmNWxNbWtUZTJmYk84R2I2cTJLNlpWQXA0QzBxMHN6VlZpOGIyRW9uYnZU?=
 =?utf-8?B?NTY0MWVjV0dWS2dFcTE4dmc3c3g4WnBXVm1qMmZrakNGcWxKQlNQMUY0NHJy?=
 =?utf-8?B?blJ6OCt5cW1XSTBtazhRcmpwSEREdlFRSE5PZDR6cUtXaXNuNXV2WldxbVI2?=
 =?utf-8?B?Y2U0OGFaSFMvbWQ1TjdpYlZHUkZOemRqVmVyMXIyS0kzc2Zidm9XMGtpUHl1?=
 =?utf-8?B?cnZmQTl5b3ZjenJpQ2tnTG1VWVA3L0ZKTThXLy90V3NSQ2F1aWpvUDlYaFU4?=
 =?utf-8?B?NEVJeFB0Yk9SQXgwUk96R1NWaFZsdjhETkNZYm9nTHVCcHp4WGN0VkdJMmtO?=
 =?utf-8?B?TzBQcGlkMmtVL0NBakxQV0xZczBQdlFuQ3VyNW1GeXNCK3c3cmg0SklPcldq?=
 =?utf-8?B?RENFWmlBWFYwY2RVQzI4Mmk2VXFIbU1jRDJ2djZFdmsvSXJxNzZmQXlpMnE2?=
 =?utf-8?B?VTVsNkZJSk1kRmJrK2F1YXVKNDRjT3lXNFVzQzdCZzR6TzBrNTF4SnBZR3BD?=
 =?utf-8?B?elhEUVJucHVhK080M2xHY1BGQnFVbXYwNkpxeEJIWVg2YzhaaFlram9pb3pv?=
 =?utf-8?B?dEllMHVTa0Y0bzdSb3grNHdUM1hlVmFpYStKM0VSdlIwNSttOEZZSmg3NXNY?=
 =?utf-8?B?YmRxWWJveDZsR2tZUTNKakIyZ3FYWU85QVB6RWY2YlhGVXVMVkh6L2YxWWJ4?=
 =?utf-8?B?TTJpeVZpOFRmWitKdktQc1Z4OVN4TVhLSnZQVGpUODArTXVIYWs0eFdiUU1p?=
 =?utf-8?B?dkRVVVA4WldTOXVVbDdJQ1N5MmFMV0xqZENVWThGSU56MGxZV0VDR3dlM0dO?=
 =?utf-8?B?NEZxZXhydzRxZUQzdmsvVncyVzJPRS91VUdXWk5yY0FOSTRVMkw3NUlOdVJx?=
 =?utf-8?B?VEJCeFRHRlhCQ2FRRUJDaWF6Q1VQTThPd2puOTBVNTFKNkUrbHQvNlQ2VFpr?=
 =?utf-8?B?SUN5Rkl2QllXdS92bGdpenVhTTJMSTRBK2ZYdWJLQzY5QzBPYTFVVnZXNFpY?=
 =?utf-8?B?UTIyQ09PRUxHOVp6dG5pczBkL0RsTE9hUDJZVTBOOThFVWdjbkxvb3VQd2hY?=
 =?utf-8?B?ZkxhRC9IdldKZ1hVLzRHaDFZQXJmQjdKcEpUTGVCdkdZbTY2VTh0SVlna3ZU?=
 =?utf-8?B?d2t5c3AvY3lITE1CMEhqMG16MzIvbjRwS2pKNFdMQ0ZiVnhzWlA4Q0Ixd0JL?=
 =?utf-8?B?MkpVT1lqeWo2SGwyU0FsZTVURzVDUW1sS0RTWCtUM2hZbWxMSGFjbjh2K3Y4?=
 =?utf-8?Q?7OfEKef7D/KjePk0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f55610-4261-4657-0465-08de6fc139f1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:14:42.9934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpEDY0VxC8Sv7lNNmrFwBwYrfIPr3GBbbP8T6RfQjBhD/TVkAk2Po+67Fbit4IVXXRyG2RN1UjX07rTglc42Hj6e930Bn8i/y9ObQmHHI/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
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

This patch series continues the effort to reduce unnecessary build-time
and runtime dependencies in IGT tools by clearly separating a lightweight
core subset from the full IGT library and by making tool dependencies
explicit in Meson.

The primary motivation is to allow simple utilities (such as lsgpu) to
build and run without pulling in heavyweight graphical dependencies
(Cairo, Pixman, X11, etc.), while improving maintainability and clarity
of the Meson build files.

v2 -> v3:
	- add libpci to lsgpu

Sebastian Brzezinka (4):
  tools/meson: make per-tool dependencies instead of using global deps
  lib/igt_tools_stub: Add igt_load_igtrc() stub implementation
  lib/meson: build core sources as per-file static libs with minimal
    deps
  tools/lsgpu: drop cairo and switch to igt_core

 lib/igt_tools_stub.c |  43 +++++++++++++++
 lib/meson.build      |  42 +++++++++++++++
 tools/lsgpu.c        |   3 +-
 tools/meson.build    | 121 ++++++++++++++++++++-----------------------
 4 files changed, 143 insertions(+), 66 deletions(-)

-- 
2.52.0

