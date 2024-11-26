Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D5ED3B98C
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 13:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8A489E1A;
	Tue, 26 Nov 2024 13:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQIYPt9u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD5289E1A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 13:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732626004; x=1764162004;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b0+CeReJZuGcuYeXpAbcomWAHgQ+wmKhbMFohQO8U/U=;
 b=bQIYPt9u7T2uP3eAn08FVj8yY/tyncbgzART4lGbNM/Hj6qtQYnZkRb2
 Ag9tbPPehFBxgCIkNIhvERomPji83vKHq4aWHhGWk2IW0cWPNXJdQaa3X
 tb5NjlX5/TuKWnXzM8MdILJUuZgC9j4/K8QthbE+//4AG8vP3NePG5Psx
 PHTSYvfMUZ6iIEI7PXrhVwym2+E49xI70pMqxVoosj+KlF6t9RVZ+Lgyu
 Dk6JDz60rS4gXvWwQclE3XpjWM+coBVwk2RuK1huQ5rrX3zzNOTZLtLnx
 1W1O3JZ/3Z8MmBk4esLzRLdktCnpaSA/rgSavzRlQd5c3iD6oR9QKLhZ0 Q==;
X-CSE-ConnectionGUID: waHuOviFRFCHtnd3oF20zA==
X-CSE-MsgGUID: ijLYRfTvRGupMw/mHrMm7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="20375797"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="20375797"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:00:04 -0800
X-CSE-ConnectionGUID: SimJFjLBTV6jcdvOVJhwNw==
X-CSE-MsgGUID: D5zbW7/gSMeyDCe7P/tEpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="122589780"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 05:00:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 05:00:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 05:00:03 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 05:00:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWF1RdzA72OrZNBIc5aGiGoSYfLvNr7If7waQDnZFsfvORTRpkAmkcwJkx2s/HRHrRZtSjVvSKcVP3VAX3I+pdct8ZGFvNP/zU9DoC4KELpJASX9UeCda3an07fc7SHw8efVp9XfqrpBAeAyForbOz/ISRDvmS+q5yg2DwD7/UXIjy4G60aVvtBjONQzKPf2RwU1sLwmwZVBfmt6d6APaNEV6HA3cugyK2BYBqKnJvmCzT8nUT/pkZ9AcqOsH6ij2Yg2MDoILQzWpwUi758ul04dr2VJ4/jedGSyJsIAx2Ic2dbSE3TtMthL3+AJcoxLFZMqhND68ulKhX+sZmbvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQn9FU/xNYcVD8deLtmcntlI7LRGaTovtyyEV+ltxck=;
 b=r3wAArySUOou/pkvfwbbJjnhPOpD3qrxeWvGHDdYqOFrAHYiYCe1M7leL0Zz5RNXWLblJ7RhzmE2UZywWhdqtAxmQsr0WjYWAfiyihF7iApVz4kC4vIzjamr3XnUSPlXkNVn6mhLYeuWRv+b7F2L0OEKxYw6qTMLRp4cJOh8VWB5zcR0sYCTv/+2KOrlJJJCx40rUhrPBNZoJt8xjSCLfMT2GP85HXk4dBsUPlH/qNSkvT5e5XIwv3rV8vcShxZidHjE1Nip0ugpE1ZwF9ZlJZjDljruW/eJyDPm6obyKUudOAb1EjzFXg5R2KQ5woq/t4NcF82Ux065kkVIgD1TGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 13:00:00 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8158.021; Tue, 26 Nov 2024
 13:00:00 +0000
Date: Tue, 26 Nov 2024 07:59:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Juha-Pekka =?iso-8859-1?Q?Heikkil=E4?= <juhapekka.heikkila@gmail.com>
CC: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/kms_ccs: add hiberbate test
Message-ID: <Z0XDFpvsdlB45R8T@intel.com>
References: <20241125161958.296816-1-juhapekka.heikkila@gmail.com>
 <20241125161958.296816-2-juhapekka.heikkila@gmail.com>
 <Z0S_9YaQta79ooeQ@intel.com>
 <CAJ=qYWRYeg7mbbQGAGHbkHu8sAC0+Rq5J2CfZinFVniX7jsjMg@mail.gmail.com>
 <CAJ=qYWQfxw4DoeRGaf_EwJN0DYM0BxUaWQofFhs6mHKRqOG_rA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ=qYWQfxw4DoeRGaf_EwJN0DYM0BxUaWQofFhs6mHKRqOG_rA@mail.gmail.com>
X-ClientProxiedBy: MW4PR04CA0130.namprd04.prod.outlook.com
 (2603:10b6:303:84::15) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: e528d1e4-6d4b-4663-a29c-08dd0e1a3be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dm1QSXFsUmU0UXQwdHB2ZFFBRWNySTA4K3A4b2t5eXlKZENCTVZldDFZNzVL?=
 =?utf-8?B?Y0JJVEFXbEhPa21CNmpIK3l5c0xON1lTNU1NUHZyUHJPbkMrUVlNaHFJVHlB?=
 =?utf-8?B?bm91YWFVZm1EMHE2WWZpRm1nbkk3VGVYb2NlL3gzZ0ZTclBObFBCQy81UTJG?=
 =?utf-8?B?eHo4ZU5pWWkyUWlkb01rdEMyZ0dWZGMvWE9SLzVUVjVEajhWckJKRHoySjQz?=
 =?utf-8?B?b0dmWnRKRTEraExtRWtTV05mT3BCTHBVZFN5ZHpPNldmUGFoWlorQlkzS0pT?=
 =?utf-8?B?VXd4VWpHU3hSc2o1bnVBRHlmbU90d085M2d0cVFXd3dYUWF2eWZWV2R3WE1E?=
 =?utf-8?B?RGtmVXB6a1gxOUIvc29vVnFkMnBXK1UrcGtRdmNzVkw2MDA5UlVmUjUrNFRt?=
 =?utf-8?B?NTkzZ1ovREN6b05wakljbWw0eXBkZkNWOGo4V294akpPaFFNWnZia29DelR6?=
 =?utf-8?B?cDQ4cTh5ZmlSOVRvNm5YY3pwTS9EWjN3U1A0VHBlOUVuakFUQ0l5SFhHdlpj?=
 =?utf-8?B?TC9DWGNYeG81SThkMDFTOXBBR1A5MmlIc0Q5eC9xblhBTWpsVU5abzFBeVds?=
 =?utf-8?B?V0ZmWFhHVk5zaDhzZkVoRE9jTks0WkJ1dTIyN0VhV1d4dUNPUWF1cDFodklO?=
 =?utf-8?B?MWJZUkFaLzE0T3hjOWVEK0EyRUVOTFA3RHZuMzE1Uk5JSENmMXptbjArMkMr?=
 =?utf-8?B?MGJnZzFaQlRuRkdaa08wK0tTb1BPVUtxdlZYYmY1QmFPZE1FU3ZITWlkTXND?=
 =?utf-8?B?ZnNuSlA5TmFiOFkxK2N2Y05oUFV0cGI0UmwwQ0NHSHJYbWhZWUc5VUJyWUFX?=
 =?utf-8?B?NE5ZbW1DZThRb1pQR0hTSXZUL3FnbTVkUDc0amlFVFk1SnYxd20rM3VSRC9C?=
 =?utf-8?B?bW5mTyt6OGtCWWY4bm54TG9mOVhHVW1mQzRrbU10N2U1Y1BpRGxqVVpoVGkr?=
 =?utf-8?B?cnFZdXZpeGdvQlB1R25ZMnAybVB1TW5KaklaOU9pUUU4VjFkR0NqQ2ovakpV?=
 =?utf-8?B?Q0xsbGdYbUk2WWhHVmJZVHpoTUxsOFdBVVhhdlNkeHBaVUxKZElDbHArVitG?=
 =?utf-8?B?R0VWWVp0dFZUV2VWWHpqWGNONDRQUGluQStJenNpVUhNZzdOUjR1WUlPMytq?=
 =?utf-8?B?eFMwQVhHWVJST2tVSTBXNUVzUzlZeUljek0xUG1Qd2FwbEJXTjlUSzd1eCtp?=
 =?utf-8?B?RDlCcUtCVW00NjVhSU93ZU50YWd2WEhFMWhmTW9wTmk2bDgvOE4wK3pZMmNz?=
 =?utf-8?B?NXJxS2xFeWFzTndURm9aSm9pK1JUdHNFc1VEekdIYkowcWRtTHI0WmNBOENj?=
 =?utf-8?B?bmtOTlNjckxXRTNwK0tRYW9lS2xiMnpvbGYxOGJwbU9UT0ZjdmFSZVo4aUxE?=
 =?utf-8?B?elN4OTRpOUwvazl3SEdmSjlnU3BKK0VUODdIT3VEQ2RacmVuUFhjTElGbHlE?=
 =?utf-8?B?SkU3dVVITFBRY2RwWTg1K2xhYzlxZWhhSzlsbFE1TGVVTGI4SWpkNWduNE15?=
 =?utf-8?B?VkVGNHRmeFVqMDBzc1FUakRTWlN2NWlxQVNUUGFEUGVlSmJVZDFCSnJyUlox?=
 =?utf-8?B?VkxxSTJGTS85UC8zcmFCNXpQcFRKL3ErVTd0aVVya2ZnQ1h6ZS9Damdwd3J4?=
 =?utf-8?B?c2V5UC9ycWZLaHgwTGNaT3NlN1IwZFdueXA5M2RSTWx6V2xRS2RpZmhXTFF5?=
 =?utf-8?B?R0wvV25BdFRVQ2ZLOUptSlIvc1pkUVpwNTFZb3hTbHVLcjBMc3JiSWI3dUhx?=
 =?utf-8?Q?A9eozMk+T059DROncM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmJYNnJaMHpkRnF0ZllEajFrUmxDNjlyeUJmM2c2T3FxTWU5M1grbXdXSmNY?=
 =?utf-8?B?MzY1VTNqYW1HZjNOMWdicVl6RWNJZ2ZlazI1S3dpNVBLKzcxenU5M3Y1OVk1?=
 =?utf-8?B?TnBjajZDVnAyWUNoYitlQjloeGt2Mno5eWZodkwzTHNsZlBIeDNQSkFiUkNw?=
 =?utf-8?B?Umg1R0kxOHRCcFZjUlRNaFppWEd2MElOQWl0M0tVQTdSTXdnMTYvSDFxV2FN?=
 =?utf-8?B?UXBBQUR2WU03OHZCQ3docE1aTUdyT1FQR09yY0t2UzUxZFVTMmhSUGhnM2RH?=
 =?utf-8?B?dDJiNzN4M0w4RWp0VjZlL0dnNkU2Y1JtcUhPNVRKUWhvWndoL3JsOVgwdGN6?=
 =?utf-8?B?RUNFcEQ5WmtTOHhXZStxNktQdVltUGFwdFVidmMwcUx0R0dnYlpOd09BYVp0?=
 =?utf-8?B?RTBUcXFyekl5ejVoRk1LUkhWWS9kMWQ5dWF3aVBqSFpmQ2ZveFVFNWpyZ1d6?=
 =?utf-8?B?NXJNZForZ0tielZaL0crVG9lRjFaYVJidStUOE5mc25QajdwUGFuQTRLVmxt?=
 =?utf-8?B?c3QvVk1oL0xya0F3WFNsMmdTRmFwK0ViQkxkUUh5dytuLzBHZTBHa01DWlR1?=
 =?utf-8?B?L1hTb1dYNHhnaE1CVVptVkl2d1BkUjhCVXdjaXBQOGtHOXZUZWVjajVqcURI?=
 =?utf-8?B?akdiSTZKeU5UdFRvdkRDQUE2Sy81ai9YVjJKN3kzTWsvNGNCZlpNVjhON051?=
 =?utf-8?B?UjhBWEJOTGJkMUZzQ3hrTmFuczBVbS9UNVJLUmo3Y2JoQ2lSMXNLckRBUGdV?=
 =?utf-8?B?T240UWJhK1MrZVFON1k3akJ6STdmV3lVSDBVRlFLQ243UXc1V1VrVnNzZDFa?=
 =?utf-8?B?ZE03RENSWmZqaU01OHVsQkRkK2VibmxRcElJRER3ODJ1SG5QTmR1RkJSd3Jl?=
 =?utf-8?B?TExObXZrOFZkVlY5Z2prMVRCZ2kzTzhYTXhXeURhMHUyelVYZUxYdFh2Vm1x?=
 =?utf-8?B?V1VEWVByRFNtaTNidVJTeE9Ya3hnaHNReUc4aitZYXRFaEFSSjJua2xTS0w3?=
 =?utf-8?B?N1g4d1lMY1RYL1c1R0pmVjJDY0VTaUF6Yjh6dU5OYW1BTzZ6a0tZTXBKTzFH?=
 =?utf-8?B?TlcwYUVhMWZiTVh4NElSbWs3YW9WWHlScFQ2aW9mazZvbFg4UGFzNmQ1Z2E5?=
 =?utf-8?B?Q29JSjFSdjkwYVZybEs4TXdrOW1OY3BjUDFSZk4yS0R3WXkyc0k3OHI0NTZx?=
 =?utf-8?B?NEl2NWlSYWZ0Q28wajlMR25UQ0oyRlp1eGFGOTlrTXp6bE42YTV3SER5VUox?=
 =?utf-8?B?L3lnMko3YWpFbVIrcGpDWFczTDBoMmRFM09ucU9raTVIbGZBd0pDVFEyOGJO?=
 =?utf-8?B?bFlXcW0zcHRXRFdJbmM3ZVlZQkFnN0NlTkdIcklZRHBuR0g1WC9zL3NkeWNq?=
 =?utf-8?B?d2l0QjJkRm8wNUFIRTM0Z1I5ZWJzTzJMTkdleFZ6TldhT1VHQmpZOG5naUh6?=
 =?utf-8?B?RENteEFSSzlJN0NQRGJoLzNxOGtqOE4ybmtMcFc0QzZEQi9LRU5pd2dlUDZG?=
 =?utf-8?B?TVJ2ZE42bThqRHBubmoyNE1RSi84Z09pdW16WXhsTWdVd1lRbWU5VmhKalJs?=
 =?utf-8?B?VjkwMyszRCtBUFBINVJ3MXBhNjBtRndWYjhsN0YyKzYzVjFDZUZmYXM1L0hy?=
 =?utf-8?B?K3Fjd0RtRG5PRzB2T2hjbzdoYU9haDRCcnZlbktZaitQYTVZdXd3cHEzSGVv?=
 =?utf-8?B?Sm5yZGFJVG4yOHVKV3NneHpDVExMOUVreE1vQUFMNGd6N29yQkxjNXJNbG5S?=
 =?utf-8?B?TE9ONEZNUjJwRExWdlpOeStVSTNZcTBCYmVKM2VZa3RSU1VBYzI2ZnEzUWlU?=
 =?utf-8?B?QXBVT0lHTzl0MlU0TG82QWV2YXhIYWg2TzRFT1h2RzNMb25Yc1k4TXJLai96?=
 =?utf-8?B?dEptSGhWbVNCMENhdWJtYjZ4TGY2U0IrOEVrM2hrN1hxT2lxVy82ZHc5MEJZ?=
 =?utf-8?B?RTNZVjZMQ1d0RDFFcVgyNVJmcHBNZlJIZGE0d0ZucDdwcEtZRFkreE16K1oz?=
 =?utf-8?B?M1cvRlR6YVpycjZpSHJ5OUEvV1cxTmFHQi8zcUxLL05pbm1RRmtPNWlYMENU?=
 =?utf-8?B?dWZKZzRiRDVBRGtSR1liZFM2MUxXQ1FmbXdmanNHRnI5eWFjNDNmNUdBOVpX?=
 =?utf-8?B?TEdqNUZxYUxGSE9zandSZVFkeStvK1pwMGp2WThPa2pSeVZqYXZTWUUra3FV?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e528d1e4-6d4b-4663-a29c-08dd0e1a3be7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 12:59:59.7546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDq8ybv0foZfxwRoFYEIgFeOueklyP6okFtL4hYFNIr0v2CWh7Svm0OtKIgGKyXeHg1VxWLC65K1GkGC23qtMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
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

On Tue, Nov 26, 2024 at 10:07:37AM +0200, Juha-Pekka Heikkilä wrote:
> Seems I accidentally replied only to Rodrigo so I'll add igt-dev back here.
> 
> On Mon, Nov 25, 2024 at 10:03 PM Juha-Pekka Heikkilä
> <juhapekka.heikkila@gmail.com> wrote:
> >
> > On Mon, Nov 25, 2024 at 8:20 PM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > >
> > > On Mon, Nov 25, 2024 at 06:19:58PM +0200, Juha-Pekka Heikkila wrote:
> > > > Add hibernate test which bring entire system down for short
> > > > hibernate. This mode is added to suspend tests to be run
> > > > manually with '-r' flag because this is not ci friendly test,
> > > > on hibernate ci would lose connection to the hibernated box.
> > >
> > > I know that nowadays it is a beast to get hibernate to work in the distros,
> > > but afaik our CI is prepared for that, otherwise we wouldn't be able to
> > > get these:
> > >
> > > https://intel-gfx-ci.01.org/tree/intel-xe/index.html?testfilter=s4
> >
> > If you go see those test machine bootlogs you see there is no resume
> > configured. I think all these current s4 tests work with pm_test hence
> > also original problem where tests didn't reproduce that broken ccs
> > after resume. If you try running on your own box any of these s4 tests
> > you'll see they don't go fully down. I wanted to have a test that does
> > the same as real hibernate.

hmmm... something indeed changed because of CI.

I originally implemented them without SUSPEND_TEST_DEVICES, in a way that
the machine was going fully down in my ADL+DG2 machine.

But commit 4b767566bbc ("tests/intel/xe_pm: S4 to go up to devices only")
modified that to make it work for CI.

So, perhaps we can do both, have the manual setup with -r and no TEST
and have the one with TEST but not fully down.

Have you reproduced the CSS reported bug? Then have you tried the solution
with the TEST?

> >
> > >
> > > >
> > > > For this test to work kernel resume point need to be set using swapfile, from
> > > > kernel command line is checked if there is found something along the lines of
> > > > "resume=/dev/nvme0n1p2 resume_offset=73527296" or so to verify hibernate
> > > > will be successfull.
> > >
> > > Indeed painful nowadays... I can't even believe this gap came from user
> > > report... is anyone really still using hibernation nowadays?! :)
> > >
> > > >
> > > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > > ---
> > > >  tests/intel/kms_ccs.c | 162 +++++++++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 159 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> > > > index 3e9a57863..fd2fe9d3d 100644
> > > > --- a/tests/intel/kms_ccs.c
> > > > +++ b/tests/intel/kms_ccs.c
> > > > @@ -190,6 +190,7 @@ typedef struct {
> > > >       bool user_seed;
> > > >       enum igt_commit_style commit;
> > > >       int fb_list_length;
> > > > +     bool do_hibernate;
> > > >       struct {
> > > >               struct igt_fb fb;
> > > >               int width, height;
> > > > @@ -271,6 +272,154 @@ static const struct {
> > > >   */
> > > >  #define MAX_SPRITE_PLANE_WIDTH 2000
> > > >
> > > > +/* constants for hibenate test */
> > > > +#define RTC_WAKE_CMD "rtcwake -m no -s %d"
> > >
> > > Why are you calling rtcwake directly instead of using
> > > igt_system_suspend_autoresume(SUSPEND_STATE_DISK...) ?!
> > >
> > > Please check lib/igt_aux lib/igt_pm and tests/xe/xe_pm
> >
> > I wanted rtc only to wake up the machine. On
> > igt_system_suspend_autoresume(..) I'd get pm_test handling which I
> > want to avoid here.

you can do that.... just pass SUSPEND_TEST_NONE instead of
SUSPEND_TEST_DEVICES as the second argument. So, a lot of the logic
here can be simplified.

And as I told perhaps we can have 3 cases:

hibernate-manual:
 igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
                               SUSPEND_TEST_NONE);
hibernate-auto:
igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
                              SUSPEND_TEST_DEVICES);
suspend:
igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
                              SUSPEND_TEST_NONE);


> >
> > >
> > > > +#define PROC_CMDLINE "/proc/cmdline"
> > > > +#define SYS_POWER_STATE "/sys/power/state"
> > > > +#define GRUB_CFG_PATH "/boot/grub/grub.cfg"
> > > > +
> > > > +static void check_hibernation_support(void)
> > > > +{
> > > > +     int fd;
> > > > +     char buffer[2048];
> > > > +     ssize_t bytes_read;
> > > > +     FILE *cmdline;
> > > > +
> > > > +     /* Check if hibernation is supported in /sys/power/state */
> > > > +     fd = open(SYS_POWER_STATE, O_RDONLY);
> > > > +     igt_require_f(fd > 0, "Failed to open /sys/power/state");
> > > > +     bytes_read = read(fd, buffer, sizeof(buffer) - 1);
> > > > +     close(fd);
> > > > +
> > > > +     igt_require_f(bytes_read > 0, "Failed to read /sys/power/state");
> > > > +
> > > > +     buffer[bytes_read] = '\0';
> > > > +     igt_require_f(strstr(buffer, "disk") != NULL,
> > > > +                   "Hibernation (suspend to disk) is not supported on this system.\n");
> > > > +
> > > > +     /* Check if resume is configured in kernel command line */
> > > > +     cmdline = fopen(PROC_CMDLINE, "r");
> > > > +     igt_require_f(cmdline, "Failed to open /proc/cmdline");
> > > > +     fread(buffer, 1, sizeof(buffer) - 1, cmdline);
> > > > +     fclose(cmdline);
> > > > +
> > > > +     igt_require_f(strstr(buffer, "resume="),
> > > > +                   "Kernel does not have 'resume' parameter configured for hibernation.\n");
> > > > +}
> > >
> > > we should probably have this in the igt_pm lib to be used in other places
> > > like xe_pm. I remember we had discussions when s4 started failing in CI,
> > > but apparently the solution was to make CI to work with it instead of
> > > protecting our s4 tests...
> >
> > I was last week talking with Jari Tahvanainen about this. Our ci is
> > not configured for the machines really hibernating, he suggested we
> > first start with one test, start to run it in special box, and we go
> > on from there .. so, here we are :)
> > I agree final destination for this function should be in lib/ like in
> > igt_pm or so.
> >
> > >
> > > > +
> > > > +static void set_rtc_wake_timer(int seconds)
> > > > +{
> > > > +     char command[256];
> > > > +
> > > > +     snprintf(command, sizeof(command), RTC_WAKE_CMD, seconds);
> > > > +
> > > > +     igt_require_f(system(command) == 0,
> > > > +                   "Failed to set RTC wake timer.\n");
> > > > +}
> > > > +
> > > > +static void hibernate_system(void)
> > > > +{
> > > > +     int fd;
> > > > +
> > > > +     fd = open(SYS_POWER_STATE, O_WRONLY);
> > > > +     igt_require_f(fd > 0, "Failed to open /sys/power/state");
> > > > +
> > > > +     if (write(fd, "disk", 4) != 4) {
> > > > +             close(fd);
> > > > +             igt_require_f(0, "Failed to write 'disk' to /sys/power/state");
> > > > +     }
> > > > +     close(fd);
> > > > +}
> > > > +
> > > > +static void ensure_grub_boots_same_kernel(void)
> > >
> > > I don't believe that this should be to the test case to ensure.
> > > This should be ensured by the infra to support these s4 testcases.
> >
> > This is bit so-so. If guys would run this test on their own boxes to
> > do some debugging, forgetting to always set the correct kernel for the
> > next in-test reboot would cause incorrect results.
> >
> > >
> > > > +{
> > > > +     char cmdline[1024];
> > > > +     char current_kernel[256];
> > > > +     char last_menuentry[512] = "";
> > > > +     char grub_entry[512];
> > > > +     char command[1024];
> > > > +     FILE *cmdline_file, *grub_cfg;
> > > > +     char line[1024];
> > > > +     bool kernel_found = false;
> > > > +     char *kernel_arg;
> > > > +     char *kernel_end;
> > > > +
> > > > +     /* Read /proc/cmdline to get the current kernel image */
> > > > +     cmdline_file = fopen(PROC_CMDLINE, "r");
> > > > +     igt_require_f(cmdline_file, "Failed to open /proc/cmdline");
> > > > +
> > > > +     if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
> > > > +             fclose(cmdline_file);
> > > > +             igt_require_f(0, "Failed to read /proc/cmdline");
> > > > +     }
> > > > +     fclose(cmdline_file);
> > > > +
> > > > +     /* Parse the kernel image from cmdline */
> > > > +     kernel_arg = strstr(cmdline, "BOOT_IMAGE=");
> > > > +     igt_require_f(kernel_arg, "BOOT_IMAGE= not found in /proc/cmdline\n");
> > > > +
> > > > +     kernel_arg += strlen("BOOT_IMAGE=");
> > > > +     kernel_end = strchr(kernel_arg, ' ');
> > > > +
> > > > +     if (!kernel_end)
> > > > +             kernel_end = kernel_arg + strlen(kernel_arg);
> > > > +
> > > > +     snprintf(current_kernel, sizeof(current_kernel), "%.*s",
> > > > +              (int)(kernel_end - kernel_arg), kernel_arg);
> > > > +     igt_debug("Current kernel image: %s\n", current_kernel);
> > > > +
> > > > +     /* Open GRUB config file to find matching entry */
> > > > +     grub_cfg = fopen(GRUB_CFG_PATH, "r");
> > > > +     igt_require_f(grub_cfg, "Failed to open GRUB configuration file");
> > > > +
> > > > +
> > > > +     while (fgets(line, sizeof(line), grub_cfg)) {
> > > > +             /* Check if the line contains a menuentry */
> > > > +             if (strstr(line, "menuentry")) {
> > > > +             /* Store the menuentry line */
> > > > +                     char *start = strchr(line, '\'');
> > > > +                     char *end = start ? strchr(start + 1, '\'') : NULL;
> > > > +
> > > > +                     if (start && end) {
> > > > +                             snprintf(last_menuentry,
> > > > +                                      sizeof(last_menuentry),
> > > > +                                      "%.*s", (int)(end - start - 1),
> > > > +                                      start + 1);
> > > > +                     }
> > > > +             }
> > > > +
> > > > +             /* Check if the current line contains the kernel */
> > > > +             if (strstr(line, current_kernel)) {
> > > > +                     /* Use the last seen menuentry as the match */
> > > > +                     snprintf(grub_entry, sizeof(grub_entry), "%s",
> > > > +                              last_menuentry);
> > > > +                     kernel_found = true;
> > > > +                     break;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     fclose(grub_cfg);
> > > > +
> > > > +     igt_require_f(kernel_found, "Failed to find matching GRUB entry for kernel: %s\n",
> > > > +                   current_kernel);
> > > > +
> > > > +     /* Set the GRUB boot target using grub-reboot */
> > > > +     snprintf(command, sizeof(command), "grub-reboot \"%s\"", grub_entry);
> > > > +     igt_require_f(system(command) == 0, "Failed to set GRUB boot target to: %s\n",
> > > > +                   grub_entry);
> > > > +
> > > > +     igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n",
> > > > +               current_kernel, grub_entry);
> > > > +}
> > > > +
> > > > +static void hibernate_autoresume(int resume_delay)
> > > > +{
> > > > +     check_hibernation_support();
> > > > +     set_rtc_wake_timer(resume_delay);
> > > > +     ensure_grub_boots_same_kernel();
> > > > +     hibernate_system();
> > > > +}
> > > > +
> > > >  static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
> > > >  {
> > > >       int i;
> > > > @@ -839,8 +988,11 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
> > > >
> > > >       if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
> > > >               if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED) {
> > > > -                     igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > > > -                                                   SUSPEND_TEST_NONE);
> > > > +                     if (data->do_hibernate)
> > > > +                             hibernate_autoresume(30);
> > > > +                     else
> > > > +                             igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > > > +                                                           SUSPEND_TEST_NONE);
> > > >
> > > >                       /* on resume check flat ccs is still compressed */
> > > >                       if (is_xe_device(data->drm_fd) &&
> > > > @@ -1044,6 +1196,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
> > > >               data->user_seed = true;
> > > >               data->seed = strtoul(optarg, NULL, 0);
> > > >               break;
> > > > +     case 'r':
> > > > +             data->do_hibernate = true;
> > > > +             break;
> > > >       default:
> > > >               return IGT_OPT_HANDLER_ERROR;
> > > >       }
> > > > @@ -1056,9 +1211,10 @@ static data_t data;
> > > >  static const char *help_str =
> > > >  "  -c\t\tCheck the presence of compression meta-data\n"
> > > >  "  -s <seed>\tSeed for random number generator\n"
> > > > +"  -r\t\tOn suspend test do full hibernate with reboot\n"
> > > >  ;
> > > >
> > > > -igt_main_args("cs:", NULL, help_str, opt_handler, &data)
> > > > +igt_main_args("csr:", NULL, help_str, opt_handler, &data)
> > > >  {
> > > >       igt_fixture {
> > > >               data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> > > > --
> > > > 2.45.2
> > > >
