Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B772E9A02C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 17:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1086610E02B;
	Wed, 18 Feb 2026 17:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkVzQi7G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702A310E28A;
 Wed, 18 Feb 2026 17:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771435308; x=1802971308;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sD9Leh+4opaCUV6K0TlRzHYNVCvTxPN86eTT1MjeteQ=;
 b=MkVzQi7GQk21U4Tb3aFPA4bU4uRfYx/6LTGNRyHZ839OA6ZzGKn6xjro
 oZfzUSd/0g+Sals4qS4LGrMMpKqILsjvtuCU5u6eV17pigrn8DudZ3uxQ
 pzcciXWp2kkTnAn6j2QQxbE0yFtG6t77K8qprNPZBC5M/PhGX2UplrkYs
 dPBFfLctkuK0neLPdtg8F6nHjXsV3rL+xFIzox5WJEdTmN0gZrd7UIKSb
 wLobA+ow1nC/ZWhehx/bcspOTIGCoF2yzvC3t6mxYZSyaWif0VbZolwyT
 2GRt0K2GBmM2FBSk0dmVwU5DF5D4rh1i+D/YDHGLBnclMuvP4jFQ7Pd4q A==;
X-CSE-ConnectionGUID: cLO7/xzKRNmE4+wy0DN1YA==
X-CSE-MsgGUID: cw5WNxycQB28YAzk4kZghQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72559988"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72559988"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 09:21:30 -0800
X-CSE-ConnectionGUID: vV6MQeYrQ3yK3S9VqS3CvA==
X-CSE-MsgGUID: +5Kg4ASrTReKSDZQE3PSvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="214257873"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 09:21:29 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 09:21:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 09:21:28 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 09:21:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOiOaqoQLymU8X+o+1qoATa4Nczk/G6tFAU8ON8WHw3TouZ/gnnHpPJNOMCs+Mpr31X/VlPbzzqgnpxKlJLjskiy/r6yMOQ0t2K8tOTaTYFvVz7O7Ha8JTmbBUKShmUW9H3uxspGMM7DMRAm4x5BqF4ZbAsq11Eu7oj8vhid2U2CPUKieDk7lgtghq3RpPFmxXNQ7lXPubq69pTL4Mr1+vYnHf/Nswo6sTh2RBQc31uHoe2zBVbioyoAGJTxGD8iVhWPzT7lk4OSXl/0z2Hq0ZR4ViFlVPi9onVan8gsnf65ClvKkURPIPjWTiEtArd2GcTx7VQugTctIAIrvNnBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jnx7OMPC7N4unbYlrRUW01R6Cw0pyiqjIEGgiMC3ig=;
 b=VOGoHazF6Hq2UjoYf/ZtNRTMCsWSEJ27AYapRQhXB24X9bL39mmWWX8+dLyAIK2v1DTBGGsrZJdqHUUZJxuJS5/tforiXoYZFsQUQLob/1wcsYjFMO9LE9IDlyErFCq2WzYHaMh8ZjJYfTH/qEkDsQjPDjtTFZFsPj8KWWeC2TuEmhdCrNeFUdrM+1PYOQFMI5A7U8y0u7rZSMPSl4GPB1y3dMZ7GrWCRITmCU3tzOvt78gBwziymHOCQGxrwh2f5FlnKzFZn241vP1DuvXi50w+cUmqKmOq+94FH1zkEH6xs/F+4gikbEFj5kZT9zCQmkRM8lBk7BNcK58dekxr/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by PH7PR11MB7124.namprd11.prod.outlook.com (2603:10b6:510:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 17:21:23 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 17:21:23 +0000
Date: Wed, 18 Feb 2026 18:21:18 +0100
From: Jan Maslak <jan.maslak@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <I915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 lib/gpgpu_shader: set r1.4 to dim.x
Message-ID: <aZX1Dqc7ZZk7BohN@ART-DEV-395>
References: <20260210102416.2796291-1-jan.maslak@intel.com>
 <177076424856.244253.1262359808685841289@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177076424856.244253.1262359808685841289@a3b018990fe9>
X-ClientProxiedBy: DUZP191CA0036.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::28) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|PH7PR11MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: ef58bc0c-04c4-497e-3ffe-08de6f1223b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDlaY29NQkpZMWM2Y1ArUXRyQnZyVVVJMnFEQmNqeGZWd1JnSHpNMVYrU1ZP?=
 =?utf-8?B?K2poOXI5TDBudVlGc0tmQU1LSlB2WHVwb2QrVkZYZGdrT3dTVTZVeHV3bGto?=
 =?utf-8?B?RWNjajhnM0MxaHlWeVdhMnptNWpJQlNCbGh0ZVVFOWtjS3VPWkJ5T3BzM2o4?=
 =?utf-8?B?OG1Yc0VoT0xDVlhyaWNYQ2hpNkhYSUlJWHNvcmRzNVFKc3NxQTUxMnY2ZWRa?=
 =?utf-8?B?WXBJcHdGQk1ldFNFbC92U3lGdWZnZ2FWSGFFQXFSZW1hbldzc0daa0Mvc3pw?=
 =?utf-8?B?Wk56TUEzMUkzdGx0dXhLUW5BVDVaTWpRcGhyODhrMzlwOVprZ3NlZHd6THVF?=
 =?utf-8?B?a0ZmRFYzcy9VQkYzUGNVaWNtaU9VU2k5TkZmNVN4MGE5dXFOUEZnV3Q2SkRX?=
 =?utf-8?B?a3RTdFBrOFU5T1ptMU9xazlyZjJpWHRhZzVYQlppaGRBU2g3OTdQVFBEZXhU?=
 =?utf-8?B?dUl3dHREakdBTEpGdzFYVXFMUVhVcGp5ejNncHRWMzJJc3ZMcHYvT2NHVGRD?=
 =?utf-8?B?M1JDRmZQQkN6QmhITnYyMENRdWE1UFRCeFdEck1FcCtKeWY3OHFRaWpmKzFR?=
 =?utf-8?B?SkwvQlZnOUhNUUtWWkloemhySVB2SWhZRWtoQSsxUVJuZEV3TVlVZjYvdno5?=
 =?utf-8?B?eVBWdzNKNkcxdzMwcDN1UENCTStYNEV4alVQaWswc1lJU21CeDRoNDZQemdy?=
 =?utf-8?B?N0JOSzY2c0VteHFoSDdBMXZwcTNmUFh1MnIwV2hVSm1EYzdEWDJaWGFjekFT?=
 =?utf-8?B?Z3F4d0hpcjRRNk9XLzdnM1AyMXQyVkw0ZjRVVjh6cCtWT2tYbnRZaTc5S0FT?=
 =?utf-8?B?UnpGYTJPdVFTcDFzWks4dGxkcVhtOWZTblVhWEVZaXpHMTRsd0RnNW9HK3ov?=
 =?utf-8?B?bWlBMHlCYkhzejMvaEJBZk5iZ0hMSUhNbnFhUXBvZkc4ejc3VVZtRU95NjdI?=
 =?utf-8?B?KzRyN05jT21UK01WZXdKbWNpd2lpemgzbmJYZ0dNQTZtNlFKUHZhYkVOTCtX?=
 =?utf-8?B?djloK3lML3hYQVUrdUp4SjBNWnVXYmJpZno4Umpjb3p0Q3hvS1BKL09peUJp?=
 =?utf-8?B?QmNCeU1IS0phb3pDQTcrTGZrSjcycjNwRm0rODhMQzJRNTZvMERuVFVRMlh2?=
 =?utf-8?B?Z0ZMY2ZkRUpxWWdlUy9tRWZ5Tmh2R2xwbHgyR2pEa09tS2UwRXdMZlRYbHAv?=
 =?utf-8?B?S0xzTHFpaWtNd2dPWnQyQUNmU1VrYWNweWFjU0pPOUQrZmx3ME9VRWtsVDBL?=
 =?utf-8?B?TjRlR2h5TUROcEl1bzNtQndldDlwUGZGb1FvZDZXRVBUWHNmVnpZYTZmZWRm?=
 =?utf-8?B?am1VVHFraTBEMVNBa1pxVlVyWURPSHZjTGVWVVRXdmwrM0hNU2I1VGFCQVVK?=
 =?utf-8?B?T1ZteW9CRDNvNXd6eW9OeVVRMWpYY1FQd003OFVCQzVOM2kxM3BQRXlYL3Y5?=
 =?utf-8?B?U1pCSTRyMWE0b3BQS05nOGMreDd2QWI1N0U5eG00MWlDdXpqakpyandUZXFv?=
 =?utf-8?B?VkRJc3REOVFpdDdjUzhGWGt3SE1qeTlXMFFjR1hQS2NsRTIyL3RsSHRrazY3?=
 =?utf-8?B?dmZmVUlZblBRbW53Z2dEaGhEQXpSa0xLMFNpOXFRRFJjVXRBaHJQWmFRK3Bm?=
 =?utf-8?B?UlYrQXgyNVNLbWFCWWd1aFFVcDVzUlRxSXdESmRoU3NJWFR1bFRlZ0k0aEo5?=
 =?utf-8?B?cysxS0c5djZHNGhyMko4NEdQOUxITFh3Q0pXNTNsa25tYnVmNVJUMFN1eUE2?=
 =?utf-8?B?aVlXa1VMVjZDbXUyTDYvOHFabGxpTnZ6REdSU0p0L0RHMFBHU3QwQ29JV0RV?=
 =?utf-8?B?dndSWm5zTjB2VnNpTU9FWVVxUjJ4TVB1NDNJRXVSWUdYU0VtK3AyWUxacG1S?=
 =?utf-8?B?TitWWDZjMEtTcXhPMTBWRStUd1RzbEZIYmNKaTRxSzFnRE5vM2NEQ2sxMkEy?=
 =?utf-8?B?OHBxOTV5ZFlacmFSYjU4emdlZDZVUndlK1pnRGZyekwzT21ldlR1N3pWN0F6?=
 =?utf-8?B?ZGlhSG9waHhmc0RmRmJZSlFnTUZrUzhWN0pmdWthMnhqNExaa0FJNzdBeGQz?=
 =?utf-8?Q?kyge33?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDdHVlZYTWtKN3VNRXJhbVZOKys5ajdNV3gxOGVqOUFSRVg2SG5TTDZiNDFF?=
 =?utf-8?B?S0YxMFFhUjQ0Yiszc0tCZ2Q1aGlpd1FubElTOFgxN21NWWJFUzI4eEpDZGFr?=
 =?utf-8?B?c0VaODlPT3F3VXUxaEJFVGUrNnppUVc4VVM0NkQ5STh0ZzBqZmgvaVQwVzcz?=
 =?utf-8?B?dTgyWHNGNTFkL3UyZk1lbU1DdDArbzN0dTg1Y0ZFQlcvOHNZSWN6TEd5N2Ra?=
 =?utf-8?B?MTZhOXlDVGJ6RlJPUlE0U3Y5cjhnMm84MVlMT2d5aFlJZHlxSno5YnVCOWJu?=
 =?utf-8?B?dC8zT1JUeDN6SDVTYi9NY01kb2h4aTArMGl4SjdITmovSERlQS9JS2JzWlg3?=
 =?utf-8?B?bFJPOEloejhzd0xkVzN4alpNaHdMeFdmSW1yZ0oveEJTVWhGejNiYjBnUFhz?=
 =?utf-8?B?QzNYMVI5T0RsT3pwbDE1cWpCSEp0eVpKWUtNZ0NJZFlQUXZyTXphR0F4ZGJq?=
 =?utf-8?B?SlYrSllNWWVTVzVYTnZwOEtmbkFLakJRWDkvNkh3cXJSQVF5OUdiekczakVu?=
 =?utf-8?B?K0dQZkVzbkVMeVQwQXZrZ0ZMTWdlYld5SmVSd2tTZmlWZzRSODBRNlNHZmxI?=
 =?utf-8?B?K0MveUlrZ25RSEJwWXVramhBYWVqYVMvVThvL0Fhc0E5NEllMkhKb2VQd1dK?=
 =?utf-8?B?T3NybHBhZEhDKzJmSGpvYWFCeTJhcTBkc3pBUS90UEpCbW9RbVhKWTh2NXFK?=
 =?utf-8?B?cEdTNEw0ZW0xK05IYk9MaklSblRkcm5Ob0duSzBuSEIzaERuNDBpOEJGWkp3?=
 =?utf-8?B?VDJQVXYrN05CQXRyUUdqQzZ4VjZCQXhXdWY3aTVBRUpVZ09MSk4ySEZLYTYw?=
 =?utf-8?B?eEpCZ21tN2dNVjBHVUhGQnhqMVd6aUtNbk1oT2tDR2xtYjZLYVp0NFlmN1Ux?=
 =?utf-8?B?L0dwSUw3cTB4MDRPTkZhQ2lCTUErUkVXYnRnNGQzSTRKR1FWOEdLSDJUVUdD?=
 =?utf-8?B?UGx0SEphc01iSEhab09NaGFKQ0U5VnlSZ1lDVUhHV0VTL0xYNjE4MnZ2Nm9Q?=
 =?utf-8?B?VWRlRFlRTVA2SGxBNFZ4R1BGbnVFYTdpV3dyc1M1T0FzdGJPSCtpbnNWQTN0?=
 =?utf-8?B?aXJtaEU2N0ZnWjFndXR0VHJaMXJnWGUyL2xYTlV3ZDkzdWZwSnl3OG9KSjBw?=
 =?utf-8?B?N2tkWHJ4WmVxVys5VW9PbzBXRWhJbW9PT1NoZVMzVk55MzNNYlNIeWdqUEZw?=
 =?utf-8?B?S2YwRmVCQW5mTHBUUTkyNG5kV2NCWkxKU2FWV1l6d3dEazE5OUhxNnAwdm1Y?=
 =?utf-8?B?Smd6aXdsQWpLWnc5ZlNqVWlhSXZmNGFMSUtQMDJHYUlXZkdpODZWWFJ5V0JH?=
 =?utf-8?B?MWhSaloyTk1maHY5MmFBVFkwWDd5eWxGaitmZWROanI3aDUvOWVqbk5SQ3dv?=
 =?utf-8?B?aElNc0xRUi9iNHMzcmNtTnZlQ3ZUQjJJSVM0RDg0QmFUOTg5S1VBemxVdlZ2?=
 =?utf-8?B?T3VEd0E1VGVWcEZXMzYyalduNitteHBiRlVGaW9KeWhJZStGTkZRMjZ1d3Rw?=
 =?utf-8?B?QncyMHJzVTRqUGFXZTgwZEt2SmpXM0RsZmU3amVQMCtLSmxzTWNCRlFWSEM1?=
 =?utf-8?B?MGpRZ0NKMzJyQm1DaUNUQ1ZGVUY5QnZyejlORnI1M0U0L0Z5dVBLWkNvWlBF?=
 =?utf-8?B?SWdjNXpKdmtBY1NnVmpXVmxtUllwVTZ1eGdZeno2d3JyMlFUSGxXUy9FWHNF?=
 =?utf-8?B?QWdkaE9ORFNvOHU5SXdKZnRNVit2Z29sRjk2K0lYa3UzU3M2TjMzZEFGTkNy?=
 =?utf-8?B?b01yYUZLVTRmWE1ZalFoeG9OQXBmbHJhVUVIRk5kN0l6VDVpUDBWZHljbXpu?=
 =?utf-8?B?bURVcjR2V0hJc1BzUmw0eGhNYU1ZRTk2VldER3hBQ2NmUUxUSzBKM1NHbmEx?=
 =?utf-8?B?a08yWTBzVGpraVRISm5GYVpYd3JMQlpobUtMaGIxQjgyUHJXZGU3bU8zcWVw?=
 =?utf-8?B?L1IzYVlIU05ZeGxQUWwwR1RkS2VBMHl5UDhsREdOZFJLaStOOWRFNXFjMktE?=
 =?utf-8?B?MnlYVGxxTm1BVjQ5ZTRzNnNUQTFCWldjS05HemZ2TDFRa1NTVGV3dlFleFEw?=
 =?utf-8?B?ckdDM2EyZmJXdHlnZmRmVFJ0b3FBc1lEYTQ3Vnp4L044NGJhZkcxN0NGZG9t?=
 =?utf-8?B?eGd0YmNUbkdoM0RiUEJGZlNGZ2xXTUtZM0dtaCtlenkyalJMcTlUdVNjSDFn?=
 =?utf-8?B?MDdQOU4zQVV5Ky9mL1lIVWxaSys4UkNGRWZINnJpMFhGV1hYMjdIR2JpR0ti?=
 =?utf-8?B?VjZBcmkwTmorNUxMQTNoU01sbW5HZ2tHVVQ1OGJheHFGbjZVMUo2VGNxNUNs?=
 =?utf-8?B?cG9GbzN3eUFaalNJYmtuZTk3M0lDSjBNS1hKZnJtMzcwbFQvRXMyZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef58bc0c-04c4-497e-3ffe-08de6f1223b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 17:21:23.4058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLPYwafmc9c/l1QbyQSYN/WZZW0xkALdYX4VdIBOlERC/2lMtyLEBOhy9Km3RKe+cTR1FMwdqg3DpvLDN+cUjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7124
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

On Tue, Feb 10, 2026 at 10:57:28PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/gpgpu_shader: set r1.4 to dim.x
> URL   : https://patchwork.freedesktop.org/series/161427/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8746_FULL -> XEIGTPW_14528_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with XEIGTPW_14528_FULL need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14528_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14528_FULL:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][1] ([Intel XE#4141]) -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8746/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14528/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

My patch doesn’t affect upper test. The failure is not related to my patch.

