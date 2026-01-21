Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7890DD262B1
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 02:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A7D10E684;
	Wed, 21 Jan 2026 02:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HA8UEA7I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D239B10E684
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 02:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768962626; x=1800498626;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=R7/UNLAUhiyNjjmbDlq0uwuRoSnQWymC9nLl5+9bri4=;
 b=HA8UEA7Ibf++kSR/qBEBQjwrG7M45yd/QcIHc5Sziat+t1LYjoi/HifQ
 q1xTq8EIIbC9L7/6yVweHONl9o6aNL5KVd2bUArRd703iJAqebTxrKuoF
 VH5TGOYyLfEUwV907vU7SuiLImTe0xBRZ7f3Vj801zlo6PWLToRVbjXXA
 5SLKQlyep/7UoGw7uq3p5azCdUq1kHR/m2PmY9qWLCABP91i1XUSDI92y
 bk6YIyx3z5T7fMPeWr+Ft95CUWjubLCBV5nW6cYW4iQ8QveGI0/7yDx1o
 rr9wxuz7jb2Oe+glKJeUpHy8BBXNduNeOLt00Z+AP2UTMXpMln3FQ+K/7 A==;
X-CSE-ConnectionGUID: P59NIaBBQTC9MFyj3vGc1w==
X-CSE-MsgGUID: 4476DZxYTxqP5vs6vq/A3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70276324"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70276324"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:30:25 -0800
X-CSE-ConnectionGUID: nBpe92oxSceMyunyO2IyNw==
X-CSE-MsgGUID: SPaDPoldSp2T7rtzbk+GcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="205930185"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:30:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:30:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 18:30:22 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:30:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ti9fdUO/Du8xmcvEC+TjYNWOqSKs5IvnYfYLImIydCrQ/jgkZ37FPI21PTSek7nhWcentlf6aN4mVARriJqoMiU+gtJl3YbCm29rVjjNixmojaLDbsl1DGrfK2BzpddSMCy6WnNaz/8T0xe52us/+/FoWLH1mqK0OPpohQorzagwQI2MBq5202NF1+0EHHinWoeR4C3hSHCGYriiIBwt5r4JaqhqEflfp5XpQkaWW6D7ZaJKYbCgU3fRwgGwkJJSgNDtWt6mZnvxxRNvhY1+4+SydLkrosCbpZQ8LrAVkgLH8mT7mQ9ovjbF3OajpKVH2GbAt+2zDBORIi/7KdjURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EO9PSFhsHW3OkBgiHBOgIDSSBdrmqRw2FROk4oGs2o=;
 b=vI3bwgdGLGUnVO6SpymS92fYjiSZLohlHzENiEiSBWingQCibfFgppJQvxS4V/pXczqBDazuaKckk7A4yeMVo5Gm9DnQtUGD/sNSTk3osOZc6toRFa0gSWDC3YYOLQy24DxX0f9Ndgtj+XTiMmMaujmD4Z648LnIsOfzrrBaenYjLcW7kPwBgtyPxvupLrcV6HNFTof7MTxSpIYRuy3Ou9tY39xVbe5/lMS5LknNJLFpPDRmUV/v1SkWuPRFaZ17Fc+3WQZz0WWxBx7EyykqX1p2N6xs6WL62rqiIqRBt+i5PpR6PvuvLgziHRrtafEzjMFECOUu50fxv57tJw/2Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ2PR11MB8472.namprd11.prod.outlook.com (2603:10b6:a03:574::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 02:30:15 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 02:30:14 +0000
Message-ID: <03224c43-2656-4936-93ab-2ddd03600ab3@intel.com>
Date: Wed, 21 Jan 2026 08:00:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Update argb161616f format tests in
 display blocklist
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260120092914.144780-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260120092914.144780-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ2PR11MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: e19f9658-0ca9-4f5f-428c-08de58950190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEJKejVNTUFBQXVMcTFmZjd1Tm5mNWl2UHdrVjIydzU5TkQvOHhtdmExOFlZ?=
 =?utf-8?B?QTRoUlF4djB4cDhUelhrcW5TZjdXMUxkK0l1VTduL0V2T04wS0ZhVDQ5Q1A3?=
 =?utf-8?B?SjREN3ZyR0duY24zR1QxeUdmc2JjbHo4ZDJxdnF5TlVqOGlLN1lWdlNoNjA5?=
 =?utf-8?B?d21TUVRWMVVmdGQrM1kwSG1lOE0zT25MOGhPckJGbkNYOVpCWXZSWXhmekR2?=
 =?utf-8?B?VWJqcXZaV3hYY0RndWd6MXJrZzljYzVwNktabXp0WDBNN2gxa01hNlZtSUgy?=
 =?utf-8?B?U0FGeGgrN0l3bVJma3M4bEt6WVhuYzhQYzV5UmJwTWM3Mk80RGpKaTY4YXd2?=
 =?utf-8?B?RkZ1VFZJMEpPWUhuTnFHbGJEcGtjUUg3bFFhd1VCaFJwRFRiZWE3ay95Y0Jv?=
 =?utf-8?B?SXJ2cjg4WHVlQTdrQ0p1b2VMNUhnbVdUeWtFWmE4S29FaENTbDNDNW5GK2Rt?=
 =?utf-8?B?SXpvYkhYUGZaQ1pWUVI1NXh3VkFEUlo0M2cyZElpSWl5TEpMVU1xeFBEUnl0?=
 =?utf-8?B?alplZFpXdkdEMnN6UnQ1aWt2ZGFLMUp5STJxNGxEaU0wSWt0WHJieTFJQXY4?=
 =?utf-8?B?Q3FDYXczWWxQWEpYWU5EazdaeXcrN3VTR1F0V2tSbWNYUkh0WHBSUDBTajFk?=
 =?utf-8?B?NnQwb0Q2VUFsNkRwT1dFMkZWeGx2Z1JrazBhWWJLamI0SmFKVDNsb2NsMThF?=
 =?utf-8?B?VWxtMnpvWCtUcklPRmtzcWZCWmFGeXRkUUtLYzJFS2dtYWtXbDdoY2ZVelNl?=
 =?utf-8?B?eXVFRFAzZXNOSDJEclU4MktXM3BTWDl0SEl1d1dUTU53eldVM2JNc0xVY015?=
 =?utf-8?B?bjRJb0hiTm16SzRoakN1Vlc5Q3hnaVlTNnArL0hWdGdJTnNpQ3BwUFNkUmhW?=
 =?utf-8?B?czRkZ2FSSjViN0RnSFpFMk1NT3kvbzUwQnlUWCtFaFE0SXNMczVkNk9UUGJI?=
 =?utf-8?B?SnRVVGR4Q083Qi83cGsrR3BRbS9UT2dYNWJWeWVKeWx3TE8wVHpQTklvMi9x?=
 =?utf-8?B?U0VpYUVOM2hoWHBjNUpVcWF6cExkWDZnb1RwYURBTW9jY1BabUU0R1pmWDR2?=
 =?utf-8?B?TldhSXVab2ZZcmNEdm4wZUhOOXFkWDhNbGRWbEVHU0NxTkcrRzU1akdEbHBw?=
 =?utf-8?B?cUE1Uy9KNGFHQVdrTlNuTHI1Vk1qUGY1WGdod28zVFhKK25KeHgwRCtLdDZ0?=
 =?utf-8?B?STU5OXh6LzRmb3Y0TjQyZk5lOFZFQ2ZValN0SnZ5N3RxZU1zTUtoOE9oVUJj?=
 =?utf-8?B?di9iZUxzOUlEOTYzQVVXcUF0TGNJZ3JtUkZFTlpKVVZ0M0dTRHBPQ0QxeUwy?=
 =?utf-8?B?L0IwVlFKWitZVElaMXBSQk1HQWgxSjF5b0lKVlU1UUpxcmJvZG51RHhwT0RD?=
 =?utf-8?B?Z3J6alZIZk9PSXJRR1piSGhncjhncEZKajBHZklrZWZkSGNjOExENkwrcmVT?=
 =?utf-8?B?UnErSFdEdGkwMGJRTjBuRHU0UkFxQjF4TmNlMGZkWGVObk1KMFgrWUJ6bEdP?=
 =?utf-8?B?WFFvZ2Q4bXpYTHFwOXlWT3dwamxtRHJ1N2ZoRm8vR0lyRmMxUzgrL1N2anFj?=
 =?utf-8?B?eXRkRzdUdisxZG1EbENOc293RDg3aUxtbFBuSlVaWW1nUzNFcHZpNzJnbzFy?=
 =?utf-8?B?NGZhTzhLVENHSTBNZ0dpWVRMVDRncVNyRnprTDcvR3JEMzltTUhjM2tJMUFz?=
 =?utf-8?B?cytMdHVEamdLS011dXQ4TU9Fb1RXVjlBbm5HWVBZZGdmTDh2Uk92anpkclFM?=
 =?utf-8?B?dm5vcGJCaUdQRUxNalgyUUNScWNDUjFwNTRpb1FxNGRKRUVpcXpGQUdWT2Yx?=
 =?utf-8?B?aFhYWkVDQk9JN09oUUNkMU1NQURNMkpMVkFoVCs0Vi9kdlAweDdFWGptOWcy?=
 =?utf-8?B?Wk13RzE0QTZxSE5QL093Y3Jxa3BmN0c0b2lMN1lrcExsLyt2OGRvdHcrQ0Rr?=
 =?utf-8?B?c3IyN3BoTHhsNmVpTUxoTnM1N01WR0ZnNUozYWRtNlA0c2VFN0tqN1o5U1Fx?=
 =?utf-8?B?cUlQS1NxVzJNU1lyTjZ4UHN3L0tCeEFYNmRSSGowTkEyR0NURUZQc2plcThy?=
 =?utf-8?B?M3JsM3NPbzR0dGhJUTl2RkNydmFKc1c3clJCN2N2Q3RKcXBPbGcrNEo5Zjhx?=
 =?utf-8?Q?K6VQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDRsRDIrYmRLdGl2NzdEMm1nNDJRZW9PV3JnTHNQSG9sbFFoeXV1YWpSMG0y?=
 =?utf-8?B?anJtV1R2RFhCM2pSdVRyQmtYS3N4VFdndFpKTGJnTytZSzRndW9NRXlNMlVZ?=
 =?utf-8?B?dmNGaTd5MXh1VHEwd1hoLzQ1SHUyZStMUnB6V01LdUg5RDJzZEF5b09XRC9q?=
 =?utf-8?B?OXd2Sm50K045L1dIZ2dQN0tURmZLTjNHMUcvU0pMTWFIZGh0OENTcFZ3UnEy?=
 =?utf-8?B?cmFFSVpOVWx6RmhhMy91VWJpWGg5N0VwOHF1em9vNXpuNmxreVVmSmEyUFA3?=
 =?utf-8?B?V2pGWExkM0xMbjR3ZEZIaXd2bVp5Q0JubzBFTDRHQm1XTjRBZzFJVDBpUjRH?=
 =?utf-8?B?c0kxZG4wNXhGeU93KzVKWUc5UTVYbWJsckZRQ2lHbUdHdy9WS1VaSzNZVGxh?=
 =?utf-8?B?MzRURmozZy9DMFJVaUNEdklrV2hZRXl3ZkNhbTMxM2RkNGlCQ1o2TlE2cXll?=
 =?utf-8?B?M2FzaG1iU20rTlo2S3krVndEY1NFU1JQVXNEamM2WCtkczBmNExCa08rZ3lP?=
 =?utf-8?B?THI2SEV1WU9EUXRteGFkcXplMk1RTTZQSGJ4ajBVN2J4U2ZRTXgyUk9IdXFV?=
 =?utf-8?B?bi96T2Q5S0VRTG00RjhwdGRQRE8ycEFkRWRCZnNYN2s3bTNqaU5qVkIvWXlO?=
 =?utf-8?B?VVF0YXE5d0ZMNk1XK1krcE03dFFidDhQRFAxaGVUQW9WK3psaTFOaHF5MUw5?=
 =?utf-8?B?TjFHeHI1NVZJMnFvQUEyVTVIaXF0YUJCVHVSZFlRalBlN1JEVXRwanZydVpO?=
 =?utf-8?B?K3ROam1NSVhySDY3bmdVd0w1dHc0THc5NTVhQm9taTdtWlRKSkN4ZlQyb1lU?=
 =?utf-8?B?RUs5S1BDQ1Q3R1BNV2pLMDFkS24zY0xEc2s1cW01MExaVm9zU2FQZlJpVXpz?=
 =?utf-8?B?UHdVTDdwclNZcUJSM0FvbzZHWkJpTE5TcCtFSkMvNWY2Qy9ScHVYNW5aSUl5?=
 =?utf-8?B?VEJLdHlUNU1WbzViTTR3dXVDODFaWFdHRnlsY242aCtDbzREWGJ5Z0pmVWpk?=
 =?utf-8?B?Q0lJd0dHQ3Z6VXN3NGxiQUVtSWJERHRKd3g5SzR3cVdFaURLaVRpRnZ3Qm1O?=
 =?utf-8?B?aGttT3lXdzRncUxrNW5sU1dPbk15aUpjTSt5Tno5MldXd1hDNnloSHFNTUx1?=
 =?utf-8?B?VGFscVdmNVFaK3FkbWZoUFdQeVB5SXpsNjNFS2ZyaEVUYmVsQVlRcks4MGpl?=
 =?utf-8?B?VGRWNzJmcmRhTHFrWXlOZVlBcW1VNUZLRXd1RzZxeEgwaWEwUDZJTmp5Vlg3?=
 =?utf-8?B?bFhHZzFEaUQ3bEJLUS9pTXVpRFF6N1U3d0RHeEsyeTJFR3dtMkY5Z3JXZnpJ?=
 =?utf-8?B?d3ZIMFhrMEM4aFVLR1MwdXBkU3ZEUlA1V3JmNGt3bHRpdjlNc1ZGSTJRSVpj?=
 =?utf-8?B?LzBLd1p4emU5SmZtMFlNR1N3cFhqa1pHRy8reXp3cHg4Z0ZGTldidmxmTTJH?=
 =?utf-8?B?SGlPeWtLY09zSDhLcTJKMEVUVGg1RHI0M1B6VkxMOEljUE5aTlIrU2ZwSUl3?=
 =?utf-8?B?Tnd0SzRMcjNEK213NkNHNGYrNG5GWkxyOWdZSGN5Zkd4dGRZTk5ja293Z090?=
 =?utf-8?B?T3hLeTRKLzRMR0NFTW56bGhweFFUL3VxOGxvRi9VZ0ljK09UczhCeHU2dndN?=
 =?utf-8?B?bnNwcHY0bzkvdHVuN1NpNWVBak1VaWVweEN5QStmQXlVM3c0Y1hZbG1jMkRI?=
 =?utf-8?B?UStDSGlUbmJrbEZWZXVSd3Q4L1RuSmYzaEozSDRlS2hvblk3VnU1NlZraEpt?=
 =?utf-8?B?S1RaUUZ4T2FJbzdJVlRlclNMdjI2UlpBclcrbDMxVVZlbS9hMXFhUWFBSysw?=
 =?utf-8?B?Z3gvek0wZisySnU3OFptVlpWOUpwYnJ6MS9zakl1Sy9NdGRiNXFndnFSTzg4?=
 =?utf-8?B?VzJkS1pZS29ZZmlmWm5LQ2JlMEtPa0hyVXo5L2hwelB3c3ZvSnRld3c2RG9I?=
 =?utf-8?B?THVCZDNqeHlXenlFYnQyMWdRb0I3R2FJWHo2OHRmRXkwbjlFaUhSR1V0MlVP?=
 =?utf-8?B?ZnRYVjN2RkU2QUZDZGN1dXo3eVBzSFpDZHNmYWpLVGhhZHhRbUNFQ2RVY2to?=
 =?utf-8?B?MkNWVkU1SS9yVWRXeXdlWWFSSkdySjMyNGNDT3Y1Z0E2YSsxZTU1NTYveklQ?=
 =?utf-8?B?ZGRBTkVNazZvT2owUkVoUTVXbWZjY0tkSktrR0w4V3RDcjcrYXlYK3NUVUNw?=
 =?utf-8?B?Ykg2eHJqZ0xwYjlqVm1JRUNNRE1RWDhmTVNGRG4yem5FZERoU0xkUG16U2lr?=
 =?utf-8?B?N3dnQVRUclFHMk56enVIZ01jZXZ0T3hlZ3NVaEpYcEE5bkFSTVZjZDYvTVpt?=
 =?utf-8?B?NVBmcXVOYVRFNzZCYTJjL0FoTUZkR0FmZ2w4SXJWK0p2SGkraDRPQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e19f9658-0ca9-4f5f-428c-08de58950190
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 02:30:14.6862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 780DVdV5gouH3J3/BmDY9ptF6dkVWDENEl1OdTgoEmRiiXrbz0h+23Deb1fBTuFJU0QODk4xe8Af6sLPnqtRIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8472
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


On 1/20/2026 2:59 PM, Jeevan B wrote:
> Add tests using argb161616f format, as this pixel format
> is only supported from display version 35 onwards.
>
> v2: Update subject and add test in i915 blocklist.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/i915.blocklist.txt           | 4 ++++
>   tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
>   4 files changed, 16 insertions(+)
>
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index 8b47d10cd..583df28e3 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -202,3 +202,7 @@ igt@kms_colorop@.*
>   ##################################################################
>   igt@kms_color_pipeline@plane-lut3d-green-only
>   ##################################################################
> +# Valid skip :- For display ver >= 35
> +##################################################################
> +igt@kms_frontbuffer_tracking@.*argb161616f.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 919be620d..2c0c4a0e8 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -173,3 +173,7 @@ igt@kms_pm_dc@dc5-retention-flops
>   ########################################
>   igt@kms_color_pipeline@plane-lut3d-green-only
>   ########################################
> +# Valid skip :- For display ver >= 35
> +########################################
> +igt@kms_frontbuffer_tracking@.*argb161616f.*
> +########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index 6cc61b98f..d92e12d64 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -183,3 +183,7 @@ igt@kms_pm_rpm@package-g7
>   ########################################
>   igt@kms_color_pipeline@plane-lut3d-green-only
>   ########################################
> +# Valid skip :- For display ver >= 35
> +########################################
> +igt@kms_frontbuffer_tracking@.*argb161616f.*
> +########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index a29c515b9..e9d0775e7 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -181,3 +181,7 @@ igt@kms_pm_rpm@package-g7
>   ########################################
>   igt@kms_color_pipeline@plane-lut3d-green-only
>   ########################################
> +# Valid skip :- For display ver >= 35
> +########################################
> +igt@kms_frontbuffer_tracking@.*argb161616f.*
> +########################################
