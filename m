Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AFCC2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 07:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F7410E3A4;
	Mon, 19 May 2025 07:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FaYlGWry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AB210E39F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 07:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747641448; x=1779177448;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DJk5ucFIDphoOyGrqrtXWvGb8Eq8WHwQzw7bgJpm63U=;
 b=FaYlGWry4E7oIMpfK7ZBojgqhUVqMFSRLAtuKoWLt1K/o3oJdqnSntue
 HquBwkvVKRbt1llxsMLwm/YxqRbojuZTV72HAnhemG41MVgTtLLfcz8Kw
 K/hklGeRSDJTVcuOkF9/JBLUIyOccYXSrNhXkGd0+2gmp91jN4GzpFrPI
 0vtj+DCjxNZ0/pG8GAM4re8EL11Cu83+9WCxlicq2ZZVxqBIFC9PgJYeT
 fxtpz9bswKoG1z22oTMGyWEEbhw1l7Zp1ccfEvxW7qGIfehdZGB1e9uQR
 zhMIgMGS9RRK9RsrbReGBF/KdjmbiCSpzpXGKE1tKTNm7aadxNurZyU/7 Q==;
X-CSE-ConnectionGUID: O1r/XKy8TXaAeFUBLykuZg==
X-CSE-MsgGUID: cv+XAP64Rf+oMYsoYuQWPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="67085622"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="67085622"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 00:57:16 -0700
X-CSE-ConnectionGUID: zGEazKCrQ02RORDI9yWbzQ==
X-CSE-MsgGUID: aO8iZ9iVQdqoGOdnlWCYHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139134739"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 00:57:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 00:57:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 00:57:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 00:57:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SC83R/lJHFgbFRN6aPOXQzSK0Z2YtymrJ9oSIIevZK840ql4p4VPteWymEMTLF6+AyZRaKCYRqoZ59U39DkUXgu29PArmcLIx6TiVTGswyRJuzMLHZRSORfWh8Rsqly9nTSwRZ9I5YnBm+pwhiYXGFVvujc7QGtbWQMdwKgpSKq4dueLzxEyayHmOwm3eAtF8B6FzzA/ODmbfulvdsUhbDTyuAKGLdBUKAsiG5w+xTiXjvYbAlYUWtL06O7LXibJOkmOtRZbeWHA7O5qDnLPH86g/xe+yjTyQvcpEEGyTr3h8el6FmfADqpfDtR8YEmGq4r59757jwPezKU+X9Ne/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSU5jqq3cATyGOzbCg4rRjaagkYNfnf+SMqV+u8ugJ8=;
 b=mh7kqGMOfDbGXxeMA8qsGuiMRtez75I7zn91EgAryByXXDEUAoZb3ZMSBU2gbbog2xQ/mNhRFMPmqcTI+tgut7BX9mJqxhQdpIJblXFFecw73Yqih+qL83DyZ6SZ+SxCAZoL+cNaFba0fsu5ErUBvHq17mJj6WdtOLZPrtvqi99FOFCt+WXtPcOxnzJ8r6UlU3gtpYCz36r9S7EnIpFLg+ppGCL9hFFL+7KBblFTr6Ktw5jLigBhkDiNcTci6j06eUiSMEbYX+WfBYTANp9V3GOm+d4Cms32eZ5X87SqNGZgpUDW/bmTDT1oxNUcrdk48G34NREFowLFpytzTNUyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 07:57:14 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 07:57:14 +0000
Date: Mon, 19 May 2025 09:57:10 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 03/15] tests/xe_spin_batch: change width and pitch
 to be in valid range
Message-ID: <aCrkVqJmUNIWKIiW@fdugast-desk>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-4-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513185811.897232-4-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB8PR09CA0016.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::29) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA0PR11MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 373d1d68-3e7a-48fc-d81c-08dd96aac453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1oyN3gvVTh0U2VFTHYrZ1QrVFVld3Vyajl2WklYSTVCQmN4cG4wbE9zY3Ew?=
 =?utf-8?B?Nmc5clpOK3Z6MVNTUzVLMkFTT3dqL3U2V0N0SnZOVGFwVUk0eXlOUWZHa3Fm?=
 =?utf-8?B?VUpPaXBRbjNVRFNCZnVDYWVJdUVmN1hqTnVxZ0tnZDdnQ0psN2NmLzFnUGpR?=
 =?utf-8?B?TCthWU9hZEJqcEJFL1poTHgyMXh2RWxDTUpHRDJVTXk4THc4TnhNVEZEa1hC?=
 =?utf-8?B?N2dmNmZVcXdzaDVMdlNaZG5YK3hVcjlLbU92RUs0bkFGN2YreDgyYjQ2akV0?=
 =?utf-8?B?QkVDaE03VVZkeGxDQlIxUVo5TFlvT3hkajdkR1hsR0JsRHB6ZDlHdWpmWUdR?=
 =?utf-8?B?NmluNUZpNnJjbzR3UWlhSDlKcm5CblhGTzZGa2RNQ1B1UTI0YnFWYzJmc1hx?=
 =?utf-8?B?L0Q3dDZ6NytFZGlaWXdHR1JWZjBEUldWYmxzWmRvOUJSZis5SnFMMXZGajQy?=
 =?utf-8?B?VllVY1ZPZHI0VnhLS3QvM3RMM3FMb0oyTFdyYVFyb29PdGg2bERpQXdQa2dW?=
 =?utf-8?B?UVpoL2lQa1FGK3ZOc0FDOVc1ckxwQXpUMU5pTGs3dGRaYzg3WkFRT1J6c0lX?=
 =?utf-8?B?MXBjYnoveGpsVFVacFVDQUx1eXNsM2crMmdPNWttZjhGZzRvcFNHa2lnUnpy?=
 =?utf-8?B?YndCaTc2NTdVbTg3dlg3Qy9FT09KS04xMXA3QmRnWGY4OU5sTDBBTUVDVllv?=
 =?utf-8?B?NlV5NXJlTnBwK3lJdjc3OHFYNHZOK0t1WUdMWm9yMGZPVzZ2Vy9VcW9ENWVr?=
 =?utf-8?B?dkgvZFpGT3pteldxNE1VZVVJREpPcHA0cFBMT0p2L3NkR2dWZGk3TlV4VFVn?=
 =?utf-8?B?T2NpbGdnL2FoYkd4ellaUWRFMThEQ0VaY1ZmNGxtZUluZU93VGN5SDhueVEv?=
 =?utf-8?B?Si9rY21iYU5pVHYrQmZqK0Z2NGNkL1JhZHZOaGF0TFZVRkdWNy83b28xSEV0?=
 =?utf-8?B?V2pTQUYwVy9BR2VGS25GKytoVUl3ZU1TZ2RmRWhGRHBjVFVvYUdwUTMrRDJU?=
 =?utf-8?B?L1pBUkx6Z2xXc1luVGx4RXk5QmlhWkg0bzBFcTlBTDZyb0ltb1YvT3MrZk5N?=
 =?utf-8?B?T21HdkdCRitxeGtvakxaSURyejlBQ0ZramhhMk90Rmhqd2dLdElPWEpVekYz?=
 =?utf-8?B?T01LRFozTDFyMWhML0dOUUJSeVNNUlZydkk0QlFSSVg0UUV6LzBYRUxuSnhB?=
 =?utf-8?B?M24xN0VUSzhQL2h3bEhJYVFERjRadmkwTlpJZjJHYlZKaC8xd2lJTWxhZTJ6?=
 =?utf-8?B?eDNqbkd4SjF5VEtBZE4zTkZTYWpKVklUV2lBemlLQWJpMWc5VHN3TnFtSlpF?=
 =?utf-8?B?aW85Y2hZa2tqSUJsb1I3Tys5TytuZkw1RnEwVEpLSmV0Z0MrbEtzVU4vZ1JU?=
 =?utf-8?B?cTN0WCtqQzdHOFJLMzRtTyt3THlQRFYzTHU0eW5xNXdON1ZtcG1OMUFMZzlN?=
 =?utf-8?B?UEFIaXlKdzloMkdGdEMrSVdYcE91VlIzekVzaW1lWkJxL2haWGsrMzFmQ292?=
 =?utf-8?B?c0QvbHMxYnNMRjhQdFZmZDNEMzFJMWE1QUJlU2o5Ykw4RWJEM2VZeENVUGwz?=
 =?utf-8?B?bzZGQzA1SGZGaXczS1VJUzJOZjVuT0lLWU0zaVAxQ0FHa2hCc1hjcUZiMTUr?=
 =?utf-8?B?RVl1cUd5di9ITjRhN3JZV2lUcTJMQW94Yk9teFVlaWNSMGJ3MzFpcndyMmxC?=
 =?utf-8?B?clp3OEQyOC9EQWV3dFhYT2o5U0k5TFdEc1B1WGdFc2tNczJJQVJFaUdYbDE4?=
 =?utf-8?B?RWtETmxHMVo3VmtTUU5YYlpuWG1YM0hFYmdBRndQQ1Z0MEhtQlg2bjdkNndy?=
 =?utf-8?B?MjBsSU1HTThJYU5PYW9mQXNpYk00cWV4T0lGRDFZZGc1cWdoTTloQlV4SWYz?=
 =?utf-8?B?eTlicEtZc2xkYVFiUytSOU9WT1M1dzZrdGFJQWpaaWNJT0FVSzd5Mm8zamZC?=
 =?utf-8?Q?TPfd1HJdUi4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEtMTTFwR2NEK01qOUxoVURoQ3dmNGZwZnI2UnpqTzg1eW5ST1JzRExKVGpj?=
 =?utf-8?B?QW1IRmQ5Zms0enlSZWsyK2xsbGc1NzYreFg3eDA3eDA2N2tYS3orU1hzN1k3?=
 =?utf-8?B?Z25oalhLV3ArRFh1SEdOcnBuR3k4M1ZmYkRUUmNPcnNjRm4vS2xRWHlubURG?=
 =?utf-8?B?QnpWYUg2UkxPWlpUMWpUeENsV1RNV3NTYjEvQngzdXRlOFpZbjJCZEw3OVpw?=
 =?utf-8?B?ZjRwb2tSTkYxZjhGK3dBVHZvOGpSd1F4TGx4UmY1ZUJnRkRSUTlCclNXcXJX?=
 =?utf-8?B?N1F5Mm5sSFljR0I2Nlp1WW16UzRtSWpXb1NMU1dXSVVyZjk1eURwcVhxKzNm?=
 =?utf-8?B?bUlodEprRHY2c3BTL3lScklWWnJ4Sk9WYlR0Mm85bmllbVBUTWx2VHpVTGJB?=
 =?utf-8?B?TEF4bUdMZGxNV3FUTnBRS2I5QmhYSmtUaVRkbWtOeDRGMmFPVTdTVzhFbGpo?=
 =?utf-8?B?dENiTk9qRnJmWEVvaCtCNFNxTFUzRjdxaThrMHBJdXdFTVkyNWJOUDVFdWl4?=
 =?utf-8?B?cktrcjRLakZFdWJBUHZ0bkhZd05VK09tU2Q3cUR3dlBhNHltN1JZVlNodFIz?=
 =?utf-8?B?VEJkWEJlSkxuZFNadXNzWml1VDVwYkQ2NGtIRHZJMVpLN3JCVy9yeEUybEJX?=
 =?utf-8?B?enRXWUxsUnNMZEJKdGM1N2tDa3E0bnRRYXdrMU5QTzlWeHJBSEFKcGFDVVpR?=
 =?utf-8?B?SjJyM20xUHArNm1weENjTkVndi95Y0E2MEpkbXZveHJyelpGNHkvZENBZlhi?=
 =?utf-8?B?YkZ3U3E4bHNHd2d5eTFmL3h4OVR5V2s2UjF6R1Z5d1hKZUczMnZJaG41TUxT?=
 =?utf-8?B?OG5weXJaa014NG8wTzl6L0txU0RabG1lNVZaR1ZIRDhmRWhIMTlvbUFSTWlE?=
 =?utf-8?B?OWc1WXI3bFZWSktqeEZJbTBVMHhZM3E2aUM1dXlxdWhSQU1pbGVrWFhLODdk?=
 =?utf-8?B?b2twZXhaa1huM1NsLzF2RzlOWENVYitKWDlUMmx4ZXhBTVVHVnYxUk9TS003?=
 =?utf-8?B?WGdBemphWUwyWXhoR2IvMFdTSlhWSlM4VHhHTU5MY3RBQUtidEFTNS9MeU1t?=
 =?utf-8?B?WGxMRDJ3eG9TQnc4OHZBbWhJMmZHMzR0ZzhUUDhCM3lXRzFHN3dYUzRENjhO?=
 =?utf-8?B?VUx0M0xUWWk1ZkpPTUNPV2gvOHBlNHduZUNmZEVqVG4zVEI3YjlkYy8vMmsv?=
 =?utf-8?B?aVZNOGJjK24vSHNiUVlPclRDSU1TSHNxcjVCSlBUelZEUWRrdDBjVTB5Rjhz?=
 =?utf-8?B?bHdzaXI0QTl5ekt0REc2b2dsWVJDeUJmL1RhdDMwRWpSNm4rUFNFR0c0Qzdn?=
 =?utf-8?B?K1JjN2xGMVpKSjVtNnUxbi9jdXZQaFcvVW5tRkR4R1dSODh3NlF6Q0o0YktP?=
 =?utf-8?B?OVpiSzBXVXdiQTYyWU5UYjNLZjQza2RiQjVqTXl5a2dLdFZNNnUwNG9vb250?=
 =?utf-8?B?MjAxK3BrN3VRZEd0OHBQZzN2aE81Y3BhaHFBN3RaNHd5N1ZteW5xU3hZQnBx?=
 =?utf-8?B?cHViZHVxL0p2T3FDVEFVdEhkSVV0N3JvdGZxeXFweFR2d0VrMmtIeWtKZTIw?=
 =?utf-8?B?aDBSQSs2azJwdmZveTdGYm56WWxPZjRoYnZ2QWNtT29GVUljbXA2ZGtOcm5i?=
 =?utf-8?B?MEJUNzFpU2EwS0pyT3NuVW5mclgveFFJd1hUL01QZlljMjAyK0hpZFFmakxo?=
 =?utf-8?B?R2dVREk3SE1QM1pvOEJFNnM1SmI5QmNDZGhDR0FxSXd1NDY1anFpbWh0clp2?=
 =?utf-8?B?cDhmUUoyNEhVMmw0ckhZUktvdURPZVFWdWlOQTdYbU50dUE1amNVQitEQW1k?=
 =?utf-8?B?dm5VemxBMC9VTm5hdGhEYVdPOE90aElkYUtyOU1zQWY2RGNySTE1UDBRMlE3?=
 =?utf-8?B?Q2M1bDErYUNCZnZvVVBoZk8xWkNDWFBhRUt0SDlrVElHZ2NqdGM3NnQyWHFt?=
 =?utf-8?B?ak5zNysvSGVBYjVFSk96b0VCOXJlMWl6ZWxMVTR2M0paM0kycTJFejFSM3Vi?=
 =?utf-8?B?MFI3VTExK0tYSW5kWTgrMTJSV1cxYnpTb1NkRkVQaEpXTGdyb2llUTZUYUVm?=
 =?utf-8?B?YVNVaExKVTFxc25DeHNiSTNBNGdvUXlJVUJHZnkrZ2V0dnhncnk4Tk1mVG1T?=
 =?utf-8?B?SFVWWm5oQk1LRHVvbi92WDRJSytYTGlnM0llai83M2x3Uk5TVWpMU3hrRnpH?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 373d1d68-3e7a-48fc-d81c-08dd96aac453
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 07:57:14.0131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdeVDzEb1ZNOpsWDK3PaubauGFOK1SI0IIQa7/c06ftTtmkxszbe1I3HIFB9lB9ZnQe5uaFKxrojBsOXfiuWt+1x/uVGC6XR/evz6WrR/Ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
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

On Tue, May 13, 2025 at 08:57:58PM +0200, Zbigniew Kempczyński wrote:
> For mem-copy (byte mode) width and pitch must be lesser or equal 256K.
> Limit them, avoiding setting inappropriate bits in mem-copy operation.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_spin_batch.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index f83f4ba722..4fff34a092 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -318,7 +318,7 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
>  static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance *hwe,
>  				    uint32_t region)
>  {
> -	uint32_t copy_size = SZ_4M;
> +	uint32_t copy_size = SZ_256K;
>  	uint64_t duration_ns = NSEC_PER_SEC / 10;
>  	intel_ctx_t *ctx;
>  	uint32_t vm, exec_queue;
> @@ -349,10 +349,10 @@ static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
>  	/* Create source and destination objects used for the copy */
>  	src_handle = xe_bo_create(fd, 0, copy_size, region, 0);
>  	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
> -	blt_set_mem_object(mem_copy.src, src_handle, copy_size, 0, width, height, region,
> +	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
>  			   M_LINEAR, COMPRESSION_DISABLED);
> -	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, 0, width, height, region,
> +	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
>  			   M_LINEAR, COMPRESSION_DISABLED);
>  	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
> -- 
> 2.43.0
> 
