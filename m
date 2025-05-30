Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336D0C5B543
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 18:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC2710E1BF;
	Fri, 30 May 2025 18:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlxkFwiT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A42B10E1BF;
 Fri, 30 May 2025 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748628786; x=1780164786;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:mime-version;
 bh=lT8/f9WCB/UrRz1ZSnwdSEzZzc4ZMyqaa86V4yU2QOs=;
 b=GlxkFwiTmyViSouHfQRLnIQFggbGLSNAsz8wBqT5yfh6NlegWakkbaGG
 C5/mCzJhQpa1eileT+Sh9zIm+51HDl95bWR2Y4KyCyfmNZRDJq12Ju8Sc
 qCCnva/E4TPV2l4oA/7YHvpH2TZa9tdmi7o+dmZCICBtpzv09CK/X/k1r
 DEZnr81m171R9897l2SL1QtSTmEx887IhLP0Ef9FJNnxyTjq+fc5tgdD2
 Ubb6pRr2Bw/GgrfjeXtqT0qL3Q0LJ1wMNS2oNc8o/rFmqpUfkBo3Vk7H4
 nKCXdU4Jy8yA374q2mmHL7VNbnHCQUPFYuWcj3gvqj+65ZCY+A2XTBuWs w==;
X-CSE-ConnectionGUID: sK25qJYYSom32l5lO1+eRg==
X-CSE-MsgGUID: /3zgEfxNSoeqZkQh1HR8ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="73260682"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208,217";a="73260682"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 11:13:06 -0700
X-CSE-ConnectionGUID: 40mPkpACTa2YbUcCgvdtag==
X-CSE-MsgGUID: E9ZAOMvWTV6EFLWqBqvBag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
 d="scan'208,217";a="149216757"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 11:13:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 11:13:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 11:13:05 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 11:13:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiH8PF7kynclkbZVxw0qGjSwjfMq3FaioHMbg35eeb56mhGVVLWr6epvlHw64anpO4PKdXncPlSYHrILxvZVTb0poR/nqL6U2sYWFgZvHYo98F1b8i07rzZW/f0/4F/OOlpg+545GT++agOBlbNXmL15SknQ7wnSb14PLnHtDhtRPG8viSAotZCp+TkDbt35ODXzzcIyGx6G+1HVQBb86XDW6UPVHoSTwZyxmeeGimVbZqlFf1XjXb14FMkQGyUI782F8MuI6ra3LQFnY4j6x3ttfJNbonsDDIPs25zS+2JvAuViyZ7TaqqrSB13KbdHFYcn9IOMCWnW/1yAvMeLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBN+aRmvZuV5VruBWsEILQux0zYl6KXi7M80Ay+oMpw=;
 b=p6p15UwhPDP6+H2QTs7Xd+LFvKhPM3m/GCAYnahjiFtKEc329+LJH+w9veYcGwydI/b01Ek3fx0S9ZDGLmteCG5bIXKNCj6QbDKail80PvL5n87GvOGsAtYGWb9MLmYEEw3zN7oVaK/lqIJLksydlfH4fxk2uRze8wgy0L+4jXZ5W0UPn9Ckom12aE+cg1CGwrxGdnT/IA+/7vMf6XCq4hOM4Cz5Qxn99QJfe9BUPVYJKXtwAyiWggMgx3feIJj0KFUUOrpYla85MZ6oRpHt8NovaA/fa/I9n6oajkEv5J5O30URe0Fo2ZDopB7C+9Sq9Rqe47CUz8NVwUEn3Tco+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DS0PR11MB6544.namprd11.prod.outlook.com (2603:10b6:8:d0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.29; Fri, 30 May 2025 18:12:17 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 18:12:17 +0000
Content-Type: multipart/alternative;
 boundary="------------VGppMzTCvOi7Khca2De1cIRO"
Message-ID: <3b78548b-3cd2-45cd-933a-e41fc3488882@intel.com>
Date: Fri, 30 May 2025 23:40:57 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/i91?=
 =?UTF-8?Q?5/pm=5Frc6=5Fresidency=3A_Use_sysfs_to_achieve_peak_frequency_=28?=
 =?UTF-8?Q?rev4=29?=
From: "Anirban, Sk" <sk.anirban@intel.com>
To: <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>
References: <20250529090841.4177513-1-sk.anirban@intel.com>
 <174860957477.35239.8132115509813169320@1538d3639d33>
 <586ec0b5-138b-4fe9-bd6f-165c0dc9ae37@intel.com>
Content-Language: en-US
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0;
 attachmentreminder=0; deliveryformat=0
X-Identity-Key: id1
Fcc: imap://sk.anirban%40intel.com@outlook.office365.com/Sent
In-Reply-To: <586ec0b5-138b-4fe9-bd6f-165c0dc9ae37@intel.com>
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DS0PR11MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd81cc2-2b8a-4668-befa-08dd9fa5827d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzBPeDJlZmptRWY4VnZWWkhrSXZQNFkyM0N4WHRsU3E1RlpmV282OUpmVTJB?=
 =?utf-8?B?anZMWld4aGxMNUdmcXhsM1FGUVlCNkVybXF1Qm5tWTI2dmhhMERXVnJJUzd6?=
 =?utf-8?B?V0pwRnk3c2hBNkhRWDhnNUs3ck9kZ21vNnQ1OWEwWGlEb0RpOVR1dEVqaFVG?=
 =?utf-8?B?WXppK0EwQWpGQk9oQ1RTZHZka3BibHc2WXUyell3R2Z1NSt3d0x2ai8wTFhI?=
 =?utf-8?B?ME8waVhUd0tvWXBWNWhtbWxwWHp1clE1RkNOYlFaZHlnVTh2cmRwTzdsUzRL?=
 =?utf-8?B?YWZIL2dqZHFkeHB6NnNaVnh6Q2NuM1pnMkxGdHRGWHpnTFgyYlNmVjRNT1RR?=
 =?utf-8?B?V1A3WG5VTjN0VFNIbnFNdTg2RGRrZzZPb1I1Wisvci9ZckdwOUNqWGJvSXla?=
 =?utf-8?B?SVRxRE5aK3NCcjJKejlqSGhMWDZWMGpEeEg5b3JHWTY1RFdNblBXQmVYRmJD?=
 =?utf-8?B?VDh4OTNSeXVZZUY0OVJMRmxjZDJGMG92WVQydGtnRExyL3poNTh3N3czeWZL?=
 =?utf-8?B?b3BxUHh3ME5GVHo4OWlwRHp4ZTR3WGIzWlpVTDhjMjdjaVZ6QkowR3BqQjl1?=
 =?utf-8?B?L1krWC9Gc1E0VzdEVUt1RG9yOFIvTVpKM2dTYmVwYjV5T2o2UlpTb3RtWkxo?=
 =?utf-8?B?UzF2MVZQUVdCVCt3Q0doWXRBYjVuaWRRRzdObG5Rd1pKc0N4NDRHSW1GZ1B2?=
 =?utf-8?B?a2lSMjJzSHdGV1dwUHBndGJCUjZuRTdyTkhUcDJJQ3N4Z1NXenc5MFVYd0Qz?=
 =?utf-8?B?Z1FqbG5XRk9abDhHblBneklVOVh5eVZqRXRTclZSVWhXODlLMlk4K3YyQ1A5?=
 =?utf-8?B?c3BuYWx1NzBsM1pGenNCc0U0Q0lDMVRDZGd6NFZaTmRnZitGRG51SHNCNWZj?=
 =?utf-8?B?Nll4TnQrbTBBVytGTTlObHZTeXdPdWcrWmEzNmN3UFBtNkpQL1ZsSlUwRjAv?=
 =?utf-8?B?eExFZGFxdUh3UGZ4U1RqbnZwa1dvS3ZmZU0wTk5vYWEyQjVKUEh2cUR0aTlG?=
 =?utf-8?B?YllTajhiOUxvcElBMHhKNXdJVjJ6YVoyaHNZT3ZTTHMwODhsZHpDbHRoMy9i?=
 =?utf-8?B?YlRXcTJmUzF1akx0TXhlMzdLNlVXMnY3RnAzcGlKaEYwN1p4TGxkLzFoRWM4?=
 =?utf-8?B?R0pFOGpXMlh5ODRXTWJGVUhRTWZuN3NIUnBrNmdLaGZDTThDdmdLd0owdEtt?=
 =?utf-8?B?QU5zc3hnaHg0ajIxN2lMVHFua3JTTzJuSXBQYnJIbUsvcTBWd3dudmJkK21G?=
 =?utf-8?B?bEhZRlJFSEVZWVJoZUNhVG5TOGpSdjFoYVBpVWZwVkg1eXF2VkRweEltNW5t?=
 =?utf-8?B?WWxEV1VlcGFaQm9SV29udjBiYW8zSDgycktlQUF2ekxxaGZ2SmtucTZzVXJW?=
 =?utf-8?B?bm5JaVFxNFdOSWtSeG5jdVNGWUgzV0lnTlZ2cG1JQVBxM3V5UmZpM3J3cktY?=
 =?utf-8?B?dU5xbEVGYUpNSEw0SytKUnpkNnowTk1KZ0hRcVlRSHYxTGcvYXVORUZ3VU1R?=
 =?utf-8?B?MHhGc3pPd2FPTzc1MHo2SU1NVGNHalYzdWRiVmFTTVRRN2gzL1VlMEVwd2Nv?=
 =?utf-8?B?NGQxL3ZQemFaTmVScEhBRzJkNzFKaUhoa2dCM2RnQkY3U2w0cHhLdE1SQlpr?=
 =?utf-8?B?SndobWdXekpxTythSmQ2WE5MKzhiNnQwOUtRT0F4enkrVGxrbzZWaDVIN0Nx?=
 =?utf-8?B?SUEvamltcFhoYXR2MkZWYXU2Wld2SlJVZHFWOVlpYlpST2I3RzdnM1RpNzB5?=
 =?utf-8?B?RVkzcmQ1RGhJVzE5bkI0MU9qNFN6ZVlDaHVZSWlNaVZpcW5yREtwSjlXVkdG?=
 =?utf-8?Q?QZZ9dQwnyTPFPJsxboEQN/ay1QMQJKvIuiIaU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGQrUnlMQVhyRkZSN0luaGN4RUFSeWZNOU5wZjlyR0w5Vi90Y2VSV0ZZOGtJ?=
 =?utf-8?B?bVIwNmM4M3Y5ZWdhMzRKWHZNWUVrT3pwS0xYL2lWMWo2NXAwRW5UTFdqaS9v?=
 =?utf-8?B?Ym5mRSs4RmVkSk1RME5JYzhtVmpXRC9sdXZwYlFPZFVzRTZ2a0V3L2plUjBz?=
 =?utf-8?B?YkM3Q1NqUmRXRjcvQ0NiWWJKTTVCQ3VCMVFtTVdYMk1zZjdEWkszSzhMK1lj?=
 =?utf-8?B?MGZKQUZrblduSDhGeWlWRDVFY05UQzJZc3lhZjN3eU1PSWZXQTFWanVyUGR1?=
 =?utf-8?B?cnlpNCtMLzYzc2VzRDZ2OXYyaGdrRVk2SXE0Qy8zRmhNQjFrdmVUbFQzUUl3?=
 =?utf-8?B?aGFKNlE4UGlmclN2eXcrbGkvajFFSG4rbnlZeFZXemxZT1hzaVdkbXlZcTJw?=
 =?utf-8?B?ZjNiSmZQK0RNcmg1UjA2eEk3QlViM3BpaDhUUDgwb1FZNWNuQWRMR1dIdkth?=
 =?utf-8?B?eVNISlZaUDZOVE9HWHo3c05UeVlQbTlpc01WaGxUa3BtYTU4VEZPYjJETC9p?=
 =?utf-8?B?OWxJLzdKbzNsZStJSjNIUFloZ1ZpTXUyb0FGWk1IVkJvMEtlalBoTlo0aVJL?=
 =?utf-8?B?d0VVbXhITlBIU3U1bU42MExNWFlyeDd0bkdQOHFLMTkwejVwcjNweFVwOTVr?=
 =?utf-8?B?WFBXKzM1d2RsYWhzK1dLSVJvQmRGbmdUTFNBdVJCY3RWdi84YzUyN0h6VFFR?=
 =?utf-8?B?QlR6eXZpOE1EZEdwM3JDSFFvbENJKzhER1d0NzJ1eE9Vd1kxZFZVR3huZ29y?=
 =?utf-8?B?ejYyWGs3R1dXdnV0UktBbUhrUzNJTTVsamc5anpia3BRM245WnlZdHpscVU0?=
 =?utf-8?B?SEdGelRBbmFNVGdVZXhTTHpGT0p5SFRmTlpZK2g5eFJET3pEWElnUVZUMHVK?=
 =?utf-8?B?UmVBNFhRa2tCanJCM284UmlVOUFyT2VPQ3E3dFUxOTFscXJPbEFMSkVFSXVl?=
 =?utf-8?B?bVNjT3A2VXFBTWRxOWxPdDNOQTZZUXBpcmJWbVZTUTJraGNqd0dkMHVqZFNs?=
 =?utf-8?B?eVk5cHRrTVRycmY4VktRbHhuN2F2QjdGSFk0K3dmTzFaYy9yMlduRWlET2p4?=
 =?utf-8?B?QlY1U0VjZ0ZCT0VJTkVxM1hRSGwwaHUyN0F0OU04aitSc2Nkd2JFV05EbWVj?=
 =?utf-8?B?ZFBEM2VzZjNIdmg2a2srbjluc1hlVW5WNFkxZDZNUVFxa1M5SGN1LzZsN3g1?=
 =?utf-8?B?ZUhEekQraksyYjgwT3o0YnJpQUE3OTZlQkRseHl6akN3NDBCekpGZXQ5cXBM?=
 =?utf-8?B?ZS9xYmRsc1Y0ZGNjUFJ2amd5TExmTGF6N1hDSldEMTFvZ082STE1WFNUV0tK?=
 =?utf-8?B?TTlYdUszZlBBQjNLSllsdjlKRWlIemFPOUIrMjZvbExERUFZdm5ZLzRTMldx?=
 =?utf-8?B?WDdhQnhuOVQySXdaZEFrbC9aL1ppL3lzQU4rSkJkTUM4Vk1taUo5NEZYZnVw?=
 =?utf-8?B?L0t1SjhmVEdFanpQeVpJMmQyRlNHZ0lNcklsUlZNWmUyTnBKTDVibm9QSHdR?=
 =?utf-8?B?YlhzZVdaOEYwc3JwZXNMNHlwNjA4d25vNWIvQ2srNWJ2bGZEWjUvaUpvWEZP?=
 =?utf-8?B?akZ0ZExlVnFRSU1hdlJ3eklXWHFVR1BTb1MxS2dHQzgrK3c1eERkNlUwY25P?=
 =?utf-8?B?dEZQREpBNUdCTkxPdXlkZGhXWk9ZSUhzREI2UURrRHkvTW1YbXRiMm12N2Jp?=
 =?utf-8?B?QWtIcDVtZjBaNXV5cUlMR0xPeEYyVDBzQU9OaU9SczhUTFJHMXVzc1ZlZm1o?=
 =?utf-8?B?WHdGNmpLMDkvVzVYTittSGhLMzJnYTZYbERVSEc0VW9lVWlEQkR4RHQxYm5Q?=
 =?utf-8?B?Z0Z1NFA2R1A3cWVDVWpLdUsxY1I1dWlxTUZYZ1B6MjU4OUd1K2UycDQ1MzBq?=
 =?utf-8?B?aWxwQVFGQ2JWSTV1WGFOQW82VkJVZ2JhY1VMcWczU2Z5Z0krWW9Zd0k4Yzda?=
 =?utf-8?B?UmNkU29iWVZBQWJvdDI1VXNLanF2U0xzdjFIT3FmU2dpbXpJQnU1NERoSVpr?=
 =?utf-8?B?dHNGelAwNlZtSStWZ2FzdHNSR1lPYStXR3NOZVVLbUIrclVZMmMyNnoyU0tZ?=
 =?utf-8?B?bXZCb0xvelZXUzNjQXBiWmt1WHMralY5b1hPcHFiMWpPZHlTakt2QXIyM1Bi?=
 =?utf-8?Q?SSx0hcZLXlWPgclL2bv++v+4f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd81cc2-2b8a-4668-befa-08dd9fa5827d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 18:12:17.3863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVzYa4xxfw83X6AZQ5N+/OzKqwh69LOoMIJ2gx5tauAZEvkKKkTTaUX6+F8HkEO7KDx4dwCrsQ21g5GlRCZNNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6544
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

--------------VGppMzTCvOi7Khca2De1cIRO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 30-05-2025 22:38, Anirban, Sk wrote:
> Hi,
> The issues reported here are not related to my changes.
>
> Thanks,
> Anirban
>
> On 30-05-2025 18:22, Patchwork wrote:
>> Project List - Patchwork *Patch Details*
>> *Series:* 	tests/i915/pm_rc6_residency: Use sysfs to achieve peak 
>> frequency (rev4)
>> *URL:* 	https://patchwork.freedesktop.org/series/148054/
>> *State:* 	failure
>> *Details:* 
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/index.html
>>
>>
>>   CI Bug Log - changes from CI_DRM_16611_full -> IGTPW_13206_full
>>
>>
>>     Summary
>>
>> *FAILURE*
>>
>> Serious unknown changes coming with IGTPW_13206_full absolutely need 
>> to be
>> verified manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in IGTPW_13206_full, please notify your bug team 
>> (I915-ci-infra@lists.freedesktop.org) to allow them
>> to document this new failure mode, which will reduce false positives 
>> in CI.
>>
>> External URL: 
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/index.html
>>
>>
>>     Participating hosts (10 -> 10)
>>
>> No changes in participating hosts
>>
>>
>>     Possible new issues
>>
>> Here are the unknown changes that may have been introduced in 
>> IGTPW_13206_full:
>>
>>
>>       IGT changes
>>
>>
>>         Possible regressions
>>
>>   * igt@perf_pmu@module-unload:
>>       o shard-glk: NOTRUN -> ABORT
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk1/igt@perf_pmu@module-unload.html>
>>
>>
>>     New tests
>>
>> New tests have been introduced between CI_DRM_16611_full and 
>> IGTPW_13206_full:
>>
>>
>>       New IGT tests (3)
>>
>>  *
>>
>>     igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [10.97] s
>>  *
>>
>>     igt@kms_flip@2x-flip-vs-fences-interruptible@ac-hdmi-a1-hdmi-a2:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [10.76] s
>>  *
>>
>>     igt@kms_flip@2x-flip-vs-fences-interruptible@bc-hdmi-a1-hdmi-a2:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [10.69] s
>>
>>
>>     Known issues
>>
>> Here are the changes found in IGTPW_13206_full that come from known 
>> issues:
>>
>>
>>       IGT changes
>>
>>
>>         Issues hit
>>
>>  *
>>
>>     igt@api_intel_bb@crc32:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-12/igt@api_intel_bb@crc32.html>
>>         (i915#6230
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230>)
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@api_intel_bb@crc32.html>
>>         (i915#6230
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230>)
>>  *
>>
>>     igt@api_intel_bb@object-reloc-keep-cache:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@api_intel_bb@object-reloc-keep-cache.html>
>>         (i915#8411
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>>         +2 other tests skip
>>  *
>>
>>     igt@gem_basic@multigpu-create-close:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@gem_basic@multigpu-create-close.html>
>>         (i915#7697
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>>  *
>>
>>     igt@gem_ccs@ctrl-surf-copy:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#9323
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_ccs@suspend-resume:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@gem_ccs@suspend-resume.html>
>>         (i915#9323
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>>         +1 other test skip
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-2/igt@gem_ccs@suspend-resume.html>
>>         (i915#9323
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_compute@compute-square:
>>
>>       o shard-dg2: NOTRUN -> FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@gem_compute@compute-square.html>
>>         (i915#13665
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13665>)
>>  *
>>
>>     igt@gem_create@create-ext-cpu-access-sanity-check:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>>         (i915#6335
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>>  *
>>
>>     igt@gem_ctx_freq@sysfs:
>>
>>       o shard-dg2: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-10/igt@gem_ctx_freq@sysfs.html>
>>         -> FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@gem_ctx_freq@sysfs.html>
>>         (i915#9561
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561>)
>>         +1 other test fail
>>  *
>>
>>     igt@gem_ctx_persistence@heartbeat-hang:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html>
>>         (i915#8555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>>         +2 other tests skip
>>  *
>>
>>     igt@gem_ctx_persistence@heartbeat-many:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-many.html>
>>         (i915#8555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>>  *
>>
>>     igt@gem_ctx_persistence@legacy-engines-cleanup:
>>
>>       o shard-snb: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb5/igt@gem_ctx_persistence@legacy-engines-cleanup.html>
>>         (i915#1099
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_ctx_sseu@mmap-args:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@gem_ctx_sseu@mmap-args.html>
>>         (i915#280
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html>
>>         (i915#280
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>>  *
>>
>>     igt@gem_eio@hibernate:
>>
>>       o shard-dg2: NOTRUN -> ABORT
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@gem_eio@hibernate.html>
>>         (i915#10030
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030>
>>         / i915#7975
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975>
>>         / i915#8213
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213>)
>>  *
>>
>>     igt@gem_eio@reset-stress:
>>
>>       o shard-dg2: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-10/igt@gem_eio@reset-stress.html>
>>         -> FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@gem_eio@reset-stress.html>
>>         (i915#5784
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>)
>>  *
>>
>>     igt@gem_exec_balancer@bonded-dual:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@gem_exec_balancer@bonded-dual.html>
>>         (i915#4771
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>)
>>  *
>>
>>     igt@gem_exec_balancer@bonded-false-hang:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-19/igt@gem_exec_balancer@bonded-false-hang.html>
>>         (i915#4812
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_exec_balancer@parallel:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@gem_exec_balancer@parallel.html>
>>         (i915#4525
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_exec_balancer@parallel-bb-first:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html>
>>         (i915#4525
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>>  *
>>
>>     igt@gem_exec_balancer@sliced:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@gem_exec_balancer@sliced.html>
>>         (i915#4812
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_exec_big@single:
>>
>>       o shard-tglu: NOTRUN -> ABORT
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@gem_exec_big@single.html>
>>         (i915#11713
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713>)
>>  *
>>
>>     igt@gem_exec_capture@capture-invisible:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@gem_exec_capture@capture-invisible.html>
>>         (i915#6334
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>>         +2 other tests skip
>>  *
>>
>>     igt@gem_exec_fence@submit67:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@gem_exec_fence@submit67.html>
>>         (i915#4812
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>>  *
>>
>>     igt@gem_exec_flush@basic-uc-set-default:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-7/igt@gem_exec_flush@basic-uc-set-default.html>
>>         (i915#3539
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>)
>>  *
>>
>>     igt@gem_exec_flush@basic-wb-ro-before-default:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@gem_exec_flush@basic-wb-ro-before-default.html>
>>         (i915#3539
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>>         / i915#4852
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>>         +3 other tests skip
>>  *
>>
>>     igt@gem_exec_flush@basic-wb-ro-default:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_exec_flush@basic-wb-ro-default.html>
>>         (i915#3539
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>>         / i915#4852
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>>  *
>>
>>     igt@gem_exec_flush@basic-wb-rw-before-default:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-19/igt@gem_exec_flush@basic-wb-rw-before-default.html>
>>         (i915#3539
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>>         / i915#4852
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_exec_gttfill@basic:
>>
>>       o shard-rkl: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-7/igt@gem_exec_gttfill@basic.html>
>>         -> DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@gem_exec_gttfill@basic.html>
>>         (i915#12917
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>>         / i915#12964
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>>  *
>>
>>     igt@gem_exec_reloc@basic-cpu-noreloc:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-7/igt@gem_exec_reloc@basic-cpu-noreloc.html>
>>         (i915#3281
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_exec_reloc@basic-gtt-read:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-read.html>
>>         (i915#3281
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>>         +4 other tests skip
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-19/igt@gem_exec_reloc@basic-gtt-read.html>
>>         (i915#3281
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>>  *
>>
>>     igt@gem_exec_reloc@basic-write-gtt-noreloc:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_exec_reloc@basic-write-gtt-noreloc.html>
>>         (i915#3281
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>>         +2 other tests skip
>>  *
>>
>>     igt@gem_exec_reloc@basic-write-read:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html>
>>         (i915#3281
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>>         +16 other tests skip
>>  *
>>
>>     igt@gem_exec_schedule@preempt-queue:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_exec_schedule@preempt-queue.html>
>>         (i915#4537
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>>         / i915#4812
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>>  *
>>
>>     igt@gem_exec_schedule@preempt-queue-chain:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html>
>>         (i915#4537
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>>         / i915#4812
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>>  *
>>
>>     igt@gem_exec_schedule@semaphore-power:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html>
>>         (i915#7276
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276>)
>>  *
>>
>>     igt@gem_exec_schedule@thriceslice:
>>
>>       o shard-snb: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb7/igt@gem_exec_schedule@thriceslice.html>
>>         +66 other tests skip
>>  *
>>
>>     igt@gem_fenced_exec_thrash@2-spare-fences:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@gem_fenced_exec_thrash@2-spare-fences.html>
>>         (i915#4860
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>>         +1 other test skip
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-16/igt@gem_fenced_exec_thrash@2-spare-fences.html>
>>         (i915#4860
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>>  *
>>
>>     igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html>
>>         (i915#4860
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>>  *
>>
>>     igt@gem_lmem_evict@dontneed-evict-race:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html>
>>         (i915#4613
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>
>>         / i915#7582
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@gem_lmem_evict@dontneed-evict-race.html>
>>         (i915#4613
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>
>>         / i915#7582
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>>  *
>>
>>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>>         (i915#4613
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>>         +2 other tests skip
>>  *
>>
>>     igt@gem_lmem_swapping@parallel-random-verify:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html>
>>         (i915#4613
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>>         +5 other tests skip
>>  *
>>
>>     igt@gem_lmem_swapping@random:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-8/igt@gem_lmem_swapping@random.html>
>>         (i915#4613
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>>  *
>>
>>     igt@gem_lmem_swapping@smem-oom@lmem0:
>>
>>       o shard-dg2: NOTRUN -> DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>>         (i915#5493
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>>         +1 other test dmesg-warn
>>  *
>>
>>     igt@gem_lmem_swapping@verify-ccs:
>>
>>       o shard-glk: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk5/igt@gem_lmem_swapping@verify-ccs.html>
>>         (i915#4613
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>>         +6 other tests skip
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@gem_lmem_swapping@verify-ccs.html>
>>         (i915#12193
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193>)
>>  *
>>
>>     igt@gem_lmem_swapping@verify-ccs@lmem0:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@gem_lmem_swapping@verify-ccs@lmem0.html>
>>         (i915#4565
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>)
>>  *
>>
>>     igt@gem_lmem_swapping@verify-random:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html>
>>         (i915#4613
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_mmap_gtt@basic-small-copy:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-14/igt@gem_mmap_gtt@basic-small-copy.html>
>>         (i915#4077
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>>         +4 other tests skip
>>  *
>>
>>     igt@gem_mmap_gtt@zero-extend:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_mmap_gtt@zero-extend.html>
>>         (i915#4077
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>>         +3 other tests skip
>>  *
>>
>>     igt@gem_mmap_wc@copy:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@gem_mmap_wc@copy.html>
>>         (i915#4083
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>>         +4 other tests skip
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-18/igt@gem_mmap_wc@copy.html>
>>         (i915#4083
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>>         +2 other tests skip
>>  *
>>
>>     igt@gem_mmap_wc@write:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@gem_mmap_wc@write.html>
>>         (i915#4083
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>>  *
>>
>>     igt@gem_mmap_wc@write-cpu-read-wc:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_mmap_wc@write-cpu-read-wc.html>
>>         (i915#4083
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>>         +4 other tests skip
>>  *
>>
>>     igt@gem_partial_pwrite_pread@reads-uncached:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@gem_partial_pwrite_pread@reads-uncached.html>
>>         (i915#3282
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>>         +6 other tests skip
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@gem_partial_pwrite_pread@reads-uncached.html>
>>         (i915#3282
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>>         +2 other tests skip
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads-uncached.html>
>>         (i915#3282
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>
>>         (i915#3282
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>>         +13 other tests skip
>>  *
>>
>>     igt@gem_pread@bench:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_pread@bench.html>
>>         (i915#3282
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>>  *
>>
>>     igt@gem_pxp@create-regular-context-1:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_pxp@create-regular-context-1.html>
>>         (i915#4270
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>>  *
>>
>>     igt@gem_pxp@hw-rejects-pxp-buffer:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html>
>>         (i915#13398
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398>)
>>  *
>>
>>     igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>>
>>       o shard-rkl: NOTRUN -> TIMEOUT
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html>
>>         (i915#12917
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>>         / i915#12964
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>>         +4 other tests timeout
>>  *
>>
>>     igt@gem_pxp@protected-raw-src-copy-not-readible:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html>
>>         (i915#4270
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>>         +4 other tests skip
>>  *
>>
>>     igt@gem_pxp@reject-modify-context-protection-off-3:
>>
>>       o shard-rkl: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-3.html>
>>         -> TIMEOUT
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-3.html>
>>         (i915#12917
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>>         / i915#12964
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>>  *
>>
>>     igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-15/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html>
>>         (i915#4270
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-3/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html>
>>         (i915#8428
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html>
>>         (i915#5190
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>>         / i915#8428
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>>         +7 other tests skip
>>  *
>>
>>     igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html>
>>         (i915#5190
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>>         / i915#8428
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>>         +2 other tests skip
>>  *
>>
>>     igt@gem_set_tiling_vs_pwrite:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@gem_set_tiling_vs_pwrite.html>
>>         (i915#4079
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>>         +1 other test skip
>>  *
>>
>>     igt@gem_tiled_partial_pwrite_pread@writes:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@gem_tiled_partial_pwrite_pread@writes.html>
>>         (i915#4077
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>>         +14 other tests skip
>>  *
>>
>>     igt@gem_tiling_max_stride:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-8/igt@gem_tiling_max_stride.html>
>>         (i915#4077
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>>         +3 other tests skip
>>  *
>>
>>     igt@gem_userptr_blits@create-destroy-unsync:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html>
>>         (i915#3297
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>>         +3 other tests skip
>>  *
>>
>>     igt@gem_userptr_blits@map-fixed-invalidate-busy:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html>
>>         (i915#3297
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>>         / i915#4880
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880>)
>>  *
>>
>>     igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html>
>>         (i915#3297
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>>         / i915#4880
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880>)
>>  *
>>
>>     igt@gem_userptr_blits@readonly-pwrite-unsync:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>>         (i915#3297
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>>         (i915#3297
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>>  *
>>
>>     igt@gem_userptr_blits@sd-probe:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@gem_userptr_blits@sd-probe.html>
>>         (i915#3297
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>>         / i915#4958
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958>)
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@gem_userptr_blits@sd-probe.html>
>>         (i915#3297
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>>         / i915#4958
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958>)
>>  *
>>
>>     igt@gem_userptr_blits@unsync-unmap:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-4/igt@gem_userptr_blits@unsync-unmap.html>
>>         (i915#3297
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>>         +2 other tests skip
>>  *
>>
>>     igt@gem_workarounds@suspend-resume-fd:
>>
>>       o shard-rkl: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-5/igt@gem_workarounds@suspend-resume-fd.html>
>>         -> INCOMPLETE
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html>
>>         (i915#13356
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>>  *
>>
>>     igt@gen7_exec_parse@bitmasks:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@gen7_exec_parse@bitmasks.html>
>>         +11 other tests skip
>>  *
>>
>>     igt@gen9_exec_parse@batch-zero-length:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@gen9_exec_parse@batch-zero-length.html>
>>         (i915#2856
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@gen9_exec_parse@batch-zero-length.html>
>>         (i915#2527
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>>  *
>>
>>     igt@gen9_exec_parse@bb-oversize:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html>
>>         (i915#2527
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>>         +6 other tests skip
>>  *
>>
>>     igt@gen9_exec_parse@bb-start-out:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html>
>>         (i915#2527
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>>         / i915#2856
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>>  *
>>
>>     igt@gen9_exec_parse@cmd-crossing-page:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@gen9_exec_parse@cmd-crossing-page.html>
>>         (i915#2527
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>>         / i915#2856
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>>         +3 other tests skip
>>  *
>>
>>     igt@gen9_exec_parse@secure-batches:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gen9_exec_parse@secure-batches.html>
>>         (i915#2856
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>>  *
>>
>>     igt@gen9_exec_parse@shadow-peek:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@gen9_exec_parse@shadow-peek.html>
>>         (i915#2856
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>>         +3 other tests skip
>>  *
>>
>>     igt@i915_drm_fdinfo@busy-check-all@vcs1:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@i915_drm_fdinfo@busy-check-all@vcs1.html>
>>         (i915#11527
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527>)
>>         +7 other tests skip
>>  *
>>
>>     igt@i915_drm_fdinfo@most-busy-check-all:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-18/igt@i915_drm_fdinfo@most-busy-check-all.html>
>>         (i915#14073
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073>)
>>         +5 other tests skip
>>  *
>>
>>     igt@i915_drm_fdinfo@most-busy-check-all@bcs0:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@i915_drm_fdinfo@most-busy-check-all@bcs0.html>
>>         (i915#14073
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073>)
>>         +6 other tests skip
>>  *
>>
>>     igt@i915_drm_fdinfo@most-busy-check-all@vecs0:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@i915_drm_fdinfo@most-busy-check-all@vecs0.html>
>>         (i915#14073
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073>)
>>         +7 other tests skip
>>  *
>>
>>     igt@i915_pm_freq_mult@media-freq@gt0:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html>
>>         (i915#6590
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590>)
>>         +1 other test skip
>>  *
>>
>>     igt@i915_pm_rc6_residency@rc6-fence:
>>
>>       o shard-tglu: NOTRUN -> WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html>
>>         (i915#13790
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790>
>>         / i915#2681
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681>)
>>         +1 other test warn
>>  *
>>
>>     igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
>>
>>       o shard-tglu-1: NOTRUN -> WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html>
>>         (i915#13790
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790>
>>         / i915#2681
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681>)
>>         +4 other tests warn
>>  *
>>
>>     igt@i915_pm_rps@min-max-config-idle:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@i915_pm_rps@min-max-config-idle.html>
>>         (i915#11681
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>
>>         / i915#6621
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>>  *
>>
>>     igt@i915_pm_rps@thresholds-idle-park:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@i915_pm_rps@thresholds-idle-park.html>
>>         (i915#11681
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>)
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle-park.html>
>>         (i915#11681
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>)
>>  *
>>
>>     igt@i915_pm_sseu@full-enable:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@i915_pm_sseu@full-enable.html>
>>         (i915#4387
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@i915_pm_sseu@full-enable.html>
>>         (i915#4387
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>>  *
>>
>>     igt@i915_selftest@live:
>>
>>       o shard-rkl: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-7/igt@i915_selftest@live.html>
>>         -> DMESG-FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@i915_selftest@live.html>
>>         (i915#13550
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13550>)
>>         +1 other test dmesg-fail
>>  *
>>
>>     igt@i915_selftest@perf:
>>
>>       o shard-snb: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb2/igt@i915_selftest@perf.html>
>>         -> ABORT
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb7/igt@i915_selftest@perf.html>
>>         (i915#11703
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11703>)
>>         +1 other test abort
>>  *
>>
>>     igt@i915_suspend@basic-s3-without-i915:
>>
>>       o shard-glk: NOTRUN -> DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk1/igt@i915_suspend@basic-s3-without-i915.html>
>>         (i915#13736
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13736>)
>>  *
>>
>>     igt@i915_suspend@forcewake:
>>
>>       o shard-glk: NOTRUN -> INCOMPLETE
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk1/igt@i915_suspend@forcewake.html>
>>         (i915#4817
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>>         +1 other test incomplete
>>  *
>>
>>     igt@intel_hwmon@hwmon-write:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@intel_hwmon@hwmon-write.html>
>>         (i915#7707
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html>
>>         (i915#4212
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>>         +1 other test skip
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html>
>>         (i915#4212
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>>  *
>>
>>     igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html>
>>         (i915#4212
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html>
>>         (i915#4212
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>>         (i915#12454
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454>
>>         / i915#12712
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712>)
>>  *
>>
>>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-1-4-rc-ccs-cc:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-1-4-rc-ccs-cc.html>
>>         (i915#8709
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>)
>>         +7 other tests skip
>>  *
>>
>>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y-rc-ccs-cc:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y-rc-ccs-cc.html>
>>         (i915#8709
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>>         (i915#1769
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>>         / i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>>  *
>>
>>     igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html>
>>         +5 other tests skip
>>  *
>>
>>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-9/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>>         (i915#5286
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>>         +5 other tests skip
>>  *
>>
>>     igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-19/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html>
>>         (i915#4538
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>>         / i915#5286
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>>         (i915#5286
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>>         +9 other tests skip
>>  *
>>
>>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>>         (i915#5286
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_big_fb@linear-32bpp-rotate-270:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>>         +6 other tests skip
>>  *
>>
>>     igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html>
>>         (i915#4538
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>>         / i915#5190
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>>         +8 other tests skip
>>  *
>>
>>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html>
>>         (i915#3638
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>>         +4 other tests skip
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html>
>>         (i915#3638
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>>         (i915#5190
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>>         +3 other tests skip
>>  *
>>
>>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html>
>>         (i915#4538
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>>         / i915#5190
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>>         +4 other tests skip
>>  *
>>
>>     igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-16/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html>
>>         (i915#4538
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_big_fb@yf-tiled-addfb:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_big_fb@yf-tiled-addfb.html>
>>         (i915#5190
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>>  *
>>
>>     igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3.html>
>>         (i915#10307
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>>         / i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         +172 other tests skip
>>  *
>>
>>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html>
>>         (i915#10307
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>>         / i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         +24 other tests skip
>>  *
>>
>>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
>>
>>       o shard-glk: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html>
>>         +444 other tests skip
>>  *
>>
>>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html>
>>         (i915#10307
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>>         / i915#10434
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434>
>>         / i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>  *
>>
>>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html>
>>         (i915#12313
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>>  *
>>
>>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>>         (i915#12313
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html>
>>         (i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         +59 other tests skip
>>  *
>>
>>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html>
>>         (i915#14098
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>>         / i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         +55 other tests skip
>>  *
>>
>>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>>         (i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         +39 other tests skip
>>  *
>>
>>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-edp-1:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-edp-1.html>
>>         (i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         +34 other tests skip
>>  *
>>
>>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html>
>>         (i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         +37 other tests skip
>>  *
>>
>>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html>
>>         (i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         +21 other tests skip
>>  *
>>
>>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>>         (i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         +4 other tests skip
>>  *
>>
>>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html>
>>         (i915#12313
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>>         +3 other tests skip
>>  *
>>
>>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html>
>>         (i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         +142 other tests skip
>>  *
>>
>>     igt@kms_cdclk@mode-transition:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_cdclk@mode-transition.html>
>>         (i915#3742
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@kms_cdclk@mode-transition.html>
>>         (i915#3742
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>>  *
>>
>>     igt@kms_cdclk@mode-transition-all-outputs:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@kms_cdclk@mode-transition-all-outputs.html>
>>         (i915#13784
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784>)
>>  *
>>
>>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html>
>>         (i915#13781
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781>)
>>         +4 other tests skip
>>  *
>>
>>     igt@kms_cdclk@plane-scaling:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_cdclk@plane-scaling.html>
>>         (i915#3742
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>>  *
>>
>>     igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html>
>>         (i915#11151
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>>         / i915#7828
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>>         +5 other tests skip
>>  *
>>
>>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html>
>>         (i915#11151
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>>         / i915#7828
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>>         +6 other tests skip
>>  *
>>
>>     igt@kms_chamelium_frames@hdmi-crc-multiple:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_chamelium_frames@hdmi-crc-multiple.html>
>>         (i915#11151
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>>         / i915#7828
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html>
>>         (i915#11151
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>>         / i915#7828
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>>         +15 other tests skip
>>  *
>>
>>     igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-3/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html>
>>         (i915#11151
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>>         / i915#7828
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_chamelium_hpd@vga-hpd-after-suspend:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html>
>>         (i915#11151
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>>         / i915#7828
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>>         +6 other tests skip
>>  *
>>
>>     igt@kms_chamelium_hpd@vga-hpd-fast:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>>         (i915#11151
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>>         / i915#7828
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>>         +3 other tests skip
>>  *
>>
>>     igt@kms_content_protection@atomic:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_content_protection@atomic.html>
>>         (i915#6944
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>>         / i915#7116
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>
>>         / i915#7118
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>>         / i915#9424
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_content_protection@atomic.html>
>>         (i915#7116
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>
>>         / i915#9424
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_content_protection@atomic.html>
>>         (i915#6944
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>>         / i915#9424
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_content_protection@atomic.html>
>>         (i915#7118
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>>         / i915#9424
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>>  *
>>
>>     igt@kms_content_protection@content-type-change:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-10/igt@kms_content_protection@content-type-change.html>
>>         (i915#6944
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>>         / i915#9424
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>>  *
>>
>>     igt@kms_content_protection@dp-mst-lic-type-1:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-1.html>
>>         (i915#3299
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>>  *
>>
>>     igt@kms_content_protection@dp-mst-type-0:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0.html>
>>         (i915#3116
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>>  *
>>
>>     igt@kms_content_protection@legacy:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@kms_content_protection@legacy.html>
>>         (i915#6944
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>>         / i915#7116
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>
>>         / i915#7118
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>>         / i915#9424
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>>  *
>>
>>     igt@kms_content_protection@mei-interface:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_content_protection@mei-interface.html>
>>         (i915#9424
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>>  *
>>
>>     igt@kms_content_protection@srm:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@kms_content_protection@srm.html>
>>         (i915#7118
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_content_protection@srm.html>
>>         (i915#7118
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-15/igt@kms_content_protection@srm.html>
>>         (i915#7116
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>)
>>  *
>>
>>     igt@kms_content_protection@uevent:
>>
>>       o shard-dg2: NOTRUN -> FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_content_protection@uevent.html>
>>         (i915#1339
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339>
>>         / i915#7173
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>>         +1 other test fail
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_content_protection@uevent.html>
>>         (i915#7118
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>>         / i915#9424
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>>  *
>>
>>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>>         (i915#13049
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>>         (i915#13049
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>>  *
>>
>>     igt@kms_cursor_crc@cursor-onscreen-128x42:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html>
>>         (i915#8814
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_cursor_crc@cursor-onscreen-32x32:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_cursor_crc@cursor-random-512x512:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_cursor_crc@cursor-random-512x512.html>
>>         (i915#13049
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>>         +2 other tests skip
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html>
>>         (i915#13049
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>>  *
>>
>>     igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>>         +9 other tests skip
>>  *
>>
>>     igt@kms_cursor_crc@cursor-sliding-128x42:
>>
>>       o shard-tglu: NOTRUN -> FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42.html>
>>         (i915#13566
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>>         +1 other test fail
>>  *
>>
>>     igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
>>
>>       o shard-rkl: NOTRUN -> FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html>
>>         (i915#13566
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>>         +2 other tests fail
>>  *
>>
>>     igt@kms_cursor_crc@cursor-sliding-32x10:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>>         +3 other tests skip
>>  *
>>
>>     igt@kms_cursor_crc@cursor-sliding-512x170:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>>         (i915#13049
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>>  *
>>
>>     igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
>>         (i915#13046
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046>
>>         / i915#5354
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>>         +5 other tests skip
>>  *
>>
>>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>>         (i915#4103
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>
>>         / i915#4213
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>>         (i915#4103
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>>         (i915#4103
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>>         (i915#4103
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>
>>         / i915#4213
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>>  *
>>
>>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>>
>>       o shard-snb: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>>         +1 other test skip
>>  *
>>
>>     igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html>
>>         (i915#13046
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046>
>>         / i915#5354
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>>  *
>>
>>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html>
>>         (i915#9067
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067>)
>>  *
>>
>>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>>         (i915#9723
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>>  *
>>
>>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>>         (i915#9833
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833>)
>>  *
>>
>>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#3804
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>>  *
>>
>>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html>
>>         (i915#3804
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>>  *
>>
>>     igt@kms_dp_aux_dev:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@kms_dp_aux_dev.html>
>>         (i915#1257
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>)
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-2/igt@kms_dp_aux_dev.html>
>>         (i915#1257
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>)
>>  *
>>
>>     igt@kms_dp_link_training@uhbr-mst:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-10/igt@kms_dp_link_training@uhbr-mst.html>
>>         (i915#13748
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>>  *
>>
>>     igt@kms_dp_link_training@uhbr-sst:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst.html>
>>         (i915#13748
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>>  *
>>
>>     igt@kms_dp_linktrain_fallback@dp-fallback:
>>
>>       o shard-dg2: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>>         (i915#13707
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>>  *
>>
>>     igt@kms_dsc@dsc-basic:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_dsc@dsc-basic.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#3840
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_dsc@dsc-basic.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#3840
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>>  *
>>
>>     igt@kms_dsc@dsc-fractional-bpp:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp.html>
>>         (i915#3840
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>>         / i915#9688
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html>
>>         (i915#3840
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>>         +1 other test skip
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-19/igt@kms_dsc@dsc-fractional-bpp.html>
>>         (i915#3840
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp.html>
>>         (i915#3840
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-1/igt@kms_dsc@dsc-fractional-bpp.html>
>>         (i915#3840
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>>         / i915#9688
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>>  *
>>
>>     igt@kms_dsc@dsc-with-formats:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@kms_dsc@dsc-with-formats.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#3840
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>>  *
>>
>>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>>         (i915#3840
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>>         / i915#9053
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053>)
>>  *
>>
>>     igt@kms_feature_discovery@display-2x:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_feature_discovery@display-2x.html>
>>         (i915#1839
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>>  *
>>
>>     igt@kms_feature_discovery@psr1:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-2/igt@kms_feature_discovery@psr1.html>
>>         (i915#658
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>>         +1 other test skip
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@kms_feature_discovery@psr1.html>
>>         (i915#658
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_feature_discovery@psr2:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-12/igt@kms_feature_discovery@psr2.html>
>>         (i915#658
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@kms_feature_discovery@psr2.html>
>>         (i915#658
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>>  *
>>
>>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html>
>>         (i915#9934
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>>         +7 other tests skip
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-19/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html>
>>         (i915#9934
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_flip@2x-flip-vs-dpms:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms.html>
>>         (i915#3637
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>>         / i915#9934
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html>
>>         (i915#9934
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>>         +19 other tests skip
>>  *
>>
>>     igt@kms_flip@2x-flip-vs-fences-interruptible:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>>         (i915#8381
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>>         (i915#8381
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>>  *
>>
>>     igt@kms_flip@2x-flip-vs-modeset:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@kms_flip@2x-flip-vs-modeset.html>
>>         (i915#3637
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>>         / i915#9934
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>>         +3 other tests skip
>>  *
>>
>>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>>
>>       o shard-snb: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>>         -> TIMEOUT
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>>         (i915#14033
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033>
>>         / i915#14350
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350>)
>>       o shard-glk: NOTRUN -> INCOMPLETE
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>>         (i915#12745
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>>         / i915#4839
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>>  *
>>
>>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
>>
>>       o shard-glk: NOTRUN -> INCOMPLETE
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html>
>>         (i915#4839
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>>  *
>>
>>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
>>
>>       o shard-snb: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html>
>>         -> TIMEOUT
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html>
>>         (i915#14033
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033>)
>>  *
>>
>>     igt@kms_flip@2x-modeset-vs-vblank-race:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>>         (i915#9934
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_flip@2x-plain-flip-ts-check:
>>
>>       o shard-snb: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check.html>
>>         -> FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb6/igt@kms_flip@2x-plain-flip-ts-check.html>
>>         (i915#11832
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832>
>>         / i915#13734
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734>)
>>         +1 other test fail
>>  *
>>
>>     igt@kms_flip@2x-wf_vblank-ts-check:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html>
>>         (i915#3637
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>>         / i915#9934
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>>  *
>>
>>     igt@kms_flip@basic-plain-flip@b-hdmi-a1:
>>
>>       o shard-rkl: NOTRUN -> DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html>
>>         (i915#12964
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>>         +20 other tests dmesg-warn
>>  *
>>
>>     igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
>>
>>       o shard-rkl: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html>
>>         -> DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html>
>>         (i915#12964
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>>         +11 other tests dmesg-warn
>>  *
>>
>>     igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
>>
>>       o shard-tglu: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-tglu-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html>
>>         -> FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html>
>>         (i915#13734
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734>)
>>         +1 other test fail
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#8810
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810>
>>         / i915#8813
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
>>         (i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>>         / i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html>
>>         (i915#8810
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810>
>>         / i915#8813
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html>
>>         (i915#2587
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>>         / i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
>>
>>       o shard-dg1: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html>
>>         -> DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html>
>>         (i915#4423
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>>         (i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>>         / i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>>         (i915#2587
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>>         / i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html>
>>         (i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>>         / i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>>         (i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html>
>>         (i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>>         / i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#5190
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html>
>>         (i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>>         (i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>>         / i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#5190
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>>         (i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>>         / i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html>
>>         (i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>>         (i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>>         / i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#8813
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>>         +3 other tests skip
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>>         (i915#2672
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>>         / i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>>         (i915#10055
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055>)
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>>         (i915#10055
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055>)
>>  *
>>
>>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html>
>>         (i915#3458
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>>         +6 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html>
>>         +36 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>>         +39 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html>
>>         (i915#5354
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>>         +15 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html>
>>         (i915#1825
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>>         +6 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>>         +15 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html>
>>         (i915#8708
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>>         +25 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>>         (i915#9766
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>>  *
>>
>>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html>
>>         (i915#3458
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>>         +16 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>>         (i915#8708
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>>         +8 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>>         (i915#8708
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>>         +6 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html>
>>         (i915#3023
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>>         +45 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html>
>>         (i915#8708
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>>         +7 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html>
>>         (i915#1825
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>>         +63 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html>
>>         (i915#5354
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>>         +34 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html>
>>         +61 other tests skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html>
>>         (i915#3458
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>>         +6 other tests skip
>>  *
>>
>>     igt@kms_getfb@getfb-reject-ccs:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_getfb@getfb-reject-ccs.html>
>>         (i915#6118
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6118>)
>>  *
>>
>>     igt@kms_hdr@bpc-switch:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_hdr@bpc-switch.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#8228
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>>  *
>>
>>     igt@kms_hdr@invalid-metadata-sizes:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#8228
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@kms_hdr@invalid-metadata-sizes.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#8228
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>>  *
>>
>>     igt@kms_hdr@static-swap:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-10/igt@kms_hdr@static-swap.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#8228
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>>  *
>>
>>     igt@kms_hdr@static-toggle-suspend:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#8228
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_joiner@invalid-modeset-big-joiner:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_joiner@invalid-modeset-big-joiner.html>
>>         (i915#10656
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>>  *
>>
>>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>>         (i915#12388
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388>)
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>>         (i915#12388
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388>)
>>  *
>>
>>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>>         (i915#10656
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>>         (i915#12394
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394>)
>>  *
>>
>>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>>         (i915#4816
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816>)
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>>         (i915#4816
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816>)
>>  *
>>
>>     igt@kms_panel_fitting@atomic-fastset:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@kms_panel_fitting@atomic-fastset.html>
>>         (i915#6301
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>>  *
>>
>>     igt@kms_plane_alpha_blend@alpha-opaque-fb:
>>
>>       o shard-glk: NOTRUN -> FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque-fb.html>
>>         (i915#10647
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>
>>         / i915#12169
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169>)
>>  *
>>
>>     igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
>>
>>       o shard-glk: NOTRUN -> FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html>
>>         (i915#10647
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>)
>>         +1 other test fail
>>  *
>>
>>     igt@kms_plane_cursor@overlay:
>>
>>       o shard-mtlp: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-mtlp-8/igt@kms_plane_cursor@overlay.html>
>>         -> DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-7/igt@kms_plane_cursor@overlay.html>
>>         (i915#14371
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14371>)
>>  *
>>
>>     igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64:
>>
>>       o shard-mtlp: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-mtlp-8/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64.html>
>>         -> DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-7/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64.html>
>>         (i915#13736
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13736>)
>>  *
>>
>>     igt@kms_plane_lowres@tiling-x:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_plane_lowres@tiling-x.html>
>>         (i915#11614
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614>
>>         / i915#3582
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html>
>>         (i915#10226
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226>
>>         / i915#11614
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614>
>>         / i915#3582
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_plane_multiple@2x-tiling-x:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-2/igt@kms_plane_multiple@2x-tiling-x.html>
>>         (i915#13958
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>>  *
>>
>>     igt@kms_plane_multiple@2x-tiling-y:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-y.html>
>>         (i915#13958
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>>         +2 other tests skip
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@kms_plane_multiple@2x-tiling-y.html>
>>         (i915#13958
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>>  *
>>
>>     igt@kms_plane_multiple@tiling-4:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_plane_multiple@tiling-4.html>
>>         (i915#14259
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>)
>>  *
>>
>>     igt@kms_plane_scaling@intel-max-src-size:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html>
>>         (i915#6953
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>>  *
>>
>>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html>
>>         (i915#12247
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>>         / i915#9423
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html>
>>         (i915#12247
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>>         +4 other tests skip
>>  *
>>
>>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html>
>>         (i915#12247
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>>         +8 other tests skip
>>  *
>>
>>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>>         (i915#12247
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>>         / i915#9423
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>>  *
>>
>>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html>
>>         (i915#12247
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>>         +3 other tests skip
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html>
>>         (i915#12247
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>>         +15 other tests skip
>>  *
>>
>>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html>
>>         (i915#12247
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>>         / i915#6953
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>
>>         / i915#9423
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html>
>>         (i915#12247
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>>         / i915#6953
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html>
>>         (i915#12247
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>>         +11 other tests skip
>>  *
>>
>>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html>
>>         (i915#12247
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>>         / i915#6953
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>>  *
>>
>>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html>
>>         (i915#12247
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>>         +8 other tests skip
>>  *
>>
>>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html>
>>         (i915#12247
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>>         / i915#6953
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>>  *
>>
>>     igt@kms_pm_backlight@bad-brightness:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_pm_backlight@bad-brightness.html>
>>         (i915#5354
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-16/igt@kms_pm_backlight@bad-brightness.html>
>>         (i915#5354
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>>  *
>>
>>     igt@kms_pm_backlight@fade-with-dpms:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html>
>>         (i915#9812
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_pm_dc@dc3co-vpb-simulation:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>>         (i915#9685
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>>  *
>>
>>     igt@kms_pm_lpsp@kms-lpsp:
>>
>>       o shard-dg2: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html>
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html>
>>         (i915#9340
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html>
>>         (i915#3828
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>>  *
>>
>>     igt@kms_pm_rpm@modeset-lpsp-stress:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>>         (i915#9519
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>>  *
>>
>>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>>
>>       o shard-dg2: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>>         (i915#9519
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>>  *
>>
>>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>>         (i915#9519
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>>         (i915#9519
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>>  *
>>
>>     igt@kms_prime@basic-modeset-hybrid:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html>
>>         (i915#6524
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>
>>         / i915#6805
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805>)
>>  *
>>
>>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html>
>>         (i915#12316
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316>)
>>         +1 other test skip
>>       o shard-snb: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html>
>>         (i915#11520
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html>
>>         (i915#9808
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808>)
>>  *
>>
>>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-16/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html>
>>         (i915#11520
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>>         +3 other tests skip
>>  *
>>
>>     igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html>
>>         (i915#11520
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>>         +17 other tests skip
>>  *
>>
>>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>>
>>       o shard-glk: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk9/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>>         (i915#11520
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>>         +10 other tests skip
>>  *
>>
>>     igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html>
>>         (i915#11520
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>>         (i915#11520
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>>         (i915#11520
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>>         +7 other tests skip
>>  *
>>
>>     igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html>
>>         (i915#11520
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>>         +7 other tests skip
>>  *
>>
>>     igt@kms_psr2_su@page_flip-p010:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html>
>>         (i915#9683
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>>  *
>>
>>     igt@kms_psr@fbc-pr-primary-mmap-gtt:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_psr@fbc-pr-primary-mmap-gtt.html>
>>         (i915#1072
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>>         / i915#9732
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>>         +7 other tests skip
>>  *
>>
>>     igt@kms_psr@fbc-psr-primary-mmap-gtt:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@kms_psr@fbc-psr-primary-mmap-gtt.html>
>>         (i915#1072
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>>         / i915#9732
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>>         +19 other tests skip
>>  *
>>
>>     igt@kms_psr@pr-cursor-blt:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-7/igt@kms_psr@pr-cursor-blt.html>
>>         (i915#9688
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>>         +6 other tests skip
>>  *
>>
>>     igt@kms_psr@pr-suspend:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-14/igt@kms_psr@pr-suspend.html>
>>         (i915#1072
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>>         / i915#9732
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>>         +9 other tests skip
>>  *
>>
>>     igt@kms_psr@psr2-cursor-render:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@kms_psr@psr2-cursor-render.html>
>>         (i915#9732
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>>         +13 other tests skip
>>  *
>>
>>     igt@kms_psr@psr2-sprite-mmap-gtt:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html>
>>         (i915#9732
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>>         +10 other tests skip
>>  *
>>
>>     igt@kms_psr@psr2-suspend:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_psr@psr2-suspend.html>
>>         (i915#1072
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>>         / i915#9732
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>>         +33 other tests skip
>>  *
>>
>>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>>         (i915#9685
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>>  *
>>
>>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>>         (i915#9685
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>>  *
>>
>>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>>         (i915#12755
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>
>>         / i915#5190
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>>  *
>>
>>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>>         (i915#5289
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_rotation_crc@sprite-rotation-270:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-270.html>
>>         (i915#12755
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>)
>>  *
>>
>>     igt@kms_setmode@basic:
>>
>>       o shard-snb: NOTRUN -> FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb6/igt@kms_setmode@basic.html>
>>         (i915#5465
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465>)
>>         +2 other tests fail
>>  *
>>
>>     igt@kms_setmode@basic-clone-single-crtc:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_setmode@clone-exclusive-crtc:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@kms_setmode@clone-exclusive-crtc.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>>         +2 other tests skip
>>  *
>>
>>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>>         (i915#8623
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>>         (i915#8623
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>>         (i915#8623
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>>  *
>>
>>     igt@kms_vrr@max-min:
>>
>>       o shard-tglu-1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_vrr@max-min.html>
>>         (i915#9906
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>>  *
>>
>>     igt@kms_vrr@seamless-rr-switch-virtual:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html>
>>         (i915#9906
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>>         +1 other test skip
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-virtual.html>
>>         (i915#9906
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_vrr@seamless-rr-switch-vrr:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.html>
>>         (i915#9906
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>>         +1 other test skip
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-vrr.html>
>>         (i915#9906
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>>         +1 other test skip
>>       o shard-tglu: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-vrr.html>
>>         (i915#9906
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>>       o shard-mtlp: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_vrr@seamless-rr-switch-vrr.html>
>>         (i915#8808
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>
>>         / i915#9906
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>>  *
>>
>>     igt@kms_writeback@writeback-fb-id:
>>
>>       o shard-glk: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk5/igt@kms_writeback@writeback-fb-id.html>
>>         (i915#2437
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>>         +3 other tests skip
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_writeback@writeback-fb-id.html>
>>         (i915#2437
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_writeback@writeback-fb-id.html>
>>         (i915#2437
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_writeback@writeback-pixel-formats:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@kms_writeback@writeback-pixel-formats.html>
>>         (i915#2437
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>>         / i915#9412
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-12/igt@kms_writeback@writeback-pixel-formats.html>
>>         (i915#2437
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>>         / i915#9412
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>>  *
>>
>>     igt@perf@gen8-unprivileged-single-ctx-counters:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>>         (i915#2436
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436>)
>>  *
>>
>>     igt@perf@global-sseu-config-invalid:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@perf@global-sseu-config-invalid.html>
>>         (i915#7387
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387>)
>>  *
>>
>>     igt@perf@mi-rpc:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@perf@mi-rpc.html>
>>         (i915#2434
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>>  *
>>
>>     igt@perf_pmu@busy-idle-check-all@bcs0:
>>
>>       o shard-mtlp: PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@bcs0.html>
>>         -> FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all@bcs0.html>
>>         (i915#4349
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349>)
>>         +5 other tests fail
>>  *
>>
>>     igt@perf_pmu@rc6@other-idle-gt0:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@perf_pmu@rc6@other-idle-gt0.html>
>>         (i915#8516
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>>  *
>>
>>     igt@prime_vgem@basic-fence-flip:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-12/igt@prime_vgem@basic-fence-flip.html>
>>         (i915#3708
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@prime_vgem@basic-fence-flip.html>
>>         (i915#3708
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>>  *
>>
>>     igt@prime_vgem@basic-fence-read:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@prime_vgem@basic-fence-read.html>
>>         (i915#3291
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>>         / i915#3708
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>>  *
>>
>>     igt@prime_vgem@basic-read:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@prime_vgem@basic-read.html>
>>         (i915#3291
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>>         / i915#3708
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>>  *
>>
>>     igt@prime_vgem@fence-flip-hang:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@prime_vgem@fence-flip-hang.html>
>>         (i915#3708
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>>  *
>>
>>     igt@prime_vgem@fence-read-hang:
>>
>>       o shard-dg2-9: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@prime_vgem@fence-read-hang.html>
>>         (i915#3708
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>>  *
>>
>>     igt@sriov_basic@bind-unbind-vf:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@sriov_basic@bind-unbind-vf.html>
>>         (i915#9917
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>>         +1 other test skip
>>
>>
>>         Possible fixes
>>
>>  *
>>
>>     igt@gem_ccs@suspend-resume:
>>
>>       o shard-dg2: INCOMPLETE
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-6/igt@gem_ccs@suspend-resume.html>
>>         (i915#13356
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@gem_ccs@suspend-resume.html>
>>  *
>>
>>     igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
>>
>>       o shard-dg2: INCOMPLETE
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-6/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html>
>>         (i915#12392
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392>
>>         / i915#13356
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html>
>>  *
>>
>>     igt@gem_eio@kms:
>>
>>       o shard-tglu: DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-tglu-5/igt@gem_eio@kms.html>
>>         (i915#13363
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@gem_eio@kms.html>
>>  *
>>
>>     igt@gem_lmem_swapping@smem-oom@lmem0:
>>
>>       o shard-dg1: TIMEOUT
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>>         (i915#5493
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>>         +1 other test pass
>>  *
>>
>>     igt@gem_mmap_offset@partial-remap@smem0:
>>
>>       o shard-rkl: DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-4/igt@gem_mmap_offset@partial-remap@smem0.html>
>>         (i915#12964
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@gem_mmap_offset@partial-remap@smem0.html>
>>         +9 other tests pass
>>  *
>>
>>     igt@gem_softpin@noreloc-s3:
>>
>>       o shard-rkl: INCOMPLETE
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-3/igt@gem_softpin@noreloc-s3.html>
>>         (i915#13809
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@gem_softpin@noreloc-s3.html>
>>  *
>>
>>     igt@i915_pm_freq_api@freq-suspend@gt0:
>>
>>       o shard-dg2: INCOMPLETE
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-2/igt@i915_pm_freq_api@freq-suspend@gt0.html>
>>         (i915#12455
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12455>
>>         / i915#13820
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html>
>>         +1 other test pass
>>  *
>>
>>     igt@kms_color@ctm-red-to-blue:
>>
>>       o shard-dg1: DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-16/igt@kms_color@ctm-red-to-blue.html>
>>         (i915#4423
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-15/igt@kms_color@ctm-red-to-blue.html>
>>         +1 other test pass
>>  *
>>
>>     igt@kms_cursor_crc@cursor-random-256x85:
>>
>>       o shard-tglu: FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-tglu-5/igt@kms_cursor_crc@cursor-random-256x85.html>
>>         (i915#13566
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-10/igt@kms_cursor_crc@cursor-random-256x85.html>
>>         +1 other test pass
>>  *
>>
>>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>>
>>       o shard-snb: INCOMPLETE
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>>         (i915#14345
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14345>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>>  *
>>
>>     igt@kms_dp_link_training@non-uhbr-sst:
>>
>>       o shard-dg2: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst.html>
>>         (i915#13749
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_dp_link_training@non-uhbr-sst.html>
>>  *
>>
>>     igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
>>
>>       o shard-snb: FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html>
>>         (i915#13734
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html>
>>         +1 other test pass
>>  *
>>
>>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
>>
>>       o shard-snb: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html>
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html>
>>  *
>>
>>     igt@kms_hdr@bpc-switch-dpms:
>>
>>       o shard-dg2: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-7/igt@kms_hdr@bpc-switch-dpms.html>
>>         (i915#3555
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>>         / i915#8228
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_hdr@bpc-switch-dpms.html>
>>  *
>>
>>     igt@kms_pm_rpm@modeset-lpsp:
>>
>>       o shard-dg2: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html>
>>         (i915#9519
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html>
>>  *
>>
>>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>>
>>       o shard-rkl: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>>         (i915#9519
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>>  *
>>
>>     igt@perf_pmu@module-unload:
>>
>>       o shard-mtlp: INCOMPLETE
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-mtlp-4/igt@perf_pmu@module-unload.html>
>>         (i915#13520
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-7/igt@perf_pmu@module-unload.html>
>>       o shard-dg2: INCOMPLETE
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-6/igt@perf_pmu@module-unload.html>
>>         (i915#13520
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520>)
>>         -> PASS
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@perf_pmu@module-unload.html>
>>
>>
>>         Warnings
>>
>>  *
>>
>>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
>>
>>       o shard-rkl: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html>
>>         (i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html>
>>         (i915#14098
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>>         / i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>  *
>>
>>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
>>
>>       o shard-dg1: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-13/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html>
>>         (i915#4423
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>>         / i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html>
>>         (i915#6095
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_content_protection@legacy:
>>
>>       o shard-dg2: FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-10/igt@kms_content_protection@legacy.html>
>>         (i915#7173
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@kms_content_protection@legacy.html>
>>         (i915#7118
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>>         / i915#9424
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>>  *
>>
>>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>>
>>       o shard-rkl: FAIL
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>>         (i915#2346
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346>)
>>         -> DMESG-WARN
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>>         (i915#12964
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>>  *
>>
>>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
>>
>>       o shard-dg2: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html>
>>         (i915#10433
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>>         / i915#3458
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html>
>>         (i915#3458
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>>
>>       o shard-dg1: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html>
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html>
>>         (i915#4423
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>>  *
>>
>>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
>>
>>       o shard-dg2: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html>
>>         (i915#3458
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html>
>>         (i915#10433
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>>         / i915#3458
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>>         +1 other test skip
>>  *
>>
>>     igt@kms_hdr@brightness-with-hdr:
>>
>>       o shard-dg2: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html>
>>         (i915#12713
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713>)
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html>
>>         (i915#13331
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331>)
>>       o shard-dg1: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-18/igt@kms_hdr@brightness-with-hdr.html>
>>         (i915#12713
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713>)
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html>
>>         (i915#1187
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187>
>>         / i915#12713
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713>)
>>  *
>>
>>     igt@kms_pm_backlight@fade-with-suspend:
>>
>>       o shard-dg1: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-12/igt@kms_pm_backlight@fade-with-suspend.html>
>>         (i915#5354
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_pm_backlight@fade-with-suspend.html>
>>         (i915#4423
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>>         / i915#5354
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>>  *
>>
>>     igt@kms_psr@pr-sprite-plane-move:
>>
>>       o shard-dg1: SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-16/igt@kms_psr@pr-sprite-plane-move.html>
>>         (i915#1072
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>>         / i915#4423
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>>         / i915#9732
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>>         -> SKIP
>>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-18/igt@kms_psr@pr-sprite-plane-move.html>
>>         (i915#1072
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>>         / i915#9732
>>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>>
>>
>>     Build changes
>>
>>   * CI: CI-20190529 -> None
>>   * IGT: IGT_8383 -> IGTPW_13206
>>   * Piglit: piglit_4509 -> None
>>
>> CI-20190529: 20190529
>> CI_DRM_16611: bf0749a9930efe943554c3f73454d03c43779d15 @ 
>> git://anongit.freedesktop.org/gfx-ci/linux
>> IGTPW_13206: 0b49229cc7ef6d577ae4afb48a5149a197a8dd43 @ 
>> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>> IGT_8383: 8383
>> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
>> git://anongit.freedesktop.org/piglit
>>
>

--------------VGppMzTCvOi7Khca2De1cIRO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 30-05-2025 22:38, Anirban, Sk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:586ec0b5-138b-4fe9-bd6f-165c0dc9ae37@intel.com">
      
      Hi,<br>
      The issues reported here are not related to my changes.<br>
      <br>
      Thanks,<br>
      Anirban<br>
      <br>
      <div class="moz-cite-prefix">On 30-05-2025 18:22, Patchwork wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:174860957477.35239.8132115509813169320@1538d3639d33">
        <title>Project List - Patchwork</title>
        <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
        <b>Patch Details</b>
        <table>
          <tbody>
            <tr>
              <td><b>Series:</b></td>
              <td>tests/i915/pm_rc6_residency: Use sysfs to achieve peak
                frequency (rev4)</td>
            </tr>
            <tr>
              <td><b>URL:</b></td>
              <td><a href="https://patchwork.freedesktop.org/series/148054/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/148054/</a></td>
            </tr>
            <tr>
              <td><b>State:</b></td>
              <td>failure</td>
            </tr>
            <tr>
              <td><b>Details:</b></td>
              <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/index.html</a></td>
            </tr>
          </tbody>
        </table>
        <h1>CI Bug Log - changes from CI_DRM_16611_full -&gt;
          IGTPW_13206_full</h1>
        <h2>Summary</h2>
        <p><strong>FAILURE</strong></p>
        <p>Serious unknown changes coming with IGTPW_13206_full
          absolutely need to be<br>
          verified manually.</p>
        <p>If you think the reported changes have nothing to do with the
          changes<br>
          introduced in IGTPW_13206_full, please notify your bug team (<a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:I915-ci-infra@lists.freedesktop.org" moz-do-not-send="true">I915-ci-infra@lists.freedesktop.org</a>)
          to allow them<br>
          to document this new failure mode, which will reduce false
          positives in CI.</p>
        <p>External URL: <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/index.html" moz-do-not-send="true">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/index.html</a></p>
        <h2>Participating hosts (10 -&gt; 10)</h2>
        <p>No changes in participating hosts</p>
        <h2>Possible new issues</h2>
        <p>Here are the unknown changes that may have been introduced in
          IGTPW_13206_full:</p>
        <h3>IGT changes</h3>
        <h4>Possible regressions</h4>
        <ul>
          <li>igt@perf_pmu@module-unload:
            <ul>
              <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk1/igt@perf_pmu@module-unload.html" moz-do-not-send="true">ABORT</a></li>
            </ul>
          </li>
        </ul>
        <h2>New tests</h2>
        <p>New tests have been introduced between CI_DRM_16611_full and
          IGTPW_13206_full:</p>
        <h3>New IGT tests (3)</h3>
        <ul>
          <li>
            <p>igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:</p>
            <ul>
              <li>Statuses : 1 pass(s)</li>
              <li>Exec time: [10.97] s</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-flip-vs-fences-interruptible@ac-hdmi-a1-hdmi-a2:</p>
            <ul>
              <li>Statuses : 1 pass(s)</li>
              <li>Exec time: [10.76] s</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-flip-vs-fences-interruptible@bc-hdmi-a1-hdmi-a2:</p>
            <ul>
              <li>Statuses : 1 pass(s)</li>
              <li>Exec time: [10.69] s</li>
            </ul>
          </li>
        </ul>
        <h2>Known issues</h2>
        <p>Here are the changes found in IGTPW_13206_full that come from
          known issues:</p>
        <h3>IGT changes</h3>
        <h4>Issues hit</h4>
        <ul>
          <li>
            <p>igt@api_intel_bb@crc32:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-12/igt@api_intel_bb@crc32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230" moz-do-not-send="true">i915#6230</a>)</li>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@api_intel_bb@crc32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230" moz-do-not-send="true">i915#6230</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@api_intel_bb@object-reloc-keep-cache:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@api_intel_bb@object-reloc-keep-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_basic@multigpu-create-close:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@gem_basic@multigpu-create-close.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697" moz-do-not-send="true">i915#7697</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_ccs@ctrl-surf-copy:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_ccs@suspend-resume:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>) +1 other test
                skip</li>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-2/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_compute@compute-square:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@gem_compute@compute-square.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13665" moz-do-not-send="true">i915#13665</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335" moz-do-not-send="true">i915#6335</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_ctx_freq@sysfs:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-10/igt@gem_ctx_freq@sysfs.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@gem_ctx_freq@sysfs.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561" moz-do-not-send="true">i915#9561</a>) +1 other test
                fail</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_ctx_persistence@heartbeat-hang:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555" moz-do-not-send="true">i915#8555</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_ctx_persistence@heartbeat-many:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-many.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555" moz-do-not-send="true">i915#8555</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_ctx_persistence@legacy-engines-cleanup:</p>
            <ul>
              <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb5/igt@gem_ctx_persistence@legacy-engines-cleanup.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099" moz-do-not-send="true">i915#1099</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_ctx_sseu@mmap-args:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@gem_ctx_sseu@mmap-args.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280" moz-do-not-send="true">i915#280</a>)</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280" moz-do-not-send="true">i915#280</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_eio@hibernate:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@gem_eio@hibernate.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030" moz-do-not-send="true">i915#10030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975" moz-do-not-send="true">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213" moz-do-not-send="true">i915#8213</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_eio@reset-stress:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-10/igt@gem_eio@reset-stress.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@gem_eio@reset-stress.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784" moz-do-not-send="true">i915#5784</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_balancer@bonded-dual:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@gem_exec_balancer@bonded-dual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771" moz-do-not-send="true">i915#4771</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_balancer@bonded-false-hang:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-19/igt@gem_exec_balancer@bonded-false-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_balancer@parallel:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@gem_exec_balancer@parallel.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_balancer@parallel-bb-first:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_balancer@sliced:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@gem_exec_balancer@sliced.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_big@single:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@gem_exec_big@single.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713" moz-do-not-send="true">i915#11713</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_capture@capture-invisible:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@gem_exec_capture@capture-invisible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334" moz-do-not-send="true">i915#6334</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_fence@submit67:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@gem_exec_fence@submit67.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_flush@basic-uc-set-default:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-7/igt@gem_exec_flush@basic-uc-set-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@gem_exec_flush@basic-wb-ro-before-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" moz-do-not-send="true">i915#4852</a>) +3 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_flush@basic-wb-ro-default:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_exec_flush@basic-wb-ro-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" moz-do-not-send="true">i915#4852</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-19/igt@gem_exec_flush@basic-wb-rw-before-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" moz-do-not-send="true">i915#4852</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_gttfill@basic:</p>
            <ul>
              <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-7/igt@gem_exec_gttfill@basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@gem_exec_gttfill@basic.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-7/igt@gem_exec_reloc@basic-cpu-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_reloc@basic-gtt-read:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +4 other tests
                skip</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-19/igt@gem_exec_reloc@basic-gtt-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_reloc@basic-write-gtt-noreloc:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_exec_reloc@basic-write-gtt-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_reloc@basic-write-read:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +16 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_schedule@preempt-queue:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_exec_schedule@preempt-queue.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537" moz-do-not-send="true">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_schedule@preempt-queue-chain:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537" moz-do-not-send="true">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_schedule@semaphore-power:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276" moz-do-not-send="true">i915#7276</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_exec_schedule@thriceslice:</p>
            <ul>
              <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb7/igt@gem_exec_schedule@thriceslice.html" moz-do-not-send="true">SKIP</a> +66 other tests skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@gem_fenced_exec_thrash@2-spare-fences.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>) +1 other test
                skip</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-16/igt@gem_fenced_exec_thrash@2-spare-fences.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_lmem_evict@dontneed-evict-race:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582" moz-do-not-send="true">i915#7582</a>)</li>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@gem_lmem_evict@dontneed-evict-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582" moz-do-not-send="true">i915#7582</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_lmem_swapping@parallel-random-verify:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +5 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_lmem_swapping@random:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-8/igt@gem_lmem_swapping@random.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493" moz-do-not-send="true">i915#5493</a>) +1 other test
                dmesg-warn</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_lmem_swapping@verify-ccs:</p>
            <ul>
              <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk5/igt@gem_lmem_swapping@verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +6 other tests
                skip</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@gem_lmem_swapping@verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193" moz-do-not-send="true">i915#12193</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@gem_lmem_swapping@verify-ccs@lmem0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565" moz-do-not-send="true">i915#4565</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_lmem_swapping@verify-random:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_mmap_gtt@basic-small-copy:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-14/igt@gem_mmap_gtt@basic-small-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +4 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_mmap_gtt@zero-extend:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_mmap_gtt@zero-extend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +3 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_mmap_wc@copy:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@gem_mmap_wc@copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +4 other tests
                skip</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-18/igt@gem_mmap_wc@copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_mmap_wc@write:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@gem_mmap_wc@write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_mmap_wc@write-cpu-read-wc:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_mmap_wc@write-cpu-read-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +4 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@gem_partial_pwrite_pread@reads-uncached.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +6 other tests
                skip</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@gem_partial_pwrite_pread@reads-uncached.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +2 other tests
                skip</li>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads-uncached.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +13 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_pread@bench:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_pread@bench.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_pxp@create-regular-context-1:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_pxp@create-regular-context-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398" moz-do-not-send="true">i915#13398</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +4 other tests
                timeout</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>) +4 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
            <ul>
              <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-3.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-15/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-3/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send="true">i915#8428</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send="true">i915#8428</a>) +7 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send="true">i915#8428</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_set_tiling_vs_pwrite:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@gem_set_tiling_vs_pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send="true">i915#4079</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@gem_tiled_partial_pwrite_pread@writes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +14 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_tiling_max_stride:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-8/igt@gem_tiling_max_stride.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +3 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_userptr_blits@create-destroy-unsync:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) +3 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880" moz-do-not-send="true">i915#4880</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880" moz-do-not-send="true">i915#4880</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@gem_userptr_blits@readonly-pwrite-unsync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@gem_userptr_blits@readonly-pwrite-unsync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_userptr_blits@sd-probe:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@gem_userptr_blits@sd-probe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958" moz-do-not-send="true">i915#4958</a>)</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@gem_userptr_blits@sd-probe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958" moz-do-not-send="true">i915#4958</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_userptr_blits@unsync-unmap:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-4/igt@gem_userptr_blits@unsync-unmap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_workarounds@suspend-resume-fd:</p>
            <ul>
              <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-5/igt@gem_workarounds@suspend-resume-fd.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gen7_exec_parse@bitmasks:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@gen7_exec_parse@bitmasks.html" moz-do-not-send="true">SKIP</a> +11 other tests skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gen9_exec_parse@batch-zero-length:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@gen9_exec_parse@batch-zero-length.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>)</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@gen9_exec_parse@batch-zero-length.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gen9_exec_parse@bb-oversize:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) +6 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gen9_exec_parse@bb-start-out:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gen9_exec_parse@cmd-crossing-page:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@gen9_exec_parse@cmd-crossing-page.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +3 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@gen9_exec_parse@secure-batches:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@gen9_exec_parse@secure-batches.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@gen9_exec_parse@shadow-peek:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@gen9_exec_parse@shadow-peek.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +3 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_drm_fdinfo@busy-check-all@vcs1:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@i915_drm_fdinfo@busy-check-all@vcs1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527" moz-do-not-send="true">i915#11527</a>) +7 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_drm_fdinfo@most-busy-check-all:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-18/igt@i915_drm_fdinfo@most-busy-check-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073" moz-do-not-send="true">i915#14073</a>) +5 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_drm_fdinfo@most-busy-check-all@bcs0:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@i915_drm_fdinfo@most-busy-check-all@bcs0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073" moz-do-not-send="true">i915#14073</a>) +6 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_drm_fdinfo@most-busy-check-all@vecs0:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@i915_drm_fdinfo@most-busy-check-all@vecs0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073" moz-do-not-send="true">i915#14073</a>) +7 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590" moz-do-not-send="true">i915#6590</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_pm_rc6_residency@rc6-fence:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html" moz-do-not-send="true">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790" moz-do-not-send="true">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681" moz-do-not-send="true">i915#2681</a>) +1 other test
                warn</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html" moz-do-not-send="true">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790" moz-do-not-send="true">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681" moz-do-not-send="true">i915#2681</a>) +4 other tests
                warn</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_pm_rps@min-max-config-idle:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@i915_pm_rps@min-max-config-idle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681" moz-do-not-send="true">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621" moz-do-not-send="true">i915#6621</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_pm_rps@thresholds-idle-park:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@i915_pm_rps@thresholds-idle-park.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681" moz-do-not-send="true">i915#11681</a>)</li>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle-park.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681" moz-do-not-send="true">i915#11681</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_pm_sseu@full-enable:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@i915_pm_sseu@full-enable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387" moz-do-not-send="true">i915#4387</a>)</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@i915_pm_sseu@full-enable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387" moz-do-not-send="true">i915#4387</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_selftest@live:</p>
            <ul>
              <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-7/igt@i915_selftest@live.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@i915_selftest@live.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13550" moz-do-not-send="true">i915#13550</a>) +1 other test
                dmesg-fail</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_selftest@perf:</p>
            <ul>
              <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb2/igt@i915_selftest@perf.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb7/igt@i915_selftest@perf.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11703" moz-do-not-send="true">i915#11703</a>) +1 other test
                abort</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_suspend@basic-s3-without-i915:</p>
            <ul>
              <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk1/igt@i915_suspend@basic-s3-without-i915.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13736" moz-do-not-send="true">i915#13736</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@i915_suspend@forcewake:</p>
            <ul>
              <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk1/igt@i915_suspend@forcewake.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817" moz-do-not-send="true">i915#4817</a>) +1 other test
                incomplete</li>
            </ul>
          </li>
          <li>
            <p>igt@intel_hwmon@hwmon-write:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707" moz-do-not-send="true">i915#7707</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>) +1 other test
                skip</li>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>)</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454" moz-do-not-send="true">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712" moz-do-not-send="true">i915#12712</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-1-4-rc-ccs-cc:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-1-4-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709" moz-do-not-send="true">i915#8709</a>) +7 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y-rc-ccs-cc:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709" moz-do-not-send="true">i915#8709</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> +5 other tests skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-9/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +5 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-19/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +9 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> +6 other tests skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +8 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>) +4 other tests
                skip</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +3 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +4 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-16/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_big_fb@yf-tiled-addfb:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_big_fb@yf-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-send="true">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +172 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-send="true">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +24 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
            <ul>
              <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> +444 other tests skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-send="true">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434" moz-do-not-send="true">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +59 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +55 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +39 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-edp-1:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +34 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +37 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +21 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +4 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) +3 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +142 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cdclk@mode-transition:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>)</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784" moz-do-not-send="true">i915#13784</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781" moz-do-not-send="true">i915#13781</a>) +4 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cdclk@plane-scaling:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_cdclk@plane-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +5 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +6 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_chamelium_frames@hdmi-crc-multiple.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +15 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-3/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +6 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +3 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_content_protection@atomic:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116" moz-do-not-send="true">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116" moz-do-not-send="true">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_content_protection@content-type-change:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-10/igt@kms_content_protection@content-type-change.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299" moz-do-not-send="true">i915#3299</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_content_protection@dp-mst-type-0:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116" moz-do-not-send="true">i915#3116</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_content_protection@legacy:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@kms_content_protection@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116" moz-do-not-send="true">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_content_protection@mei-interface:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_content_protection@srm:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a>)</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a>)</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-15/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116" moz-do-not-send="true">i915#7116</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_content_protection@uevent:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_content_protection@uevent.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339" moz-do-not-send="true">i915#1339</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173" moz-do-not-send="true">i915#7173</a>) +1 other test
                fail</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814" moz-do-not-send="true">i915#8814</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_crc@cursor-random-512x512:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>) +2 other tests
                skip</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +9 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +1 other test
                fail</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +2 other tests
                fail</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +3 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046" moz-do-not-send="true">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +5 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213" moz-do-not-send="true">i915#4213</a>)</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a>)</li>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213" moz-do-not-send="true">i915#4213</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
            <ul>
              <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046" moz-do-not-send="true">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067" moz-do-not-send="true">i915#9067</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723" moz-do-not-send="true">i915#9723</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833" moz-do-not-send="true">i915#9833</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804" moz-do-not-send="true">i915#3804</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804" moz-do-not-send="true">i915#3804</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dp_aux_dev:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@kms_dp_aux_dev.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257" moz-do-not-send="true">i915#1257</a>)</li>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-2/igt@kms_dp_aux_dev.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257" moz-do-not-send="true">i915#1257</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dp_link_training@uhbr-mst:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-10/igt@kms_dp_link_training@uhbr-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748" moz-do-not-send="true">i915#13748</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dp_link_training@uhbr-sst:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748" moz-do-not-send="true">i915#13748</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707" moz-do-not-send="true">i915#13707</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dsc@dsc-basic:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dsc@dsc-fractional-bpp:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688" moz-do-not-send="true">i915#9688</a>)</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>) +1 other test
                skip</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-19/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-1/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688" moz-do-not-send="true">i915#9688</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dsc@dsc-with-formats:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@kms_dsc@dsc-with-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053" moz-do-not-send="true">i915#9053</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_feature_discovery@display-2x:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839" moz-do-not-send="true">i915#1839</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_feature_discovery@psr1:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-2/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658" moz-do-not-send="true">i915#658</a>) +1 other test
                skip</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658" moz-do-not-send="true">i915#658</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_feature_discovery@psr2:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-12/igt@kms_feature_discovery@psr2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658" moz-do-not-send="true">i915#658</a>)</li>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@kms_feature_discovery@psr2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658" moz-do-not-send="true">i915#658</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +7 other tests
                skip</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-19/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-flip-vs-dpms:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +19 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381" moz-do-not-send="true">i915#8381</a>)</li>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381" moz-do-not-send="true">i915#8381</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-flip-vs-modeset:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@kms_flip@2x-flip-vs-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +3 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
            <ul>
              <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033" moz-do-not-send="true">i915#14033</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350" moz-do-not-send="true">i915#14350</a>)</li>
              <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745" moz-do-not-send="true">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839" moz-do-not-send="true">i915#4839</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
            <ul>
              <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839" moz-do-not-send="true">i915#4839</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
            <ul>
              <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033" moz-do-not-send="true">i915#14033</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_flip@2x-modeset-vs-vblank-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-plain-flip-ts-check:</p>
            <ul>
              <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb6/igt@kms_flip@2x-plain-flip-ts-check.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832" moz-do-not-send="true">i915#11832</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734" moz-do-not-send="true">i915#13734</a>) +1 other test
                fail</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +20 other tests
                dmesg-warn</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:</p>
            <ul>
              <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +11 other tests
                dmesg-warn</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
            <ul>
              <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-tglu-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734" moz-do-not-send="true">i915#13734</a>) +1 other test
                fail</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810" moz-do-not-send="true">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>)</li>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810" moz-do-not-send="true">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
            <ul>
              <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>) +3 other tests
                skip</li>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055" moz-do-not-send="true">i915#10055</a>)</li>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055" moz-do-not-send="true">i915#10055</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +6 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> +36 other tests skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> +39 other tests skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +15 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +6 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> +15 other tests skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +25 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766" moz-do-not-send="true">i915#9766</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +16 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +8 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +6 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) +45 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +7 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +63 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +34 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> +61 other tests skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +6 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_getfb@getfb-reject-ccs:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_getfb@getfb-reject-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6118" moz-do-not-send="true">i915#6118</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_hdr@bpc-switch:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_hdr@bpc-switch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_hdr@invalid-metadata-sizes:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@kms_hdr@invalid-metadata-sizes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_hdr@static-swap:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-10/igt@kms_hdr@static-swap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_hdr@static-toggle-suspend:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_joiner@invalid-modeset-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656" moz-do-not-send="true">i915#10656</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388" moz-do-not-send="true">i915#12388</a>)</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388" moz-do-not-send="true">i915#12388</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656" moz-do-not-send="true">i915#10656</a>)</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394" moz-do-not-send="true">i915#12394</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816" moz-do-not-send="true">i915#4816</a>)</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816" moz-do-not-send="true">i915#4816</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_panel_fitting@atomic-fastset:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
            <ul>
              <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque-fb.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647" moz-do-not-send="true">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169" moz-do-not-send="true">i915#12169</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
            <ul>
              <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647" moz-do-not-send="true">i915#10647</a>) +1 other test
                fail</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_cursor@overlay:</p>
            <ul>
              <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-mtlp-8/igt@kms_plane_cursor@overlay.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-7/igt@kms_plane_cursor@overlay.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14371" moz-do-not-send="true">i915#14371</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64:</p>
            <ul>
              <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-mtlp-8/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-7/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13736" moz-do-not-send="true">i915#13736</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_lowres@tiling-x:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_plane_lowres@tiling-x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614" moz-do-not-send="true">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582" moz-do-not-send="true">i915#3582</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226" moz-do-not-send="true">i915#10226</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614" moz-do-not-send="true">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582" moz-do-not-send="true">i915#3582</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_multiple@2x-tiling-x:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-2/igt@kms_plane_multiple@2x-tiling-x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958" moz-do-not-send="true">i915#13958</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_multiple@2x-tiling-y:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958" moz-do-not-send="true">i915#13958</a>) +2 other tests
                skip</li>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@kms_plane_multiple@2x-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958" moz-do-not-send="true">i915#13958</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_multiple@tiling-4:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_plane_multiple@tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259" moz-do-not-send="true">i915#14259</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_scaling@intel-max-src-size:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423" moz-do-not-send="true">i915#9423</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +4 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +8 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423" moz-do-not-send="true">i915#9423</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +3 other tests
                skip</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +15 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423" moz-do-not-send="true">i915#9423</a>)</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +11 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +8 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_pm_backlight@bad-brightness:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_pm_backlight@bad-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-16/igt@kms_pm_backlight@bad-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_pm_backlight@fade-with-dpms:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812" moz-do-not-send="true">i915#9812</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_pm_lpsp@kms-lpsp:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340" moz-do-not-send="true">i915#9340</a>)</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>)</li>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_prime@basic-modeset-hybrid:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524" moz-do-not-send="true">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805" moz-do-not-send="true">i915#6805</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316" moz-do-not-send="true">i915#12316</a>) +1 other test
                skip</li>
              <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808" moz-do-not-send="true">i915#9808</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-16/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +3 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +17 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
            <ul>
              <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk9/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +10 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +7 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +7 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr2_su@page_flip-p010:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send="true">i915#9683</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr@fbc-pr-primary-mmap-gtt:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_psr@fbc-pr-primary-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +7 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@kms_psr@fbc-psr-primary-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +19 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr@pr-cursor-blt:</p>
            <ul>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-7/igt@kms_psr@pr-cursor-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688" moz-do-not-send="true">i915#9688</a>) +6 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr@pr-suspend:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-14/igt@kms_psr@pr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +9 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr@psr2-cursor-render:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@kms_psr@psr2-cursor-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +13 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +10 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr@psr2-suspend:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_psr@psr2-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +33 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_rotation_crc@sprite-rotation-270:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_setmode@basic:</p>
            <ul>
              <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb6/igt@kms_setmode@basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465" moz-do-not-send="true">i915#5465</a>) +2 other tests
                fail</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_setmode@basic-clone-single-crtc:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_setmode@clone-exclusive-crtc:</p>
            <ul>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@kms_setmode@clone-exclusive-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623" moz-do-not-send="true">i915#8623</a>)</li>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623" moz-do-not-send="true">i915#8623</a>)</li>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623" moz-do-not-send="true">i915#8623</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_vrr@max-min:</p>
            <ul>
              <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-1/igt@kms_vrr@max-min.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>) +1 other test
                skip</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>) +1 other test
                skip</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>) +1 other test
                skip</li>
              <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
              <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-4/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808" moz-do-not-send="true">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_writeback@writeback-fb-id:</p>
            <ul>
              <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-glk5/igt@kms_writeback@writeback-fb-id.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>) +3 other tests
                skip</li>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@kms_writeback@writeback-fb-id.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>)</li>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@kms_writeback@writeback-fb-id.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_writeback@writeback-pixel-formats:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@kms_writeback@writeback-pixel-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>)</li>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-12/igt@kms_writeback@writeback-pixel-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-3/igt@perf@gen8-unprivileged-single-ctx-counters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436" moz-do-not-send="true">i915#2436</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@perf@global-sseu-config-invalid:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-1/igt@perf@global-sseu-config-invalid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387" moz-do-not-send="true">i915#7387</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@perf@mi-rpc:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@perf@mi-rpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434" moz-do-not-send="true">i915#2434</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@perf_pmu@busy-idle-check-all@bcs0:</p>
            <ul>
              <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@bcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all@bcs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349" moz-do-not-send="true">i915#4349</a>) +5 other tests
                fail</li>
            </ul>
          </li>
          <li>
            <p>igt@perf_pmu@rc6@other-idle-gt0:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@perf_pmu@rc6@other-idle-gt0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516" moz-do-not-send="true">i915#8516</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@prime_vgem@basic-fence-flip:</p>
            <ul>
              <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-12/igt@prime_vgem@basic-fence-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@prime_vgem@basic-fence-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@prime_vgem@basic-fence-read:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@prime_vgem@basic-fence-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291" moz-do-not-send="true">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@prime_vgem@basic-read:</p>
            <ul>
              <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-3/igt@prime_vgem@basic-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291" moz-do-not-send="true">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@prime_vgem@fence-flip-hang:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@prime_vgem@fence-flip-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@prime_vgem@fence-read-hang:</p>
            <ul>
              <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-9/igt@prime_vgem@fence-read-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@sriov_basic@bind-unbind-vf:</p>
            <ul>
              <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@sriov_basic@bind-unbind-vf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>) +1 other test
                skip</li>
            </ul>
          </li>
        </ul>
        <h4>Possible fixes</h4>
        <ul>
          <li>
            <p>igt@gem_ccs@suspend-resume:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-6/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">PASS</a></li>
            </ul>
          </li>
          <li>
            <p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-6/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392" moz-do-not-send="true">i915#12392</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html" moz-do-not-send="true">PASS</a></li>
            </ul>
          </li>
          <li>
            <p>igt@gem_eio@kms:</p>
            <ul>
              <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-tglu-5/igt@gem_eio@kms.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363" moz-do-not-send="true">i915#13363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-7/igt@gem_eio@kms.html" moz-do-not-send="true">PASS</a></li>
            </ul>
          </li>
          <li>
            <p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
            <ul>
              <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493" moz-do-not-send="true">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_mmap_offset@partial-remap@smem0:</p>
            <ul>
              <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-4/igt@gem_mmap_offset@partial-remap@smem0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@gem_mmap_offset@partial-remap@smem0.html" moz-do-not-send="true">PASS</a> +9 other tests pass</li>
            </ul>
          </li>
          <li>
            <p>igt@gem_softpin@noreloc-s3:</p>
            <ul>
              <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-3/igt@gem_softpin@noreloc-s3.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809" moz-do-not-send="true">i915#13809</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-8/igt@gem_softpin@noreloc-s3.html" moz-do-not-send="true">PASS</a></li>
            </ul>
          </li>
          <li>
            <p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-2/igt@i915_pm_freq_api@freq-suspend@gt0.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12455" moz-do-not-send="true">i915#12455</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820" moz-do-not-send="true">i915#13820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_color@ctm-red-to-blue:</p>
            <ul>
              <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-16/igt@kms_color@ctm-red-to-blue.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-15/igt@kms_color@ctm-red-to-blue.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_crc@cursor-random-256x85:</p>
            <ul>
              <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-tglu-5/igt@kms_cursor_crc@cursor-random-256x85.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-tglu-10/igt@kms_cursor_crc@cursor-random-256x85.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
            <ul>
              <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14345" moz-do-not-send="true">i915#14345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html" moz-do-not-send="true">PASS</a></li>
            </ul>
          </li>
          <li>
            <p>igt@kms_dp_link_training@non-uhbr-sst:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749" moz-do-not-send="true">i915#13749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_dp_link_training@non-uhbr-sst.html" moz-do-not-send="true">PASS</a></li>
            </ul>
          </li>
          <li>
            <p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:</p>
            <ul>
              <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734" moz-do-not-send="true">i915#13734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
            <ul>
              <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">PASS</a></li>
            </ul>
          </li>
          <li>
            <p>igt@kms_hdr@bpc-switch-dpms:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-7/igt@kms_hdr@bpc-switch-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-11/igt@kms_hdr@bpc-switch-dpms.html" moz-do-not-send="true">PASS</a></li>
            </ul>
          </li>
          <li>
            <p>igt@kms_pm_rpm@modeset-lpsp:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send="true">PASS</a></li>
            </ul>
          </li>
          <li>
            <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
            <ul>
              <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a></li>
            </ul>
          </li>
          <li>
            <p>igt@perf_pmu@module-unload:</p>
            <ul>
              <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-mtlp-4/igt@perf_pmu@module-unload.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520" moz-do-not-send="true">i915#13520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-mtlp-7/igt@perf_pmu@module-unload.html" moz-do-not-send="true">PASS</a></li>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-6/igt@perf_pmu@module-unload.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520" moz-do-not-send="true">i915#13520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@perf_pmu@module-unload.html" moz-do-not-send="true">PASS</a></li>
            </ul>
          </li>
        </ul>
        <h4>Warnings</h4>
        <ul>
          <li>
            <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p>
            <ul>
              <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098" moz-do-not-send="true">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
            <ul>
              <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-13/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_content_protection@legacy:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-10/igt@kms_content_protection@legacy.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173" moz-do-not-send="true">i915#7173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-2/igt@kms_content_protection@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
            <ul>
              <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346" moz-do-not-send="true">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433" moz-do-not-send="true">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
            <ul>
              <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433" moz-do-not-send="true">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +1 other test
                skip</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_hdr@brightness-with-hdr:</p>
            <ul>
              <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713" moz-do-not-send="true">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331" moz-do-not-send="true">i915#13331</a>)</li>
              <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-18/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713" moz-do-not-send="true">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187" moz-do-not-send="true">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713" moz-do-not-send="true">i915#12713</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_pm_backlight@fade-with-suspend:</p>
            <ul>
              <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-12/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-17/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
            </ul>
          </li>
          <li>
            <p>igt@kms_psr@pr-sprite-plane-move:</p>
            <ul>
              <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16611/shard-dg1-16/igt@kms_psr@pr-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13206/shard-dg1-18/igt@kms_psr@pr-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>)</li>
            </ul>
          </li>
        </ul>
        <h2>Build changes</h2>
        <ul>
          <li>CI: CI-20190529 -&gt; None</li>
          <li>IGT: IGT_8383 -&gt; IGTPW_13206</li>
          <li>Piglit: piglit_4509 -&gt; None</li>
        </ul>
        <p>CI-20190529: 20190529<br>
          CI_DRM_16611: bf0749a9930efe943554c3f73454d03c43779d15 @
          git://anongit.freedesktop.org/gfx-ci/linux<br>
          IGTPW_13206: 0b49229cc7ef6d577ae4afb48a5149a197a8dd43 @ <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git" moz-do-not-send="true">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
          IGT_8383: 8383<br>
          piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
          git://anongit.freedesktop.org/piglit</p>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------VGppMzTCvOi7Khca2De1cIRO--
