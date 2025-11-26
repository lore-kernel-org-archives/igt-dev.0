Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4DAD10F22
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 10:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6528210E565;
	Wed, 26 Nov 2025 10:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c71ZZKJl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCE310E5A4
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764152926; x=1795688926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BjgBURpphUtLLhDtd+WlRjmD8s1B4eSvK3ZOqeX3tG4=;
 b=c71ZZKJl80xvbMdfl4i9wlZyev7hOW9IzfN4pS8rGpggoONtLKEOo3PT
 tZATM4sTzeYVpGUd2T4agMiPi7P7t18QVhJx430L7+c0RvAZJGPiwUBnC
 pxKBfpBltDzEs5x2eqIYwEbbvG0vJ4ZQ/4P5eO8AvLZby6oxsnRTM8Dmv
 6T7BvKJB4dBijOSj2Z098Njh/WTYPXMOGz5CV/vMJeyXkrukFrf/68iEb
 jKKZcFzeHqKABxdJavctKIETBOQxoZT106FYF8Sj/c8g4ZlABbzOD+bzH
 Z/GurxOnlOpBTgAenda4Uq6XWIzoVm3lthCadfnto0rWHfd9CGYX8vaH4 Q==;
X-CSE-ConnectionGUID: Vg4iiLkiTiyy5Tv8io59lQ==
X-CSE-MsgGUID: wnzmM952RPuLtiYg+PD03Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="91673475"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="91673475"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:28:46 -0800
X-CSE-ConnectionGUID: USCdZwlBQASeUlkpJ4Ub1g==
X-CSE-MsgGUID: X6u8cZA2TxinBu/q4cxlWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192695965"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:28:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:28:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 02:28:45 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:28:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ej7lB6ImZgeE96ZF6R+9js/AoVM2t+rXOKp780dOo1wuI1FRJWyryQb+wIj5YQE87ZbnCryoz4mp8EH243mMw0lFsEZ3EFAc7tKagvWblPHomHQDEFyJ5eLADhnYA1zmMBiUHGYZ5AWOJXA/ebXaRIl7RFNwG8jD/YwLa2dsZxkpw7xjMqf5LbYkNumSjAikuqO94q0l0fOw8XQ/nqHJ0QSRBCwdZibY+gCjPhA3c3lhe1YvEvknpwRoymTdvCJagDv1oFbRrkccMTEGn6QtVCUtRH7IRRaJYxEmQae6HHNuwNwJJrRz7x3Q1o4E4dHSsdaN+LdyusgH7EeLHEYolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/Fl6h+S+CQ9p1Wb7SxPr3ceUI4ER/ZPgVEiGN3Emy8=;
 b=k3Ti/w7PZmGBNCl4gpUmdo95BHFhMC3L0yS/4QxWKhOls8vwyuvjljafv+JBaGzWexx2rEfsvbA9nG+8V9ys36ROO+AVdcz6AU716CzJJHEIwJ0krSe3uGfKrIWNfwU55n21Qvo1XUxxPFumVS3fJcrsY5DBffVv204uRz8fQst+6LFVDLc5iTMz8ICkeWLNK0/FtOVJYcE77y8znj/XRTLCvAvOQ9GkEaZmVtXkQlS7ljL4HXfttVVSLQAtKu6qOO1iTErtSM2Azo4w7OYQOJxkYNT3El84xo1jA57RrSKS629Garo2Jw3Z79XY213jR4LdYozaeMmnz4z+fWWTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 10:28:42 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 10:28:42 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Peter
 Senna Tschudin" <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 2/5] lib/debugfs: Add debugfs helpers to open tile directory
Date: Wed, 26 Nov 2025 11:28:24 +0100
Message-ID: <20251126102827.47844-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126102827.47844-1-piotr.piorkowski@intel.com>
References: <20251126102827.47844-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 9549b20d-6131-4b63-b1ee-08de2cd69236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1ErUkVFbTUvdjc2MncyM0dCL2poMlVYUUorZlRkWkZBZWdlK0d0MXFmdWpI?=
 =?utf-8?B?NGNuVHRud3E2NUptb0F1RTFnaktHOHJrQlZSL290YnZCNXBmVHVGU1BTNWJz?=
 =?utf-8?B?SHd2akpIRUoveHBkUmJQakJ4NWYrZ3Q1RUh2RU9Ub0tNc2ZZRHhPaE5sQkVM?=
 =?utf-8?B?SXdoWnNsQzdTa2xhVG0vMmc0UXdqblJVZGJ3Qk1aVEVTb1U2SVVBdXJXU1Y1?=
 =?utf-8?B?cEtoKzVqWWpOVjF3TkNhWHRic2JGZkJiUWtNbndqczJDMjRpb0JYNTl3WG5Z?=
 =?utf-8?B?ODJxTkhpR29IQTNnOFV0TWZQQ3pVM1o0QTRPSFVDOWxUUFAySFlneHY4MlB6?=
 =?utf-8?B?blFXYysxNXcwcytIMlRBYVBvb0dJS05uT3FZKzRsN1dRUDV2N05sZG5WRDlr?=
 =?utf-8?B?VFk0clZia29WYkFtblVQV2U4RHlWUDNEcko0bk82cThHWVIrenY2VkNabTAy?=
 =?utf-8?B?cng0R09lS3dnNmUyUXUvOEdhSEZERWpUa3V0MUF0eWtnL2N6Wmxmc0wwUE1J?=
 =?utf-8?B?SVE1bzJkZXQ2T1I4Y1MvcksvckNCWE5lUGo2M0hPZHRjNDJ0TFYvcVU2NzZ0?=
 =?utf-8?B?b0ltb3pWSnNrenVTTi9TRWVzZ3k0bm03czNhR0wzczVGSGdVbldqSDYwWHQr?=
 =?utf-8?B?aE5zSWg2dTZma1NCd1N6TEQ3emZ3RmN1WWdVQndqVUkwcVM3bVBFWXBwSHpU?=
 =?utf-8?B?ZlNNdWswNkIxcjZ3aExCWjlpbU5TOTYwYVkyNEpYZmtBeEFXVmoxWlBiTWxi?=
 =?utf-8?B?dGxraDI1THVLSllzLy9mWWZMajU0ODBaK2p0cHEvT3Bab0hISHE1VHFGQWEy?=
 =?utf-8?B?YTlyei8xU2J3UDZNNElsU3NSMGloVGlieDgrVkZSYlFiYmlIUTdHOFRRQU5m?=
 =?utf-8?B?ZHBRVDYzZFRPYWY2cHhOalBTQTMwQ0xjMGJqdUxHb0hEWGF6REw1bk9TUzBL?=
 =?utf-8?B?UHluMXJFeE9BTjRROUtQb3VDVXZ5S0p1dHpXVWdSOFJsUHpXVjJ1WnBES0Ur?=
 =?utf-8?B?RHBLUDdHRG0yTitEdk1jL2NjQVJ0TTdQeDMvbmNscytqYm1MUE01dmJvTUti?=
 =?utf-8?B?Z3o2eTBxT0dxeUdnWk1VNEI5Z04zL1ZkV3FxRnFOL00vY0hhek9DTHhRb25m?=
 =?utf-8?B?Vit5blcyYmw3dDZvK2Fnd1Z1MTlLWlNsRGpGOEgreStjaUcvMWVsMVdXcldN?=
 =?utf-8?B?ZmZxU05UaTJyMCtLV2JQbHJlcWdIbnVIOGdrVVhPRGRBeHBPRm14THdOZ2lH?=
 =?utf-8?B?T1U1alBwVnlBUEovS2xnOE9lTzNuelZhbzd0WkJISGc0RW5pWEFHMk9PSVBz?=
 =?utf-8?B?dXFzc091WjRhdjFaNVc4OTk2N3crbnl1Nno0U0I1T0xwdlBlYmVWRVNNY2ly?=
 =?utf-8?B?RFFxaWFJa0IzaEZCdXdzL2wrVEszZ0wvVWFsTktMM2Q3WlM2dENvVGlYdFMw?=
 =?utf-8?B?eDRXb25ONmZLMm1JWHBEVDR2RDkzaXJQVU9jWnlHajQyeCt5MFNhNE5mNG5s?=
 =?utf-8?B?QTF0S2d4M1lSRlg2cU9YSmsrcE5NZDQrbTRkUHo0NWFsUEZndW82WlQ4alhE?=
 =?utf-8?B?amVnVjFHUVNCWE55TlMrcSt5Rm13MUM3MVlZVmJJSzJiU1pyMTZOVjgvZDdW?=
 =?utf-8?B?QUc2RE1pRS92bitienNWcFA1dFJQRHRpV3FUNTNEK08vcGpvTmRzZnVQSGVm?=
 =?utf-8?B?TmY3eXRGWVdYVnlDTTJibUFWWW9BQkwzVVhRa3I5M2RjeXd2SXorZlFPWllq?=
 =?utf-8?B?RVZOamQxck9waVNCczRzZUFQR0JtaTFsaHlVNVBnTWhJNlBSajBIcDZVbFJz?=
 =?utf-8?B?TWFaRm0xZ2hTeWE1RHI4UzV3UWRjc0I0Yzhqalo5d09uSi9IQ0FqanRSa1dz?=
 =?utf-8?B?SVVPSWFsUUZHaU1RSk44aFIrK3lUYUlVVXdia1FFdFhPb2JwcUFMazVNTjVJ?=
 =?utf-8?Q?H1XSsjOQ9d1D8sqiSdq36qb9AIpSmujr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHRQMWhWQ1J3QkUwVUtsYy84OGV3TTB2Uk1obzR5M2xRMldPVnJZZEZocWdx?=
 =?utf-8?B?R1VLalptSTl5dWFjZFJSamFTT29kSHVxZElNSGFSbmxmTWRpaWxMbTRhMGhv?=
 =?utf-8?B?NlV4VUhyZEJtcEtsTnFRSGQ2bDRqUVB3Ykd1Yy9qS0FUdlg5M2FhUlViWHQz?=
 =?utf-8?B?R0ZPV2dHRGNyQW9jTSszOWVPYWlnTWdWOU9ucFRHWC9HQnhlMm5UM1FBcDFJ?=
 =?utf-8?B?QW44bVBLVFhNeVBQdFlIU3hiK1hadVlLYjRmcFdSNEpiK1FIR2pjNzNIVXJ2?=
 =?utf-8?B?RXpXZ283YXlPWVk0dVFTUXJGUUgwU3RqSWJ1RFlwSW55cmprUXJrZTJrK3Zj?=
 =?utf-8?B?NGt5ODRidkt0TUtXRHBzQlY1eGl1VWl4a1RBdDEwN0VpNE1hUitvN01qMmd2?=
 =?utf-8?B?ZysxQlIrVzh1ZkVOd2pKRUgwWUZKZmxuU002c2tyNnpxYjYweEFnYnZZQis3?=
 =?utf-8?B?M05vU2lCNDU2cENqV0pwTElCcHBVT2F5d25WeWlyUHNxRjNKNEdnUlFXSjZa?=
 =?utf-8?B?Vk5xek9KQ2NRWit2NjljbDdWU3h3ems2d0ttVG82b2oyTnFVNjEyNUo4ZVBO?=
 =?utf-8?B?NlBWYnk0K3VJa2tHL0RGUG5PamZpMzVRUUZRcUdCTEVaRWRUOUlpNndNUDQx?=
 =?utf-8?B?cFg1NWlQaVIrMFdkZ0JmVnRRanlnMVM5dnd3Wm0wajRPYjlFRDhac0hjdklk?=
 =?utf-8?B?dEhpYXBkZzlXSzEzbGwwd2NhUFpxbXVqa2ZlR0tsU2tWdTEvZ0NwMi91NS9j?=
 =?utf-8?B?YlZ1RXpaTTBWNEZ4MURZRk1NeXROeHZTV0o0VVM1ZnZ3enF1ME03dmI4U1Fi?=
 =?utf-8?B?QVlTdlV0RTRndCt0NDFlNlprakd1Z1VHV0tpZU5mSXJIcWJFNjN2WjB2TjJl?=
 =?utf-8?B?Q0NzZjFkaG5hOWttc2NrYWVBd3U4b2ZXTlErY3hIRTlGWU16K1ZzV29kazZx?=
 =?utf-8?B?NGsxdXBycUsvMGFyUk5pR3NQQXdWOVNOcXVOY00zOEZQSUIwOFQxZGloS09x?=
 =?utf-8?B?VHJtTTJzaUVaT0t1dnlVWGczREdLVHB1czEzelUxMnlhQUllWDdVTXJOTUtZ?=
 =?utf-8?B?azU1d2FIaFdBck1OK21uWTFKRlpPRFV5U0tuWmJiOEREay9UU0JFSzcyUFgy?=
 =?utf-8?B?WFd4NzlDdGszZG5iK0ZhTUR6aFhNUXpOZEdFbzVvVy8wZ25YZXQvTThvcWJQ?=
 =?utf-8?B?QWFZb0FDMkFzV0YxTy91N29hYm1OVlh6VzJseTlRNzZqUW5hcFZ3TzJJMllF?=
 =?utf-8?B?V3laeGo3SGJsSU1IU1B4elV3TXpPLzJKUG1GRFp3bkNjQU44THlCS1lyU0pU?=
 =?utf-8?B?WXp6WWpiUmN4VHZxcWk1SWthSXhDSmJhbGNCY0ZpZFJQQ3lSdUQvbFlNRExF?=
 =?utf-8?B?WXh0bEhsZ1BneGIwSGZsckF0SzR3NWR6MjczZ0ZNRFZQMTV1UHRvN2VKL3li?=
 =?utf-8?B?ZWhiOGk5WFNWbi9FYnJjY2xVTjlyZTZMNFU0Ykl3cGUyN01uZlk2dmdPVzZw?=
 =?utf-8?B?eG1LbGVHMXBiTEtCaFJydkczVHRGQmJhdTBUa01PZGlKdFBtbWZuWVlQQmVI?=
 =?utf-8?B?OEh2MG44a2Z5SGMzQ0U1ZTJsY1JFWFBVMTVnSEd4RnBrYTZFYVhFZWFqbldW?=
 =?utf-8?B?Z29ia0xyaTVsZHBWbTNraTV2RklGYTl5QnBYdmN5YmRGQkdUck1KUVErZElB?=
 =?utf-8?B?ejNOTVdYM3RQc1JPaFZmM3dDU0t6eC9sdU9PM0FRRVZaUHJkMkt6NEx3QnA0?=
 =?utf-8?B?ZzVFVXNaOWltbUNUR0w1Q3ZKakJzZGk1S3JxaGZxbjVERDdpR2oySEpDakRU?=
 =?utf-8?B?RnpoRlZvUlVnbmFoZEdPQStQRjFncTdlNmExYlcyRFozS3kySzZZeDRTbGgz?=
 =?utf-8?B?VnpCRHo3OHVGR01teDNLN0l6NUQ1NFIwS3pEYzlYeGJuRXBNRkNoajFEZ2t2?=
 =?utf-8?B?SzgxMVRFOHdTNjc5MnQrZEFRY0FHVks1bmtvTlpJZlFYYmJwTjZFRFZ5QkR3?=
 =?utf-8?B?TFY2V1pMdzZGYmU2cmpFNVIwUUF3L2NXekVFN3Y3Nm9wcnhQUkRXNkduYTZm?=
 =?utf-8?B?aEtmb0UvZlVubWF3YkoxSHI4UzZ4SFNpTE5uMFdrWVE3Lys5NXhLNFk4RHBS?=
 =?utf-8?B?RWZBWWExRjBMUDNTamNUTkVmclE2SWJnV3FmNXZSZDcxSi9CS0pUY3BPZXVl?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9549b20d-6131-4b63-b1ee-08de2cd69236
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 10:28:42.2018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LrWzi5Up7RX5za8XBpQSL9gwW9x6fCchcea2RAIuED4ixCURsDi4uKE9kGErPQZ3IHWQz74zokBjskoo9bnnbDWrydrBtDBdLy+h0p1n/OE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's add igt_debugfs_tile_dir to open the debugfs directory
corresponding to a given tile index.

v2:
 - rewrite use of snprintf (Marcin)
v3:
 - fix assert (Marcin)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_debugfs.c | 31 +++++++++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 210a9cea0d..40b719545e 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -226,6 +226,37 @@ int igt_debugfs_gt_dir(int device, unsigned int gt)
 	return debugfs_gt_dir_fd;
 }
 
+/**
+ * igt_debugfs_tile_dir:
+ * @device: fd of the device
+ * @tile: tile index
+ *
+ * This opens the debugfs directory corresponding to tile for use
+ * with igt_sysfs_get() and related functions.
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_debugfs_tile_dir(int device, uint8_t tile)
+{
+	int debugfs_tile_dir_fd;
+	char path[PATH_MAX];
+	size_t len;
+	int ret;
+
+	if (!igt_debugfs_path(device, path, sizeof(path)))
+		return -1;
+
+	len = strlen(path);
+	ret = snprintf(path + len, sizeof(path) - len, "/tile%u", tile);
+	igt_assert(ret >= 0 && (size_t)ret < sizeof(path) - len);
+
+	debugfs_tile_dir_fd = open(path, O_RDONLY);
+	igt_debug_on_f(debugfs_tile_dir_fd < 0, "path: %s\n", path);
+
+	return debugfs_tile_dir_fd;
+}
+
 /**
  * igt_debugfs_connector_dir:
  * @device: fd of the device
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index f4044d5458..76dbff3e8e 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -49,6 +49,7 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 int igt_debugfs_gt_dir(int device, unsigned int gt);
 int igt_debugfs_gt_open(int device, unsigned int gt, const char *filename,
 			int mode);
+int igt_debugfs_tile_dir(int device, uint8_t tile);
 
 /**
  * igt_debugfs_read:
-- 
2.34.1

