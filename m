Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25C0C982F2
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 18:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5298D10E924;
	Fri, 16 Jan 2026 18:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+dTs6Jz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E057A10E926
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 18:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768589729; x=1800125729;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LlUV5ZjwJOpmIg5F65QTFO2f88AXAg9dY7jvIeJdeQQ=;
 b=W+dTs6JzYY6m84jDMrXXHEqZtWTrNNDbWDVsBJpaJ4ATeiyvfHW8Qdw4
 wkObmAzh96kASlZsN4njfJMpvZgF8oBIgtEvQnuEdipQ/1sL/1+18hKw1
 3rcQ5oyCoTG3eER/yzKbzOupFnhGyw0yfsCQJH8jdvoCrQG/NgRqC2Tfq
 sYFpaHBsS0AUDMUGvysKPhuJa3jpHQBDWUldzGAYKNmUPSFJAeeNoF3Kh
 3yif982R1hOLSF+X2Hval250GWlxXI1sD4n8xcK6fJ1pZ/t1Essh41S9w
 DcxKLEBILv3X3yTi4HkVWp/5DsoSEOWS0PDtBEOHsr/s+vQfcEbartZls A==;
X-CSE-ConnectionGUID: DfoRW0RlS9Wp+gX7OdrhkA==
X-CSE-MsgGUID: BR0gkSvBQ2+hD0Ec4vEr5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69110291"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="69110291"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 10:55:28 -0800
X-CSE-ConnectionGUID: genvbxtzR+mx/BqiqtJaJA==
X-CSE-MsgGUID: UGFXGHtjTNOIHAlCBK+VHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="205369086"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 10:55:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 10:55:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 10:55:27 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 10:55:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaAUK0ssXcN5pg1gNC5eanvRAqz2LVqpt+3mC45ku0EwIdt2chjogSBNd5PFDP9KD60WoF8/0nmnH3qv/SakbgHavai/NuX5tX51AAA3cJuHsx862d4e+LBDebsRPStVHSxTJlglT7LSE/8FjbO79mdmGip0xHHMOysjfRn+z9UWR+l1DN/j/IpmxiblL3YsCddojqhez78Mo2efpsbvTWK8pAq2q6SvUl8WHSm+LUmBNpgA3gWpLkqqO+HKIuCgMJzmq86Ye65O+va2/L3Jzlo44rwlVYt6OP41b7kJm4qwVy7L9OrTknmZeoqjw3IjGD3/TgfKUfU65GYStPV+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8B8/B28a82YSGDRbY5xtm7kvkdahOJFGHRpuwCXyc7I=;
 b=BX9cl1tfA+WzU/fcgSPqOPnHTs/TEe+nGEZt+ZAw10pBkFjTZrNEaBQS2K7nfBen1mnyrPPWQks/Z6aoBPTotmOOIfxlw8T1BG8TAIzwF4hRYUM0/ZAOe0XjUP8K9XC4FYacAJzMzM3duuqy0P95hvrmf4gMESCZginjiLnFUDKgyBo5dwZQ3KJPQVJVtLHfG1r3L6Tq6cnoKVTomAV4AjP6zt2MXnqfQ4T8Xuj1H3zhQ31cFBlkuR5C/i6qIm7eUiNAGB1TeZZzPG/7i0rEuXU1nm8ApInel9zMmuMf1Ztp8zjnPIJH7zd5MTAtQIZkb50jXPgEJqiNATsP1TgAww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 18:55:18 +0000
Received: from PH7PR11MB8033.namprd11.prod.outlook.com
 ([fe80::3aa3:869a:aaf2:c8dc]) by PH7PR11MB8033.namprd11.prod.outlook.com
 ([fe80::3aa3:869a:aaf2:c8dc%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 18:55:17 +0000
Message-ID: <7f583af1-c736-42e4-b6c2-6521bdcaf6e7@intel.com>
Date: Fri, 16 Jan 2026 10:55:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
References: <20260112191732.672297-1-x.wang@intel.com>
 <20260112191732.672297-2-x.wang@intel.com>
 <viv6pwhicr6jjm5d4hoznn7w4h7ixamqdwalpx3eb3aoc5fgbr@2rrcrdhe7rsn>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <viv6pwhicr6jjm5d4hoznn7w4h7ixamqdwalpx3eb3aoc5fgbr@2rrcrdhe7rsn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0126.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::11) To PH7PR11MB8033.namprd11.prod.outlook.com
 (2603:10b6:510:246::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8033:EE_|DS7PR11MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de8b05c-630f-454b-8509-08de5530ca66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|1800799024|376014|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2hjOUhSZmFpM2pkcnpSZk0xRVNRWUNnOFFIeGVTR1ZvR1dYUGg1SG44WFUv?=
 =?utf-8?B?cFg4YVlDdDV3dVV1OTJjRFNDblNRcFdJMDM1WlhkdEd1eU9iZ2s5c1dBTko1?=
 =?utf-8?B?blY0Y3pwS3hRdW1PMXNub04weVh5Qk5MWHMyQitna1E4YzI3a2ZNdDNMWCtU?=
 =?utf-8?B?aDZIckNHR2NadVVrczRlSno2d3FkTGQ4VkdWWUhUZ2NHb3NLQ1lPRFRwS2lS?=
 =?utf-8?B?Zk1lU2NqeEc3R0YxeUZxZzFIaU9vbEhuUTJ6NFJSYnZOVmtHbFVTSnJQTk5F?=
 =?utf-8?B?K3pNWEMwcnAyQlM4WjVFNDhmeFB0cTlmTi9ZZXRuaDhLblNPWmdyU0pLSUdW?=
 =?utf-8?B?TnBrT2VrdXU5OWFMSHhBNWtNV0p2VU10amNCWGRFT0RVcURzeldLUnFsc0Jv?=
 =?utf-8?B?NFNPQ0pOaUtqT2F6UWkzRHpuTFV3RWQwMktha200U2ZCL1pBNVFwNStQU1dr?=
 =?utf-8?B?aXZ1ZG1nUlU1WGMwbUhnUTU4Zmd5RVBobVUxdzJXMlFVNXFGdkU5WFJQN0t4?=
 =?utf-8?B?UC9SczQyU3VTbTk0eld6a2xGQ2xvTTBoWHV6NUVVMkVQeDFzNkJlcjBBM2tN?=
 =?utf-8?B?U2Jjc2l1M2t5RHU2TTErT2cybGtvaGN2bkRnTkRTZUZabDF5ZkJITmg2ZjRB?=
 =?utf-8?B?eHRpT3RlZHROUnIwbTRjTGhxVmdtdy8rSFZwRGJjYlB4c25SS2R5M0ZQc1FQ?=
 =?utf-8?B?c1lZalY5R08vdlZVNEM2WERsMmlpdHNTa3RwV1dHQys4aUtVNjArakx6QnRp?=
 =?utf-8?B?a2lwd2xBbkJQRUFsdW1mZUZHc3UxRmJhR1N3QmRZSnU0NWVEK3JyNWJuRmFL?=
 =?utf-8?B?U00vUXhvOXhQSm1IcFBETmxVY3hJZDlwUnFVL3l5cnI0bGYrVi93Ymwrc2xE?=
 =?utf-8?B?MWhRTU1IWGt2cjArbUpMS1pMTE9QK3BhTWpqdW5HY0NPWlVlQ3ljRXdRS21z?=
 =?utf-8?B?RVV1bDFBeW9ZZElBM1RHTm5Cb0NLR2QrRCtCcXppRUNmRTdZbUlseUljbWl5?=
 =?utf-8?B?bWhRZ2N0R01DWXp4cWtYZzNwVFJlMGpEZWdLMUd1akU1bGg5V0gvNW9xM1lv?=
 =?utf-8?B?WUsxNk1XUEFwMW9ZRnI5U05zZkMwL3ZLRjlSMks3eXd4QXZkSlJ3ak5tWEh3?=
 =?utf-8?B?Y0dpUVZqNVNCS1ZUNzBYRXJyMXZYNG43a1ZXOTlLdkxwbC9ET2U2VVdqK1I1?=
 =?utf-8?B?eXp4MDdNbnJ6VWNXUGczTjFsZEdPbHJDOFo4SkdCTTYrSm9kSHhLS0R5WEx5?=
 =?utf-8?B?YzdNaUpDYnRIYjNQRFQ0THNKTmhueGVlN3pscjZTLzJacHdLRDRMeTdOcWVF?=
 =?utf-8?B?NVRCa1JZUVFMb0FWSUx1Z2VrcGxWdldGV2IwN0xhcEtEQzJjeXNhTkdyQ3ZI?=
 =?utf-8?B?cmgwQ2s4SERKSUU5MXN1N0FNWDVDMVlzV3VQMEw1bmlySVdIVGdMcFBESlNy?=
 =?utf-8?B?V1B4M2FLVkNOWjBSMHR0QXlQZkpVY1VjMUt0THFGaytQb1kxb2hBMTZNa1lV?=
 =?utf-8?B?dVBaaVZlQmFCa3h0eUpjUkdpZFNVbUhNSi93djVsREwyUHMrdVJxbE9CQXlh?=
 =?utf-8?B?bEM0M1NheVFBSmg5ejNVd2hESUh2NFlMQ3gvV2xNSTYxMXA3cmVyZ2lYbWlC?=
 =?utf-8?B?RVNpVjRwK3pzWjBDcGREM1kzUk5zS2F4RmZlNTNPWDhGZUEwcjZJSWxzdDUx?=
 =?utf-8?B?anVGME5Xcml6Mk1SaWZ1UDVjTjQ4UWNmQVNWeTk0R0w1QmVFandKTzRaWGJZ?=
 =?utf-8?B?aDBHcXYzTzgrVHQ1a3N3RHNUVkJJMTM2ZFRScExPcTl2ZEwwR2RnbitrWnE3?=
 =?utf-8?B?WlVzR3drTnhheWlOeHF3bEdsM1RJMGk1bmtzSTZiWDgydFMzcXBFdHJidlBH?=
 =?utf-8?B?Uk1MYTlVWVUwam9ydGEwZ0hUWlRZbVBGYVY5aS9VZWNEbnVSNWV6Wm5zeFF1?=
 =?utf-8?B?aXdVODBBZkV3YWs1N09VM0c0Z2ZxZlozOUppMTFXc0xqem1mSHVWNlEwMzR4?=
 =?utf-8?B?YjZFSVNObW5na0g5UVd4MTRqdG84UkdOL2xZdEJhRTQ1UzJJelFhQWtzNUwz?=
 =?utf-8?Q?OocLaq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8033.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(7142099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0ovdVZKN3JKUk1oTlc2MzRKckVRSTEzUlNqRS9NUHZoUm95bk15T1NhVGRS?=
 =?utf-8?B?bk4yZGlSUDZxMlM3Tk4wOUNVU0U3QisxS3l5SWlLbVY3cW9JbGRFTlNwWGxV?=
 =?utf-8?B?Nk15OXRuOW1hbzZuaURDakxyQURMMStqQXQ2ZXJJREl0V2pXbWVFQ0p6WGh1?=
 =?utf-8?B?WUF2c2dqcnErVVYwV29GV0xQNjJ2QUYwZmdNS2hEUEVmTkJKek11K0lidlhZ?=
 =?utf-8?B?NjBYRWJ1dU1uQ2Z2MlhBa1pQYWt1UmdxU0xIQTZObGQzUllZRzBBN0JPeGkx?=
 =?utf-8?B?NFFYd045M2hUOWt3V05WeVhtWFpqQ294TFZKbXZnWGV1S3k5MGRPYzkrQUV6?=
 =?utf-8?B?eWZ3SVZwRThEa0xqc2tVV0o4M0VOOGE5Smc0ZDg5cjI3Qk9xTlNidU4xQzAz?=
 =?utf-8?B?TXlGVWZ4bDZkbVdyS2pTcEpFTUpLUElpemJjeTd5TnlHUytvSUhIdENnRmJj?=
 =?utf-8?B?T0NnK0FYbit3RExiSTY3cGlhTUhocFZaVSt1NXkxb1Y2ZG0wbnJhT3dxMTkv?=
 =?utf-8?B?bEdxaDUvM2JRRW0wQml1UHFSdXVWKzlJa01ORitPK1RqZ3cyYm12NlByaU5H?=
 =?utf-8?B?ZzZWSTU4OFpIYTNkUHJvT09ramZpNVNwRDl3YUtmWDF3YzJVSHpFdENTaHdO?=
 =?utf-8?B?NzFPcFcxZ1A0LzJZQ2c1eHJuL2lQbGw3d3RjZG12VVcrc0wwcWR6aFNub29K?=
 =?utf-8?B?NmVaTFZMY2RjZUUrVDFWdWFGVUc5bGpWaUQzS3hWakdzZ3FPdTMvSW9aYW5h?=
 =?utf-8?B?a2tXZzdvUmVvNVdJQWhhcy9lK1pSeVFZdU5yTUgxeFdwYnU5YXBBOUE0ejdX?=
 =?utf-8?B?bi9PUjRVM3IvWHR6c0RHRGw0MC9IQitGaVdnbUNqdjN2OHdxenBNTEtlTS9E?=
 =?utf-8?B?dmQvNXZTNDhqKzF0cllyQzFXVDliTmpMRVZGMUF4dU1ZV3VrLzRaL09aSjlS?=
 =?utf-8?B?azJoNU5rSUw1K0txRmdQVEpnK1R1SGlQZk9LMDExZlBGalE2bDhxNzBsSWRt?=
 =?utf-8?B?ODN4ZFBWY3BPSzlRY2Y1RVFyYTBFQ0pKVEUvejdUUlIxRlFKTVR1NC9QbGh2?=
 =?utf-8?B?Nm5lV1pNeTF6SkxuU0wxTFo2QmdVbEsrUkYrVmoxMkZ1TlpLcUJsUkU1bkUr?=
 =?utf-8?B?dHdwZ2lxYzVrdUdUSHFWVldCMjBzcHgrMmU2dE1Eb2JGMm1TOU9iQXp3NjF0?=
 =?utf-8?B?MForK09oN084cU4reTdPL0k1b3VFY2c4NksxZDU1MVVsakoxMHV5Y1REZGs2?=
 =?utf-8?B?UG1Xd1pYeHpqNDJIdkp2VGNRM0NWVS93d1A3OXdmOHRNdGZ2MVk3YWt5Tzh5?=
 =?utf-8?B?R0ZDcFFCclVjYWZxY3RsaGVKYWN1eVR6clRVUEVteHN2SkZueERjQko2TEdS?=
 =?utf-8?B?QzNDTDdwdUxWM0pHbGFnK1dDelpLV0U0cUs3djdnSk53UmFYRU9RcC9sUVMx?=
 =?utf-8?B?dDJScEhpalFTc3ZheWlpZUNNSk54aTlBTjdBb1Y2MTRaVlkzL3QweTZ6eXZQ?=
 =?utf-8?B?RWlFWUs3c1hWWmJiNDRoTUw4VDViVVR5SXZpbWdieDAzK2ZvNVdrdloxWDdX?=
 =?utf-8?B?bFIvbTZsbExxUXFCYkxLTWlkcmxPM2F3WmJBZDJNWjJTNklyekJTVUlhY2dR?=
 =?utf-8?B?aG16U0Nud29nNmVDMldnbkd0UjFmSWZwMFBja1Z6aUpNOG5vUWkxdXVMN3hZ?=
 =?utf-8?B?YVcrNmtXaS9LY1ZoYXJENHRZaVM5eDNORStDbVk4Ukc2Njg5OGo4MURGUlRV?=
 =?utf-8?B?c1U1dzZCelgxUXZXR2RlTm5jSlpGTldDQVZXbWszNC9yaTU4bUUrT3ZrVjlJ?=
 =?utf-8?B?Qmw4VFlSUnZqemM3alVnUXdpdThVcVBhK0RCMDNyN3FDL09penZZMmZwNlI3?=
 =?utf-8?B?aVF5S1B6VWRjam5uMHYvT1UwalBJQi94UHRmZytpaFVGenh0dUpCRFNPRlZQ?=
 =?utf-8?B?eUZOZ2ZZc3ZTZmNlSG5kOXJxS2ZUU3F2MVNQQ05mUEVWVEN4K09xMHRJZEFC?=
 =?utf-8?B?eE9maVRMYjFmSXFmZEluTkN1aVNES3YrR0UwNDNTVEg2Sy9ZZG9wdnRJcVhL?=
 =?utf-8?B?RXhsVCtYSE1lS1lHYTFxbVpMM3JYcTEyZ25MVUhRRDlJVHZjcG1zV0lqQUIv?=
 =?utf-8?B?dlFiN0h1SExaWnowZWY2dGxpTzVndVF5anQrcFBhK2lVQjhQZjNGQ0ZwT2Qr?=
 =?utf-8?B?N1dRY3g3UDlXRzdOWGNoek5ObHhhaXNQREswcldrQm9VYnJRRzQvTXAySmxV?=
 =?utf-8?B?bTlRSVl3ZTd6ZDV6S2pkdmpjcnlQeldkeGlvTjZaYnNPZHBXVXBOblJOcTJ2?=
 =?utf-8?B?ZVpsWTdZOTJEMlYzc2VSOGpFcnA0L1ZwcmQxdDlrS0RYWm9FYmlVdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de8b05c-630f-454b-8509-08de5530ca66
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8033.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:55:17.7375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgcwUiozPNurCITW7E8nHIXVww+WSFMxqUTTER8GR4bi9aO1CRURxUVK4WcLSEUe2XuRoSX2BrAe9pz3QmJG1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
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


Hi Zbigniew,
On 1/15/2026 00:00, Zbigniew Kempczyński wrote:
> On Mon, Jan 12, 2026 at 07:17:31PM +0000, Xin Wang wrote:
>> This allows IGT to query the exact IP version for xe platforms.
>>
>> Key changes:
>> - Add xe_device_ipver field to xe_device structure
>> - set the graphics versions based on the GMD_ID
>> - Cache device ipver in global map indexed by devid for efficient lookup
>> - Implement xe_ipver_cache_lookup() to retrieve cached ipver by devid
>> - Clean up cached device ipver when xe_device is released
>>
>> V2:
>> - add new struct xe_device_ipver to hold the ipver info
>> - separate cache map to eliminate collision (Roper, Matthew D)
>> - changed function name to xe_ipver_cache_lookup() to avoid
>>    confusion (Roper, Matthew D)
>>
>> V3:
>> - optimize the coding style. (Summers, Stuart)
>>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> Reviewed-by: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
>> ---
>>   lib/intel_chipset.h |  6 +++++
>>   lib/xe/xe_query.c   | 54 ++++++++++++++++++++++++++++++++++++++++++++-
>>   lib/xe/xe_query.h   |  4 ++++
>>   3 files changed, 63 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
>> index cc2225110..424811f7c 100644
>> --- a/lib/intel_chipset.h
>> +++ b/lib/intel_chipset.h
>> @@ -100,6 +100,12 @@ struct intel_device_info {
>>   	const char *codename;
>>   };
>>   
>> +struct xe_device_ipver {
>> +	uint32_t devid;
>> +	uint16_t graphics_ver;
>> +	uint16_t graphics_rel;
>> +};
>> +
>>   const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
>>   
>>   const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__((pure));
>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>> index 981d76948..823a29f2d 100644
>> --- a/lib/xe/xe_query.c
>> +++ b/lib/xe/xe_query.c
>> @@ -210,6 +210,22 @@ static struct xe_device_cache {
>>   	struct igt_map *map;
>>   } cache;
>>   
>> +static struct xe_ipver_cache {
>> +	pthread_mutex_t mutex;
>> +	struct igt_map *map;
>> +} xe_ipver;
>> +
>> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
>> +{
>> +	struct xe_device_ipver *ipver;
>> +
>> +	pthread_mutex_lock(&xe_ipver.mutex);
>> +	ipver = igt_map_search(xe_ipver.map, &devid);
>> +	pthread_mutex_unlock(&xe_ipver.mutex);
>> +
>> +	return ipver;
>> +}
>> +
> Please forgive me for sharing my thoughts only now.
>
> I wondered about this a bit and according to current code shape
> I don't like this design - especially ip_ver cache in xe_query.
> I mean I don't like to use external cache which might or might not
> be filled at time of calling intel_get_device_info().
>
> At the moment I see following options:
>
> 1. Provide update function intel_device_info_update(devid, ver, rel)
>     allowing to update rel field during xe_device_get(). This still
>     keeps intel_device_info.c independent but rel field might be
>     incorrect. BTW I would set it in static definition to -1 (max
>     unsigned) to catch it is not set/updated properly during
>     intel_get_device_info().
>
> 2. Add new function intel_get_device_info_by_fd() which will support
>     passing fd instead devid and migrate code to use it. Most of our code
>     uses fd to acquire device id before calling intel_get_device_info()
>     [exception is igt_device_scan which uses pci devid directly]. This
>     will break intel_device_info.c independency because we start calling
>     driver functions, but maybe it is time to do this (GMD_ID).
>
>     Digression: It seems when INTEL_DEVID_OVERRIDE won't work properly
>     but I wouldn't care about it for now.
>
> 3. Mix 1 and 2 but build hash map from intel_device_match[] in the
>     constructor and update it during xe_device_get(). Pros of this
>     is we could stop using 'static __thread' for caching last info.
>
> --
> Zbigniew
Thanks for the review. In the first version of the patch
(https://patchwork.freedesktop.org/series/155527/#rev2), I
introduced three new APIs specifically for Xe devices
(gen >= 20). However, the Xe.CI Full runs reported many
failures, and it became clear that a proper fix would
require changes across more components than I initially
expected.

For this series, my goal is to provide the smallest and
least-intrusive set of changes needed to resolve the
immediate issue, without triggering a broader refactor of
the device-info infrastructure.

I would like to try option 3 to address the current
solution.

>>   static struct xe_device *find_in_cache_unlocked(int fd)
>>   {
>> ...cut...
>>

