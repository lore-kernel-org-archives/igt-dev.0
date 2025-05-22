Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2ACC54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 11:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0A310E8DB;
	Thu, 22 May 2025 11:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AcEpOTxG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7187E10E8DB
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747913546; x=1779449546;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0fqNilJgscV6Aq3gFjA4HxuoN6Qn1n5C+BaB98vPx9w=;
 b=AcEpOTxG/N9utZRKOvYCdcd8EiLUa5yolEG0c5TU3lPUpCUEdYdQC4TW
 Vi/lzmvTWu09akAInmDPxOsuftqtOQtqI+P8auL5f22CHBXFv5TQPaGTy
 s3lgB1Yf+lLDfYZ6DM5EG6SNZmkWKXPOIpe2SlSRoenJzTHqv0ll3z5js
 NJg/gB0NY2R0jHUR/7wKPl7hRJ4dSj8Xhv5siIEbbLfPSGlNtfrMfQyhE
 xgYf9pnXqMNUaVMzBOBhVmMdPAA5GObtr2vYjdybct8vBYWOjtDDQbNGu
 HGBDjEFgy+mEUJp/nhHyiXmz7D5Y6XGWZ0SYvpSGlZWfc54xPXxQ3xMGb w==;
X-CSE-ConnectionGUID: B/I6rcY2Q1qxeHqCQXQZVQ==
X-CSE-MsgGUID: dxa5mN9OQxOF0Xb4c0BdnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60573407"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="60573407"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:32:25 -0700
X-CSE-ConnectionGUID: vN0P4KahT8uNBKeb4765ww==
X-CSE-MsgGUID: 1pe5sRAJQgONpnM55hSzxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="144513899"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:32:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 04:32:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 04:32:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 04:32:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8wxcUbxC/CrBwSVTeBLKwaoaAYdTiya9z0FUtg8wm4dIpzYJNc8IJRRzVobDyZMKEX9y2uu0Tqe6v8+Wxi1KxAGp2CvMkZ6dTp7mMGw8eUYbwUFUi9C1TcMHmTok8+68O7YG0hPVj+k/Sp4kk+jxHZZFFQiZApepV/92aMvOK9BGsPJIuPFEa6K0C+/x7emrwg3RFgjdba14DSqfettk/I960ApDheuVxiQoP0+LE72BEJL3Hi3ip91nd5AKtTMpX/6xoIrcGH8eUCZ5/6gZZKuMYO3GjXGF6y2SL2NDvxU8zYKjUgBaNPX/3kLvmVRI/pvVQ4TdplY7mztm4ySkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fk0zSnXQRnmcl4Gbx1jLl1wja6KAM3Bfzaaco4hLljI=;
 b=O6NfmYWeuZSQCEq468lR/mtjNeDHFNOoZaFUAaAOhz1ECsVteO1rtt4yRe6WOjf+cH9Pve1k3FvXnwISZT7FVJY7IlMce/LUg/pwrE4DA9rnwga5cMexvypVIJNM8lRPEfvRUqsjEXAvPVrssU/6LzPV6Ycf+7fAOf3F4/+fsz9nf94zA5rZnSb75/PRlTEfVr+GtMJ98zbZVlotsI9/E8LQBUao382ax0PyNwjPVg2Rtvrpgm5QCBZmn1ckFnhkXNmnAYnLxo+bli7M8ZgHyh0GBAHOA3phNAfbBzEEXjsIaFhENN4hEu0jKLw52z16z4GNFPDWt5kFF5WifyO1Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 11:31:55 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 11:31:55 +0000
Date: Thu, 22 May 2025 13:31:48 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 05/15] lib/intel_cmds_info: rename M to TYPE in
 blt_memop_type
Message-ID: <aC8LJCLBG_5PWqPx@fdugast-desk>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-6-zbigniew.kempczynski@intel.com>
 <aCrl77t1TQvHgKmq@fdugast-desk>
 <upchwjdu4kp23jq5lx63z7pyaigzum4hi3r6dzemhnr4phzirw@xr2qlcqc37ld>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <upchwjdu4kp23jq5lx63z7pyaigzum4hi3r6dzemhnr4phzirw@xr2qlcqc37ld>
Organization: Intel Corporation
X-ClientProxiedBy: DB8PR06CA0045.eurprd06.prod.outlook.com
 (2603:10a6:10:120::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: e4496bf2-348f-4238-cc07-08dd99244163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFVjY20vcS80SWlrWnVYUXdRZWVOeXNUbUVpOVhQWGZzeTI1Nyt0K1Y3YVBD?=
 =?utf-8?B?TFlna013L2tQdnlvUFg3YXFTdWFPYWtiWUZtMkpWeWpiMzcrMVpTWitrSC9T?=
 =?utf-8?B?c3pnMW5jODZ0VnhhMHZ5dndiUFlnRTZNZkxrYmRSU0toVGQ1S1AvbCt0MGFV?=
 =?utf-8?B?OFUrODlqc2ZjcklUZUVkdEY0TXY1L2oxWFptL1ZLSmZTcTk0UHFpTXZnK1VX?=
 =?utf-8?B?RlpRTnBRck85bi8yWnhpbjh4d0VKbHVidldueFU5OWJVNExoeFBHeDJmcEJi?=
 =?utf-8?B?OHFpLy9DMWFQVWJCcGZkZjRYcnZRVTVmaDVmeWw1RTNNbVM3SWhmTzhaTkRv?=
 =?utf-8?B?SXlnWTcwNkM4aTR1SlZvS1BlZWVIcnVRZUtYSWxnL21ya0M5bWdUcTZWbG5E?=
 =?utf-8?B?eFN2UFdobzdReTNQNE1iZHBxKzZXZUNlczVXWFVaNHkrQ0t2NHN0V3JNZlVt?=
 =?utf-8?B?QjE1STZIakhTdVV3empKK21sWVlHVklVeFhFeFJmemdrdUFXRjN3SXJkZmR1?=
 =?utf-8?B?alFHY2VOU0xGVnNUTng0dUNMc3duRkJjb1VncXJEUnYzMHZZZXhPdzZlL2cz?=
 =?utf-8?B?TlZraEJNOTV5K2MyRFdWOURtcU5vcElXWlpmUnkrREt6WTlyTjgwSmVNK01W?=
 =?utf-8?B?blE5ZEs2RTdOWTNWVWV2UHdJdlNxS20zRUNjd1ZGTEpUUE1GSmtKY2JzS3Z6?=
 =?utf-8?B?UjIwYVlFNHkzT1hMaGEvVEFjVXhtTGJzeVg4VE9xMXNKM2NTbzFDWW5LMlBH?=
 =?utf-8?B?VFRJS3hmRTcwdDZjakliNzk3UE5EdGpnMkdJL2FheDBueExsY2RNWlhNU1dC?=
 =?utf-8?B?aWlpNmtabitkQnQ5bCtwVUJwaG42MGlwbm9uUFZSV0N0cHlpVjN2VjdacGhW?=
 =?utf-8?B?bEIrcSthUXUvRUtpSEduUElEUFZMdE43ZVcwMDFJd1ZBQjEvZmtaVmE4b25q?=
 =?utf-8?B?TThPNDdzVlhMQnJySGg2UFREK3ptUm5jNEhZZ0wxdjBhMyt2d1htLy9LMmYx?=
 =?utf-8?B?U1RHbE1qSTFLdHpIa2NFUU5pN0Z4M29QelN3d1A0M2lMRXZZRlNaZ2lrdEVi?=
 =?utf-8?B?SXhmY3BnOXBpbUpJM0Y2Mld2b2U4QVlLTWFHQmdnMFpDNkdPeHhxMVFVR2Q4?=
 =?utf-8?B?ZmVFUENBcGxsc2toSDNxRC9EVnNpajFJNmtKWDNTMTArT1Y2ZGo0MDhxOTZB?=
 =?utf-8?B?UHQ4K292VmRvOFhFemlmSmdPZlRsZndnR001UWFteHMzSGhSTUxrTFVld1ho?=
 =?utf-8?B?UmloUFVSK2tPSGVIa0RqZUY5Mzd4dVJuK1lPc25Da2VUUzB6TzJ0VHgyZFJU?=
 =?utf-8?B?QWxYRDFYbWVhdGdIRjBEYUNDUTZQZ2VPdUpseGV0Q2VLaUVraEh2Nk4va0Vx?=
 =?utf-8?B?S3NRY2lqbnFUNWhFUFlVTnkyY0dLSm9QSnE4UXVSTjJDSnhNZTBWZXZiWEk5?=
 =?utf-8?B?clF2SDR3S1JGeFFKMWJUUWo5RnhzSUdCM0cxUmhMaEl2RGtLMFo0RkIwejJL?=
 =?utf-8?B?ejlMWGhRc1VjdnQ5Um1SL2lLOEY0RUI5RUlOWk9wYXBJOVdlUmg2UjYvdFNV?=
 =?utf-8?B?dnp6RlFyZ01ZMEI5VkVkRGpEZlc3TlhmNDN6ZFBaSmc2YUxhM1YvWm0vM1M0?=
 =?utf-8?B?UGNUUk9zS3hTMVpCOGxSUXNqaVk3TFNKalpJdVRUci9LV3JWYmFnVWl3ZmxG?=
 =?utf-8?B?SXBBZWFzZHpUbWs2Uy9RTkpCd1kvdmtLY1Y5T3ZjS1k1b0dVbWFwK2Ntdytj?=
 =?utf-8?B?cEFLZnJBZ29BRC96RmlJdWkwd2ZkYWNVUTJKWW9GYkVPN3ptQXllaU50U0J1?=
 =?utf-8?B?ekRmbTloN09tZ3Rnb2tPNFc4dkxBbXBpOGQvWmx0Q25WcEZRSUU4VkJlSUhR?=
 =?utf-8?B?U1o2bFJQS2h2My8xazVKeVZEb3ZDM2dCbXZrQ3BPbUVKL29JWFZtVExmcXlI?=
 =?utf-8?Q?gM+D6Q6Np4M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVZOc2YwSEt1MHRZejI3bTNSQ3RGRVRlNUhhd2RxSk1MNzNiZmh0NjBwNERt?=
 =?utf-8?B?M3lFN3o4ZVBjNTFLK3R6Zmwwd2xhRDBZenA2MmJNQnJsUHlSR3V3KzYvVnJx?=
 =?utf-8?B?QWdzMWtycURId3BhWEVrWGZsOHZlckJ0RGs0dDlTQnI4aTVvYTE5NzdHOHNq?=
 =?utf-8?B?ZUJYSVBnRDNQWTlYd1hBV0dnV1VRSVVIc1FkLys4cXBlcUMvb2I0bFIrRlQy?=
 =?utf-8?B?OXpMc1BPaDhQeUpZNjhON3JHNFNSSkY0NUpVcW94VG5ZM3ZaOUtZYTB6Rith?=
 =?utf-8?B?M2FqU0Q5NWtEdTVxclNjeVlmTDBrTEZ2OVRoZVY1VjlyUmJqaFhHRHNmRk1r?=
 =?utf-8?B?MUJSbW9aTGVOWGVSbUFrUnA5aEdrOGtCS3k5Z1JLd2ZGMmZraUs3SDhlYjRN?=
 =?utf-8?B?MmxhRFhOZEIvUTJXUllpNTNuZld1VHQ2SkM1Si9RSm94aThoSnR6NWhFMGNL?=
 =?utf-8?B?VnpIbmwzdVh1SE5LZVN6TDI0ejRQdkxNdVN1NHVXOUNyelVsYkpUUFQ2ZnpO?=
 =?utf-8?B?R1RnRVliLy9kQ2tCbEtRaGgzOWlER2RPTzhTZTJXaDhET1hFSGtTTXJKZmt2?=
 =?utf-8?B?NUVJMmZoTVllK0pPdEZTUitYc296N25iSHVKcitVdm15OWZyM0ZEN2RYY0p1?=
 =?utf-8?B?S0RkRFJ1YndyMHhsMXRBOE4wL1BoREdoZGZYWCtWRGdtRSthM3JYWGhnVDdQ?=
 =?utf-8?B?U2NLclM5MjNQeEE3VXNFS2psazRnUk1SbTQ4WG1ocHl3eU5sQVpIdlFSVHVt?=
 =?utf-8?B?b0ZBWmN0TnFuZVJxVTRzQ0JtazdqVWtwU0xvNmdKZE1tVENTalBvQmdFRDdR?=
 =?utf-8?B?OFluR0JWNjJNTXNYNThrYWhQSFpROW9TMGx0YlpBNVIwNStiTHZpOCtyK05s?=
 =?utf-8?B?TDRoaWN0UUwwOTdiUkZUcDhrRDNFMTlTN1h6UHpJR24rV0oyaWhwZDQwS3Bt?=
 =?utf-8?B?SmVsMzRPR0psU0tGMGN2cXhvVmFBUjhSOXVhWDlWN2JSZkxIZU4vTEtTVVhN?=
 =?utf-8?B?RzdnYXRINm9iVml2ckpTYTVITG83THhURGpWNHBKSVBHSGlUYnN4U1Y3UnVv?=
 =?utf-8?B?Vi9CWFNQZjd2V3EvUWMwY3lHNDNBZlBJYUJCKzY2cGVuUnJwNmVRWXFETVdi?=
 =?utf-8?B?bDZXZDdiYTl4M0ZPTzhkOHhaTmpoazZFT25aTXU0RGZ1VlU0clo0SWtCWnNL?=
 =?utf-8?B?cXVsT3JCNWlRc2h1WnlJWEU1bTdlTjRUL2pNaUl2dDJFSnkvejNvZ1hEUXNq?=
 =?utf-8?B?RGpwKzNYamVSdWt3OGlHcWN5d2ZTckM0SjY4MUJteUFUZzhFenRMODJTQzNw?=
 =?utf-8?B?bWxDTmcvMlpZelhDUE1Xc1JLU2FwZ3ZhRENnbDZwQytJclFCejZZajFSUmc2?=
 =?utf-8?B?QVJObUtzbXZsVnY2NzZ2RllxRjl6NlVDaU1KVk8ya3h5czdmRVBkNURrUld1?=
 =?utf-8?B?ajlqeXBDcFNmMm1HWWNCZnpQRnJ3ZnBrdDRGeWR6czc0ZXZjQkE2czFRdnZN?=
 =?utf-8?B?V1RDTU44dWxnUkY1NmdueWdydlJyRkxKSGltL0FVM0tuZ3hOeWRTb1VBTndE?=
 =?utf-8?B?TmZ1QXRVUWpEUGwxL0VwQThBUnV5UGplTHA5Y3pNSHBVNmJPdWRIMkFMQUFV?=
 =?utf-8?B?UkluUnE5UEVMMWNleGo4dTVMQnJFdXlGZ3lobzBKTWFjejl5MlYzNWZZdVFh?=
 =?utf-8?B?ZVp3VU5taFQ3c3VzRXhUUGNoVEUzMGZvRW4zbi9qS0VxK3RHbE43VGR0dy9S?=
 =?utf-8?B?UXhjTkxiNWp2R3VSOHJZWlpiNHFhNkZPQ0JGaGJOUDVteUNZNU44d1AydFF0?=
 =?utf-8?B?RjNTL0RHZHJCc1ROalVpY0tiUGVIV1ZOVnUxTm9mTEFHdk94TnhpNURHaTNX?=
 =?utf-8?B?YUZPYTZ4NlQ5SEdWdmw0WXdKVTR5NWFyRDNrMzBoa0xnWkJSWEYzWHhkbGFj?=
 =?utf-8?B?elBURDhNRWxHdUtteU1BYW9PSFlDNm4ycDlDdEsvSUlBby9hR3ZhbmpUd05h?=
 =?utf-8?B?Y2pNaUFmRzJEYXROWWJrOWRLSzVNQUpYODZIREJweUV2emNPNWNUOURuZ1cz?=
 =?utf-8?B?ckhJWlIzQmJQNWFtQWFQUzljVmt5ZGRxajdmZVprSE5TNjl5eGpWUXBJbjFq?=
 =?utf-8?B?TmhXVmdoVEgxZlJjNlhJZFhWbUJFb0dNN2VKditMYzhCWXM1UEV0ckZHK1N4?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4496bf2-348f-4238-cc07-08dd99244163
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 11:31:55.2588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yIj1Ffi+VWNWVfEK+YyuaaQ/pjTNFfDnB3MQf008xjlUeO1t/MXWUBYYOV1eodXGC+bFi2EeAd6XasGNbWvcKpa009E1KrjZEVo0BFp4yQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
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

On Mon, May 19, 2025 at 01:17:58PM +0200, Zbigniew Kempczyński wrote:
> On Mon, May 19, 2025 at 10:03:59AM +0200, Francois Dugast wrote:
> > On Tue, May 13, 2025 at 08:58:00PM +0200, Zbigniew Kempczyński wrote:
> > > Documentation separates type and mode in mem-copy so rename prefix
> > > to avoid ambiguity.
> > 
> > Which documentation?
> 
> BSpec command description.

Bspec 53418, thanks for the reference. Could be useful in one of the commit
messages, probably patch 9.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Francois

> 
> --
> Zbigniew
> 
> > 
> > > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  lib/intel_blt.c              | 2 +-
> > >  lib/intel_cmds_info.c        | 8 ++++----
> > >  lib/intel_cmds_info.h        | 4 ++--
> > >  tests/intel/xe_copy_basic.c  | 6 +++---
> > >  tests/intel/xe_render_copy.c | 4 ++--
> > >  tests/intel/xe_spin_batch.c  | 4 ++--
> > >  6 files changed, 14 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > > index 7010d3ff7d..33efbf1038 100644
> > > --- a/lib/intel_blt.c
> > > +++ b/lib/intel_blt.c
> > > @@ -1827,7 +1827,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
> > >  					  0, mem->dst.pat_index);
> > >  
> > >  	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
> > > -	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
> > > +	optype = mem->src.type == TYPE_MATRIX ? 1 << 17 : 0;
> > >  
> > >  	i = 0;
> > >  	batch[i++] = MEM_COPY_CMD | optype;
> > > diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> > > index d581edb6eb..3bd5eab653 100644
> > > --- a/lib/intel_cmds_info.c
> > > +++ b/lib/intel_cmds_info.c
> > > @@ -74,13 +74,13 @@ static const struct blt_cmd_info
> > >  
> > >  static const struct blt_cmd_info
> > >  		pvc_mem_copy = BLT_INFO(MEM_COPY,
> > > -					BIT(M_LINEAR) |
> > > -					BIT(M_MATRIX));
> > > +					BIT(TYPE_LINEAR) |
> > > +					BIT(TYPE_MATRIX));
> > >  
> > >  static const struct blt_cmd_info
> > >  		pvc_mem_set = BLT_INFO(MEM_SET,
> > > -				       BIT(M_LINEAR) |
> > > -				       BIT(M_MATRIX));
> > > +				       BIT(TYPE_LINEAR) |
> > > +				       BIT(TYPE_MATRIX));
> > >  
> > >  static const struct blt_cmd_info
> > >  		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT, TILE_L_X);
> > > diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> > > index 7960e0412e..66f63d7e72 100644
> > > --- a/lib/intel_cmds_info.h
> > > +++ b/lib/intel_cmds_info.h
> > > @@ -20,8 +20,8 @@ enum blt_tiling_type {
> > >  };
> > >  
> > >  enum blt_memop_type {
> > > -	M_LINEAR,
> > > -	M_MATRIX,
> > > +	TYPE_LINEAR,
> > > +	TYPE_MATRIX,
> > >  };
> > >  
> > >  enum blt_cmd_type {
> > > diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> > > index d4300b85c0..a9e9bd2359 100644
> > > --- a/tests/intel/xe_copy_basic.c
> > > +++ b/tests/intel/xe_copy_basic.c
> > > @@ -58,10 +58,10 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
> > >  
> > >  	blt_mem_init(fd, &mem);
> > >  	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
> > > -			   region, src_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
> > > +			   region, src_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR,
> > >  			   COMPRESSION_DISABLED);
> > >  	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
> > > -			   region, dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
> > > +			   region, dst_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR,
> > >  			   COMPRESSION_DISABLED);
> > >  	mem.src.ptr = xe_bo_map(fd, src_handle, size);
> > >  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
> > > @@ -109,7 +109,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
> > >  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
> > >  	blt_mem_init(fd, &mem);
> > >  	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height, region,
> > > -			   dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR, COMPRESSION_DISABLED);
> > > +			   dst_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR, COMPRESSION_DISABLED);
> > >  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
> > >  	blt_set_batch(&mem.bb, bb, bb_size, region);
> > >  	blt_mem_set(fd, ctx, NULL, ahnd, &mem, fill_data);
> > > diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> > > index 9f16537c1e..f0a90e320c 100644
> > > --- a/tests/intel/xe_render_copy.c
> > > +++ b/tests/intel/xe_render_copy.c
> > > @@ -470,10 +470,10 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
> > >  	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
> > >  	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
> > >  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> > > -			   M_LINEAR, COMPRESSION_DISABLED);
> > > +			   TYPE_LINEAR, COMPRESSION_DISABLED);
> > >  	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
> > >  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> > > -			   M_LINEAR, COMPRESSION_DISABLED);
> > > +			   TYPE_LINEAR, COMPRESSION_DISABLED);
> > >  	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
> > >  	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
> > >  	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
> > > diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> > > index 4fff34a092..06c5f9d3f9 100644
> > > --- a/tests/intel/xe_spin_batch.c
> > > +++ b/tests/intel/xe_spin_batch.c
> > > @@ -351,10 +351,10 @@ static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
> > >  	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
> > >  	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
> > >  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> > > -			   M_LINEAR, COMPRESSION_DISABLED);
> > > +			   TYPE_LINEAR, COMPRESSION_DISABLED);
> > >  	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
> > >  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> > > -			   M_LINEAR, COMPRESSION_DISABLED);
> > > +			   TYPE_LINEAR, COMPRESSION_DISABLED);
> > >  	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
> > >  	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
> > >  	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
> > > -- 
> > > 2.43.0
> > > 
