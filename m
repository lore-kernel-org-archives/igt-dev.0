Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D57D69104
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 12:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D3810E44B;
	Thu, 28 Nov 2024 12:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HwrKAno6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32E610E44B
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 12:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732797903; x=1764333903;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CVAf7YEc6kxAO5D37hKIVKTxteQ1ZnnsAirr7P25SA0=;
 b=HwrKAno6fmD6vHeLJN359n03C25d9pWX8DQU98FySiH6SFDTYmRfumgm
 C7drv8KRuhSYclpxVfilUaIcb2mQNb+m2IutTfZpya+SwchHiqVKSV2Gv
 ER72AtOlZlts/9dehifOSAPGnRqM21IjX0jnEfplPKn/Ens1Rguy1oKz4
 JRltCgkP8eyM3gZ1o8QSU6Cp3rUKWTYAfdgR+4MAoynZfRzaNNTtwa5gg
 /nB1HM6FmEnUSrgWKYIX00IAysTmUT6V113Kgt5GK9ZXGMpSP4/ZQV8/f
 4GVmDW09PgDNMDtU65uTObmRiEFmzFe9TY0JeO8idjFWjKZon3UkPIr8z Q==;
X-CSE-ConnectionGUID: EKwtGxVmS02WKO29cceXGA==
X-CSE-MsgGUID: lZRNOjRLRSm/zI2ZkLvE/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33272157"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="33272157"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 04:45:02 -0800
X-CSE-ConnectionGUID: sD9Yk9TVSzi2xeqIPNKfMA==
X-CSE-MsgGUID: DIMV2fq1QS+ZlNhAioPaRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="97285493"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 04:45:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 04:45:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 04:45:01 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 04:45:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmmLAABXuRRKkzqjk+bZXjULLDq0Vck5a1HHcR83eUwNsZzKDVzYMbYrYSbEWnUyiOeQ38BwXDnp/+dywYTYzOaCxEMBKoxDAUC2E9+9w+lUIfxIO0NfnB9yMtGMLlFUNkVJ/1b3Jx6ov+rQ0Viimhy+Jb8ane2x9yJldb6oKMkC7OmRjSxsdl8+/ONXGmD7qC7HnF+d/wUnV43dc8w5SzrbKB4krfYeF/cNaa4u4kFId0fcu32Ri4XeuhhGNxOlf+/Q9HnLsVL+MQCxxQY4Htj4WX5W5YW4hlXGlA5/DMCDHLXeh3aLchJUbH/LFzLYR0tbsTwf3Qx6RACfQb7Row==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PZRWOj+68an2OLRThI5vBWevq7zFAcJpexuYdfI934=;
 b=UWpousAayamYOOunLM9cPHBGOzRuW1y1K16F51SMZ/+sjR5YF1zSRMtQFoNdyI8xxhSX7C8KRcs8WQqLcOT3WJa+nZmkj9roHLyWWNg3QyaPQwWfYl6ox5+pWRtKnfIZqXNbu00dALD7c88z5OMyr9qEPn2cYhmo060gt4H3tFb8BPmnhjLliZJ50Jr21HUP5syxMcoZ1mv4irbmxRMaaPk/nkD/mzqppufeMs3123jtWBGCDsAbYBhfLpIwyHlz+/BA7pBzGnuz5hQ1nTSlya3k+78zd1t+0v0kr8OSux35caCYrC5wfxsjCPI5K5L3Yf9NbS6oXHDrn9mnibVo7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB5045.namprd11.prod.outlook.com (2603:10b6:510:3f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 12:44:53 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8158.021; Thu, 28 Nov 2024
 12:44:53 +0000
Date: Thu, 28 Nov 2024 07:44:47 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Juha-Pekka =?iso-8859-1?Q?Heikkil=E4?= <juhapekka.heikkila@gmail.com>
CC: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/kms_ccs: add hiberbate test
Message-ID: <Z0hlv5a4fXjVuJnw@intel.com>
References: <20241125161958.296816-1-juhapekka.heikkila@gmail.com>
 <20241125161958.296816-2-juhapekka.heikkila@gmail.com>
 <Z0S_9YaQta79ooeQ@intel.com>
 <CAJ=qYWRYeg7mbbQGAGHbkHu8sAC0+Rq5J2CfZinFVniX7jsjMg@mail.gmail.com>
 <CAJ=qYWQfxw4DoeRGaf_EwJN0DYM0BxUaWQofFhs6mHKRqOG_rA@mail.gmail.com>
 <Z0XDFpvsdlB45R8T@intel.com>
 <CAJ=qYWTfuqkjQQ9eQDK8UaGDZ-xe3tvidt6kOX6sYgEYzk2uNw@mail.gmail.com>
 <CAJ=qYWRcsbwmsG+aQBEKqd_c80XrTPorn0+Ji+P5H4TNu=ze2A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ=qYWRcsbwmsG+aQBEKqd_c80XrTPorn0+Ji+P5H4TNu=ze2A@mail.gmail.com>
X-ClientProxiedBy: MW4PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:303:8c::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB5045:EE_
X-MS-Office365-Filtering-Correlation-Id: 4899f216-4143-468a-8353-08dd0faa7430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmY3RDlodVViclBodHVhMkZQbXM3b0E0RThNSXVxdTArOFpkZmRQQ2N3RjN2?=
 =?utf-8?B?eVZGektVNHdEZ1dlTDlVd05aN3NSQnZCUFExSlUvWnVSV2t4elZLYlZUaWk3?=
 =?utf-8?B?VWdZVWFIUFZKM2tvVjNUMDN6bHpzcm4vTGt3d3NFazE4emlrUThINDlkWjV2?=
 =?utf-8?B?RXBIOTVwWTZzd2ZRNGZ3OHhvaDBmOE5LelBicDV3OGI2V2RnTWFTQm55TE9a?=
 =?utf-8?B?aTdOQzRRODR4SmdVaEF6WG1hYjdLU21TUG9DWCt1V01wUUhWVklqWk9sWFZn?=
 =?utf-8?B?YUlSZ0lyc0VLSklZQXN5d0p1MzBXaFlrVXY3TisveklrMnZ1K296R25RMUQ1?=
 =?utf-8?B?VGZZdlZyOHJaUG9UUkVRSGdoekRMcGxMdmdla2RiQ1VFWWVUTElUSm5aSHIv?=
 =?utf-8?B?b2NYRTZreVYya1laRFlnc3pQOFFVR3pSeU5oZm13LzVVaTNPM3RQa0RPaHpn?=
 =?utf-8?B?QUVCYmF6cERJWHR2bXMweUtENTN3LzQ4d2VBNXo3TkU3UXFJZkNzNUtaWXRY?=
 =?utf-8?B?b1NLNjdtNjcxV0dPRytpdVhQaWhrcjNJNEQxTWkrdFhLNTM1SERZSHZJNzdt?=
 =?utf-8?B?bzg2eDFXSDZqZE5GUGMrSW5lVS81Yzc0RzRGaTYzd1pJOWFEL25RNXV4NDlh?=
 =?utf-8?B?R0pYczRZcUNlY3orbHZUOUQ0dnI5Zm9HTHJ5dGE2dk1Oak9sRjYrQkZEVEZP?=
 =?utf-8?B?ckREenFpaVRJSFovMDA1ekJxQVlUalA3YkpqWTNHa1Z0Sks5MTBjZTJTdG9x?=
 =?utf-8?B?bmk0bjR2Y1dCcy91QkVVQTZtYnh3S0ZwNDNnajNOL0QyMlZoVnZTUVVIRjRp?=
 =?utf-8?B?MmlkQkVGZVdnYmg1YkExbHpweVA2TjlrVG1EVDRkUWljaksyTjNiNFlZNk1q?=
 =?utf-8?B?TXkxK2Vla0YzazVSbTh1QVYvSDRYTzZnYU9ha29LN2NqcUxtY0FnNXlyL0lY?=
 =?utf-8?B?eEMvT1dMUWF4ME85ZGl6VFBId3RncFZtYzR1cFRwY1RnNGp2VTcwOHlHM2sx?=
 =?utf-8?B?QVNKUFpBaEc3NXMxYU5tY2dDeEFGanNrckJ3a3loTUttekZpUmNJcGRMSmZZ?=
 =?utf-8?B?cm5vNHpITkt6TitEV0w0Q0pCdjQyMXBJWjBUKzdqSTdmSCtDaDYvYTV3aEtC?=
 =?utf-8?B?TklTZDRvd0VWYlQ5TjN3WmNJL09YaFJ4MFdGanptQllXZDJWOUFMSmh2QlR6?=
 =?utf-8?B?czBMTHVyMURwdkNLVHZ0bVlHNlUyNzViRnFsSHljU1o4dTc5WWwzTnZ4bGpH?=
 =?utf-8?B?cTdGNmczWGcrbU5aVjJ2WUJueE9VbTRYNFlwclJ6dDllV1ZxK2ltTk94bVdq?=
 =?utf-8?B?N01YWWhiRW5KdGhaQklqQk9PRGw0R3dUOXh6d2Z0Tkx5UnVlai8vYnRuRHJz?=
 =?utf-8?B?Uk5tOVV6aTdWSnJzdGNpVWhXalA1czR3V3pLZUxYTXJZRTJNNmEwRVFEZGdj?=
 =?utf-8?B?KzFkb3RFdkQ3TUptdFVHanQyaER0L0NIN1JFWFUzMEJFbDZOSXh4MG5UU09G?=
 =?utf-8?B?Y0ZUZjd1R0s5UllzaUZwc09NRGdlUDJ4UkdWS3RGUWxUalpJZTI2MkZxNUVW?=
 =?utf-8?B?NEhxb29ORlgrQTZHSUJTOXVzamNtdjkzQzZ4b3MrTDhHeStVNzJrQkdvVzB4?=
 =?utf-8?B?c3Y5NW9CcVdSRnZPL2gwTXhzclR4azd4b3RBcnN2VGJOZmFxYVdjZ3daTDVj?=
 =?utf-8?B?THVPdjViWnBRWDlieTRPNzd2QTFXdVBKYW10UVFmTzVjK0ZCZForRzIzdFUx?=
 =?utf-8?Q?ktrT3JI6nRYvKXoLmY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2hGWW1RQTh0NkNjdkZXRG5nZWN1K0NlY2toVDRvaEpYb2FIQmVsSzVYSHpJ?=
 =?utf-8?B?MTdCaHBSMGQrZStHQTh2Zm1uVEVHREl4WVJ4OFJqc2p0L0JYY2dEdkw0SHpi?=
 =?utf-8?B?cG4xTzZDdFBNVjJuamVKbDk2MjZ0aEhTNHl0UXpDbVpJb2lxWGh6R3VjRXNu?=
 =?utf-8?B?YW9vWG44L0luNkRFanU5TEQvWlhydGtvczhVNTg5dkxoZzFBQU9Nd2w2Z2NX?=
 =?utf-8?B?ejFoRTczOExDTE4wMmJ1MVpabEJlVUhTS016ejI5cVlXUHNYbTNJNlpwcjgx?=
 =?utf-8?B?RkF2SlplajBCV01WLyszU3g4Y1RNWHdyTkxqUnBISzZNd1lOR3U0QituZ0Yy?=
 =?utf-8?B?M1N4VHcxMXpGY0tMUWttVjBnYitSVHYxMExsZm5EY2N3bVB3OVJpZXRIT0hL?=
 =?utf-8?B?TzRxMldwMk16d0hrNWZ4NnlPNkJNbjh5VEZzM3NTNkI3RDhIQThFbnl6eXk4?=
 =?utf-8?B?cmgwOU1LdUYycWdNaVViYUNPbTNTaWIxZUMxWU9BN3VqOUFjM0lieFBwQ0d6?=
 =?utf-8?B?ZklXeEQwTk1IcW4xdXYwM1pHVWxaOXFROUpKM1N3S0dmQkMzakFyUFlQdU1U?=
 =?utf-8?B?TWhhK3FxTHUrWWFYY3hTY1JzWm92eVZtVm5OWHp5ZE53Q3BqaEk0M0l0bng3?=
 =?utf-8?B?bTZTb2llOWRITDhzQWU3OVFTUWNIZ1QwZUlXRWlibExtOVdWWWJuSkZ1MlBQ?=
 =?utf-8?B?TmdKQi8vZGtzUVVOR29QYkkxS0o3K0ZPLytPZVF5T1ZXL3o0RDdGZExUSzRO?=
 =?utf-8?B?L2RUKy9kODYwR1RRMnlnQU9DOUFhKzNKbnpjMDJoSHAydGYxdXpwOGdXT2c4?=
 =?utf-8?B?M0x0OGlwSnY1RTRJZDluWXJJTmc3M29LbVZSRWdKN3BhOWJFUWV0NjVaZ3ZT?=
 =?utf-8?B?TG02QmorNEtoMVNZYU9hMW9rSjMvYXBTWUxCWmZuZ09VekFXOTdXODRFNVgv?=
 =?utf-8?B?UVNUWENKeFVQQXY4VDNwOHUxcnRpcmpzMmhKV25lTXVnTVFWNVJFY3N3Z2tx?=
 =?utf-8?B?V3ZYNk5EUWk0emtoMzFKT0FjR3NUa1dCcC9aY1AycXcwZ2x6dVVWajhTc01E?=
 =?utf-8?B?MlQwQW5uOGVUUkQxL3Y0UnBwOXNuQ2Z3R3JTZHA3SlFyenRMU1gvYllWVmwz?=
 =?utf-8?B?bGthL2ZocjZOUzBVQ0l2b0N5MUEvZ2J2UXpTWW1WUXZxM0xGRUJjeEpZZUFN?=
 =?utf-8?B?SktlU2VYVENBck5hMnA5a2NueC9wREtJbVdhQkVxNFpjbG1zdkNpbENOTlha?=
 =?utf-8?B?L1VRbUlKSHpWUWpIUTNkd1Uram95REM3VFZHNDUrODlGSnUxUTV6RXZXeUpU?=
 =?utf-8?B?WkFJRi9ncDBSZTQrVUFrMmxFejc3VEwrTlY1U1dTcTFBbElRUWlUVTF3V2xa?=
 =?utf-8?B?WmpyZHg3bUtTck1NTkVJTUIyK2RUZXlBQXoxb2hxUHVLTmk5VTFvUjJabC9s?=
 =?utf-8?B?RDkzeTBVQ242b2ozRzZDNFJyd202aGUvaHBPRmtnUVU1cWNmY0Q0eHRVRVZt?=
 =?utf-8?B?aDEyMHZRWXBiT2ZHUXlQYlkrR0JsQVBNZDhTMU5DTU9tN2RpSElmY2ovQUw0?=
 =?utf-8?B?bXNLVjdUQWRXRWovdEs0TW5ia0JPS3hUT2YwcVBaZGplSVJyRGxKNHE4MXJ3?=
 =?utf-8?B?bVVCb0J0cmhUaUpPM2dmdU9QeWFwWTBHNy82MDVOMkxyK2RESUhIUzBXNXdN?=
 =?utf-8?B?cVdScUxxQVhyUC9EcFg3REVjNFhPNGdOdHFIRFFpWXFSazQ0MkVsTHo4dUth?=
 =?utf-8?B?N3ZOZURwbVFUL1hjdGJPQjZiSlVuS2VqdzNZVHpsOUpGNE5vSWpxYXcrWjNp?=
 =?utf-8?B?MWVaQlFRUjBiTHVwMEZKU082ek1oemF3S0ZZYmpyczZOc3dCM0RLU094cUx3?=
 =?utf-8?B?Z2VMVGhqSG1rUmQxY29neloxa2JpQlljYWRLMHFnRU9YZUJtVDNEVzVOSDZl?=
 =?utf-8?B?ZHo3eWRpU3R4R0F3TXIxZ1BwRzVuSHo3TG0yazFyOEZhbzVuVHNpSTlCRy9Y?=
 =?utf-8?B?b2tqT1NWeHEyZjc0U1V4N2lVRmV4VnBVUXpGOHFYZ2xSM2t3d25taWlUSnB1?=
 =?utf-8?B?V3ZVM3RFZ3gyTHU0TmZKZ2JHWk9jRkZ0S1Mvc2lhK1hPa0pjTXU5YkozWjg0?=
 =?utf-8?B?enpDL2huOS9rMmRtMEUvWFZvSFA5UnExY3B4VUVGVmV0M1FhQ2JJYlNsTWJN?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4899f216-4143-468a-8353-08dd0faa7430
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 12:44:53.1614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjS/6Ph99jSA+iXu9PEiZnSzRQ7nQNin6iDwnSMK15W/ZnxjTA4Ve80SV92Qa2virqcNToaqHPeVbih/C3MJSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5045
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

On Wed, Nov 27, 2024 at 03:21:17PM +0200, Juha-Pekka Heikkilä wrote:
> On Tue, Nov 26, 2024 at 7:12 PM Juha-Pekka Heikkilä
> <juhapekka.heikkila@gmail.com> wrote:
> >
> > On Tue, Nov 26, 2024 at 3:00 PM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > >
> > > On Tue, Nov 26, 2024 at 10:07:37AM +0200, Juha-Pekka Heikkilä wrote:
> > > > Seems I accidentally replied only to Rodrigo so I'll add igt-dev back here.
> > > >
> > > > On Mon, Nov 25, 2024 at 10:03 PM Juha-Pekka Heikkilä
> > > > <juhapekka.heikkila@gmail.com> wrote:
> > > > >
> > > > > On Mon, Nov 25, 2024 at 8:20 PM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > > > > >
> > > > > > On Mon, Nov 25, 2024 at 06:19:58PM +0200, Juha-Pekka Heikkila wrote:
> > > > > > > Add hibernate test which bring entire system down for short
> > > > > > > hibernate. This mode is added to suspend tests to be run
> > > > > > > manually with '-r' flag because this is not ci friendly test,
> > > > > > > on hibernate ci would lose connection to the hibernated box.
> > > > > >
> > > > > > I know that nowadays it is a beast to get hibernate to work in the distros,
> > > > > > but afaik our CI is prepared for that, otherwise we wouldn't be able to
> > > > > > get these:
> > > > > >
> > > > > > https://intel-gfx-ci.01.org/tree/intel-xe/index.html?testfilter=s4
> > > > >
> > > > > If you go see those test machine bootlogs you see there is no resume
> > > > > configured. I think all these current s4 tests work with pm_test hence
> > > > > also original problem where tests didn't reproduce that broken ccs
> > > > > after resume. If you try running on your own box any of these s4 tests
> > > > > you'll see they don't go fully down. I wanted to have a test that does
> > > > > the same as real hibernate.
> > >
> > > hmmm... something indeed changed because of CI.
> > >
> > > I originally implemented them without SUSPEND_TEST_DEVICES, in a way that
> > > the machine was going fully down in my ADL+DG2 machine.
> > >
> > > But commit 4b767566bbc ("tests/intel/xe_pm: S4 to go up to devices only")
> > > modified that to make it work for CI.
> > >
> > > So, perhaps we can do both, have the manual setup with -r and no TEST
> > > and have the one with TEST but not fully down.
> > >
> > > Have you reproduced the CSS reported bug? Then have you tried the solution
> > > with the TEST?
> >
> > I suspect I earlier got lot of frozen test machines, with these test
> > it always affect testing of new test. This test I now have here does
> > reproduce that ccs bug with kernel where it's not fixed.
> >
> > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > For this test to work kernel resume point need to be set using swapfile, from
> > > > > > > kernel command line is checked if there is found something along the lines of
> > > > > > > "resume=/dev/nvme0n1p2 resume_offset=73527296" or so to verify hibernate
> > > > > > > will be successfull.
> > > > > >
> > > > > > Indeed painful nowadays... I can't even believe this gap came from user
> > > > > > report... is anyone really still using hibernation nowadays?! :)
> > > > > >
> > > > > > >
> > > > > > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > > > > > ---
> > > > > > >  tests/intel/kms_ccs.c | 162 +++++++++++++++++++++++++++++++++++++++++-
> > > > > > >  1 file changed, 159 insertions(+), 3 deletions(-)
> > > > > > >
> > > > > > > diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> > > > > > > index 3e9a57863..fd2fe9d3d 100644
> > > > > > > --- a/tests/intel/kms_ccs.c
> > > > > > > +++ b/tests/intel/kms_ccs.c
> > > > > > > @@ -190,6 +190,7 @@ typedef struct {
> > > > > > >       bool user_seed;
> > > > > > >       enum igt_commit_style commit;
> > > > > > >       int fb_list_length;
> > > > > > > +     bool do_hibernate;
> > > > > > >       struct {
> > > > > > >               struct igt_fb fb;
> > > > > > >               int width, height;
> > > > > > > @@ -271,6 +272,154 @@ static const struct {
> > > > > > >   */
> > > > > > >  #define MAX_SPRITE_PLANE_WIDTH 2000
> > > > > > >
> > > > > > > +/* constants for hibenate test */
> > > > > > > +#define RTC_WAKE_CMD "rtcwake -m no -s %d"
> > > > > >
> > > > > > Why are you calling rtcwake directly instead of using
> > > > > > igt_system_suspend_autoresume(SUSPEND_STATE_DISK...) ?!
> > > > > >
> > > > > > Please check lib/igt_aux lib/igt_pm and tests/xe/xe_pm
> > > > >
> > > > > I wanted rtc only to wake up the machine. On
> > > > > igt_system_suspend_autoresume(..) I'd get pm_test handling which I
> > > > > want to avoid here.
> > >
> > > you can do that.... just pass SUSPEND_TEST_NONE instead of
> > > SUSPEND_TEST_DEVICES as the second argument. So, a lot of the logic
> > > here can be simplified.
> > >
> > > And as I told perhaps we can have 3 cases:
> > >
> > > hibernate-manual:
> > >  igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
> > >                                SUSPEND_TEST_NONE);
> > > hibernate-auto:
> > > igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
> > >                               SUSPEND_TEST_DEVICES);
> > > suspend:
> > > igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > >                               SUSPEND_TEST_NONE);
> >
> > I'll try that, if that reproduce the bug then I can cut out those
> > hibernate_system(..) and set_rtc_wake_timer(..) and move
> > check_hibernation_support(..) to libigt. For reproducing I'll anyway
> > need to go to lab to see the machine, when I try these on ril system
> > it seems to want to restore my machine when it first time stay down
> > instead of resuming.
> 
> There is something fishy going on with
> igt_system_suspend_autoresume(..). When I try to use
> SUSPEND_STATE_DISK and SUSPEND_TEST_NONE, lnl boxes I've tried never
> successfully hibernated. These boxes start to go down but don't power
> off and I see same code always stuck on board led display. I'm not
> able to pinpoint the issue since I'm not so familiar with pm code. On
> same boxes, the hibernate code I have on this patch did work 5/5. As
> above mentioned difference is I use rtc to wake the system but I on my
> own go write  /sys/power/state. While it should do the same thing,
> something is different..no idea could it be just some firmware issue
> vs timing but result is anyway different. I had quick try with mtl and
> i915 igt_system_suspend_autoresume(..) where things did work as
> expected.

hmm that's indeed interesting... the autoresume uses rtcwake anyway no?
perhaps some different option passed to rtcwake?

well, to be honest, I have seen many cases where our autoresume gets
stuck in different platforms with differents levels of suspend :/

Maybe we could try to improve our autoresume to ensure it is taking
your safer sequence here? or at least have your safer sequence as
an alternative inside the lib/igt_pm as well?

Thanks a lot for all the experiments

> 
> >
> > >
> > >
> > > > >
> > > > > >
> > > > > > > +#define PROC_CMDLINE "/proc/cmdline"
> > > > > > > +#define SYS_POWER_STATE "/sys/power/state"
> > > > > > > +#define GRUB_CFG_PATH "/boot/grub/grub.cfg"
> > > > > > > +
> > > > > > > +static void check_hibernation_support(void)
> > > > > > > +{
> > > > > > > +     int fd;
> > > > > > > +     char buffer[2048];
> > > > > > > +     ssize_t bytes_read;
> > > > > > > +     FILE *cmdline;
> > > > > > > +
> > > > > > > +     /* Check if hibernation is supported in /sys/power/state */
> > > > > > > +     fd = open(SYS_POWER_STATE, O_RDONLY);
> > > > > > > +     igt_require_f(fd > 0, "Failed to open /sys/power/state");
> > > > > > > +     bytes_read = read(fd, buffer, sizeof(buffer) - 1);
> > > > > > > +     close(fd);
> > > > > > > +
> > > > > > > +     igt_require_f(bytes_read > 0, "Failed to read /sys/power/state");
> > > > > > > +
> > > > > > > +     buffer[bytes_read] = '\0';
> > > > > > > +     igt_require_f(strstr(buffer, "disk") != NULL,
> > > > > > > +                   "Hibernation (suspend to disk) is not supported on this system.\n");
> > > > > > > +
> > > > > > > +     /* Check if resume is configured in kernel command line */
> > > > > > > +     cmdline = fopen(PROC_CMDLINE, "r");
> > > > > > > +     igt_require_f(cmdline, "Failed to open /proc/cmdline");
> > > > > > > +     fread(buffer, 1, sizeof(buffer) - 1, cmdline);
> > > > > > > +     fclose(cmdline);
> > > > > > > +
> > > > > > > +     igt_require_f(strstr(buffer, "resume="),
> > > > > > > +                   "Kernel does not have 'resume' parameter configured for hibernation.\n");
> > > > > > > +}
> > > > > >
> > > > > > we should probably have this in the igt_pm lib to be used in other places
> > > > > > like xe_pm. I remember we had discussions when s4 started failing in CI,
> > > > > > but apparently the solution was to make CI to work with it instead of
> > > > > > protecting our s4 tests...
> > > > >
> > > > > I was last week talking with Jari Tahvanainen about this. Our ci is
> > > > > not configured for the machines really hibernating, he suggested we
> > > > > first start with one test, start to run it in special box, and we go
> > > > > on from there .. so, here we are :)
> > > > > I agree final destination for this function should be in lib/ like in
> > > > > igt_pm or so.
> > > > >
> > > > > >
> > > > > > > +
> > > > > > > +static void set_rtc_wake_timer(int seconds)
> > > > > > > +{
> > > > > > > +     char command[256];
> > > > > > > +
> > > > > > > +     snprintf(command, sizeof(command), RTC_WAKE_CMD, seconds);
> > > > > > > +
> > > > > > > +     igt_require_f(system(command) == 0,
> > > > > > > +                   "Failed to set RTC wake timer.\n");
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void hibernate_system(void)
> > > > > > > +{
> > > > > > > +     int fd;
> > > > > > > +
> > > > > > > +     fd = open(SYS_POWER_STATE, O_WRONLY);
> > > > > > > +     igt_require_f(fd > 0, "Failed to open /sys/power/state");
> > > > > > > +
> > > > > > > +     if (write(fd, "disk", 4) != 4) {
> > > > > > > +             close(fd);
> > > > > > > +             igt_require_f(0, "Failed to write 'disk' to /sys/power/state");
> > > > > > > +     }
> > > > > > > +     close(fd);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void ensure_grub_boots_same_kernel(void)
> > > > > >
> > > > > > I don't believe that this should be to the test case to ensure.
> > > > > > This should be ensured by the infra to support these s4 testcases.
> > > > >
> > > > > This is bit so-so. If guys would run this test on their own boxes to
> > > > > do some debugging, forgetting to always set the correct kernel for the
> > > > > next in-test reboot would cause incorrect results.
> > > > >
> > > > > >
> > > > > > > +{
> > > > > > > +     char cmdline[1024];
> > > > > > > +     char current_kernel[256];
> > > > > > > +     char last_menuentry[512] = "";
> > > > > > > +     char grub_entry[512];
> > > > > > > +     char command[1024];
> > > > > > > +     FILE *cmdline_file, *grub_cfg;
> > > > > > > +     char line[1024];
> > > > > > > +     bool kernel_found = false;
> > > > > > > +     char *kernel_arg;
> > > > > > > +     char *kernel_end;
> > > > > > > +
> > > > > > > +     /* Read /proc/cmdline to get the current kernel image */
> > > > > > > +     cmdline_file = fopen(PROC_CMDLINE, "r");
> > > > > > > +     igt_require_f(cmdline_file, "Failed to open /proc/cmdline");
> > > > > > > +
> > > > > > > +     if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
> > > > > > > +             fclose(cmdline_file);
> > > > > > > +             igt_require_f(0, "Failed to read /proc/cmdline");
> > > > > > > +     }
> > > > > > > +     fclose(cmdline_file);
> > > > > > > +
> > > > > > > +     /* Parse the kernel image from cmdline */
> > > > > > > +     kernel_arg = strstr(cmdline, "BOOT_IMAGE=");
> > > > > > > +     igt_require_f(kernel_arg, "BOOT_IMAGE= not found in /proc/cmdline\n");
> > > > > > > +
> > > > > > > +     kernel_arg += strlen("BOOT_IMAGE=");
> > > > > > > +     kernel_end = strchr(kernel_arg, ' ');
> > > > > > > +
> > > > > > > +     if (!kernel_end)
> > > > > > > +             kernel_end = kernel_arg + strlen(kernel_arg);
> > > > > > > +
> > > > > > > +     snprintf(current_kernel, sizeof(current_kernel), "%.*s",
> > > > > > > +              (int)(kernel_end - kernel_arg), kernel_arg);
> > > > > > > +     igt_debug("Current kernel image: %s\n", current_kernel);
> > > > > > > +
> > > > > > > +     /* Open GRUB config file to find matching entry */
> > > > > > > +     grub_cfg = fopen(GRUB_CFG_PATH, "r");
> > > > > > > +     igt_require_f(grub_cfg, "Failed to open GRUB configuration file");
> > > > > > > +
> > > > > > > +
> > > > > > > +     while (fgets(line, sizeof(line), grub_cfg)) {
> > > > > > > +             /* Check if the line contains a menuentry */
> > > > > > > +             if (strstr(line, "menuentry")) {
> > > > > > > +             /* Store the menuentry line */
> > > > > > > +                     char *start = strchr(line, '\'');
> > > > > > > +                     char *end = start ? strchr(start + 1, '\'') : NULL;
> > > > > > > +
> > > > > > > +                     if (start && end) {
> > > > > > > +                             snprintf(last_menuentry,
> > > > > > > +                                      sizeof(last_menuentry),
> > > > > > > +                                      "%.*s", (int)(end - start - 1),
> > > > > > > +                                      start + 1);
> > > > > > > +                     }
> > > > > > > +             }
> > > > > > > +
> > > > > > > +             /* Check if the current line contains the kernel */
> > > > > > > +             if (strstr(line, current_kernel)) {
> > > > > > > +                     /* Use the last seen menuentry as the match */
> > > > > > > +                     snprintf(grub_entry, sizeof(grub_entry), "%s",
> > > > > > > +                              last_menuentry);
> > > > > > > +                     kernel_found = true;
> > > > > > > +                     break;
> > > > > > > +             }
> > > > > > > +     }
> > > > > > > +
> > > > > > > +     fclose(grub_cfg);
> > > > > > > +
> > > > > > > +     igt_require_f(kernel_found, "Failed to find matching GRUB entry for kernel: %s\n",
> > > > > > > +                   current_kernel);
> > > > > > > +
> > > > > > > +     /* Set the GRUB boot target using grub-reboot */
> > > > > > > +     snprintf(command, sizeof(command), "grub-reboot \"%s\"", grub_entry);
> > > > > > > +     igt_require_f(system(command) == 0, "Failed to set GRUB boot target to: %s\n",
> > > > > > > +                   grub_entry);
> > > > > > > +
> > > > > > > +     igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n",
> > > > > > > +               current_kernel, grub_entry);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void hibernate_autoresume(int resume_delay)
> > > > > > > +{
> > > > > > > +     check_hibernation_support();
> > > > > > > +     set_rtc_wake_timer(resume_delay);
> > > > > > > +     ensure_grub_boots_same_kernel();
> > > > > > > +     hibernate_system();
> > > > > > > +}
> > > > > > > +
> > > > > > >  static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
> > > > > > >  {
> > > > > > >       int i;
> > > > > > > @@ -839,8 +988,11 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
> > > > > > >
> > > > > > >       if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
> > > > > > >               if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED) {
> > > > > > > -                     igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > > > > > > -                                                   SUSPEND_TEST_NONE);
> > > > > > > +                     if (data->do_hibernate)
> > > > > > > +                             hibernate_autoresume(30);
> > > > > > > +                     else
> > > > > > > +                             igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > > > > > > +                                                           SUSPEND_TEST_NONE);
> > > > > > >
> > > > > > >                       /* on resume check flat ccs is still compressed */
> > > > > > >                       if (is_xe_device(data->drm_fd) &&
> > > > > > > @@ -1044,6 +1196,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
> > > > > > >               data->user_seed = true;
> > > > > > >               data->seed = strtoul(optarg, NULL, 0);
> > > > > > >               break;
> > > > > > > +     case 'r':
> > > > > > > +             data->do_hibernate = true;
> > > > > > > +             break;
> > > > > > >       default:
> > > > > > >               return IGT_OPT_HANDLER_ERROR;
> > > > > > >       }
> > > > > > > @@ -1056,9 +1211,10 @@ static data_t data;
> > > > > > >  static const char *help_str =
> > > > > > >  "  -c\t\tCheck the presence of compression meta-data\n"
> > > > > > >  "  -s <seed>\tSeed for random number generator\n"
> > > > > > > +"  -r\t\tOn suspend test do full hibernate with reboot\n"
> > > > > > >  ;
> > > > > > >
> > > > > > > -igt_main_args("cs:", NULL, help_str, opt_handler, &data)
> > > > > > > +igt_main_args("csr:", NULL, help_str, opt_handler, &data)
> > > > > > >  {
> > > > > > >       igt_fixture {
> > > > > > >               data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> > > > > > > --
> > > > > > > 2.45.2
> > > > > > >
