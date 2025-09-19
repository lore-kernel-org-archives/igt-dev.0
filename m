Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71C7CA1013
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 05:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5214C10E11D;
	Fri, 19 Sep 2025 05:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9bYxfL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD0810E11D
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 05:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758260087; x=1789796087;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bLnpYNPGyYDthejgRuOnlf3JWitoV3xTdrBJlWyo0hs=;
 b=m9bYxfL+vTmU6bT3cfE/Xv7dBu/5Ztd7iJgJJiGrmGYNYImhEhdouUQn
 MtUurBWAlFQOQhuB6L8A70FkmPgoGXb0QgQRtDYiZ8yPAXpTKk7CkW/hW
 mn7OZzNcJEMwJkjL8+FS67ZtCDS/JzCjgOCVF/WDbpZ8CZRzgwd6VUW3/
 nbDdp3cjINiGYyVBdGQ2Yevp+l9I8/pxLdQ8TqyZUjhix9GItXn4sYZNK
 NtjN8OyBEbnGCm3w8RZJAI/u2Z/1ISd3NZZ6Jh6jLhzb5Rdq3xq64XUs1
 xvAKkGD2QDn6ln9VI+/jBCVSBREA5LQN8mEQQOSm6Q28fr2boQZfS+JfG w==;
X-CSE-ConnectionGUID: pb0CMMyvQrCYkLk/mXFdnA==
X-CSE-MsgGUID: DL2vvYaxSEOnneh/B3+HqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71976263"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="71976263"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 22:34:46 -0700
X-CSE-ConnectionGUID: OEKM84e0SjeJLXvmdd1WNg==
X-CSE-MsgGUID: sUwa5GVmRJ2L6PGNTmuwOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="179751810"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 22:34:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 22:34:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 22:34:46 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 22:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2jHZ//PuggxAc0dyqQ7TLzWY6EaKyDDM4lbGBrAIPSX1uFYQyIIjwGoR0osmD5iX0wo7GmMR+5KcHK4KOGMII2cocUaqmCOe4Im8v6J7KontesBtreDZehusFeV2bJeNBAtYVnn4/RXsklQ4iOmeYrdHxFgVwlZhaPORlVdLhd7UqRZ5L6rS8ZRJZHzM8p5sMUbM2pOgilj/Qq+5vO3HqARx5uSbprqUuJ3S35SzZaxw6NINhjrCm9L2MF37lteTCfRR2jybrpiIykdS4NU6ruTOiFLjFqEljS6h6s+Lx2QAG49R+7yAvreHgB1PxPZc+bq83+0wI1Jyb18lon06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whLMQaO6NlPZYbXzUOaGmWoy0eeXl9JG5XClPgmaoLo=;
 b=l4alpOIt58shMctloE746SUSGeJdaXwJGyG43/6fJcTgojGbSDzP2ZV1dq42wNLHuUfSS3KMJpE4J2Nl3i1/DPu+zJ2fKrOHrMT8QMnOftU45l5KQ7SmOg77kx9tQ9u1ukkTRf+5cnXff2MsEm/td5sJN3utV0lXLzJPPuX+FljMIV202XupUnbWm6GxH+YI/HFpPEc5602yPkZiOeUvMriy4eHTdtJtDMwkfO90O5lNCkwz8+4YpCv29KuoRbRQug/vbhi4sN3kHzGy28MmN7jJe+VEzyQz6KJdU2ke4j9dVtLnrimF0Mzh/VcOeXUPLrIXGfjOol/Ucaq2rCJPKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 05:34:44 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 05:34:43 +0000
Message-ID: <54dc8795-b65b-47ee-ae97-9b83774aa0d3@intel.com>
Date: Fri, 19 Sep 2025 11:04:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_setmode: simplify mode selection by
 removing goto
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20250919031736.1362484-1-jeevan.b@intel.com>
 <20250919031736.1362484-2-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250919031736.1362484-2-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d60db66-a4b7-4aea-3bc5-08ddf73e3cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|42112799006|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjR1MWNKV0dna0RSWUxndEkwYlUwZGd3OTIrNlBjbTN6dEtxTVhNTHRyNTlp?=
 =?utf-8?B?QTFkMHc3MVNGQTltNzRHVSttUTQvKzNLUUcxaDBydERJMWNRVTRSNGhHZHlQ?=
 =?utf-8?B?OUt4ZndPREc5dVg4U3ZDTU1GMzFRUWlFbjEzbWZzRjFlV2c5dWJNejZuL2hm?=
 =?utf-8?B?WVlwTkhRNU53MjZMTEc0ajNhbVZaY2xPcFFpYjhPbjVJaFFVVHNtVFRIUGhH?=
 =?utf-8?B?dmFTZVc2ZmpiZDlsYStnWlpzbTRPNjRnSnplOGRJRk05OVkwZHhXdWNybjZ4?=
 =?utf-8?B?YlJ2TCsza2tWdkhXdVN2SmRLUTVXYzgyQWpCZC9ja09KTThsS0ZiMUVYRkZK?=
 =?utf-8?B?VWFjcWphVDBKYTRUTWFmWmdneEtKc0RodGJOR3gwRkdySUR2UVJzL1dYeWlw?=
 =?utf-8?B?MEczUTVPOG9vd01kL2F3TEN3QTRCdjhySXJVdGR4UzlYNW1lc1YwZTREWE10?=
 =?utf-8?B?WkloZkNxZFRZVG43Y25QWmxIMmZac2lNTmlNQ0JGbDJSR2V0c2V0b3QvMVNx?=
 =?utf-8?B?SE5RcUtQeHV2ajdtMXpwWWZXVEpJYm85RlFZZmZTSU1ONUN3Wm14T1ppQWg3?=
 =?utf-8?B?SzBZc3N4ZHBzdUZuZE9tc090STdTM0hVM2Jma3RnRkR3OWVyeE9aWTZ3anhD?=
 =?utf-8?B?NzFyY0owRFh5YzB5YW1hbHoyT253OWlmQ3ZheUorR0laSmdSaGsxNHp3R21y?=
 =?utf-8?B?M2FLQmJaM3hYV3YrbEIzL052c0lDR0VGQUlOSERXZVZTWm4xSlFqaVYyK3gy?=
 =?utf-8?B?Z2o0d3JrMEtWTHdEUnpyVlNNTHJjS0tadmNqRjFJOTJqa29IYW1jQkxiOXg2?=
 =?utf-8?B?MnFVdzl1dDQySFRVYjZLWWc2ZHRKQk5SVkhCS2JLOVBBVXhVS3hTcUtnWEM4?=
 =?utf-8?B?N1ZTMUw5bmJsMVIvNmp3bTl6Tmt2QjJGVlBscTJqanZEOGh3eUlEanNLYzVR?=
 =?utf-8?B?cmtaM3hlRnVmdEZjSXQwWldjbHlEakFSWklvLzErcEkrKzNWN3ZqYUZqRldV?=
 =?utf-8?B?MUdSUUd5SnkvVC8xQURXYXE0QzZ2SFNvWWUzKzBTWXFwUXZEZG1NTnNaVHBV?=
 =?utf-8?B?NHR5R00xQlN2TDlkYWdNbXUybHJEZ2VjWmxpcklhalk2R1A3bXI4Mm9pY0pT?=
 =?utf-8?B?bWFhR1dnTnpnRmNBZnlIeUFkc3RBSDF2bklYakRodWI3aTIzcmM2K2FlN25o?=
 =?utf-8?B?QXoyMFA2WWZDM1dZR0JWMHd3TnpzbWpVRkI2aXlDb2h4eExQdWp5Q1ZGY0Nq?=
 =?utf-8?B?cWVsUjBBaitGeURRNDEvVmhGQndzTlhSd3h6L0o1OC9BYVVpNE5NRkFTQ3FF?=
 =?utf-8?B?T0wxaVdlemkrY1hLbjM1TEQzc3JLZ1IwOGQxY0VpaENOU1kvYWw0WHFSZzJP?=
 =?utf-8?B?Vmh3N0YyVFZDNmZOQjdheXBOMDdlTjcrVE1CV0UzMGpCZk5FaStXTy9pK1NC?=
 =?utf-8?B?Q2ZDZzNLa1dIVUVCUllmS0EwRllVdndVU3RNelQ0SG1GQ3VMT0xvQUFxSzZz?=
 =?utf-8?B?bzVxT0diaUtjTWFmankvTXFublhJWk16RVBUNGtJTEdCV0V1VG02NUhqVXBG?=
 =?utf-8?B?WU1yMUppTEtiT09UZ0ZSV1JGSzF3eHRxMTNQUjlVaVh4eTczL2NnVDRZY1c1?=
 =?utf-8?B?d1JzM2JIUVE3Z0hwdjhNOGQxQlVHK04xckhEZEx2RGwrMmlJNkwvUjBZRCt6?=
 =?utf-8?B?dENLNmxBci9kTDRBbkhwMHFSM25wdjExRDJyWi8xY1M4Y2E3ZTNQUndsVnZN?=
 =?utf-8?B?OUJ2M1RqQVNCU3IzNVlHM21ucExrbVJZTUlONWg1ZWZNWXBSSTBPQ040L0ls?=
 =?utf-8?B?aFVZOGpHR3VLelRkdklwdU9FTDF0VTNUSkoxUHBianY1N1NQNDJramc0Z05r?=
 =?utf-8?B?Tml3NUpUUk1OaXkrVEJveFNKUmk5ZVc5ZXdnZzlJR1cwTC9iUHg5dnlXbkND?=
 =?utf-8?Q?VC0WN2XfqxA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVIzQWhMdkIwakQvek4vb2pKcU0vVzZZZyt5RDRFbzV3RG9ydTlDZGVwSFI5?=
 =?utf-8?B?cURRMmtlU0tMVWVZVXF6NC82UytMNCtBZDV3QVFNL1orRmVINjkxM2ZkZ2c5?=
 =?utf-8?B?eExUSTk1Y3oxTDZCUWNubW9Td0dMcnFxSjN2VGNvK251eXZsWEh4WVAwRitq?=
 =?utf-8?B?TnFPd0xpZDhhbmVabW5iNnZaYnQ5RWZlNFBxQXhRaXhDS3RYMU4vOW5UWHk0?=
 =?utf-8?B?dlNGVDIrMFJtRkw4L0NhK01YT3pOZWpjZ1d6RGY1bXNkTjZtR2xqdTRqR3pr?=
 =?utf-8?B?a2RtQkpCMUR2V0h0ZzRxTzVpanZCc3YyckZHUzNFTVN2Uk5FVVVtOFdXanUz?=
 =?utf-8?B?ZDloSG0zOFQ3R0FuZ0J5K3l1cURuRVVxS0MwSDEzQ3o0c1V6WCtlL2ExRVVz?=
 =?utf-8?B?UGo1UFIrUXVtU2lsVUM3NHlRM0tWOGhIUlN0YnhDWkFUNkU5ZW0wV0tQaG1k?=
 =?utf-8?B?M1R1UmpJeXFTWThQRTBPMEcrTldsRDc2SEFMakNZeXNJNWVWWmVXRExBYXhL?=
 =?utf-8?B?d2VFVW5iQWVpanRMM2pNWU9NS3lGbzhkck9hczFTRGtpVDBadjFXeG1UUEFV?=
 =?utf-8?B?MFluQnowQjlRSDA1cHlDYTVPc2R3SXUzWkZWSTdUWG9jN2JaM3hCWjd6Qytp?=
 =?utf-8?B?L1VDLzd4NjE0SDR4QlN6em9YdWV0RlRFRit2cWZORko5UndGcUNURkxVMUJa?=
 =?utf-8?B?NlYxMmxRUXlOWkM4eUJNZHBEbHhCRkFmQVVsaStXUHZlZExETFdSL29tMzBY?=
 =?utf-8?B?bTdRTDJ0UXFXU1BidGFVN2xLZnBIdVF4Q2pqRWp0Q0lPYXNWWjloWnFuWjlx?=
 =?utf-8?B?R3pwYTFHVEtVem1qYmZMbUowaExDSlVEOG04NXVtL3docVoxN0o2QkpkZ0Ft?=
 =?utf-8?B?eExOU1htYVlOb25POXFyaEVrQTEzQzltSkRVSEVIb2M3VmtoR0U2aWloUkFD?=
 =?utf-8?B?QlNSWEV1enpYS2Q5NGhqSkh1K2dGU21BaUJQNXVRTHBxUFJhSzRaRFhuUGk5?=
 =?utf-8?B?NjVMU3d1eWJYYjVwZ2MwckFJclFCUStlckJGOEdEdVNuaU1HNnpFL2JLN3Zv?=
 =?utf-8?B?RVNUTXAxWkJvTDV0d29wVWpQQjhGQ3ludk9zTm90NnVHNENBWTZNcVlxUkg3?=
 =?utf-8?B?YjlsYWZ4TUMyNTIrVHFsck5iNFA0WnlvQXEreU9rNzdXZUpBeTBZQ3JHQVMx?=
 =?utf-8?B?ZkRQd3UwR2paRUMvTFZGOUtRN3dnNm9XT0hKaUhsQU45ZnhoZW41RFVlN0pz?=
 =?utf-8?B?NjVxeUw5K25sWnBJTDFtTUhFTHN4ZkJ2Q2NqQTE0dmlXZWJSNG1WVisybWFk?=
 =?utf-8?B?TkQrQ3g2Q2I5WkZicDZxUDdWaEJYRnFUSC9lMXVUUE1OcXg1Vkp6bVpWaTdT?=
 =?utf-8?B?RTBIVlF3YUZxOTRvaUZpMG9VZGJKelpPSXcyM3QxVjlobWZBNStyUDRzcWV0?=
 =?utf-8?B?Ty9tbHFNSU94d2JYZUo1WDlJRDQ4Sk9MbmhVZHVlYmdiMGx1OXU1VUZOc1hI?=
 =?utf-8?B?cldlSWt5NHpLb0pDQkQwdXQ1Yk9iME9mOGRIOGRlVkdwU2tFODBPNmRhUGoy?=
 =?utf-8?B?M2I5cHNHVlpmclFPWmVBZmhKdDBodVd4RWdnU0tuTXFDNGNTWDRNNWRjMDFa?=
 =?utf-8?B?YzhxaDlZeEJoSC9IZTJVSnkwU3lqRHdNbEJPMXA2K1Y5UzJ5OWRxRWp0WEtR?=
 =?utf-8?B?MUN3SUxkL3JPKzRsdVRpbC9aMnJ0ZFNwYUNiOTFiMUFCOW5yVWFpdHFHVHl0?=
 =?utf-8?B?aVEwZ1Nla2tvWVVkVWRIL3kvWDZWQnI1Q1pyaXRrTEdLU1N5WXVGY3BTeXR2?=
 =?utf-8?B?eVFDQTJkUllXSUJpdEFnZ1IyWm44ZmZpVUZwc0xsVXZzNkVHM3VnMjVKdi9w?=
 =?utf-8?B?UUNTdk1ZNFpNbXBINWR6Ynd4WnNPZy9pV0hzRmxkdWxlMzlNYmo3ekp6bUlI?=
 =?utf-8?B?cUpFellZOGlzclNzZGNwb1pQTG9NamI5ZjgrZllTdWp3anJzSm80UndJRzRR?=
 =?utf-8?B?T3FSWmlSc1o3QW9kWkZ1azZVemJzMlAzMGFaU2dxZG5WQWYremNmckVOQTBl?=
 =?utf-8?B?NlpyQXZFV3VEcjBrWHJWT1U4L0ZjTENZTWk1Qk8zVlU1NXJ4VHYyUVQ3ZSsw?=
 =?utf-8?Q?2241847o1rClY3HeWycj5bR1n?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d60db66-a4b7-4aea-3bc5-08ddf73e3cac
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 05:34:43.8227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l91FjTc1evCQl1/6i9w/CyC+5A5dvC027G9VmDaUazDVckezzKcI1ta8Gg+gikVj8iDhhX15bEVardpqqraSng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
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


On 9/19/2025 8:47 AM, Jeevan B wrote:
> Replaced 'goto found' with early returns in get_mode_for_crtc() and
> added braces around the fallback loop. This makes the logic cleaner
> and easier to follow without changing behavior.
>
> v2: write to *mode_ret before returning from function.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_setmode.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 484c3a95f..48d0c3e1e 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -238,8 +238,10 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>   	 */
>   	for (i = 0; i < crtc->connector_count; i++) {
>   		mode = &crtc->cconfs[i].default_mode;
> -		if (crtc_supports_mode(crtc, mode))
> -			goto found;
> +		if (crtc_supports_mode(crtc, mode)) {
> +			*mode_ret = *mode;
> +			return;
> +		}
>   	}
>   
>   	/*
> @@ -248,8 +250,10 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>   	 */
>   	for (i = 0; i < crtc->cconfs[0].connector->count_modes; i++) {
>   		mode = &crtc->cconfs[0].connector->modes[i];
> -		if (crtc_supports_mode(crtc, mode))
> -			goto found;
> +		if (crtc_supports_mode(crtc, mode)) {
> +			*mode_ret = *mode;
> +			return;
> +		}
>   	}
>   
>   	/*
> @@ -258,10 +262,11 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>   	 * scaling etc.
>   	 */
>   	mode = &crtc->cconfs[0].default_mode;
> -	for (i = 1; i < crtc->connector_count; i++)
> +	for (i = 1; i < crtc->connector_count; i++) {
>   		if (crtc->cconfs[i].default_mode.clock < mode->clock)
>   			mode = &crtc->cconfs[i].default_mode;
> -found:
> +	}
> +
>   	*mode_ret = *mode;
>   }
>   
