Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAC7CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 08:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9192610E4F8;
	Tue, 11 Nov 2025 08:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cmHxb0y1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01B210E4F8
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762848644; x=1794384644;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CgEUIL3YUy2Vd/GOAa7t8F80TeYur6/oICT+p9l3YLo=;
 b=cmHxb0y1ho/xeuyzFm44Qy87URvTBpil1WsSudX4+hmqkpQA8+nXzrG1
 hOiDr+nx+k7jL9e/zSTih1EspNMsMdgjFBg8soGUhU+1b8qz7KbvgWc+T
 gL+QnN80HvXhk3Anzh4VTSAJUPO3dpGlerP7rjFxY/yNkGLL/2qzccClZ
 Ze5bkgnXttB14GE2sFh3tmLFnr0QpWtTCM6kSpOeFr0c5ONuLDyiqPoox
 6eiejPBC6qcu0AimuHN26SfOXF2mJZHPLoek4m09uxRycBmIhe4vAVuJ8
 Ny4o5/oM0yqqe0nSyk3tH3IlwBWpdi0/H8ebxXDV9Rd3wUWFqhDb1mCzU A==;
X-CSE-ConnectionGUID: pyM1rE6pRcCMHCQI8Oztcw==
X-CSE-MsgGUID: 4BwWeolhQSubJc5UbpPEbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64943465"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64943465"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:10:44 -0800
X-CSE-ConnectionGUID: 8e0ANnkhTwyzXqfykmx2YQ==
X-CSE-MsgGUID: avt4CJ/aQE6YfbeMydCX3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="188666676"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:10:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 00:10:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 00:10:43 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 00:10:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8dU8M/yT4Xck9KFEwTHDq5qUTPUbW958zPy34W5YUd6zqB2fgJ/hSRzCNRhWQVLlXl2Lo7PskDvolkRfkJ3KRELOu8yUj0RVM9Ri9GhF4PaGd7ofkEk1dFUvLD/nGiJ2kBDI2854+4WOg+7A5t8AB2NYO0KssgKbHRnx8Q/yFGfD0Bm4bXymQRMr5IgD+bkNZeDwpfFo5U355JYf/9AxQYAfUaNpr0bpUdPybvwZBnTDQYEB9X2yU16F3UR9GD8Nz5un1F6rk4VZcnhA5UNEO0G14CJQOalro7Dc6qoLsgfeqWhicX0ZtAU9oGn+LjcrBc2n5rK9IvTcbMts6mxSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhwIIBdd2E+Ywl7F3yMWybpFkOvdW6yYPIuRR2HMM9g=;
 b=w1CdYmqzaE9dU+YNtTSIDXKU2zMgbHYe7BGVEVef2tsStRQlovLUN1CI/V78QiM/eQ9J32X+f4HWyonQXh5ZnzqSpQetA4gooOtfpixuggGDVoIdbeqhEPsoOsVWtPdbtkb8vnMjgcjgTjgkDQaiis1MrgOkeREDxThFkMHmALIRGArTSLYlUuzcBMgCS8xGqZsDPQPH4X5wt+vnAoQoKeva9XdJxqshgnfLWpE5O2ECuhRXyKQ7Dn/sJm5F2M5488N0ZBUb3sMwZ65QV5vu6uPc0KoFbgdu9XMDbY0E6TcKWlo60nLLXjBeYb5fbqVUzfsHHNjc2PfPGf7cLf7pZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 08:10:41 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 08:10:41 +0000
Date: Tue, 11 Nov 2025 13:40:34 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Zbigniew Kempczynski
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH 1/2] lib/intel_blt: BB index should be incremented in
 dwords
Message-ID: <aRLvepnCjqftIcBD@bvivekan-mobl1>
References: <20251110135805.3620715-3-balasubramani.vivekanandan@intel.com>
 <87346muen9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87346muen9.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MA5P287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::17) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7cb9e1-4018-4444-6f6d-08de20f9cdfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXBGc2twTFhRNml3TytjSk16ZjRIUTAxWFViTldKSkVlU1RSOE1qR2lZUW52?=
 =?utf-8?B?M1hqcHBSRlh3dXdjVEpHWnMza2tQSml4aEJNempnUzdEb0dPY1c4UlJzQUtq?=
 =?utf-8?B?YnE5NU1ZRFcxaWFjQzNLclZydnNhUzF0OWZpQlo5UFl2WGJETFB5TDVJQy9N?=
 =?utf-8?B?RzMxMEVUazhjMEhRU3k2MEZhZyt6U3NaVVVxUW5OTk9EWEhqY0U1WGd4bUZy?=
 =?utf-8?B?dklITjJhK1lPbEthaDJJWnIxN3VvK0JlUTJrZG50Y0NXYzVpL2E0dXZEYkY0?=
 =?utf-8?B?eDdxeEZubHRkZ3Fya0pMcHNaWUNWUWVBQU9ZMG5RelFacHNRWWFFc1BzaHgr?=
 =?utf-8?B?Q1cvTENydWJ6QWcwNnFNNUU5Yk9lcHh4STM5em1sYjZwNzRhbDRzMTZBS1FF?=
 =?utf-8?B?cEpid09vU09IT0R2OG1WUnphckkrM3hnT2J3NU9XbXFEb0NlelN4c1VWTjVl?=
 =?utf-8?B?NGhCOTRlOXcySUVHOGJaaHJvMUxtTGZVZGV0dC81S2FEbXNoVTdnbUxvZVhH?=
 =?utf-8?B?VTJHTDlpUEVOajNqTlYvbkVNVzVsVit2RkppL3RDdEExR0w2NTFIL1A0K3hh?=
 =?utf-8?B?UnBLeWtJblllYU5scFJkek4ybE5pNEsrVWRNZWRIUU9oVktlcElNclExZWNm?=
 =?utf-8?B?bTVVbFY0S0dOWDdrWThoTEVYT0VCMUFlUmQ1QnIvZHRQZXRwYTRKVzl4akR1?=
 =?utf-8?B?UFNBNDVpVkVuNWFabkxqN2pMNmZpTHhsZ0lLUFFhTFFnek9BOS9tczNDaGVw?=
 =?utf-8?B?WDlBTzhZUEJKYTlVUE4xMStFS3Q5b2JQcHdKdFlkemJlQ1VkL2FuRnlwSzBw?=
 =?utf-8?B?VWdOTmFtTWQvdktGZ2tvbEZObjloMFdySWduWjhnMVN2bE5DMkI5U1lyQjBW?=
 =?utf-8?B?VjVVc1FKTG85ZG9ZSVlENnV2R1lBd2hlTmsrOGZNRmpoNzBOYStRdm9GOUlE?=
 =?utf-8?B?N1Vwdi9BbUhiM1ZpTFF2WGJMMGU2WUtrZndUT3FHSUlDK1IzQmNLcGZCRGZN?=
 =?utf-8?B?aVhncEhHb2syMHdiMTBleWo2LzAvRURNVk5YSmJsSWYwWFRra25iaDJCLzVm?=
 =?utf-8?B?Y0pPamFsUXp0TWljK1VhVDlETmNFYXAvNFZ1VWZIZUZxa0tUQ1M5TXUvTTRk?=
 =?utf-8?B?ZWFQaGFhcXF4ZmExcjE1cUtoYkZWRGNjQUV2N0JNUEhzNXNBVzNNdUtNTnMr?=
 =?utf-8?B?ZmVHRnljU0M4RWZ4OWhOYUhQOW9YNytnbDBKSG12RVAwQkJzU2VyU0pXYmR1?=
 =?utf-8?B?ZW5ML2VSbVlCOUE5NENrTXlxWkZkRXZFUEpkVWZyTFQrSTQ4bTNjWnBIT0N1?=
 =?utf-8?B?eE1YbWdNYU83dEF5WWxEN1NJa2UraUdtUjk4OWNtSW1JWmh5cW9aUDBNcmJC?=
 =?utf-8?B?UjV6eXZlcGFYM1pMUWYrbG9KU3VxUTFEZzIrTjZDb1RsWU9hd2ZkRzArRlEy?=
 =?utf-8?B?L2VHYmpWL1l1UnlKN3FWZmZ3eWUyZGZwRzVSdkhNbnpRdjkwRFRTMHJTbnlF?=
 =?utf-8?B?eUJEUllkVFNBbzB1ZGxYRys1OTluaGJlYllIRmNNV0FzQlFLMWVMU2FFQmk0?=
 =?utf-8?B?UFJPTDlYanE2dmdqeGxuR3pDSGVIS0R2VndPeTh3bjd6SWwwYXJ5dytKa2lu?=
 =?utf-8?B?dTA1Y2VMTjJuc0RCdS9OYk4rTkpGbks0SmhVbzRsUDRqUjhBQTUwNDFlbW01?=
 =?utf-8?B?VDc2V0xzZm45bDBhVjdURG1xQjhvQ3ljL01qd3ZhdldSUFY1aTBFMW1Kb2pN?=
 =?utf-8?B?ZXRzQTdUR0pmNHVZaktPMzlXM0svTTFGcm9UNXBkZ00wcllhdXZQcWtoQy9J?=
 =?utf-8?B?VitrL3JQZEJOYzZ4dWMxTlhiNG5hWCtWc0hteVp3WW9qVG9nbFlRVDR2bWZt?=
 =?utf-8?B?THltblBvSndRRUJqQzBYNzF2T08yWWRuWUxaOFk0c1k4bS9SS2dhalZaM2lz?=
 =?utf-8?Q?oxFwDhC70fSvmNBv49oBTJW9Qo8UZTFC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0lJalM5b240L3hzTkhvd1RzUkt3MUxQMllJT1ZuUEhPWmUxWVV3NEFRQllM?=
 =?utf-8?B?bnpKMWdJVGt5VVBNbEMvRFJyUjBCQldaQjJvY0FDM3FDM0cyNXpmM09mT0l4?=
 =?utf-8?B?eEVHZUNzb0pkN1E0U0Z1ZElUSW8zbDJTSzI3K2JjTHBWb0RQbjZWdkYvMGIy?=
 =?utf-8?B?Nm1EWFdHb2NwRUVQK2duZ1J4L2g0UE4wSEQ2WFJWeE40R2grclVKTXRMUU9z?=
 =?utf-8?B?RWEwdUI5UklkQ2pBOXVNZmxpM2VPNEY3NlFvTmFWMXBjY3N0YkdYclhGTGZy?=
 =?utf-8?B?enFKU3AySWMxbDBEcDQwUm1jaFc4akxDazJQMExmYXpBM2hDWWFCVzMxM2Fx?=
 =?utf-8?B?bk04amJvN29COWpBa3Noa2hwN0JPKzN5QkdHRk5IcFBwS2dCMXUzQTdPRFlD?=
 =?utf-8?B?RHRINzRqemg1VlJadmVJRTAvbmNHbW9Vblo3Tk5pS24xVldkaXRtOC8yOHRh?=
 =?utf-8?B?dmtlUmV2dTB1QXFlWGRmZUc0WmRGRCtlWGVlU2hDcTMrRmRMZm1IUmc2dVZj?=
 =?utf-8?B?ejl6ZlZ3VXhLcnhobnpGL25mL1JiQjFlTEV2aFFWMU50ajBVVWxtQmFRVU9h?=
 =?utf-8?B?REo0Unl2WmdzQ25TRDVXdmxCbG82K2treWhhb3JGYTZwaEFVK0Q4eTlvQUU2?=
 =?utf-8?B?UkRTUGdpN0krNEFYNG5IMWkxSTNDWThwUmN4dkpzR200ZnZJcU9IVitWeW93?=
 =?utf-8?B?ZFVNTTN1K1hxRWJOWGV0VVRzOEZIdk5oa1hRUk1nVU5yOFNKZkpwUHhqcXhY?=
 =?utf-8?B?Y3Ivbi9zbHhqU0hjN2k5dkhhcTZUc00yZHI5WlpKbGJTZ2YycEhUU2pDT3Qw?=
 =?utf-8?B?b3dWamZON3FCenhpTDYvelYrdDY0Z1RzZnlid3hTcjBpWTdQa2EzdTlMZnpR?=
 =?utf-8?B?VXNWS2tVUGV5QWZHZlovbG9xVHUyTWZlbkcyYkc5VDhLV1NNNnVkU283Tmh1?=
 =?utf-8?B?aFlQWlNOR3RHeXhlb2JwU0ZWbWRBM293dUtUaTkwSnBZZVR6aTJvaFJNVk4z?=
 =?utf-8?B?SEczMW1JTVp1eHFTUE1qZExXZktnZk1Tc1VKeFUrNTlqNzM3ZkQvM1lmd0hz?=
 =?utf-8?B?cXQxVUYyWVZBM2NielFRZzJGNGxESk9aOWkvYjNjbXZ4TndMdEtkNG5vcENa?=
 =?utf-8?B?K0s4QzdCcXo4RWEwUElrUDVUMEVwUGNSdVdTc0lad3NIdFNNdUlqU1RsSy9J?=
 =?utf-8?B?MndtOVFJOTJSVzAzRUtpWC9TUUwzY0FMK28yRjNhVUhCd3NiVXhRNmJaUks4?=
 =?utf-8?B?VDZKRXQwVDFBWldLMUYzRjNKSTg2SWJLWkdPYU5idWY5TG9WRXdUcVFqWkpQ?=
 =?utf-8?B?NUFuaHVaYzFkb2IxT2EzREZZQ2dTTU4rS1AzRVZ3STk3VndlM3MyYXY3Mldx?=
 =?utf-8?B?YWxsOXRPeHpaU3BVcVFhSmtQMEJFMDVEbWtrWHdjZkhRQWNvelFUSHBrME9s?=
 =?utf-8?B?RkJoQUlkdERzNGJUeTJSeFFsdzVjdEpoWURtemJHZDVPSUk5ZnpraXFtd3Ju?=
 =?utf-8?B?QnA2akxqdVNUMHp1WmZVeU1DTk5jSHB2dExCY0VtcVcxK1ozaVlieTNhZFVl?=
 =?utf-8?B?bnJUbkxTUnZBd0hZZnk5Y1A2UnZ1NXplVzdXaS9kcUFFVjNtNlpIVnhuYTFW?=
 =?utf-8?B?Z0dqQ3RzdzkreTI3VExyNTBSS2M5M0loZjErZzlvMGc5Q0xIR2U0VHRGdy9S?=
 =?utf-8?B?dG1WUWdsTXlFM0Rjc3ZSaytHMnRYekJzMG1SV0Z6UmcvUUxCcDhlRHUzUWVy?=
 =?utf-8?B?SGlKNjYyVEFGQmtNaFBvQmhvaXhrZkJEbVdaVlhmOXptN3Q1TUo0cEQ0K015?=
 =?utf-8?B?RnpIWW9SMmJ1dmZQZ3hMdWtvU1pEVW9sWnBpSkpkTEMxSGJtL1FRVWdHS3J2?=
 =?utf-8?B?SmlabjJPa0E3ZUlIZWZLcG1PL2JoMjRBTk9XK3pvcDg4c1Z3UGpudkI1VWtS?=
 =?utf-8?B?cWlWTDR4T0xlcUtPQ2F5QUdCWU9NMnBUaGFVOEZhRHFzZXNmZ3FRSURxUHZI?=
 =?utf-8?B?WGhXVUd3dWo4dkNXWXdLY0hvdUl6Rk5WT1czdWtDTmJRL2dxdjF3cXJlcHNh?=
 =?utf-8?B?UWR3b1F3NFpxdWVKTXJkUjQxMjJCaFRJUXcrb0IweDZRWEZCZFVnZG14UGly?=
 =?utf-8?B?SEJrdnRUU3U2cVNhVU50V3Q4bnNteVFOMW1UYTB5MGZyUmxoQ0s0K2FPN3hZ?=
 =?utf-8?Q?Qi6c33ZXkSMmu/h/CXmIi/4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7cb9e1-4018-4444-6f6d-08de20f9cdfb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 08:10:41.0057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6icOSwHNnfahZrGW2mK944fRWsZE92CfPc/R6O/fjCl/s9Y5kzXIsT3k55Uj7dV11fQ02TjkyPFyxcAowJJTuXTff2WhtGe6GyhOajXwZNB5gzPBXIR/nBu8MPhg1Ud0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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

On 10.11.2025 06:48, Dixit, Ashutosh wrote:
> On Mon, 10 Nov 2025 05:58:06 -0800, Balasubramani Vivekanandan wrote:
> >
> > Size in bytes in used to increment the BB index, which is incorrect.
> > Convert bytes to number of dwords.
> >
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  lib/intel_blt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > index 7f7f5485e..9a0bcb96b 100644
> > --- a/lib/intel_blt.c
> > +++ b/lib/intel_blt.c
> > @@ -1714,7 +1714,7 @@ uint64_t emit_blt_fast_copy(int fd,
> >
> >	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
> >	memcpy(bb + bb_pos, &data, sizeof(data));
> 
> What about here?
> 
> 
> > -	bb_pos += sizeof(data);
> > +	bb_pos += DIV_ROUND_UP(sizeof(data), sizeof(*bb));
> >
> >	if (emit_bbe) {
> >		igt_assert(bb_pos + sizeof(uint32_t) < blt->bb.size);
> 
> Here also has:
> 
> 	bb_pos += sizeof(uint32_t);
> 
> And the function is returning bb_pos and can be called multiple times with
> the returned bb_pos.

Right, fix is required at multiple places. I will fix those in the next
revision.

Regards,
Bala

> 
> > --
> > 2.43.0
> >
> 
> So there are multiple places where bb_pos is being added to bb. Maybe the
> fix should be to just make bb a uint8_t * rather than uint32 * ?
