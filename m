Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C24FD41D74
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 04:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292DE10E129;
	Mon, 15 Dec 2025 04:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYPZMFzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C37A10E129
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 04:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765771707; x=1797307707;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=pM8wb+yVOgYicJAPTPE0/psxUleIWCGlrBHKNwIb03I=;
 b=GYPZMFzzGDLW5Mieh9vfaO7Wy+JE8+ovsTx5q7+0WByTpO+yS4PEHTGL
 ppd3MKk/mRMUlX3ENL+03eMMcHJr9p64S/leG9bzlUCmithjgoVOjWf2c
 UeH7ZR8bQOv4SKhCyHUYj6wiyUx2b2CiTo8s7XG77Az+pQ5DNDYEaSEvd
 rsDEaOin2QclWvuXWHr5aGk90hcrjdz0BR+ynn6tZkXug7ljjhM7xb3Db
 3L8gjFBmpO4aUUBK0GSccyPk/ZPxcUP1JtDkBXyg9DMSZTJn89bV9JS95
 umfEov7UH2oSltozwcvBiTVf/xzgJFb3RgV/HyXrXCJwWPbiEIZpLS7zO w==;
X-CSE-ConnectionGUID: DxOe3NNCQFuZTB62J/r0hg==
X-CSE-MsgGUID: HBmy4Xy7QNm7esVb4ik+Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78784980"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208,217";a="78784980"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2025 20:08:26 -0800
X-CSE-ConnectionGUID: BZd9owfDRIaIwvW9d/+1/w==
X-CSE-MsgGUID: DeElBv2xRH6DNmPl8wDkHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
 d="scan'208,217";a="221016603"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2025 20:08:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 14 Dec 2025 20:08:26 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 14 Dec 2025 20:08:26 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 14 Dec 2025 20:08:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nf/9vmGcHHEO9rELp7fbbkDaKVXLKvLcj/jhX3oPf3967G6005jaEn34FU2PUv1b73MwW7fSICuZCVvm832tvTUCDlrDBYVX6loSmOpoTzYjFgvb0fnwf+RYxnKSsAkaTmX8/KShTM6bTTG6BZvZplOlpYXOljsFF0/CYSIH74HU6diA3pri2Zle8Sgdj90mvu/N2a7VepOtywUC5jK0Ez/EPxVt3e7PFC59U+nXFzBM41E9vQgSOB60ajR6zP4fKut0S6vMBgfZ+Ad6oicL3UV9ysquTP5NG8Xd2AszfBilTiWgsrYF3PpRnomBu7wRTwW6FUieOkZLSkIc+ttzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUAR3a7/FksGsXEKrBpgR6MIiyKc/idcjWdGszC9fSw=;
 b=vHvlla0IDFHOO94b1e1eETuU/FPuwWw3beBOx07GY0GRHizwcfXDGaBYiSo3J5x69Nhi/k7P71JTexE3QfoZ+BY8LxiSv6D/C/NwZ4AAJ9RGPkY8CapYE7saY/hL+nwUzSNw+lkkRPWR90Wq9Pq90BCS6bcgzb+CDaKRB5cIEIFF/pRYt9RX2aj5dQXUMPkXYJ6cvQtEreGL6ErI3IdHd25qPGhW4u6tnI/gvAW2u+A9Vq8O1WxrvGD4kodtUgAk/B3aLZu+unod6SrdDX+phcDpRtKYgnf4PiJi1Tyan6Yv8cSvK97Y8iIzCprkOmoV6I+Mcu+JRlZ93FIw2265Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by IA0PR11MB7695.namprd11.prod.outlook.com (2603:10b6:208:400::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 04:08:18 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 04:08:18 +0000
Content-Type: multipart/alternative;
 boundary="------------3vUiLbcwDAUMkb5y474VJZcv"
Message-ID: <4c9f5521-013d-49ae-a021-f742b404f386@intel.com>
Date: Mon, 15 Dec 2025 09:38:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/2] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>
References: <20251209173513.4020947-1-soham.purkait@intel.com>
 <20251209173513.4020947-3-soham.purkait@intel.com>
 <20251212214122.uzu2gcvuj23ejfyz@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20251212214122.uzu2gcvuj23ejfyz@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|IA0PR11MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f8f628-2ee5-4728-7d5f-08de3b8f93b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0xwQmJ6czl6bUlIUjhTMDNkRDdxUGZIZ0x4VU5zWXR5TG51TXhZNXc3RzZH?=
 =?utf-8?B?YTJIeDVGV3JUQXpwWml2Q2VYZ2Z1R0tDQ0tJU1dhWVBtd0dvbE5VS0VlQXVi?=
 =?utf-8?B?akVMNlB0YkVsY2xNbDltZXhPZ2E2VHRhQ2d4QWFGOTQ3S0d0UUlKUkFaY2NT?=
 =?utf-8?B?K2h3cFFEOFI2MGtEQkJIQlZHK3A5VjQxRW9yTlJHamdyb1U0S1RIT2UyWEhk?=
 =?utf-8?B?T2ZHaDlyZHYyMUV5Vi9VKzhWV0lqc2tPNC9LbUwxU2grTlMzdmNBeUVZRzht?=
 =?utf-8?B?RzF6R0NINmxBUzFqVmhKbERvTm9YVjlQdWRudG9LTGFxVC9HYXVobXFxM1RD?=
 =?utf-8?B?bDE4Q2t1LzBxaDkwcWxscUFhUlNXWFdhOE93RFNOVW4yR0orWTRyS3pYOU5x?=
 =?utf-8?B?MTBlODVwN3hVdnFoeEhVeXlYWUJPNkFtSzlibE1JTXlhQklKdFJpNzlCdk12?=
 =?utf-8?B?TFdWSlVPVnRobjBwaS9YTHplOEdleVFOZFFxTDFodmozZXMxdWsrMHlPbUdq?=
 =?utf-8?B?OHdiS2RVcktObnBqV0lPYVZtaTh0MXF5QzNZaCtKdlFVS0NRK2pydm9mVmlq?=
 =?utf-8?B?K1J0UnBDVVVlTDNYYncreG1raFdLazhEV2N2bW1UME1UWHBwYitNQ3IzbGVW?=
 =?utf-8?B?ajZvK3JPRG15eUhoZXFGeWNFdUgyejdMcEJFUGNUQklrY0dKZXMwbzFhclJK?=
 =?utf-8?B?d3drY0ZmTVpWQU8ramdPZ2t4TkRiUVdTNk9wV29WU2pQbzl4Sk9Sa3g4aVBV?=
 =?utf-8?B?TFdqN3ZOcXZDUWFaK2J2MUNqNnNidnRPUGc1TlY0MGdBL0FoTmMyVVYxc3kv?=
 =?utf-8?B?THdTREdJbWNKUkdxdkttSzRJV25PbG5hQ1lyL3pqejYwZ3R5MEt4T1dxWC9j?=
 =?utf-8?B?RVRYVjYyOTZWZUZSdFduWUE2UUlKTVBpajJ1Mi9HUGdmNlg1aHFTN3lxaXJv?=
 =?utf-8?B?azhPQWszT0crVGY1cllmZ2I1ejBvQXJ5VmtMSVVVNXlpOXRGSmo4bG1sdGdD?=
 =?utf-8?B?MTB5c0IwOTdQakQ4WnJ5UzBmZXZWOVZJOTFCR1RzRllaRlJNODhkSEd4UlYv?=
 =?utf-8?B?NStoTDc5SEErMGlPb0hzYkpodzF0ZS92VmttQ3RxU0czUFdFNG9oV1ErR09m?=
 =?utf-8?B?VkV0WnpFZ3UyOTkvbFdEVStaZ1JMUFB1NEVmb0lJWkNpNkxCZkVESGRORFVa?=
 =?utf-8?B?K0ZzMko1ZXh4ajdpbEtLckhIVUVjcUkzcGNlSENCZFhCM0gwVGJTMXZEbEdw?=
 =?utf-8?B?aXVTUEovWTh5K0lYN2hDZTJyQmVsUHJta0owNEE5YmNMc2t2Ui9SaTZWQ2hN?=
 =?utf-8?B?MUVhQXdEMUwyWDh4TE1rVklZQndLSThjcGRQcTh2eXZmNThkSTN5V3gzN1Zi?=
 =?utf-8?B?SXVjMWdtU0RvL2lpTVMzaEkrcHl3V05SMlJxUUR5V0VCUlpVN2xKSHQ2YS9W?=
 =?utf-8?B?cHhXSDJ0WC9vQWpwNFBOb3pmajhWYjFydjEwcjRMc0d3bHRlaHg4NkU4VWRa?=
 =?utf-8?B?WmpOU3hSMldXSTRYdFZ4Tmg3TTJKTCtGeUNQd3JLMUFvRXh3OEZVRUgrdkpU?=
 =?utf-8?B?VjNEM25tUTBWem1wL29RK2VXM1pxblN1STUxZzd6ZDFSbXIwcldxTll5dG5i?=
 =?utf-8?B?cjJFTDEvUDNPYVpLamd6SEdIRjRPNGZEMHVLN3VDQTVsODMvUnF5VTVWdHl6?=
 =?utf-8?B?aWhsaGwyTFlJdEpjU3NneWpaN3hRWjg1eWtsUzhQUGRSWHdwUU9jbHVHaFNo?=
 =?utf-8?B?MU1jY1dROVU3YkYyV3REVHoyVzgwUFFkTEI5S3JQdW82ZDhHcWFyem9YMlV6?=
 =?utf-8?B?VGl5ZjNkUElzRWtvNFJYN1lXN2ljWGg1UGVZSDUwRjVGNFNtQ2hZUnIxZE4y?=
 =?utf-8?B?em9MR3NxdktTMXA0NjdqV0M3QVRQcDVaUFhLUEc1SGZkdmdPQzNZcjFnd0Vp?=
 =?utf-8?B?dmI4WTNyVFVqTlM4Ungza3RNUVRMT2FHYXZTY2NZNXpPMytCOHRMdmE4dURr?=
 =?utf-8?B?MWM5VTh3eEJ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVJNUUJEOHZTZkZHbnBjelBETXRDRjVyY1NOeUNwekpXVzNySXV5ZDFwVnJj?=
 =?utf-8?B?NVgxdkpYVkJGWHhtenJoc0g1MnI2QVUzbXc3bkwxcUV6VitremVSM1U5TWlM?=
 =?utf-8?B?V0ZsZk5ZZWFmYmVVWWMvT0FVcmdtbGI5QytXVjRxemNWY1lmZmREWmsvbXpD?=
 =?utf-8?B?a2tDMUpJWHg4UzBQUnZxaWFPNWxTRlBGUjYxWmlQR09ZSUUrRmtLM1BRMVFw?=
 =?utf-8?B?aWF2eW1VbzNlWWR2aFlWYmtqZXY1T1R4amRaVXoxZGtMRXdNQ243RlIzdGw0?=
 =?utf-8?B?blpCclZsMGNmTzBZMTE1c2syM0hMMUhWSUY5MTB4VE5vSVMvOVcwb1VHWjZI?=
 =?utf-8?B?dXFQMUNCWkJVWVJSUHF0ZTVGYWxEU2djSHhHQjlEM05vdE5ScnMxUXYrL29D?=
 =?utf-8?B?SS8xMHp1c1FwOE5kdXlXZ3dkY2NqMTliN1RLaTRReUVmSlR2aTVWRXVmRysr?=
 =?utf-8?B?QjA4Znlrb282ZW1OSHMxejRKcTFuM2d5b2NiWFVFdmNxc1I4SnlsMmcyRm5n?=
 =?utf-8?B?bGl0UFRyblJEbEV2TlBveVY2ZjNiUkQ3dFhZcXFnM1VFd3JrTnpoN0RUZm1r?=
 =?utf-8?B?cENvTWdvU0lSNm5YWVpOdkk3OXM0QytML2YwQlBTbkIvZ0JMSDVYRTNxeldm?=
 =?utf-8?B?WVg2eTlKWmxkL3ZjZ1llVzloVVpCSVI3dmpRV0s0OXprVzhLV3Q5aTNHMEhq?=
 =?utf-8?B?ZUk3dmJORzFVTkZWUHlrdW5VZE16RjBlTWF1eTNMR1ZTWi9mNEpaT2hJYnRI?=
 =?utf-8?B?L3NaZEdOL1ZpZ211UVFhcjd0MjVmTVZUVnpNakJHOTRkQ2Q0UTFwN1YzRS9G?=
 =?utf-8?B?M3RKMWp2SlNpT3lPZ1ptMXoyemFsOVhxOUNTUHJrSUxZbkgzUXNkT2VnVlRy?=
 =?utf-8?B?Y25oR1o2Y2hObjlESjZpblhhYURwY29EODVLOFdVVUg4S2FYTHBvVkd3RjQz?=
 =?utf-8?B?dC9FVmtVR1BRWHRxR0VDTWcrYURRRm9nbHZUMi94c3puenVMUWVjclBibCtx?=
 =?utf-8?B?NGt3OVJRLzNsWmpBTFFEYm1wSUZBelE4UnFqSlJiaE5WcFh4eldGY0thMmh4?=
 =?utf-8?B?WTMwS1FsdStTdlN0YUhwREw2V2hDODM3aXJDZTVpSmlYY0d2d3NTeUZUbllp?=
 =?utf-8?B?d1Nad0d4V3NMUFVvZXJrRXpYNXErdVdPbkpHWlRPU1FlOHZxRFVJVlFUaXZG?=
 =?utf-8?B?d2NxRTNmSkFYQlduRVdXOE80S2xMWG9jNi9NRmVyTkN3UlFZZlVubVMyYklK?=
 =?utf-8?B?d3BSek10RTdIT0RuU3NxWS9zRndRTGJpQzR3V0R6ZHRUSjNFWjZYTmZqc3cx?=
 =?utf-8?B?djhNeDgyRlNHQmg1KzJvZ2ZMQmRLdTZvc1lSQXpBc0x5TmZ6YW9ZZWNsK21I?=
 =?utf-8?B?ZnBsZERmdXJvS3Z3N0FsbWNoSGdJRGhWS3NFY0lQWEluc29wK3kzZHpYdVZE?=
 =?utf-8?B?R1lnQm5DMks4c3J6Z3VsSUFWRXd3RHU1NnhQWXlrU293cVk2cVVhT0N5b2F2?=
 =?utf-8?B?UGlVampCRERiYnA0em9zYllQUlBKSVQ4VmRoWGVNUHFodVd3d1ZJWVRuSk0w?=
 =?utf-8?B?YUg1WENROU1xNXNnUlB0SG9kcWc1bEU0aThhZ1ZJbDJKUEdKWUtuaC9SRmky?=
 =?utf-8?B?LzdESk42ZTRGOUtQTUNHSlNhOFBRMlBMcFBxKy9tVGdKLzNBYkZESkRTb3dG?=
 =?utf-8?B?Zlp2Z0hVcXA4cFpQQUd2MVhoS0xkWlRmOG5KcWxlNlhkMXlpU0NrZ0IzQUNS?=
 =?utf-8?B?d2hIYUZZU3crV01kUHp4UERsM2FRWHdrTVVDb2s0L051NGhGQm04emQ4Qy94?=
 =?utf-8?B?eHg2WTBmU0Z4VDI2SFovRFN6UkI5anB3ekxuVWJKWEltUEtNcDJQNEN3b29K?=
 =?utf-8?B?MVNJdVhPUklvZGNHaENLNlZzVXZqcTF3eXdkdHJ1ajhyVWNsYUhXRTJ3S3cv?=
 =?utf-8?B?aVNyY3RhbVFGcjhSRGhSM0FJYjhYcjNMR2VranZlWkRiczNZZG0zUWhNOHox?=
 =?utf-8?B?MkdPMXlZeTFVUE1RZEdGdXZndS9KaGhGSlY1dkV2UTcwL2gzaldBbUMyTVN2?=
 =?utf-8?B?QmF5Ni9GMU9SVWpjbXYrdmN5SHNGK0cwcGZkdzZXZkd2QUpoSlVzTjQ4bUM1?=
 =?utf-8?B?bWZBZUJUeGp6SVBYcy9ONzJxOWNBQ0NlVTRvUWJicFgzRDVQd05RMFp3cFdh?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f8f628-2ee5-4728-7d5f-08de3b8f93b8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 04:08:18.2361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QJIuks0d1osXzZN5dxviu94bxOVcG2+ZTh7RmTdnq6Rf5iQFGuwbZAcCNIJ3kOkckWnaD5oIePFKgAkre8cdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7695
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

--------------3vUiLbcwDAUMkb5y474VJZcv
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kamil,

On 13-12-2025 03:11, Kamil Konieczny wrote:
> Hi Soham,
> On 2025-12-09 at 23:05:13 +0530, Soham Purkait wrote:
>> Introduce vendor-agnostic support for handling multiple GPUs and instances
>> in gputop. Improve the tool's adaptability to various GPU configurations.
>>
>> v1:
>>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
>> v2:
>>   - Add device filter to populate the array of cards for
>>     all supported drivers. (Zbigniew)
>> v3:
>>   - Cosmetic changes. (Riana)
>>   - Avoid three level indentation. (Riana)
>> v4:
>>   - Add user message for running without root privileges. (Kamil)
>> v5:
>>   - Add support for GPU client-only busyness on unsupported
>>     drivers as a fallback mechanism. (Kamil)
>>
>> Signed-off-by: Soham Purkait<soham.purkait@intel.com>
>> ---
>>   tools/{ => gputop}/gputop.c | 283 +++++++++++++++++++++++++++++++-----
>>   tools/gputop/meson.build    |   6 +
>>   tools/meson.build           |   6 +-
>>   3 files changed, 250 insertions(+), 45 deletions(-)
>>   rename tools/{ => gputop}/gputop.c (59%)
>>   create mode 100644 tools/gputop/meson.build
>>
>> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
>> similarity index 59%
>> rename from tools/gputop.c
>> rename to tools/gputop/gputop.c
>> index f577a1750..e13f98b82 100644
>> --- a/tools/gputop.c
>> +++ b/tools/gputop/gputop.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: MIT
>>   /*
>> - * Copyright © 2023 Intel Corporation
>> + * Copyright © 2023-2025 Intel Corporation
>>    */
>>   
>>   #include <assert.h>
>> @@ -14,66 +14,148 @@
>>   #include <math.h>
>>   #include <poll.h>
>>   #include <signal.h>
>> +#include <stdbool.h>
>>   #include <stdint.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>>   #include <sys/ioctl.h>
>>   #include <sys/stat.h>
>> +#include <sys/sysmacros.h>
>>   #include <sys/types.h>
>> -#include <unistd.h>
>>   #include <termios.h>
>> -#include <sys/sysmacros.h>
>> -#include <stdbool.h>
>> +#include <unistd.h>
>>   
>>   #include "igt_core.h"
>>   #include "igt_drm_clients.h"
>>   #include "igt_drm_fdinfo.h"
>> +#include "igt_perf.h"
>>   #include "igt_profiling.h"
>> -#include "drmtest.h"
>> +#include "xe_gputop.h"
>> +#include "xe/xe_query.h"
>> +
>> +/**
>> + * Supported Drivers
>> + *
>> + * Adhere to the following requirements when implementing support for the
>> + * new driver:
>> + * @drivers: Update drivers[] with driver string.
>> + * @sizeof_gputop_obj: Update this function as per new driver support included.
>> + * @operations: Update the respective operations of the new driver:
>> + * gputop_init,
>> + * discover_engines,
>> + * pmu_init,
>> + * pmu_sample,
>> + * print_engines,
>> + * clean_up
>> + * @per_driver_contexts: Update per_driver_contexts[] array of type "struct gputop_driver" with the
>> + * initial values.
>> + */
>> +static const char * const drivers[] = {
>> +	"xe",
>> +    /* Keep the last one as NULL */
>> +	NULL
>> +};
>> +
>> +static size_t sizeof_gputop_obj(int driver_num)
>> +{
>> +	switch (driver_num) {
>> +	case 0:
>> +		return sizeof(struct xe_gputop);
>> +	default:
>> +		fprintf(stderr,
>> +			"Driver number does not exist.\n");
>> +		exit(EXIT_FAILURE);
>> +	}
>> +}
>> +
>> +/**
>> + * Supported operations on driver instances. Update the ops[] array for
>> + * each individual driver specific function. Maintain the sequence as per
>> + * drivers[] array.
>> + */
>> +struct device_operations ops[] = {
>> +	{
>> +		xe_gputop_init,
>> +		xe_populate_engines,
>> +		xe_pmu_init,
>> +		xe_pmu_sample,
>> +		xe_print_engines,
>> +		xe_clean_up
>> +	}
>> +};
>> +
>> +/*
>> + * per_driver_contexts[] array of type struct gputop_driver which keeps track of the devices
>> + * and related info discovered per driver.
>> + */
>> +struct gputop_driver per_driver_contexts[] = {
>> +	{false, 0, NULL}
>> +};
>>   
>>   enum utilization_type {
>>   	UTILIZATION_TYPE_ENGINE_TIME,
>>   	UTILIZATION_TYPE_TOTAL_CYCLES,
>>   };
>>   
>> -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>> -
>> -#define ANSI_HEADER "\033[7m"
>> -#define ANSI_RESET "\033[0m"
>> -
>> -static void n_spaces(const unsigned int n)
>> +static void gputop_clean_up(void)
>>   {
>> -	unsigned int i;
>> -
>> -	for (i = 0; i < n; i++)
>> -		putchar(' ');
>> +	for (int i = 0; drivers[i]; i++) {
>> +		ops[i].clean_up(per_driver_contexts[i].instances, per_driver_contexts[i].len);
>> +		free(per_driver_contexts[i].instances);
>> +		per_driver_contexts[i].device_present = false;
>> +		per_driver_contexts[i].len = 0;
>> +	}
>>   }
>>   
>> -static void print_percentage_bar(double percent, int max_len)
>> +static int find_driver(struct igt_device_card *card)
>>   {
>> -	int bar_len, i, len = max_len - 1;
>> -	const int w = 8;
>> -
>> -	len -= printf("|%5.1f%% ", percent);
>> -
>> -	/* no space left for bars, do what we can */
>> -	if (len < 0)
>> -		len = 0;
>> -
>> -	bar_len = ceil(w * percent * len / 100.0);
>> -	if (bar_len > w * len)
>> -		bar_len = w * len;
>> +	for (int i = 0; drivers[i]; i++) {
>> +		if (strcmp(drivers[i], card->driver) == 0)
>> +			return i;
>> +	}
>> +	return -1;
>> +}
>>   
>> -	for (i = bar_len; i >= w; i -= w)
>> -		printf("%s", bars[w]);
>> -	if (i)
>> -		printf("%s", bars[i]);
>> +static int populate_device_instances(const char *filter)
>> +{
>> +	struct igt_device_card *cards = NULL;
>> +	struct igt_device_card *card_inplace = NULL;
>> +	struct gputop_driver *driver_entry =  NULL;
>> +	int driver_no;
>> +	int count, final_count = 0;
>> +
>> +	count = igt_device_card_match_all(filter, &cards);
>> +	for (int j = 0; j < count; j++) {
>> +		if (strcmp(cards[j].subsystem, "pci") != 0)
>> +			continue;
>>   
>> -	len -= (bar_len + (w - 1)) / w;
>> -	n_spaces(len);
>> +		driver_no = find_driver(&cards[j]);
>> +		if (driver_no < 0)
>> +			continue;
>>   
>> -	putchar('|');
>> +		driver_entry = &per_driver_contexts[driver_no];
>> +		if (!driver_entry->device_present)
>> +			driver_entry->device_present = true;
>> +		driver_entry->len++;
>> +		driver_entry->instances = realloc(driver_entry->instances,
>> +						  driver_entry->len * sizeof_gputop_obj(driver_no));
>> +		if (!driver_entry->instances) {
>> +			fprintf(stderr,
>> +				"Device instance realloc failed (%s)\n",
>> +				strerror(errno));
>> +			exit(EXIT_FAILURE);
>> +		}
>> +		card_inplace = (struct igt_device_card *)
>> +				calloc(1, sizeof(struct igt_device_card));
>> +		memcpy(card_inplace, &cards[j], sizeof(struct igt_device_card));
>> +		ops[driver_no].gputop_init(driver_entry->instances, (driver_entry->len - 1),
>> +			card_inplace);
>> +		final_count++;
>> +	}
>> +	if (count)
>> +		free(cards);
>> +	return final_count;
>>   }
>>   
>>   static int
>> @@ -333,6 +415,7 @@ static void clrscr(void)
>>   struct gputop_args {
>>   	long n_iter;
>>   	unsigned long delay_usec;
>> +	char *device;
>>   };
>>   
>>   static void help(char *full_path)
>> @@ -350,16 +433,18 @@ static void help(char *full_path)
>>   	       "\t-h, --help                show this help\n"
>>   	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
>>   	       "\t-n, --iterations =NUMBER  number of executions\n"
>> +	       "\t-D, --device              Device filter\n"
>>   	       , short_program_name);
>>   }
>>   
>>   static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>>   {
>> -	static const char cmdopts_s[] = "hn:d:";
>> +	static const char cmdopts_s[] = "hn:d:D:";
>>   	static const struct option cmdopts[] = {
>>   	       {"help", no_argument, 0, 'h'},
>>   	       {"delay", required_argument, 0, 'd'},
>>   	       {"iterations", required_argument, 0, 'n'},
>> +	       {"device", required_argument, 0, 'D'},
>>   	       { }
>>   	};
>>   
>> @@ -367,6 +452,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>>   	memset(args, 0, sizeof(*args));
>>   	args->n_iter = -1;
>>   	args->delay_usec = 2 * USEC_PER_SEC;
>> +	args->device = NULL;
>>   
>>   	for (;;) {
>>   		int c, idx = 0;
>> @@ -390,6 +476,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>>   				return -1;
>>   			}
>>   			break;
>> +		case 'D':
>> +			args->device = optarg;
>> +			break;
>>   		case 'h':
>>   			help(argv[0]);
>>   			return 0;
>> @@ -417,9 +506,12 @@ int main(int argc, char **argv)
>>   	struct igt_profiled_device *profiled_devices = NULL;
>>   	struct igt_drm_clients *clients = NULL;
>>   	int con_w = -1, con_h = -1;
>> +	bool is_root;
>>   	int ret;
>>   	long n;
>>   
>> +	is_root = (geteuid() == 0);
> Note that this is not required when a user is in a group.
> Better way is to just try to open a file and only when it fails
> act accordingly.
This is just a boolean variable which stores if it is running as root or 
non root. Rest it does the same way as you mentioned, when it fails.
>
>> +
>>   	ret = parse_args(argc, argv, &args);
>>   	if (ret < 0)
>>   		return EXIT_FAILURE;
>> @@ -429,6 +521,92 @@ int main(int argc, char **argv)
>>   	n = args.n_iter;
>>   	period_us = args.delay_usec;
>>   
>> +	if (!populate_device_instances(args.device ? args.device
>> +				       : "device:subsystem=pci,card=all") &&
>> +				       geteuid()) {
>> +		printf("\n" ANSI_HEADER "Run with root "
>> +		       "privileges for GPU client "
>> +		       "busyness.\n" ANSI_RESET "\n");
> So you still need a root, as I said it is a regression.

Could you please clarify with which functionality or tool  this is 
compared to as a regression?
By the way, PMU is not accessible without root or setting the capability.

> Imho looks like you want to create a new tool ngputop.

Why not GPUTOP ?

Thanks,
Soham.

> You could create it in tools/ngputop.src/ <- most source files here
> and link into executable tools/ngputop
>
> In a new tool you could require to have a root or group or caps.
>
> Regards,
> Kamil
>
>> +		gputop_clean_up();
>> +		exit(1);
>> +	}
>> +
>> +	for (int i = 0; drivers[i]; i++) {
>> +		if (!per_driver_contexts[i].device_present)
>> +			continue;
>> +
>> +		for (int j = 0; j < per_driver_contexts[i].len; j++) {
>> +			if (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
>> +				fprintf(stderr,
>> +					"Failed to initialize engines! (%s)\n",
>> +					strerror(errno));
>> +					gputop_clean_up();
>> +				return EXIT_FAILURE;
>> +			}
>> +			ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
>> +
>> +			if (ret) {
>> +				if (errno == EACCES && !is_root) {
>> +					fprintf(stderr,
>> +						"\n"
>> +						"When running as a normal user, "
>> +						"CAP_PERFMON or perf_event_paranoid\n"
>> +						"is required to access performance "
>> +						"monitoring.\n"
>> +						"\n"
>> +						ANSI_HEADER "Through CAP_PERFMON "
>> +						"capability"
>> +						ANSI_RESET "\n"
>> +						"cd /path/to/igt-gpu-tools/\n"
>> +						"sudo setcap cap_perfmon=+ep $(pwd)/"
>> +						"build/tools/gputop/gputop\n"
>> +						"sudo sh -c \"echo $(pwd)/build/lib >"
>> +						" /etc/ld.so.conf.d/lib-igt.conf\"\n"
>> +						"sudo ldconfig\n"
>> +						ANSI_HEADER "Revert:" ANSI_RESET "\n"
>> +						"sudo setcap cap_perfmon=-ep $(pwd)/"
>> +						"build/tools/gputop/gputop\n"
>> +						"sudo rm /etc/ld.so.conf.d/lib-igt.conf\n"
>> +						"sudo ldconfig\n"
>> +						"\n"
>> +						ANSI_HEADER "Through perf_event_paranoid"
>> +						" (system-wide policy)"
>> +						ANSI_RESET "\n"
>> +						"# Save current value\n"
>> +						"orig_val=$(sysctl -n "
>> +						"kernel.perf_event_paranoid)\n"
>> +						"# Allow non-root perf usage\n"
>> +						"sudo sysctl -w kernel.perf_event_paranoid=-1\n"
>> +						ANSI_HEADER "Revert:" ANSI_RESET "\n"
>> +						"sudo sysctl -w kernel."
>> +						"perf_event_paranoid=$orig_val\n"
>> +						"\n"
>> +						"For details, see 'Perf events and "
>> +						"tool security':\n"
>> +						"https://www.kernel.org/doc/html/"
>> +						"latest/admin-guide/perf-security.html\n");
>> +					igt_devices_free();
>> +					gputop_clean_up();
>> +					return EXIT_SUCCESS;
>> +				} else {
>> +					fprintf(stderr,
>> +						"Failed to initialize PMU! (%s)\n",
>> +						strerror(errno));
>> +					igt_devices_free();
>> +					gputop_clean_up();
>> +					return EXIT_FAILURE;
>> +				}
>> +			}
>> +		}
>> +	}
>> +
>> +	for (int i = 0; drivers[i]; i++) {
>> +		for (int j = 0;
>> +		     per_driver_contexts[i].device_present && j < per_driver_contexts[i].len;
>> +		     j++)
>> +			ops[i].pmu_sample(per_driver_contexts[i].instances, j);
>> +	}
>> +
>>   	clients = igt_drm_clients_init(NULL);
>>   	if (!clients)
>>   		exit(1);
>> @@ -449,22 +627,47 @@ int main(int argc, char **argv)
>>   
>>   	while ((n != 0) && !stop_top) {
>>   		struct igt_drm_client *c, *prevc = NULL;
>> -		int i, engine_w = 0, lines = 0;
>> +		int k, engine_w = 0, lines = 0;
>>   
>>   		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>> +
>> +		for (int i = 0; drivers[i]; i++) {
>> +			for (int j = 0;
>> +			     per_driver_contexts[i].device_present &&
>> +			     j < per_driver_contexts[i].len;
>> +			     j++)
>> +				ops[i].pmu_sample(per_driver_contexts[i].instances, j);
>> +		}
>> +
>>   		igt_drm_clients_sort(clients, client_cmp);
>>   
>>   		update_console_size(&con_w, &con_h);
>>   		clrscr();
>>   
>> +		for (int i = 0; drivers[i]; i++) {
>> +			for (int j = 0;
>> +			     per_driver_contexts[i].device_present &&
>> +			     j < per_driver_contexts[i].len;
>> +			     j++) {
>> +				lines = ops[i].print_engines(per_driver_contexts[i].instances, j,
>> +							 lines, con_w, con_h);
>> +			}
>> +		}
>> +
>>   		if (!clients->num_clients) {
>> -			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>> +			const char *msg;
>> +
>> +			if (is_root)
>> +				msg = " (No GPU clients yet. Start workload to see stats)";
>> +			else
>> +				msg = " (GPU client busyness is only available with root"
>> +				" privileges)";
>>   
>>   			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
>>   			       (int)(con_w - strlen(msg) - 1), msg);
>>   		}
>>   
>> -		igt_for_each_drm_client(clients, c, i) {
>> +		igt_for_each_drm_client(clients, c, k) {
>>   			assert(c->status != IGT_DRM_CLIENT_PROBE);
>>   			if (c->status != IGT_DRM_CLIENT_ALIVE)
>>   				break; /* Active clients are first in the array. */
>> @@ -488,11 +691,11 @@ int main(int argc, char **argv)
>>   	}
>>   
>>   	igt_drm_clients_free(clients);
>> +	gputop_clean_up();
>>   
>>   	if (profiled_devices != NULL) {
>>   		igt_devices_configure_profiling(profiled_devices, false);
>>   		igt_devices_free_profiling(profiled_devices);
>>   	}
>> -
>>   	return 0;
>>   }
>> diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
>> new file mode 100644
>> index 000000000..4766d8496
>> --- /dev/null
>> +++ b/tools/gputop/meson.build
>> @@ -0,0 +1,6 @@
>> +gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
>> +executable('gputop', sources : gputop_src,
>> +           install : true,
>> +           install_rpath : bindir_rpathdir,
>> +           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
>> +	   install: true)
>> diff --git a/tools/meson.build b/tools/meson.build
>> index 8185ba160..99a732942 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -70,11 +70,6 @@ if libudev.found()
>>   		   install : true)
>>   endif
>>   
>> -executable('gputop', 'gputop.c',
>> -           install : true,
>> -           install_rpath : bindir_rpathdir,
>> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
>> -
>>   intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>>   executable('intel_l3_parity', sources : intel_l3_parity_src,
>>   	   dependencies : tool_deps,
>> @@ -123,3 +118,4 @@ endif
>>   subdir('i915-perf')
>>   subdir('xe-perf')
>>   subdir('null_state_gen')
>> +subdir('gputop')
>> -- 
>> 2.34.1
>>
--------------3vUiLbcwDAUMkb5y474VJZcv
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Kamil,</p>
    <div class="moz-cite-prefix">On 13-12-2025 03:11, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251212214122.uzu2gcvuj23ejfyz@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Soham,
On 2025-12-09 at 23:05:13 +0530, Soham Purkait wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce vendor-agnostic support for handling multiple GPUs and instances
in gputop. Improve the tool's adaptability to various GPU configurations.

v1:
 - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
v2:
 - Add device filter to populate the array of cards for
   all supported drivers. (Zbigniew)
v3:
 - Cosmetic changes. (Riana)
 - Avoid three level indentation. (Riana)
v4:
 - Add user message for running without root privileges. (Kamil)
v5:
 - Add support for GPU client-only busyness on unsupported
   drivers as a fallback mechanism. (Kamil)

Signed-off-by: Soham Purkait <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
---
 tools/{ =&gt; gputop}/gputop.c | 283 +++++++++++++++++++++++++++++++-----
 tools/gputop/meson.build    |   6 +
 tools/meson.build           |   6 +-
 3 files changed, 250 insertions(+), 45 deletions(-)
 rename tools/{ =&gt; gputop}/gputop.c (59%)
 create mode 100644 tools/gputop/meson.build

diff --git a/tools/gputop.c b/tools/gputop/gputop.c
similarity index 59%
rename from tools/gputop.c
rename to tools/gputop/gputop.c
index f577a1750..e13f98b82 100644
--- a/tools/gputop.c
+++ b/tools/gputop/gputop.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2025 Intel Corporation
  */
 
 #include &lt;assert.h&gt;
@@ -14,66 +14,148 @@
 #include &lt;math.h&gt;
 #include &lt;poll.h&gt;
 #include &lt;signal.h&gt;
+#include &lt;stdbool.h&gt;
 #include &lt;stdint.h&gt;
 #include &lt;stdio.h&gt;
 #include &lt;stdlib.h&gt;
 #include &lt;string.h&gt;
 #include &lt;sys/ioctl.h&gt;
 #include &lt;sys/stat.h&gt;
+#include &lt;sys/sysmacros.h&gt;
 #include &lt;sys/types.h&gt;
-#include &lt;unistd.h&gt;
 #include &lt;termios.h&gt;
-#include &lt;sys/sysmacros.h&gt;
-#include &lt;stdbool.h&gt;
+#include &lt;unistd.h&gt;
 
 #include &quot;igt_core.h&quot;
 #include &quot;igt_drm_clients.h&quot;
 #include &quot;igt_drm_fdinfo.h&quot;
+#include &quot;igt_perf.h&quot;
 #include &quot;igt_profiling.h&quot;
-#include &quot;drmtest.h&quot;
+#include &quot;xe_gputop.h&quot;
+#include &quot;xe/xe_query.h&quot;
+
+/**
+ * Supported Drivers
+ *
+ * Adhere to the following requirements when implementing support for the
+ * new driver:
+ * @drivers: Update drivers[] with driver string.
+ * @sizeof_gputop_obj: Update this function as per new driver support included.
+ * @operations: Update the respective operations of the new driver:
+ * gputop_init,
+ * discover_engines,
+ * pmu_init,
+ * pmu_sample,
+ * print_engines,
+ * clean_up
+ * @per_driver_contexts: Update per_driver_contexts[] array of type &quot;struct gputop_driver&quot; with the
+ * initial values.
+ */
+static const char * const drivers[] = {
+	&quot;xe&quot;,
+    /* Keep the last one as NULL */
+	NULL
+};
+
+static size_t sizeof_gputop_obj(int driver_num)
+{
+	switch (driver_num) {
+	case 0:
+		return sizeof(struct xe_gputop);
+	default:
+		fprintf(stderr,
+			&quot;Driver number does not exist.\n&quot;);
+		exit(EXIT_FAILURE);
+	}
+}
+
+/**
+ * Supported operations on driver instances. Update the ops[] array for
+ * each individual driver specific function. Maintain the sequence as per
+ * drivers[] array.
+ */
+struct device_operations ops[] = {
+	{
+		xe_gputop_init,
+		xe_populate_engines,
+		xe_pmu_init,
+		xe_pmu_sample,
+		xe_print_engines,
+		xe_clean_up
+	}
+};
+
+/*
+ * per_driver_contexts[] array of type struct gputop_driver which keeps track of the devices
+ * and related info discovered per driver.
+ */
+struct gputop_driver per_driver_contexts[] = {
+	{false, 0, NULL}
+};
 
 enum utilization_type {
 	UTILIZATION_TYPE_ENGINE_TIME,
 	UTILIZATION_TYPE_TOTAL_CYCLES,
 };
 
-static const char *bars[] = { &quot; &quot;, &quot;▏&quot;, &quot;▎&quot;, &quot;▍&quot;, &quot;▌&quot;, &quot;▋&quot;, &quot;▊&quot;, &quot;▉&quot;, &quot;█&quot; };
-
-#define ANSI_HEADER &quot;\033[7m&quot;
-#define ANSI_RESET &quot;\033[0m&quot;
-
-static void n_spaces(const unsigned int n)
+static void gputop_clean_up(void)
 {
-	unsigned int i;
-
-	for (i = 0; i &lt; n; i++)
-		putchar(' ');
+	for (int i = 0; drivers[i]; i++) {
+		ops[i].clean_up(per_driver_contexts[i].instances, per_driver_contexts[i].len);
+		free(per_driver_contexts[i].instances);
+		per_driver_contexts[i].device_present = false;
+		per_driver_contexts[i].len = 0;
+	}
 }
 
-static void print_percentage_bar(double percent, int max_len)
+static int find_driver(struct igt_device_card *card)
 {
-	int bar_len, i, len = max_len - 1;
-	const int w = 8;
-
-	len -= printf(&quot;|%5.1f%% &quot;, percent);
-
-	/* no space left for bars, do what we can */
-	if (len &lt; 0)
-		len = 0;
-
-	bar_len = ceil(w * percent * len / 100.0);
-	if (bar_len &gt; w * len)
-		bar_len = w * len;
+	for (int i = 0; drivers[i]; i++) {
+		if (strcmp(drivers[i], card-&gt;driver) == 0)
+			return i;
+	}
+	return -1;
+}
 
-	for (i = bar_len; i &gt;= w; i -= w)
-		printf(&quot;%s&quot;, bars[w]);
-	if (i)
-		printf(&quot;%s&quot;, bars[i]);
+static int populate_device_instances(const char *filter)
+{
+	struct igt_device_card *cards = NULL;
+	struct igt_device_card *card_inplace = NULL;
+	struct gputop_driver *driver_entry =  NULL;
+	int driver_no;
+	int count, final_count = 0;
+
+	count = igt_device_card_match_all(filter, &amp;cards);
+	for (int j = 0; j &lt; count; j++) {
+		if (strcmp(cards[j].subsystem, &quot;pci&quot;) != 0)
+			continue;
 
-	len -= (bar_len + (w - 1)) / w;
-	n_spaces(len);
+		driver_no = find_driver(&amp;cards[j]);
+		if (driver_no &lt; 0)
+			continue;
 
-	putchar('|');
+		driver_entry = &amp;per_driver_contexts[driver_no];
+		if (!driver_entry-&gt;device_present)
+			driver_entry-&gt;device_present = true;
+		driver_entry-&gt;len++;
+		driver_entry-&gt;instances = realloc(driver_entry-&gt;instances,
+						  driver_entry-&gt;len * sizeof_gputop_obj(driver_no));
+		if (!driver_entry-&gt;instances) {
+			fprintf(stderr,
+				&quot;Device instance realloc failed (%s)\n&quot;,
+				strerror(errno));
+			exit(EXIT_FAILURE);
+		}
+		card_inplace = (struct igt_device_card *)
+				calloc(1, sizeof(struct igt_device_card));
+		memcpy(card_inplace, &amp;cards[j], sizeof(struct igt_device_card));
+		ops[driver_no].gputop_init(driver_entry-&gt;instances, (driver_entry-&gt;len - 1),
+			card_inplace);
+		final_count++;
+	}
+	if (count)
+		free(cards);
+	return final_count;
 }
 
 static int
@@ -333,6 +415,7 @@ static void clrscr(void)
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
+	char *device;
 };
 
 static void help(char *full_path)
@@ -350,16 +433,18 @@ static void help(char *full_path)
 	       &quot;\t-h, --help                show this help\n&quot;
 	       &quot;\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n&quot;
 	       &quot;\t-n, --iterations =NUMBER  number of executions\n&quot;
+	       &quot;\t-D, --device              Device filter\n&quot;
 	       , short_program_name);
 }
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 {
-	static const char cmdopts_s[] = &quot;hn:d:&quot;;
+	static const char cmdopts_s[] = &quot;hn:d:D:&quot;;
 	static const struct option cmdopts[] = {
 	       {&quot;help&quot;, no_argument, 0, 'h'},
 	       {&quot;delay&quot;, required_argument, 0, 'd'},
 	       {&quot;iterations&quot;, required_argument, 0, 'n'},
+	       {&quot;device&quot;, required_argument, 0, 'D'},
 	       { }
 	};
 
@@ -367,6 +452,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	memset(args, 0, sizeof(*args));
 	args-&gt;n_iter = -1;
 	args-&gt;delay_usec = 2 * USEC_PER_SEC;
+	args-&gt;device = NULL;
 
 	for (;;) {
 		int c, idx = 0;
@@ -390,6 +476,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 				return -1;
 			}
 			break;
+		case 'D':
+			args-&gt;device = optarg;
+			break;
 		case 'h':
 			help(argv[0]);
 			return 0;
@@ -417,9 +506,12 @@ int main(int argc, char **argv)
 	struct igt_profiled_device *profiled_devices = NULL;
 	struct igt_drm_clients *clients = NULL;
 	int con_w = -1, con_h = -1;
+	bool is_root;
 	int ret;
 	long n;
 
+	is_root = (geteuid() == 0);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Note that this is not required when a user is in a group.
Better way is to just try to open a file and only when it fails
act accordingly.</pre>
    </blockquote>
    This is just a boolean variable which stores if it is running as
    root or non root. Rest it does the same way as you mentioned, when
    it fails.
    <blockquote type="cite" cite="mid:20251212214122.uzu2gcvuj23ejfyz@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
 	ret = parse_args(argc, argv, &amp;args);
 	if (ret &lt; 0)
 		return EXIT_FAILURE;
@@ -429,6 +521,92 @@ int main(int argc, char **argv)
 	n = args.n_iter;
 	period_us = args.delay_usec;
 
+	if (!populate_device_instances(args.device ? args.device
+				       : &quot;device:subsystem=pci,card=all&quot;) &amp;&amp;
+				       geteuid()) {
+		printf(&quot;\n&quot; ANSI_HEADER &quot;Run with root &quot;
+		       &quot;privileges for GPU client &quot;
+		       &quot;busyness.\n&quot; ANSI_RESET &quot;\n&quot;);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So you still need a root, as I said it is a regression.</pre>
    </blockquote>
    <p>Could you please clarify with which functionality or tool
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>&nbsp;this is compared to as a regression?<br>
      By the way, PMU is not accessible without root or setting the
      capability.</p>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style></p>
    <blockquote type="cite" cite="mid:20251212214122.uzu2gcvuj23ejfyz@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">
Imho looks like you want to create a new tool ngputop.</pre>
    </blockquote>
    <p>Why not GPUTOP ?</p>
    <p>Thanks,<br>
      Soham.</p>
    <blockquote type="cite" cite="mid:20251212214122.uzu2gcvuj23ejfyz@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">
You could create it in tools/ngputop.src/ &lt;- most source files here
and link into executable tools/ngputop

In a new tool you could require to have a root or group or caps.

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		gputop_clean_up();
+		exit(1);
+	}
+
+	for (int i = 0; drivers[i]; i++) {
+		if (!per_driver_contexts[i].device_present)
+			continue;
+
+		for (int j = 0; j &lt; per_driver_contexts[i].len; j++) {
+			if (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
+				fprintf(stderr,
+					&quot;Failed to initialize engines! (%s)\n&quot;,
+					strerror(errno));
+					gputop_clean_up();
+				return EXIT_FAILURE;
+			}
+			ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
+
+			if (ret) {
+				if (errno == EACCES &amp;&amp; !is_root) {
+					fprintf(stderr,
+						&quot;\n&quot;
+						&quot;When running as a normal user, &quot;
+						&quot;CAP_PERFMON or perf_event_paranoid\n&quot;
+						&quot;is required to access performance &quot;
+						&quot;monitoring.\n&quot;
+						&quot;\n&quot;
+						ANSI_HEADER &quot;Through CAP_PERFMON &quot;
+						&quot;capability&quot;
+						ANSI_RESET &quot;\n&quot;
+						&quot;cd /path/to/igt-gpu-tools/\n&quot;
+						&quot;sudo setcap cap_perfmon=+ep $(pwd)/&quot;
+						&quot;build/tools/gputop/gputop\n&quot;
+						&quot;sudo sh -c \&quot;echo $(pwd)/build/lib &gt;&quot;
+						&quot; /etc/ld.so.conf.d/lib-igt.conf\&quot;\n&quot;
+						&quot;sudo ldconfig\n&quot;
+						ANSI_HEADER &quot;Revert:&quot; ANSI_RESET &quot;\n&quot;
+						&quot;sudo setcap cap_perfmon=-ep $(pwd)/&quot;
+						&quot;build/tools/gputop/gputop\n&quot;
+						&quot;sudo rm /etc/ld.so.conf.d/lib-igt.conf\n&quot;
+						&quot;sudo ldconfig\n&quot;
+						&quot;\n&quot;
+						ANSI_HEADER &quot;Through perf_event_paranoid&quot;
+						&quot; (system-wide policy)&quot;
+						ANSI_RESET &quot;\n&quot;
+						&quot;# Save current value\n&quot;
+						&quot;orig_val=$(sysctl -n &quot;
+						&quot;kernel.perf_event_paranoid)\n&quot;
+						&quot;# Allow non-root perf usage\n&quot;
+						&quot;sudo sysctl -w kernel.perf_event_paranoid=-1\n&quot;
+						ANSI_HEADER &quot;Revert:&quot; ANSI_RESET &quot;\n&quot;
+						&quot;sudo sysctl -w kernel.&quot;
+						&quot;perf_event_paranoid=$orig_val\n&quot;
+						&quot;\n&quot;
+						&quot;For details, see 'Perf events and &quot;
+						&quot;tool security':\n&quot;
+						<a class="moz-txt-link-rfc2396E" href="https://www.kernel.org/doc/html/">&quot;https://www.kernel.org/doc/html/&quot;</a>
+						&quot;latest/admin-guide/perf-security.html\n&quot;);
+					igt_devices_free();
+					gputop_clean_up();
+					return EXIT_SUCCESS;
+				} else {
+					fprintf(stderr,
+						&quot;Failed to initialize PMU! (%s)\n&quot;,
+						strerror(errno));
+					igt_devices_free();
+					gputop_clean_up();
+					return EXIT_FAILURE;
+				}
+			}
+		}
+	}
+
+	for (int i = 0; drivers[i]; i++) {
+		for (int j = 0;
+		     per_driver_contexts[i].device_present &amp;&amp; j &lt; per_driver_contexts[i].len;
+		     j++)
+			ops[i].pmu_sample(per_driver_contexts[i].instances, j);
+	}
+
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
 		exit(1);
@@ -449,22 +627,47 @@ int main(int argc, char **argv)
 
 	while ((n != 0) &amp;&amp; !stop_top) {
 		struct igt_drm_client *c, *prevc = NULL;
-		int i, engine_w = 0, lines = 0;
+		int k, engine_w = 0, lines = 0;
 
 		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
+
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0;
+			     per_driver_contexts[i].device_present &amp;&amp;
+			     j &lt; per_driver_contexts[i].len;
+			     j++)
+				ops[i].pmu_sample(per_driver_contexts[i].instances, j);
+		}
+
 		igt_drm_clients_sort(clients, client_cmp);
 
 		update_console_size(&amp;con_w, &amp;con_h);
 		clrscr();
 
+		for (int i = 0; drivers[i]; i++) {
+			for (int j = 0;
+			     per_driver_contexts[i].device_present &amp;&amp;
+			     j &lt; per_driver_contexts[i].len;
+			     j++) {
+				lines = ops[i].print_engines(per_driver_contexts[i].instances, j,
+							 lines, con_w, con_h);
+			}
+		}
+
 		if (!clients-&gt;num_clients) {
-			const char *msg = &quot; (No GPU clients yet. Start workload to see stats)&quot;;
+			const char *msg;
+
+			if (is_root)
+				msg = &quot; (No GPU clients yet. Start workload to see stats)&quot;;
+			else
+				msg = &quot; (GPU client busyness is only available with root&quot;
+				&quot; privileges)&quot;;
 
 			printf(ANSI_HEADER &quot;%-*s&quot; ANSI_RESET &quot;\n&quot;,
 			       (int)(con_w - strlen(msg) - 1), msg);
 		}
 
-		igt_for_each_drm_client(clients, c, i) {
+		igt_for_each_drm_client(clients, c, k) {
 			assert(c-&gt;status != IGT_DRM_CLIENT_PROBE);
 			if (c-&gt;status != IGT_DRM_CLIENT_ALIVE)
 				break; /* Active clients are first in the array. */
@@ -488,11 +691,11 @@ int main(int argc, char **argv)
 	}
 
 	igt_drm_clients_free(clients);
+	gputop_clean_up();
 
 	if (profiled_devices != NULL) {
 		igt_devices_configure_profiling(profiled_devices, false);
 		igt_devices_free_profiling(profiled_devices);
 	}
-
 	return 0;
 }
diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
new file mode 100644
index 000000000..4766d8496
--- /dev/null
+++ b/tools/gputop/meson.build
@@ -0,0 +1,6 @@
+gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
+executable('gputop', sources : gputop_src,
+           install : true,
+           install_rpath : bindir_rpathdir,
+           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
+	   install: true)
diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..99a732942 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -70,11 +70,6 @@ if libudev.found()
 		   install : true)
 endif
 
-executable('gputop', 'gputop.c',
-           install : true,
-           install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
-
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
 	   dependencies : tool_deps,
@@ -123,3 +118,4 @@ endif
 subdir('i915-perf')
 subdir('xe-perf')
 subdir('null_state_gen')
+subdir('gputop')
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------3vUiLbcwDAUMkb5y474VJZcv--
