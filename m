Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E97EEA84B
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 19:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902F910E296;
	Thu, 12 Feb 2026 19:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOO/7rOd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE7A10E296
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 19:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770926040; x=1802462040;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ywmym7t/7+KGl4PFEX4uZrviwQm8SPK+Ww1/O+xKqIE=;
 b=QOO/7rOdFcdMKY6HSRa1cdRm4m3U6nfKJSSeJ2ZZ4NDhuR/WiVsxqL6e
 AGpXC2VwLQdfxD4V2Vef9Z0RH9Uti2kFRH0/cKLL0Wn9WxRedu0CZEjnJ
 p46UbrEfrzu6TEd1AvoB82YrTqvdhPEeuk58bZSsyngN87M6SzjChIOwS
 y/h2YnHeJVjXuhzjvYhrmYqXjePKwI5x3Y+oXLr0kvFPkpkNaLl762N8c
 X6Q8MH2I5jfqdLK7+34JLlO25XItbiLyFmX1sH1xzZZcKIK7mqd6cl+J1
 Pt/5e7bagui/LRbjTpqTCdfh3OpxAN+AleQAr3+/17IV5/e1fqaRWwm9/ g==;
X-CSE-ConnectionGUID: W6WJqFRoRVCMGsAMej1Q0A==
X-CSE-MsgGUID: n3oyrDsYR/eVFmXMJOL5Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72014600"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72014600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 11:54:00 -0800
X-CSE-ConnectionGUID: NUTtmGqLSC283GPJuLjFNA==
X-CSE-MsgGUID: kIGvICaKS8uYPLU2erXrow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="211929136"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 11:53:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 11:53:59 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 11:53:59 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 11:53:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kicrqdKJXSGif5RL7NLxmy1KWDqqQA4DXzN0D9wty1WD+jMmUq7f0+OqLEPof9zwlfHzxrqA1icPOkbZ9Y+BzB+lGWLgnPFpri63wmZcz5qT8FcGaumHjczglk+k7H7WxYi5zUnVkJ7RXf8Xf38Uueh1XnEhjoYHAf8mV2Nh2blcekRn5QqQ5RMMM5b1HQV7kZVgSUDpb+X4iBXx/x4VcFobluTm8KGRYCew8lGNj4xmoYuNg/twNWY9AxPadeY+eSE1xQOG16FdqolfudXe0I1QqlFcuFbiE6M355/PK+pubVKP765Cy+QIf+3Et7lSw6FT+rYQ5XJ0KUgfO2z9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBZcpv/QN/o6uDcGj4NJWpQiE9DILmKiMXLsKbdmtLM=;
 b=t/TnysubJgekaydh+9lpTAapXmyIlOhNIKxFBfV2jUuNSnJXar0NFCa2uIzf4wKvh2Bky/0J2T9Z313XbkHL35jADrNq+WaJztfg44ixrERyuJfOkDbgaSAOUDY00Q1hnFxs6BuH/V2JtHNfnOPCD/PoDpN0nlzmwpP95+fdXGikPwZ23qOMmtmRN4aFoaVCKFsbA7xE8eakp5IhnjhU8gUBwnBlYZtq0x5V45RJsY4tP31C2nDalTaW4Z6vgCZWfs+myS8oSLnOIJCWlHPe5KsarGL/eBgKHpVsx5gcTbdjGitY6iEwQG7FTrGojrli1DKso2VgnRJgeE0Rrvg5GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 19:53:54 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 19:53:54 +0000
Message-ID: <dfc99a00-1369-4575-ba50-95ed3dcf83ea@intel.com>
Date: Fri, 13 Feb 2026 01:23:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 0/4] kms_flip: limit number of subtests run
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Mohammed Thasleem <mohammed.thasleem@intel.com>
References: <20260212111023.189261-1-michal.grzelak@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260212111023.189261-1-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::8) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: b88dac88-147b-4775-0b2f-08de6a707384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d21YS3JXa1NJaG5rU0cyVmN1b2hRelNhQ1ZhVDNhVUoyREkrak43bStJRU5C?=
 =?utf-8?B?aTR6bHQyM3hLNEs3NmYvdFFWKzNNS1JTTTVlSFFEbW1JV3RTbFczd3B6Mm5N?=
 =?utf-8?B?djMzUlpUMVRKT0J3bUlSUE4vL0dJVTh0UHljaVVQMDkwR3FIWkQvdWRZSDIx?=
 =?utf-8?B?RFV5TFZBblNzaTRkSi9rdzZlYTdTRUhGTzZ6ZmczcW5zQS9ybkpBNW5zTitj?=
 =?utf-8?B?SnROTkVtZXhmV3JwbnRKdkFXN0xRd0QvcHRzNTNxdmFLcDhDQ1dBQXVTRTA4?=
 =?utf-8?B?MGFEVnVFc01TVE53R3BMWjErVEtSeTdiV1dzN2ZOaHpkVzRpVTVHQmdOaG5E?=
 =?utf-8?B?UythUVRKZWZWa0xQNnI0OWkvTlFqb0s3TEFsVG9wQm15Znk5aUNCN0J4UFhR?=
 =?utf-8?B?aitzZVFsTlZVaDh2MWRMU3dLODcyQjNMVTZiaE41d1pMVGxYeFNiOXFIY1Z4?=
 =?utf-8?B?MEo3ZFVBaXRPZEhOTlVsTUVVZGNSK0lUNWIyRURHSjE2WkhyZUoyZiszTkk2?=
 =?utf-8?B?cGEraUZGWjZjZXNCZEFZNG5YYXZtSjN4TW1Ba0VZbHhET2UrMUlBNG1BajNp?=
 =?utf-8?B?UmJmb2xNSzBKL1ZIL09EaWliclVQS3hXUVhHUnRDOFN5dWdtTGhiTTJZc3hn?=
 =?utf-8?B?Y3pLbTA2eGRUaW9GcENucXhCcGd0TExrbHhiYjJUTHJpU3lvQkc2Sk9XaEtZ?=
 =?utf-8?B?bFc2b0JYcDhzNzVXZFZQZnJscmNwUGlZL2RCMUdkWHF3cHRlRjFncEZSd3JR?=
 =?utf-8?B?K0dMRUR1UXRLRUNZQWppWlhsMncxOTF3MmFVNHdOTXlGbWJjYkhXY2ZISDVa?=
 =?utf-8?B?akhIQitWVVhIZ1ppOWhPMmxqRngxeUJNdkcvR0IzejBoYWRsREgvL2JQbXJU?=
 =?utf-8?B?V0l6QWlPQkF1RnNVN3BSTGJZL1RHVHZ6SmxMUWNuM1ltelBGbXJsVzJKVWRC?=
 =?utf-8?B?dTAyaW8wOWV0UkptTEUwb3RyTUlaWU90Vy9RRzlaZFZYUk1PMDFzd21aVHlp?=
 =?utf-8?B?OXFpbTdHbnZhMkdnbFg5L01FV0s4QWpyOGJlbXlGb0MvQ052RkErTFk1SHlD?=
 =?utf-8?B?U3dhNmNmN2lBVTR1bGQvL3JFR2FSaTF3bXRDTjFsSWtyQjhRSWVzQ3VCeDNu?=
 =?utf-8?B?VXc2YWtGbWtPaGNhREZrVXZxL1JvcEJTYzJvdDczM3JxWlFuK3gwM3dmNnIx?=
 =?utf-8?B?dm91VWp2dm5RdkF4dmRtcTNXMmVhcTUzQ2s1cnc2SUJtTDlTK2d0ZXZxSmNh?=
 =?utf-8?B?bUYzMERvUS9FRm4vVXFudG9VNVl6djc1VDJKU29jbm81V0xZRUVjSktkRllI?=
 =?utf-8?B?bU41RzFaYXpjM2lHR1JNYkFEYmFhL3h5ZFkxM1NnVStMUmdhUFV4S0FPL1RI?=
 =?utf-8?B?aUt0REhmN3NZamQwN3BRYlp5MU9ud2FKaTVIbEZIWjdoVVB6ZTlsNkNNaDV1?=
 =?utf-8?B?MlV5MWVIaEZ2NFAxZUx4bmxNdW91UEtnNzRRRlJiRGFvYS9mcUMyK3NXTGRQ?=
 =?utf-8?B?VnBhcjExdUx4N0N3eFhxeWRJdXZ2RDV4SWdLb3NRNzlqTmZaZE1kM2lDUktP?=
 =?utf-8?B?QkF1a0VFdHU5aXhZeUtyMEMzVmdMWWtxNEVQNnJmMW5nNjYyT3J5dzdXb1JH?=
 =?utf-8?B?aGVTdFZoN1hrVDdMNCtWc2xJUGY2L0xTdFMyOWYvajBDc1o3SEtEQVdZWWtG?=
 =?utf-8?B?V1BNQUo5czVqaFFCcXY4WFpiSU4xY0xUS0xTK0R4T0J1cVFXeFppRlB5ckk1?=
 =?utf-8?B?dUNrTk1BcUdMaU1GYUl1T1NkU2hSanRabFRPR0R2QjM4eUdmcml2OFdBTGpF?=
 =?utf-8?B?WDhROGtQTk9xSEdsR3lSTDhScXRDa2JXTEtEblVDMjlkNERjSXZoQi8yQURH?=
 =?utf-8?B?UGcyN3FmYTNJZkR1MEcxRE0vOHUxN0ErN1RkdE13VXM3bHMwRUtPby9Rbmsw?=
 =?utf-8?B?NWpOMnNRSlFMTkU2eC9KWHJLaGR4VG0zeDFFdDJlcDZvMlFFQWVIdVZCa1Bw?=
 =?utf-8?B?UFB1TCtyZjRVVWFLMllWVUdqM3dqZzE0aHJiUWZBUy8wc1cxQUp1YzF2U2M3?=
 =?utf-8?B?LzM5STZFYzJRK2htK1p4OTl2RFNrTm55Q2M0aUNDQzFMT1NDSHA5Z3dFR3R1?=
 =?utf-8?Q?fu+nUKQXpcQdKLN2up4r9B5HL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXRzMDRhQmwyc08rdEdLcFk5QmdtaHhCYVB5TjFCNThlcDVaam1WUVV4NUJZ?=
 =?utf-8?B?UnFrcExqK3N4a29qamNuN2ZValk4UHFTeTFTSmErZDlSSGN6bFdWMEdCak1s?=
 =?utf-8?B?ckFuRVZUM0Fjd296VkUrOFdMSlQrc1pMQmpTaUJTWVlDQk1kcDc3aWlvZFU5?=
 =?utf-8?B?R2FUOVY1c2l6QmdlN2dOek04MUNwSmg0MzdSaEVXQ0xlSHRsNWlDV1NSYlBx?=
 =?utf-8?B?c3JTVitLc2lnSDVLSzhORUl1U0dKT0Rkc09VQUxRc25YSm5xUjFiaXBMNUdi?=
 =?utf-8?B?ZnBrbzZQWXdjcC8vWmxnSHU2ZTVGVTZtdkhZNDU1dnY2UmJqKzRrRlNsUWN4?=
 =?utf-8?B?NG9VRFh5RWRuT1EzWVYxbkllcG5ZZzZkUjcvb2lGaWdVOStHdnJDVkV4d0oy?=
 =?utf-8?B?cUNCaDg3ZE42dGhpSFF5QlhSVTg3V2t6S3dGcjN0SThiWjhZSzY0emVhREhS?=
 =?utf-8?B?ZVVZQ2FjQ0dxd3BxZGpKM0plR1hrRnBVSmJMS254d3VtMFpaWHRwQjQ4c09C?=
 =?utf-8?B?emxERXRuRG43T0I1TnFlVDZ2RlBzZENYZFZnNEhITUJnbGxva0wrR0Q0U01t?=
 =?utf-8?B?SittUnpRamJVNTV0Ukt6cEdFdHU4L28zNTNFKzNjZzNTclFqTkswZis5NFhz?=
 =?utf-8?B?c2hpY29hL0doaVZsQXVIYjFHRFRjWG1sQ3orTDJxbk95SjZUSWFDYzAxRVpH?=
 =?utf-8?B?TVBkWGRYdG5hd1p4N3RXc25vYWV4MjJjanJreFJ2NEgrUy9ZUzZISTNSb2Vv?=
 =?utf-8?B?ZVNJbVd3eWk1enVCdnVzTldYOGpkSFlHSnIrUHd3eFN4MXFMYmxxMk5aU1l1?=
 =?utf-8?B?VTN2RklZYmtpK0J3eGI5L25UUEQ2MzJnNmxVWTEwNlJiUDZHNm1YaVczRWpB?=
 =?utf-8?B?KzBocDIyUzBDb0dSVGNSaG1GbHQ0YjJjTmZXWU5yOG9NSUlRSERVSWxtVVRm?=
 =?utf-8?B?b2VkeDlqdm5lbGdydThCR1YxdE0wRHNUZlFRc1ppZkRzcnlFTUNrb2FsWW9T?=
 =?utf-8?B?Rm5hRVcrZFBsZVI3eW5KdDNmV0ROY0RJem9WY3VPUkluc1kwRWlPYWxMTmRo?=
 =?utf-8?B?N2NnUFBMSnVDamJxVjJvUlBUWEVUMzdsMnVHZ3YrSmpuV2d5TUJwMEI1NDdM?=
 =?utf-8?B?b0xYTC9ITzZnOG82Z3JkUmFHWnV4aU9NL2kvY0hBNUFnQWZyOE5Ta3IxN2lO?=
 =?utf-8?B?QXMrNXFXR3AxVDdyUUJPWUV3bHMzc0NqYWh0ZU5wT3lxd3gyL0dYVVZmTGd4?=
 =?utf-8?B?a3ltYU9BZHYyZzZOR1BuQ0NEejRENExPWVJ4aUV0b0tWNzJsaVo4WmFGZmRT?=
 =?utf-8?B?enFxOXEzaGluTHh5MmV3RmZyNkVhWDBFamIwOGFXaHRJcEdRemhVbmhoNFNs?=
 =?utf-8?B?V1RkQXFVL3ZWeUx6RXZRSkRzOHB6WlNBOVVwWTJ1NW8yZktyaSt2dXJCZTA0?=
 =?utf-8?B?SHdYUFR1SmdSYS9PaUZOYStVYnBlSjB1Nmp1Vm4ySjV3bEdXRmJFNWlDV25t?=
 =?utf-8?B?ZWVpY2Irbk9DbldUZTVPTTdTc0hjSHk1YXVRcW83bzNuc1cyTWdZYXRaUXkr?=
 =?utf-8?B?NmUydnFpYnpmS2ZZTVdkZm5hVEdvM24vWEFuQitvVXllWnRZTTk5WlQwVmlp?=
 =?utf-8?B?OG1jZVBsemlPUTluNXN6TVhjUW93MUZERjgxSG1rdjlwYWl0QjFOMS9IWkt2?=
 =?utf-8?B?QnJ2OURZbFJxR1BsbGlxL2RyMTBPVlFtUlFOa01ib2RsbVNXUlZUTWVwY2Fi?=
 =?utf-8?B?bEtIRC9qYVVQd1p6WS9YRlJnREF3OFVtbTkzdGo1cEFwL0FZMllnTFlKZDBS?=
 =?utf-8?B?MVlNL2JlempocHNNV0wwWjVISWdlZkNpRUYwOUdzUEhvNW1PbnVpTjBCM1N5?=
 =?utf-8?B?TmtxUFh6N01QMkJ3dVdTOStCUTJoRkxrUEFMYXA3TFJPRi9WMHVXa0ViSVlh?=
 =?utf-8?B?cEgwbEF4S25WNlEzYUgzeWZ6ZWVQWTg3YjFvT3NKQzFuSGJrRlJ3V2VhdFFj?=
 =?utf-8?B?NnNqMFNwQlkwcTZuUmlLY0kxWDJPVkZpdFdDWE9CeG1PYmJWaitLLzZBdlFL?=
 =?utf-8?B?SlA1MVJsVXR2eWdvVVFST3BHZisxaXR3Q2ErTzhtT1F5WWR3RWZSeDdjb1J0?=
 =?utf-8?B?TGxaZUVkdExURTJ6WXJTZnAzRnAvU21vd0c3b2EzN2ZhZlNrdUQraGZGQkc5?=
 =?utf-8?B?QkVmcmJGdkVsU2YxN0N5a0VQakgwZWJSc3dxRi9JQm1OSThhcFRZMzN2UkQ5?=
 =?utf-8?B?TmlhcXJJWkpWM1NHRXZoUGt5SG0rNzBITmxWUGhSb2ZvTTZmWEs5SUZuL04y?=
 =?utf-8?B?dHFQVUNSc0VMdFNMTE1wMGYrTkJHbFpnWGRJY3A1cjNIK0J1MDBsdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b88dac88-147b-4775-0b2f-08de6a707384
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 19:53:54.6161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLsOxaosWMpbHp2cmwYz3eGH6F4eVJg4i1chmgRzRfHEoTuzmW+DbKOjUeiRK060NvSIfKBdHxYWZRh9X2iBUQ==
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

Hi Michal,

There seems to be build failure with your patches, can you please float 
new rev?

On 12-02-2026 04:40 pm, Michał Grzelak wrote:
> Next version of [1]. This series addresses both 2x-* and single output
> tests. This series has been tested on config with 4 outputs connected.
>
> [1] https://lore.kernel.org/igt-dev/20260210225546.153728-1-michal.grzelak@intel.com
>
> BR,
> Michał
>
> ---
> Changelog:
> v3->v4
> - change \gt into \ge sign
>
> v2->v3
> - ease counting of pairs of outputs
> - limit number of tested outputs
> - narrow pair & output limiting to suspend subtests
> - add separate param for pair and connector limiting
>
> v1->v2
> - split pipe limiting into 2x- and single subtests
> - add output pair limiting
>
>
>
> Michał Grzelak (4):
>    tests/kms_flip: test suspend on one pair of pipes
>    tests/kms_flip: run suspend tests on one pipe per output
>    tests/kms_flip: limit output pairs when testing suspend
>    tests/kms_flip: limit number of outputs wrt suspend
>
>   tests/kms_flip.c | 74 +++++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 61 insertions(+), 13 deletions(-)
>
